Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JtKhv-0004hH-PH
	for linux-mtd@lists.infradead.org; Tue, 06 May 2008 10:47:40 +0000
Date: Tue, 6 May 2008 12:47:29 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: [PATCH][RFC] NAND subpage read feature. Take 2.
Message-ID: <20080506104728.GA25761@logfs.org>
References: <Pine.LNX.4.64.0804301301360.6788@pentafluge.infradead.org>
	<20080501202523.GA17828@logfs.org>
	<fe810cf0805040146y64ffcb66vfbf2c4aa82eabfd4@mail.gmail.com>
	<20080505073745.GA13916@logfs.org>
	<20080506001514.GA12796@cloud.net.au>
	<20080506061530.GA23412@logfs.org>
	<20080506094249.GA23685@cloud.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080506094249.GA23685@cloud.net.au>
Cc: dwmw2@infradead.org, tglx@linutronix.de, linux-mtd@lists.infradead.org,
	Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 6 May 2008 19:42:49 +1000, Hamish Moffatt wrote:
> 
> It makes sense to keep data that you had to read anyway, but with the
> subpage read patch that's less than a whole page.

Then make the granularity a subpage.

> I agree. So are we talking about caching of data which we've read
> anyway, or speculative reads? Because reading more than the user
> requested is speculation afaict. If LogFS (for example) reads a whole 
> page even when it doesn't need it, that will degrade performance in some
> cases.

Sure, that's true for any caching.  Unless you have some locality of
access, it won't help.  Ubi scan is the perfect counter-example with
zero locality, both temporal and spacial.

Jörn

-- 
Do not stop an army on its way home.
-- Sun Tzu
