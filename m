Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVLDC-0005gC-9X
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 18:50:55 +0000
Date: Fri, 7 Dec 2018 19:50:42 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon
 <boris.brezillon@bootlin.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v4] mtd: spinand: add support for GigaDevice GD5FxGQ4xA
Message-ID: <20181207195042.3a21373f@xps13>
In-Reply-To: <20181128130725.21932-1-gch981213@gmail.com>
References: <20181128130725.21932-1-gch981213@gmail.com>
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

Hi Chuanhong,

Chuanhong Guo <gch981213@gmail.com> wrote on Wed, 28 Nov 2018 21:07:25
+0800:

> Add support for GigaDevice GD5F1G/2G/4GQ4xA SPI NAND.
>=20
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
> Changes since v3:
>  fixed missing space after if
>  removed unnecessary oob region calculation
>=20
> Change since v2:
>  fixed incorrect ECC status values
>=20
> Changes since v1:
>  fixed broken indent at the beginning
>  fixed OOB layout. Only the first byte is reserved for bad block mark
>  replaced STATUS_ECC_HAS_BITFLIPS with a device-specific definition

Applied to nand/next.

Thanks,
Miqu=C3=A8l
