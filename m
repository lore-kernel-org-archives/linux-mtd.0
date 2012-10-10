Message-ID: <50750124.5060208@freescale.com>
Date: Wed, 10 Oct 2012 13:01:24 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx28: add the `clock-names` for gpmi-nand
References: <1349837086-21844-1-git-send-email-b32955@freescale.com>
 <CAOMZO5A0UX6y3MtHdzZ8V2Z52qsH8Yy-BVtOYEN_OpBezEsvQw@mail.gmail.com>
In-Reply-To: <CAOMZO5A0UX6y3MtHdzZ8V2Z52qsH8Yy-BVtOYEN_OpBezEsvQw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: marex@denx.de, shawn.guo@linaro.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B410=E6=9C=8810=E6=97=A5 12:54, Fabio Estevam =E5=86=
=99=E9=81=93:
> Hi Huang,
>
> On Tue, Oct 9, 2012 at 11:44 PM, Huang Shijie<b32955@freescale.com>  wr=
ote:
>> The current DT node misses the `clocks-names` item for gpmi-nand.
>> So the gpmi-nand driver could not find the proper clock.
>>
>> This patch fixes this issue.
>>
>> Signed-off-by: Huang Shijie<b32955@freescale.com>
> Thanks for the fix.
>
> Could you please also fix mx23 in the same patch?
I am just fixing it now. :)

Huang Shijie
> Regards,
>
> Fabio Estevam
>
