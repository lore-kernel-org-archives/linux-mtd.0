Received: from yw-out-1718.google.com ([74.125.46.154])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K1F58-0002bL-Mv
	for linux-mtd@lists.infradead.org; Wed, 28 May 2008 06:24:19 +0000
Received: by yw-out-1718.google.com with SMTP id 5so2056004ywm.72
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 May 2008 23:24:14 -0700 (PDT)
Message-ID: <80b317760805272324p590e96fr2453176c6f035138@mail.gmail.com>
Date: Wed, 28 May 2008 08:24:14 +0200
From: "Richard Genoud" <richard.genoud@gmail.com>
To: James <jamessteward@optusnet.com.au>
Subject: Re: Help needed with MTD on AT91SAM9263-EK please.
In-Reply-To: <1211924779.6140.9.camel@Ubuntu-Desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1211437223.6129.82.camel@Ubuntu-Desktop>
	<80b317760805222326j57e6bc11sfe0beef9ab68267b@mail.gmail.com>
	<1211524684.6203.13.camel@torchwood>
	<80b317760805222352v3701dcc5p7aa0108fb72b2192@mail.gmail.com>
	<1211526311.6203.27.camel@torchwood>
	<80b317760805230027n7cbf6ccbpc8289b4b3ad80714@mail.gmail.com>
	<1211755845.6724.29.camel@Ubuntu-Desktop>
	<80b317760805270042w39c409d4j230c1a2967bf0242@mail.gmail.com>
	<1211924779.6140.9.camel@Ubuntu-Desktop>
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

> So, a page at a time seems ok?
yes, all those writings are ok, maybe you can try with
if=/dev/urandom, just to see if the OOB region is updated

> I wonder, what markings are on your CPU and NAND flash?  I have;
> AT91SAM9263 CU-ES 0747 8 QH59R.07
> 0742 29F2G08AAC WP C LJK6
well, I don't know I haven't got the board any more.

> I assume some of this will be a batch code, but I wonder if there's been
> a die shrink that's caused some marginal timing issue?
>
> Regards,
> James.
>
>
>
