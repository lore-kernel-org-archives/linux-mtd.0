Received: from verein.lst.de ([213.95.11.210] helo=mail.lst.de)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IYdUf-0006wr-MV
	for linux-mtd@lists.infradead.org; Fri, 21 Sep 2007 04:04:12 -0400
Date: Fri, 21 Sep 2007 10:03:45 +0200
From: Christoph Hellwig <hch@lst.de>
To: Matteo Croce <technoboy85@gmail.com>
Subject: Re: [PATCH][MIPS][2/7] AR7: mtd partition map
Message-ID: <20070921080345.GA4997@lst.de>
References: <200709201728.10866.technoboy85@gmail.com>
	<20070920193547.GA911@lst.de>
	<20070920200058.GB1692@lazybastard.org>
	<200709210409.23521.technoboy85@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200709210409.23521.technoboy85@gmail.com>
Cc: linux-mips@linux-mips.org, Felix Fietkau <nbd@openwrt.org>,
	Eugene Konev <ejka@imfi.kspu.ru>, J??rn Engel <joern@logfs.org>,
	linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>, dwmw2@infradead.org,
	Christoph Hellwig <hch@lst.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 21, 2007 at 04:09:22AM +0200, Matteo Croce wrote:
> I use little endian since 99% of AR7s are little endian. Dunno if
> le/be32_to_cpu does some runtime calculations. Do they?

They do runtime unless the argument is const.  If you say that you cant
change endianess of a given system during it's lifetime it's probably
fine to ignore the endianess issue and always use host endian without
any conversions.  In that case you'll need to remove the ifdef aswell,
though.
