Received: from wsgw1.atc.army.mil ([134.194.13.55])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CeaIx-0003Hx-Kc
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2004 09:39:05 -0500
Received: from atc-smtp1.atc.army.mil ([134.194.25.160])
	by wsgw1.atc.army.mil (SMSSMTP 4.0.0.59) with SMTP id
	M2004121509393808267
	for <linux-mtd@lists.infradead.org>; Wed, 15 Dec 2004 09:39:38 -0500
Message-ID: <EFF9A3506F74924AB5CC77BDC66E7935181390@atcml01.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Wed, 15 Dec 2004 09:38:55 -0500
MIME-Version: 1.0
Content-Type: text/plain
Subject: Big Problem with DOC 128Mbyte Help!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

  Ok here is my problem.  I am running linux-2.4.28 with a recent mtd patch.
I have a DiskONChip 2000 128Mbyte version 5.1.2 (must be real new).  The
chip seems to be working properly.  I can run fdisk, mkfs. And read/write to
it.  I can mount the chip (/dev/inftla1) and view all of my files and file
system.  I CAN NOT get a boot loader on it.  I am trying to get lilo-2.6.1
to allow me to make the DOC bootable.  I currently have a floppy drive with
the bootloader on it.  I have two choices, my hard drive and the DiskOnCHip.
When ever I try to boot from the DiskOnChip and starts to boot then fails
when it tries to run init.  The kernel bombs saying I need to specify an
init location.  I will reboot from the hard disk and mount the DIskOnChip
only to find each time that all the data is wiped out with only just a few
directories left.  I get read errors if I try to list what might be in them
and a df shows only 1% use, with all files on it it is at 54%.

  QUESTION:  What/why could this be happening.  Why would the boot loader be
trashing my DiskOnChip???????????

Thank you,
John
