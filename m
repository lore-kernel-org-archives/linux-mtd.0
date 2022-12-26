Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67C5C3DA79
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Dec 2022 14:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bYW8P3a5WSfm7N9SI1X8sYUD6vUO+Yc8Mxq540/kewY=; b=XbRPxUI+KYFC4v
	kddMYeOr96FthkO0gyn1D8UyUxWpSZQMst3X+yZWoDl+kd6ZhI39PXCyfWonA+yZT1oVWdDdTtd8s
	BJC/F60Zp6IEHvqOv2uLzgFmfks6N1kGrdnd9U8OxhRFcv4/OF7XRuLLdxvtODFADxLNHJNlvj3lD
	HaeuKQBnIgx+qXrNBkL0I4+Tk7iDoR6fyodnAxSMGdmbq0zne8LJ6SMMyLGfTcYc1nYnsXyDvkFgV
	enUwP+3sfiFT/Dl1XneJEmLrgKzdbMmjM4y+OvYxar0TtL5KoK5fSQkZ4DMGZmArQTK8Ghcw8Izeg
	sL54Ado/JvwiHlqfoO3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9oMt-004eP7-PG; Mon, 26 Dec 2022 14:22:19 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9oMm-004eEI-GB
	for linux-mtd@lists.infradead.org; Mon, 26 Dec 2022 14:22:14 +0000
Received: by mail-ed1-x532.google.com with SMTP id q15so13995190edb.1
        for <linux-mtd@lists.infradead.org>; Mon, 26 Dec 2022 06:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G+7qtVYjcqPvE/k1QEDEyz+eQy6Hwuj22SxfubsIkZo=;
        b=QNaZe3TYok5E4UMDykUVs1doSqbl+yF9VyivY/zRr6IQnDZc5rsv03mxU+CHu4WafX
         cBoh45oOUzxF22snszZEwDCw9m2HV8LR0u9J1PyQ08WL5WhnYejulbrjUkzKOlb8gc7a
         GzVE4b5amh8Bm/nSDFtX82NJsQ9jxwO5FjhEYKpxNJiZ6RwRmlCMtXiEo1YpVP2dQQfb
         dOt8FnYp9LAW7x2UHL2X1koeF4tUsQjpGMOhPolMaKepoV7h2TB1jUlvM/l58cLzskOB
         MixrBiyNSF8+BR8udIRXu4H+kQKlcszmobTbThAuYAfHMBNp03yopvtlwKvf+E15NFkm
         AAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G+7qtVYjcqPvE/k1QEDEyz+eQy6Hwuj22SxfubsIkZo=;
        b=taTEcq8nGU3EY48OufULEsK4TVfpQlV88gYNvcHn4yF0d2KX5aDeUVtZQYh0mlgVD5
         cSdDBTO05nFXA+xIsyyl7Epyw9jQ3+Jp2zdYIhRa792Rai0Qt0oz/G+pgXujg8CYlpx+
         vyTJKMC7M8r9SNEvkkyWgvUcNRmTsek9oseNavxgl/Wdu8vxnqL6LxYzcY9ratGrBQnH
         i9JzXGWRDm9gdbsme2V7PrWZyNP7SxohjhzZGynHbbDkTmjEQkLKdUEmhYm9NkL2XYMa
         HpPH3qYPHZWBnSTGpQTEXcD5TqzCEyLcY0mBQT8iKxAukTQVgHFjOLxupFvknBstXxH7
         g/kA==
X-Gm-Message-State: AFqh2kqiBeGfA7LHjg5KgGe8KsLsZOANrS/BUNh2rEvPSyBRJjp4eXup
	dbYqvme6siPb5EYNG5P7ww6SDQ==
X-Google-Smtp-Source: AMrXdXtsIOWE06vpaTx7Hf5jTPvQqXas9JhYDADYc43XOYx0B8ZZsf6FzMSbIBcmmS5uIo/d3P8wSg==
X-Received: by 2002:a05:6402:390b:b0:465:f6a9:cb7b with SMTP id fe11-20020a056402390b00b00465f6a9cb7bmr15926698edb.12.1672064525630;
        Mon, 26 Dec 2022 06:22:05 -0800 (PST)
Received: from [192.168.0.173] ([82.77.81.131])
        by smtp.gmail.com with ESMTPSA id s14-20020a056402014e00b0048263de5aa6sm3622014edu.75.2022.12.26.06.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Dec 2022 06:22:04 -0800 (PST)
Message-ID: <32ddf1f8-eda1-da00-a3dc-901c4ee61217@linaro.org>
Date: Mon, 26 Dec 2022 16:22:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] [v2] mtd: cfi: allow building spi-intel standalone
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Arnd Bergmann <arnd@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Michael Walle <michael@walle.cc>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mauro Lima <mauro.lima@eclypsium.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221220141352.1486360-1-arnd@kernel.org>
 <cae6328b-5204-a1ab-810d-8fb64e466453@linaro.org>
 <20221220165701.5696df1a@xps-13>
 <026225c6-f17f-e9da-b7c0-5d3473a97e89@linaro.org>
In-Reply-To: <026225c6-f17f-e9da-b7c0-5d3473a97e89@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_062212_961245_6C882159 
X-CRM114-Status: GOOD (  13.43  )
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

CgpPbiAyMS4xMi4yMDIyIDA4OjQ5LCBUdWRvciBBbWJhcnVzIHdyb3RlOgo+IAo+IAo+IE9uIDIw
LjEyLjIwMjIgMTc6NTcsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+IEhpIFR1ZG9yLAo+Pgo+IAo+
IEhpLAo+IAo+PiB0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gVHVlLCAyMCBEZWMg
MjAyMiAxNzo0NDo0OSArMDIwMDoKPj4KPj4+IEhpLCBBcm5kLAo+Pj4KPj4+IE9uIDIwLjEyLjIw
MjIgMTY6MTMsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4+Pj4gRnJvbTogQXJuZCBCZXJnbWFubiA8
YXJuZEBhcm5kYi5kZT4KPj4+Pgo+Pj4+IFdoZW4gTVREIG9yIE1URF9DRklfR0VPTUVUUlkgaXMg
ZGlzYWJsZWQsIHRoZSBzcGktaW50ZWwgZHJpdmVyCj4+Pj4gZmFpbHMgdG8gYnVpbGQsIGFzIGl0
IGluY2x1ZGVzIHRoZSBzaGFyZWQgQ0ZJIGhlYWRlcjoKPj4+Pgo+Pj4+IGluY2x1ZGUvbGludXgv
bXRkL2NmaS5oOjYyOjI6IGVycm9yOiAjd2FybmluZyBObyBDT05GSUdfTVREX0NGSV9JeCAKPj4+
PiBzZWxlY3RlZC4gTm8gTk9SIGNoaXAgc3VwcG9ydCBjYW4gd29yay4gWy1XZXJyb3I9Y3BwXQo+
Pj4+IMKgwqDCoMKgIDYyIHwgI3dhcm5pbmcgTm8gQ09ORklHX01URF9DRklfSXggc2VsZWN0ZWQu
IE5vIE5PUiBjaGlwIAo+Pj4+IHN1cHBvcnQgY2FuIHdvcmsuCj4+Pj4KPj4+PiBsaW51eC9tdGQv
c3BpLW5vci5oIGRvZXMgbm90IGFjdHVhbGx5IG5lZWQgdG8gaW5jbHVkZSBjZmkuaCwgc28KPj4+
PiByZW1vdmUgdGhlIGluY2x1c2lvbiBoZXJlIHRvIGZpeCB0aGUgd2FybmluZy4gVGhpcyB1bmNv
dmVycyBhCj4+Pj4gbWlzc2luZyAjaW5jbHVkZSBpbiBzcGktbm9yL2NvcmUuYyBzbyBhZGQgdGhh
dCB0aGVyZSB0bwo+Pj4+IHByZXZlbnQgYSBkaWZmZXJlbnQgYnVpbGQgaXNzdWUuCj4+Pj4KPj4+
PiBGaXhlczogZTIzZTVhMDVkMWZkICgibXRkOiBzcGktbm9yOiBpbnRlbC1zcGk6IENvbnZlcnQg
dG8gU1BJIE1FTSIpCj4+Pj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4KPj4+Cj4+PiBMb29rcyBnb29kIHRvIG1lLiBJJ2xsIGxldCB0aGUgbGludXgtMGRheSBi
b3QgcnVuIG92ZXIgaXQgYW5kIGFwcGx5IGl0Cj4+PiBvbmNlIC1yYzEgaXMgb3V0Lgo+Pgo+PiBU
aGUgaXNzdWUgc29tZXRpbWVzIHByb2R1Y2VzIGJ1aWxkIGVycm9ycywgc2hhbGwgSSBzZW5kIGl0
IHRocm91Z2ggYQo+PiBmaXhlcyBQUiBpbnN0ZWFkPwo+Pgo+IAo+IFllcywgdGhhdCBJIHdhcyB0
aGlua2luZyBhYm91dC4KPiAKClNlZW1zIHRoYXQgSSBzaG91bGRuJ3QgcHVzaCB0byBtdGQvZml4
ZXMsIHNvOgpSZXZpZXdlZC1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8u
b3JnPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
