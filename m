Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPV00-0000xu-Mu
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 08:33:25 +0000
Received: by lagy4 with SMTP id y4so291984lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 01:33:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1335627043.1917.4.camel@koala>
References: <1335362618-4559-1-git-send-email-hechtb@gmail.com>
 <1335626773.1917.3.camel@koala> <1335627043.1917.4.camel@koala>
Date: Wed, 2 May 2012 10:33:22 +0200
Message-ID: <CABYn4sx1GwgJ8qSSaHPitov-kzZecCcDPopgUWf8BhYhUzpdTQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/10] sh_flctl hardware ECC mode cleanup
From: Bastian Hecht <hechtb@googlemail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Magnus Damm <magnus.damm@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pichart <laurent.pinchart@ideasonboard.com>, linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

>> Unfortunantely, I cannot build-test your patches because mackerel
>> defconfig still does not build (mackerel_defconfig). Any suggestions how
>> to work this around or any other defconfig to use?
>
> If you send me a temprorary work-around patch for the build failure -
> would be fine. This patch does =A0not have to work, just make the tree
> compile.

Here a quick workaround:

diff --git a/arch/arm/mach-shmobile/board-mackerel.c
b/arch/arm/mach-shmobile/board-mackerel.c
index f49e28a..ffa3700 100644
--- a/arch/arm/mach-shmobile/board-mackerel.c
+++ b/arch/arm/mach-shmobile/board-mackerel.c
@@ -1017,7 +1017,7 @@ static irqreturn_t mackerel_sdhi0_gpio_cd(int
irq, void *arg)
 	struct sh_mobile_sdhi_info *info =3D dev->platform_data;
 	struct tmio_mmc_data *pdata =3D info->pdata;

-	tmio_mmc_cd_wakeup(pdata);
+//	tmio_mmc_cd_wakeup(pdata);

 	return IRQ_HANDLED;
 }

Thanks,

 Bastian Hecht

> --
> Best Regards,
> Artem Bityutskiy
