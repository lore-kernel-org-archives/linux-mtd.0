Received: from web212.biz.mail.re2.yahoo.com ([68.142.225.199])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GVbNy-0000Eh-Mi
	for linux-mtd@lists.infradead.org; Thu, 05 Oct 2006 18:08:17 -0400
Message-ID: <20061005220807.86730.qmail@web212.biz.mail.re2.yahoo.com>
Date: Thu, 5 Oct 2006 15:08:07 -0700 (PDT)
From: z l <zql@glomationinc.com>
Subject: Re: Problem with developing Samsung K9F1G08U0A MTD driver
To: tglx@linutronix.de
In-Reply-To: <1160084310.9060.129.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> You omitted: ", based on Cirrus Logic release
> 1.0.7."
> 
> Do not try to trick me! 
> 
Maybe it is an important piece of information, but it
was not intentionally left out.


http://www.linux-mtd.infradead.org/source.html#kernelversions
> 
> still applies.
> 
> Pester Cirrus with problems about their kernel.
> 
> Use an up to date kernel from the community and you
> get community
> support.
> 
We would love to have the latest kernel, but this is
the one we can find that has all the device drivers
working for our board.  If there is a later version
available that has all the drivers we would jump in
without any hesitation.

Now onto our NAND FLASH problems.  The problems seem
not to be the kernel, at least so far we don't think
they are.  We found this post in the mailing list,
http://lists.infradead.org/pipermail/linux-mtd/2006-July/016159.html.
and interesting enough it fixed one of our problems. 
So it was the nandwriite that was doing the bad thing
by writing things where "not suppose to" and made good
blocks into "bad".  After applying the fix, at least
we can write to the NAND without making lots of new
"bad" blocks.  And the JFFS2 copied over is somewhat
working.  Still got lot's of "nand_read_ecc: Failed
ECC read, page 0xXXXXXXXXX" when doing normal file
access.  So we are looking into that to see what is
the cause of this problem.

Any idea what it might be?

Thanks
