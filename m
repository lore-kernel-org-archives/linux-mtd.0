Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EA2C46CA2
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 18:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2p3G+dnJJ/tPn4oTgXuAN0+jScL1SY6AqQyfKXHlC60=; b=jla0xEsrzd0Im1
	0WhufW+ypdkM/fMvm+7qyqSwz5xtt0YByzTDtULp5LOMh2E6mF8WppN/5z1NMZ0f/rowXt+2YqGks
	R80yXPsAGPU1GzEMhZibfBaeOZ7iCgbOJI06vy35qRcgajXODkOFrthhDdEIyWfOwzk9pE1gizpzI
	HRdQQ75eH2StXSHAOMnYAWYM7RBEIfUSOf3BQg8TiuUA5Wga3Y+kFeY7tlSFQCVpffn/EJJx7Y+x8
	YGy0zAge+h+4M50tz4lHli1Jv552kwGL1VVHRWFnh4O7epKs1Jw/KmESSuibVpr6O92eAcSPSDy4N
	Z13VQEAeFl8BODQYMD8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFee7-00FALy-0G;
	Tue, 19 Dec 2023 18:16:47 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFee3-00FAJc-07;
	Tue, 19 Dec 2023 18:16:44 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a2339939573so388034866b.3;
        Tue, 19 Dec 2023 10:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703009799; x=1703614599; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CPjNNGRVl834dbVMwON3kgyUWofS8voa+GRP3e8W41E=;
        b=ezGt/BASlXLx4JGTzMKAlu/Y0jMGXhEc+pQ+OUSdi/ZURDMh+Ruj9nYe/d2ZOC/lK7
         EXITzulVlhCGVGdAR2ssy8rGKJjjWrKIl9QoYXoLP0k1T/S9+F166BGBa6OctEimeKqv
         bqam6PTPnKI+2J6kO0z8WVUKN4pNQ/CFFYtnrsAkU2SESkPb+bugDqyomNe04JWREy0e
         G/Ppf1FsLvgUkqpXEAznctJwebCdwf66qoGE/8CWbGPq+T+m8R49kJpDPrlVd3DPaUl1
         20Zg7002RQl5ULCU0CNz74wZ5aRZk5OMY7UbzE8O3T1DupmgDj6bty/Bm6abPs7FJ+EW
         yheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703009799; x=1703614599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CPjNNGRVl834dbVMwON3kgyUWofS8voa+GRP3e8W41E=;
        b=FxvvpqX7JIssvByJnv2q7jG568jbBAspibEnu9ho+bRVnBdQgPjAYDlyMvReCUsaSu
         6qg45bl6t6yi3MhCllssDmP6f+B6XekFBVnDonf4y20+sim5TgwjlBIenFs5EYLubOWt
         7UbjwwltOt9JGEND40d6LbojO5lOgaOa3GprHrjsM9LJughoNbJtr1FbvJvfBQb+kyj9
         8IX9DgEHkXihZ2AVNn6Qyx8FcgZ3GO/8U2YGcGVcw2dCDuGAxztbjoRxnDlstpKteoBr
         mzb2fZI5fLFNe6JyOMZw/fsd5J5S4tn7pBAr5W9Sde84YuQIzyvdoU+hiQ0p7Jx98ick
         63qA==
X-Gm-Message-State: AOJu0YzEkWBpSlJhv3QlSS0OGB8BASS/3lxGNr9tpe4zRI7pRLUqUXIS
	xLV6pDH8RD5qy5ItxV8Dwl0=
X-Google-Smtp-Source: AGHT+IEV+DYh2x5q129WtIIGrMyHM5JcnCzXLNDYXZfxxn9D5eLuxUTi3tapArS0fRpHMnXkfNXkDA==
X-Received: by 2002:a17:906:7481:b0:a23:1c51:40a6 with SMTP id e1-20020a170906748100b00a231c5140a6mr3630903ejl.104.1703009799151;
        Tue, 19 Dec 2023 10:16:39 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id vv8-20020a170907a68800b00a1d2b0d4500sm15648822ejc.168.2023.12.19.10.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 10:16:38 -0800 (PST)
Message-ID: <1b5d4c36-9963-476c-8edf-e807beceda80@gmail.com>
Date: Tue, 19 Dec 2023 19:16:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/5] nvmem: u-boot-env: use more nvmem subsystem
 helpers
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, u-boot@lists.denx.de,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20231219174025.15228-1-zajec5@gmail.com>
 <20231219174025.15228-3-zajec5@gmail.com>
 <2023121929-salami-pessimist-c943@gregkh>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <2023121929-salami-pessimist-c943@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_101643_075063_2704E94E 
X-CRM114-Status: UNSURE (   9.34  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTkuMTIuMjAyMyAxOToxMywgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOgo+IE9uIFR1ZSwg
RGVjIDE5LCAyMDIzIGF0IDA2OjQwOjIzUE0gKzAxMDAsIFJhZmHFgiBNacWCZWNraSB3cm90ZToK
Pj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+Pgo+PiAxLiBVc2Ug
bnZtZW1fZGV2X3NpemUoKSBhbmQgbnZtZW1fZGV2aWNlX3JlYWQoKSB0byBtYWtlIHRoaXMgZHJp
dmVyIGxlc3MKPj4gICAgIG10ZCBkZXBlbmRlbnQKPj4gMi4gVXNlIG52bWVtX2FkZF9vbmVfY2Vs
bCgpIHRvIHNpbXBsaWZ5IGFkZGluZyBOVk1FTSBjZWxscwo+IAo+IFNob3VsZG4ndCB0aGlzIGJl
IDIgZGlmZmVyZW50IHBhdGNoZXM/CgpJIHVzZWQgdG8gbWFpbnRhaW5lcnMgY29tcGxhaW5pbmcg
bXkgcGF0Y2hlcyBhcmUgdG9vIHNtYWxsIGFuZCBub3QgdGhlCm90aGVyIHdheSA7KSBJIHRoaW5r
IGl0IGhhcHBlbmVkIHR3byBvciB0aHJlZSB0aW1lcyB3aXRoIG10ZCBzdWJzeXMuCgpTdXJlLCBJ
IGNhbiBzcGxpdCBpdC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
