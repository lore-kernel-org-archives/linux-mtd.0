Received: from mail18.syd.optusnet.com.au ([211.29.132.199])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JzRO5-0007ZT-Rw
	for linux-mtd@lists.infradead.org; Fri, 23 May 2008 07:08:26 +0000
Subject: Re: Help needed with MTD on AT91SAM9263-EK please.
From: James <jamessteward@optusnet.com.au>
To: Alessandro Rubini <rubini-list@gnudd.com>
In-Reply-To: <20080523070342.GA25241@mail.gnudd.com>
References: <1211524684.6203.13.camel@torchwood>
	<1211437223.6129.82.camel@Ubuntu-Desktop>
	<80b317760805222326j57e6bc11sfe0beef9ab68267b@mail.gmail.com>
	<20080523070342.GA25241@mail.gnudd.com>
Content-Type: text/plain
Date: Fri, 23 May 2008 17:08:14 +1000
Message-Id: <1211526494.6203.31.camel@torchwood>
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

Hi Alessandro,

On Fri, 2008-05-23 at 09:03 +0200, Alessandro Rubini wrote:
> So you should only write the boot code with sam-ba, and write your
> kernel and filesystem from either u-boot or linux. You'll probably
> want to erase and re-program the boot loader from itself, to get rid
> of remaining wrong sam-ba bits.

I can try this again on Monday, but I did try erasing the NAND and
mounting it as jffs2 under linux, and it still went belly up after a
short while.  This was with an ext3 root fs on a USB stick.

Regards,
James.
