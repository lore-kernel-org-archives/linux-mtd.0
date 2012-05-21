Message-ID: <4FB9B19B.2080309@freescale.com>
Date: Mon, 21 May 2012 11:08:11 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/4] GPMI-NAND: Define ecc.strength
References: <1337562140-5739-1-git-send-email-marex@denx.de>
 <201205210336.41860.marex@denx.de>
 <20120521014121.GO5427@S2101-09.ap.freescale.net>
 <201205210440.09310.marex@denx.de>
In-Reply-To: <201205210440.09310.marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Shawn Guo <shawn.guo@linaro.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B405=E6=9C=8821=E6=97=A5 10:40, Marek Vasut =E5=86=99=
=E9=81=93:
> I doubt so ... but noone ever could test it without DT bindings as you
> NAKed/stalled every single attempt to add the platform binding code. So=
 this
> code was rotting in the tree, who knows how many bugs are still in it. =
Now I
> guess it's about time to start squashing the bugs.
>
I checked the latest l2-mtd code. The bug does exit if the gpmi-nand=20
driver can works(actually it can not).

I will test your patch.
Anyway, this patch should be sent to Artem, not the arm-soc.

thanks
Huang Shijie
