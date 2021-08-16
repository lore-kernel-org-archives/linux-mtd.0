Return-Path: <SRS0=PqFb=NH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B370EC4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 07:32:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5016E61AAD
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 07:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5016E61AAD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pexl1nDbzkhk1kxtxMtmerE0co6Pf0vev25uY1zQzqQ=; b=q4LwCPMbV/B9+K
	MFNNJGpZaWdll86U6lUVjMjQr1NVxdNxB/FYMV/47tognvjUIjX+WPbedsYp48GuDOeA8Mp8wuiBB
	JBXeN4bqFRR79fRkfdkAETCSX+J+WWUNMQukVq2VRq6qDvZb39tdaClpQAp9Q7PIk0lLibDvz0Er5
	25uT7P4Rw2w/5/ygJFfE7jp/uy20RVgI8frjv6qIuw0EnJoBzmOyAJhnSLXVjJ6HzVPsv5FZ0zcmr
	wHKRAgQs13nk3LCFaIRBDyjuNZuJV9ecbJmJrfsVtOUV+d1HYvnDiPxvrHlJ46YDutipAfG9Qxne8
	8wDn38VvNHW9TT5OYlJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFX5s-00GN5q-A0; Mon, 16 Aug 2021 07:31:36 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFX5m-00GN1V-32
 for linux-mtd@lists.infradead.org; Mon, 16 Aug 2021 07:31:34 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 8CE7540002;
 Mon, 16 Aug 2021 07:31:27 +0000 (UTC)
Date: Mon, 16 Aug 2021 09:31:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Kestrel <kestrelseventyfour@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: xway: No hardcoded ECC engine, use
 device tree setting
Message-ID: <20210816093126.442f74a1@xps13>
In-Reply-To: <20210808072643.GA5084@ubuntu>
References: <20210808072643.GA5084@ubuntu>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_003130_337495_1BA64DFB 
X-CRM114-Status: GOOD (  20.67  )
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

SGkgRGFuaWVsLAoKRGFuaWVsIEtlc3RyZWwgPGtlc3RyZWxzZXZlbnR5Zm91ckBnbWFpbC5jb20+
IHdyb3RlIG9uIFN1biwgOCBBdWcgMjAyMQowOToyNjo0MyArMDIwMDoKCj4gU29tZSBkZXZpY2Vz
IHVzZSBNaWNyb24gTkFORCBjaGlwcywgd2hpY2ggdXNlIG9uLWRpZSBFQ0MuIFRoZSBoYXJkY29k
ZWQKPiBzZXR0aW5nIG9mIE5BTkRfRUNDX0VOR0lORV9UWVBFX1NPRlQgbWFrZXMgdGhlbSB1bnVz
YWJsZSwgYmVjYXVzZSB0aGUKPiBzb2Z0d2FyZSBFQ0Mgb24gdG9wIG9mIHRoZSBoYXJkd2FyZSBF
Q0MgcHJvZHVjZXMgZXJyb3JzIGZvciBldmVyeSByZWFkCj4gYW5kIHdyaXRlIGFjY2Vzcywgbm90
IHRvIG1lbnRpb24gdGhhdCBib290aW5nIGRvZXMgbm90IHdvcmssIGJlY2F1c2UKPiB0aGUgYm9v
dCBsb2FkZXIgdXNlcyB0aGUgY29ycmVjdCBFQ0Mgd2hlbiB0cnlpbmcgdG8gbG9hZCB0aGUga2Vy
bmVsCj4gYW5kIHN0b3BzIGxvYWRpbmcgb24gc2V2ZXJlIEVDQyBlcnJvcnMuCj4gVGhpcyBwYXRj
aCByZXF1aXJlcyB0aGUgZGV2aWNlcyB0aGF0IGN1cnJlbnRseSB3b3JrIHdpdGggdGhlIGhhcmQg
Y29kZWQKPiBzZXR0aW5nIHRvIHNldCB0aGUgbmFuZC1lY2MtbW9kZSBwcm9wZXJ0eSB0byBzb2Z0
IGluIHRoZWlyIGRldmljZQo+IHRyZWUuCj4gCgpQbGVhc2UgYWRkIGEgRml4ZXM6IGFuZCBDYzog
c3RhYmxlIHRhZ3MsIHlvdSB3aWxsIGFsc28gbmVlZCB0byBzZW5kIHRvCnN0YWJsZUB2Z2VyLmtl
cm5lbC5vcmcgYSBkaWZmZXJlbnQgdmVyc2lvbiBvZiB0aGUgcGF0Y2ggZm9yIHRoZSBrZXJuZWwK
NS40IElJVUMuCgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBLZXN0cmVsIDxrZXN0cmVsc2V2ZW50
eWZvdXJAZ21haWwuY29tPgo+IFRlc3RlZC1ieTogQWxla3NhbmRlciBKYW4gQmFqa293c2tpIDxv
bGVrMkB3cC5wbD4gIyB0ZXN0ZWQgb24gQlQgSG9tZSBIdWIgNUEKPiAtLS0KPiAgZHJpdmVycy9t
dGQvbmFuZC9yYXcveHdheV9uYW5kLmMgfCAyIC0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy94d2F5X25hbmQu
YyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3h3YXlfbmFuZC5jCj4gaW5kZXggMjY3NTE5NzZlNTAy
Li4wYTRiMGFhN2RkNGMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcveHdheV9u
YW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy94d2F5X25hbmQuYwo+IEBAIC0xNDgs
OCArMTQ4LDYgQEAgc3RhdGljIHZvaWQgeHdheV93cml0ZV9idWYoc3RydWN0IG5hbmRfY2hpcCAq
Y2hpcCwgY29uc3QgdV9jaGFyICpidWYsIGludCBsZW4pCj4gIAo+ICBzdGF0aWMgaW50IHh3YXlf
YXR0YWNoX2NoaXAoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiAgewo+IC0JY2hpcC0+ZWNjLmVu
Z2luZV90eXBlID0gTkFORF9FQ0NfRU5HSU5FX1RZUEVfU09GVDsKPiAtCj4gIAlpZiAoY2hpcC0+
ZWNjLmFsZ28gPT0gTkFORF9FQ0NfQUxHT19VTktOT1dOKQo+ICAJCWNoaXAtPmVjYy5hbGdvID0g
TkFORF9FQ0NfQUxHT19IQU1NSU5HOwoKWW91IGFsc28gbmVlZCB0byBvbmx5IHNldCB0aGUgSGFt
bWluZyBhbGdvcml0aG0gd2hlbiBlbmdpbmVfdHlwZSBpcwpUWVBFX1NPRlQuCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
