Received: from mail08.syd.optusnet.com.au ([211.29.132.189])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JzRPh-0002ud-FN
	for linux-mtd@lists.infradead.org; Fri, 23 May 2008 07:10:06 +0000
Subject: Re: Help needed with MTD on AT91SAM9263-EK please.
From: James <jamessteward@optusnet.com.au>
To: Alessandro Rubini <rubini-list@gnudd.com>
In-Reply-To: <20080523070342.GA25241@mail.gnudd.com>
References: <1211524684.6203.13.camel@torchwood>
	<1211437223.6129.82.camel@Ubuntu-Desktop>
	<80b317760805222326j57e6bc11sfe0beef9ab68267b@mail.gmail.com>
	<20080523070342.GA25241@mail.gnudd.com>
Content-Type: text/plain
Date: Fri, 23 May 2008 17:09:55 +1000
Message-Id: <1211526595.6203.33.camel@torchwood>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-05-23 at 09:03 +0200, Alessandro Rubini wrote:
> So you should only write the boot code with sam-ba, and write your
> kernel and filesystem from either u-boot or linux. You'll probably
> want to erase and re-program the boot loader from itself, to get rid
> of remaining wrong sam-ba bits.

Oh, and what tool chain are you using?

Regards,
James.
