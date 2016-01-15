Date: Fri, 15 Jan 2016 10:01:49 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bayi Cheng <bayi.cheng@mediatek.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: mtk-nor: Drop bogus __init from mtk_nor_init()
Message-ID: <20160115180149.GT109450@google.com>
References: <1452865589-555-1-git-send-email-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452865589-555-1-git-send-email-geert@linux-m68k.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 15, 2016 at 02:46:29PM +0100, Geert Uytterhoeven wrote:
> WARNING: drivers/mtd/spi-nor/mtk-quadspi.o(.text+0x77e): Section mismatch in reference from the function mtk_nor_drv_probe() to the function .init.text:mtk_nor_init()
> The function mtk_nor_drv_probe() references
> the function __init mtk_nor_init().
> This is often because mtk_nor_drv_probe lacks a __init
> annotation or the annotation of mtk_nor_init is wrong.
> 
> Drop the bogus __init from mtk_nor_init() to kill this warning.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Presumably this went unnoticed because some versions of gcc inline
> mtk_nor_init()?

Pushed to l2-mtd.git. Thanks!
