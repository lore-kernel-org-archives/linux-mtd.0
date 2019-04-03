Return-Path: <SRS0=c1Ix=SF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE3EC4360F
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 11:52:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADCF8206B7
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 11:52:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q6TWdr1+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TvaVhol5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADCF8206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w8aHv1JFhUlEL65NjewmTwIEM4bW4UEJHR7NaVOfbXc=; b=q6TWdr1+if1kWl
	FDzQ2Hj940Iow7sjMTRJg6Y5lZBlkuJ2mtsjYX0axSs1Z0XyDW5GO3Xxm1zl7+53AsVXrwuO9rr82
	n0rmwZuVlOZUOxnifUZChCsPT49opikDiCe504jDvdOYuJ1WXZkrhoxAJ00ya8A9LT2WMAzeQyIv5
	ULGj9kim3ALo97p0uvoU4DEDJaDxNGxaFwgFYHcbMFfcIPlf1eJN62VJJ6OhLV/cOKp3pBAWns3YO
	VAw4N9+K4SPIv+7YO22mxaRPnRGwZoEKZwBGbClJP9Wd033nUD6fxpZZfzlsBwoI2awOnSoKwG6Nq
	hhsqMUOQMV8cYKmESXAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBeQy-00037p-Kx; Wed, 03 Apr 2019 11:52:00 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBeQw-000377-3L
 for linux-mtd@lists.infradead.org; Wed, 03 Apr 2019 11:51:59 +0000
Received: by mail-pf1-x444.google.com with SMTP id 188so8040305pfd.8
 for <linux-mtd@lists.infradead.org>; Wed, 03 Apr 2019 04:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=LeBuh7e0xo0Yd76B7jQlnsPL/L3qs0Zl4qYNPHHmMOY=;
 b=TvaVhol5+sQ1aSflJzOOq+xJBpNK4vL+0aZsFrWXQhiaku4thAPRZ750FooRgTTomI
 fwGdLV3IF0YwZgrqbcunIikUPTnbaz+ODFkjSi1Co3Y9f2aBM1vcwmRrTR5wRch7bUK7
 I45Uu6IPhu7Nqi1mUi5nbnhUk9SrefEvqesMvz2dinE9iIEYAt2Ve0cVbL8ZvFV/G0RS
 X1Rj3/PzL+dANftAfkhcLQHm+Y86I9qvIDifhOD66nrJOQTdMnCldkK+bc/e6OSFDQFl
 MssqAHt2QPQFzh4gQLgfykIYAqVYQYDNNkRHU6v7Z+e9btnrlkhIIcTwL3uRiaYLEgx5
 TRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=LeBuh7e0xo0Yd76B7jQlnsPL/L3qs0Zl4qYNPHHmMOY=;
 b=uQo2CiwNzzOcVU5EFnnassfP0iPoHmN71aX7GXS0fDmH4+39u9PWbTRpAsiy9ttUSw
 ac3FfCHkNzvBISebVqEjP2gbng6rptJt5lXewCMqGX/PathSa4XFDOHsbNdNsV5klgwP
 nBfoQYHqsF555Z2Prxj4zyv/xV74jQsLeaFZovrEWFcPeUYLu/tNDoRCKpegk020IML5
 gplbgprvCmjK+Ai9cRb743Op8jQLE8F/GixwpAOmwc2FaNdoBctRpkUTjKTtioS3kIla
 qDbB5b1yfygK1th/A5XLNsNi/Kp23QuEZbsBFtU5D4nOgfAL2qfRxlcLJCbTfcnJ6g0P
 PR+w==
X-Gm-Message-State: APjAAAUyEcbEIYk0sc1MIKzccy9njSfzLDVU7Ch81b+72FZ0hlr2h00X
 n8oCrQG31paq5+yCk6xubPa4ig==
X-Google-Smtp-Source: APXvYqz+wHNR2Ljkw4ZN04tKY+ztQWajg9tEPZPt4FUK6kzoI/oO+I4WV8uEqlsgXgaZIob8WBJoKg==
X-Received: by 2002:a63:4819:: with SMTP id v25mr2464895pga.412.1554292316602; 
 Wed, 03 Apr 2019 04:51:56 -0700 (PDT)
Received: from dell ([147.50.13.10])
 by smtp.gmail.com with ESMTPSA id s15sm19137510pga.71.2019.04.03.04.51.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Apr 2019 04:51:55 -0700 (PDT)
Date: Wed, 3 Apr 2019 12:51:46 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH 4/7] dt-bindings: mfd: Document Macronix MX25F0A
 controller bindings
Message-ID: <20190403115146.GR11301@dell>
References: <1553768318-23149-1-git-send-email-masonccyang@mxic.com.tw>
 <1553768318-23149-5-git-send-email-masonccyang@mxic.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1553768318-23149-5-git-send-email-masonccyang@mxic.com.tw>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190403_045158_148340_ACCB088A 
X-CRM114-Status: GOOD (  19.42  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, christophe.kerello@st.com,
 juliensu@mxic.com.tw, bbrezillon@kernel.org, marcel.ziswiler@toradex.com,
 computersforpeace@gmal.com, miquel.raynal@bootlin.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-spi@vger.kernel.org,
 marek.vasut@gmail.com, paul.burton@mips.com, broonie@kernel.org,
 geert@linux-m68k.org, stefan@agner.ch, linux-mtd@lists.infradead.org,
 richard@nod.at, liang.yang@amlogic.com, dwmw2@infradead.org,
 zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyOCBNYXIgMjAxOSwgTWFzb24gWWFuZyB3cm90ZToKCj4gRG9jdW1lbnQgdGhlIGJp
bmRpbmdzIHVzZWQgYnkgdGhlIE1hY3Jvbml4IE1YMjVGMEEgTUZEIGNvbnRyb2xsZXIuCj4gCj4g
U2lnbmVkLW9mZi1ieTogTWFzb24gWWFuZyA8bWFzb25jY3lhbmdAbXhpYy5jb20udHc+Cj4gLS0t
Cj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9teGljLW14MjVmMGEudHh0ICAgICAgIHwg
NjYgKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNjYgaW5zZXJ0aW9u
cygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21mZC9teGljLW14MjVmMGEudHh0Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvbXhpYy1teDI1ZjBhLnR4dCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvbXhpYy1teDI1ZjBhLnR4dAo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggMDAwMDAwMC4uNTNiNDgzOQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL214aWMtbXgyNWYwYS50eHQKPiBA
QCAtMCwwICsxLDY2IEBACj4gK01hY3Jvbml4IE1YMjVGMEEgTXVsdGktRnVuY3Rpb24gRGV2aWNl
IFRyZWUgQmluZGluZ3MKPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+ICsKPiArTVgyNUYwQSBpcyBhIE11bHRpRnVuY3Rpb24gRGV2aWNlIHdp
dGggU1BJIGFuZCByYXcgTkFORCwgd2hpY2gKPiArc3VwcG9ydHMgZWl0aGVyIHNwaSBob3N0IGNv
bnRyb2xsZXIgb3IgcmF3IG5hbmQgY29udHJvbGxlci4KPiArCj4gK1JlcXVpcmVkIHByb3BlcnRp
ZXM6Cj4gKy0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJteGljLG14MjVmMGEtbWZkIgo+ICstICNh
ZGRyZXNzLWNlbGxzOiBzaG91bGQgYmUgMQo+ICstICNzaXplLWNlbGxzOiBzaG91bGQgYmUgMAo+
ICstIHJlZzogc2hvdWxkIGNvbnRhaW4gMiBlbnRyaWVzLCBvbmUgZm9yIHRoZSByZWdpc3RlcnMg
YW5kIG9uZSBmb3IgdGhlIGRpcmVjdAo+ICsgICAgICAgbWFwcGluZyBhcmVhIGluIFNQSSBtb2Rl
Lgo+ICstIHJlZy1uYW1lczogc2hvdWxkIGNvbnRhaW4gInJlZ3MiIGFuZCAiZGlybWFwIgo+ICst
IGludGVycnVwdHM6IGludGVycnVwdCBsaW5lIGNvbm5lY3RlZCB0byB0aGlzIE1GRCBjb250cm9s
bGVyCj4gKwo+ICtSZXF1aXJlZCBub2RlczoKPiArIC0gc3BpIDoKPiArCU5vZGUgZm9yIGNvbmZp
Z3VyaW5nIHRoZSBTUEkgY29udHJvbGxlciBkcml2ZXIuCj4gKwlSZXF1aXJlZCBwcm9wZXJ0aWVz
Ogo+ICsJCS0gY29tcGF0aWJsZSA9ICJteGljeSxteDI1ZjBhLXNwaSI7Cj4gKwkJLSBjbG9jay1u
YW1lczogc2hvdWxkIGNvbnRhaW4gInBzX2NsayIsICJzZW5kX2NsayIgYW5kCj4gKwkJCSAgICAg
ICAic2VuZF9kbHlfY2xrIgo+ICsJCS0gY2xvY2tzOiBzaG91bGQgY29udGFpbiAzIGVudHJpZXMg
Zm9yIHRoZSAicHNfY2xrIiwgInNlbmRfY2xrIgo+ICsJCQkgIGFuZCAic2VuZF9kbHlfY2xrIiBj
bG9ja3MKPiArCj4gKy0gbmFuZCA6Cj4gKwlOb2RlIGZvciBjb25maWd1cmluZyB0aGUgcmF3IG5h
bmQgY29udHJvbGxlciBkcml2ZXIuCj4gKwlSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICsJCS0gY29t
cGF0aWJsZSA9ICJteGljeSxteDI1ZjBhLW5hbmQtY3RsciI7Cj4gKwkJLSBuYW5kLWVjYy1tb2Rl
ID0gInNvZnQiOwo+ICsJCS0gbmFuZC1lY2MtYWxnbyA9ICJiY2giOwo+ICsKPiArRXhhbXBsZToK
PiArCj4gKwlteGljOiBteDI1ZjBhLW1mZEA0M2MzMDAwMCB7CgpJJ20gbm90IHN1cmUgSSB1bmRl
cnN0YW5kIHdoeSB5b3UgYXJlIHVzaW5nIGFuIE1GRCBmb3IgdGhpcy4KCj4gKwkJY29tcGF0aWJs
ZSA9ICJteGljLG14MjVmMGEtbWZkIjsKPiArCQlyZWcgPSA8MHg0M2MzMDAwMCAweDEwMDAwPiwg
PDB4YTAwMDAwMDAgMHg0MDAwMDAwPjsKPiArCQlyZWctbmFtZXMgPSAicmVncyIsICJkaXJtYXAi
Owo+ICsJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICsJCSNzaXplLWNlbGxzID0gPDA+Owo+ICsK
PiArCQkvKiBlaXRoZXIgc3BpIG9yIG5hbmQgKi8KPiArCQlzcGkgewo+ICsJCQljb21wYXRpYmxl
ID0gIm14aWN5LG14MjVmMGEtc3BpIjsKPiArCQkJY2xvY2tzID0gPCZjbGt3aXphcmQgMD4sIDwm
Y2xrd2l6YXJkIDE+LCA8JmNsa2MgMTU+Owo+ICsJCQljbG9jay1uYW1lcyA9ICJzZW5kX2NsayIs
ICJzZW5kX2RseV9jbGsiLCAicHNfY2xrIjsKPiArCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4g
KwkJCSNzaXplLWNlbGxzID0gPDA+Owo+ICsKPiArCQkJZmxhc2hAMCB7Cj4gKwkJCQljb21wYXRp
YmxlID0gImplZGVjLHNwaS1ub3IiOwo+ICsJCQkJcmVnID0gPDA+Owo+ICsJCQkJc3BpLW1heC1m
cmVxdWVuY3kgPSA8MjUwMDAwMDA+Owo+ICsJCQkJc3BpLXR4LWJ1cy13aWR0aCA9IDw0PjsKPiAr
CQkJCXNwaS1yeC1idXMtd2lkdGggPSA8ND47Cj4gKwkJCX07Cj4gKwkJfTsKPiArCj4gKwkJbmFu
ZCB7Cj4gKwkJCWNvbXBhdGlibGUgPSAibXhpY3ksbXgyNWYwYS1uYW5kLWN0bHIiOwo+ICsJCQlu
YW5kLWVjYy1tb2RlID0gInNvZnQiOwo+ICsJCQluYW5kLWVjYy1hbGdvID0gImJjaCI7Cj4gKwkJ
CW5hbmQtZWNjLXN0ZXAtc2l6ZSA9IDw1MTI+Owo+ICsJCQluYW5kLWVjYy1zdHJlbmd0aCA9IDw4
PjsKPiArCQl9Owo+ICsJfTsKCldoeSBub3QganVzdCBzZWxlY3Qgb25lIHVzaW5nIGRldmljZSB0
cmVlIGFsb25lLCBieToKCglzcGlANDNjMzAwMDAgewoJCWNvbXBhdGlibGUgPSAibXhpY3ksbXgy
NWYwYS1zcGkiOwoJCXJlZyA9IDwweDQzYzMwMDAwIDB4MTAwMDA+LCA8MHhhMDAwMDAwMCAweDQw
MDAwMDA+OwoJCXJlZy1uYW1lcyA9ICJyZWdzIiwgImRpcm1hcCI7CgkJI2FkZHJlc3MtY2VsbHMg
PSA8MT47CgkJI3NpemUtY2VsbHMgPSA8MD47CgkJY2xvY2tzID0gPCZjbGt3aXphcmQgMD4sIDwm
Y2xrd2l6YXJkIDE+LCA8JmNsa2MgMTU+OwoJCWNsb2NrLW5hbWVzID0gInNlbmRfY2xrIiwgInNl
bmRfZGx5X2NsayIsICJwc19jbGsiOwoJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJCSNzaXplLWNl
bGxzID0gPDA+OwoKCQlmbGFzaEAwIHsKCQkJY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsK
CQkJcmVnID0gPDA+OwoJCQlzcGktbWF4LWZyZXF1ZW5jeSA9IDwyNTAwMDAwMD47CgkJCXNwaS10
eC1idXMtd2lkdGggPSA8ND47CgkJCXNwaS1yeC1idXMtd2lkdGggPSA8ND47CgkJfTsKCX07CgpP
UiAuLi4KCgluYW5kQDQzYzMwMDAwIHsKCQljb21wYXRpYmxlID0gIm14aWN5LG14MjVmMGEtbmFu
ZC1jdGxyIjsKCQlyZWcgPSA8MHg0M2MzMDAwMCAweDEwMDAwPiwgPDB4YTAwMDAwMDAgMHg0MDAw
MDAwPjsKCQlyZWctbmFtZXMgPSAicmVncyIsICJkaXJtYXAiOwoJCSNhZGRyZXNzLWNlbGxzID0g
PDE+OwoJCSNzaXplLWNlbGxzID0gPDA+OwoJCW5hbmQtZWNjLW1vZGUgPSAic29mdCI7CgkJbmFu
ZC1lY2MtYWxnbyA9ICJiY2giOwoJCW5hbmQtZWNjLXN0ZXAtc2l6ZSA9IDw1MTI+OwoJCW5hbmQt
ZWNjLXN0cmVuZ3RoID0gPDg+OwoJfTsKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJv
IFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3
YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9n
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
