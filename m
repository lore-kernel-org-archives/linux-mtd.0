Return-Path: <SRS0=A6BC=PZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D487C43612
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jan 2019 21:33:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A2BA20855
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jan 2019 21:33:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NLfwf0zc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="YAyGB+jQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A2BA20855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pls0KfUmutocxC7GePZBc5u3z2JKxvKDn9SHSmeZcQc=; b=NLfwf0zctyTqSS
	cjGDDbleT7EymKyEORXieeEr/tZmtQUhscquqw8votTp2fW1IJDCjHZBpVDt8wAX/tEXPpsE2h0CA
	apJ7E/OILWYD0/guJEVllb/S1yIGnIAz+SzMNHjcAyi1T67ds9wjEos7YoiSp301SV/8P0fRAJk2Y
	NqcJHafUZc9tknrO50NOSsYwVBo9EpZY9MaeYHePebkOxepHv3nkQe3xCWwgdsPySHHrIX6KqodN4
	P57GeK0Lf9uN9/OpdX8junHqG48+jZREU6bvZZj/5wzTYvENIBl/HzAZR/vCTpXvZMnc7JeerhDqD
	r5eG2B6zKQtDJoa9dchw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkFHs-0002D9-S1; Thu, 17 Jan 2019 21:33:20 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkFHp-0002Bj-36
 for linux-mtd@lists.infradead.org; Thu, 17 Jan 2019 21:33:18 +0000
Received: by mail-lj1-x244.google.com with SMTP id v1-v6so9894453ljd.0
 for <linux-mtd@lists.infradead.org>; Thu, 17 Jan 2019 13:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3KzpGTUBYfVEE84/bfTUQnsJTc8Kj1xe3XYFA3kFhTg=;
 b=YAyGB+jQrH+HoleolPj1PEUSG4QVMLgIZWNFrsid/7HVu94/LrvcW+BpIkZsUl9i/R
 yJ3DnniB5jS4RV1nsajyXWkoBtuHxfOUVg/pRh5zMrq+28Hxq27BLytb20wtfKzd0fo7
 UsvN07EH42zzUINWpt1vkfY7uYfx/mxC8PvFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3KzpGTUBYfVEE84/bfTUQnsJTc8Kj1xe3XYFA3kFhTg=;
 b=EeTywRF9paQaN4fSjG5JZOik2sOsT48krrnc854g1emvUoXzHr70gi8jY6VNSVuwIN
 kiaot5m1reenuCn5gstYyk2RnM+mG0/GkMh+OKO0GWTsqRMKqbvrQ6LlRVIasvC7xbFB
 0m7dI/scBQQkshq/EcWLuUCzxuS+oNjclGfgzvaycxzDQKOr93UB3BnpxuE+l+SzYW5Q
 j3TajmECBr3COsf8WZ7/HUm7zxtVT2xymlPrtuE54QluXe8oMmyL71uOjd2HI1fFsdG8
 yZFQOJR3+Lzx3sAV6wIHA9xtbjupQZK8DarrfeSn4u+OXSqhlzOkMhsXtI+wIqw/LzuW
 U9sg==
X-Gm-Message-State: AJcUukcZX9yStGDGW5I6kXm6au+wNP51mOO1i0gk3W43GbyH++WNjXw+
 KsnvTxobD9BNggUrDEj/d3i8UEOZ60DL5UTySpbf9g==
X-Google-Smtp-Source: ALg8bN6CnZgsKGvucrnm+LP+nhPiZbV2+ol+zcDsvvMY7kAXsjv+EDiGdVEl+IGYeaC0sJJXgXN29h+NJnzG8VWduFg=
X-Received: by 2002:a2e:9c7:: with SMTP id
 190-v6mr9870796ljj.120.1547760794006; 
 Thu, 17 Jan 2019 13:33:14 -0800 (PST)
MIME-Version: 1.0
References: <20190109215144.15749-1-linus.walleij@linaro.org>
 <20190114095105.4e2b5c5a@bbrezillon>
In-Reply-To: <20190114095105.4e2b5c5a@bbrezillon>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Jan 2019 22:33:01 +0100
Message-ID: <CACRpkdY22HjSFZxCHpSz6S6C0jx9g-AwBF6+CKZjKt5zy0O3uQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: fsmc: Keep bank enable bit set
To: Boris Brezillon <bbrezillon@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_133317_152217_8BA50356 
X-CRM114-Status: GOOD (  14.86  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jan 14, 2019 at 9:51 AM Boris Brezillon <bbrezillon@kernel.org> wrote:

> Not related to this patch, but I think we're missing a nand_reset()
> call in the ->resume() path. Without it FSMC timings might be wrong
> after a suspend if they're not defined in the DT. Would you mind sending
> another patch to fix that,

I looked into it, It looks like this:

static int fsmc_nand_resume(struct device *dev)
{
    struct fsmc_nand_data *host = dev_get_drvdata(dev);

    if (host) {
        clk_prepare_enable(host->clk);
        if (host->dev_timings)
            fsmc_nand_setup(host, host->dev_timings);
    }

    return 0;
}

fsmc_nand_setup() will set up the timings if we have any.

> and maybe an extra patch to clear
> FSMC_ENABLE in the ->remove() path and the ->probe()'s error path as
> you suggested?

That I can fix. I will resend this patch with that as another patch.

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
