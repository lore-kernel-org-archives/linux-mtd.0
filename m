Received: from mail-qk0-f171.google.com ([209.85.220.171])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZnS7W-0007A8-VE
 for linux-mtd@lists.infradead.org; Sat, 17 Oct 2015 14:06:03 +0000
Received: by qkht68 with SMTP id t68so65934052qkh.3
 for <linux-mtd@lists.infradead.org>; Sat, 17 Oct 2015 07:05:41 -0700 (PDT)
Date: Sat, 17 Oct 2015 11:01:44 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: sebastian.hesselbarth@gmail.com, ezequiel.garcia@free-electrons.com,
 dwmw2@infradead.org, computersforpeace@gmail.com, zmxu@marvell.com,
 jszhang@marvell.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 robert.jarzmik@free.fr
Subject: Re: [PATCH v3 3/4] mtd: pxa3xx_nand: rework flash detection and
 timing setup
Message-ID: <20151017140144.GB1578@laptop.cereza>
References: <1444893451-16610-1-git-send-email-antoine.tenart@free-electrons.com>
 <1444893451-16610-4-git-send-email-antoine.tenart@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1444893451-16610-4-git-send-email-antoine.tenart@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Antoine,

On 15 Oct 09:17 AM, Antoine Tenart wrote:
> Rework the pxa3xx_nand driver to allow using functions exported by the
> nand framework to detect the flash and the timings. Then setup the
> timings using the helpers previously added.
> 
> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 118 +++++++++--------------------------------
>  1 file changed, 25 insertions(+), 93 deletions(-)
> 

This patch is not applying on l2-mtd.git master. Care to rebase it?
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
