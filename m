Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxJGV-00018D-8l
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2018 21:53:41 +0000
Date: Tue, 4 Sep 2018 23:53:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Cc: boris.brezillon@bootlin.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] mtd: nand: toshiba: Add support for Toshiba Memory
 BENAND (Built-in ECC NAND)
Message-ID: <20180904235317.0c98e0f1@xps13>
In-Reply-To: <1533360352-2882-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
References: <1533360352-2882-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
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

Hi Yoshitake,

KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp> wrote on Sat,
4 Aug 2018 14:25:52 +0900:

> This patch is a patch to support TOSHIBA MEMORY CORPORATION BENAND
> memory devices.  Check the status of the built-in ECC with the Read
> Status command without using the vendor specific command.  The Read
> Status command only knows whether there was bitflips above the
> threshold and can not get accurate bitflips.  For now, I set
> max_bitflips mtd->bitflip_threshold.
>=20
> Signed-off-by: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
> ---

Applied to nand/next.

Thanks,
Miqu=C3=A8l
