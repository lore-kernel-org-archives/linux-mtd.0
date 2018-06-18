Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fUunq-0007Fn-Tm
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2018 14:06:48 +0000
Date: Mon, 18 Jun 2018 16:06:30 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam
 <fabio.estevam@nxp.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: mxc: set spare area size register
 explicitly
Message-ID: <20180618160630.261404f8@xps13>
In-Reply-To: <1528637487-25172-1-git-send-email-martin@kaiser.cx>
References: <1528025495-14443-1-git-send-email-martin@kaiser.cx>
 <1528637487-25172-1-git-send-email-martin@kaiser.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Martin,

On Sun, 10 Jun 2018 15:31:27 +0200, Martin Kaiser <martin@kaiser.cx>
wrote:

> The v21 version of the NAND flash controller contains a Spare Area Size
> Register (SPAS) at offset 0x10. Its setting defaults to the maximum
> spare area size of 218 bytes. The size that is set in this register is
> used by the controller when it calculates the ECC bytes internally in
> hardware.
>=20
> Usually, this register is updated from settings in the IIM fuses when
> the system is booting from NAND flash. For other boot media, however,
> the SPAS register remains at the default setting, which may not work for
> the particular flash chip on the board. The same goes for flash chips
> whose configuration cannot be set in the IIM fuses (e.g. chips with 2k
> sector size and 128 bytes spare area size can't be configured in the IIM
> fuses on imx25 systems).
>=20
> Set the SPAS register explicitly during the preset operation. Derive the
> register value from mtd->oobsize that was detected during probe by
> decoding the flash chip's ID bytes.
>=20
> While at it, rename the define for the spare area register's offset to
> NFC_V21_RSLTSPARE_AREA. The register at offset 0x10 on v1 controllers is
> different from the register on v21 controllers.
>=20
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: stable@vger.kernel.org
> ---

Thanks, I'm ok with the patch, I'll queue it to nand/next.

> changes in v2
>    - fix the commit message
>    - use '/ 2' instead of shift operator for division
>=20
> BTW is it ok to keep a Reviewed-by tag when updating the patch?

I think so, at least for such minor updates it is okay :)

Regards,
Miqu=C3=A8l
