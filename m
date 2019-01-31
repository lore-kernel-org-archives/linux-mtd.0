Return-Path: <SRS0=cI5g=QH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC51C169C4
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 14:32:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F264218AC
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 14:32:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K8i6fm3V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F264218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yBTrJDUUM7FXt1TxNzLh0+1vSbXaXOLknkAOGxWDdEk=; b=K8i6fm3VTYTN7Z
	9bJgF2lUn6Vy6EF0XAIDGw/AkLC9KZprVwqTB2EoGCb9gVzb/qmBZfntBJYb/AophsjvyQ7qLMyHp
	jaMXgMX6VMFPQN9oub2SxCGtff6so1zHnFjdzl0Nl4o2muAEpjyuen1cAKKq52kR6+9mjFv6eQmOe
	wBQ+5XukcoQehlgwSwl5WMdO3dqrp3Huuzq/TNr4MtkhX1wiD9pe6HFvo/Qq3pNrl6pTXB1tWm1su
	ViGug33g07NRg1XX2pRKMrghzBe7oh6qla/TM01W9kiv9/6AG24OrW+Z8O1Fdc9JvqtKI7oz2hY6i
	qO/fP5MCH0pKvBoEeduQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpDNz-0001wM-P1; Thu, 31 Jan 2019 14:32:11 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpDNv-0001vq-VC
 for linux-mtd@lists.infradead.org; Thu, 31 Jan 2019 14:32:10 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1B1DB608A3A9;
 Thu, 31 Jan 2019 15:31:56 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id FnY56Q586ytS; Thu, 31 Jan 2019 15:31:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 41BF9608A3AB;
 Thu, 31 Jan 2019 15:31:54 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id k15HZWK65QkD; Thu, 31 Jan 2019 15:31:54 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2326E608A3A9;
 Thu, 31 Jan 2019 15:31:54 +0100 (CET)
Date: Thu, 31 Jan 2019 15:31:54 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: =?utf-8?B?Z3RrX3RpYW5taW5nemh1KOelneWkqeWQje+8iQ==?=
 <gtk_tianmingzhu@mediatek.com>
Message-ID: <960893973.31518.1548945114057.JavaMail.zimbra@nod.at>
In-Reply-To: <00b8e0969b9b493d893ca3f09f3d3a4a@MTKMBS31N1.mediatek.inc>
References: <00b8e0969b9b493d893ca3f09f3d3a4a@MTKMBS31N1.mediatek.inc>
Subject: Re: Fix journal replay xattr nodes issue [need your help!]
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.8_GA_3025 (ZimbraWebClient - FF60 (Linux)/8.8.8_GA_1703)
Thread-Topic: Fix journal replay xattr nodes issue [need your help!]
Thread-Index: AdS4r1YqokolpifjSPWaEakDcBWp/AAAWk5wE3sojW8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190131_063208_148396_6AE4D079 
X-CRM114-Status: UNSURE (   7.69  )
X-CRM114-Notice: Please train this message.
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
Cc: karam lee <karam.lee@lge.com>, linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGlhbm1pbmcsCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gVm9uOiAiZ3RrX3Rp
YW5taW5nemh1KOelneWkqeWQje+8iSIgPGd0a190aWFubWluZ3podUBtZWRpYXRlay5jb20+Cj4g
QW46ICJSaWNoYXJkIFdlaW5iZXJnZXIiIDxyaWNoYXJkLndlaW5iZXJnZXJAZ21haWwuY29tPgo+
IENDOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAia2FyYW0g
bGVlIiA8a2FyYW0ubGVlQGxnZS5jb20+Cj4gR2VzZW5kZXQ6IE1pdHR3b2NoLCAzMC4gSmFudWFy
IDIwMTkgMTY6MzI6MDEKPiBCZXRyZWZmOiBGaXggam91cm5hbCByZXBsYXkgeGF0dHIgbm9kZXMg
aXNzdWUgW25lZWQgeW91ciBoZWxwIV0KCj4gSGkgQUxMCj4gCj4gTXkgdWJpZnMgKGZpbGVzeXN0
ZW0gc2l6ZTo1TSwgZW5hYmxlIHhhdHRyIGZlYXR1cmUpIHdpbGwgbW91bnQgZmFpbGVkIG9yIGJl
Y29tZQo+IHJlYWQtb25seSBhZnRlciBpbnRlZ2NrIOKAk3AgdGVzdCBhYm91dCA1IG1pbnV0ZXMu
Cj4gSWYgZGlzYWJsZSB4YXR0ciBmZWF0dXJlIHRoZSBpbnRlZ2NrIGFuZCBjaGVrX2ZzIHdpbGwg
cGFzc2VkLgoKQ2FuIHlvdSBwbGVhc2Ugc2hhcmUgdGhlIGV4YWN0IHRlc3QgY2FzZT8KSXQgd291
bGQgYmUgd29uZGVyZnVsIGlmIHlvdSBjYW4gdHJpZ2dlciBpdCBkaXJlY3RseSB3aXRoIGludGVn
Y2suCkkgd2FzIHNpbWlsYXIgcmVwb3J0cyBidXQgbm90aGluZyBjbGVhciBzbyBmYXIuCgo1TWlC
IGlzIGEgcmF0aGVyIHNtYWxsIGZzLCBtYXliZSB0aGlzIGlzIHRoZSBrZXkuLi4KVUJJRlMgaGFz
IHR3byB3YXlzIHRvIHN0b3JlIHRoZSBMUFQuIEJpZyBhbmQgc21hbGwgbW9kZWwuCiAKPiBBZnRl
ciBhcHBseSB5b3VyIHBhdGNoIGh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC83MTMy
MTMvIHRoZSBpbnRlZ2NrCj4gdGVzdCB1c3VhbGx5IGxhc3RzIGFib3V0IGFuIGhvdXIuIEJ1dCBz
dGlsbCBmYWlsZWQuKAo+IHN5cy9rZXJuZWwvZGVidWcvdWJpZnMvY2hrX2ZzIiBhbHNvIGZhaWxl
ZCApCj4gQ291bGQgeW91IGhlbHAgbWUgdG8gY2hlY2sgdGhpcyBwcm9ibGVtICx0aGFua3MhCgpU
aGlzIHBhdGNoIGZpeGVzIGEgcHJvYmxlbSB3aXRoIGludGVycnVwdGVkIE5BTkQgb3BlcmF0aW9u
cyB3aGVyZSBVQklGUyBmYWNlcwpFQ0MgZXJyb3JzIHdoaWxlIHJlY292ZXJ5LgpJIGRvbid0IHRo
aW5rIGl0IGlzIHJlbGF0ZWQgdG8gdGhpcyBpc3N1ZS4KIApBbnl3YXksIEknbSBvbiB2YWNhdGlv
biBub3cgZm9yIGEgZmV3IGRheXMgYW5kIHRoZXJlZm9yZSBoYXZlIGxpbWl0ZWQgaW50ZXJuZXQg
YWNjZXNzLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
