Return-Path: <SRS0=LI9S=HF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01CE9C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Feb 2021 10:06:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 783D264DDB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Feb 2021 10:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 783D264DDB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2u3tq/xH2ouqCJ244Y3frhCXtCF0Wg+lDyIASOxhYtE=; b=JXWDG6GbCOW9hhVZXGEDFXuyF
	TzjeZvJEueo9HYxucgsgyEQwEKobzI/12C7tbRSgwpozdIPB12zjgJN1115tui+T3uesKcPNwmMgp
	ucXZ7iCEzbPnuVdiiuru69IMW92faYljrfh5LA753XbE9IdTYbgBURulWbTrY2T+pEYLp/gz1LOZ/
	ma8zQuP+cCm04D64z4urHeN8VRCyUhzZoZdUTZ3MclIEjkmA9HCfETIMq1PKn7K0Se1UhMMlXFpTm
	Qajmxe4B3Skt5yT/bSN6kYgvM20vaQ7ZC5EW+69nyOEhpZCrpbERoQv1F+I8n0MkAKb4lnFLcnxCU
	E/D3NCZQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7F2U-0000N3-7H; Wed, 03 Feb 2021 10:05:34 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7F2O-0000M3-Ob
 for linux-mtd@lists.infradead.org; Wed, 03 Feb 2021 10:05:32 +0000
X-Originating-IP: 86.210.203.150
Received: from xps13 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr
 [86.210.203.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6CF792000E;
 Wed,  3 Feb 2021 10:05:23 +0000 (UTC)
Date: Wed, 3 Feb 2021 11:05:22 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] mtd: rawnand: Do not check for bad block if bbt is
 unavailable
Message-ID: <20210203110522.12f2b326@xps13>
In-Reply-To: <AFD0F5A6-7876-447B-A089-85091225BE11@linaro.org>
References: <20210130035412.6456-1-manivannan.sadhasivam@linaro.org>
 <20210201151824.5a9dca4a@xps13> <20210202041614.GA840@work>
 <20210202091459.0c41a769@xps13>
 <AFD0F5A6-7876-447B-A089-85091225BE11@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_050528_996441_B66D8873 
X-CRM114-Status: GOOD (  24.32  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFuaXZhbm5hbiwKCk1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNp
dmFtQGxpbmFyby5vcmc+IHdyb3RlIG9uIFdlZCwKMDMgRmViIDIwMjEgMTU6Mjg6MjAgKzA1MzA6
Cgo+IEhpIE1pcXVlbCwgCj4gCj4gT24gMiBGZWJydWFyeSAyMDIxIDE6NDQ6NTkgUE0gSVNULCBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+SGkgTWFu
aXZhbm5hbiwKPiA+Cj4gPk1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNp
dmFtQGxpbmFyby5vcmc+IHdyb3RlIG9uIFR1ZSwKPiA+MiBGZWIgMjAyMSAwOTo0NjoxNCArMDUz
MDoKPiA+ICAKPiA+PiBIaSwKPiA+PiAKPiA+PiBPbiBNb24sIEZlYiAwMSwgMjAyMSBhdCAwMzox
ODoyNFBNICswMTAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPj4gPiBIaSBNYW5pdmFubmFu
LAo+ID4+ID4gCj4gPj4gPiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFz
aXZhbUBsaW5hcm8ub3JnPiB3cm90ZSBvbiAgCj4gPlNhdCwgIAo+ID4+ID4gMzAgSmFuIDIwMjEg
MDk6MjQ6MTIgKzA1MzA6Cj4gPj4gPiAgICAgCj4gPj4gPiA+IFRoZSBiYnQgcG9pbnRlciB3aWxs
IGJlIHVuYXZhaWxhYmxlIHdoZW4gTkFORF9TS0lQX0JCVFNDQU4gb3B0aW9uICAKPiA+aXMgIAo+
ID4+ID4gPiBzZXQgZm9yIGEgTkFORCBjaGlwLiBUaGUgaW50ZW50aW9uIGlzIHRvIHNraXAgc2Nh
bm5pbmcgZm9yIHRoZSAgCj4gPmJhZCAgCj4gPj4gPiA+IGJsb2NrcyBkdXJpbmcgYm9vdCB0aW1l
LiAgICAKPiA+PiA+IAo+ID4+ID4gSSBkb24ndCBoYXZlIHRoZSBzYW1lIHVuZGVyc3RhbmRpbmc6
IHRoaXMgZmxhZyBza2lwcyB0aGUgYmFkIGJsb2NrCj4gPj4gPiB0YWJsZSBzY2FuLCBub3QgdGhl
IGJhZCBibG9jayBzY2FuLiBXZSBkbyB3YW50IHRvIHNjYW4gYWxsIHRoZSAgCj4gPmRldmljZXMg
IAo+ID4+ID4gaW4gb3JkZXIgdG8gY29uc3RydWN0IGEgUkFNIGJhc2VkIHRhYmxlLgo+ID4+ID4g
ICAgIAo+ID4+ID4gPiBIb3dldmVyLCB0aGUgTVREIGNvcmUgd2lsbCBjYWxsCj4gPj4gPiA+IF9i
bG9ja19pc3Jlc2VydmVkKCkgYW5kIF9ibG9ja19pc2JhZCgpIGNhbGxiYWNrcyB1bmNvbmRpdGlv
bmFsbHkgIAo+ID5mb3IgIAo+ID4+ID4gPiB0aGUgcmF3bmFuZCBkZXZpY2VzIGR1ZSB0byB0aGUg
Y2FsbGJhY2tzIGFsd2F5cyBwcmVzZW50IHdoaWxlICAKPiA+Y29sbGVjdGluZyAgCj4gPj4gPiA+
IHRoZSBlY2Mgc3RhdHMuCj4gPj4gPiA+IAo+ID4+ID4gPiBUaGUgX2Jsb2NrX2lzcmVzZXJ2ZWQo
KSBjYWxsYmFjayBmb3IgcmF3bmFuZCB3aWxsIGJhaWwgb3V0IGlmIGJidAo+ID4+ID4gPiBwb2lu
dGVyIGlzIG5vdCBhdmFpbGFibGUuIEJ1dCBfYmxvY2tfaXNiYWQoKSB3aWxsIGNvbnRpbnVlICAK
PiA+d2l0aG91dCAgCj4gPj4gPiA+IGNoZWNraW5nIGZvciBpdC4gU28gdGhpcyBjb250cmFkaWN0
cyB3aXRoIHRoZSBOQU5EX1NLSVBfQkJUU0NBTiAgCj4gPm9wdGlvbiAgCj4gPj4gPiA+IHNpbmNl
IHRoZSBiYWQgYmxvY2sgY2hlY2sgd2lsbCBoYXBwZW4gYW55d2F5cyAoaWUuLCBub3QgbXVjaCAg
Cj4gPmRpZmZlcmVuY2UgIAo+ID4+ID4gPiBiZXR3ZWVuIHNjYW5uaW5nIGZvciBiYWQgYmxvY2tz
IGFuZCBjaGVja2luZyBlYWNoIGJsb2NrIGZvciBiYWQgIAo+ID5vbmVzKS4gIAo+ID4+ID4gPiAK
PiA+PiA+ID4gSGVuY2UsIGRvIG5vdCBjaGVjayBmb3IgdGhlIGJhZCBibG9jayBpZiBiYnQgcG9p
bnRlciBpcyAgCj4gPnVuYXZhaWxhYmxlLiAgICAKPiA+PiA+IAo+ID4+ID4gTm90IGNoZWNraW5n
IGZvciBiYWQgYmxvY2tzIGF0IGFsbCBmZWVscyBpbnNhbmUuIEkgZG9uJ3QgcmVhbGx5IGdldCAg
Cj4gPnRoZSAgCj4gPj4gPiBzY29wZSBhbmQgZ29hbCBvZiBzdWNoIGNoYW5nZT8KPiA+PiA+ICAg
ICAKPiA+PiAKPiA+PiBUaGUgaXNzdWUgSSBlbmNvdW50ZXJlZCBpcywgb24gdGhlIFRlbGl0IEZO
OTgwIGRldmljZSBvbmUgb2YgdGhlCj4gPj4gcGFydGl0aW9uIHNlZW1zIHRvIGJlIHByb3RlY3Rl
ZC4gU28gdHJ5aW5nIHRvIHJlYWQgdGhlIGJhZCBibG9ja3MgaW4KPiA+PiB0aGF0IHBhcnRpdGlv
biBtYWtlcyB0aGUgZGV2aWNlIHRvIHJlYm9vdCBkdXJpbmcgYm9vdC4gIAo+ID4KPiA+b19PCj4g
Pgo+ID5SZWFkaW5nIGEgcHJvdGVjdGVkIGJsb2NrIG1ha2VzIHRoZSBkZXZpY2UgdG8gcmVib290
Pwo+ID4KPiA+V2hhdCBpcyB0aGUgZXhhY3QgZGV2aWNlPyBDYW4geW91IHNoYXJlIHRoZSBkYXRh
c2hlZXQ/IElzIHRoaXMgYmVoYXZpb3IKPiA+ZXhwZWN0ZWQ/IEJlY2F1c2UgaXQgc2VlbXMgcmVh
bGx5IGJyb2tlbiB0byBtZSwgYSByZWFkIHNob3VsZCBub3QKPiA+dHJpZ2dlciAqYW55dGhpbmcq
IHRoYXQgYmFkLgo+ID4gIAo+IAo+IEkgZ290IG1vcmUgaW5mb3JtYXRpb24gZnJvbSB0aGUgdmVu
ZG9yLCBUZWxpdC4gVGhlIGFjY2VzcyB0byB0aGUgM3JkIHBhcnRpdGlvbiBpcyBwcm90ZWN0ZWQg
YnkgVHJ1c3R6b25lIGFuZCBhbnkgYWNjZXNzIGluIG5vbiBwcml2aWxlZ2VkIG1vZGUgKHdoZXJl
IExpbnV4IGtlcm5lbCBydW5zKSBjYXVzZXMga2VybmVsIHBhbmljIGFuZCB0aGUgZGV2aWNlIHJl
Ym9vdHMuIAoKT2ssIHNvIHRoaXMgaXMgbm90IGEgY2hpcCBmZWF0dXJlIGJ1dCBtb3JlIGEgaG9z
dCBjb25zdHJhaW50LgoKSW4gdGhpcyBjYXNlIGl0IHdvdWxkIGJlIGEgZ29vZCBpZGVhIHRvIGFk
ZCBhIGhvc3QgRFQgcHJvcGVydHkgd2hpY2gKZGVzY3JpYmVzIHRoZSB6b25lIHRvIGF2b2lkIGFj
Y2Vzc2luZyBpdC4gU29tZXRoaW5nIGxpa2U6CgoJc2VjdXJlLWFyZWEvc2VjdXJlLXNlY3Rpb24g
PSA8c3RhcnQgbGVuZ3RoPjsKCkZyb20gdGhlIGNvcmUgcGVyc3BlY3RpdmUsIHdlIHNob3VsZCBw
YXJzZSB0aGlzIHByb3BlcnR5IGVhcmx5IGVub3VnaAphbmQgcmV0dXJuIC1FSU8gd2hlbiB0cnlp
bmcgdG8gYWNjZXNzIHRoaXMgYXJlYS4KCkRvZXMgdGhpcyBzb2x1dGlvbiBzb3VuZCByZWFzb25h
YmxlIHRvIHlvdT8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
