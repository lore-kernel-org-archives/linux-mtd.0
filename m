Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aPEgf-0005ar-H2
 for linux-mtd@lists.infradead.org; Fri, 29 Jan 2016 19:26:32 +0000
Received: by mail-pa0-x243.google.com with SMTP id gi1so4003171pac.2
 for <linux-mtd@lists.infradead.org>; Fri, 29 Jan 2016 11:26:09 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 Marek Vasut <marex@denx.de>, djkurtz@chromium.org
Subject: [PATCH v2 0/8] mtd: spi-nor: locking fixes and updates
Date: Fri, 29 Jan 2016 11:25:29 -0800
Message-Id: <1454095537-130536-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

These are an assortment of fixes and updates to the SPI NOR lock/unlock
feature. The biggest new features are:
(a) Status Register protection; I don't see why this shouldn't be enabled by
    default. See patch 4's description.
(b) Bottom-block protection support (via TB status bit)
(c) Lock/unlock support for a few Winbond flash

Since v1:
 * patches 3 and 7 are somewhat rewritten versions of patches 2 and 7 in v1
 * fix up several corner cases, seen in some local tests (poor, slow shell
   script appended)
 * remove SR protection (SR_SRWD) when unlocking the entire flash

Regards,
Brian

Brian Norris (8):
  mtd: spi-nor: wait for SR_WIP to clear on initial unlock
  mtd: spi-nor: silently drop lock/unlock for already locked/unlocked
    region
  mtd: spi-nor: make lock/unlock bounds checks more obvious and robust
  mtd: spi-nor: disallow further writes to SR if WP# is low
  mtd: spi-nor: use BIT() for flash_info flags
  mtd: spi-nor: add SPI_NOR_HAS_LOCK flag
  mtd: spi-nor: add TB (Top/Bottom) protect support
  mtd: spi-nor: support lock/unlock for a few Winbond chips

 drivers/mtd/spi-nor/spi-nor.c | 195 ++++++++++++++++++++++++++++++++++--------
 include/linux/mtd/spi-nor.h   |   2 +
 2 files changed, 159 insertions(+), 38 deletions(-)


Appending badly-written shell test script. Requires latest mtd-utils
(flash_lock / flash_unlock).

------8<------
#!/bin/sh
#
# License: GPLv2
# Copyright (c) 2016 Google, Inc.

MTD=/dev/mtd0

UNLOCK="flash_unlock ${MTD}"
LOCK="flash_lock ${MTD}"
ISLOCKED="flash_lock --islocked ${MTD}"

MTD_SYSFS="/sys/class/mtd"

MTDX=$(echo $MTD | grep -o '[0-9]*$')
echo "MTD #: $MTDX"

MTDX_SYSFS="${MTD_SYSFS}/mtd${MTDX}"

SIZE=$(cat ${MTDX_SYSFS}/size)
EB_SIZE=$(cat ${MTDX_SYSFS}/erasesize)
NUM_EBS=$((SIZE / EB_SIZE))

log_msg() {
	echo "${MTD}: $@"
}

err_msg() {
	log_msg $@ 1>&2
}

dbg_msg() {
	# both go to stderr for now
	[ "$DEBUG" != "" ] && err_msg $@
}

exit_err_msg() {
	err_msg $@
	exit 1
}

# echo 1 for locked, 0 for unlocked; return non-zero on error
is_locked() {
	local out="$(${ISLOCKED} $@ | grep 'Return code:')"
	[ $? -ne 0 ] && return 1
	out=$(echo "$out" | cut -d' ' -f3)
	dbg_msg "Range [$@] lock status: $out"
	echo $out
}

# check that *each* eraseblock has a particular status; return non-zero on
# error, zero for successful match
is_locked_ebs() {
	local addr=${1:-0}
	local num_ebs=${2:-${NUM_EBS}}
	local lock_status=${3:-1}
	local last_addr=$((addr + (num_ebs - 1) * EB_SIZE))
	local ret=0

	for ofs in $(seq $addr $EB_SIZE $last_addr); do
		ret=$(is_locked $ofs 1)
		[ $? -ne 0 ] && return 1
		[ "$ret" -ne "$lock_status" ] && err_msg "block $ofs has unexpected status $ret" && return 1
	done
	return 0
}

check_locked() {
	local addr=$1
	local num_ebs=$2
	local lock_status=$3

	local ret=$(is_locked $addr $num_ebs) || exit 1
	is_locked_ebs $addr $num_ebs $lock_status || exit 1
	if [ "$ret" -ne "$lock_status" ]; then
		exit_err_msg "lock status is incorrect"
	else
		log_msg "verified lock status $@"
	fi
}

if ! ${UNLOCK} ; then
	err_msg "error unlocking; MEMUNLOCK not supported?"
	exit 1
fi

main() {
	log_msg "unlocked device"
	check_locked 0 $NUM_EBS 0

	log_msg "locking upper half"
	${LOCK} $((SIZE / 2)) $((NUM_EBS / 2)) || exit 1
	check_locked $((SIZE / 2)) $((NUM_EBS / 2)) 1
	check_locked 0 $((NUM_EBS / 2)) 0

	log_msg "relocking 4th quadrant"
	${LOCK} $((SIZE * 3 / 4)) $((NUM_EBS / 4)) || exit 1
	check_locked $((SIZE / 2)) $((NUM_EBS / 2)) 1
	check_locked 0 $((NUM_EBS / 2)) 0

	log_msg "relocking ranges"
	## Picked some arbitrary increments, since an exhaustive loop takes too
	## long
	for i in $(seq $((SIZE / 2)) $((EB_SIZE * 5)) $((SIZE - EB_SIZE))); do
		for j in $(seq 0 7 $(((SIZE - i) / EB_SIZE - 1))); do
			log_msg "Range: $i $j"
			${LOCK} $i $j || exit 1
		done
	done
	check_locked $((SIZE / 2)) $((NUM_EBS / 2)) 1
	check_locked 0 $((NUM_EBS / 2)) 0

	log_msg "unlocking 3rd quadrant"
	${UNLOCK} $((SIZE / 2)) $((NUM_EBS / 4)) || exit 1
	check_locked $((SIZE * 3 / 4)) $((NUM_EBS / 4)) 1
	check_locked 0 $((NUM_EBS * 3 / 4)) 0

	log_msg "unlocking 1st quadrant (again)"
	${UNLOCK} 0 $((NUM_EBS / 4)) || exit 1
	check_locked $((SIZE * 3 / 4)) $((NUM_EBS / 4)) 1
	check_locked 0 $((NUM_EBS * 3 / 4)) 0

	log_msg "unlocking 4th quadrant"
	${UNLOCK} $((SIZE * 3 / 4)) $((NUM_EBS / 4)) || exit 1
	check_locked 0 $NUM_EBS 0

	log_msg "locking 1st half"
	if ! ${LOCK} 0 $((NUM_EBS / 2)) ; then
		err_msg "does not support bottom-block protection? skipping tests"
		return 0
	fi
	check_locked 0 $((NUM_EBS / 2)) 1
	check_locked $((SIZE / 2)) $((NUM_EBS / 2)) 0

	${UNLOCK} 0 $((NUM_EBS / 4)) && \
		exit_err_msg "error: was able to unlock 1st quadrant"
	log_msg "saw error, expected"
	check_locked 0 $((NUM_EBS / 2)) 1
	check_locked $((SIZE / 2)) $((NUM_EBS / 2)) 0

	log_msg "unlocking 2nd quadrant"
	${UNLOCK} $((SIZE / 4)) $((NUM_EBS / 4)) || exit 1
	check_locked 0 $((NUM_EBS / 4)) 1
	check_locked $((SIZE / 4)) $((NUM_EBS * 3 / 4)) 0

	log_msg "unlocking top 3 quadrants (again)"
	${UNLOCK} $((SIZE / 4)) $((NUM_EBS * 3 / 4)) || exit 1
	check_locked 0 $((NUM_EBS / 4)) 1
	check_locked $((SIZE / 4)) $((NUM_EBS * 3 / 4)) 0
}

main
log_msg "test complete"
