Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B28C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 07:51:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C42CE60EB8
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 07:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C42CE60EB8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iX8iGwrVBBKQJOV0ZLnH4UFkqyN3ZRxwY3nVHseGo90=; b=xEgGrqFoiUNWKOhqRVjXPL7e9E
	FJy/YeoLhySG/HxJqErsec+IxhYppGBpeOzsfk1hbG+EZlgtpGjRnsn5bYW1BUjt9nvrOse7cAm2Z
	izSNM52Ehq1sCxqDmqCaThVNhGnfNNa59v3R69K99YtPiKIDby5QxQcleDCWN7h2S/2q7kJn0k+UL
	HaxEVGo2UFsLPwS/9Z7EsyDE0Hck7YYeRDqpRmZFvtnjDsVy7yMmV8bh75baZ4NM5MVArIcuKyIXM
	xGgs2dUNCN/3M2XCaaexdLvRon4WEt1UCeG9g+Rm8e5Kv7QvnWKaMXjMcqJ+WMKez9CwFYnuyYEGe
	2TrVCFfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdpK1-00A1oT-4e; Fri, 22 Oct 2021 07:50:37 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdpJy-00A1o8-7V
 for linux-mtd@lists.infradead.org; Fri, 22 Oct 2021 07:50:36 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 138286283EC6;
 Fri, 22 Oct 2021 09:50:31 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id iJZTix-ApoP7; Fri, 22 Oct 2021 09:50:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 5ABAA6283ED0;
 Fri, 22 Oct 2021 09:50:30 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 2jHEupQ1NCce; Fri, 22 Oct 2021 09:50:30 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1DF846283EC6;
 Fri, 22 Oct 2021 09:50:30 +0200 (CEST)
Date: Fri, 22 Oct 2021 09:50:29 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: hch <hch@lst.de>
Cc: joern <joern@lazybastard.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <977960225.24313.1634889029764.JavaMail.zimbra@nod.at>
In-Reply-To: <20211019055309.GA20805@lst.de>
References: <20211014145206.1488967-1-hch@lst.de>
 <20211014145206.1488967-2-hch@lst.de>
 <1862961222.73085.1634239699925.JavaMail.zimbra@nod.at>
 <20211019055309.GA20805@lst.de>
Subject: Re: [PATCH] mtd/block2mtd: don't poke into block layer internals
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF93 (Linux)/8.8.12_GA_3809)
Thread-Topic: mtd/block2mtd: don't poke into block layer internals
Thread-Index: hCuxEkvl/YU2P9bdUU3sPB7haE4eaQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_005034_469433_B2222E67 
X-CRM114-Status: GOOD (  14.00  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImhjaCIgPGhjaEBsc3QuZGU+
Cj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+Cj4gQ0M6ICJoY2giIDxoY2hAbHN0LmRl
PiwgImpvZXJuIiA8am9lcm5AbGF6eWJhc3RhcmQub3JnPiwgIk1pcXVlbCBSYXluYWwiIDxtaXF1
ZWwucmF5bmFsQGJvb3RsaW4uY29tPiwgIlZpZ25lc2gKPiBSYWdoYXZlbmRyYSIgPHZpZ25lc2hy
QHRpLmNvbT4sICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4KPiBH
ZXNlbmRldDogRGllbnN0YWcsIDE5LiBPa3RvYmVyIDIwMjEgMDc6NTM6MDkKPiBCZXRyZWZmOiBS
ZTogW1BBVENIXSBtdGQvYmxvY2sybXRkOiBkb24ndCBwb2tlIGludG8gYmxvY2sgbGF5ZXIgaW50
ZXJuYWxzCgo+IE9uIFRodSwgT2N0IDE0LCAyMDIxIGF0IDA5OjI4OjE5UE0gKzAyMDAsIFJpY2hh
cmQgV2VpbmJlcmdlciB3cm90ZToKPj4gPiBpbnN0ZWFkLiAgTm90ZSB0aGF0IHRoaXMgY29udGFp
bnMgYSBzbWFsbCBiZWhhdmlvciBjaGFuZ2UgaW4gdGhhdCBlcmFzZQo+PiA+IG5vdyB1bmNvbmRp
dGlvbmFsbHkgd3JpdGVzIGFsbCBGcyBpbnN0ZWFkIG9mIGZpcnN0IHNjYW5uaW5nIGZvciB0aGVt
Lgo+PiAKPj4gVW5sZXNzIHlvdSBoYXZlIGEgc3Ryb25nIG9waW5vaW4gSSdkIGxpa2UgdG8ga2Vl
cCB0aGUgc2Nhbm5pbmcuCj4+IFRoZSBvcmlnaW5hbCB1c2UgY2FzZSBvZiBibG9jazJtdGQgaXMg
dXNpbmcgQ29tcGFjdCBGbGFzaCAoQVRBKQo+PiBhcyBNVEQuIFNvbWUgb2YgdGhpcyBkZXZpY2Vz
IGFyZSBzdXBlciBzdHVwaWQgYW5kIEkgZmVhciB0aGUgMHhGRiBzY2FubmluZwo+PiBpcyBoZXJl
IHRvIGF2b2lkIHByb2dyYW1taW5nIDB4RkYgYnl0ZXMgaW50byB0aGUgTkFORC4KPj4gSnVzdCB0
byBiZSBvbiB0aGUgc2FmZSBzaWRlLi4uCj4gCj4gSSBwbGF5ZWQgd2l0aCBrZWVwaW5nIHRoZSBz
Y2FubmluZywgYnV0IGl0IHJlYWxseSBpcyBhIG1lc3MuICBTaG91bGRuJ3QKPiB0aGUgaGlnaGVy
IGxheWVycyAodWJpLCBqZmZzMiwgZXRjKSBrbm93IHdoYXQgaGFzIGFscmVhZHkgYmVlbiBlcmFz
ZWQ/CgpXZWxsLCB0aGUgaGlnaGVyIGxheWVycyBhcmUgYWxsb3dlZCB0byB1bmNvbmRpdGlvbmFs
bHkgcmUtZXJhc2UgYSBibG9jay4KSSBoYWQgYSBzaG9ydCBkaXNjdXNzaW9uIHdpdGggTWlxdWVs
LCBzaW5jZSBpdCBpcyBub3QgZW50aXJlbHkgY2xlYXIgd2hhdAp0aGUgcHVycG9zZSBvZiB0aGUg
cmVhZC1iZWZvcmUtd3JpdGUgbG9naWMgaW4gdGhlIGVyYXNlIGhhbmRsZXIgaXMsIGxldCdzCmtl
ZXAgb24gdGhlIHNhZmUgc2lkZSBhbmQga2VlcCBpdC4KCkVpdGhlciBpdCBpcyBhIHBlcmZvcm1h
bmNlIG9wdGltaXphdGlvbiBiZWNhdXNlIGVyYXNlIHdhcyBzdXBlciBzbG93IG9uCmNvbXBhY3Qg
Zmxhc2ggY2FyZHMgYXQgdGhlIHRpbWUgd2hlbiBKb2VybiBjcmVhdGVkIGJsb2NrMm10ZC4KT3Ig
dGhleSBoYXZlIGJlZW4gc3VwZXIgc3R1cGlkXldzaW1wbGUgYW5kIHdyaXRpbmcgMHhGRiBieXRl
cyB0byBhbiBlcmFzZWQKcmVnaW9uICh2aWEgbXRkX2VyYXNlKSB3YXMgcHJvYmxlbWF0aWMuCiAK
PiBCdHcsIEpvZXJucyBhZGRyZXNzIGJvdW5jZXMuICBEb2VzIGFueW9uZSBrbm93IGlmIGhlIHN0
aWxsIHdhbnRzIHRvCj4gbWFpbnRhaW4gYmxvY2sybXRkIGFuZCBoYXMgYSBuZXcgYWRkcmVzcyBv
ciBpZiBoZSBzaG91bGQgYmUgcmVtb3ZlZCBmcm9tCj4gdGhlIG1haW50YWluZXJzIGxpc3Q/CgpJ
IHNlbnQgYSBwYXRjaCB0byByZW1vdmUgaGltIGZyb20gdGhlIG1haW50YWluZXJzIGZpbGUuCklm
IEpvZXJuIHJldHVybnMgSSdsbCBoYXBwaWx5IHJldmVydCB0aGUgcGF0Y2guCgpUaGFua3MsCi8v
cmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
