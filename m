Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15c6Au-0005E3-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2001 15:18:36 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <71B37AB6576DD211AB7E008048CD4D319FA64B@exchange.ten.logware.de> 
References: <71B37AB6576DD211AB7E008048CD4D319FA64B@exchange.ten.logware.de> 
To: Veikko Werner <veikko.werner@logware.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: UnitSizeFactor != 1 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 29 Aug 2001 15:24:31 +0100
Message-ID: <6677.999095071@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

veikko.werner@logware.de said:
> Sorry, we don't support UnitSizeFactor of != 1 yet

That should be relatively easy to fix. I've just committed a change to the 
doc2000 hardware driver to make it accept erases of length != erasesize.

Now someone just needs to make it deal correctly with UnitSizeFactor in the 
mount code and set nb_blocks and nftl->EraseSize correctly. The rest of the 
code ought to just work.

--
dwmw2
