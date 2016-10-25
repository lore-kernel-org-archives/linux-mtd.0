Received: from mail.lysator.liu.se ([2001:6b0:17:f0a0::3])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bz7aJ-0001Kn-5r
 for linux-mtd@lists.infradead.org; Tue, 25 Oct 2016 19:40:33 +0000
From: Peter Rosin <peda@axentia.se>
Subject: Regression caused by commit c83ed4c9dbb3 "ubifs: Abort readdir on
 error"
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-ID: <ce65141e-87d2-344e-82d2-a1c4ed0bdbf1@lysator.liu.se>
Date: Tue, 25 Oct 2016 21:39:55 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Early on in my boot procedure I create an overlay and shuffle
things around a bit so that the original rootfs stays readonly
at the bottom of an overlayed readwrite fs. This way I can just
toss out the overlayed fs and have a clean and reliable way to
do a "factory-reset". Both the read-only root and and the overlay
are ubifs on nand.

Bisection points to commit c83ed4c9dbb3 "ubifs: Abort readdir
on error". Reverting that commit on top of v4.9-rc2 fixes things.

My "shuffle script" is as follows (with an added comment
indicating the first point of failure) and runs as the first
script by init.

If I add a line
	ls -l /mnt || echo "ls -l /mnt failed"
where that comment is right before the failure, I get no failure
indication even with the broken commit, so directory traversal
seems ok.

Cheers,
Peter

#! /bin/bash

test "x$1" == xstart || exit 0

mkdir /tmp/log

/bin/mount -o remount,rw /dev

/bin/mount | /bin/grep -q "^overlay on / type overlay" && exit 0

if test -e /etc/factory-reset; then
  /usr/sbin/ubiformat /dev/mtd7
  rm /etc/factory-reset
fi

/usr/sbin/ubiattach /dev/ubi_ctrl -m 7
/usr/sbin/ubimkvol /dev/ubi1 -N ovl -m

/bin/mkdir -p /mnt/ovl
/bin/mkdir -p /mnt/roroot
/bin/mkdir -p /mnt/merge
/bin/mount -t ubifs /dev/ubi1_0 /mnt/ovl

/bin/mkdir -p /mnt/ovl/ovl
/bin/mkdir -p /mnt/ovl/work
# with c83ed4c9dbb3, the following mount fails with
# mount: mounting overlay on /mnt/merge failed: No such file or directory
/bin/mount -t overlay -o lowerdir=/,upperdir=/mnt/ovl/ovl,workdir=/mnt/ovl/work overlay /mnt/merge

cd /mnt/merge

/sbin/pivot_root . /mnt/merge/mnt/roroot

/bin/mount --rbind /mnt/roroot/proc /proc
/bin/mount --rbind /mnt/roroot/sys /sys
/bin/mount --rbind /mnt/roroot/dev /dev
/bin/mount --rbind /mnt/roroot/tmp /tmp
/bin/mount --rbind /mnt/roroot/run /run
/bin/mount --rbind /mnt/roroot/mnt/ovl /mnt/ovl

kill $PPID
kill -QUIT 1
