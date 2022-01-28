Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBB5C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jan 2022 00:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3fK1T37HgK5EUinkWvLPumTVgYfDukC7cn9M/Y2vXQk=; b=F8WRedccMo6TOp
	BEi8TYIc9gSDnn1oHXGvIYCt7WmE6oUG13qAR+YekxsblkSok4y9s76UQKfELcUg6ClFxZs+UZDU3
	qxvbsm2UsKZdbsjbYIU6gcNWaF973jxnf420DPeEqCDSrmcR01gm4eI4RqrGWQ2DRQYjBNTgjZ5AZ
	twkFkqasYnh7olT0LBLRbtOJWwMFgJ4cYumk+jWPl7RQLlISssChtgHNAq+KJjTCd/n9shFZKRSV3
	jDXL5s9MmOYr0qBTyVwEJv64UrA5rHvCLp8zbHFKqxnqPEvt8I5TdWx2Mc/dhFq0hljZ62h5UBC0A
	5O3uUgVGmiQjWHTdAw4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDEz2-00HR42-GC; Fri, 28 Jan 2022 00:19:20 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDEyq-00HR1R-KZ
 for linux-mtd@lists.infradead.org; Fri, 28 Jan 2022 00:19:09 +0000
Received: by mail-yb1-xb33.google.com with SMTP id p5so13537298ybd.13
 for <linux-mtd@lists.infradead.org>; Thu, 27 Jan 2022 16:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3DCG3jSFRCxm0g2kfV3cHNqgsx01TK2wuMVMrv3kOZs=;
 b=nJX6+UI8YTCimbpcv+pq777gCdLu0/GnEx3ZTjHpS2o0yUjh9ly2WBhhLtEun0n18v
 0w1UV21RMSfZv8hSpUqL1dSFQJ8X5FfR0IOlMgzcb7ywgkd+ZRzMzOcdenlzemlIGqxO
 XRQrQuOw6IbkMajKB5hoZqZS/I91t1ghfvNomkXWxCWOTTxQrPwZTPH3N4gdsOtz814r
 JXfvW7M9c/aS5ykLbFEH0mW8HLFkswy8tt2zL9sFb+0rfjAHILk4LoTt38qYFPZ6DnKq
 CJt0+ULHi5RzCfFguwZ+IOVnFREAXtbOkBv9l3rQ+YQhjJDtbkDwvzPsoo6fyIkPPJ7t
 RBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3DCG3jSFRCxm0g2kfV3cHNqgsx01TK2wuMVMrv3kOZs=;
 b=hJXgNc/Mz1VTG2ogXax1Fa5RivVUlGNo3eW0isuKvtHrSKj6VINX/P47VbVwoMmI0p
 xgd4xmEoUa6MQG2FI6jnJktueHhUF1OUlYTjB3p4+o1Y2+AYzmivs/MROo5HGiZIWwPE
 S44aHAYbUxfe9AT6kOKrVxDysLp86BvLwaCTBbT3eWKgwSXUNIp5w+3EIm5BHAsLv9Wd
 jk2DjHQbMI0rth8lOB2oQloZUnvO5VWJ6Lgx+i7e/XEc2oqMd8JJogKTmgqHWZue2UOm
 KQTZ0rDO3EJipbWjzeIJJiZX3vH3/3AlRPxuR7+PUJcQwER6BpHi1TjhZDX1BEe/L9uf
 SvXg==
X-Gm-Message-State: AOAM530kz/IvlU5gkxqFchWaemKI+S6Z3LH/8TfOg7fGNLoHNAEgt8Qm
 /+XmTYbg5/tBX/vvcff4TuPK9jSRsVCD6jLK4gME3g==
X-Google-Smtp-Source: ABdhPJyykXdIj7dPguTyjg62i8Gn1/OIXWg5z8qwoIkr3LKwT6wwILgx7t7DttiqJWU5ru3WZYNPOodW/GSuSJ6/0a8=
X-Received: by 2002:a05:6902:124a:: with SMTP id
 t10mr8266567ybu.634.1643329147454; 
 Thu, 27 Jan 2022 16:19:07 -0800 (PST)
MIME-Version: 1.0
References: <20220127200310.4150981-1-clabbe@baylibre.com>
In-Reply-To: <20220127200310.4150981-1-clabbe@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Jan 2022 01:18:55 +0100
Message-ID: <CACRpkdY7O=KjhbeBZiokchFhSo8dTM+JAeBOTq+qkKE7-63jPw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: drop mtd/cortina,gemini-flash.txt
To: Corentin Labbe <clabbe@baylibre.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, robh+dt@kernel.org, 
 vigneshr@ti.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_161908_751266_A773618C 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jan 27, 2022 at 9:03 PM Corentin Labbe <clabbe@baylibre.com> wrote:

> Drop mtd/cortina,gemini-flash.txt since it is nearly already handled by
> Documentation/devicetree/bindings/mtd/mtd-physmap.yaml.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

Thanks for fixing this Corentin!

> +      $ref: /schemas/types.yaml#/definitions/phandle
> +      description:
> +        Phandle to the syscom controller

syscon?

With that small fix:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
