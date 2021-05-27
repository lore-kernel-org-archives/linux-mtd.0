Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FDD2C4707F
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 10:27:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0A48613C9
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 10:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0A48613C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3THYbWwp61WS5qfsNLaq7pPmXamMpF/XAc4EOy9iRrI=; b=CMb5QsIaPa4zQg
	fcPxDRWiVKNk+kHJ20rlgHdL2oo2TWjESRePqBgRBaTPUpv6a6GSU/f92Dj87y4PDFtw14cJzcQL4
	n5Kawch4j54vK9VFF5vR9aMfPBVptGxH3NbjYSnTAE1IRYyeAsR0s0PPw418xJAqtw3DWuwfotOG7
	XpusfDqoqF97xSp2FF5KxzHYBB91qTJ0l/1LDWcgSapSqcrgE4kR8b7PZpTIF/dmHq+5P0FcBNgDJ
	dKlD9A+Odw2fD/DKIv/nYbruhRMD+QvCMlTE+2dAaxUovebhHv2a040iZOueABnS08nHyCSQ4MBOt
	sqoTIrMNYLTiYZ5qCBuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmDDb-004nsZ-BT; Thu, 27 May 2021 10:26:23 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmDDY-004nqZ-0r
 for linux-mtd@lists.infradead.org; Thu, 27 May 2021 10:26:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id A2A7F60010;
 Thu, 27 May 2021 10:26:12 +0000 (UTC)
Date: Thu, 27 May 2021 12:26:06 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Helmut Grohne <helmut.grohne@intenta.de>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Naga Sureshkumar Relli
 <nagasure@xilinx.com>, Michal Simek <monstr@monstr.eu>, Amit Kumar
 Mahapatra <akumarma@xilinx.com>, Srinivas Goud <sgoud@xilinx.com>, Siva
 Durga Prasad Paladugu <sivadur@xilinx.com>
Subject: Re: [PATCH v20 08/19] dt-binding: memory: pl353-smc: Fix the reg
 property in the example
Message-ID: <20210527122606.48beb3e6@xps13>
In-Reply-To: <20210521015535.GA2483864@robh.at.kernel.org>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
 <20210519182636.1110080-9-miquel.raynal@bootlin.com>
 <20210521015535.GA2483864@robh.at.kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_032620_228829_62E6CD01 
X-CRM114-Status: GOOD (  20.36  )
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

SGkgUm9iLAoKUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGUgb24gVGh1LCAyMCBN
YXkgMjAyMSAyMDo1NTozNSAtMDUwMDoKCj4gT24gV2VkLCBNYXkgMTksIDIwMjEgYXQgMDg6MjY6
MjVQTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IFRoZSByZWcgcHJvcGVydHkgc2hv
dWxkIGRlc2NyaWJlIHRoZSBlbnRpcmUgYWNjZXNzaWJsZSB6b25lLCBub3Qgb25seQo+ID4gdGhl
IG9uZSB0aGUgZHJpdmVyIHdhbnRzIHRvIGFjY2Vzcy4gV2l0aCB0aGlzIGluIG1pbmQsIHRoZSBl
eGFtcGxlCj4gPiBzaG91bGQgbWFwIHR3byByZWdpb25zIGluc3RlYWQgb2Ygb25lIHRvIGJlIGVu
dGlyZWx5IGFjY3VyYXRlLiAgCj4gCj4gTm8sIG5vdCByZWFsbHkuIFRoZSBhZGRyZXNzIHNwYWNl
IGlzIGFscmVhZHkgY292ZXJlZCBieSAncmFuZ2VzJy4gVW5sZXNzIAo+IHlvdSBuZWVkIHRoZSBy
YW5nZSBpbiB0aGUgYXJtLHBsMzUzLXNtYy1yMnAxIGRyaXZlci4KClRoYW5rcyBmb3IgdGhlIGNs
YXJpZmljYXRpb24sIEkgZGlkbid0IHVuZGVyc3RhbmQgdGhlIHJhbmdlIHByb3BlcnR5CmNvcnJl
Y3RseSB0aGVuLgoKVGhpcyBleHRyYSByZWdpb24gc2hvdWxkIG5vdCBiZSBhY2Nlc3NlZCBmcm9t
IHRoZSBTTUMgZHJpdmVyIHNvIEknbGwKZHJvcCB0aGUgZXh0cmEgY2hhbmdlcy4KCj4gCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+Cj4gPiAtLS0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxl
cnMvcGwzNTMtc21jLnR4dCAgICAgICB8IDMgKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9wbDM1My1zbWMudHh0
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9w
bDM1My1zbWMudHh0Cj4gPiBpbmRleCAxMzM1Yjk0MjkxYWQuLjlkMjIwZDRjYjM5ZCAxMDA2NDQK
PiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJv
bGxlcnMvcGwzNTMtc21jLnR4dAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9wbDM1My1zbWMudHh0Cj4gPiBAQCAtMjcsNyArMjcs
OCBAQCBFeGFtcGxlOgo+ID4gIAkJY29tcGF0aWJsZSA9ICJhcm0scGwzNTMtc21jLXIycDEiLCAi
YXJtLHByaW1lY2VsbCI7Cj4gPiAgCQljbG9jay1uYW1lcyA9ICJtZW1jbGsiLCAiYXBiX3BjbGsi
Owo+ID4gIAkJY2xvY2tzID0gPCZjbGtjIDExPiwgPCZjbGtjIDQ0PjsKPiA+IC0JCXJlZyA9IDww
eGUwMDBlMDAwIDB4MTAwMD47Cj4gPiArCQlyZWcgPSA8MHhlMDAwZTAwMCAweDAwMDEwMDA+LAo+
ID4gKwkJICAgICAgPDB4ZTEwMDAwMDAgMHg1MDAwMDAwPjsKPiA+ICAJCSNhZGRyZXNzLWNlbGxz
ID0gPDI+Owo+ID4gIAkJI3NpemUtY2VsbHMgPSA8MT47Cj4gPiAgCQlyYW5nZXMgPSA8MHgwIDB4
MCAweGUxMDAwMDAwIDB4MTAwMDAwMCAvKiBOYW5kIENTIHJlZ2lvbiAqLwo+ID4gLS0gCj4gPiAy
LjI3LjAKPiA+ICAgCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
