Received: from mail-lb0-x22e.google.com ([2a00:1450:4010:c04::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adbaq-0004m1-Jl
 for linux-mtd@lists.infradead.org; Wed, 09 Mar 2016 10:43:56 +0000
Received: by mail-lb0-x22e.google.com with SMTP id k15so59443166lbg.0
 for <linux-mtd@lists.infradead.org>; Wed, 09 Mar 2016 02:43:31 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 9 Mar 2016 11:43:29 +0100
Message-ID: <CAKmQUfY0tU1H_e0kYk5r4gREL55R8uHtgXrbEMuS4pSJ6cf94g@mail.gmail.com>
Subject: Is ubiattach alone somehow damaging a partition?
From: john smith <wempwer@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have the following MTD devices on my board:

/ $ cat /proc/mtd
dev:    size   erasesize  name
mtd0: 004e0000 00020000 "flash1.kernel"
mtd1: 07d80000 00020000 "flash1.rootfs0"
mtd2: 07d80000 00020000 "flash1.rootfs1"
mtd3: 10000000 00020000 "flash1"

I can boot Linux either from flash1.rootfs0 or flash1.rootfs1.  When I
boot from flash1.rootfs0 I can successfully attach flash1.rootfs1
(mtd2):

/ $ ubiattach /dev/ubi_ctrl -m 2
[  346.938374] UBI: attaching mtd2 to ubi0
[  347.633530] UBI: scanning is finished
[  347.654366] UBI: attached mtd2 (name "flash1.rootfs1", size 125 MiB) to ubi0
[  347.661459] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[  347.668263] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[  347.674978] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
[  347.681875] UBI: good PEBs: 1001, bad PEBs: 3, corrupted PEBs: 0
[  347.687893] UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
[  347.695042] UBI: max/mean erase counter: 3/1, WL threshold: 4096,
image sequence number: 3369714212
[  347.704102] UBI: available PEBs: 808, total reserved PEBs: 193,
PEBs reserved for bad PEB handling: 37
[  347.713553] UBI: background thread "ubi_bgt0d" started, PID 1265
UBI device number 0, total 1001 LEBs (127102976 bytes, 121.2 MiB),
available 808 LEBs (102596608 bytes, 97.8 MiB), LEB size 126976 bytes
(124.0 KiB)
/ $ echo $?
0

All is good so far - no errors.  However, after reboot I no longer can
boot from flash1.rootfs1. CFE says:

Could not load (null): Bad executable format
*** command status = -11

What might have happened to flash1.rootfs1?  The same happens when I
detach mtd2 after attaching it.
-- 
<wempwer@gmail.com>
