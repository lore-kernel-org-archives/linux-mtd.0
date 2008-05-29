Received: from yw-out-1718.google.com ([74.125.46.156])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K1bow-0004wO-59
	for linux-mtd@lists.infradead.org; Thu, 29 May 2008 06:41:06 +0000
Received: by yw-out-1718.google.com with SMTP id 5so2445813ywm.72
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 May 2008 23:41:05 -0700 (PDT)
Message-ID: <80b317760805282341n3ffbdc9bw2a919b22568ae618@mail.gmail.com>
Date: Thu, 29 May 2008 08:41:05 +0200
From: "Richard Genoud" <richard.genoud@gmail.com>
To: James <jamessteward@optusnet.com.au>
Subject: Re: Help needed with MTD on AT91SAM9263-EK please.
In-Reply-To: <1212015577.6110.31.camel@Ubuntu-Desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1211437223.6129.82.camel@Ubuntu-Desktop>
	<80b317760805222352v3701dcc5p7aa0108fb72b2192@mail.gmail.com>
	<1211526311.6203.27.camel@torchwood>
	<80b317760805230027n7cbf6ccbpc8289b4b3ad80714@mail.gmail.com>
	<1211755845.6724.29.camel@Ubuntu-Desktop>
	<80b317760805270042w39c409d4j230c1a2967bf0242@mail.gmail.com>
	<1211924779.6140.9.camel@Ubuntu-Desktop>
	<80b317760805272324p590e96fr2453176c6f035138@mail.gmail.com>
	<1212015172.6110.27.camel@Ubuntu-Desktop>
	<1212015577.6110.31.camel@Ubuntu-Desktop>
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

> Just out of interest, I did the same over 10 pages.
> $ ./flash_eraseall /dev/mtd0
> $ dd if=/dev/urandom bs=2k count=10 of=/dev/mtd0
> $ nanddump -p -l20480 /dev/mtd0 1> /dev/null
> ECC failed: 3
> ECC corrected: 0
> Number of bad blocks: 0
> Number of bbt blocks: 0
> Block size 131072, page size 2048, OOB size 64
> Dumping data starting at 0x00000000 and ending at 0x00005000...
> ECC: 1 uncorrectable bitflip(s) at offset 0x00003800
>
> Foobar!
>
> Regards,
> James.
ok, so this must be a hardware problem...

richard.
