MIME-Version: 1.0
In-Reply-To: <1344698728-8709-1-git-send-email-shijie8@gmail.com>
References: <1344698728-8709-1-git-send-email-shijie8@gmail.com>
Date: Mon, 13 Aug 2012 07:44:43 +0300
Message-ID: <CAF4G-tKN683_EQCGcG4G8jMU5K6TamaHUv__3ugGUoEg_LPrcQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: gpmi: add NAND write verify support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: marex@denx.de, fabio.estevam@freescale.com, linux-mtd@lists.infradead.org,
 shawn.guo@linaro.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 11, 2012 at 6:25 PM, Huang Shijie <shijie8@gmail.com> wrote:
> Add NAND write verify support in gpmi-nand driver.
>
> This patch fixes a kernel crash when we select
> CONFIG_MTD_NAND_VERIFY_WRITE=3Dy, and do some write tests:

I would just kill ONFIG_MTD_NAND_VERIFY_WRITE entirely. Some drivers
do not support it and it does not work for sub-pages for long time.
Both UBI and JFFS2 are able to read verify what they wrote already.
There are also MTD tests which do this verification. So I think there
is no reason to keep this in the NAND layer, let alone wasting RAM in
the driver to support this feature.

I am also removing the -stable mailing list - ne need to spam it.

--=20
Best Regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
