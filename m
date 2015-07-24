Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIiDo-0004s1-Gs
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2015 19:01:28 +0000
Date: Fri, 24 Jul 2015 14:01:06 -0500
From: Andy Gross <agross@codeaurora.org>
To: Archit Taneja <architt@codeaurora.org>
Cc: linux-mtd@lists.infradead.org, dehrenberg@google.com,
 cernekee@gmail.com, computersforpeace@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] mtd: nand: Create a BBT flag to access bad block
 markers in raw mode
Message-ID: <20150724190106.GD24646@qualcomm.com>
References: <1421419702-17812-1-git-send-email-architt@codeaurora.org>
 <1437474886-6209-1-git-send-email-architt@codeaurora.org>
 <1437474886-6209-2-git-send-email-architt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1437474886-6209-2-git-send-email-architt@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 21, 2015 at 04:04:42PM +0530, Archit Taneja wrote:
> Some controllers can access the factory bad block marker from OOB only
> when they read it in raw mode. When ECC is enabled, these controllers
> discard reading/writing bad block markers, preventing access to them
> altogether.
> 
> The bbt driver assumes MTD_OPS_PLACE_OOB when scanning for bad blocks.
> This results in the nand driver's ecc->read_oob() op to be called, which
> works with ECC enabled.
> 
> Create a new BBT option flag that tells nand_bbt to force the mode to
> MTD_OPS_RAW. This would result in the correct op being called for the
> underlying nand controller driver.
> 
> Signed-off-by: Archit Taneja <architt@codeaurora.org>
> ---


Reviewed-by: Andy Gross <agross@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
