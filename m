Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fUtzz-0001Ar-Lr
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2018 13:15:13 +0000
Date: Mon, 18 Jun 2018 15:14:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: boris.brezillon@bootlin.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] mtd: rawnand: support MT29F1G08ABAFAWP-ITE:F
Message-ID: <20180618151450.3e740270@xps13>
In-Reply-To: <20180618045255.8015-1-chris.packham@alliedtelesis.co.nz>
References: <20180618045255.8015-1-chris.packham@alliedtelesis.co.nz>
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

Hi Chris,

On Mon, 18 Jun 2018 16:52:53 +1200, Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:

> Hi,
>=20
> I'm looking at adding support for the Micron MT29F1G08ABAFAWP-ITE:F chip
> to one of our boards which uses the Marvell NFCv2 controller.
>=20
> This particular chip is a bit odd in that the datasheet states support
> for ONFI 1.0 but the revision number field is 00 00. It also is marked
> ABAFA but reports internally as ABAGA. Finally it has internal 8-bit ECC
> which cannot be disabled.

Boris and I agree that in this case, the chip should not be probed if
ecc->type !=3D ON_DIE (and eventually NONE).

This should be handled in the Micron driver.

Also, what is the returned value of micron_supports_on_die_ecc() (with
patch 1/2)?

Regards,
Miqu=C3=A8l
