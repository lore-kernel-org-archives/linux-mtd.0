Message-ID: <4FF10C05.70306@freescale.com>
Date: Mon, 2 Jul 2012 10:48:37 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v3 3/3] mtd: gpmi: change the code for clocks
References: <1341200327-8144-1-git-send-email-shijie8@gmail.com>
 <1341200327-8144-4-git-send-email-shijie8@gmail.com>
In-Reply-To: <1341200327-8144-4-git-send-email-shijie8@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: shawn.guo@linaro.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dong.aisheng@linaro.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B407=E6=9C=8802=E6=97=A5 11:38, Huang Shijie =E5=86=99=
=E9=81=93:
> -			status =3D "disabled"; /* gpmi nand conflicts with SD */
> +			status =3D "okay"; /* gpmi nand conflicts with SD */
>   		};
sorry, this is my mistake.

I will fix it in the next version.
But you can give your comments about other code of this patch.

thanks.

Huang Shijie
