Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDEACD343B
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2026 07:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Q6/CtlC1IOg6vKuxp5FIYsHPX4MVBSfC8YTdBuB5ExU=; b=RejKxmnA8qn2RTjUtCHSy6sObS
	U5bt1vXHkfEqSLkcmFoMxGE9v05ZD8hZwrcLxNny8j6Ub49SzRTUUjaRZNUtgLhqxbw6YuCNNzxI5
	vXh2D8lVPdjJTRxJxvSOnC5HAm5gtO/VBQqPZ1wamy8UIGH98ul258s4SstlLqQr8vKTGgdqfNsP8
	9iyEGWU3JqlQLDoB1FHE+pjwcsKWUtB/qrnqOwERwZJmHGBhmqkwsmF4eoJCMbu1VpHE5dEZHKT0K
	LEVOlwTzugB0eSx1xlINcOcbSN1Tcu3n0zgivE6GEcPwaQMNdmZNRNQp9B+P+bcEM+u62pJKck4FK
	d3V0vkGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtVW-000000034WZ-2TWf;
	Thu, 07 May 2026 07:50:54 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtVV-000000034WA-329F
	for linux-mtd@lists.infradead.org;
	Thu, 07 May 2026 07:50:53 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 06E62298580;
	Thu,  7 May 2026 09:50:52 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id bRTtseI6MBTk; Thu,  7 May 2026 09:50:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 68C5E298599;
	Thu,  7 May 2026 09:50:51 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id tBLSlF4l2gkp; Thu,  7 May 2026 09:50:51 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 37FCF298580;
	Thu,  7 May 2026 09:50:51 +0200 (CEST)
Date: Thu, 7 May 2026 09:50:50 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: "haoyu.lu" <hechushiguitu666@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <874282979.1642.1778140250921.JavaMail.zimbra@nod.at>
In-Reply-To: <7c4bf8d4-c561-f5bf-fc7f-3e384fe1a9e6@huawei.com>
References: <20260507032308.16485-1-hechushiguitu666@gmail.com> <20260507032308.16485-2-hechushiguitu666@gmail.com> <7c4bf8d4-c561-f5bf-fc7f-3e384fe1a9e6@huawei.com>
Subject: Re: [PATCH 2/2] ubi: build: replace simple_strtoul with kstrtoul in
 bytes_str_to_int()
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF150 (Linux)/8.8.12_GA_3809)
Thread-Topic: build: replace simple_strtoul with kstrtoul in bytes_str_to_int()
Thread-Index: KPRiefLPJDGCgZTMYyyjVKrrR9sr+g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_005053_906500_EAA2E4CB 
X-CRM114-Status: UNSURE (   8.01  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEFuOiAiaGFveXUubHUiIDxoZWNodXNoaWd1aXR1NjY2
QGdtYWlsLmNvbT4sICJNaXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4s
ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LAo+ICJWaWduZXNoIFJhZ2hhdmVuZHJhIiA8dmln
bmVzaHJAdGkuY29tPgo+IENDOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVh
ZC5vcmc+LCAibGludXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4KPiBH
ZXNlbmRldDogRG9ubmVyc3RhZywgNy4gTWFpIDIwMjYgMDk6NDU6MjQKPiBCZXRyZWZmOiBSZTog
W1BBVENIIDIvMl0gdWJpOiBidWlsZDogcmVwbGFjZSBzaW1wbGVfc3RydG91bCB3aXRoIGtzdHJ0
b3VsIGluIGJ5dGVzX3N0cl90b19pbnQoKQoKPiDlnKggMjAyNi81LzcgMTE6MjMsIGhhb3l1Lmx1
IOWGmemBkzoKPj4gRnJvbTogSGFveXUgTHUgPGhlY2h1c2hpZ3VpdHU2NjZAZ21haWwuY29tPgo+
PiAKPj4gUmVwbGFjZSB0aGUgZGVwcmVjYXRlZCBzaW1wbGVfc3RydG91bCgpIHdpdGgga3N0cnRv
dWwoKSBpbiB0aGUKPj4gYnl0ZXNfc3RyX3RvX2ludCgpIGhlbHBlciBmdW5jdGlvbi4gU2luY2Ug
a3N0cnRvdWwoKSByZWplY3RzIHRyYWlsaW5nCj4+IG5vbi1udW1lcmljIGNoYXJhY3RlcnMgKHN1
Y2ggYXMgdGhlIEcvTS9LIHN1ZmZpeGVzKSwgdGhlIG51bWVyaWMgcHJlZml4Cj4+IGlzIGZpcnN0
IGV4dHJhY3RlZCB3aXRoIHN0cnNwbigpIGFuZCB0aGVuIHBhcnNlZCBzZXBhcmF0ZWx5IGJlZm9y
ZQo+PiBoYW5kbGluZyB0aGUgc3VmZml4Lgo+PiAKPj4gVGhpcyBwcm92aWRlcyBwcm9wZXIgZXJy
b3IgaGFuZGxpbmcgdGhyb3VnaCB0aGUga3N0cnRvKiBmYW1pbHkgd2hpbGUKPj4gcHJlc2Vydmlu
ZyB0aGUgZXhpc3Rpbmcgc3VmZml4IHNlbWFudGljcyBmb3IgYnl0ZSBjb3VudCBwYXJhbWV0ZXJz
Lgo+PiAKPj4gTm90ZTogdGhlIG9yaWdpbmFsIHNpbXBsZV9zdHJ0b3VsKCkgd2l0aCBiYXNlPTAg
YWNjZXB0ZWQgaGV4YWRlY2ltYWwKPj4gKDB4IHByZWZpeCkgYW5kIG9jdGFsICgwIHByZWZpeCkg
Zm9ybWF0cywgd2hpbGUga3N0cnRvdWwoKSB3aXRoIGJhc2U9MTAKPj4gb25seSBzdXBwb3J0cyBk
ZWNpbWFsLiBUaGlzIGlzIG5vdCBhIHByYWN0aWNhbCBjb25jZXJuIHNpbmNlIE1URCBieXRlCj4+
IGNvdW50IHBhcmFtZXRlcnMgYXJlIGFsd2F5cyBzcGVjaWZpZWQgYXMgZGVjaW1hbCB2YWx1ZXMg
aW4gYm9vdAo+PiBwYXJhbWV0ZXJzLgo+IFRoZSB1YmkgY291bGQgYmUgbG9hZGVkIGJ5IG1vZHVs
ZSBpbnNlcnRpb24sIG1hbnkgdmVuZG9ycyBzZXQgcGFyYW0KPiAndmlkX2hkcl9vZmZzJyB0byBz
YXZlIHNwYWNlLiBXZSBjYW5ub3QgbWFrZSB0aGUgYXNzdW1wdGlvbiB0aGF0IGFsbAo+IHVzZXJz
IHVzZSB0aGUgZGVjaW1hbCBzeXN0ZW0uCgpUaGF0J3MgYSBnb29kIHBvaW50IQoKSW4gZ2VuZXJh
bCBJJ20gbm90IGZvbmQgb2Ygc3VjaCBjaGFuZ2VzLiBUaGV5IGNoYW5nZSBjb2RlIGZvciB0aGUg
c2FrZQpvZiBjaGFuZ2luZyBjb2RlIHdpdGhvdXQgZml4aW5nIGFjdHVhbCBpc3N1ZXMuCkknbGwg
aGFwcGlseSBhY2NlcHQgcGF0Y2hlcyB0aGF0IHBvaW50IG91dCByZWFsIGlzc3VlcyB3aXRoIHRo
ZSBjdXJyZW50CnVzYWdlIG9mIHZhcmlvdXMgc3RyaW5nIGZ1bmN0aW9ucywgdGhvdWdoLgoKVGhh
bmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
