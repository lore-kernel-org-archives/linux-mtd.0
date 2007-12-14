Received: from moutng.kundenserver.de ([212.227.126.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J3IHD-0004Ne-Pf
	for linux-mtd@lists.infradead.org; Fri, 14 Dec 2007 21:41:07 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: linuxppc-dev@ozlabs.org,
 avorontsov@ru.mvista.com
Subject: Re: [PATCH v2 4/4] Freescale enhanced Local Bus Controller FCM NAND
	support.
Date: Fri, 14 Dec 2007 22:40:48 +0100
References: <20071214185624.GA10584@loki.buserror.net>
	<4762DA95.90000@freescale.com>
	<20071214195917.GA18616@localhost.localdomain>
In-Reply-To: <20071214195917.GA18616@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200712142240.50379.arnd@arndb.de>
Cc: Scott Wood <scottwood@freescale.com>, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 14 December 2007, Anton Vorontsov wrote:
> > >Maybe this desires its own header?
> > 
> > It can be factored out if anything else ever uses it.
> 
> It's just confusing to parse lbc-specific and nand-specific code
> placed in the same file.

In that case, you could argue for splitting the implementation into
two C files. I don't see any reason to move stuff into a header
when it's not an interface between two parts of the code, but
only describes a hardware interface used by a single driver.

	Arnd <><
