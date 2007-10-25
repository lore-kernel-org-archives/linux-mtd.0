Received: from nf-out-0910.google.com ([64.233.182.185])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Il9aZ-00014v-NF
	for linux-mtd@lists.infradead.org; Thu, 25 Oct 2007 21:46:01 +0100
Received: by nf-out-0910.google.com with SMTP id h3so581043nfh
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Oct 2007 13:45:47 -0700 (PDT)
Message-ID: <48336e30710251345q153dc69fme74a93031797f145@mail.gmail.com>
Date: Thu, 25 Oct 2007 13:45:46 -0700
From: "Samuel Chun" <bearchun@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Bad Block Skipping Read for read-only filesystem on flash
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Reply-To: bearchun@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am having trouble with handling BAD BLOCKS while loading read only
filesystem that is on NAND flash. I was wondering if you can help me
or point me to the right direction. Any help would greatly be
appreciated.

Problem:

Right after Kernel boots it tries to mount a read only CRAMFS
filesystem from a flash partition (e.g. "/dev/mtdblock3"). But NAND
driver/MTD driver does not handle BAD BLOCKS, so if there are any bad
blocks in that partition, mounted cramfs filesystem will not work right.

When we program the flash we will SKIP BAD BLOCKS, so if we can do the
same when we read from flash it will solve our problem.

We had the same problem loading the Kernel from uboot. To fix this, we
had to use the command "read.i" from uboot. This command will skip BAD
BLOCKS while reading.

How can we fix this?

Our system:
  U-Boot 1.1.6
  Linux version 2.6.22.1
  CPU: ARM920T [41129200] revision 0 (ARMv4T), cr=c0007177
  Machine: SMDK2443
  CPU S3C2443 (id 0x32443001)
  S3C24XX NAND Driver, (c) 2004 Simtec Electronics
  s3c2412-nand s3c2410-nand: Tacls=8, 59ns Twrph0=8 59ns, Twrph1=8 59ns
  s3c2412-nand s3c2410-nand: System booted from NAND
  NAND device: Manufacturer ID: 0x20, Chip ID: 0x76 (ST Micro NAND
64MiB 3,3V 8-bit)
  ... Let me know if you need more info about our system ...



Thank you.... Sam.
