Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fUuql-00060S-Ni
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2018 14:09:52 +0000
Date: Mon, 18 Jun 2018 16:09:29 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Martin Kaiser <martin@kaiser.cx>
Cc: David Woodhouse <dwmw2@infradead.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: mxc: set spare area size register
 explicitly
Message-ID: <20180618160929.421bee73@bbrezillon>
In-Reply-To: <1528637487-25172-1-git-send-email-martin@kaiser.cx>
References: <1528025495-14443-1-git-send-email-martin@kaiser.cx>
 <1528637487-25172-1-git-send-email-martin@kaiser.cx>
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

Hi Martin,

On Sun, 10 Jun 2018 15:31:27 +0200
Martin Kaiser <martin@kaiser.cx> wrote:

> The v21 version of the NAND flash controller contains a Spare Area Size
> Register (SPAS) at offset 0x10. Its setting defaults to the maximum
> spare area size of 218 bytes. The size that is set in this register is
> used by the controller when it calculates the ECC bytes internally in
> hardware.
> 
> Usually, this register is updated from settings in the IIM fuses when
> the system is booting from NAND flash. For other boot media, however,
> the SPAS register remains at the default setting, which may not work for
> the particular flash chip on the board. The same goes for flash chips
> whose configuration cannot be set in the IIM fuses (e.g. chips with 2k
> sector size and 128 bytes spare area size can't be configured in the IIM
> fuses on imx25 systems).
> 
> Set the SPAS register explicitly during the preset operation. Derive the
> register value from mtd->oobsize that was detected during probe by
> decoding the flash chip's ID bytes.
> 
> While at it, rename the define for the spare area register's offset to
> NFC_V21_RSLTSPARE_AREA. The register at offset 0x10 on v1 controllers is
> different from the register on v21 controllers.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: stable@vger.kernel.org

Hm, a Cc-stable tag without its associated Fixes tag, I don't like that.
Can you find which commit introduced this bug?

Thanks,

Boris
