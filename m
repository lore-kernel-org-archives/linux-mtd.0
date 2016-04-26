From: Han Xu <han.xu@nxp.com>
To: Stefan Christ <s.christ@phytec.de>, Markus Pargmann <mpa@pengutronix.de>
CC: David Woodhouse <dwmw2@infradead.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Fabio Estevam
 <fabio.estevam@freescale.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, Huang Shijie <shijie.huang@intel.com>, Brian Norris
 <computersforpeace@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] gpmi-nand: Handle ECC Errors in erased pages
Date: Tue, 26 Apr 2016 15:14:09 +0000
Message-ID: <AM4PR0401MB1841FB9B17767D5667243C2097630@AM4PR0401MB1841.eurprd04.prod.outlook.com>
References: <1461587712-16403-1-git-send-email-mpa@pengutronix.de>,
 <20160426075128.GC2351@lws-christ>
In-Reply-To: <20160426075128.GC2351@lws-christ>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



________________________________________
From: Stefan Christ <s.christ@phytec.de>
Sent: Tuesday, April 26, 2016 1:51 AM
To: Markus Pargmann
Cc: Han Xu; David Woodhouse; Boris BREZILLON; Fabio Estevam; linux-mtd@list=
s.infradead.org; kernel@pengutronix.de; Huang Shijie; Brian Norris; linux-a=
rm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] gpmi-nand: Handle ECC Errors in erased pages

Hi,

On Mon, Apr 25, 2016 at 02:35:12PM +0200, Markus Pargmann wrote:
> ECC is only calculated for written pages. As erased pages are not
> actively written the ECC is always invalid. For this purpose the
> Hardware BCH unit is able to check for erased pages and does not raise
> an ECC error in this case. This behaviour can be influenced using the
> BCH_MODE register which sets the number of allowed bitflips in an erased
> page. Unfortunately the unit is not capable of fixing the bitflips in
> memory.
>
> To avoid complete software checks for erased pages, we can simply check
> buffers with uncorrectable ECC errors because we know that any erased
> page with errors is uncorrectable by the BCH unit.
>
> This patch adds the generic nand_check_erased_ecc_chunk() to gpmi-nand
> to correct erased pages. To have the valid data in the buffer before
> using them, this patch moves the read_page_swap_end() call before the
> ECC status checking for-loop.
>
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> [Squashed patches by Stefan and Boris to check ECC area]
> Cc: Stefan Christ <s.christ@phytec.de>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
>
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>

Tested-by: Stefan Christ <s.christ@phytec.de>

I verified the fix again on our board.

Also tested on my side.

Acked-by: Han xu <han.xu@nxp.com>

Mit freundlichen Gr=FC=DFen / Kind regards,
        Stefan Christ
