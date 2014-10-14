Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XeAtA-0002XR-4Q
 for linux-mtd@lists.infradead.org; Tue, 14 Oct 2014 22:48:21 +0000
From: Marek Vasut <marex@denx.de>
To: "Bean Huo =?utf-8?q?=E9=9C=8D=E6=96=8C=E6=96=8C?= (beanhuo)"
 <beanhuo@micron.com>
Subject: Re: [PATCH 1/1 v2] driver:mtd:spi-nor:fix spi_nor_scan overwrite
 platform ID point
Date: Wed, 15 Oct 2014 00:45:53 +0200
References: <A765B125120D1346A63912DDE6D8B6315E62CB@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315E62CB@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201410150045.53976.marex@denx.de>
Cc: "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "grmoore@altera.com" <grmoore@altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "shijie8@gmail.com" <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, October 14, 2014 at 03:26:49 AM, Bean Huo =E9=9C=8D=E6=96=8C=E6=
=96=8C (beanhuo) wrote:
[...]

> -			dev_warn(dev, "found %s, expected %s\n",
> -				 jid->name, id->name);
> -			id =3D jid;
> -			info =3D (void *)jid->driver_data;
> +			struct flash_info *tmpinfo;
> +
> +			tmpinfo =3D (void *)jid->driver_data;
> +			if (tmpinfo->jedec_id !=3D info->jedec_id ||
> +					(info->ext_id !=3D 0 &&
> +					 tmpinfo->ext_id !=3D info->ext_id)) {
> +				dev_warn(dev, "found %s, expected %s\n",
> +						jid->name, id->name);
> +				id =3D jid;
> +				info =3D (void *)jid->driver_data;
> +			}

Won't $info contain an undefined value in case the newly added condition is=
n't=20
met ? The old code initialized $info to a certain value always, the new cod=
e=20
does not do that.

Best regards,
Marek Vasut
