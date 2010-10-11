Subject: Re: [PATCH v3] OMAP2/3: NAND: Convert write/read functions to raw
	read/write
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "G, Manjunath Kondaiah" <manjugk@ti.com>
In-Reply-To: <1286315819-5906-3-git-send-email-manjugk@ti.com>
References: <1286315819-5906-1-git-send-email-manjugk@ti.com>
	<1286315819-5906-3-git-send-email-manjugk@ti.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 11 Oct 2010 21:59:20 +0300
Message-ID: <1286823560.1742.2.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-10-06 at 03:26 +0530, G, Manjunath Kondaiah wrote:
> Following sparse warnings exists due to use of writel/w and readl/w functions.
> 
> This patch fixes the sparse warnings by converting readl/w functions usage into
> __raw_readl/__raw_readw functions.
> 
> drivers/mtd/nand/omap2.c:484:15: warning: symbol '__v' shadows an earlier one
> drivers/mtd/nand/omap2.c:484:15: originally declared here
> 
> drivers/mtd/onenand/omap2.c:86:9: warning: symbol '__v' shadows an earlier one
> drivers/mtd/onenand/omap2.c:86:9: originally declared here
> 
> Signed-off-by: G, Manjunath Kondaiah <manjugk@ti.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mtd@lists.infradead.org

I've pushed this patch to my l2-mtd-2.6.git.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
