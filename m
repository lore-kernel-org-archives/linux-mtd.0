Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D24C6FA99
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Mar 2023 17:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DOhdHNrMWTEfhWu6VG2YA2anPGnTWIIyPfJz293P+rc=; b=kF8GuYGL0rd5AjktTThzyK/ohG
	Jp9an3Gwpf7kl7S9Ko7sU1TJWc0udKUUr3z/k3JNo6QmWmdKV3ZoMfE21E5MXgzJPfSMbl+6aW7jE
	MInFZTDksc2awWEoAKNviDTIVK0rB+u/wBsplSzoZVUuhEerFZOR5PNH/WRvp5DBITNfqKSrGcf8S
	U9BvBI8yYz9vtYB1p032F7k8JE9JzS70vTh9VMjAi/tFbDQLCbvBzDnXkriLH6JZJgCeMyHTE4uqP
	pJMdzqUhIEDpbWb3BYDoNwzXXm0dciGEn7qXbp7Q9Vt2fAAdGK63mTquxIrhyKPdR6DT39LudTyLv
	QHYELhTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pagbd-00FXxh-Am; Fri, 10 Mar 2023 17:32:37 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pagbZ-00FXv4-Do
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2023 17:32:35 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 7A3C56431C2D;
	Fri, 10 Mar 2023 18:32:18 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 1z7O47DOjub4; Fri, 10 Mar 2023 18:32:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1CED36431C2E;
	Fri, 10 Mar 2023 18:32:18 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id PgzRtHC7n5Fa; Fri, 10 Mar 2023 18:32:18 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id ED4A56431C21;
	Fri, 10 Mar 2023 18:32:17 +0100 (CET)
Date: Fri, 10 Mar 2023 18:32:17 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: Daniel Palmer <daniel@0x0f.com>, hch <hch@lst.de>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <349964589.230468.1678469537890.JavaMail.zimbra@nod.at>
In-Reply-To: <CAHk-=wi29bbBNh3RqJKu3PxzpjDN5D5K17gEVtXrb7-6bfrnMQ@mail.gmail.com>
References: <1115586887.187161.1677658022188.JavaMail.zimbra@nod.at> <CAFr9PXktRBm66vgVjOnwTeucBD36OuPjDVNd9cH1F8u0nesKrA@mail.gmail.com> <CAHk-=wi29bbBNh3RqJKu3PxzpjDN5D5K17gEVtXrb7-6bfrnMQ@mail.gmail.com>
Subject: Re: [GIT PULL] JFFS2, UBI and UBIFS updates for v6.3-rc1
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: JFFS2, UBI and UBIFS updates for v6.3-rc1
Thread-Index: 2Hg5rsNJ6XBCeBp97qB+tTE07fBndw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_093233_654187_284182AD 
X-CRM114-Status: GOOD (  12.03  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBUaGlzIHNlZW1zIHRvIGJlIGNhdXNp
bmcgb25lIG9mIG15IG1hY2hpbmVzIHRvIGxvY2sgdXAgZHVyaW5nIGJvb3QuCj4+IEl0J3MgdXNp
bmcgYSBzcXVhc2hmcyByb290IHRoYXQgaXMgb24gYSB1YmlibG9jayB0aGF0IGlzIGxvY2F0ZWQg
b24gYW4gU1BJIE5BTkQuCj4gCj4gSG1tLiBUaGF0IGNvbW1pdCA5MWNjOGZiY2M4YzcgKCJ1Ymk6
IGJsb2NrOiBzZXQgQkxLX01RX0ZfQkxPQ0tJTkciKSBpcyBvZGQuCj4gCj4gQ2hyaXN0b3BoIC0g
eW91IHJlbW92ZWQgdGhlCj4gCj4gICAgICAgIGJsa19tcV9zdGFydF9yZXF1ZXN0KHJlcSk7Cj4g
ICAgICAgIC4uLgo+ICAgICAgICBibGtfbXFfZW5kX3JlcXVlc3QocmVxLCBlcnJub190b19ibGtf
c3RhdHVzKHJldCkpOwo+IAo+IGZyb20gdGhlIHdvcmtxdWV1ZSBmdW5jdGlvbiwgYnV0IHdoaWxl
IHlvdSBhZGRlZCB0aGUKPiBibGtfbXFfc3RhcnRfcmVxdWVzdCgpIGludG8gdWJpYmxvY2tfcmVh
ZCgpLCB0aGUgJ2VuZF9yZXF1ZXN0KCknIGlzCj4gbWlzc2luZy4KPiAKPiBTbyBJIHN1c3BlY3Qg
dGhlIElPIGhhcyBjb21wbGV0ZWQsIGJ1dCB0aGUgY2hhbmdlIG1lYW5zIHRoYXQgbm9ib2R5Cj4g
d2FzIGluZm9ybWVkIGFib3V0IHNhaWQgY29tcGxldGlvbiwgc28gbm93IHRyeWluZyB0byBtb3Vu
dCBhbiBleHQ0Cj4gZmlsZXN5c3RlbSBvbiBpdCBoYW5ncyBvbiB0aGUgcmVhZC4KPiAKPiBCdXQg
SSBkb24ndCBhY3R1YWxseSBrbm93IHRoaXMgY29kZSwgdGhhdCB3YXMganVzdCBmcm9tIGxvb2tp
bmcgYXQgdGhlCj4gY29tbWl0IHRoYXQgYnJlYWtzLgo+IAo+IENocmlzdG9waD8gRGFuaWVsIHVz
ZWQgeW91ciBpbmZyYWRlYWQgYWRkcmVzcywgSSBkb24ndCBrbm93IGlmIGl0IGFsbAo+IGdvZXMg
aW50byB0aGUgc2FtZSBwaWxlLCBidXQgbGV0J3MgdXNlIHlvdXIgcmVndWxhciBvbmUuIEFuZCBJ
IGNhbid0Cj4gc2VlIERhbmllbCdzIG1lc3NhZ2Ugb24gbG9yZS5rZXJuZWwub3JnIGF0IGFsbCwg
Zm9yIHdoYXRldmVyIHJlYXNvbiwKPiAKCkluZGVlZCwgSSdtIGFibGUgdG8gcmVwcm9kdWNlIHRo
ZSBwcm9ibGVtIGFuZCBhZGRpbmcgYmxrX21xX2VuZF9yZXF1ZXN0KCkKYmFjayBmaXhlcyBpdC4K
CmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91YmkvYmxvY2suYyBiL2RyaXZlcnMvbXRkL3ViaS9i
bG9jay5jCmluZGV4IDFkZTg3MDYyYzY3Yi4uMzcxMWQ3Zjc0NjAwIDEwMDY0NAotLS0gYS9kcml2
ZXJzL210ZC91YmkvYmxvY2suYworKysgYi9kcml2ZXJzL210ZC91YmkvYmxvY2suYwpAQCAtMjIx
LDcgKzIyMSwxMCBAQCBzdGF0aWMgYmxrX3N0YXR1c190IHViaWJsb2NrX3JlYWQoc3RydWN0IHJl
cXVlc3QgKnJlcSkKIAogCXJxX2Zvcl9lYWNoX3NlZ21lbnQoYnZlYywgcmVxLCBpdGVyKQogCQlm
bHVzaF9kY2FjaGVfcGFnZShidmVjLmJ2X3BhZ2UpOwotCXJldHVybiBlcnJub190b19ibGtfc3Rh
dHVzKHJldCk7CisKKwlibGtfbXFfZW5kX3JlcXVlc3QocmVxLCBlcnJub190b19ibGtfc3RhdHVz
KHJldCkpOworCisJcmV0dXJuIEJMS19TVFNfT0s7CiB9CiAKIHN0YXRpYyBpbnQgdWJpYmxvY2tf
b3BlbihzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2LCBmbW9kZV90IG1vZGUpCgpUaGFua3MsCi8v
cmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
