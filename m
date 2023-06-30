Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB223EB64D7
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jun 2023 08:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AR2e2zV5D2KvXmUm68CxrG3+gRGoo/mxIEEfHzDD/x0=; b=hmpHL2VQ1bYyl5
	tK+Rr4EhM8bkm9gyI20Q0eOH8UpvGgMaG9C3E2RH7la/v8E/cboMLFjKe1Gkgbtz6KYW9eG/9YYjd
	CVSFcLHDZmpsG2AlSpHTiEMycUiAXlccucRO3+9UdyFn2EG0DKLmBI8dNvAzmXa8cZO065jY//7M+
	w/WDoBzW4fy/wY+XNhNvBDMbM6H63yLs5yjEYgXK70QSqfNV78D80fCTiHyWBSjc7P9SPxM557E5p
	TDGNE2FS9rTuDv/pkCvhytyRTRpAE6T0MrQd0/QfyxiQ86GymliKQ1B4A8ugY41I90t9el/eqo8gk
	mLHmqYmLeMBAI/z9WwhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9nq-003Edr-2q;
	Fri, 30 Jun 2023 08:48:30 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9nn-003EdH-32
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jun 2023 08:48:29 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-991c786369cso194030566b.1
        for <linux-mtd@lists.infradead.org>; Fri, 30 Jun 2023 01:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688114905; x=1690706905;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ND7dNyhnZmormo1qsszJJ6OCUF3X4qBa9aUSKAs9Fo=;
        b=Nlop1p62Zh/45QHOahMCSK6OJcwNbUS62VDJ3r31xRt2FnsftZi2QO4R/NsyYDZa5e
         1zvPGzveJSdE+ybzyfS33E+L5xlInvTspjfDA8z5AUCz7MPpqtqzNuSbwQvlVlAh/s0G
         j0MsN5Z9ygKJyEuzKfccg/FlbUMjrP06pBmizZLbO2k7/lodJQmyVTVIXApbuKOhCa1c
         m1YWjsZE2/1gTfl9AkGS9Ml31kryTbvVgk5VJCD0wtyqwiybaQNTFmFDTwZPzMADUjGV
         WevQQI7HdEm6uiFz1X86+RpgaAC6rKZfsYkS0GEGQjMAw/fVJX2QXxYREi/NH2mhLiYm
         5RtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688114905; x=1690706905;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ND7dNyhnZmormo1qsszJJ6OCUF3X4qBa9aUSKAs9Fo=;
        b=bugnBqFCSAqBcWndXHrGHGMIoM4MXb7VE+an8xSp+MdInoKdFGS8GKv8XXl22jJx+2
         c8FeaIqQyy6DeisdqZfi5WJwHz4LJta4g2LuVEWRZjh7NvjPlvjBcR4isOty0orVIQwm
         kVpAQw6m8qXOnlBjy9HneTokVsD1VVC9EoqQM36tPczaEjkQe0PzfBpe/6ySyGFxfVtF
         EIX6sVQrb/l9jgvAToDPcjS+baPDaijoLelj9UNHF9LoPj98unh6pxkGS8FzOdfTYTh5
         ryR8z4X5Chi+hPN8Ch6/m3VUcJwAHpf1rjUHylK0O2lVJfWBScoLmYWo9DzeL/3jhxBU
         BxxQ==
X-Gm-Message-State: AC+VfDyOHtJc8IX9b7YOHlkUYnz3AxfAZZ2nNsOF+LCmpEOjf+iHsuKS
	ZObnLZbQcmrZCp9xZOywyY9BIA==
X-Google-Smtp-Source: APBJJlH6NE+RJWp/uuJQSzzT7DyyRhteXkuogpPYaAVVGrddaQHIhsAoLXUO3RwlY41Mjc0+tAWgJw==
X-Received: by 2002:a17:906:4dcb:b0:96f:8439:6143 with SMTP id f11-20020a1709064dcb00b0096f84396143mr1384083ejw.40.1688114905435;
        Fri, 30 Jun 2023 01:48:25 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.171])
        by smtp.gmail.com with ESMTPSA id s2-20020a170906960200b0098d2261d189sm7913892ejx.19.2023.06.30.01.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 01:48:24 -0700 (PDT)
Message-ID: <6190c9c4-6d6e-7577-f2a4-8fbede61b405@linaro.org>
Date: Fri, 30 Jun 2023 09:48:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: Avoid setting SRWD bit in SR if WP#
 signal not connected
Content-Language: en-US
To: Michael Walle <michael@walle.cc>,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, git@amd.com, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 amitrkcian2002@gmail.com
References: <20230625100251.31589-1-amit.kumar-mahapatra@amd.com>
 <20230625100251.31589-3-amit.kumar-mahapatra@amd.com>
 <5e5fe22aebe17da4f9ad2c4eaaa8985f@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <5e5fe22aebe17da4f9ad2c4eaaa8985f@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_014827_999024_3497192C 
X-CRM114-Status: GOOD (  18.61  )
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

CgpPbiA2LzI3LzIzIDA3OjE0LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEFtIDIwMjMtMDYtMjUg
MTI6MDIsIHNjaHJpZWIgQW1pdCBLdW1hciBNYWhhcGF0cmE6Cj4+IFNldHRpbmcgdGhlIHN0YXR1
cyByZWdpc3RlciB3cml0ZSBkaXNhYmxlIChTUldEKSBiaXQgaW4gdGhlIHN0YXR1cwo+PiByZWdp
c3RlciAoU1IpIHdpdGggV1AjIHNpZ25hbCBvZiB0aGUgZmxhc2ggbGVmdCBmbG9hdGluZyBvciB3
cm9uZ2x5IHRpZWQgdG8KPj4gR05EICh0aGF0IGluY2x1ZGVzIGludGVybmFsIHB1bGwtZG93bnMp
LCB3aWxsIGNvbmZpZ3VyZSB0aGUgU1IgcGVybWFuZW50bHkKPj4gYXMgcmVhZC1vbmx5LiBJZiBX
UCMgc2lnbmFsIGlzIGxlZnQgZmxvYXRpbmcgb3Igd3JvbmdseSB0aWVkIHRvIEdORCwgYXZvaWQK
Pj4gc2V0dGluZyBTUldEIGJpdCB3aGlsZSB3cml0aW5nIHRoZSBTUiBkdXJpbmcgZmxhc2ggcHJv
dGVjdGlvbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW1pdCBLdW1hciBNYWhhcGF0cmEgPGFtaXQu
a3VtYXItbWFoYXBhdHJhQGFtZC5jb20+Cj4+IC0tLQo+PiDCoGRyaXZlcnMvbXRkL3NwaS1ub3Iv
Y29yZS5jIHwgMyArKysKPj4gwqBkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuaCB8IDEgKwo+PiDC
oGRyaXZlcnMvbXRkL3NwaS1ub3Ivc3dwLmPCoCB8IDkgKysrKysrKy0tCj4+IMKgMyBmaWxlcyBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUu
Ywo+PiBpbmRleCAwYmIwYWQxNGEyZmMuLjUyMGY1YWI4NmQyYiAxMDA2NDQKPj4gLS0tIGEvZHJp
dmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3Jl
LmMKPj4gQEAgLTI4NjQsNiArMjg2NCw5IEBAIHN0YXRpYyB2b2lkIHNwaV9ub3JfaW5pdF9mbGFn
cyhzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+PiDCoMKgwqDCoCBpZiAoZmxhZ3MgJiBOT19DSElQX0VS
QVNFKQo+PiDCoMKgwqDCoMKgwqDCoMKgIG5vci0+ZmxhZ3MgfD0gU05PUl9GX05PX09QX0NISVBf
RVJBU0U7Cj4+Cj4+ICvCoMKgwqAgaWYgKG9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwgIm5vLXdw
IikpCj4+ICvCoMKgwqDCoMKgwqDCoCBub3ItPmZsYWdzIHw9IFNOT1JfRl9OT19XUDsKPj4gKwo+
IAo+IFBsZWFzZSBwdXQgaXQgYmVsb3cgdGhlIG9mX3Byb3BlcnR5X3JlYWRfYm9vbCgpIHdoaWNo
IGlzIGFscmVhZHkKPiB0aGVyZSwganVzdCB0byBrZWVwIHRoaW5ncyBzb3J0ZWQuCj4gCj4+IMKg
wqDCoMKgIGlmIChmbGFncyAmIFNQSV9OT1JfUldXICYmIG5vci0+aW5mby0+bl9iYW5rcyA+IDEg
JiYKPj4gwqDCoMKgwqDCoMKgwqDCoCAhbm9yLT5jb250cm9sbGVyX29wcykKPj4gwqDCoMKgwqDC
oMKgwqDCoCBub3ItPmZsYWdzIHw9IFNOT1JfRl9SV1c7Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9zcGktbm9yL2NvcmUuaCBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5oCj4+IGluZGV4
IDRmYjVmZjA5YzYzYS4uNTViNWU3YWJjZTZlIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9z
cGktbm9yL2NvcmUuaAo+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuaAo+PiBAQCAt
MTMyLDYgKzEzMiw3IEBAIGVudW0gc3BpX25vcl9vcHRpb25fZmxhZ3Mgewo+PiDCoMKgwqDCoCBT
Tk9SX0ZfU1dQX0lTX1ZPTEFUSUxFwqDCoMKgID0gQklUKDEzKSwKPj4gwqDCoMKgwqAgU05PUl9G
X1JXV8KgwqDCoMKgwqDCoMKgID0gQklUKDE0KSwKPj4gwqDCoMKgwqAgU05PUl9GX0VDQ8KgwqDC
oMKgwqDCoMKgID0gQklUKDE1KSwKPj4gK8KgwqDCoCBTTk9SX0ZfTk9fV1DCoMKgwqDCoMKgwqDC
oCA9IEJJVCgxNiksCj4gCj4gU2VlIHRoZSBjb21tZW50IHJpZ2h0IGFib3ZlIHRoaXMgZW51bSA6
Lwo+IAo+PiDCoH07Cj4+Cj4+IMKgc3RydWN0IHNwaV9ub3JfcmVhZF9jb21tYW5kIHsKPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3dwLmMgYi9kcml2ZXJzL210ZC9zcGktbm9y
L3N3cC5jCj4+IGluZGV4IDBiYTcxNmU4NDM3Ny4uY2ZhYmE0MWQ3NGQ2IDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL210ZC9zcGktbm9yL3N3cC5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
c3dwLmMKPj4gQEAgLTIxNCw4ICsyMTQsMTMgQEAgc3RhdGljIGludCBzcGlfbm9yX3NyX2xvY2so
c3RydWN0IHNwaV9ub3IgKm5vciwgbG9mZl90IG9mcywgdWludDY0X3QgbGVuKQo+Pgo+PiDCoMKg
wqDCoCBzdGF0dXNfbmV3ID0gKHN0YXR1c19vbGQgJiB+bWFzayAmIH50Yl9tYXNrKSB8IHZhbDsK
Pj4KPj4gLcKgwqDCoCAvKiBEaXNhbGxvdyBmdXJ0aGVyIHdyaXRlcyBpZiBXUCBwaW4gaXMgYXNz
ZXJ0ZWQgKi8KPj4gLcKgwqDCoCBzdGF0dXNfbmV3IHw9IFNSX1NSV0Q7Cj4+ICvCoMKgwqAgLyoK
Pj4gK8KgwqDCoMKgICogRGlzYWxsb3cgZnVydGhlciB3cml0ZXMgaWYgV1AjIHBpbiBpcyBuZWl0
aGVyIGxlZnQgZmxvYXRpbmcgbm9yCj4+ICvCoMKgwqDCoCAqIHdyb25nbHkgdGllZCB0byBHTkQo
dGhhdCBpbmNsdWRlcyBpbnRlcm5hbCBwdWxsLWRvd25zKS4KPiAKPiBuaXQ6IHNwYWNlIG1pc3Np
bmcKPiAKPiBPdGhlcndpc2UgbG9va3MgZ29vZC4KPiAKClRoYW5rcywgTWljaGFlbC4KCkFtaXQs
IHdvdWxkIGJlIGdvb2QgaWYgeW91IGNhbiBhZGRyZXNzIE1pY2hhZWwncyBjb21tZW50cyBhbmQK
cmVzdWJtaXQuIElmIG5vdCwgSSdsbCBhbWVuZCB0aGUgcGF0Y2ggYnkgbXlzZWxmIHdoZW4gYXBw
bHlpbmcuCgpDaGVlcnMsCnRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
