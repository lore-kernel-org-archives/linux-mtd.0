Received: from rdrz.de ([217.160.107.209])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DBCK2-0006ij-U5
	for linux-mtd@lists.infradead.org; Tue, 15 Mar 2005 08:42:59 -0500
Date: Tue, 15 Mar 2005 14:42:57 +0100
From: Raphael Zimmerer <killekulla@rdrz.de>
To: Wolter Kamphuis <wolter.kamphuis@opticon.com>
Message-ID: <20050315134256.GE1107@rdrz.de>
References: <422EDE03.4080803@opticon.com> <423125F5.3070804@snapgear.com>
	<4235B6B9.9030608@opticon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4235B6B9.9030608@opticon.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Can't load DOC driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 14, 2005 at 05:07:21PM +0100, Wolter Kamphuis wrote:
> Will it be difficult to port the 32/64Mb DOC M+ to the new diskonchip 
> driver? I'm certainly not an expert...

I'am working on DocMilPlus 32/64MB support. Currently, reading with
full ECC support works fine, write support will follow. Unfortunately,
for the next weeks I'am on vacation.

Since I won't use INFTL, it is likely that there won't be full INFTL
support. That also depends on how good the DocMilPlus driver can be
integrated into the existing nand framework. Cuz of the fuc^H^H^Hlovely
page layout, some small changes to the nand subsystem will be
necessary, at least, if code duplication is has to be avoided. But
that's another story...

- kille
