Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D65C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jul 2022 10:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oA3XThWUakz5LFIA/3QrBuvMvQACNnoATFBixLB9fJY=; b=dVnD1vlf7A6cQO
	zzEjpVolATv502wSdk8XWo2OiUO0by/1DQaHqWxXyynk1VTP4PCmMP4+KdWpX7ca5aKJlFD4nTHh2
	E3TxdPFPrKflCU+4URtDLalzVypERXfb1PgL436mq3c8TP1LEu+v9Jq0toYDvgKT9/Dx09NUy7Hgv
	pijkz5uA+1uF4jSaXtrYgnOUSQZrs1GnNs0qoAV/iEZTVt38EVFLRykK3meJoEv6ANQOcUF1fS9fz
	jL9+9hcQL//rx+FOTW4udOSxtmJg4wA+Cb2VGmkrrdgMAeF4WGrA+xmvCqKrOhxMz6DGktHD5ZOnR
	z0lXopDk0Ti0dblNUQbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8fvh-00HC8d-VK; Tue, 05 Jul 2022 10:37:18 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8fvW-00HC5U-CO
	for linux-mtd@lists.infradead.org; Tue, 05 Jul 2022 10:37:07 +0000
Received: by mail-lf1-x12b.google.com with SMTP id m18so1356686lfg.10
        for <linux-mtd@lists.infradead.org>; Tue, 05 Jul 2022 03:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KQNw+HNoVVOd6zABLLZO6EOnFM/ym/yFHXExMPN6G6Y=;
        b=Ue8SmLdOgCBJE7MacWwk7UayrMbTsgXvscTDx+rT9+Z5YqBhG6y3stxceoNeg0AKNW
         qMqBoDngkBRXgU5GCFjUvK5OfJwPLEfL8FeaATAtyPnvNPgnxewbpTwNk2VTvc4Qt11C
         lkxEITc/qcHopsPh680BlRThUvSz+Xljtouvn9blWoSG/8jUYgTV+tbHcGKyFok4PXTm
         nRcLw0kqEyD7kOTxwq0WGHZ4DyEdeAAQDVpekbRFvsWPYi98XUHm0edM8lTWj2owdOiu
         5EYduGeD/CaEOuu61PpQPBL5VlL04YbzNcS+OBgnB1EVV+LbE3B9y2daIgOauAU9CCXq
         B1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KQNw+HNoVVOd6zABLLZO6EOnFM/ym/yFHXExMPN6G6Y=;
        b=LIBKM2xya+SMbUj2lh1Vk8itmheqB603yTl8sdo1z0WhbJ1suSRjLh5dagiGqa7Nil
         49hD9QWdsAsfTXcUTWgUHbk216esSfoK9bcRfEhIOWCBO+olf7sswMT9dcWYT3zYaxKX
         t6X4eYW93TvM/dX1TmhpGXl4WYGQQ+v8s7tdB3k3RvQ34O5HHszwnebIXraWm6Cyn2BB
         HGmnAI1TZpeJTuITb7EKnFgQ0+i8sGbf+pjqStO4z7HDwUAPiw/MUmd58Z5AR0upzG9B
         BEgEyQcnacZn2Fl+iUWahd8JB11/mm8qlQkWNRWd+GDqF8GVhwJ4mY1lrzq+iBx9Hpwr
         I/CQ==
X-Gm-Message-State: AJIora8TO8/yu7R0dRkdsvfqQVNBwWqHEs9KQr17KYKW/PY574aG4IcA
	wXjoPAyfVNLvscPqfkMxtnK0wg==
X-Google-Smtp-Source: AGRyM1vfRzDYpBi1wpu63DmX2uwd1gFLDE0MhoUsAx26SeGlGJwEOS7cclobYWPcXvia+h6MPd2f/w==
X-Received: by 2002:a05:6512:281d:b0:47f:ac1c:fcf5 with SMTP id cf29-20020a056512281d00b0047fac1cfcf5mr23023535lfb.197.1657017420887;
        Tue, 05 Jul 2022 03:37:00 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id f9-20020a05651c03c900b0025a79b7fb7dsm5492251ljp.93.2022.07.05.03.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 03:37:00 -0700 (PDT)
Message-ID: <59d360ef-5374-c7a7-2995-854ab3715b25@linaro.org>
Date: Tue, 5 Jul 2022 12:36:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 07/11] dt-bindings: spi: spi-nxp-fspi: add a new property
 nxp,fspi-dll-slvdly
Content-Language: en-US
To: Bough Chen <haibo.chen@nxp.com>,
 "ashish.kumar@nxp.com" <ashish.kumar@nxp.com>,
 "yogeshgaur.83@gmail.com" <yogeshgaur.83@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 Han Xu <han.xu@nxp.com>,
 "singh.kuldeep87k@gmail.com" <singh.kuldeep87k@gmail.com>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "p.yadav@ti.com" <p.yadav@ti.com>, "michael@walle.cc" <michael@walle.cc>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "zhengxunli@mxic.com.tw" <zhengxunli@mxic.com.tw>
References: <1657012303-6464-1-git-send-email-haibo.chen@nxp.com>
 <1657012303-6464-7-git-send-email-haibo.chen@nxp.com>
 <ef676df1-77e0-b8ee-3950-97eade8ddd5b@linaro.org>
 <VI1PR04MB40167A70FBE772DF91047A4190819@VI1PR04MB4016.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <VI1PR04MB40167A70FBE772DF91047A4190819@VI1PR04MB4016.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_033706_491885_4A1C209F 
X-CRM114-Status: GOOD (  15.11  )
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

T24gMDUvMDcvMjAyMiAxMjoyOCwgQm91Z2ggQ2hlbiB3cm90ZToKPj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0KPj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxv
d3NraUBsaW5hcm8ub3JnPgo+PiBTZW50OiAyMDIy5bm0N+aciDXml6UgMTc6NDgKPj4gVG86IEJv
dWdoIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT47IGFzaGlzaC5rdW1hckBueHAuY29tOwo+PiB5
b2dlc2hnYXVyLjgzQGdtYWlsLmNvbTsgYnJvb25pZUBrZXJuZWwub3JnOyByb2JoK2R0QGtlcm5l
bC5vcmc7Cj4+IGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZzsgSGFuIFh1IDxoYW4u
eHVAbnhwLmNvbT47Cj4+IHNpbmdoLmt1bGRlZXA4N2tAZ21haWwuY29tOyB0dWRvci5hbWJhcnVz
QG1pY3JvY2hpcC5jb207Cj4+IHAueWFkYXZAdGkuY29tOyBtaWNoYWVsQHdhbGxlLmNjOyBtaXF1
ZWwucmF5bmFsQGJvb3RsaW4uY29tOwo+PiByaWNoYXJkQG5vZC5hdDsgdmlnbmVzaHJAdGkuY29t
OyBzaGF3bmd1b0BrZXJuZWwub3JnOwo+PiBzLmhhdWVyQHBlbmd1dHJvbml4LmRlOyBrZXJuZWxA
cGVuZ3V0cm9uaXguZGUKPj4gQ2M6IGxpbnV4LXNwaUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7Cj4+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51
eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZzsKPj4gZmVzdGV2YW1AZ21haWwuY29tOyBkbC1saW51
eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsKPj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnOyB6aGVuZ3h1bmxpQG14aWMuY29tLnR3Cj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
MDcvMTFdIGR0LWJpbmRpbmdzOiBzcGk6IHNwaS1ueHAtZnNwaTogYWRkIGEgbmV3IHByb3BlcnR5
Cj4+IG54cCxmc3BpLWRsbC1zbHZkbHkKPj4KPj4gT24gMDUvMDcvMjAyMiAxMToxMSwgaGFpYm8u
Y2hlbkBueHAuY29tIHdyb3RlOgo+Pj4gRnJvbTogSGFpYm8gQ2hlbiA8aGFpYm8uY2hlbkBueHAu
Y29tPgo+Pj4KPj4+IEFkZCBvbmUgb3B0aW9uYWwgcHJvcGVydHkgbnhwLGZzcGktZGxsLXNsdmRs
eQo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4K
Pj4+IC0tLQo+Pj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvc3BpLW54
cC1mc3BpLnlhbWwgfCA2ICsrKysrKwo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NwaS9zcGktbnhwLWZzcGkueWFtbAo+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9zcGkvc3BpLW54cC1mc3BpLnlhbWwKPj4+IGluZGV4IDFiNTUyYzI5ODI3Ny4uNmJkNjE1
NjU2ODZhIDEwMDY0NAo+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NwaS9zcGktbnhwLWZzcGkueWFtbAo+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NwaS9zcGktbnhwLWZzcGkueWFtbAo+Pj4gQEAgLTQ1LDYgKzQ1LDEyIEBAIHBy
b3BlcnRpZXM6Cj4+PiAgICAgICAgLSBjb25zdDogZnNwaV9lbgo+Pj4gICAgICAgIC0gY29uc3Q6
IGZzcGkKPj4+Cj4+PiArICBueHAsZnNwaS1kbGwtc2x2ZGx5Ogo+Pj4gKyAgICAkcmVmOiAvc2No
ZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKPj4+ICsgICAgZGVzY3JpcHRpb246
IHwKPj4+ICsgICAgICBTcGVjaWZ5IHRoZSBETEwgc2xhdmUgbGluZSBkZWxheSB2YWx1ZS4KPj4K
Pj4gV2hhdCBhcmUgdGhlIHVuaXRzPwo+IAo+IERvIHlvdSBtZWFuIGhlcmUgbmVlZCB0byBnaXZl
IG1vcmUgZGV0YWlsIGV4cGxhaW4gYWJvdXQgdGhpcyBwcm9wZXJpdHk/Cj4gCj4gSG93IGFib3V0
IGNoYW5nZSBsaWtlIHRoaXM/Cj4gICAgU3BlY2lmeSB0aGUgRExMIHNsYXZlIGxpbmUgZGVsYXkg
dmFsdWUuIFRoZSBkZWxheSB0YXJnZXQgZm9yIHNsYXZlIGRlbGF5IGxpbmUgaXM6ICgobnhwLGZz
cGktZGxsLXNsdmRseSsxKSAqIDEvMzIgKiBjbG9jayBjeWNsZSBvZiByZWZlcmVuY2UgY2xvY2sg
KHNlcmlhbCByb290IGNsb2NrKS4gCgpUaGlzIHdvdWxkIGJlIGdvb2QuCgo+IFRoZSByYW5nZSBv
ZiB0aGlzIHZhbHVlIGlzIDB+MTYuCgpUaGlzIG5lZWRzIHRvIGdvIHRvIHNjaGVtYSBpbnN0ZWFk
IGFzICJtYXhpbXVtOiAxNiIuCgpCdXQgc3RpbGwgdGhlIHF1ZXN0aW9uIGlzIC0gd2hhdCBhcmUg
dGhlIHVuaXRzIHVzZWQgaW4gdGhpcyAiZGVsYXkiPyBtcz8gdXM/CgpCZXN0IHJlZ2FyZHMsCkty
enlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
