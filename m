Subject: Re: [PATCH 17/20] pxa3xx_nand: add cmdline part parser support
From: David Woodhouse <dwmw2@infradead.org>
To: Haojian Zhuang <haojian.zhuang@gmail.com>
In-Reply-To: <h2l771cded01005060212k39b41e4aqa57cc6e5072bfe3b@mail.gmail.com>
References: <h2l771cded01005060212k39b41e4aqa57cc6e5072bfe3b@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 14 May 2010 03:32:44 +0100
Message-ID: <1273804364.9999.881.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Marc Kleine-Budde <mkl@pengutronix.de>,
	Eric Miao <eric.y.miao@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-05-06 at 05:12 -0400, Haojian Zhuang wrote:
> From c81c53e24bbbe29ab4bf9767d24de8c45a4470b9 Mon Sep 17 00:00:00 2001
> From: Lei Wen <leiwen@marvell.com>
> Date: Thu, 6 May 2010 10:42:13 +0800
> Subject: [PATCH] pxa3xx_nand: add cmdline part parser support
> 
> Signed-off-by: Lei Wen <leiwen@marvell.com>
> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c |   26 ++++++++++++++++++++++++--
>  1 files changed, 24 insertions(+), 2 deletions(-)

This conflicts with commit bff3c10d369440bc87ba612b45ba2777d2bf017f.

Some of the other patches in this sequence don't apply cleanly to the
current mtd-2.6.git tree either; please could you refresh?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
