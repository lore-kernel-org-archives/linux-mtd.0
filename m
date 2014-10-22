Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xgrgp-00028z-Ln
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 08:54:44 +0000
Received: by mail-pa0-f42.google.com with SMTP id bj1so3295307pad.29
 for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2014 01:54:23 -0700 (PDT)
Date: Wed, 22 Oct 2014 01:54:19 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd : fsl-quadspi: Let the clocks error path be clearer
Message-ID: <20141022085419.GN16128@brian-ubuntu>
References: <1413576841-5707-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1413576841-5707-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, b32955@freescale.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 17, 2014 at 05:14:01PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> When clk_prepare_enable(q->clk) fails it is clearer to disable the previous
> acquired clock (q->clk_en) in the error path rather than doing it locally.
> 
> So disable q->clk_en in the error path only.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Pushed to l2-mtd.git.

Brian
