Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6F4FCD0A6
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2026 10:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=B7xd1juIJr6RbwakV0aalmUFcaPkOiEJlXPAJcUcSAw=; b=oMLJd4uTP/auafdo80RrtVK+NU
	mncECgq3QfiKWsm9uw67hbRMMKFkKmmu0oBa7GBhSLk26b9wITrOaz03ohXj/NjU/61/BBj8I73NE
	WLnf+FhjGOJhaEAQJLn2/VAea9PRSl+V9hudydKvVj2QQPvfJ1FWxgR/qnu2nRCqPXG5p2BbhBoGL
	rLgKbgpx7MBvs6bmrp6UtGYoiMyeL0M4N4JRE5hgMPIzmblNpxnfaEHxxljh53aZj87hIel1mbYbY
	J3lYXLLgaJxUvqemsOhMai0KFAq522roLZJXqfq2LWFAOs4TdnfZ33yAI+YYdJFFcJ2ysHZF2jW3e
	TqyfgNcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2nok-00000008BOH-3SMa;
	Wed, 18 Mar 2026 10:07:58 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2noi-00000008BNB-0g2X
	for linux-mtd@lists.infradead.org;
	Wed, 18 Mar 2026 10:07:57 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id CD785BE348;
	Wed, 18 Mar 2026 11:07:52 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id SMu1kEsC8XZk; Wed, 18 Mar 2026 11:07:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id D5D0DBE34D;
	Wed, 18 Mar 2026 11:07:51 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Gs6UkXmNPkGl; Wed, 18 Mar 2026 11:07:51 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id A945FBE346;
	Wed, 18 Mar 2026 11:07:51 +0100 (CET)
Date: Wed, 18 Mar 2026 11:07:51 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Christoph Hellwig <hch@infradead.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	jserv <jserv@ccns.ncku.edu.tw>, eleanor15x <eleanor15x@gmail.com>, 
	marscheng <marscheng@google.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <566555015.53186.1773828471518.JavaMail.zimbra@nod.at>
In-Reply-To: <abo-vgtDeFNRjG5G@infradead.org>
References: <20260317165905.1482256-1-visitorckw@gmail.com> <abo-vgtDeFNRjG5G@infradead.org>
Subject: Re: [PATCH v2] lib/list_sort: introduce list_sort_nonatomic() and
 clean up scheduling workarounds
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF148 (Linux)/8.8.12_GA_3809)
Thread-Topic: lib/list_sort: introduce list_sort_nonatomic() and clean up scheduling workarounds
Thread-Index: yTkjJ6vHpIDh1IwbTwoEKqnlDnYBOg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_030756_342492_5F543FF9 
X-CRM114-Status: UNSURE (   7.67  )
X-CRM114-Notice: Please train this message.
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkNocmlzdG9waCBIZWxsd2ln
IiA8aGNoQGluZnJhZGVhZC5vcmc+Cj4+IFRoaXMgY2hhbmdlIGxlYXZlcyB0aGUgZ2VuZXJpYyBs
aXN0X3NvcnQoKSBjb21wbGV0ZWx5IGZyZWUgb2YKPj4gc2NoZWR1bGluZyBoYWNrcywgc2ltcGxp
ZmllcyBVQklGUydzIGNhbGxiYWNrcywgYW5kIGVuc3VyZXMgdGhhdCBsZWdhY3kKPj4gbG9uZy1s
aXN0IHNvcnRpbmcgd29ya2xvYWRzIHJlbWFpbiBzYWZlIGZyb20gc29mdCBsb2NrdXBzIG9uCj4+
IG5vbi1wcmVlbXB0aWJsZSBrZXJuZWxzLgo+IAo+IEFzIHNhaWQgYmVmb3JlIHdlIHJlYWxseSBz
aG91bGQgbm90IGFkZCB0aGUgZXh0cmEgbm9uYXRvbWljIEFQSQo+IGFuZCBqdXN0IGRvIHRoZSBy
aWdodCB0aGluZywgYW5kIGRyb3AgdGhlIGNvbmRfcmVzY2hlZCBpbiB1Ymlmcwo+IGluIGEgcHJl
cCBwYXRjaC4KCkkgdGhpbmsgeW91IGFyZSByaWdodC4gQWZ0ZXIgaW5zcGVjdGluZyBVQklGUydz
IHVzYWdlIG9mIGxpc3Rfc29ydCgpCkkgZmVlbCBtb3JlIGNvbmZpZGVudCB0aGF0IHdlIGNhbiBy
ZW1vdmUgdGhlIGNhbGxzIHRvIGNvbmRfcmVzY2hlZCgpCmZyb20gdGhlIGNvbXBhcmUgZnVuY3Rp
b25zLgoKVGhlIGNvbXBhcmUgZnVuY3Rpb25zIGFyZSByYXRoZXIgY2hlYXAsIHRoZXkgZG9uJ3Qg
ZG8gKGJsb2NraW5nKQpNVEQgaW8uCkluIHRoZSBHQyBjYXNlIGVhY2ggbGlzdCBjb250YWlucyBh
dCBtb3N0IGFzIG1hbnkgVUJJRlMgbm9kZXMgeW91IGNhbgpzdHVmZiBpbnRvIGEgc2luZ2xlIExF
Qi4KVGhlIHJlcGxheSBjYXNlIGlzIGEgbGl0dGxlIGRpZmZlcmVudCwgdGhlIHJlcGxheSBsaXN0
IGNhbiBjb250YWluCmVsZW1lbnRzIGZyb20gbXVsdGlwbGUgTEVCcy4gQnV0IHRoZSBVQklGUyBq
b3VybmFsIGlzIGxpbWl0ZWQgdG8KYSBmZXcgTEVCcywgc28gdGhlIGxpc3QgaXMgbGlrZWx5IGFs
d2F5cyBhdCBtb3N0IGEgZmV3IHRob3VzYW5kCmVsZW1lbnRzIGxvbmcuClNvLCB3ZSBhbHdheXMg
dGFsayBhYm91dCBjYWxsaW5nIHRoZSBjb21wYXJlIGZ1bmN0aW9ucyBhIGZldyB0aG91c2FuZAp0
aW1lcywgbm90IG1pbGxpb25zIHRpbWVzLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
