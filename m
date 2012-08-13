Message-ID: <50288C0E.5060400@freescale.com>
Date: Mon, 13 Aug 2012 13:09:34 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v2] mtd: gpmi: add NAND write verify support
References: <1344698728-8709-1-git-send-email-shijie8@gmail.com>
 <CAF4G-tKN683_EQCGcG4G8jMU5K6TamaHUv__3ugGUoEg_LPrcQ@mail.gmail.com>
In-Reply-To: <CAF4G-tKN683_EQCGcG4G8jMU5K6TamaHUv__3ugGUoEg_LPrcQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: marex@denx.de, fabio.estevam@freescale.com, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, shawn.guo@linaro.org,
 Huang Shijie <shijie8@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B408=E6=9C=8813=E6=97=A5 12:44, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> On Sat, Aug 11, 2012 at 6:25 PM, Huang Shijie<shijie8@gmail.com>  wrote=
:
>> Add NAND write verify support in gpmi-nand driver.
>>
>> This patch fixes a kernel crash when we select
>> CONFIG_MTD_NAND_VERIFY_WRITE=3Dy, and do some write tests:
> I would just kill ONFIG_MTD_NAND_VERIFY_WRITE entirely. Some drivers
> do not support it and it does not work for sub-pages for long time.
> Both UBI and JFFS2 are able to read verify what they wrote already.
> There are also MTD tests which do this verification. So I think there
> is no reason to keep this in the NAND layer, let alone wasting RAM in
> the driver to support this feature.
>
> I am also removing the -stable mailing list - ne need to spam it.
>
thanks a lot. Maybe we should send a patch to remove the=20
CONFIG_MTD_NAND_VERIFY_WRITE feature entirely.

Huang Shijie
