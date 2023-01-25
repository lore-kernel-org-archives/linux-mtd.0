Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1ADC27C76
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jan 2023 16:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0R+Ol9FP0uR/Yc7oRTkYXlbCv7Mh0DYMOMumS1eq9MI=; b=2lbx+fdW3Mgq+0
	0UzQ+PXZ2RrRJFbMBP068mggszTeqG0zdeBOnFF7LIcwNRirZA/jXNY9NDF+cMaHBMIPWW9j+guai
	Jo3EAE50CYqAXOsGc6HAEadb4sIVUwlrW2iLHyu2fHDtUlFZNIcJTgIX6z0oSYnCk+cvq/I7b+rNW
	rdIMquu3zat5nsq9/rGT0Vb4NJU9FhXMeBMA2V3xTmo4zQ0ysMzBIVYzWD+QAkEtNKmRmV8BaZUJQ
	1IjI42yL+nxdJilE8xxkdPRJX8P9Fya6ltuRCOKKMDG0Z2kHpN5xf8XmzPC19qpxYrZeyKIfK9vcK
	Op9ct6MoWuG5iR8mbQvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKic0-007wis-8q; Wed, 25 Jan 2023 16:27:00 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKibp-007wgS-AN; Wed, 25 Jan 2023 16:26:50 +0000
Received: by mail-ed1-x52c.google.com with SMTP id y19so22364421edc.2;
        Wed, 25 Jan 2023 08:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1ilN6S2DYFu/DESx5TOWbGLPHlfDmzvINI2SI+/X/LA=;
        b=o4j8nJomybIx4kE59DRw52ujqDVZ1WQewtiJ58C37pZX/5DWWR3us5SruXAAGyfGBc
         0oxAeGxQTdIDM++/ONptAOL1nO0F6K6FiZC1F/r6Qme1XRV2lBzY485x0B9dWJnV3W0W
         TnQMulrN7yyZXGHFTiOyWDC1wY59f/tjlS5vjPAnXkbmCVxXIc2maTfx3FlJemGXPbEd
         oIhFRB2EHA0oTv8BIEwV/oq0Vp9kY4A8qUg2UpNdvj82VIuPM+pGvvRPDGd+iKkdN0iE
         fMhuNZyuRhr5wQD9uKjHTu0/dBcgt18B09bb5lO3wvYzPbjdtZ4zCb8IaUuWGDUTVpmZ
         9R4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ilN6S2DYFu/DESx5TOWbGLPHlfDmzvINI2SI+/X/LA=;
        b=nZ+L+uOKIPawKQktcpfL8IkGoB3XWRCPcEo+zXOre5Gb0334JEs3aQ9bxfKnNsGe8X
         Y/NNF54ySdsvmljDFpsfD1lkX04Bg8+0J8ctuz9O2bcTgqmbb1yKTtNSYNzoXzq9ydoY
         ykyFxt6v66pKz6gEGJq4nfIPUv4CE5m6bcyZDecVX7li2uM7ayIgND8BMJKPJSQuIDvP
         SGwQ1ji250sksKDR92p3yvK/LWewW/mu8pm6BwYDZFvRedskgkHUx/+dSaWaRy5VDVi5
         YE3i9igpji9ylliD/7PNhx3KWitrywsstgyz2BfW8WRBH4Cmxek+3ilblx25z8zfFyBs
         i2Wg==
X-Gm-Message-State: AO0yUKVml3XkdqSGW0Z3biPZo37JrZgQvuc0Dg5WPh3Ug9DBaRTpbfU9
	uEOPeeanhEgeg+LX3BSV7e1n89qjUBBdS0nwnes=
X-Google-Smtp-Source: AK7set8Ywx0iAQrGoEEkgv3qLgP8YXwI3+TvqWY8ReSLX18XMQnjssyGUpWN7izePXDq8V+lj0t2lykY83BEM5yxFts=
X-Received: by 2002:a05:6402:d59:b0:4a0:90da:4653 with SMTP id
 ec25-20020a0564020d5900b004a090da4653mr814683edb.153.1674664006555; Wed, 25
 Jan 2023 08:26:46 -0800 (PST)
MIME-Version: 1.0
References: <20230124230048.371144-1-robh@kernel.org>
In-Reply-To: <20230124230048.371144-1-robh@kernel.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 25 Jan 2023 10:26:35 -0600
Message-ID: <CABb+yY3FwCwEsNYuNP8MBi+2TUra5O7+-GWMzWr06x1g4MJUyg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Add missing (unevaluated|additional)Properties
 on child node schemas
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Bartosz Golaszewski <brgl@bgdev.pl>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Sebastian Reichel <sre@kernel.org>, Mark Brown <broonie@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-spi@vger.kernel.org, 
	linux-usb@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_082649_374435_2BED3235 
X-CRM114-Status: GOOD (  12.12  )
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

On Tue, Jan 24, 2023 at 5:00 PM Rob Herring <robh@kernel.org> wrote:
>
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present.
>
> Add unevaluatedProperties or additionalProperties as appropriate, and
> then add any missing properties flagged by the addition.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
For the mailbox change,
   Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
