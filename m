Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GnbSs-00016u-WE
	for linux-mtd@lists.infradead.org; Fri, 24 Nov 2006 08:51:43 -0500
Date: Fri, 24 Nov 2006 16:56:18 +0300
From: Konstantin Baydarov <kbaidarov@dev.rtsoft.ru>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] [MTD] NAND: Lazily BBT construction
Message-ID: <20061124165618.44418a5e@localhost.localdomain>
In-Reply-To: <1164373550.576.13.camel@sauron>
References: <20061124154210.6303c9fe@localhost.localdomain>
	<1164373550.576.13.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 24 Nov 2006 15:05:50 +0200
Artem Bityutskiy <dedekind@infradead.org> wrote:

> On Fri, 2006-11-24 at 15:42 +0300, Konstantin Baydarov wrote:
> > This is the implementation of lazy BBT construction. It introduces
> > a new config option that allows to construct BBT(bad block table)
> > lazily for NAND chips with memory based BBT.
> > The main goal of the feature introduced is to decrease boot time.
> > How it works: BBT is filled only when we check if block is bad. NAND
> > is
> > scanned and BBT entries is constructed from topmost unscanned block
> > to requested.
> > By default BBT is constructed during boot. To enable lazily
> > construction NAND_LAZY_BBT bit should be set in options field of
> > structure nand_chip. 
> 
> Also, the 3rd question.
> 
> 3. Why don't you use on-flash BBT if you are not satisfied with in-RAM
> BBT?
> 
Patch covers the case when there is no on-flash BBT and on-flash
BBT wasn't requested (don't need to write to chip Memory BBT after
construction). How can I use it? Also when we have on-flash BBT we
don't need to scan chip so we don't need lazily BBT.
