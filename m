Subject: Re: [PATCH v3] OMAP: NAND: Fix static declaration warning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "G, Manjunath Kondaiah" <manjugk@ti.com>
In-Reply-To: <1286315819-5906-1-git-send-email-manjugk@ti.com>
References: <1286315819-5906-1-git-send-email-manjugk@ti.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 11 Oct 2010 21:58:14 +0300
Message-ID: <1286823495.1742.0.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>,
	linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
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
> This patch fixes sparse warning for static declaration of variable "use_dma"
> 
> drivers/mtd/nand/omap2.c:114:11: warning: symbol 'use_dma' was not declared. Should it be static?
> 
> Signed-off-by: G, Manjunath Kondaiah <manjugk@ti.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mtd@lists.infradead.org
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Nishanth Menon <nm@ti.com>

I've pushed this patch to my l2-mtd-2.6.git.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
