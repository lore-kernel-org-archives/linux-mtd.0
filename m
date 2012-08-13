Message-ID: <502867E2.8020405@freescale.com>
Date: Mon, 13 Aug 2012 10:35:14 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v4] mtd: gpmi: add NAND write verify support
References: <1344737275-18342-1-git-send-email-shijie8@gmail.com>
 <201208111610.45107.marex@denx.de>
 <CAMiH66GopNVeKPRQn+KfwRHUoM-Lv8WitX0zAS=Vi=8QAvS-Pw@mail.gmail.com>
 <201208122114.46901.marex@denx.de>
In-Reply-To: <201208122114.46901.marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: fabio.estevam@freescale.com, dedekind1@gmail.com, dwmw2@infradead.org,
 stable@vger.kernel.org, linux-mtd@lists.infradead.org, shawn.guo@linaro.org,
 Huang Shijie <shijie8@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B408=E6=9C=8813=E6=97=A5 03:14, Marek Vasut =E5=86=99=
=E9=81=93:
> Don't forget the malloc header and padding around malloc()'d space. So =
you're
> behind the 2 * PAGESIZE anyway.
>
sorry, I misunderstood your meaning. My meaning is even the SLUB maybe=20
costs some extra memory, it still save much memory
then we use the devm_kzalloc().

thanks
Huang Shijie
