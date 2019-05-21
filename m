Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7624C04AAF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 09:32:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DFD420856
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 09:32:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dWgcHr1o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DFD420856
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+isyuZqo0AUVafA0JTqsVS5hMTkWccFzRMLm/HivHgc=; b=dWgcHr1ojdcCb1
	bAdq6MLAvPYXNVfDo8MMafg4jsPeHcxbAVCObFMGLJ7fYfliYUPIu7cH2FGdExN0TzNajWbvyQd3f
	bSef6NaEenDh10UIu9Va5ooj4VFo2tw6usAUUIzzUhOMfNUFXm/uAcwr7RgOX1fLK2scFsjtFAY+i
	FGvAvLcmMmFFW3QJLTJ8ouYhFV3ApSBiFuLc6NcQAafHMCuahflyr9UslaqZHn+2l6x/6yLObe9pp
	nvqZsxJ4EO3CV3UC9owxpplfJjnSNgjnUM+8abBVYF4+y6jXGkLc2K6M59J0S4rxwPj0AY5fe+D9E
	KSeeTMJzc19t6qriq7yg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT18M-0005Gt-Ik; Tue, 21 May 2019 09:32:34 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT18J-0005GM-7s
 for linux-mtd@lists.infradead.org; Tue, 21 May 2019 09:32:32 +0000
Received: from xps13 (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr
 [90.88.22.185]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 2C2FE100015;
 Tue, 21 May 2019 09:32:14 +0000 (UTC)
Date: Tue, 21 May 2019 11:32:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: brcmnand: Make
 nand-ecc-strength and nand-ecc-step-size optional
Message-ID: <20190521113214.35e1edd0@xps13>
In-Reply-To: <5986da5d-2a61-b98d-9d44-d972a19ab732@kontron.de>
References: <1558379144-28283-1-git-send-email-kdasu.kdev@gmail.com>
 <5986da5d-2a61-b98d-9d44-d972a19ab732@kontron.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_023231_430472_CA6366EB 
X-CRM114-Status: GOOD (  15.18  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

ClNjaHJlbXBmIEZyaWVkZXIgPGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5kZT4gd3JvdGUgb24g
VHVlLCAyMSBNYXkKMjAxOSAwOTozMTowNCArMDAwMDoKCj4gSGkgS2FtYWwsCj4gCj4gT24gMjAu
MDUuMTkgMjE6MDUsIEthbWFsIERhc3Ugd3JvdGU6Cj4gPiBuYW5kLWVjYy1zdHJlbmd0aCBhbmQg
bmFuZC1lY2Mtc3RlcC1zaXplIGNhbiBiZSBtYWRlIG9wdGlvbmFsIGFzCj4gPiBicmNtbmFuZCBk
cml2ZXIgY2FuIHN1cHBvcnQgdXNpbmcgcmF3IE5BTkQgbGF5ZXIgZGV0ZWN0ZWQgdmFsdWVzLgo+
ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4K
PiA+IC0tLQo+ID4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20s
YnJjbW5hbmQudHh0IHwgNCArKy0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5hbmQudHh0IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9icmNtLGJyY21uYW5kLnR4dAo+ID4gaW5kZXggYmNkYTFk
Zi4uMjlmZWFiYSAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvYnJjbSxicmNtbmFuZC50eHQKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC50eHQKPiA+IEBAIC0xMDEsMTAgKzEwMSwx
MCBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBudW1iZXIgKGUuZy4sIDAsIDEsIDIsIGV0Yy4pCj4gPiAgIC0gI2FkZHJlc3MtY2VsbHMg
ICAgICAgICAgICA6IHNlZSBwYXJ0aXRpb24udHh0Cj4gPiAgIC0gI3NpemUtY2VsbHMgICAgICAg
ICAgICAgICA6IHNlZSBwYXJ0aXRpb24udHh0Cj4gPiAtLSBuYW5kLWVjYy1zdHJlbmd0aCAgICAg
ICAgIDogc2VlIG5hbmQudHh0Cj4gPiAtLSBuYW5kLWVjYy1zdGVwLXNpemUgICAgICAgIDogbXVz
dCBiZSA1MTIgb3IgMTAyNC4gU2VlIG5hbmQudHh0Cj4gPiAgIAo+ID4gICBPcHRpb25hbCBwcm9w
ZXJ0aWVzOgo+ID4gKy0gbmFuZC1lY2Mtc3RyZW5ndGggICAgICAgICA6IHNlZSBuYW5kLnR4dAo+
ID4gKy0gbmFuZC1lY2Mtc3RlcC1zaXplICAgICAgICA6IG11c3QgYmUgNTEyIG9yIDEwMjQuIFNl
ZSBuYW5kLnR4dAo+ID4gICAtIG5hbmQtb24tZmxhc2gtYmJ0ICAgICAgICAgOiBib29sZWFuLCB0
byBlbmFibGUgdGhlIG9uLWZsYXNoIEJCVCBmb3IgdGhpcwo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjaGlwLXNlbGVjdC4gU2VlIG5hbmQudHh0Cj4gPiAgIC0gYnJjbSxuYW5k
LW9vYi1zZWN0b3Itc2l6ZSA6IGludGVnZXIsIHRvIGRlbm90ZSB0aGUgc3BhcmUgYXJlYSBzZWN0
b3Igc2l6ZSAgCj4gCj4gSSB0aGluayB5b3UgYWxzbyBuZWVkIHRvIGNoYW5nZSBhbGwgcmVmZXJl
bmNlcyB0byBuYW5kLnR4dC4gVGhpcyBmaWxlIAo+IHdhcyByZWNlbnRseSBtb3ZlZCB0byBuYW5k
LWNvbnRyb2xsZXIueWFtbC4KPiAKCk9vcHMsIGNvbXBsZXRlbHkgZm9yZ290IGFib3V0IHRoYXQg
KmFnYWluKi4gVGhhbmtzIGZvciBwb2ludGluZyBpdApGcmllZGVyIQoKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
