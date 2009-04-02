Received: from fg-out-1718.google.com ([72.14.220.156])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LpNRa-0001FH-SU
	for linux-mtd@lists.infradead.org; Thu, 02 Apr 2009 13:59:05 +0000
Received: by fg-out-1718.google.com with SMTP id e21so357112fga.3
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Apr 2009 06:58:56 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 2 Apr 2009 15:58:56 +0200
Message-ID: <72795ccb0904020658s35f8fd6aw97798be53ed7d559@mail.gmail.com>
Subject: Ubiattach problem after flashing an image
From: simon polette <spolette@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm using the last mtd utils version provided by the git mtd
repository. I want to flash an ubi image built with mkfs.ubfis and
ubinize into a Nand flash. Once the nand is flashed, when I try to
attach ubi, I get this error :

# ubiattach  /dev/ubi_ctrl -m 2
[  968.980000] UBI: attaching mtd2 to ubi1
[  969.000000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[  969.030000] UBI: logical eraseblock size:    129024 bytes
[  969.050000] UBI: smallest flash I/O unit:    2048
[  969.060000] UBI: sub-page size:              512
[  969.080000] UBI: VID header offset:          512 (aligned 512)
[  969.100000] UBI: data offset:                2048
[  969.330000] UBI error: vtbl_check: volume table check failed:
record 1, error 9
ubiattach: error!: cannot attach mtd2
           error 22 (Invalid argument)

The ubi image I use is ok because I already successfully flashed it
and used it with this hardware. This error appeared since I upgraded
both mtd utils and Linux kernel, but even if come back to the previous
versions I was used to work with, this error persist. I think I'm
doing something wrong, but don't know where at all.
Any idea is welcome.
Best regards,

Simon Polette
