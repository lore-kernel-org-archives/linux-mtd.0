Subject: Re: [PATCH v3] ARM: omap2: mtd split nand_scan in ident and tail
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Jan Weitzel <j.weitzel@phytec.de>
In-Reply-To: <1303222534-10143-1-git-send-email-j.weitzel@phytec.de>
References: <BANLkTimxgyStkfYXyHJUzQBKTR0pYsF7Qw@mail.gmail.com>
	<1303222534-10143-1-git-send-email-j.weitzel@phytec.de>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 20 Apr 2011 12:00:11 +0300
Message-ID: <1303290011.2700.12.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tony@atomide.com, s.hauer@pengutronix.de, linux-mtd@lists.infradead.org,
	s-ghorai@ti.com, vimal.newwork@gmail.com,
	linux-omap@vger.kernel.org, dwmw2@infradead.org,
	linux-arm-kernel@lists.infradead.org
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-04-19 at 16:15 +0200, Jan Weitzel wrote:
> nand_scan calls nand_scan_tail and here we got a ecc.layout and calculate
> oobavail for this layout. After calling nand_scan, we change the layout pointer
> if OMAP_ECC_HAMMING_CODE_HW_ROMCODE is set. This results in not calcluated
> oobavail. Mountig as jffs2 is not possible.
> 
> To fix that nand_scan has to split up in nand_scan_ident and nand_scan_tail
> setting ecc.layout between these calls. So nand_scan_tail calculates oobvail
> for the used layout. This is also done in serveral other platforms.
> 
> Signed-off-by: Jan Weitzel <j.weitzel@phytec.de>
> Reviewed-by: Vimal Singh <vimal.newwork@gmail.com>

Jan,

thanks for the patch, pushed to l2-mtd-2.6.git. And apologies that I
missed.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
