Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by merlin.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1ZRrtE-0002MG-DZ
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 01:10:05 +0000
Received: by pdbfa8 with SMTP id fa8so74031952pdb.1
 for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2015 18:09:37 -0700 (PDT)
Date: Tue, 18 Aug 2015 18:09:34 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: ezequiel.garcia@free-electrons.com, dwmw2@infradead.org,
 robert.jarzmik@free.fr, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: pxa3xx_nand: add a default chunk size
Message-ID: <20150819010934.GV60523@google.com>
References: <1439888350-9253-1-git-send-email-antoine.tenart@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1439888350-9253-1-git-send-email-antoine.tenart@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 18, 2015 at 10:59:10AM +0200, Antoine Tenart wrote:
> When keeping the configuration set by the bootloader (by using
> the marvell,nand-keep-config property), the pxa3xx_nand_detect_config()
> function is called and set the chunk size to 512 as a default value if
> NDCR_PAGE_SZ is not set.
> 
> In the other case, when not keeping the bootloader configuration, no
> chunk size is set. Fix this by adding a default chunk size of 512.
> 
> Fixes: 70ed85232a93 ("mtd: nand: pxa3xx: Introduce multiple page I/O
> support")
> 
> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> Acked-by: Robert Jarzmik <robert.jarzmik@free>

Applied to l2-mtd.git
