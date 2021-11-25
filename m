Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7467DC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Nov 2021 08:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bMhLDe92MRZ3fuOhK/a1n8zJpfz0V4nHKlS5nQ3FmYg=; b=PBlVxFlpU3Hxx6
	OahRiKhwfEey5DV3bGSqQz3XovEjuD+EtRUPhYbkiWCn4axSvdIUKHz5CGgAILH7L9ssK6e2y8UKD
	GrnhHedKhY7F+R5vSWr/qOu84ML6PdDVq60kUEDF227vAU7/SkqzXZHSzvo9ky0syzUUHlT5Zf898
	qd+KJc19Za5Fnm6GzbV96kKJECXNxmcL4QZQ89oQVnniG89PyPjh68+knp2GIcMpXPbnN0DnxioUS
	3D3KRtGMHT6Ds/lLOCyo4wgzAB+Rzq9lJ89Y6sddI1OQIFdg+rk7GBW4ftR9rwsa65wRA9yE38pGu
	vIG44XkSwCbFje86bkUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqA53-006hlf-Ox; Thu, 25 Nov 2021 08:26:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqA4w-006hjf-Ch
 for linux-mtd@lists.infradead.org; Thu, 25 Nov 2021 08:26:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7A906113E
 for <linux-mtd@lists.infradead.org>; Thu, 25 Nov 2021 08:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637828761;
 bh=u4vZvOVOvJSCMC746/RK7I5lvy59gOAI6OaKWr4pPEo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=L/Ujp2hP+em0TbwEAku9UNOgRD/lNgkq9vvjdRJjzztbZCA1hO8OrsQZCeVMfvVHo
 S9yg1Yx9L8hqIkUjIxElc2yEByCbjhR5noTMWj+tg1+rdmPQ4IfMX3kol7PhR24kfY
 50PzEI2T3kCRID+JXCmdkBR3KxAUQUf+Cr40t5/hLPblqb2SyOiDuchuttHBda/DZ9
 O2+I4ewQefbEQ4p7JO3SmEY9q/kEGm2hAtCMJ7GdIImfTI/HlLwJHF//ceMhEAF+wC
 wPZkDjK+dEKsg8ujT+bUcg4vgYW+KhIq7APXLvvIpaNyfzHHvd2l1zGyGdTqjmhWfV
 VGbmTmIlYfeyg==
Received: by mail-wm1-f47.google.com with SMTP id o29so4820111wms.2
 for <linux-mtd@lists.infradead.org>; Thu, 25 Nov 2021 00:26:01 -0800 (PST)
X-Gm-Message-State: AOAM531grpNynyYg0pIRGuYitK2THKv9WONyg0D2of8YBF/6nXJZccme
 CzSGjv+W7yPZzGv4NQthnFUVN0npmY6Un5/eUg8=
X-Google-Smtp-Source: ABdhPJy6foEBtvTrMw2IiNDwnqT6LrlvOZ5dh+nV+5ANTzOv/KSjYNBzI3JdqYrvuqNPFDqYXIA6Rrm24+G/p6n3bl0=
X-Received: by 2002:a1c:770e:: with SMTP id t14mr4817606wmi.173.1637828760332; 
 Thu, 25 Nov 2021 00:26:00 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-8-arnd@kernel.org>
 <202111251538.x6sJNCka-lkp@intel.com>
In-Reply-To: <202111251538.x6sJNCka-lkp@intel.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 25 Nov 2021 09:25:44 +0100
X-Gmail-Original-Message-ID: <CAK8P3a17=OEtgkfRpzK8+-N37XqecSHP=WMZsu16Ef-WMp-1HQ@mail.gmail.com>
Message-ID: <CAK8P3a17=OEtgkfRpzK8+-N37XqecSHP=WMZsu16Ef-WMp-1HQ@mail.gmail.com>
Subject: Re: [PATCH 07/11] dmaengine: qcom-adm: stop abusing slave_id config
To: kernel test robot <lkp@intel.com>
Cc: Vinod Koul <vkoul@kernel.org>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-spi <linux-spi@vger.kernel.org>, 
 Robert Jarzmik <robert.jarzmik@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_002602_495172_3473237F 
X-CRM114-Status: GOOD (  17.89  )
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

On Thu, Nov 25, 2021 at 8:57 AM kernel test robot <lkp@intel.com> wrote:
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/dma/qcom/qcom_adm.c:712:18: warning: no previous prototype for function 'adm_dma_xlate' [-Wmissing-prototypes]
>    struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
>                     ^
>    drivers/dma/qcom/qcom_adm.c:712:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
>    ^
>    static
>    1 warning generated.

I noticed this mistake slipped into v2 as well, the function needs to
be marked 'static'.

Vinod, let me know how you want me to address this. Should I just fold
the fix (see below)
and the final Acks into the patch and send an updated pull request, or
do a complete v3
submission?

      Arnd

8<---
diff --git a/drivers/dma/qcom/qcom_adm.c b/drivers/dma/qcom/qcom_adm.c
index bb338b303af6..65697bee4db0 100644
--- a/drivers/dma/qcom/qcom_adm.c
+++ b/drivers/dma/qcom/qcom_adm.c
@@ -709,8 +709,8 @@ static void adm_channel_init(struct adm_device
*adev, struct adm_chan *achan,
  *
  * Returns pointer to appropriate dma channel on success or NULL on error.
  */
-struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
-                              struct of_dma *ofdma)
+static struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
+                                     struct of_dma *ofdma)
 {
        struct dma_device *dev = ofdma->of_dma_data;
        struct dma_chan *chan, *candidate = NULL;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
