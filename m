Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K4KfH-00035H-4i
	for linux-mtd@lists.infradead.org; Thu, 05 Jun 2008 18:58:23 +0000
Date: Thu, 5 Jun 2008 20:58:09 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: [RFC/PATCH 2/3] NAND multiple plane feature
Message-ID: <20080605185809.GA19234@logfs.org>
References: <alpine.LFD.1.10.0805281342150.23606@pentafluge.infradead.org>
	<20080603174244.GC1224@logfs.org>
	<alpine.LFD.1.10.0806051724560.16300@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.LFD.1.10.0806051724560.16300@pentafluge.infradead.org>
Cc: dwmw2@infradead.org, tglx@linutronix.de, linux-mtd@lists.infradead.org,
	vasiliy.leonenko@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 5 June 2008 17:58:14 +0100, Alexey Korolev wrote:
> 
> > > -	if (!chip->write_page)
> > > -		chip->write_page = nand_write_page;
> > > -
> > 
> > Why is this removed?
> >
> Oh. May be it would be better to make stand alone patch in order to
> clean up NAND subsystem.

Yes, please. :)

> Using chip->write_page is redundend here. It
> is set once it is set for write procedure only. There is no chip read
> page call like that. IMHO it is better to use static call here. Please
> let me know if you are agree with this. 

Setting it just once is clearly better.  So long as it actually happens
and we don't introduce a bug, I like it.

Jörn

-- 
When I am working on a problem I never think about beauty.  I think
only how to solve the problem.  But when I have finished, if the
solution is not beautiful, I know it is wrong.
-- R. Buckminster Fuller
