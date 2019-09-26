Return-Path: <SRS0=cKKb=XV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C49DC432C2
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2019 11:44:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F09CB207FF
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2019 11:44:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KZD78cOo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F09CB207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0k75CE365pF+C/Rw+DQJyjByNnAYeYbmiYtmEYRs4Fo=; b=KZD78cOo/6KyB3
	cmkoebON5hiwCjswGc+8SyLuHgcnbxLA3YH6NQrfUDIjeoGNdYunKEcggY1sf796MjjApQEh0bfgB
	9mBqvOo9pnBJml/lY9htB9vXEh4ad9yZFOyV5M9Fx6IxsvMbckl5urG3OGTGKjHvLXxD3MmIFsDRw
	BiX9WrQnqROTlZ5eWmbh0rtN0dtS1TYVFrPzxSfygw6h0xjj8dLehC82sAo6SXJrjcrju83Kc1cad
	mfpV3AFu665dQNeXL7/SH7gDOlka5xASYWBhjtBIBcbYBUoXOjayad8C47ecZ5qJTOzoE85TLxyDz
	Io6qxrfererDtTEhhl7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDSC7-0006Lr-31; Thu, 26 Sep 2019 11:44:23 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDSC3-0006LJ-Cj
 for linux-mtd@lists.infradead.org; Thu, 26 Sep 2019 11:44:21 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 3A254609D2CF;
 Thu, 26 Sep 2019 13:44:15 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ReKmIO0lyASL; Thu, 26 Sep 2019 13:44:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B694A609D2D9;
 Thu, 26 Sep 2019 13:44:14 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4iGv9MrEF_UT; Thu, 26 Sep 2019 13:44:14 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 56AC5609D2CF;
 Thu, 26 Sep 2019 13:44:14 +0200 (CEST)
Date: Thu, 26 Sep 2019 13:44:14 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Alexander Dahl <ada@thorsis.com>
Message-ID: <242144136.6776.1569498254158.JavaMail.zimbra@nod.at>
In-Reply-To: <1846895.TZtMPCjSJF@ada>
References: <20190725203442.29795-1-richard@nod.at> <1846895.TZtMPCjSJF@ada>
Subject: Re: [PATCH] ubi-utils: Implement a ubihealthd
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubi-utils: Implement a ubihealthd
Thread-Index: OpUnHH8SFSKv2ahE7f7l+nWIcbh8Ww==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190926_044419_583809_426F8688 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 david oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QWxleCwKCi0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiBWb246ICJBbGV4YW5kZXIg
RGFobCIgPGFkYUB0aG9yc2lzLmNvbT4KPiBXaGF0IGlzIGl0IGV4YWN0bHksIHdoaWNoIHJlcXVp
cmVzIHN1Y2ggYSBuZXcgTGludXggS2VybmVsPyBUaGUgbGF0ZXN0IExUUyBpcwo+IHN0aWxsIHY0
LjE5IOKApiA7LSkKClRoZSBuZXcgVUJJIG1hY2hpbmVyeSB3aGljaCBhbGxvd3MgdXNlcnNwYWNl
IHRvIGNvbnRyb2wgc2NydWJiaW5nIHdhcyBhZGRlZCBpbiA1LjIuCgpbLi5dCgo+PiArCXNyYW5k
KHNlZWQpOwo+PiArfQo+IAo+IElzIGl0IHJlYWxseSBuZWNlc3NhcnkgdG8gc2VlZCB3aXRoIGdl
dHJhbmRvbSgpIGZvciBqdXN0IHJhbmRvbWl6aW5nIGEgbGlzdCBvZgo+IFBFQnM/IEkga25vdyB0
aGlzIGlzIGVtYmVkZGVkLCBhbmQgc2VlZGluZyB3aXRoIHRoZSBzYW1lIHRpbWUgb24gZWFjaCBi
b290Cj4gKHRob3NlIGRldmljZXMgYWx3YXlzIHN0YXJ0IDE5NzAgOy0pICkgbWlnaHQgYmUgYSBi
YWQgaWRlYSBmb3IgY3J5cHRvLCBidXQgZm9yCj4ganVzdCBzaHVmZmxpbmcgYSBQRUIgbGlzdCB0
byBzcHJlYWQgdGhvc2UgdGVzdHMgcmFuZG9tbHk/CgpZZXMuIFRoZSBsaXN0IHJlYWxseSBuZWVk
cyB0byBiZSBzaHVmZmxlZC4KCkJlZm9yZSBnZXRyYW5kb20oKSB3ZSB1c2VkIHRpbWUoKSBhbmQg
ZmFjZWQgZXhhY3RseSB0aGUgY2FzZSB3aGVyZSBjdXN0b21lciBib2FyZHMKYWx3YXlzIHN0YXJ0
ZWQgd2l0aCB0aGUgc2FtZSBwZXJtdXRhdGlvbiBiZWNhdXNlIHRoZXkgaGFkIG5vIFJUQy4KCklm
IHlvdSBkb24ndCBzaHVmZmxlIHRoZSBsaXN0IHlvdSBjYW5ub3QgaGF2ZSB0aGUgZGFlbW9uIHN0
YXRlbGVzcy4KCkZvciBleGFtcGxlLCBpZiB0aGUgYm9hcmQgcmVib290cyBvbmNlIGEgZGF5IGFu
ZCBjb21wbGV0aW5nIHRoZSBQRUIgbGlzdApuZWVkcyBhIHdlZWsgeW91IHdpbGwgYWx3YXlzIGNo
ZWNrIHRoZSBzYW1lIFBFQnMgYW5kIG1pc3MgdGhlIHNhbWUgb25lcy4KIAo+IEknZCByZWFsbHkg
bGlrZSB0byB0ZXN0IHRoaXMgZGFlbW9uLCBidXQgYWxzbyBmb3Igb2xkZXIgc3lzdGVtcyBub3Qg
cnVubmluZwo+IGJsZWVkaW5nIGVkZ2UgQlNQcy4gV291bGQgeW91IGFjY2VwdCBwYXRjaGVzIHRv
IG1ha2UgaXQgd29yayB3aXRoIGxldCdzIHNheQo+IGtlcm5lbCB2NC45IGFuZCBnbGliYyB2Mi4y
MCDigKYgTzotKQoKV2VsbCwgeW91IG5lZWQgdG8gYmFja3BvcnQgdGhlIFVCSSBjaGFuZ2VzIGFu
eXdheS4KQnV0IHBhdGNoZXMgdG8gbWFrZSBpdCB3b3JrIG9uIG90aGVyL29sZGVyIGxpYmNzIGFy
ZSBoYXBwaWx5IGFjY2VwdGVkCmlmIHRoZXkgYXJlIHNhbmUuIDotKQoKVGhhbmtzLAovL3JpY2hh
cmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
