Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKWBI-00069S-Tv
 for linux-mtd@lists.infradead.org; Wed, 29 Jul 2015 18:34:21 +0000
Date: Wed, 29 Jul 2015 11:33:58 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Archit Taneja <architt@codeaurora.org>
Cc: dehrenberg@google.com, linux-arm-msm@vger.kernel.org,
 cernekee@gmail.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, agross@codeaurora.org,
 computersforpeace@gmail.com
Subject: Re: [PATCH v2 2/5] mtd: nand: Qualcomm NAND controller driver
Message-ID: <20150729183358.GD3159@codeaurora.org>
References: <1421419702-17812-1-git-send-email-architt@codeaurora.org>
 <1437474886-6209-1-git-send-email-architt@codeaurora.org>
 <1437474886-6209-3-git-send-email-architt@codeaurora.org>
 <55B2DDA3.40306@codeaurora.org> <55B7063F.9090102@codeaurora.org>
 <55B830FE.2020601@codeaurora.org> <55B86142.9090806@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55B86142.9090806@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/29, Archit Taneja wrote:
> On 07/29/2015 07:18 AM, Stephen Boyd wrote:
> >On 07/27/2015 09:34 PM, Archit Taneja wrote:
> >>Hi,
> >>
> >>On 07/25/2015 06:21 AM, Stephen Boyd wrote:
> >>>On 07/21/2015 03:34 AM, Archit Taneja wrote:
> >>>
> >>>>+              int size)
> >>>>+{Looks like a
> >>>>+    struct desc_info *desc;
> >>>>+    struct dma_async_tx_descriptor *dma_desc;
> >>>>+    struct scatterlist *sgl;
> >>>>+    int r;
> >>>>+
> >>>>+    desc = kzalloc(sizeof(*desc), GFP_KERNEL);
> >>>>+    if (!desc)
> >>>>+        return -ENOMEM;
> >>>>+
> >>>>+    list_add_tail(&desc->list, &this->list);
> >>>>+
> >>>>+    sgl = &desc->sgl;
> >>>>+
> >>>>+    sg_init_one(sgl, vaddr, size);
> >>>>+
> >>>>+    desc->dir = DMA_MEM_TO_DEV;
> >>>>+
> >>>>+    r = dma_map_sg(this->dev, sgl, 1, desc->dir);
> >>>>+    if (r == 0)
> >>>>+        goto err;
> >>>
> >>>Should we return an error in this case? Looks like return 0.
> >>
> >>dma_map_sg returns the number of sg entries successfully mapped. In
> >>this case, it should be 1.
> >
> >Right, but this function returns 0 (success?) if we failed to map anything.
> 
> Yes. The return value is number of entries successfully mapped.
> dma_map_sg is a macro that is replaced by dma_map_sg_attrs. Its
> comment
> says:
> 
> "dma_maps_sg_attrs returns 0 on error and > 0 on success. It should
> never return a value < 0."

Yes, and so this function that calls dma_map_sg() is going to
return 0 to the caller when it didn't do what it was asked to do?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
