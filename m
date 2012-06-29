Message-ID: <4FED1996.9080908@freescale.com>
Date: Fri, 29 Jun 2012 10:57:26 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Dong Aisheng <aisheng.dong@freescale.com>
Subject: Re: [PATCH 1/3] ARM: imx6q: add clocks for gpmi-nand
References: <1340941925-14591-1-git-send-email-shijie8@gmail.com>
 <20120629022903.GB5844@shlinux2.ap.freescale.net>
In-Reply-To: <20120629022903.GB5844@shlinux2.ap.freescale.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, shawn.guo@linaro.org,
 Huang Shijie <shijie8@gmail.com>, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B406=E6=9C=8829=E6=97=A5 10:29, Dong Aisheng =E5=86=99=
=E9=81=93:
> We had several gpmi clocks here, so i guess it would be good if we have
> the con_id set here too to distinguish what's this clock for.
>
thanks.
But this will cause the mx28 can not find the clock.


Best Regards
Huang Shijie
