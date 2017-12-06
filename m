Date: Wed, 6 Dec 2017 15:57:56 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 Han Xu <han.xu@nxp.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 09/10] mtd: nand: gpmi: rework gpmi_ecc_write_page
Message-ID: <20171206145756.fst7rebzpfzxprs4@pengutronix.de>
References: <20171206091925.5810-1-s.hauer@pengutronix.de>
 <20171206091925.5810-10-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171206091925.5810-10-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 06, 2017 at 10:19:24AM +0100, Sascha Hauer wrote:
> gpmi_ecc_write_page() used to call several functions with 8 arguments
> each. refactor this to make it easier to follow.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 140 ++++++++++-----------------------
>  1 file changed, 42 insertions(+), 98 deletions(-)

This patch is rubbish. Doesn't work as expected and needs update.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
