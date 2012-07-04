Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SmDzh-0003KF-3f
 for linux-mtd@lists.infradead.org; Wed, 04 Jul 2012 01:03:02 +0000
Received: by obbta17 with SMTP id ta17so11286768obb.36
 for <linux-mtd@lists.infradead.org>; Tue, 03 Jul 2012 18:02:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120703070300.GE22016@pengutronix.de>
References: <1341266419-21321-1-git-send-email-festevam@gmail.com>
 <20120703070300.GE22016@pengutronix.de>
Date: Tue, 3 Jul 2012 22:02:58 -0300
Message-ID: <CAOMZO5AX8cdh0GAQzz5o2S=Y9hZaexjy9EwRwYh6tnBDF5oPOQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: mxc_nand: Select the driver via ARCH_MXC
From: Fabio Estevam <festevam@gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, shawn.guo@linaro.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Uwe,

On Tue, Jul 3, 2012 at 4:03 AM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> the obvious alternative is to select IMX_HAVE_PLATFORM_MXC_NAND for the
> dt-based machines, too.

That would cause platform-mxc_nand.c to be build, which is something
that a dt machine does not need.

>
> Or make it:
>
>         depends on IMX_HAVE_PLATFORM_MXC_NAND || DT || COMPILE_COVERAGE

What about
"depends on IMX_HAVE_PLATFORM_MXC_NAND || CONFIG_OF" ?

> (COMPILE_COVERAGE doesn't exist AFAIK, but IMHO it's sensible to
> introduce it.)

Ok, then maybe this could be introduced via another patchset.

Regards,

Fabio Estevam
