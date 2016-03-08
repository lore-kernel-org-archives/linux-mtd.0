Date: Tue, 8 Mar 2016 15:46:20 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Vinod Koul <vinod.koul@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Dave Gordon
 <david.s.gordon@intel.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Mark
 Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Maxime
 Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@googlegroups.com, Dan Williams <dan.j.williams@intel.com>,
 dmaengine@vger.kernel.org, Mauro Carvalho Chehab <m.chehab@samsung.com>,
 Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, Rob
 Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland
 <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar
 Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 5/7] mtd: provide helper to prepare buffers for DMA
 operations
Message-ID: <20160308154620.3d64d02b@bbrezillon>
In-Reply-To: <20160308141853.GQ11154@localhost>
References: <1457435715-24740-1-git-send-email-boris.brezillon@free-electrons.com>
 <1457435715-24740-6-git-send-email-boris.brezillon@free-electrons.com>
 <20160308141853.GQ11154@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 8 Mar 2016 19:48:53 +0530
Vinod Koul <vinod.koul@intel.com> wrote:

> On Tue, Mar 08, 2016 at 12:15:13PM +0100, Boris Brezillon wrote:
> >  
> > +#ifdef CONFIG_HAS_DMA
> 
> Shouldn't this be CONFIG_DMA_ENGINE as you are preparing these descriptors
> for DMA transfer?
> 

Nope, scatterlist users are not necessarily using a dmaengine, some IPs
are directly embedding a dedicated DMA engine, which has no driver in
drivers/dma/.

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
