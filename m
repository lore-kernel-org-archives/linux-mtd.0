Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVZc8-0002wT-Af
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 09:41:28 +0000
Date: Wed, 20 Jun 2018 11:41:08 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Martin Kaiser <martin@kaiser.cx>, David Woodhouse <dwmw2@infradead.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam
 <fabio.estevam@nxp.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] mtd: rawnand: mxc: set spare area size register
 explicitly
Message-ID: <20180620114108.4ef7ab58@bbrezillon>
In-Reply-To: <20180619110741.32e4a5d8@xps13>
References: <1528025495-14443-1-git-send-email-martin@kaiser.cx>
 <1529354463-23526-1-git-send-email-martin@kaiser.cx>
 <20180619110741.32e4a5d8@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 19 Jun 2018 11:07:41 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> On Mon, 18 Jun 2018 22:41:03 +0200, Martin Kaiser <martin@kaiser.cx>
> wrote:
> 
> > The v21 version of the NAND flash controller contains a Spare Area Size
> > Register (SPAS) at offset 0x10. Its setting defaults to the maximum
> > spare area size of 218 bytes. The size that is set in this register is
> > used by the controller when it calculates the ECC bytes internally in
> > hardware.
> > 
> > Usually, this register is updated from settings in the IIM fuses when
> > the system is booting from NAND flash. For other boot media, however,
> > the SPAS register remains at the default setting, which may not work for
> > the particular flash chip on the board. The same goes for flash chips
> > whose configuration cannot be set in the IIM fuses (e.g. chips with 2k
> > sector size and 128 bytes spare area size can't be configured in the IIM
> > fuses on imx25 systems).
> > 
> > Set the SPAS register explicitly during the preset operation. Derive the
> > register value from mtd->oobsize that was detected during probe by
> > decoding the flash chip's ID bytes.
> > 
> > While at it, rename the define for the spare area register's offset to
> > NFC_V21_RSLTSPARE_AREA. The register at offset 0x10 on v1 controllers is
> > different from the register on v21 controllers.
> > 
> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> > Cc: stable@vger.kernel.org
> > Fixes: d484018 ("mtd: mxc_nand: set NFC registers after reset")  
> 
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied.

Thanks,

Boris
