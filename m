Return-Path: <SRS0=nuHD=DC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB27C4363D
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 08:22:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C405207C4
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 08:22:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gM/kIrMq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6UN+CI1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C405207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S5WPUExwrmLXaTFv2kd1YSTqrUr4R1TXHLmMWi8do5Q=; b=gM/kIrMqPe+NFtcq2Tl9HjbWy
	AP6D8OnUqpPx4Ec2vVXO2L2Hg5F+MjRQdlq7zbYdTBC9AE6kA39QWxrfN9vtnyKVdFjWiQl5jLres
	INEDMNsyoMpxJfywYRUkY85DjohvTSqrAZQ+Ewoy9HrA8KywcjwbL1/vCm2TEYM30qXf7WDFA5T8W
	1kd0aQAEni9/iHvk2DjKhYUfDwXSUcIQoDCeHFFDdyUaQrcmdDi/UMxB2/K86XcSAQDhHyuxZNeJA
	Yq5Eqw1Cg0xkgD94zgCmSEEqOYMx+7hf0wo+iRA2tQgXFnBK0hE7RBDcFXhiSMRqHnyTnb0Tas+U2
	9KpK0Q5HA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLizP-0002NK-NY; Fri, 25 Sep 2020 08:21:59 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLizM-0002Lt-Kc; Fri, 25 Sep 2020 08:21:57 +0000
Received: by mail-il1-x142.google.com with SMTP id x18so1554163ila.7;
 Fri, 25 Sep 2020 01:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LJvK1S1wM77CEwiTWGHH4blwT2BpBAlEo89Zgh09KOA=;
 b=c6UN+CI1Fp4uk5RW2Kl5hegia7PgWhtLlM7r1U47nBCKQW72a7A4XRQcXs33oeaDor
 +Pekks1fUk4lcSdjBfDpJNj8Lb+IWNmLhQGoYiWisLkv3D41VUsroEnfczSCvn93iMA0
 PdgoNS1YbL/b4ZMuMJFX/1ZXSLFAggeEoX2ktDD9FO+0pwsANqptIRMKFiFYN4KX7qqC
 WDDJstdvvqNx8NXIKmPnfS63q2GhbEEE1YnuLTkynqPYmELrM+FlCF2ozTVc/6yewcjv
 uyqAXpyf+XMSyM3oKmVb8hOYgFUVTQTL4LQrVbqn3Y8e3BtJGlXTQ5GVgKq2oCwFpg+W
 1DAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LJvK1S1wM77CEwiTWGHH4blwT2BpBAlEo89Zgh09KOA=;
 b=oBHZdUYOn7jyHGp96kUWnFb8LRKPvZTSMkI6bjoNMV25B50jAPiWv+jcbCW4aaOKrS
 pfBHR6i045WJhJ7fgv90Rt8jz+RjooUzcmOy7eyGAg912iW5hDH+MV9ClCAHDj6WlN6x
 WFB6cKDok2tRDKXGB9Q/dkjHN3WrtgG6coF5RsX94KLSMQ4c6wjYLx2tB7U0LptMylt8
 0vKrVVatbkfEEng7GEUz9VSAPl5PuXHgjHyXLiYeb9ib3wkw3ZpqtT4BMx2uklLhda0s
 Qi49u+6vSyotUxP97rmCKw4Bk6U9vWbMZrz4hYWoLFQ0Q0fISlo1vnWYicNItxa4CDwU
 WDbw==
X-Gm-Message-State: AOAM5311bSNrsFwCpFaZcCialPtgKXlUlL9C8Hrg7HTC3lD01qpupke1
 VTIUIY0LgTcw9FG/20vYXlcpKonN+/TqMxR7YDiiWbIqHI0iIQ==
X-Google-Smtp-Source: ABdhPJxbkPFY03hpX61qBi/nCU+CsJEoNVRZmepsG6KM0Jr4eQ/tgOQDlyETWRPRhaB53PSTYIq/19x3diRibukeHKw=
X-Received: by 2002:a92:cbcf:: with SMTP id s15mr2378625ilq.39.1601022114691; 
 Fri, 25 Sep 2020 01:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200925065418.1077472-1-ikjn@chromium.org>
 <20200925145255.v3.4.I06cb65401ab5ad63ea30c4788d26633928d80f38@changeid>
In-Reply-To: <20200925145255.v3.4.I06cb65401ab5ad63ea30c4788d26633928d80f38@changeid>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 25 Sep 2020 16:21:43 +0800
Message-ID: <CAJsYDVLaw_ViJECoX8VxtrhCDg7m-fOZ0XmF1+n9Y13oVgd4oQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] spi: spi-mtk-nor: use dma_alloc_coherent() for
 bounce buffer
To: Ikjoon Jang <ikjn@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_042156_752455_6EA06508 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

On Fri, Sep 25, 2020 at 2:56 PM Ikjoon Jang <ikjn@chromium.org> wrote:
>
> Use dma_alloc_coherent() for bounce buffer instead of kmalloc() to
> make sure the bounce buffer to be allocated within its DMAable range.

I think the introduction of need_bounce can be in its own commit or
at least mentioned here.

>
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
>
> ---
>
> (no changes since v1)

 There have been a lot of changes since v2 :)

Reviewed-by: Chuanhong Guo <gch981213@gmail.com>
-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
