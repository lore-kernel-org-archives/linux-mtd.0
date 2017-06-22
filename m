Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dO7cL-0003va-1d
 for linux-mtd@lists.infradead.org; Thu, 22 Jun 2017 19:18:14 +0000
Date: Thu, 22 Jun 2017 21:17:51 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add entry for Denali NAND controller driver
Message-ID: <20170622211751.03809dc6@bbrezillon>
In-Reply-To: <1498036992-14142-1-git-send-email-yamada.masahiro@socionext.com>
References: <1498036992-14142-1-git-send-email-yamada.masahiro@socionext.com>
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

On Wed, 21 Jun 2017 18:23:11 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> The Denali NAND controller driver (drivers/mtd/nand/denali*) has been
> largely reworked by me.  Add myself as its maintainer now.

Applied.

Thanks for doing that.

Boris

>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>=20
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c82a2d790366..a83834aa9341 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3896,6 +3896,12 @@ M:	Pali Roh=C3=A1r <pali.rohar@gmail.com>
>  S:	Maintained
>  F:	drivers/platform/x86/dell-wmi.c
> =20
> +DENALI NAND DRIVER
> +M:	Masahiro Yamada <yamada.masahiro@socionext.com>
> +L:	linux-mtd@lists.infradead.org
> +S:	Supported
> +F:	drivers/mtd/nand/denali*
> +
>  DESIGNWARE USB2 DRD IP DRIVER
>  M:	John Youn <johnyoun@synopsys.com>
>  L:	linux-usb@vger.kernel.org
