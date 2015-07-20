Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHF4R-0005Es-5A
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2015 17:41:43 +0000
Received: by pdrg1 with SMTP id g1so104806716pdr.2
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jul 2015 10:41:22 -0700 (PDT)
Date: Mon, 20 Jul 2015 10:41:19 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Han Xu <han.xu@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: fsl-quadspi: Actually clear TX FIFO upon write
Message-ID: <20150720174119.GD24125@google.com>
References: <1435829876-18149-1-git-send-email-alexander.stein@systec-electronic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1435829876-18149-1-git-send-email-alexander.stein@systec-electronic.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 02, 2015 at 11:37:56AM +0200, Alexander Stein wrote:
> QUADSPI_MCR_CLR_TXF_MASK is the correct mask for clearing the TX FIFO.
> 
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>

Pushed to l2-mtd.git, thanks.

Brian
