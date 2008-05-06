Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JtGSp-0001Mz-Pf
	for linux-mtd@lists.infradead.org; Tue, 06 May 2008 06:15:48 +0000
Date: Tue, 6 May 2008 08:15:31 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: [PATCH][RFC] NAND subpage read feature. Take 2.
Message-ID: <20080506061530.GA23412@logfs.org>
References: <Pine.LNX.4.64.0804301301360.6788@pentafluge.infradead.org>
	<20080501202523.GA17828@logfs.org>
	<fe810cf0805040146y64ffcb66vfbf2c4aa82eabfd4@mail.gmail.com>
	<20080505073745.GA13916@logfs.org>
	<20080506001514.GA12796@cloud.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080506001514.GA12796@cloud.net.au>
Cc: linux-mtd@lists.infradead.org, tglx@linutronix.de, dwmw2@infradead.org,
	Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 6 May 2008 10:15:15 +1000, Hamish Moffatt wrote:
> 
> Caching only makes sense when you can read extra data at no cost.

Not true.  Caching makes sense when the benefits outweigh the costs,
just like everything else.  "No cost" is just a special case where even
minimal benefits suffice.

Nand already does caching, it just limits itself to a single page.  If
two consecutive reads hit the single page, it is only read once.  Which
easily fits your definition and just as easily helps single-threaded
users.  But two threads bouncing back and forth can already nullify the
gains.  It would be useful to keep as much old data around as there is
DRAM for.

However DRAM page granularity is bigger, therefore some data will be
read and not used.  In the case of ubi attach that is a lot of data.
And there are no benefits in caching the ubi headers, as they are read
only once.  So the solution is to have NAND page granularity or so for
the cache, which means buggerheads.

[ Also, even ubi attach may benefit from caching under special
circumstances.  If you have just written an image and have enough ram,
there is no reason to go back to flash.  But that hardly matters in real
life. ]

Jörn

-- 
tglx1 thinks that joern should get a (TM) for "Thinking Is Hard"
-- Thomas Gleixner
