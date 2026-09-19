Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA51FC982CC
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2026 07:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gcZj7hnLHDQzBS+thr+6OZ2FqQ1LCVU6R2qqhXWkj1A=; b=jUE8pFxmBLStJ3ML3meFkyNwzD
	COXlQdjTTARQx8kzvJ2UzBpGbc1UAgQbfQDaty3XQAj+xdEauUxeACUP1wUCf0Aa+tusAxgVFstbu
	zGkqnkDfhwhVPwJuUImcWPLNOSBYwKKiW4GbngoUKqp2sm2eAKrlNRowLQesfNsG0zBfV2zogp1ka
	tPwzm8RYIwTCmN+SX03ZDkap3gUP/cxqrVSVK0Ah4nKDGULcUB3Ra7UH338fxlW/P+DEoPB3b2oLk
	uFiqJh5sWbCX2Z+8SWvXklWxJdl6b9UCQQcL3LbjmCn/RJpujtbtw98/Lkq3xcpsp2pRhhxjLCeWG
	HSYZ3JPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7pj6-0000000G4HG-0l7D;
	Sat, 19 Sep 2026 07:43:12 +0000
Received: from calculus.sigma-star.at ([188.245.196.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7pj2-0000000G4GY-1AH6
	for linux-mtd@lists.infradead.org;
	Sat, 19 Sep 2026 07:43:10 +0000
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1789803745; bh=YP8vnLhklWgFXgieU8N+ZD3
	bF6ZH1bbcm6B02tsqZaA=; b=6fFKz/kNl8A+tDwZQVk2PZ5Lrl5fFoEF1iEY1/FtdDhse5L9vG
	9V6J4mIudcW1v76utgCZF050QvMqKBZ3mqBA==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1789803745; bh=YP8vnLhklWgFXgieU8N+ZD3
	bF6ZH1bbcm6B02tsqZaA=; b=rAmDeOW4469rHGd9hRodDaCFJCurw8tO9o7On31U4bR0wC8u9/
	irYiuyUvizb/WJHP4xTA1T0WOxPRX8pDvSjRx8v4IXmP2nQzIZd8/hYq1fw113aCqGv35hUTSG3
	Q4f/U/cIahmSdM6g+xA0vQyQwPMl1e4PQGpCYGTQ/LD5VhIObKWWAKqzf2/Ldn1MY9B9lkZQI57
	eSpGo0siNIUXWRYSmGIFWvo6X4Q7I9JhiSBbdvVLu8wASDODiR2DcGlA7WLWPyLainvv3ed8B08
	7VwbSA9VjqL++MKWzBYUsLWQpyQfUXlb31Fp6dm0w1OriQks/H43/8UDVPklY9NfeuA==;
From: "Richard Weinberger" <richard@nod.at>
To: =?utf-8?Q?J=C3=B6rn_Engel?= <joern@barelysecure.org>, 
	"Chris Roy" <iam@thechris.in>
Cc: "Greg KH" <gregkh@linuxfoundation.org>, 
	"syzbot" <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>, 
	<dakr@kernel.org>, <driver-core@lists.linux.dev>, 
	<linux-fsdevel@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<rafael@kernel.org>, <syzkaller-bugs@googlegroups.com>, 
	<linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>, 
	<vigneshr@ti.com>, <joern@lazybastard.org>
Subject: AW: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
Message-ID: <mu82xsi6.76ee613a-07fb-48b1-9336-99e8780e8b6e@nod.at>
In-Reply-To: <aqwuWWMwdIcx3704@cashel.logfs.org>
References: <CAE2Bdm3NuEHshrG6K2boKAnCQUvT5SX79cP9nPgS2s1afzY1hg@mail.gmail.com>
	<6aab0f82.e91c2013.3bdb06.0009.GAE@google.com>
	<CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
	<2026091753-broadness-bootie-b683@gregkh>
	<CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
	<aqwuWWMwdIcx3704@cashel.logfs.org>
Date: Sat, 19 Sep 2026 07:42:25 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_004308_458870_D307E8DD 
X-CRM114-Status: GOOD (  14.47  )
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

QW0gVGh1LCBTZXAgMTcsIDIwMjYsIDIwOjE2IHNjaHJpZWIgSsO2cm4gRW5nZWwgPGpvZXJuQGJh
cmVseXNlY3VyZS5vcmc+Ogo+IE9uIFRodSwgU2VwIDE3LCAyMDI2IGF0IDAxOjI4OjIyUE0gKzA1
MzAsIENocmlzIFJveSB3cm90ZToKPiA+Cj4gPiAgZHJpdmVycy9tdGQvZGV2aWNlcy9ibG9jazJt
dGQuYyB8IDExOCArKysrKysrKysrKysrKysrKysrKy0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDk4IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+IFsuLi5dCj4gPiAgLyogU3RhdGlj
IGluZm8gYWJvdXQgdGhlIE1URCwgdXNlZCBpbiBjbGVhbnVwX21vZHVsZSAqLwo+ID4gIHN0YXRp
YyBMSVNUX0hFQUQoYmxrbXRkX2RldmljZV9saXN0KTsKPiA+ICsvKiBQcm90ZWN0cyBibGttdGRf
ZGV2aWNlX2xpc3QgYW5kIGVhcmx5LWJvb3QgcGFyYW1saW5lIHVwZGF0ZXMgKi8KPiA+ICtzdGF0
aWMgREVGSU5FX01VVEVYKGJsb2NrMm10ZF9tdXRleCk7Cj4gPiArc3RhdGljIHN0cnVjdCB3b3Jr
cXVldWVfc3RydWN0ICpibG9jazJtdGRfd3E7Cj4gCj4gVGhpcyBpcyBqdXN0IGF3ZnVsIHRhc3Rl
LiAgWW91IGFyZSBpbnNpZGUgYSBmaWxlIGNhbGxlZCAiYmxvY2sybXRkIi4KPiBUaGUgcHJlZml4
IHRvIHRoZSBtdXRleCBhbiB3b3JrcXVldWUgYWRkIGFic29sdXRlbHkgbm90aGluZy4gIENhbGxp
bmcKPiB0aGVtIGp1c3QgcGxhaW4gIm11dGV4IiBhbmQgIndxIiB3b3VsZCBoYXZlIGJlZW4gYSBi
ZXR0ZXIgY2hvaWNlLgo+IAo+IEdvb2QgbmFtZXMgc2hvdWxkIHRlbGwgdGhlIGh1bWFuIHJlYWRl
ciBzb21ldGhpbmcuICBXaGF0IGlzIHRoZSBtdXRleAo+IHByb3RlY3Rpbmc/ICBXaGF0IGlzIHRo
ZSBwdXJwb3NlIG9mIHRoZSB3b3JrcXVldWU/ICBQaWNrIGEgbmFtZSB0aGF0Cj4gZ2l2ZXMgdXMg
c29tZSBpbmZvcm1hdGlvbiBsaWtlIHRoYXQsIHBsZWFzZSEKPiAKPiAKPiBZb3Ugc2VlbSB0byBo
YXZlIHVzZWQgQUkgdG8gd3JpdGUgdGhpcyBjb2RlLCBzbyB0aGUgYmFkIG5hbWUgY2hvaWNlIHdh
cwo+IHByZXN1bWFibHkgYWxzbyBkb25lIGJ5IEFJLiAgQnV0IHlvdSBhcmUgc3RpbGwgYXNzb2Np
YXRpbmcgeW91ciBvd24gZ29vZAo+IG5hbWUgd2l0aCB0aGUgY29kZS4gIFlvdSBzaG91bGQgdHJ5
IG5vdCB0byBoYXJtIHlvdXIgZ29vZCBuYW1lIGJ5Cj4gbGV0dGluZyB0aGluZ3MgbGlrZSB0aGlz
IHNsaWRlIHRocm91Z2ggdW5jaGFsbGVuZ2VkLgoKV2hpbGUgd2UncmUgaGVyZSwgbWF5YmUgaXQn
cyB0aW1lIHRvIGFkZCBhIGRlY2VudCBjb25maWdmcyBpbnRlcmZhY2UgdG8KdGhpcyBkcml2ZXIg
aW5zdGVhZCBvZiBjb25maWd1cmluZyB0aHJvdWdoIG1vZHVsZSBwYXJhbWV0ZXJzLgpUaGF0IHdh
eSBhbHNvIG11bHRpcGxlIGluc3RhbmNlcyBhcmUgcG9zc2libGUuCgpUaGFua3MsCi8vcmljaGFy
ZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
