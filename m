Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4928ECAAD6
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Aug 2022 10:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vmehqqKuEAWs7zKxALYkYEoCm2Z3axNebo8vlJCClYM=; b=NGv00d9jW1fHq7
	HbNLIof+5neApsifvHFXyDoqCUMK+mcvD2C76uKMywQmjiTpgb6+KboxrYeSTDVqUFzoGFBdUP0j3
	br7rMiy4LNeautdkJ8BEHzkUM8XOye/n9QslEhDg9Z3zNX0zwUpkDlWjNuFqqRQUDcFkGzOQ0Fsx7
	oDe8vNH/VdLmQ7wt6xkU16uNSu2X6Yd7glt8teXcnyquXMlmU9QSEcroqjMT9p49fCZd4WMeBCDfC
	n6P9/IbwY1zS5zMLh+7LJPxUtOCmtj884mLc1gth+DnznSPnHyikRYAYjNk3V6l6qCNFesiA4wIDd
	dfq82B8NZGZKwLYIAOQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRW8P-0017Qq-2E; Fri, 26 Aug 2022 10:00:17 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRW8M-0017Ns-Pz
	for linux-mtd@lists.infradead.org; Fri, 26 Aug 2022 10:00:16 +0000
Received: by mail-pj1-x102d.google.com with SMTP id w88-20020a17090a6be100b001fbb0f0b013so1080323pjj.5
        for <linux-mtd@lists.infradead.org>; Fri, 26 Aug 2022 03:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=171AQl+UDXnHli9x/RiGO6mKiKHreDgRdey3hqEUoOs=;
        b=qRkR2o/6J07iwmsok7xtFh61QC1tJ1mZ5EHoaLEEh3pOUtnCFyt3s4NChnkUN5EGiY
         4qgKRaAmi6NcW2oNkPNcsBLY/WAdC2G2b9d6QNXRX5kn3Lu2nCz8EuU5gbbWMd8Rys10
         MdTWS5m1MXlJPzRfWtBAQdhbBijWQRYuDp3m5F/+hUU0KzXAYsiSUha3L2rtwev5xfxh
         eBdjHG3eh9yWXY7NStcWLuCj8Q+w2FFKpgmmx7wLrrwA87XaK5ADY0ENEAM8ZVNucKqZ
         st0Qkx6FK4N38U1Ndmt71oIu2O/2cDL4dkvDFMfeIubv8fmbpeU83jXrgwwg9mpKMOE4
         GrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=171AQl+UDXnHli9x/RiGO6mKiKHreDgRdey3hqEUoOs=;
        b=BGCOuY6ScvhdYhU542CaPGAtUIc0IqPCSWjh7EcuSLhURTCl1EevHemEZyJN1py8op
         YFzZeTGnniCJhaVMKgzUkb4pyzkrs7Klg9i9knFY41/XCWfwAexTCG5G8VKsBRcJMmQm
         5LUnfPc7vTaHak0jOAyjOz4mZai4wN7tsFh1mDuQL0C92e/En6qUVcS72afjA2XMjoB+
         hIk/+Nb5dhs9fKHOOwNtH/t6BOdLnZornfyANMG8gg/Xjx0efDPt4zPt6gFHjm1Sy3dJ
         dQlOkB1g6lotE7YmXZuMCAggsZoGlYC7eyR2/wo7D3/QeSufxPWVGJXy4H12EaH9cZA9
         dxhw==
X-Gm-Message-State: ACgBeo2+qkVsAVNLBf//6W0Jc3XIdCEd00ngNR2PHZUE8MYDrqvc8Qmu
	fNnNU4g3BC59qCiUb2EE2ck=
X-Google-Smtp-Source: AA6agR49ywP4abwaM1uun8VBtedFlkKU2G5GF6dKpJytPvws6zkWLVzB3q/6liwhQk/e3Z+qJLJKLA==
X-Received: by 2002:a17:903:2282:b0:172:ea32:fa77 with SMTP id b2-20020a170903228200b00172ea32fa77mr2883086plh.5.1661508012854;
        Fri, 26 Aug 2022 03:00:12 -0700 (PDT)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id c201-20020a621cd2000000b00536935b19bdsm1306615pfc.52.2022.08.26.03.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 03:00:12 -0700 (PDT)
Message-ID: <4d517d09-80f5-66c8-b315-48f134cda9ca@gmail.com>
Date: Fri, 26 Aug 2022 19:00:08 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] mtd: spi-nor: spansion: Add s28hl512t, s28hl01gt, and
 s28hs01gt info
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1661392740.git.Takahiro.Kuwano@infineon.com>
 <475bdde1b012af8b36f266bca3230c3262f78700.1661392740.git.Takahiro.Kuwano@infineon.com>
 <f0457fd85a363653e6b4b2e27c58e473@walle.cc>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <f0457fd85a363653e6b4b2e27c58e473@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_030014_864776_FED33A3B 
X-CRM114-Status: GOOD (  12.51  )
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

T24gOC8yNS8yMDIyIDQ6NTcgUE0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4gQW0gMjAyMi0wOC0y
NSAwNDoyMCwgc2NocmllYiB0a3V3NTg0OTI0QGdtYWlsLmNvbToKPj4gRnJvbTogVGFrYWhpcm8g
S3V3YW5vIDxUYWthaGlyby5LdXdhbm9AaW5maW5lb24uY29tPgo+Pgo+PiBBZGQgZmxhc2ggaW5m
byB0YWJsZSBlbnRyaWVzIGZvciBzMjhobDUxMmd0LCBzMjhobDAxZ3QsIGFuZCBzMjhoczAxZ3Qu
Cj4+IFRoZXNlIGRldmljZXMgaGF2ZSB0aGUgc2FtZSBmdW5jdGlvbmFsaXR5IGFzIHMyOGhzNTEy
dC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogVGFrYWhpcm8gS3V3YW5vIDxUYWthaGlyby5LdXdhbm9A
aW5maW5lb24uY29tPgo+PiAtLS0KPj4gwqBkcml2ZXJzL210ZC9zcGktbm9yL3NwYW5zaW9uLmMg
fCAxNSArKysrKysrKysrKysrKysKPj4gwqAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygr
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9zcGFuc2lvbi5jIGIvZHJp
dmVycy9tdGQvc3BpLW5vci9zcGFuc2lvbi5jCj4+IGluZGV4IDAzZjM2MTA4OWEwNS4uNzZhMGUz
MWM4MzIzIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL3NwYW5zaW9uLmMKPj4g
KysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGFuc2lvbi5jCj4+IEBAIC00NTksMTEgKzQ1OSwy
NiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8gc3BhbnNpb25fbm9yX3BhcnRzW10g
PSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqAgLmZpeHVwcyA9ICZzMjVoeF90X2ZpeHVwcyB9LAo+PiDC
oMKgwqDCoCB7ICJjeTE1eDEwNHEiLMKgIElORk82KDB4MDQyY2MyLCAweDdmN2Y3ZiwgNTEyICog
MTAyNCwgMSkKPj4gwqDCoMKgwqDCoMKgwqDCoCBGTEFHUyhTUElfTk9SX05PX0VSQVNFKSB9LAo+
PiArwqDCoMKgIHsgInMyOGhsNTEydCIswqDCoCBJTkZPKDB4MzQ1YTFhLMKgwqDCoMKgwqAgMCwg
MjU2ICogMTAyNCwgMjU2KQo+PiArwqDCoMKgwqDCoMKgwqAgTk9fU0ZEUF9GTEFHUyhTRUNUXzRL
IHwgU1BJX05PUl9PQ1RBTF9EVFJfUkVBRCB8Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFNQSV9OT1JfT0NUQUxfRFRSX1BQKQo+IAo+IERvIHlvdSByZWFsbHkgbmVlZCB0
aGUgTk9fU0ZEUF9GTEFHUyBoZXJlPyBBbmQgdGhlbiB0aGUgdXN1YWw6Cj4gY291bGQgeW91IHRl
c3Qgd2l0aAo+IMKgwqDCoMKgeyAiczI4aGw1MTJ0IizCoMKgIElORk8oMHgzNDVhMWEswqDCoMKg
wqDCoCAwLCAwLCAwKQpQQVJTRV9TRkRQPwo+IMKgwqDCoMKgwqDCoMKgIC5maXh1cHMgPSAmczI4
aHhfdF9maXh1cHMsCj4gwqDCoMKgwqB9LAo+IApXaXRoIHNvbWUgbWlub3IgY2hhbmdlcyBpbiBz
ZmRwLmMgYW5kIHNwYW5zaW9uLmMsIGl0J3Mgd29ya2luZy4KSSB3aWxsIGRvIG1vcmUgdGVzdHMg
dGhlbiByZXZpc2UgdGhlIHNlcmllcy4KClRoYW5rIHlvdSEKVGFrYWhpcm8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
