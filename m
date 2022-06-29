Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E083C43334
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 18:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJMIdAtWWi5EyAQqr+0wyapsgVvbLlTqxvrJRlTdsjE=; b=H8LJyyN7tM8MWJ
	Tf4AewnXkA9uY9z5ECs9QlER7Ny3lyl7zwIKhi13zrvi13NnzPLzMYXtQbEXW62FQ9MY111tPkDrw
	32WKu/5C7y0ryXO6b8D2NQQYAVzgv8WqTfxIVFV7mciTneIYof4lnywJP48fERtj4PVbOU1zQIwr5
	Msz+Hw7KDDSYhCONjoM76dhiboTtlUqEsvyBG0gEjzSLBFfbM1y1ovoxhgiFtJ7aZ513eGOc6DboL
	coqO/z9o3nY+sE1P2MBy0MSbuWZ78Xa2UPRN63YOmYnFEfiLTsyfZPqSAvWdCoZdDBsA1ChhHkJkj
	Y2QgSkv4Bwlz//WSiVWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cOr-00DV3V-2K; Wed, 29 Jun 2022 18:26:53 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cOj-00DUzf-JR
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 18:26:47 +0000
Received: by mail-ej1-x62d.google.com with SMTP id mf9so34373812ejb.0
        for <linux-mtd@lists.infradead.org>; Wed, 29 Jun 2022 11:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/64xgRiUt1vtjHTJICjZN/EEDL0sMvHlhgMluGbsqx0=;
        b=x2E4mYSLVh6dmMDXYftVhxRZrFhJRMJtLQeY1usKMwvluClkcCiiBN78Btu0KYl+rr
         VqWzaJIx/9upJFb2YZwy2jC8OCOL9QOTVaJSIzlL+u4LQpZWztNzn9d0IQ54v6HfxaWq
         qyE/rL2wCv/psLNSupk4hQ9d7ZW/Me2UtTq4zvMeeH7VN//7gc6tgOjR1pdLeciw92Zo
         O+4h8WNcFHiPaVci9RmHOwUDCcea+CuacUCBKxWlBhWAd+uSEtUg6X0gjaTgmc8XTcvb
         QpnEK0VgVlk53yf6eruRdTQIGKlco3P2ajT3gMWz6OIyLupkmxCBVAKvdH3abrmJhJnQ
         s0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/64xgRiUt1vtjHTJICjZN/EEDL0sMvHlhgMluGbsqx0=;
        b=HP7BmS25obGFGQOrIZYia/J/hF1FuZcQ8HNLBvfPyA5zhOfYeVCiLHK2EEf25sDJdn
         fXC1sU5lM0lDBC2VlIklIkEPUecaZknv4sIVulYeBs7FrbzdeJ5q+ZoHl43eUsBbTOu3
         VnHqLIQjeaflmqPz/trbkNrudgcTtnGAVEb1ZEpjDEVT1npyABj1drfZXugjK5x1ZPwa
         U0cOUV6JA14eLBez+DjYu69jhDKMWfojSYuvFrFjq40onYpaB2yRn74CVTMhQo0dVedD
         5YeOUeBnbQEPRm3l47vZoH5E9XfNEEdHXCKVy3GngXGMDAVxMjLOQ9vZe7YpLH8AVzNb
         5NFw==
X-Gm-Message-State: AJIora/0tvLN2kUp8HDKwUeXvLwd1zhVSRsDgFyYVXe5xCh22RmfrgS5
	Ls05TIMPokvUJQtZD0rBtfG3QiU6c5niQQ==
X-Google-Smtp-Source: AGRyM1sfeOEPxArayPtvXtsr5u5/zqpD7B812IZXeSbupwIKB9chVw1sBePnM8Kf/X3wTBnJz4Lgag==
X-Received: by 2002:a17:906:58c7:b0:722:f4bf:cb75 with SMTP id e7-20020a17090658c700b00722f4bfcb75mr4766353ejs.450.1656527201890;
        Wed, 29 Jun 2022 11:26:41 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id le23-20020a170906ae1700b006f3ef214dbesm7981432ejb.36.2022.06.29.11.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 11:26:41 -0700 (PDT)
Message-ID: <1d26b762-a2af-e717-c0c2-0a991bde5617@linaro.org>
Date: Wed, 29 Jun 2022 20:26:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/7] memory: renesas-rpc-if: Pass device instead of rpcif
 to rpcif_*()
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Vignesh Raghavendra <vigneshr@ti.com>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown <broonie@kernel.org>
Cc: linux-mtd@lists.infradead.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Richard Weinberger <richard@nod.at>, linux-renesas-soc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <cover.1656341824.git.geert+renesas@glider.be>
 <e313b7f9a856fd8546aabb20d44d10e3af6676c6.1656341824.git.geert+renesas@glider.be>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e313b7f9a856fd8546aabb20d44d10e3af6676c6.1656341824.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_112645_738252_EB2695FF 
X-CRM114-Status: GOOD (  10.46  )
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

On 27/06/2022 17:31, Geert Uytterhoeven wrote:
> Most rpcif_*() API functions do not need access to any other fields in
> the rpcif structure than the device pointer.  Simplify dependencies by
> passing the device pointer instead.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/memory/renesas-rpc-if.c | 32 ++++++++++++++++----------------
>  drivers/mtd/hyperbus/rpc-if.c   | 18 +++++++++---------
>  drivers/spi/spi-rpc-if.c        | 14 +++++++-------
>  include/memory/renesas-rpc-if.h | 16 ++++++++--------
>  4 files changed, 40 insertions(+), 40 deletions(-)
> 

I need some acks here.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
