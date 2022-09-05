Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBB6ECAAD3
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 14:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+YPsgdpfEaqLTUKYIpP3xycZ3a0xX09AgFD/5uIWUDw=; b=QtUZ5TKcx9fkNM
	eucsODYGeIpQ3S1Rq5eQSv3/66s3U5coGrD4+RvM5BxaM6PMNG8WL752++SY+66UTpOO8B/RfVjgx
	jsgHT/6nweNrV+z53EEWX5gTUzYlFI5JbGuNrC3R8YCsV7j9XxqQnoZ2SOAnzzEs0ggbwnPA78pYy
	+/L2WFekX/omJXADta2CCzKXqy4poiJKZjtQUwV46v4fO+9NXu/5GaWNT9RHPkIftl/0/ejHotvjv
	Ttwj/bOzyYPpfNxA/gv1UdwY+zBDx4jmIPtZ8GbuKOgyLlXlW7EfylONdTWho9jRBGC14BdyUyDKF
	s1ONRlYAv7U7u2dpY92g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCzi-004MFe-Iy; Mon, 05 Sep 2022 14:22:34 +0000
Received: from mail-qv1-f53.google.com ([209.85.219.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVA30-000xvE-Js; Mon, 05 Sep 2022 11:13:48 +0000
Received: by mail-qv1-f53.google.com with SMTP id j1so6187507qvv.8;
        Mon, 05 Sep 2022 04:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=7iAktJHc3w6rPsnzClYi6h63eWPfDzaVzHqTBIckRp4=;
        b=R7t2Qcp1lBflY1vcWSAvFGDpL1wm70fCepnWH+zrAbiof4E0R0r6MaodmK99KC/uqU
         lkRNi47VWEdS1Mh0Cq7rMIeuWmncJJ2cOty+OFE/rSCBYVUer1tDhNIt1xJajNoN+pha
         9hYFjgcUDhUv9vg4Rsjx4Td0f/j+c8XAElCdXPkz1XbyGCnZFSRjvecB8Dt/V/2ytwns
         pr0+QJCk5ml5PiGLXoq+OBMZT8nSbzyKkmBD4jlfWYYC6/a2AVD44sThrAdLIlOLbLDI
         BjJuCJ4ppbMAAjAsrBVEK+NW8M6uu3+DQvsU1sl/6kNwDh7BxhDa793GpPoaKD+rDvK/
         /Y2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=7iAktJHc3w6rPsnzClYi6h63eWPfDzaVzHqTBIckRp4=;
        b=NBe54ibeo/lSHFsW4Vfvqh++ZDXY+qMIzV+CtIXMpA94LZnby8L34gHC+Ue6jcLWDg
         iQYHvsvWZR/X7hPGs9vErt48V3GQnPUQ1wIz05kH9PiY6RSAcbjPtYstGZKMkfirsOh/
         sGAZ5ZxNv5/bfyYuX8P2uPEL31eV8gaZWdlX+Ncsfdlx3i5mrUIi2NRxJMBLULgvXv82
         NLrw4rrAig9MI1wCOkXa+0Y5XWYkGQG3LtNLmCAgCiLWqhJaYKhmYvFu/olbgxOdoDiv
         jvBULnHOQiIDC/ppCdzjw9QF0oUcO+R0yns0iA4NJv/WMwVDJB4tE+vZdJo6xOlYYhM7
         r1ZQ==
X-Gm-Message-State: ACgBeo3VQBzhmTWseaqsACpag0R5Qy+CMCwBioP27Fn6iAO6VYHXBxz+
	eQKVbJBZVs2xhiYK4POHJbIR8h+9n4aewCYfrOo=
X-Google-Smtp-Source: AA6agR7NrRmeK1sjqt1ZjgVXwez7kxeuRCTCLwTPPcAUxaHLOiRLXkVvjX6xUtf8npwaMKmSjSHhnRIt4pJmIe7SA1s=
X-Received: by 2002:a05:6214:19cf:b0:4a9:4241:2399 with SMTP id
 j15-20020a05621419cf00b004a942412399mr1093930qvc.64.1662376424240; Mon, 05
 Sep 2022 04:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 14:13:08 +0300
Message-ID: <CAHp75Vc5cEs6mPSL1fkHBT2hw-CbmbELFwkEGvwxkrdEVF2K_Q@mail.gmail.com>
Subject: Re: [PATCH v1 00/11] Get rid of [devm_]gpiod_get_from_of_node()
 public APIs
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Guenter Roeck <linux@roeck-us.net>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Felipe Balbi <balbi@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Marc Zyngier <maz@kernel.org>, 
	Richard Weinberger <richard@nod.at>, David Airlie <airlied@linux.ie>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, USB <linux-usb@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-tegra <linux-tegra@vger.kernel.org>, 
	"open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_041347_419122_C5D2AEBD 
X-CRM114-Status: GOOD (  15.81  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> I would like to stop exporting OF-specific [devm_]gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit. We can do that by switching drivers
> to use generic fwnode API ([devm_]fwnode_gpiod_get()). By doing so we open
> the door to augmenting device tree and ACPI information through secondary
> software properties (once we teach gpiolib how to handle those).
>
> I hope that relevant maintainers will take patches through their trees and
> then we could merge the last one some time after -rc1.

I'm in favour of the series, but some comments would be good to be addressed.

-- 
With Best Regards,
Andy Shevchenko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
