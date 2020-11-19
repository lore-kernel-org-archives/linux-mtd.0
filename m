Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25713C2D0E4
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 09:15:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98D3020679
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 09:15:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cgxDUAMq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aHOJude4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98D3020679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8sKxtgdc7uPwjJht/znccuaIxXna2NR0PQgDJoPxH4=; b=cgxDUAMqzveGzqQgwJnoFLV8OL
	Mlaj3XPNB2LJNPBAaFHaw7oH2uhltMI1gJxFqLZE1SBKkNWgWOe2uq6yO5/2btkVimnhjHcfLH/Jx
	NPmmHnhgIochrSYNWBXvR+8PO3Owynyd7wbqFTAtV9f4vzX/uaaQH9VvqMZlqVJ0jcXfVj1qIV7xF
	p6Ru3NMw+M//qePebutpqneRopOuf0m85Cs3JdzsOiqm/yyO18EW27VoEpqPXbBt85A5QcI8d8on+
	SLC/rk4w3rb7tvPr9obC4lX/yHLY1qApkkx4uxW9RZzP6i25Edrm2MdUUJFcFKkc/4e5QnodGXIql
	PZA+h3qw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfg15-0005LT-B4; Thu, 19 Nov 2020 09:14:11 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfg11-0005KV-L1
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 09:14:09 +0000
Received: by mail-wm1-x342.google.com with SMTP id p22so6417147wmg.3
 for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2020 01:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=q1kCKO2Wajos9XCYv+42QajKl+b5nwdS+s4fQXMXkC0=;
 b=aHOJude4XUYBYjMHIXIqvPOfAJzFbbFBGbY5wBxiUcWK3+/nHouZjtA7/WMBcAkiHz
 gQ66gQ7MTko4w0yV/MsSX8nZ3MP4plP2aiBbnPMAr5ojbCMY46+sYgtkBjND7pnVCjRb
 zah9CpF0jKDxPeNgDaIUtGFyOE9Cc7nsfubxmbozzEaGLgSpaGNir0A6W6RT7UgVT/hD
 EBMLBiBueBBra7fy1k5YpGhKiUFbLGn+3spcyNr3MhqRp/M9VDqyjgSuGM8st9+2qzba
 YujN/QBFgpxCTLjZjZxq1gOMMNy4Ecw6Jn57htDgPDXmo0xWVEzQgeyVpZNbOZbxwRm/
 CsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=q1kCKO2Wajos9XCYv+42QajKl+b5nwdS+s4fQXMXkC0=;
 b=cQ5ISn5snnquiEOJcQkColUNYRCMBhoNT6Bby3wxuTko67OwxTgrZIC8DZWUGR0/k0
 hKkZv9e4eBTy0ILuzErBl/8tQoFMxTDC+miFoEioFa0IGglx+dLPkYbCVEpvueSrxXBU
 bAZPto+kZ4keAadA7ME3H1S/agdsNQdl2LydldvO8niILCSy+oVrIcvdHZbrCK9eCdQg
 lO3Lv00pGuNPO9H/Jkh/3sgXcXHoTYpyXUuNBL2RQcuqR3P31rZBAg3qVseeFQf3fnje
 GFLMcKl0aYsGcFmLCkYjwlqY3nTfJeW9JEXZWA0vPK/A9I3r6C0KJQBEUFRvRe8wF4Li
 M5lA==
X-Gm-Message-State: AOAM532UMizuM0ThpkiHKeiWoWtabJg/Xd5MP2tt2ZkHKvRNKOl55ARj
 gg6efAN8dYLSISyPcNzd4eiLMw==
X-Google-Smtp-Source: ABdhPJwE7lzWIduefdcr1ejwZbR/vePOO0xyNX6/Qw/49e6vJ75qt37PcLbLMcgnz+VSxsYH51hUiA==
X-Received: by 2002:a1c:6306:: with SMTP id x6mr2659954wmb.154.1605777244745; 
 Thu, 19 Nov 2020 01:14:04 -0800 (PST)
Received: from dell ([91.110.221.241])
 by smtp.gmail.com with ESMTPSA id g186sm24648747wma.1.2020.11.19.01.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 01:14:03 -0800 (PST)
Date: Thu, 19 Nov 2020 09:14:02 +0000
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nicolas Pitre <nico@fluxnic.net>, Thomas Gleixner <gleixner@linutronix.de>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 01/23] mtd: mtdpart: Fix misdocumented function
 parameter 'mtd'
Message-ID: <20201119091402.GY1869941@dell>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
 <20201106213655.1838861-2-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106213655.1838861-2-lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_041407_971812_5557E197 
X-CRM114-Status: GOOD (  13.84  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAwNiBOb3YgMjAyMCwgTGVlIEpvbmVzIHdyb3RlOgoKPiBGaXhlcyB0aGUgZm9sbG93
aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKPiAKPiAgZHJpdmVycy9tdGQvbXRkcGFy
dC5jOjMwMDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnbXRkJyBub3Qg
ZGVzY3JpYmVkIGluICdfX210ZF9kZWxfcGFydGl0aW9uJwo+ICBkcml2ZXJzL210ZC9tdGRwYXJ0
LmM6MzAwOiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdwcml2JyBkZXNjcmlw
dGlvbiBpbiAnX19tdGRfZGVsX3BhcnRpdGlvbicKPiAKPiBDYzogTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4KPiBDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJk
QG5vZC5hdD4KPiBDYzogVmlnbmVzaCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJAdGkuY29tPgo+IENj
OiBOaWNvbGFzIFBpdHJlIDxuaWNvQGZsdXhuaWMubmV0Pgo+IENjOiBUaG9tYXMgR2xlaXhuZXIg
PGdsZWl4bmVyQGxpbnV0cm9uaXguZGU+Cj4gQ2M6IERhdmlkIFdvb2Rob3VzZSA8ZHdtdzJAaW5m
cmFkZWFkLm9yZz4KPiBDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBTaWduZWQt
b2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKSXMgdGhlcmUgYW55dGhp
bmcgZWxzZSB5b3UgbmVlZCBmcm9tIG1lIE1pcXVlbCwgb3IgZG9lcyB0aGUgc2V0IG5vdwpsb29r
IHN1aXRhYmxlIGZvciBpbmNsdXNpb24/CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlv
ciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVu
IHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBU
d2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
