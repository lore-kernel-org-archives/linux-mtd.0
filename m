Received: from xenotime.net ([66.160.160.81])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KbQuX-0000dU-MR
	for linux-mtd@lists.infradead.org; Fri, 05 Sep 2008 02:18:59 +0000
Received: from chimera.site ([72.90.117.230]) by xenotime.net for
	<linux-mtd@lists.infradead.org>; Thu, 4 Sep 2008 19:18:49 -0700
Date: Thu, 4 Sep 2008 19:18:48 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: missing kernel-doc, please add/fix
Message-Id: <20080904191848.640ecd82.rdunlap@xenotime.net>
In-Reply-To: <alpine.LFD.1.10.0808202207490.27575@casper.infradead.org>
References: <20080818141624.d84a1df3.rdunlap@xenotime.net>
	<alpine.LFD.1.10.0808202207490.27575@casper.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 20 Aug 2008 22:32:08 +0100 (BST) Alexey Korolev wrote:

> Hi Randy,
> 
> > Warning(lin2627-rc3g4-kerndoc//include/linux/mtd/nand.h:294): No description found for parameter 'read_subpage'
> > Warning(lin2627-rc3g4-kerndoc//drivers/mtd/nand/nand_base.c:809): No description found for parameter 'data_offs'
> > Warning(lin2627-rc3g4-kerndoc//drivers/mtd/nand/nand_base.c:809): No description found for parameter 'readlen'
> > Warning(lin2627-rc3g4-kerndoc//drivers/mtd/nand/nand_base.c:809): No description found for parameter 'bufpoi'
> > 
> Thanks a lot for catching the issues.
> They are fixed in the following patch. 
> 
Thanks for doing this.


---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
