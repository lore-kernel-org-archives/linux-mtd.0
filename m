Received: from 213-97-242-113.uc.nombres.ttd.es ([213.97.242.113] helo=rebirth.wojtyla.org)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16uanD-0004PP-00
	for <linux-mtd@lists.infradead.org>; Mon, 08 Apr 2002 16:10:52 +0100
Received: from devil.teleline.es (devil.iqc-services.local [192.168.197.3])
	by rebirth.wojtyla.org (8.11.6/8.8.7) with ESMTP id g38FqMh05442
	for <linux-mtd@lists.infradead.org>; Mon, 8 Apr 2002 17:52:22 +0200
Message-Id: <5.1.0.14.2.20020408170908.01f6f4a0@pop3.terra.es>
Date: Mon, 08 Apr 2002 17:09:52 +0200
To: linux-mtd@lists.infradead.org
From: Securez <securez@teleline.es>
Subject: About get MTD working.
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I can the kernel detects my FLASH as a mtd device:
...
Blkmem copyright 1998,1999 D. Jeff Dionne
Blkmem copyright 1998 Kenneth Albanowski
Blkmem 1 disk images:
0: 20DB6F0-214EAEF [VIRTUAL 20DB6F0-214EAEF] (RO)
Dragonix VZ mapping:size 200000 at 2200000
ZEUS:dragonix_map.map_priv_1=3D2200000
  Amd/Fujitsu Extended Query Table v1.0 at 0x0040
number of CFI chips: 1
Creating 1 MTD partitions on "Dragonix VZ Flash map":
0x00000000-0x00200000 : "Dragonix Bootloader"
mtd: Giving out device 0 to Dragonix Bootloader
mtd: Giving out device 1 to Dragonix VZ Flash map
ZEUS:right end of init_dragonix(I mean flash)
...

for test purposes i try to copy a ext2 fs to it and a get this:
 >cp ramfs.img /dev/mtd0
MTD_open
MTD_ioctl
Invalid ioctl 5401 (MEMGETINFO =3D 801e4d01)
MTD_write

and after some time the prompt will apears again.

What happend=BF?
Who i solve this.
