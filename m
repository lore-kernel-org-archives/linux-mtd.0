Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797DDC433F5
	for <linux-mtd@archiver.kernel.org>; Sun,  1 May 2022 21:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+KB5YSdwDi4gUJVchwX3OfH129n3Wx4Atg5Mf9hZCIA=; b=QwpkAHkitWQN2A
	zHXqgtm5HrufUW5yCtmkkFNm5FJTdFbviDxH4404WYipV0/QbBQcdAJjNvyOvcDc1FWinV1cRcKfq
	51g3QcIqBGpLl7DSY34oZSCRWC8ZZZx49tDj10lGNpzIGva9JpsjQGACnt39Z6vcgNQB7J36OsCY6
	3T8GsXuIjT4cJj0RRtwRzU5RGRCFEtYUGUzJbsz/mknrloBot71sIkmVHhwUcib5eEX7+O8ATILH+
	dH0s8H7iZ0Z13vLBYISsd+6OjOshm6v8aD8JmsZKNXhejI+hKM0hXch4EhxOLDcgHxX1x8LHGmENp
	yTPMnXBlPQY23bhRy52A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlHD3-00GvW1-Tp; Sun, 01 May 2022 21:34:30 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlHD1-00GvVC-9b
 for linux-mtd@lists.infradead.org; Sun, 01 May 2022 21:34:28 +0000
Received: by mail-yb1-xb36.google.com with SMTP id d12so23293773ybc.4
 for <linux-mtd@lists.infradead.org>; Sun, 01 May 2022 14:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XHDe8NwwI9SjN9yPCfdFZVh4P/kcPQDXEmbvi28Ry+g=;
 b=UhniDGJRP7jnhKBKyFEU7Wm1oj19NfJgHgLTwiUZocIMzFuZcy6/C6VzBVOL++cBvj
 LrIdaNUAfF6A3gJNASrFvHnAKvQMpgaI3a+ALVbDTJ8eikxSpYzLlQUmI4nPbtXjDg4D
 61l+wu6AHbkliq+H0f8Ajl6wMDIrIDWbHXSKpPcelWQXQMMNGkpdczkhdkUi7iNKqqom
 f4kY22N5GzwsoRBTgxLB4z0sMMH1XkpdSeUqQXDWgVrNldazzOzczD605y1f7K81V1C4
 4ugAXmyrIfWO1yaViycscWtZgLZGrFY+/HbQHeYpwIpBVHoKMccEQ7oDjW2RE/A2D6ol
 0zew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XHDe8NwwI9SjN9yPCfdFZVh4P/kcPQDXEmbvi28Ry+g=;
 b=Lbr3c/6X8aCjL2Q+PzRD4EnCzPS9hF4OOKqqLSnBdVq2BratR+iT7LyqEqtbljDRcC
 3Trs0hxImK3e/MPl/sdlOeGObvvqmsmL7mq0btaru9ng4snTn89J/lLr2zCA0hdwgeS/
 qfhxaYZ2EJz87hiFtqZwL2c+u8L6fxPPDvdPD/g2fVfe4BH/gGqLOGxZD8g7Uqk9h82X
 2HNPAcxPMOtBOmc9yz2VJoFJlxVQhlpNUliCJ13bRMJlnsu7ayOYVEOFRQlaoqgmnGtk
 kzchUFLbuvq3wIiRLjomLtfrTqA1+TqikShv99ThzAR7rC+5sDYNkYxc74Ap3NeARC9Z
 KBCQ==
X-Gm-Message-State: AOAM532+bfd2ErNx0CZfAJ4G6h9KCkJMvsNF54UZw8IX5jWtxnfHe1Jk
 TI4j2Q51EGEQu9LJ2toDPLNYi1W7qBQryeJGO1pAKQ==
X-Google-Smtp-Source: ABdhPJwyu4GO9ZTopFM1Qtp9g0AYWW/G2gCL2Rkf2k0emOIuL58PKSUnjfCPuXZtMMqa2spe4DyjerPL+kd11/8NfmU=
X-Received: by 2002:a25:aa94:0:b0:648:62f2:ef4e with SMTP id
 t20-20020a25aa94000000b0064862f2ef4emr8160978ybi.626.1651440865094; Sun, 01
 May 2022 14:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-16-arnd@kernel.org>
In-Reply-To: <20220419163810.2118169-16-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 1 May 2022 23:34:13 +0200
Message-ID: <CACRpkdbdCzeWgLOhQfEPVz6fYMqDeTYtqQ3uunj1MK+RGcZZKA@mail.gmail.com>
Subject: Re: [PATCH 15/48] ARM: pxa: tosa: use gpio descriptor for audio
To: Arnd Bergmann <arnd@kernel.org>
Cc: robert.jarzmik@free.fr, linux-arm-kernel@lists.infradead.org, 
 Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Philipp Zabel <philipp.zabel@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>, 
 Paul Parsons <lost.distance@yahoo.com>, Tomas Cech <sleep_walker@suse.com>, 
 Sergey Lapin <slapin@ossfans.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Dominik Brodowski <linux@dominikbrodowski.net>, Helge Deller <deller@gmx.de>, 
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-ide@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-input@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-leds@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_143427_426121_EAEE25CD 
X-CRM114-Status: GOOD (  12.87  )
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

On Tue, Apr 19, 2022 at 6:40 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The audio driver should not use a hardwired gpio number
> from the header. Change it to use a lookup table.
>
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
