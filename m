Received: from mail-db9lp0249.outbound.messaging.microsoft.com
 ([213.199.154.249] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOiND-0004o4-FK
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 06:14:56 +0000
Message-ID: <52427FBF.1020106@freescale.com>
Date: Wed, 25 Sep 2013 14:16:31 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [PATCH] drivers: mtd: m25p80: Add quad read support.
References: <1380024647-18955-1-git-send-email-sourav.poddar@ti.com>
In-Reply-To: <1380024647-18955-1-git-send-email-sourav.poddar@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: artem.bityutskiy@linux.intel.com, balbi@ti.com, broonie@kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B409=E6=9C=8824=E6=97=A5 20:10, Sourav Poddar =E5=86=
=99=E9=81=93:
> +static int quad_enable(struct m25p *flash)
> +{
> +	u8 cmd[3];
> +	cmd[0] =3D OPCODE_WRSR;
> +	cmd[1] =3D 0x00;
> +	cmd[2] =3D 0x02;
> +
Please use a macro here, do not use a hardcode.

thanks
Huang Shijie
