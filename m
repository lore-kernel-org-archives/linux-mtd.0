Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254BEC433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 16:50:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83D9761606
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 16:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83D9761606
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SnZ6FkVn16GtDBW6vgn2HnO8wkYaQ/J1cWvK0R4Nfw4=; b=Vr+PfxGwQTWhdm2co2uLmbASt
	BNMMuMvsVNpUGDJ+osc4beulj7P0rOphPDRwlHGUWpUwX/jPIK6c/fOFlsFigH6vLG9D3qSKzCBgS
	gMStW5Eid0uL2GpC1sOUjilMl3ArhHixHUfrAsIGCShJNgqHgcxZ3tvah2x8yKc1MH7M8o9IjsOPx
	2CttmN1aNbvQPPoQBEbpPOuFNssKFFPS759952OZpPUHBENtCyPV3hU7eY2UjwFycafG5/+fnSYc5
	oFKCIqyaOo7R1ESb39St/SsJtB1QCqdfBaOUxvZBthzBFNpeyfj2K82r+wsPs2RqvK9U0I3iF/i5e
	fdreIOccw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEasO-0004md-Ru; Tue, 23 Feb 2021 16:49:32 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEasL-0004mD-0y
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2021 16:49:30 +0000
X-Originating-IP: 86.210.203.113
Received: from xps13 (lfbn-tou-1-972-113.w86-210.abo.wanadoo.fr
 [86.210.203.113]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id AEFDBFF808;
 Tue, 23 Feb 2021 16:49:23 +0000 (UTC)
Date: Tue, 23 Feb 2021 17:49:22 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 2/3] dt-bindings: mtd: Add a property to declare secure
 regions in Qcom NANDc
Message-ID: <20210223174922.052f9776@xps13>
In-Reply-To: <20210222120259.94465-3-manivannan.sadhasivam@linaro.org>
References: <20210222120259.94465-1-manivannan.sadhasivam@linaro.org>
 <20210222120259.94465-3-manivannan.sadhasivam@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_114929_739403_74526151 
X-CRM114-Status: GOOD (  20.25  )
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
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFuaXZhbm5hbiwKCk1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNp
dmFtQGxpbmFyby5vcmc+IHdyb3RlIG9uIE1vbiwKMjIgRmViIDIwMjEgMTc6MzI6NTggKzA1MzA6
Cgo+IE9uIGEgdHlwaWNhbCBlbmQgcHJvZHVjdCwgYSB2ZW5kb3IgbWF5IGNob29zZSB0byBzZWN1
cmUgc29tZSByZWdpb25zIGluCj4gdGhlIE5BTkQgbWVtb3J5IHdoaWNoIGFyZSBzdXBwb3NlZCB0
byBzdGF5IGludGFjdCBiZXR3ZWVuIEZXIHVwZ3JhZGVzLgo+IFRoZSBhY2Nlc3MgdG8gdGhvc2Ug
cmVnaW9ucyB3aWxsIGJlIGJsb2NrZWQgYnkgYSBzZWN1cmUgZWxlbWVudCBsaWtlCj4gVHJ1c3R6
b25lLiBTbyB0aGUgbm9ybWFsIHdvcmxkIHNvZnR3YXJlIGxpa2UgTGludXgga2VybmVsIHNob3Vs
ZCBub3QKPiB0b3VjaCB0aGVzZSByZWdpb25zIChpbmNsdWRpbmcgcmVhZGluZykuCj4gCj4gU28g
bGV0J3MgYWRkIGEgcHJvcGVydHkgZm9yIGRlY2xhcmluZyBzdWNoIHNlY3VyZSByZWdpb25zIHNv
IHRoYXQgdGhlCj4gZHJpdmVyIGNhbiBza2lwIHRvdWNoaW5nIHRoZW0uCj4gCj4gU2lnbmVkLW9m
Zi1ieTogTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJv
Lm9yZz4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9xY29t
LG5hbmRjLnlhbWwgfCA3ICsrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L3Fjb20sbmFuZGMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
cWNvbSxuYW5kYy55YW1sCj4gaW5kZXggODRhZDdmZjMwMTIxLi43NTAwZTIwZGE5YzEgMTAwNjQ0
Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9xY29tLG5hbmRj
LnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Fjb20s
bmFuZGMueWFtbAo+IEBAIC00OCw2ICs0OCwxMyBAQCBwYXR0ZXJuUHJvcGVydGllczoKPiAgICAg
ICAgICBlbnVtOgo+ICAgICAgICAgICAgLSA1MTIKPiAgCj4gKyAgICAgIHFjb20sc2VjdXJlLXJl
Z2lvbnM6Cj4gKyAgICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMv
dWludDMyLWFycmF5Cj4gKyAgICAgICAgZGVzY3JpcHRpb246Cj4gKyAgICAgICAgICBSZWdpb25z
IGluIHRoZSBOQU5EIG1lbW9yeSB3aGljaCBhcmUgcHJvdGVjdGVkIHVzaW5nIGEgc2VjdXJlIGVs
ZW1lbnQKPiArICAgICAgICAgIGxpa2UgVHJ1c3R6b25lLiBUaGlzIHByb3BlcnR5IGNvbnRhaW5z
IHRoZSBzdGFydCBhZGRyZXNzIGFuZCBzaXplIG9mCj4gKyAgICAgICAgICB0aGUgc2VjdXJlIHJl
Z2lvbnMgcHJlc2VudCAob3B0aW9uYWwpLgoKV2hhdCBkb2VzIHRoaXMgIihvcHRpb25hbCkiIG1l
YW5zPyBJZiB5b3UgbWVhbiB0aGUgcHJvcGVydHkgaXMgb3B0aW9uYWwKdGhlbiBpdCBzaG91bGQg
YmUgZGVzY3JpYmVkIGFjY29yZGluZ2x5IGluIHRoZSB5YW1sIGZpbGUsIG9yIGFtIEkKbWlzc2lu
ZyBzb21ldGhpbmc/CgpJIHdvbmRlciBpZiBpdCB3b3VsZG4ndCBiZSBiZXR0ZXIgdG8gbWFrZSB0
aGlzIGEgTkFORCBjaGlwIG5vZGUKcHJvcGVydHkuIEkgZG9uJ3QgdGhpbmsgYSBxY29tIHByZWZp
eCBpcyBuZWVkZWQgYXMgcG90ZW50aWFsbHkgbWFueQpvdGhlciBTb0NzIG1pZ2h0IGhhdmUgdGhl
IHNhbWUgImZlYXR1cmUiLgoKSSdtIGZpbmUgYWRkaW5nIHN1cHBvcnQgZm9yIGl0IGluIHRoZSBx
Y29tIGRyaXZlciBvbmx5IHRob3VnaC4KCj4gKwo+ICBhbGxPZjoKPiAgICAtICRyZWY6ICJuYW5k
LWNvbnRyb2xsZXIueWFtbCMiCj4gIAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
