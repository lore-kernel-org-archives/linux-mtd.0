Return-Path: <SRS0=yokd=EK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DC3C2D0A3
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2020 17:45:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F20F9206F1
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2020 17:45:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ItfF2UEz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F20F9206F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VXrr85KUWGS9hIwksSF3/MwLzAnRVLVaEzfn40ShrbU=; b=ItfF2UEzCSDCbYF9E728QYHDI
	jRYAtiUiP1j8zjm2QlR85Yj4cBnX7ks/+C77dVq2GNDRXKjpEjXrt9yaqrC2EP9LiN0YcFl2ttuEa
	L9bWrp05CZJu2zLatbW1iZBdgepwZID6xDA/P/jZNz3SnRzb1p86MhnCFywAJILLfPv/6l97LGyfl
	OdmsrcZgpoebU7/ojY5dK3IKK4pSlpnUofEJoj8t5SrtAu4+JHR5vOLYS4D20pDcCAV/w+GSyxnHg
	PuszdlnCR2zAea8vlUsQDMbN3ZcXCeTtlF3oRUKo85aNGXNETk4eWB0itzZpBXwUqxrCPAmZMApQG
	4kxBPCbMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaMqC-0000PC-Rx; Wed, 04 Nov 2020 17:45:00 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaMq9-0000MA-Ec
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2020 17:44:58 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 42C8F1BF206;
 Wed,  4 Nov 2020 17:44:45 +0000 (UTC)
Date: Wed, 4 Nov 2020 18:44:44 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: YouChing Lin <ycllin@mxic.com.tw>
Subject: Re: [PATCH] mtd: spinand: macronix: Add support for MX35LFxGE4AD
Message-ID: <20201104184444.3fd2d52d@xps13>
In-Reply-To: <1604490442-9052-1-git-send-email-ycllin@mxic.com.tw>
References: <1604490442-9052-1-git-send-email-ycllin@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_124457_636608_1C5619EE 
X-CRM114-Status: GOOD (  14.10  )
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
Cc: vigneshr@ti.com, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 gch981213@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWW91Q2hpbmcsCgpZb3VDaGluZyBMaW4gPHljbGxpbkBteGljLmNvbS50dz4gd3JvdGUgb24g
V2VkLCAgNCBOb3YgMjAyMCAxOTo0NzoyMgorMDgwMDoKCj4gVGhlIE1hY3Jvbml4IE1YMzVMRjJH
RTRBRCAvIE1YMzVMRjRHRTRBRCBhcmUgM1YsIDJHIC8gNEdiaXQgc2VyaWFsCj4gU0xDIE5BTkQg
Zmxhc2ggZGV2aWNlICh3aXRoIG9uLWRpZSBFQ0MpLgo+IAo+IFZhbGlkYXRlZCBieSByZWFkLCBl
cmFzZSwgcmVhZCBiYWNrLCB3cml0ZSwgcmVhZCBiYWNrIGFuZCBuYW5kdGVzdAo+IG9uIFhpbGlu
eCBaeW5xIFBpY29aZWQgRlBHQSBib2FyZCB3aGljaCBpbmNsdWRlZCBNYWNyb25peCBTUEkgSG9z
dAo+IChkcml2ZXJzL3NwaS9zcGktbXhpYy5jKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZb3VDaGlu
ZyBMaW4gPHljbGxpbkBteGljLmNvbS50dz4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkv
bWFjcm9uaXguYyB8IDIwICsrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
MCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL21h
Y3Jvbml4LmMgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9tYWNyb25peC5jCj4gaW5kZXggOGU4MDFl
NC4uNGY3Zjk1NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9tYWNyb25peC5j
Cj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvbWFjcm9uaXguYwo+IEBAIC0xMTksNiArMTE5
LDI2IEBAIHN0YXRpYyBpbnQgbXgzNWxmMWdlNGFiX2VjY19nZXRfc3RhdHVzKHN0cnVjdCBzcGlu
YW5kX2RldmljZSAqc3BpbmFuZCwKPiAgCQkJCQkgICAgICAmdXBkYXRlX2NhY2hlX3ZhcmlhbnRz
KSwKPiAgCQkgICAgIFNQSU5BTkRfSEFTX1FFX0JJVCwKPiAgCQkgICAgIFNQSU5BTkRfRUNDSU5G
TygmbXgzNWxmeGdlNGFiX29vYmxheW91dCwgTlVMTCkpLAo+ICsJU1BJTkFORF9JTkZPKCJNWDM1
TEYyR0U0QUQiLAo+ICsJCSAgICAgU1BJTkFORF9JRChTUElOQU5EX1JFQURJRF9NRVRIT0RfT1BD
T0RFX0RVTU1ZLCAweDI2KSwKPiArCQkgICAgIE5BTkRfTUVNT1JHKDEsIDIwNDgsIDY0LCA2NCwg
MjA0OCwgNDAsIDEsIDEsIDEpLAo+ICsJCSAgICAgTkFORF9FQ0NSRVEoOCwgNTEyKSwKPiArCQkg
ICAgIFNQSU5BTkRfSU5GT19PUF9WQVJJQU5UUygmcmVhZF9jYWNoZV92YXJpYW50cywKPiArCQkJ
CQkgICAgICAmd3JpdGVfY2FjaGVfdmFyaWFudHMsCj4gKwkJCQkJICAgICAgJnVwZGF0ZV9jYWNo
ZV92YXJpYW50cyksCj4gKwkJICAgICAwIC8qU1BJTkFORF9IQVNfUUVfQklUKi8sCgpXaGF0IGlz
IHRoZSBwdXJwb3NlIG9mIHRoaXMgY29tbWVudD8gU2hvdWxkbid0IGdldCByaWQgb2YgaXQgYW5k
IGp1c3QKa2VlcCAnMCcgaWYgdGhlIFFFIGJpdCBpcyBub3Qgc3VwcG9ydGVkPwoKPiArCQkgICAg
IFNQSU5BTkRfRUNDSU5GTygmbXgzNWxmeGdlNGFiX29vYmxheW91dCwKPiArCQkJCSAgICAgbXgz
NWxmMWdlNGFiX2VjY19nZXRfc3RhdHVzKSksCj4gKwlTUElOQU5EX0lORk8oIk1YMzVMRjRHRTRB
RCIsCj4gKwkJICAgICBTUElOQU5EX0lEKFNQSU5BTkRfUkVBRElEX01FVEhPRF9PUENPREVfRFVN
TVksIDB4MzcpLAo+ICsJCSAgICAgTkFORF9NRU1PUkcoMSwgNDA5NiwgMTI4LCA2NCwgMjA0OCwg
NDAsIDEsIDEsIDEpLAo+ICsJCSAgICAgTkFORF9FQ0NSRVEoOCwgNTEyKSwKPiArCQkgICAgIFNQ
SU5BTkRfSU5GT19PUF9WQVJJQU5UUygmcmVhZF9jYWNoZV92YXJpYW50cywKPiArCQkJCQkgICAg
ICAmd3JpdGVfY2FjaGVfdmFyaWFudHMsCj4gKwkJCQkJICAgICAgJnVwZGF0ZV9jYWNoZV92YXJp
YW50cyksCj4gKwkJICAgICAwIC8qU1BJTkFORF9IQVNfUUVfQklUKi8sCgpEaXR0bwoKPiArCQkg
ICAgIFNQSU5BTkRfRUNDSU5GTygmbXgzNWxmeGdlNGFiX29vYmxheW91dCwKPiArCQkJCSAgICAg
bXgzNWxmMWdlNGFiX2VjY19nZXRfc3RhdHVzKSksCj4gIAlTUElOQU5EX0lORk8oIk1YMzFMRjFH
RTRCQyIsCj4gIAkJICAgICBTUElOQU5EX0lEKFNQSU5BTkRfUkVBRElEX01FVEhPRF9PUENPREVf
RFVNTVksIDB4MWUpLAo+ICAJCSAgICAgTkFORF9NRU1PUkcoMSwgMjA0OCwgNjQsIDY0LCAxMDI0
LCAyMCwgMSwgMSwgMSksCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
