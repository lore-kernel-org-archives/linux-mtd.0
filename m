Received: from mail-wg0-x233.google.com ([2a00:1450:400c:c00::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjPNi-0007zK-BI
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 09:17:38 +0000
Received: by mail-wg0-f51.google.com with SMTP id l18so2796909wgh.10
 for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2014 02:16:59 -0700 (PDT)
Message-ID: <1414574218.15269.4.camel@lp-lvrv.comap.cz>
Subject: Re: [PATCH v3 2/2] mtd: nand: omap: Synchronize the access to the
 ECC engine
From: Rostislav Lisovy <lisovy@gmail.com>
To: Roger Quadros <rogerq@ti.com>
Date: Wed, 29 Oct 2014 10:16:58 +0100
In-Reply-To: <1412259404-5202-1-git-send-email-lisovy@merica.cz>
References: <542D46A1.9090905@ti.com>
 <1412259404-5202-1-git-send-email-lisovy@merica.cz>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Rostislav Lisovy <lisovy@merica.cz>, Tony Lindgren <tony@atomide.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 michal.vokac@comap.cz, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, sojkam1@fel.cvut.cz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-10-02 at 16:16 +0200, Rostislav Lisovy wrote:
> The AM335x Technical Reference Manual (spruh73j.pdf) says
> "Because the ECC engine includes only one accumulation context,
> it can be allocated to only one chip-select at a time ... "
> (7.1.3.3.12.3). Since the commit 97a288ba2cfa ("ARM: omap2+:
> gpmc-nand: Use dynamic platform_device_alloc()") gpmc-nand
> driver supports multiple NAND flash devices connected to
> the single controller.
> Use global 'struct nand_hw_control' among multiple NAND
> instances to synchronize the access to the single ECC Engine.
> 
> Tested with custom AM335x board using 2x NAND flash chips.
> 
> Signed-off-by: Rostislav Lisovy <lisovy@merica.cz>


Just a kind appeal if someone is willing to review this.

Best regards;
Rostislav
