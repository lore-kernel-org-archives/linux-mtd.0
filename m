Return-Path: <SRS0=iVWO=M6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A57BC4338F
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 10:34:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3730610FB
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 10:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3730610FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yj1W+x69uAENX+DBOst+Igofc/5ruD4a54ZRhf2titw=; b=EXGGr8sEiPyGn2
	BrClAbMJiqgCTpbahTD7g/hHIaqLdMPH9SIuyshI4wJz7kV3a+S05HlkTtF5Mr5A07NF4aH66jPHe
	E3+tM3mianw7A5YzPazPsWAV97cG5wXOhDDs29Z9RfxfjM26DHiPKaV2eMq53wwojl67cQwkHb0LJ
	5zZDGgxDfvqZH44ZSNYwVxDae9TuEPIZiKSRUtj/mr1GiNjbkeLYjY/oAoqDGi0d559fmA2VIndZp
	Ivcb0qSl/zoxzMxc8W7PBYc+7St1PraxPHNAlrY8RqRqJap4MjVk5EN/QktCBWeHkue53KPBOVBFT
	IbUOvxslKy7YSeK43l6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCJej-00EZiU-2U; Sat, 07 Aug 2021 10:34:17 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCJef-00EZhj-QR
 for linux-mtd@lists.infradead.org; Sat, 07 Aug 2021 10:34:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 7674F100005;
 Sat,  7 Aug 2021 10:34:10 +0000 (UTC)
Date: Sat, 7 Aug 2021 12:34:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Young <sean@mess.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 4/4] mtd: rfd_ftl: fix use-after-free
Message-ID: <20210807123409.5dbceaa6@xps13>
In-Reply-To: <20210807075735.GB2522@gofer.mess.org>
References: <cover.1626169090.git.sean@mess.org>
 <29e817be984471dc2438a9414a9a7e1768d62950.1626169090.git.sean@mess.org>
 <20210806202158.5aa6ee26@xps13>
 <20210807075735.GB2522@gofer.mess.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_033414_031214_0A3FC312 
X-CRM114-Status: GOOD (  19.55  )
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

SGkgU2VhbiwKClNlYW4gWW91bmcgPHNlYW5AbWVzcy5vcmc+IHdyb3RlIG9uIFNhdCwgNyBBdWcg
MjAyMSAwODo1NzozNSArMDEwMDoKCj4gT24gRnJpLCBBdWcgMDYsIDIwMjEgYXQgMDg6MjE6NThQ
TSArMDIwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIFNlYW4sCj4gPiAKPiA+IFNlYW4g
WW91bmcgPHNlYW5AbWVzcy5vcmc+IHdyb3RlIG9uIFR1ZSwgMTMgSnVsIDIwMjEgMTA6NDQ6MDMg
KzAxMDA6Cj4gPiAgIAo+ID4gPiBkZWxfbXRkX2Jsa3RyYW5zX2RldigpIHdpbGwga2ZyZWUgcGFy
dCwgc28gdGhpcyBpcyBhIHVzZS1hZnRlci1mcmVlLiBVc2UKPiA+ID4gY29udGFpbmVyX29mKCkg
dG8gbWFrZSBpdCBjbGVhcmVyIHdoYXQgdGhlIGNhc3QgaXMgZG9pbmcuCj4gPiA+IAo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBTZWFuIFlvdW5nIDxzZWFuQG1lc3Mub3JnPgo+ID4gPiAtLS0KPiA+ID4g
IGRyaXZlcnMvbXRkL3JmZF9mdGwuYyB8IDE0ICsrKysrKystLS0tLS0tCj4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3JmZF9mdGwuYyBiL2RyaXZlcnMvbXRkL3JmZF9mdGwuYwo+
ID4gPiBpbmRleCA3ZjVmNmQyNDdjYWUuLmFmMjBhMGE3MTEwOCAxMDA2NDQKPiA+ID4gLS0tIGEv
ZHJpdmVycy9tdGQvcmZkX2Z0bC5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvbXRkL3JmZF9mdGwuYyAg
Cj4gPiAKPiA+IFsuLi5dCj4gPiAgIAo+ID4gPiBAQCAtODAwLDEwICs4MDAsMTAgQEAgc3RhdGlj
IHZvaWQgcmZkX2Z0bF9yZW1vdmVfZGV2KHN0cnVjdCAgCj4gPiBtdGRfYmxrdHJhbnNfZGV2ICpk
ZXYpICAKPiA+ID4gIAkJCXBhcnQtPm1iZC5tdGQtPm5hbWUsIGksIHBhcnQtPmJsb2Nrc1tpXS5l
cmFzZXMpOwo+ID4gPiAgCX0KPiA+ID4gIAo+ID4gPiAtCWRlbF9tdGRfYmxrdHJhbnNfZGV2KGRl
dik7Cj4gPiA+ICAJdmZyZWUocGFydC0+c2VjdG9yX21hcCk7Cj4gPiA+ICAJa2ZyZWUocGFydC0+
aGVhZGVyX2NhY2hlKTsKPiA+ID4gIAlrZnJlZShwYXJ0LT5ibG9ja3MpOwo+ID4gPiArCWRlbF9t
dGRfYmxrdHJhbnNfZGV2KCZwYXJ0LT5tYmQpOyAgCj4gPiAKPiA+IEkgYW0gbm90IHN1cmUgbW92
aW5nIHRoaXMgY2FsbCBhdCB0aGUgYm90dG9tIG9mIGZ0bF9yZW1vdmVfZGV2IG1ha2VzCj4gPiBz
ZW5zZSwgY2FuIHdlIGtlZXAgaXQgd2hlcmUgaXQgd2FzIGFuZCBqdXN0IGRvIHRoZSBzL2Rldi9w
YXJ0LT5tYmQvID8gIAo+IAo+IFRoZSByZWFzb24gZm9yIHRoaXMgcGF0Y2ggaXMgdGhhdCBkZWxf
bXRkX2Jsa3RyYW5zX2RldigpIGtmcmVlcyBpdHMgYXJndW1lbnQsCj4gc28gYm90aCBwYXJ0IGFu
ZCBkZXYgcG9pbnQgdG8gZnJlZWQgbWVtb3J5LiBUaGlzIG1lYW5zIGl0J3MgYSB1c2UgYWZ0ZXIg
ZnJlZS4KCk9rLCBwbGVhc2Ugc3BsaXQgdGhpcyBpbnRvIHR3byBwYXRjaGVzIGFuZCB3ZSdsbCBi
ZSBnb29kLgogClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
