Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OWTMx-0004wa-1n
	for linux-mtd@lists.infradead.org; Wed, 07 Jul 2010 12:04:52 +0000
Received: from ONYX.xi-lite.lan (unknown [193.34.35.243])
	by co202.xi-lite.net (Postfix) with ESMTPS id 98F212602C9
	for <linux-mtd@lists.infradead.org>;
	Wed,  7 Jul 2010 14:04:46 +0200 (CEST)
Message-ID: <4C346D5B.2000609@parrot.com>
Date: Wed, 7 Jul 2010 14:04:43 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: ubifs : corruption after power cut test
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

we are testing robustness of ubifs on our boards. We are using a 2.6.27
kernel with ubi/ubifs backport from 2.6.27 branch and some of 2.6.28
(since 2.6.27 it is not supported anymore) [1]
We use SLC nand (ST and micron one).

We have a test program that create/delete/modify files randomly (with a
checksum to check files integrity).

During the test we do random power cut (1-10 min after booting).

After some reboot we got an uncorrectable ecc error, and a failure in
mounting ubifs [2].

In one of our test the uncorrectable ecc error, become correctable after 
some reboots [3].

We run mtd tests without error. Torture test run more than 100000 cycles 
(~60 hours).

If we enable ubi and ubifs selftest we didn't manage to reproduce the 
corruption.

We have a trace of the failure with ubifs debug [4], it seems there are 
some data after the corrupted zone (I can post the full log it if needed).


Do you have any idea to investigate this ?

Matthieu


PS : On another OS using the same flash (with a proprietary fs), we saw 
that interrupted erase can do weird stuff. The eraseblock with 
interrupted erase can become unstable. For example it acts like erased 
block, can be written with data (and be can read again) but after some 
times uncorrectable error happens.
 From what I understood, ubi should be safe because in case of 
interrupted erase, we will add it to erase or corr list, erase the block 
again before writing EC.

BTW what's the difference between erase and corr list in scan ? We seem 
to do the same thing for these lists (schedule_erase).


[1]
UBIFS: mark VFS SB RO too
UBI: init even if MTD device cannot be attached, if built into kernel
UBI: remove reboot notifier
random: Remove unused inode variable
random: drop weird m_time/a_time manipulation
UBI: add write checking
UBI: simplify debugging return codes
UBI: fix attaching error path
UBI: support attaching by MTD character device name
UBI: mark few variables as __initdata
UBI: fix volume creation input checking
UBI: fix memory leak in update path
UBI: add more checks to chdev open
UBI: initialise update marker
UBIFS: support mounting of UBI volume character devices
UBI: Add ubi_open_volume_path

[2]
UBIFS: recovery needed
ba315 : BA315_STATUS_DEC_FAIL
read error -74 retry 0 PEB 133:10240
UBIFS error (pid 284): ubifs_check_node: bad CRC: calculated 0x2a87ef17,
read 0x395cbef4
UBIFS error (pid 284): ubifs_check_node: bad node at LEB 198:6144
UBIFS error (pid 284): ubifs_scanned_corruption: corruption at LEB 198:6144


[3]
ba : BA315_STATUS_DEC_FAIL
read error -74 retry 0
UBIFS error (pid 274): ubifs_check_node: bad CRC: calculated 0x2b0f6371, 
read 0x7f94ebe7
UBIFS error (pid 274): ubifs_check_node: bad node at LEB 85:0
UBIFS error (pid 274): ubifs_scanned_corruption: corruption at LEB 85:0

[...]
2 reboot with same error
[...]
ba : BA315_STATUS_DEC_ERR
detected ecc error num=1, ret=0
error : -74
fixable bit-flip detected at PEB 244
ba : BA315_STATUS_DEC_ERR
detected ecc error num=1, ret=0
error : -74
fixable bit-flip detected at PEB 244
UBI: scrubbed PEB 244 (LEB 0:85), data moved to PEB 181
UBIFS: recovery completed

[4]
read error -74 retry 0 PEB 204:4096
UBIFS DBG (pid 278): ubifs_recover_leb: look at LEB 219:0 (126976 bytes 
left)
UBIFS DBG (pid 278): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 278): no_more_nodes: unexpected data at 219:6144
UBIFS DBG (pid 278): ubifs_recover_leb: look at LEB 219:0 (126976 bytes 
left)
UBIFS DBG (pid 278): ubifs_scan_a_node: scanning data node
UBIFS error (pid 278): ubifs_check_node: bad CRC: calculated 0xe468570a, 
read 0x846858e8
UBIFS error (pid 278): ubifs_check_node: bad node at LEB 219:0
