Received: from wf-out-1314.google.com ([209.85.200.172])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KOPvJ-0001zX-AM
	for linux-mtd@lists.infradead.org; Thu, 31 Jul 2008 04:37:57 +0000
Received: by wf-out-1314.google.com with SMTP id 28so315614wfc.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 30 Jul 2008 21:37:56 -0700 (PDT)
Message-ID: <8bd0f97a0807302137h5960d8a0ue0ce5ff745f3a579@mail.gmail.com>
Date: Thu, 31 Jul 2008 00:37:56 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: mtd maps and read lengths / boundaries
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

i'm writing a mapping driver at the moment and i'm wondering if i can
make assumptions on the read length and address boundaries.  but
first, a little background:

i have a CFI-compliant flash that needs some GPIO wiggling before it
can be accessed physically.  so my mapping driver is simply: wiggle
the GPIOs before passing things off to physmap/cfi to handle all the
ugly flash details.  the output from probing:
gpio-addr-flash: probing 16-bit flash bus
gpio-addr-flash: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
erase region 0: offset=0x0,size=0x20000,blocks=32
cmdlinepart partition parsing not available
RedBoot partition parsing not available
gpio-addr-flash: Using board partition definition
Creating 3 MTD partitions on "gpio-addr-flash":
0x00000000-0x00040000 : "bootloader(nor)"
0x00040000-0x00120000 : "linux kernel(nor)"
0x00120000-0x00400000 : "file system(nor)"

in my tests, the higher mtd levels (cfi_cmdset_0001.c) break things up
into chunks such that the start address is aligned according to the
length.  for example, if just using `cat` to read a device, the
mapping driver sees:
offset: 0x201e00 len: 0x200
offset: 0x202000 len: 0x200
offset: 0x202200 len: 0x200
and it does this even if i use `dd` and give it weird offsets/lengths/etc...

so if i can make this assumption that the read length given to the mtd
mapping driver will not be large (over 1 megabyte), or cross said
boundary (the offset and length will not cross the 1 megabyte
boundary), it will simplify my driver considerably.  otherwise my
mapping driver will need to further break up the incoming request and
process it a piece at a time ...
-mike
