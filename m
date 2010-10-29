Received: from mail-qw0-f49.google.com ([209.85.216.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PBoBM-0000lP-JG
	for linux-mtd@lists.infradead.org; Fri, 29 Oct 2010 12:35:45 +0000
Received: by qwh6 with SMTP id 6so2952296qwh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Oct 2010 05:35:43 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 29 Oct 2010 14:35:42 +0200
Message-ID: <AANLkTinNUrQKg_8EgwW5k7BZFiik5ish6-z+qK-=3qpU@mail.gmail.com>
Subject: Cross compiling mtd-utils for Android and pread errors
From: Ketil Froyn <ketil@froyn.name>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm trying to cross compile the mtd-utils package for Android, and I
was wondering if anyone has been able to do this before, because I'm
finding it difficult.

I have a working cross compiler toolchain (works with agcc, a wrapper
that takes care of all the necessary compiler flags) but I'm having
trouble getting this working to compile mtd-utils. I have been able to
compile single programs manually with the agcc wrapper, for example:

agcc -I include -o nanddump nanddump.c

but when I transfer this executable to the device and run it, I get:

/ # /sdcard/nanddump -a /dev/mtd/mtd0
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 56
Dumping data starting at 0x00000000 and ending at 0x0a5c0000...
pread: Unknown error: 0
/ #

or

/ # /sdcard/nanddump -f /sdcard/testdump /dev/mtd/mtd0
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 56
Dumping data starting at 0x00000000 and ending at 0x00040000...
pread: Not a typewriter
/ #

I'm grateful for any tips that can nudge me in the right direction.

Cheers, Ketil
