Received: from mail15.syd.optusnet.com.au ([211.29.132.196])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K1Uco-0006ai-Iq
	for linux-mtd@lists.infradead.org; Wed, 28 May 2008 23:00:07 +0000
Subject: Re: Help needed with MTD on AT91SAM9263-EK please.
From: James <jamessteward@optusnet.com.au>
To: Richard Genoud <richard.genoud@gmail.com>
In-Reply-To: <1212015172.6110.27.camel@Ubuntu-Desktop>
References: <1211437223.6129.82.camel@Ubuntu-Desktop>
	<80b317760805222326j57e6bc11sfe0beef9ab68267b@mail.gmail.com>
	<1211524684.6203.13.camel@torchwood>
	<80b317760805222352v3701dcc5p7aa0108fb72b2192@mail.gmail.com>
	<1211526311.6203.27.camel@torchwood>
	<80b317760805230027n7cbf6ccbpc8289b4b3ad80714@mail.gmail.com>
	<1211755845.6724.29.camel@Ubuntu-Desktop>
	<80b317760805270042w39c409d4j230c1a2967bf0242@mail.gmail.com>
	<1211924779.6140.9.camel@Ubuntu-Desktop>
	<80b317760805272324p590e96fr2453176c6f035138@mail.gmail.com>
	<1212015172.6110.27.camel@Ubuntu-Desktop>
Content-Type: text/plain
Date: Thu, 29 May 2008 08:59:37 +1000
Message-Id: <1212015577.6110.31.camel@Ubuntu-Desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alessandro Rubini <rubini-list@gnudd.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	michael <trimarchi@gandalf.sssup.it>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-05-29 at 08:52 +1000, James wrote:
> On Wed, 2008-05-28 at 08:24 +0200, Richard Genoud wrote:
> > > So, a page at a time seems ok?
> > yes, all those writings are ok, maybe you can try with
> > if=/dev/urandom, just to see if the OOB region is updated
> 
> root@at91sam9263ek:~/mtd-tools$ ./flash_eraseall /dev/mtd0
> Erasing 128 Kibyte @ 3ee0000 -- 99 % complete.
> root@at91sam9263ek:~/mtd-tools$ dd if=/dev/urandom bs=2k count=1
> of=/dev/mtd0
> 1+0 records in
> 1+0 records out
> root@at91sam9263ek:~/mtd-tools$ nanddump -p -l2048 /dev/mtd0
> ECC failed: 0
> ECC corrected: 0
> Number of bad blocks: 0
> Number of bbt blocks: 0
> Block size 131072, page size 2048, OOB size 64
> Dumping data starting at 0x00000000 and ending at 0x00000800...
> 0x00000000: b6 3c bb 90 16 c3 16 63 ab 8a b4 9f f3 bb 22 49
> 0x00000010: 42 9d 48 09 4c 35 f1 51 ec 3d e6 cd 3c f0 c7 87
> <snip>
> 0x000007e0: 9f e4 a6 a7 47 35 5b be 12 3e 36 f6 f5 ef e5 5a
> 0x000007f0: 5b 3e bd 51 27 37 18 cc ab d8 e3 f7 36 09 c2 31
>   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>   OOB Data: ff ff ff ff ff ff ff ff 0c 0f 0f ff cf 0f ff 30
>   OOB Data: 0f 95 aa 97 c0 c0 ff 59 69 ab 3f 0c cf 65 9a a7
> 
> So some OOB data is written.
> 
> I don't know what to expect really.  I have soft ECC enabled, and after
> reading a bit of the kernel mtdnand documentation, this appears normal.
> 
> So, do you think this is a hardware timing issue?  Maybe back to back
> writes/reads?

Just out of interest, I did the same over 10 pages.
$ ./flash_eraseall /dev/mtd0
$ dd if=/dev/urandom bs=2k count=10 of=/dev/mtd0
$ nanddump -p -l20480 /dev/mtd0 1> /dev/null
ECC failed: 3
ECC corrected: 0
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00005000...
ECC: 1 uncorrectable bitflip(s) at offset 0x00003800

Foobar!

Regards,
James.
