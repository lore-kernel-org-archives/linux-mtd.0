Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1POYPB-00079Y-Ar
	for linux-mtd@lists.infradead.org; Fri, 03 Dec 2010 16:22:43 +0000
Received: by bwz5 with SMTP id 5so8818672bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Dec 2010 08:22:39 -0800 (PST)
Subject: Re: [PATCH V2] omap: nand: remove hardware ECC as default
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tony Lindgren <tony@atomide.com>, David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20101130180542.GP17222@atomide.com>
References: <1290177926-3526-1-git-send-email-s-ghorai@ti.com>
	<20101130180542.GP17222@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Dec 2010 18:22:05 +0200
Message-ID: <1291393325.2365.72.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
	Sukumar Ghorai <s-ghorai@ti.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-11-30 at 10:05 -0800, Tony Lindgren wrote:
> * Sukumar Ghorai <s-ghorai@ti.com> [101119 06:36]:
> > CONFIG_MTD_NAND_OMAP_HWECC defined wrongly in patch submitted for 2.6.36.
> > This flag enables hw ecc by default. Boards like beagle and pandora uses
> > sw ecc for write (e.g. binary flushed from u-boot) and read from kernel.
> > https://patchwork.kernel.org/patch/111036/
> > 
> > Signed-off-by: Sukumar Ghorai <s-ghorai@ti.com>
> 
> This should go in as a fix for the -rc via MTD list if possible.
> 
> Acked-by: Tony Lindgren <tony@atomide.com>

Tony, I think this is quite simple patch, and you can merge it yourself,
MTD tree is slow. I hope dwmw2 will not beat me for this, but unless he
quickly jumps in and confirms he takes care of this patch, just go ahead
an merge it. I've put dwmw2 to "To:", just in case.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
