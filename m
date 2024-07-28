Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30285C3DA49
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Jul 2024 07:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9Pn7b6AThBxbwBfpDrAAH/6s9F/0hQ9Z6ZNHRa+sQ/E=; b=haY4wumwRJtUkiiuCZM2K1p/kN
	vIA0Nj0OprE6WMhu76C26bYTIZJGu2e3iIsH2LJSfB+8NA4dYYOuzuLYYT0Y0RrkuE93luhBX2KE6
	jCq7TO8dzbw2uUdLa4m7/rhPR9Uvk9z38R3TlKAjW2mItHeiW2tt3udO811NsVuDfpv+8bHmGuh2X
	Sg5AMbmUonBqnkqv2rL1e3wJDecj/sonvyicXPDafhy0bio47Zg2kCtFbQ6U0hfiPfg2YkGgkO9eu
	BxZRLpCJ3MGTLpjNNCzoE3Gv6m8ZGHhiVxkn8dU+hqeAGihawCncwI6qH0pdJLrMWm2yousTFY42/
	GB4DdN8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXy5u-000000083hi-0oOV;
	Sun, 28 Jul 2024 07:13:26 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXy5q-000000083gT-2Q21
	for linux-mtd@lists.infradead.org;
	Sun, 28 Jul 2024 07:13:24 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 57F3464A3D0A;
	Sun, 28 Jul 2024 09:13:10 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id zBbUua_PVi0O; Sun, 28 Jul 2024 09:13:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E064564A3D19;
	Sun, 28 Jul 2024 09:13:09 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id lMyUS_RjfNGb; Sun, 28 Jul 2024 09:13:09 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id C633664A3D0A;
	Sun, 28 Jul 2024 09:13:09 +0200 (CEST)
Date: Sun, 28 Jul 2024 09:13:09 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <2116767413.129257.1722150789677.JavaMail.zimbra@nod.at>
In-Reply-To: <CAHk-=wjK1ZLk8TjejsRfDUH2Jp4=FPfD_GQU9z-m=bm75+jBMw@mail.gmail.com>
References: <896050924.123729.1722027514568.JavaMail.zimbra@nod.at> <CAHk-=wjK1ZLk8TjejsRfDUH2Jp4=FPfD_GQU9z-m=bm75+jBMw@mail.gmail.com>
Subject: Re: [GIT PULL] UBI and UBIFS updates for v6.11-rc1
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: UBI and UBIFS updates for v6.11-rc1
Thread-Index: 399OxDQ8G3+rh6/2Fi4Vrri1xYbQxg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240728_001322_783794_4F44C3E3 
X-CRM114-Status: GOOD (  12.64  )
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

TGludXMsCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gVm9uOiAidG9ydmFsZHMi
IDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiBEb2VzIG5vYm9keSBhY3R1YWxseSBj
aGVjayB0aGUgYnVpbGQgb3V0cHV0Pwo+IAo+ICBXQVJOSU5HOiBtb2Rwb3N0OiBkcml2ZXJzL210
ZC91YmkvdWJpOiBzZWN0aW9uIG1pc21hdGNoIGluCj4gcmVmZXJlbmNlOiB1YmlfaW5pdCsweDE3
MCAoc2VjdGlvbjogLmluaXQudGV4dCkgLT4gdWJpYmxvY2tfZXhpdAo+IChzZWN0aW9uOiAuZXhp
dC50ZXh0KQo+IAo+IGFuZCB5ZXMsIHRoaXMgbWF5IGJlIGhhcm1sZXNzIG9uIHg4NiAoYW5kIHNl
dmVyYWwgb3RoZXIKPiBhcmNoaXRlY3R1cmVzKSwgYmVjYXVzZSB0aGUgZXhpdC50ZXh0IGlzIGRy
b3BwZWQgYXQgcnVudGltZSBiZWNhdXNlCj4gZHJvcHBpbmcgaXQgYXQgbGluayB0aW1lIHdpbGwg
Y2F1c2UgcHJvYmxlbXMgZm9yIGFsdGluc3RydWN0aW9ucy4KPiAKPiBCVVQuCj4gCj4gVGhlIHdh
cm5pbmcgaXMgdmVyeSByZWFsLCBiZWNhdXNlIG9uICpvdGhlciogYXJjaGl0ZWN0dXJlcywgdGhl
Cj4gRVhJVF9URVhUIHNlY3Rpb25zIG1heSBuZXZlciBiZSBsaW5rZWQgaW4gYXQgYWxsLCBiZWNh
dXNlIHNvbWV0aGluZwo+IHRoYXQgaXMgYnVpbHQtaW4gbmV2ZXIgZ2V0cyB1bmxvYWRlZCwgc28g
aXQgbmV2ZXIgaGFzIGEgbW9kdWxlIGV4aXQuCj4gCj4gU28gX19leGl0IGxpdGVyYWxseSBleGlz
dHMgc28gdGhhdCB0aGUgY29kZSBjYW4gYmUgdGhyb3duIGF3YXkgd2hlbiBub3QgdXNlZC4KPiAK
PiBBbmQgbm93IHlvdSdyZSBjYWxsaW5nIGl0IGZyb20gYSBub24tZXhpdCBwbGFjZS4KPiAKPiBF
bmQgcmVzdWx0OiB0aGUgd2FybmluZyBleGlzdHMgZm9yIGEgcmVhc29uLCBhbmQgaXQgbG9va3Mg
bGlrZSBjb21taXQKPiA3MmYzZDNkYWRkZDcgKCJtdGQ6IHViaTogUmVzdG9yZSBtaXNzaW5nIGNs
ZWFudXAgb24gdWJpX2luaXQoKSBmYWlsdXJlCj4gcGF0aCIpIGlzIGp1c3QgYnJva2VuLgo+IAo+
IEkgY291bGQgdHJ5IHRvIGZpeCB0aGlzIHVwIGluIHRoZSBtZXJnZSwgYnV0IGhvbmVzdGx5LCB0
aGUgZmFjdCB0aGF0Cj4gYXBwYXJlbnRseSBub2JvZHkgYm90aGVyZWQgdG8gZXZlbiBsb29rIGF0
IHRoZSBuZXcgd2FybmluZyBtZWFucyB0aGF0Cj4gSSBqdXN0IGNvbnNpZGVyIHRoaXMgd2hvbGUg
cHVsbCBjb21wbGV0ZWx5IGJ1Z2dlcmVkLgo+IAo+IEkgcmVmdXNlIHRvIHB1bGwgZ2FyYmFnZSB0
aGF0IG91ciBidWlsZCBzeXN0ZW0gdmVyeSBjbGVhcmx5IHdhcm5zIGFib3V0LgoKVGhlIGlzc3Vl
IHdhcyBkZXRlY3RlZCBhbmQgZml4ZWQgdHdvIHdlZWtzIGFnbzoKaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtbXRkLzIwMjQwNzEzMDczNTE5LjI1MzI1LTEtcmljaGFyZEBub2QuYXQvCgpC
dXQgSSBmb3Jnb3QgdG8gaW5jbHVkZSBteSB2ZXJ5IG93biBwYXRjaC4KU28sIHRoZSBmYWlsdXJl
IGlzIHRvdGFsbHkgb24gbXkgc2lkZSwgSSdtIHNvcnJ5IGZvciB0aGF0LgoKRG8geW91IGFsbG93
IG1lIHNlbmRpbmcgYW4gdXBkYXRlZCBwdWxsIHJlcXVlc3RlZD8KClRoYW5rcywKLy9yaWNoYXJk
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
