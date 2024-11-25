Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC8CD58D5E
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Nov 2024 15:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lxEreHytzzTVbbgTdriJVyNd5iH32rw6zTg12yZzcdo=; b=3/Dy6VAq+bYY6I7HoA0prFXnxY
	HrJuL6zUTF2mWRlTBlNW2vCMrZ5iXxdjXDGFUV46dqyuCLnM6+lLQo7jJZngVaXpYXqHD4HITe7BQ
	GEn67NnrvH1HycaQ6FIpG5Njo0+JS9s41KRAeiQCy1xRAcp4Zoux8kPnglDh+PiTlfVxNFUaffBfT
	8STOcHjmKHe8CuBACGIflGV4kvqThugQYCly37hy8Jq18hxN3j45wOcxA8RBW1iPyRDFZPBhBu380
	LhuowpOQPiRsBTbaQiBNsUBuYK9nRovTi/lWuuRCMkRD+TjImRv2JBaSAjEDecB61sEBVc6b3rMtH
	tJrl8OGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFbGo-00000008Y38-142I;
	Mon, 25 Nov 2024 15:45:02 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFbGk-00000008Y22-3PQS
	for linux-mtd@lists.infradead.org;
	Mon, 25 Nov 2024 15:45:00 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 998292E6146;
	Mon, 25 Nov 2024 16:44:55 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id abQ0_drATx8y; Mon, 25 Nov 2024 16:44:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id D583A2E6144;
	Mon, 25 Nov 2024 16:44:54 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 5KImpIwnRJzq; Mon, 25 Nov 2024 16:44:54 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9E4B72E612D;
	Mon, 25 Nov 2024 16:44:54 +0100 (CET)
Date: Mon, 25 Nov 2024 16:44:54 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Rickard X Andersson <rickard.andersson@axis.com>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	rickard314 andersson <rickard314.andersson@gmail.com>, 
	kernel <kernel@axis.com>
Message-ID: <1924178924.70981051.1732549494294.JavaMail.zimbra@nod.at>
In-Reply-To: <20241125134820.560648-1-rickard.andersson@axis.com>
References: <20241125134820.560648-1-rickard.andersson@axis.com>
Subject: Re: [PATCH 1/2] ubi: Expose interface for detailed erase counters
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF132 (Linux)/8.8.12_GA_3809)
Thread-Topic: Expose interface for detailed erase counters
Thread-Index: 48qeH/Yt0zKh2IEt9pOD12QbbL+YPg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_074458_988232_7672C6B0 
X-CRM114-Status: GOOD (  10.78  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlJpY2thcmQgWCBBbmRlcnNz
b24iIDxyaWNrYXJkLmFuZGVyc3NvbkBheGlzLmNvbT4KPiArLyoqCj4gKyAqIHN0cnVjdCB1Ymlf
ZWNpbmZvX3JlcSAtIGEgZGF0YSBzdHJ1Y3R1cmUgdXNlZCBpbiBVQkkgZGV2aWNlIGVyYXNlIGNv
dW50Cj4gKyAqIGluZm9ybWF0aW9uIHJlcXVlc3RzIGFuZCByZXNwb25zZXMuCj4gKyAqCj4gKyAq
IEBzdGFydF9lY19yZXE6IGZpcnN0IGVyYXNlIGNvdW50ZXIgYmxvY2sgaW4gcmFuZ2UgdG8gcmVh
ZAo+ICsgKiBAZW5kX2VjX3JlcTogbGFzdCBlcmFzZSBjb3VudGVyIGJsb2NrIGluIHRoZSBoYWxm
LW9wZW4gcmFuZ2UKPiArICogQGVuZF9lY19yZXM6IGxhc3QgZXJhc2UgY291bnRlciBibG9jayB0
aGF0IHdhcyBhY3R1YWxseSByZWFkCj4gKyAqIEBlcmFzZV9jb3VudGVyczogYXJyYXkgb2YgZXJh
c2UgY291bnRlciB2YWx1ZXMKPiArICogQHBhZGRpbmc6IHJlc2VydmVkIGZvciBmdXR1cmUsIG5v
dCB1c2VkLCBoYXMgdG8gYmUgemVyb2VkCj4gKyAqCj4gKyAqIEVyYXNlIGNvdW50ZXJzIGFyZSBy
ZWFkIGluIHJhbmdlIEBzdGFydF9lY19yZXEgdG8gQGVuZF9lY19yZXEuIFJhbmdlIGlzCj4gaGFs
Zi1vcGVuCj4gKyAqIGkuZSBlcmFzZSBjb3VudGVyIG9mIGVuZF9lY19yZXEgaXMgbm90IGFjdHVh
bGx5IGluY2x1ZGVkLgo+ICsgKiBUaGUgcmVhZCBlcmFzZSBjb3VudGVycyBhcmUgcGxhY2VkIGlu
IEBlcmFzZV9jb3VudGVycy4gSWYgYSBibG9jayBpcyBiYWQgb3IKPiBpZiB0aGUKPiArICogZXJh
c2UgY291bnRlciBpcyB1bmtub3duIHRoZSB2YWx1ZSBvZiB0aGUgYmxvY2sgd2lsbCBiZSBzZXQg
dG8gLTEuCj4gKyAqLwo+ICtzdHJ1Y3QgdWJpX2VjaW5mb19yZXEgewo+ICsJX19zMzIgc3RhcnRf
ZWNfcmVxOwo+ICsJX19zMzIgZW5kX2VjX3JlcTsKPiArCV9fczMyIGVuZF9lY19yZXM7Cj4gKwlf
X3MzMiBlcmFzZV9jb3VudGVyc1sxMDAwXTsKClRoZXJlIGlzIG5vIG5lZWQgdG8gaGF2ZSBhIGxp
bWl0ZWQgbnVtYmVyLiBKdXN0IHVzZSBhIGZsZXhpYmxlIGFycmF5LgpJZiB1c2Vyc3BhY2UgYXNr
cyBmb3IgbW9yZSBlbnRyaWVzIHRoYW4gdGhlIHByb3ZpZGVkIGJ1ZmZlciBjYW4gaG9sZCwgX19w
dXRfdXNlcigpCndpbGwgZmFpbCBhbnl3YXlzLgoKSGF2ZSBhIGxvb2sgYXQgZmlibWFwLCBJIHRo
aW5rIHlvdSBjYW4gdGhlIG1vZGVsIHRoZSBBUEkgdGhlIHNhbWUgd2F5LgoKVGhhbmtzLAovL3Jp
Y2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
