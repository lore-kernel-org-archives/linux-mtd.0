Date: Mon, 2 Jul 2012 10:24:34 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v3 2/3] ARM: imx6q: add DT node for gpmi nand
Message-ID: <20120702022433.GD21003@S2101-09.ap.freescale.net>
References: <1341200327-8144-1-git-send-email-shijie8@gmail.com>
 <1341200327-8144-3-git-send-email-shijie8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1341200327-8144-3-git-send-email-shijie8@gmail.com>
Cc: dong.aisheng@linaro.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jul 01, 2012 at 11:38:46PM -0400, Huang Shijie wrote:
> Add the DT node for gpmi nand.
> Add the pinmux support for gpmi nand.
> 
> The gpmi nand may conflicts with other modules, such as MMC.
> So we do not enable the gpmi nand for mx6q-arm2 board, just add the
> node for the board.
> 
> Acked-by: Dong Aisheng <dong.aisheng@linaro.org>
> Signed-off-by: Huang Shijie <shijie8@gmail.com>

Applied, thanks.

-- 
Regards,
Shawn
