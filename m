Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5C5C3ABA9
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Apr 2025 09:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oIK8ZyFUe9IT8fr8wOLb5fR/FXI69VdFrBguxCHdMDs=; b=YRtpN0bASBwRcN
	OholGtYdXIKy5gkNztHqeLxUx88ThwJRsb7d0uFXvShrI6QKEqvhpWLs9nhpdHygYGnKRDXget/0H
	iKXczDcCDM/iStg5yFwIRgPH5ulYc2wYYzZg9Impj5QUXytX11hqeoEp8ad+6KG9j4IhRKwWb+xLu
	y3U8Acw//AZnT1YHI00MwYcHClzXauFd1psFEgGhaIMvhnQ63tsF7lGax0koajllxWgGtfRV1kElQ
	qQWnH3xFgoLvgMuybiBHpONX/W3X/Uhf1Asswelt4wjtNKRY3ILxoPDd+34Lfd2TYXDstdcGBF4tc
	3nOpJpuaJWZnRKHo12BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hAt-000000096mP-23il;
	Tue, 29 Apr 2025 09:22:47 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hAq-000000096lB-2qJb
	for linux-mtd@lists.infradead.org;
	Tue, 29 Apr 2025 09:22:46 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso11145409a12.3
        for <linux-mtd@lists.infradead.org>; Tue, 29 Apr 2025 02:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745918563; x=1746523363; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m5ETyMiENat5qiMjmd1YZvsOVUVueP+Yn8LaPAo84g8=;
        b=gxh00iNDwqay9qEG1iLNDBTFw8yod8/Z+hj9b9YjS8k0vSvvpjyIL1IswSd+YNGWCa
         bwWH49TE9Gdk6rTX4Er9XbhwHaLAGx9yCgBKOFtiiOk/6CPEmYEWohxJARWq+OMIZANo
         eymFUkYByRjI+2rFMrgGOCgOYtoXh7eFz97orLx5NPA1KqPpHsaMRNW9LFbTqLUB+Chd
         yZ2ya6soJ1Y5aiHGNoVtrsa0PNBOVZy49iWd2b9tAv5xN/Fd++QN2W6WeX1kaz7YU/3H
         Uiz5S97ALfMnMpuVEj7s2OBgvNtcwTKp9Rek7KfHULW2pnkHTmQB3B28nt6EgPUNfsqR
         8xwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918563; x=1746523363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m5ETyMiENat5qiMjmd1YZvsOVUVueP+Yn8LaPAo84g8=;
        b=GSs+8hfl1SZ5uzRUrBQqme3Ppe2G7OahVElm5Npmxbro31pzAmk8fRYk6/UWCi+gbV
         keALtx1FRHzBGaPIaj/o2slG3TGKjtjEhjBEIi4+yUeUXfhtXaJ9ue6jok1McIIEhLSJ
         Z7JqL47aBLTHVHJ+5OdD1RWHT3Uc4hqj/xUgilURvM4xXK7XJmJBhaHjziEW9BhN8ZaL
         70lY6abfejwSD/ZZjhmwC36pqGeKtulZVG5un3YLO4llBrNLzTebbdhiRItNIMvRVQpk
         o7JQA0cKMcgc7VpPe8BIiLUjZlnM79zupeIBfU7evOVptETcsgWj3jXrsgIF1XI9SAbj
         6Hnw==
X-Forwarded-Encrypted: i=1; AJvYcCUrR6V6RRpd1O0lAyRw+xDNdhE7uuqIcBYiiGjZrRi2Is1ud5ezQbVQGm+nYc3quoIaC6p95o/k39Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2z/+Auc24d6lVgk26fGKQGGYQKs/3YBNIGiWymuPkk2/sewQu
	LrWQQPUWQJaisLZHVrDFYB1MGqCS7VEIgcUq4Wj1LFBv0/MspM8ANVwN18L3qwY=
X-Gm-Gg: ASbGncuIisxx+OJLA2OYWfNDKGFviv1TnC0s3kH05xyn2Qas/jGAbeWYp36dKl/ZZaL
	CGkttg1fucdfzW68kW/sfRdGdqdF3swGU4A4nAh7lGzLuXRWUi84vi715WTcED+m0xbyBrt68gg
	BI1ekQFn8Cv+XdDwnUT34VKGvuC1R90R+lLsdQyQB2OJzh6QyGSuaYahT0VqfKxIlv1/D+DVMDJ
	Mwzju4b55tLJaHaBPfW/d8wl4SPK7h490sNxXCyWpa1DtTpcWgJvEOE3JZpAVTtQKICs+6HjrA7
	P8aSqyaFvg3IMlcEfMAQoG45ryAS20YtH525ABX904NDDlkA5A==
X-Google-Smtp-Source: AGHT+IGT47/KY+DVWifRNKDHeFCplx4qH6Vau0eK+jyg2W7wdu+e7jzwFboA4F0/aGKRwgS/kS3D5w==
X-Received: by 2002:a05:6402:2b92:b0:5f6:44de:d97f with SMTP id 4fb4d7f45d1cf-5f83b24deeemr2182482a12.25.1745918562886;
        Tue, 29 Apr 2025 02:22:42 -0700 (PDT)
Received: from [192.168.0.14] ([82.76.212.167])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f66b7sm7340433a12.46.2025.04.29.02.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 02:22:42 -0700 (PDT)
Message-ID: <10b40148-b949-442d-9d43-0db09517269a@linaro.org>
Date: Tue, 29 Apr 2025 10:22:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] mtd: spi-nor: core: avoid odd length/address
 writes in 8D-8D-8D mode
To: Luke Wang <ziniu.wang_1@nxp.com>,
 "pratyush@kernel.org" <pratyush@kernel.org>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "michael@walle.cc" <michael@walle.cc>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "p.yadav@ti.com" <p.yadav@ti.com>, "richard@nod.at" <richard@nod.at>,
 "vigneshr@ti.com" <vigneshr@ti.com>, Bough Chen <haibo.chen@nxp.com>,
 Han Xu <han.xu@nxp.com>
References: <DU2PR04MB85678048FE8B475B1E323E0AED802@DU2PR04MB8567.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DU2PR04MB85678048FE8B475B1E323E0AED802@DU2PR04MB8567.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_022244_714964_48216B43 
X-CRM114-Status: GOOD (  13.76  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiA0LzI5LzI1IDEwOjAzIEFNLCBMdWtlIFdhbmcgd3JvdGU6Cj4gSGkgUHJhdHl1c2gsCj4g
Cj4gwqAKPiAKPiBJJ20gZm9sbG93aW5nIHVwIG9uIHRoaXMgcGF0Y2ggc2VyaWVzIFsxXSBBdm9p
ZCBvZGQgbGVuZ3RoL2FkZHJlc3MgcmVhZC8KPiB3cml0ZXMgaW4gOEQtOEQtOEQgbW9kZS4gV2hp
bGUgc29tZSBvZiB0aGUgc2VyaWVzIGhhcyBiZWVuIG1lcmdlZCwgdGhlCj4gcGF0Y2ggNC02IHJl
bWFpbnMgdW5tZXJnZWQuCj4gCj4gwqAKPiAKPiBJbiBmYWN0LCB3ZSBhbHNvIGVuY291bnRlcmVk
IHNpbWlsYXIgcmVhZC93cml0ZSBpc3N1ZSBvZiBvZGQgYWRkcmVzcy8KPiBsZW5ndGggd2l0aCBO
WFAgRlNQSSBjb250cm9sbGVyIChzcGktbnhwLWZzcGkuYykuIEN1cnJlbnRseSwgd2UgaGFuZGxl
ZAo+IHRoZSBvZGQgYWRkcmVzcy9sZW5ndGggaW4gdGhlIGNvbnRyb2xsZXIgZHJpdmVyLCBidXQg
SSB0aGluayB0aGlzIHNob3VsZAo+IGJlIGEgY29tbW9uIGlzc3VlIGluIHRoZSBvY3RhbCBkdHIg
bW9kZS4gV2FzIHRoZXJlIGEgdGVjaG5pY2FsIHJlYXNvbgo+IGZvciBub3QgbWVyZ2luZyB0aGUg
Y29yZSBsYXllciBzb2x1dGlvbj8KCkkgZ3Vlc3MgSSBzdHVtYmxlZCBvbiB0aG9zZSBzbWFsbCBj
b21tZW50cyBhbmQgZGlkIG5vdCBjb25zaWRlciB0aGUKZ3JlYXRlciBiZW5lZml0IG9mIHRha2lu
ZyB0aGUgcGF0Y2hlcy4gTm8gb25lIGNhcmVkIGFuZCB3ZSBmb3Jnb3QgYWJvdXQKaXQuIFBsZWFz
ZSBhZGRyZXNzIHRoZSBjb21tZW50cyBhbmQgcmVzdWJtaXQuCj4gCj4gwqAKPiAKPiBbMV0gT3Jp
Z2luYWwgc3VibWlzc2lvbjogwqBodHRwczovL2xvcmUua2VybmVsLm9yZy8KPiBhbGwvMjAyMTA1
MzExODE3NTcuMTk0NTgtMS1wLnlhZGF2QHRpLmNvbS8gPGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
Lwo+IGFsbC8yMDIxMDUzMTE4MTc1Ny4xOTQ1OC0xLXAueWFkYXZAdGkuY29tLz4KPiAKPiDCoAo+
IAo+IFJlZ2FyZHMsCj4gCj4gTHVrZSBXYW5nCj4gCj4gwqAKPiAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
