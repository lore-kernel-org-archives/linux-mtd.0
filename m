Received: from law14-oe16.law14.hotmail.com ([64.4.20.120] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19N41A-0007av-WD
	for <linux-mtd@lists.infradead.org>; Tue, 03 Jun 2003 06:07:29 +0100
From: "Vikram Mehta" <vm6580@hotmail.com>
To: <uclinux-dev@uclinux.org>
Date: Tue, 3 Jun 2003 10:36:29 -0700
MIME-Version: 1.0
Message-ID: <Law14-OE16a0SNv4hUr0002f2eb@hotmail.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: mtd <linux-mtd@lists.infradead.org>
Subject: AMD29DL323GB flash chip support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi ,

I was going through the code in files in drivers/mtd directory

In jedec_probe.c
in amd_flash_info jedec_table structure, I did not find the chip my board
has i.e. AMD29DL323GB.
So does that mean MTD will not work on my chip. I am asking this becuase
kernel built with MTD and JFFS2 support does not boot.

the funtion  mtd_chip_driver:: probe( map) called in do_map_probe() does not
return. I cannot find  it code . And since I am on CYGWIN i am having
difficulty in using Ksymoops etc.

Help me here
VIkram Mehta
