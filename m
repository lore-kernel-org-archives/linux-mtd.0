Received: from mail14.syd.optusnet.com.au ([211.29.132.195])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K170K-0004yl-ND
	for linux-mtd@lists.infradead.org; Tue, 27 May 2008 21:46:49 +0000
Subject: Re: Help needed with MTD on AT91SAM9263-EK please.
From: James <jamessteward@optusnet.com.au>
To: Richard Genoud <richard.genoud@gmail.com>
In-Reply-To: <80b317760805270042w39c409d4j230c1a2967bf0242@mail.gmail.com>
References: <1211437223.6129.82.camel@Ubuntu-Desktop>
	<80b317760805222326j57e6bc11sfe0beef9ab68267b@mail.gmail.com>
	<1211524684.6203.13.camel@torchwood>
	<80b317760805222352v3701dcc5p7aa0108fb72b2192@mail.gmail.com>
	<1211526311.6203.27.camel@torchwood>
	<80b317760805230027n7cbf6ccbpc8289b4b3ad80714@mail.gmail.com>
	<1211755845.6724.29.camel@Ubuntu-Desktop>
	<80b317760805270042w39c409d4j230c1a2967bf0242@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 28 May 2008 07:46:19 +1000
Message-Id: <1211924779.6140.9.camel@Ubuntu-Desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Alessandro Rubini <rubini-list@gnudd.com>,
	michael <trimarchi@gandalf.sssup.it>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Tue, 2008-05-27 at 09:42 +0200, Richard Genoud wrote:
> well, I would say hardware failure, as far as we all used this board
> without any problem.

It's good to know the problem is (hopefully) isolated.  After the test
below, I feel it might be more than just a hardware failure though.

> Maybe a last test to be sure :
> flash_eraseall /dev/mtd0
> dd if=/dev/zero bs=2K count=1 of=/dev/mtd0
> nanddump -p -l2048 /dev/mtd0
> 
> (try to write a page and read it back).
> 
> if you can post this dump, I'm curious...

root@at91sam9263ek:~/mtd-tools$ ./flash_eraseall /dev/mtd0
Erasing 128 Kibyte @ 3ee0000 -- 99 % complete.
root@at91sam9263ek:~/mtd-tools$ dd if=/dev/zero bs=2k count=1
of=/dev/mtd0
1+0 records in
1+0 records out
root@at91sam9263ek:~/mtd-tools$ ./nanddump -p -l2048 /dev/mtd0
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00000800...
0x00000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
<skip all zeros>
0x000007e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x000007f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff

Hmm.  So I tried a block that previously had problems with mount.

root@at91sam9263ek:~/mtd-tools$ dd if=/dev/zero bs=2k count=1 seek=5120
of=/dev/mtd0    
1+0 records in
1+0 records out
root@at91sam9263ek:~/mtd-tools$ ./nanddump -p -l2048
-s0xa00000 /dev/mtd0
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00a00000 and ending at 0x00a00800...
0x00a00000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00a00010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00a00020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
<snip all zeros>
0x00a007e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00a007f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff

And an unwritten to page...

root@at91sam9263ek:~/mtd-tools$ ./nanddump -p -l2048
-s0xdc0000 /dev/mtd0
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00dc0000 and ending at 0x00dc0800...
0x00dc0000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00dc0010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x00dc0020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
<snip all 0xff>

So, a page at a time seems ok?

I wonder, what markings are on your CPU and NAND flash?  I have;
AT91SAM9263 CU-ES 0747 8 QH59R.07
0742 29F2G08AAC WP C LJK6

I assume some of this will be a batch code, but I wonder if there's been
a die shrink that's caused some marginal timing issue?

Regards,
James.
