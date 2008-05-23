Received: from [213.203.150.91] (helo=mail.gnudd.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JzRsD-0004sy-IN
	for linux-mtd@lists.infradead.org; Fri, 23 May 2008 07:39:34 +0000
Date: Fri, 23 May 2008 09:39:31 +0200
From: Alessandro Rubini <rubini-list@gnudd.com>
To: jamessteward@optusnet.com.au
Subject: Re: Help needed with MTD on AT91SAM9263-EK please.
Message-ID: <20080523073931.GA26203@mail.gnudd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Sender: rubini-list@gnudd.com
In-Reply-To: <1211526595.6203.33.camel@torchwood>
References: <1211526595.6203.33.camel@torchwood>
	<1211524684.6203.13.camel@torchwood>
	<1211437223.6129.82.camel@Ubuntu-Desktop>
	<80b317760805222326j57e6bc11sfe0beef9ab68267b@mail.gmail.com>
	<20080523070342.GA25241@mail.gnudd.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Oh, and what tool chain are you using?

eldk-4.1-arm-glibc . the kernel is 2.6.24 like Richard Genoud uses,
and 2.6.21 (with maxim.org.za patches) in an older project.

I suspect you have hardware problems on the device, like the nand chip
has some bad contacs. I would refresh them with a soldering iron, just
to be sure, despite the size.

/alessandro
