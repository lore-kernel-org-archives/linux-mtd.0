Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0050FC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 10:29:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C513461B73
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 10:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C513461B73
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Br8MrL6ECrh3HJhiwtxF0XSxhqc7aUQRH5dpelxcPAY=; b=J8alcUeBM+bvXS
	qOydmJzEZCaWeCsL9aMiifctw1TJPOJE4xGaDNw8lO8ZbP+q3l67kM5sjErGnWIPijUnjp8HcKOk8
	fUUqBQhn0p6yLB0LLz3fJ2AHLv/rcAcVZMbUl8x8tV8d4/BwbLkOA5XSS1UWrptjsRHRMHORtVNx+
	oSBvytywVmSCD/6v7mj9F0O+d6KtMf9Q/bd8Kkayzh2H9Y1NmqugkFm8S49gBqFLnsCagh6Tr8MXd
	0tXOl/cUGfKHz26Gp+vBcIW+CwNs9k9VaSHkHRsdc3FgbtBdV9xtBn1QsMKw/8WNdpbZQ0nx3A2kV
	HXcqrm920Ai6aPlxFDBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmZES-00FC4k-5Q; Mon, 15 Nov 2021 10:29:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmZ9K-00FAc3-21; Mon, 15 Nov 2021 10:23:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9807263240;
 Mon, 15 Nov 2021 10:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636971821;
 bh=/t8XfUWWM8z249haMNnkzo9rz3rqA5hhnI/QUDdDTws=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BuOY5ELTwM8ARl8dht0vPj74GqpW7Omi9ye6DZXl4ISYUdhHvn/MD+ynDDUT+QFtA
 v8L7yTHPnv3tNZT+6a7jmvQiyHLX42OhSBtuErgkkpXMWboLAxbpYYXhkMyhP3kE41
 WUL+WGa8r2Ml5m1pmbyJCKNiWaAA/tcOe62yL/fiNo14Evo43QgmMCKuyU9uToylcA
 J85yoCIJTYPD2hiiYP9cnEUTFS41uyXrFoia9J9lYRG9OY91kMrhg72OL5ozjj1uQi
 01RuRIianAw8FITBywentT0od4DYro7YDzqlmkyd3IDz3Pd+duWc1lFOAhroRxLO8P
 vWZ7OvjtlSIUw==
Received: by mail-wr1-f45.google.com with SMTP id d27so29623167wrb.6;
 Mon, 15 Nov 2021 02:23:41 -0800 (PST)
X-Gm-Message-State: AOAM531qIQ8Q30+AH5jDhoiF36jLTmVfozeKTbgeeBNnzRxb7nUJmyW2
 4N/+89wlKVlmYE2EhMjSrjSdVjdTfdhej4BS+No=
X-Google-Smtp-Source: ABdhPJzrg17TRzVZ0g7WiohBQZUnVilsZRnhlMklfo7pQF89sOPyjg8lWeE+TbAhUi7fYkrm+wuR9SFoHCL7lz7Lazw=
X-Received: by 2002:adf:df89:: with SMTP id z9mr45210699wrl.336.1636971819867; 
 Mon, 15 Nov 2021 02:23:39 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-11-arnd@kernel.org>
 <CAMhs-H98kPNqH491+X0Mp81Ng++v1aQ=97XSHEhs+vx3g8W_4A@mail.gmail.com>
In-Reply-To: <CAMhs-H98kPNqH491+X0Mp81Ng++v1aQ=97XSHEhs+vx3g8W_4A@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 15 Nov 2021 11:23:24 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2hfcbTJ-yKik1hN35dTdqhjhCd=3X6G_hW4MXRHDVrfA@mail.gmail.com>
Message-ID: <CAK8P3a2hfcbTJ-yKik1hN35dTdqhjhCd=3X6G_hW4MXRHDVrfA@mail.gmail.com>
Subject: Re: [PATCH 10/11] staging: ralink-gdma: stop using slave_id config
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Andy Gross <agross@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Baolin Wang <baolin.wang7@gmail.com>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hyun Kwon <hyun.kwon@xilinx.com>, 
 Jaroslav Kysela <perex@perex.cz>, Jon Hunter <jonathanh@nvidia.com>, 
 Lars-Peter Clausen <lars@metafoo.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Mark Brown <broonie@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Scott Branden <sbranden@broadcom.com>, Takashi Iwai <tiwai@suse.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>, 
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 dmaengine@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mmc <linux-mmc@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, linux-staging@lists.linux.dev, 
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_022342_159118_15E99AC1 
X-CRM114-Status: GOOD (  11.51  )
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

On Mon, Nov 15, 2021 at 10:55 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
> On Mon, Nov 15, 2021 at 9:55 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > ---
> >  drivers/staging/ralink-gdma/ralink-gdma.c | 12 +++++-------
> >  1 file changed, 5 insertions(+), 7 deletions(-)
>
> This driver has been already deleted from the staging tree. See [0].

Ok, thanks! I'll just leave out the patch from future submissions, and remove
it completely once your commit hits mainline.

       Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
