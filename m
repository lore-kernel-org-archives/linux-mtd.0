Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02578C47094
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 09:32:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDEF4613E3
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 09:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDEF4613E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=domAK0hahGxs76JNdN8+gYfxRQLdM/XFgNvJSetRUNQ=; b=CExyUEyIMs4jon
	t1jxcaEjhN3Udd3pwZavrcmafKzuzduXO1NyX+XGziR0W60rmOdVNJUbtFVWgYQex8jZYJOqkcscy
	fYREv4HKyy90ZoaNny+Gojq8EQMZGUf2/uJkTe1NbbxORmJe3xtAxM4qUz+P2pPIoXszCH+vHNWB9
	glEjunrowHPlowEGyd8ik/vt+0wrkUy7Yr2Y+rq5iRLLS2Q222MOt49/w8dpHXVxzpn19vBD5Fh5Y
	TN9dUvNoCTYoFo6kNenhgEBXvohjUfzycsSiczYDqS85b3fICf4a/iqdS4lt7ALE8rs3+Xy4dA4ya
	PqTBAyRc+4b5Tcm1Raow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrH2P-000CY3-1c; Thu, 10 Jun 2021 09:31:45 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrGUs-0002eg-JT; Thu, 10 Jun 2021 08:57:10 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 9633340010;
 Thu, 10 Jun 2021 08:56:54 +0000 (UTC)
Date: Thu, 10 Jun 2021 10:56:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Michal Simek <monstr@monstr.eu>, Naga
 Sureshkumar Relli <nagasure@xilinx.com>, Amit Kumar Mahapatra
 <akumarma@xilinx.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 helmut.grohne@intenta.de, Srinivas Goud <sgoud@xilinx.com>, Siva Durga
 Prasad Paladugu <sivadur@xilinx.com>
Subject: Re: [PATCH v23 17/18] dt-bindings: mtd: pl353-nand: Describe this
 hardware controller
Message-ID: <20210610105653.2d732c4b@xps13>
In-Reply-To: <ce97c460-14eb-a758-31f6-124585e733f1@canonical.com>
References: <20210610082040.2075611-1-miquel.raynal@bootlin.com>
 <20210610082040.2075611-18-miquel.raynal@bootlin.com>
 <ce97c460-14eb-a758-31f6-124585e733f1@canonical.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_015706_824709_8022F34F 
X-CRM114-Status: GOOD (  15.69  )
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

SGkgS3J6eXN6dG9mLAoKS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBj
YW5vbmljYWwuY29tPiB3cm90ZSBvbiBUaHUsCjEwIEp1biAyMDIxIDEwOjQ4OjE2ICswMjAwOgoK
PiBPbiAxMC8wNi8yMDIxIDEwOjIwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gQWRkIGEgeWFt
bCBkZXNjcmlwdGlvbiBvZiB0aGlzIE5BTkQgY29udHJvbGxlciB3aGljaCBpcyBkZXNjcmliZWQg
YXMgYQo+ID4gc3Vibm9kZSBvZiB0aGUgU01DIGJ1cy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTog
TWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+IC0tLQo+ID4gIC4u
Li9iaW5kaW5ncy9tdGQvYXJtLHBsMzUzLW5hbmQtcjJwMS55YW1sICAgICB8IDUzICsrKysrKysr
KysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKQo+ID4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2Fy
bSxwbDM1My1uYW5kLXIycDEueWFtbAo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9hcm0scGwzNTMtbmFuZC1yMnAxLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2FybSxwbDM1My1uYW5kLXIycDEueWFt
bAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uNWYxMjZi
YjliMjAyCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbXRkL2FybSxwbDM1My1uYW5kLXIycDEueWFtbAo+ID4gQEAgLTAsMCArMSw1
MyBAQAo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNE
LTItQ2xhdXNlKQo+ID4gKyVZQU1MIDEuMgo+ID4gKy0tLQo+ID4gKyRpZDogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvbXRkL2FybSxwbDM1My1uYW5kLXIycDEueWFtbCMKPiA+ICskc2No
ZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ICsK
PiA+ICt0aXRsZTogUEwzNTMgTkFORCBDb250cm9sbGVyIGRldmljZSB0cmVlIGJpbmRpbmdzCj4g
PiArCj4gPiArYWxsT2Y6Cj4gPiArICAtICRyZWY6ICJuYW5kLWNvbnRyb2xsZXIueWFtbCIKPiA+
ICsKPiA+ICttYWludGFpbmVyczoKPiA+ICsgIC0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5h
bEBib290bGluLmNvbT4KPiA+ICsgIC0gTmFnYSBTdXJlc2hrdW1hciBSZWxsaSA8bmFnYS5zdXJl
c2hrdW1hci5yZWxsaUB4aWxpbnguY29tPgo+ID4gKwo+ID4gK3Byb3BlcnRpZXM6Cj4gPiArICBj
b21wYXRpYmxlOgo+ID4gKyAgICBpdGVtczogIAo+IAo+IEkgdGhpbmsgeW91IGNhbiBza2lwIHRo
ZSAiaXRlbXMiIGhlcmUgYW5kIGxlYXZlIG9ubHkgImNvbnN0OiBmb28iLgoKQ3JhcCwgSSBtaXNz
ZWQgdGhhdCBvbmUsIHlvdSdyZSByaWdodC4gSSdsbCB3YWl0IGEgYml0IGZvciBSb2IncwpmZWVk
YmFjayBhbmQgZXZlbnR1YWxseSBmaXggaXQgd2hlbiBhcHBseWluZyBvciByZXNlbmQgKGhvcGVm
dWxseSkgb25seQp0aGUgTkFORCBiaXRzLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
