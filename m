Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgrO2-0001HP-PX
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 08:35:19 +0000
Received: by mail-pd0-f180.google.com with SMTP id fp1so3053404pdb.25
 for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2014 01:35:00 -0700 (PDT)
Date: Wed, 22 Oct 2014 01:34:56 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Rostislav Lisovy <lisovy@gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: nand: omap: Do not use global variables
Message-ID: <20141022083456.GF16128@brian-ubuntu>
References: <1412252173-20454-1-git-send-email-lisovy@merica.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1412252173-20454-1-git-send-email-lisovy@merica.cz>
Cc: Rostislav Lisovy <lisovy@merica.cz>, Tony Lindgren <tony@atomide.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 michal.vokac@comap.cz, sojkam1@fel.cvut.cz,
 David Woodhouse <dwmw2@infradead.org>, Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 02, 2014 at 02:16:12PM +0200, Rostislav Lisovy wrote:
> Since the commit 97a288ba2cfa ("ARM: omap2+: gpmc-nand: Use
> dynamic platform_device_alloc()") gpmc-nand driver supports
> multiple NAND flash devices connected to the single controller.
> Remove global variable to make the code thread-safe.
> 
> Signed-off-by: Rostislav Lisovy <lisovy@merica.cz>
> ---
> Changes since v1:
> * Do not dynamically allocate the 'struct nand_ecclayout' but rather
>   include it in the 'struct omap_nand_info' (Roger Quadros)

Pushed to l2-mtd.git with some small changes to the comment.

Thanks,
Brian
