Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P3ve5-0007qm-TJ
	for linux-mtd@lists.infradead.org; Thu, 07 Oct 2010 18:56:51 +0000
Date: Thu, 7 Oct 2010 19:56:30 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: "Menon, Nishanth" <nm@ti.com>
Subject: Re: [PATCH v2 09/10] OMAP2/3: Convert write/read functions to raw
	read/write
Message-ID: <20101007185630.GA26435@n2100.arm.linux.org.uk>
References: <1285063280-4057-1-git-send-email-manjugk@ti.com>
	<1285063280-4057-10-git-send-email-manjugk@ti.com>
	<7A436F7769CA33409C6B44B358BFFF0C014F74831E@dlee02.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7A436F7769CA33409C6B44B358BFFF0C014F74831E@dlee02.ent.ti.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: "G, Manjunath Kondaiah" <manjugk@ti.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 07, 2010 at 07:17:08AM -0500, Menon, Nishanth wrote:
> 
> > -----Original Message-----
> > From: linux-omap-owner@vger.kernel.org [mailto:linux-omap-
> > owner@vger.kernel.org] On Behalf Of G, Manjunath Kondaiah
> > Sent: Tuesday, September 21, 2010 5:01 AM
> > To: linux-omap@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org; linux-mtd@lists.infradead.org
> > Subject: [PATCH v2 09/10] OMAP2/3: Convert write/read functions to raw
> > read/write
> > 
> > Following sparse warnings exists due to use of writel/w and readl/w
> > functions.
> > 
> > This patch fixes the sparse warnings by converting readl/w functions usage
> > into
> > __raw_readl/__raw_readw functions.
> 
> Apologies on bringing up an old topic here -> Is'nt it better to fix
> readl/w or writel/w than replacing it with __raw_readl/w etc?

No.  If you're getting sparse warnings its because _you_ are using
readl/writel wrongly.

They take a void __iomem pointer, not a u32, unsigned long, int, or
even a void pointer.
