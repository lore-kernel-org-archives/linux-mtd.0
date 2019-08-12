Return-Path: <SRS0=CTVO=WI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F4FC433FF
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2019 08:17:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 364992087B
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2019 08:17:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P10DjC95";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u4QlkRbM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 364992087B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSatS0AmvHMonlmOFGBsnPQHugOdpU8mM+VDg11hGUI=; b=P10DjC95a9tz2F
	LeAVsEijbi3kgE0+B+O3N8iW4oZU6hwzb8/ybqOUUwHCwO9lVH4FZHN89qOO3O0MqvossidAfOv4L
	AA+QwTilzP5OedpbFFi/36cyKZT4w63eEO5XwfemRt20o00z6/5Fc5GMKTqS8UCiA7a5+K+q95bus
	z+wTHxm8/cW5xzjWA/5OEoUYuXncEK7JEPBf7YqfA6Bq8Y7HX58pSh9Bkc7KEsQAbZpmAaBkoKI4l
	6DRzYSywpGMAJMhgD4fFmG6N9R06cpOe4QW8e77GAlpHMFcZTG0vNzuTtzL5DiKSfXqGI7BXO5zok
	CT1WcyCH40VDDpZaCxNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx5VW-0006CH-RA; Mon, 12 Aug 2019 08:16:46 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx5VU-0006Bt-4f
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2019 08:16:45 +0000
Received: by mail-wr1-x444.google.com with SMTP id q12so13508372wrj.12
 for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2019 01:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=MJHxBxh/Q5vo+W76uNGRUJUeN3hwDfWxfMg6P/gBOg0=;
 b=u4QlkRbMDiHfGrjdu436aHZusopdsD94AaT6zXTM3eaZ4y6BosUM0tlaA56X51nN9c
 umI3PH27REA1YdEm/bDm3OE2UI9MGULdMLuGUTvnDBKUBlM+u5BgwEJXKd1SByIuWkrY
 2kv99VeKU+V5QXG9oieP77x7yQgoExIDYXx4vPH8vlEru6HzZ6/p32cpzzObsHy5W3az
 O2VbXSjzdwyFpNJYin4w9mGvGx4NIQqGMocgiLaaq7HHG8qkJjXvIxiD9mAgo53+VJlh
 LCcGJbAa2s5qZg9/JZfFsSRo/t/+spxSIJYxDJW7Gfq3OorZb4uOTIjODwyWsHDkDNXd
 LmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=MJHxBxh/Q5vo+W76uNGRUJUeN3hwDfWxfMg6P/gBOg0=;
 b=UY8CyhSbiDWWB3MSwKBNubjqs0wdMYWsQFGJ2tA15Cqppo8gH/UqVkojoNd68UPG/x
 YFu4SJUNL9fWdAt8XBKNd06jQF1nu2g1uYjRNmAHbgRRHr4yhCbGHCw7Mv9P6ub2HohU
 tWUaYMxZIMb7qjbqBfMUPSlvtQRK2smakMM4NdAaBLhQvlwY0UiYehgALqChjCOyNCFG
 XbqQtzOC6s18b8RNLwuFG0FLo26GYYDgwLBRDmsWbDhbZZ4aP3W+ab+Ghitryptvpf1A
 QRhOnjrnZfjG8AMbAGyPq3THb/oM9HmG/JEtCNSgd8eHooOtbUHQth0mgbq4MsuJm8c2
 u7RQ==
X-Gm-Message-State: APjAAAXRrFx5yOQ1s/iBMLZdBK1ug0GK8BzE7AyjPWdb1APP+KcLmKV2
 5tGV73XhDJ5EBxX6iYMEHF45+w==
X-Google-Smtp-Source: APXvYqyD6fPKryZQTpN9zsdwGV7yS5BKNQZ8tOEeMIPGi0uW8Qmgi+HgiANiv0VmQSgyzgbueGKdzg==
X-Received: by 2002:adf:ec0d:: with SMTP id x13mr40515082wrn.240.1565597802765; 
 Mon, 12 Aug 2019 01:16:42 -0700 (PDT)
Received: from dell ([2.27.35.255])
 by smtp.gmail.com with ESMTPSA id g15sm16420028wrp.29.2019.08.12.01.16.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 12 Aug 2019 01:16:42 -0700 (PDT)
Date: Mon, 12 Aug 2019 09:16:40 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 10/11] mfd: Drop obsolete JZ4740 driver
Message-ID: <20190812081640.GA26727@dell>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190725220215.460-11-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725220215.460-11-paul@crapouillou.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_011644_190748_2B0FEB6B 
X-CRM114-Status: GOOD (  11.42  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, James Hogan <jhogan@kernel.org>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, od@zcrc.me, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Artur Rojek <contact@artur-rojek.eu>, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dmaengine@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyNSBKdWwgMjAxOSwgUGF1bCBDZXJjdWVpbCB3cm90ZToKCj4gSXQgaGFzIGJlZW4g
cmVwbGFjZWQgd2l0aCB0aGUgaW5nZW5pYy1paW8gZHJpdmVyIGZvciB0aGUgQURDLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+IFRlc3Rl
ZC1ieTogQXJ0dXIgUm9qZWsgPGNvbnRhY3RAYXJ0dXItcm9qZWsuZXU+Cj4gLS0tCj4gIGRyaXZl
cnMvbWZkL0tjb25maWcgICAgICB8ICAgOSAtLQo+ICBkcml2ZXJzL21mZC9NYWtlZmlsZSAgICAg
fCAgIDEgLQo+ICBkcml2ZXJzL21mZC9qejQ3NDAtYWRjLmMgfCAzMjQgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMzM0IGRlbGV0aW9u
cygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZmQvano0NzQwLWFkYy5jCgpBcHBs
aWVkLCB0aGFua3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBU
ZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJN
IFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
