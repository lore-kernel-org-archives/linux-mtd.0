Date: Thu, 31 Mar 2016 16:45:57 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Andrew Morton
 <akpm@linux-foundation.org>, Dave Gordon <david.s.gordon@intel.com>,
 linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Vinod Koul <vinod.koul@intel.com>, Richard Weinberger <richard@nod.at>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Vignesh R <vigneshr@ti.com>, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Mark Brown <broonie@kernel.org>, Hans
 Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, dmaengine@vger.kernel.org, Dan
 Williams <dan.j.williams@intel.com>, linux-media@vger.kernel.org, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Mauro
 Carvalho Chehab <m.chehab@samsung.com>
Subject: Re: [PATCH 2/4] scatterlist: add sg_alloc_table_from_buf() helper
Message-ID: <20160331164557.544ed780@bbrezillon>
In-Reply-To: <20160331141412.GK19428@n2100.arm.linux.org.uk>
References: <1459427384-21374-1-git-send-email-boris.brezillon@free-electrons.com>
 <1459427384-21374-3-git-send-email-boris.brezillon@free-electrons.com>
 <20160331141412.GK19428@n2100.arm.linux.org.uk>
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

Hi Russell,

On Thu, 31 Mar 2016 15:14:13 +0100
Russell King - ARM Linux <linux@arm.linux.org.uk> wrote:

> On Thu, Mar 31, 2016 at 02:29:42PM +0200, Boris Brezillon wrote:
> > sg_alloc_table_from_buf() provides an easy solution to create an sg_table
> > from a virtual address pointer. This function takes care of dealing with
> > vmallocated buffers, buffer alignment, or DMA engine limitations (maximum
> > DMA transfer size).
> 
> Please note that the DMA API does not take account of coherency of memory
> regions other than non-high/lowmem - there are specific extensions to
> deal with this.

Ok, you said 'non-high/lowmem', this means vmalloced and kmapped buffers
already fall in this case, right?

Could you tell me more about those specific extensions?

> 
> What this means is that having an API that takes any virtual address
> pointer, converts it to a scatterlist which is then DMA mapped, is
> unsafe.

Which means some implementations already get this wrong (see
spi_map_buf(), and I'm pretty sure it's not the only one).

> 
> It'll be okay for PIPT and non-aliasing VIPT cache architectures, but
> for other cache architectures this will hide this problem and make
> review harder.
> 

Ok, you lost me. I'll have to do my homework and try to understand what
this means :).

Thanks for your valuable inputs.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
