Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172FFCE7A89
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Sep 2023 09:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vZ7FD6pp6VcFWB45Es11cIf6KBtUKo8TgNTAqH9TG44=; b=EAN0aCHiOrT/zn
	z0zE5it9WD0iDukIFh/D6hgS8sXa9XmDbOYzBVFle4CaWcTzSi1rNpNNDncIHOZO9bAqpzxMrGrlR
	W4qW/7m0gr2VlVg4b3mfNKMKEEz+kExvnTrUQR9x3ypkIx2ZYDLwapy9YohQajd55hBexHLAyiQwA
	gvGw5Lp0I8YXL7/UFbMxzRSPT+0ez4Gi7PstGh7l4byJDALD5o8K+zfxk+REy+dvdmuEFiULde3eV
	Gjy+LrrRtPJivJSiNvrCr0l6QcIqPfTxZHjl/c2Ah+fvzl3KoudeSqOMzyE81D3nUiwCqJYyGfN0z
	0Bj4dbBWXEFeIFpne7mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkhtn-00Dr6S-2V;
	Mon, 25 Sep 2023 09:29:03 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkhtk-00Dr3i-2F
	for linux-mtd@lists.infradead.org;
	Mon, 25 Sep 2023 09:29:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F6C0C0002;
	Mon, 25 Sep 2023 09:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695634135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wb/VrieiCtDAYPKDjADMUjE31jHuvIRimSKAaJ2SM/g=;
	b=C3wlVNaKwwXz12xJoi3QjL/QFrFwLsMhFhmv8R0SaR1/hLRwQoYSeZPsRD/enXjygSmFSH
	wuSVdaMANskcgC9DJRbxxQeQax3NLFQGqLgg0C4ynSWtoHixTbt1FY5b1hcaLrgPo+3OJ9
	o6nkTWHVDnAjOx2DmKErnPbLkgor8OTRjx9kNJdh0ns3GCPjmC5IMbKj4xpbWIj1/xD+rJ
	krmiQd1V4eQ768mxfqu819wm86a1vQ0nMhPhsIvHBpBzju1NWsdSCEj8308+iMso4iXOwf
	skgE6QoOTMjH2Ez2a2fr09ZRqhMkn2nAhsLntLxNWN5vJmyQWIbQQpKT3vsmWg==
Date: Mon, 25 Sep 2023 11:28:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: ZhaoLong Wang <wangzhaolong1@huawei.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, chengzhihao1 <chengzhihao1@huawei.com>, yi
 zhang <yi.zhang@huawei.com>, yangerkun@huawei.com
Subject: Re: [RFC] mtd: Fix error code loss in mtdchar_read() function.
Message-ID: <20230925112853.6cb7fff3@xps-13>
In-Reply-To: <495954216.80155.1695633280285.JavaMail.zimbra@nod.at>
References: <20230923005856.2538223-1-wangzhaolong1@huawei.com>
	<20230925104938.3f7b4284@xps-13>
	<495954216.80155.1695633280285.JavaMail.zimbra@nod.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_022901_029194_FDC208FD 
X-CRM114-Status: GOOD (  25.48  )
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

SGkgUmljaGFyZCwKCnJpY2hhcmRAbm9kLmF0IHdyb3RlIG9uIE1vbiwgMjUgU2VwIDIwMjMgMTE6
MTQ6NDAgKzAyMDAgKENFU1QpOgoKPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4g
Pj4gJ3RvdGFsX3JldGxlbicgaXMgMCwgbm90IHRoZSBlcnJvciBjb2RlLiAgCj4gPiAKPiA+IEFj
dHVhbGx5IGFmdGVyIGxvb2tpbmcgYXQgdGhlIGNvZGUsIEkgaGF2ZSBubyBzdHJvbmcgb3Bpbmlv
bgo+ID4gcmVnYXJkaW5nIHdoZXRoZXIgd2Ugc2hvdWxkIHJldHVybiAwIG9yIGFuIGVycm9yIGNv
ZGUgaW4gdGhpcyBjYXNlLgo+ID4gCj4gPiBUaGVyZSBpcyB0aGlzIGNvbW1lbnQgcmlnaHQgYWJv
dmUsIGFuZCBJJ20gbm90IHN1cmUgaXQgaXMgc3RpbGwgdXAgdG8KPiA+IGRhdGUgYmVjYXVzZSBJ
IGJlbGlldmUgbWFueSBkcml2ZXJzIGp1c3QgZG9uJ3QgcHJvdmlkZSB0aGUgZGF0YSB1cG9uCj4g
PiBFQ0MgZXJyb3I6Cj4gPiAKPiA+ICAgICAgICAgICAgICAgIC8qIE5hbmQgcmV0dXJucyAtRUJB
RE1TRyBvbiBFQ0MgZXJyb3JzLCBidXQgaXQgcmV0dXJucwo+ID4gICAgICAgICAgICAgICAgICog
dGhlIGRhdGEuIEZvciBvdXIgdXNlcnNwYWNlIHRvb2xzIGl0IGlzIGltcG9ydGFudAo+ID4gICAg
ICAgICAgICAgICAgICogdG8gZHVtcCBhcmVhcyB3aXRoIEVDQyBlcnJvcnMhCj4gPiAgICAgICAg
ICAgICAgICAgKiBGb3Iga2VybmVsIGludGVybmFsIHVzYWdlIGl0IGFsc28gbWlnaHQgcmV0dXJu
IC1FVUNMRUFOCj4gPiAgICAgICAgICAgICAgICAgKiB0byBzaWduYWwgdGhlIGNhbGxlciB0aGF0
IGEgYml0ZmxpcCBoYXMgb2NjdXJyZWQgYW5kIGhhcwo+ID4gICAgICAgICAgICAgICAgICogYmVl
biBjb3JyZWN0ZWQgYnkgdGhlIEVDQyBhbGdvcml0aG0uCj4gPiAgICAgICAgICAgICAgICAgKiBV
c2Vyc3BhY2Ugc29mdHdhcmUgd2hpY2ggYWNjZXNzZXMgTkFORCB0aGlzIHdheQo+ID4gICAgICAg
ICAgICAgICAgICogbXVzdCBiZSBhd2FyZSBvZiB0aGUgZmFjdCB0aGF0IGl0IGRlYWxzIHdpdGgg
TkFORAo+ID4gICAgICAgICAgICAgICAgICovCj4gPiAgIAo+ID4+IFRoaXMgcHJvYmxlbSBjYXVz
ZXMgdGhlIHVzZXItc3BhY2UgcHJvZ3JhbSB0byBlbmNvdW50ZXIgRU9GIHdoZW4gaXQgaGFzCj4g
Pj4gbm90IGZpbmlzaGVkIHJlYWRpbmcgdGhlIG10ZCBwYXJ0aW9uLCBhbmQgdGhpcyBhbHNvIHZp
b2xhdGVzIHRoZSByZWFkCj4gPj4gc3lzdGVtIGNhbGwgc3RhbmRhcmQgaW4gUE9TSVguICAKPiAK
PiBUaGlzIGlzIGEgc3BlY2lhbCBwdXJwb3NlIGRldmljZSBmaWxlIGFuZCBub3QgYSByZWd1bGFy
IGZpbGUuCj4gUGxlYXNlIGV4cGxhaW4gaW4gZGV0YWlsIHdoeSB0aGlzIHZpb2xhdGVzIFBPU0lY
IGFuZCB3aGljaCBwcm9ncmFtIGJyZWFrcy4KPiAKPiBBcyBwb2ludGVkIG91dCBieSBNaXF1ZWws
IHRoZSBjb21tZW50IG1ha2VzIGl0IGNsZWFuIHRoYXQgdGhpcyBiZWhhdmlvciBpcwo+IG9uIHB1
cnBvc2UuIElmIHdlIHJldHVybiBub3cgYWxsIG9mIGEgc3VkZGVuIC1FQkFETVNHIGZvciB0aGUg
ZGVzY3JpYmVkCj4gc2NlbmFyaW8gd2UgbWlnaHQgZXZlbiBicmVhayBleGlzdGluZyBNVEQgdXNl
cnNwYWNlLgoKVGhlIGJ1Z3ppbGxhIGxpbmsgaW4gdGhlIGNvbW1pdCBsb2cgWzFdIG1lbnRpb25z
OgoKKiBkZCB3b3VsZCBqdXN0IHN0b3AgaW4gdGhlIG1pZGRsZSB3aXRob3V0IHNob3dpbmcgZXJy
b3JzCiAgLT4gd2UgcHJvYmFibHkgZG9uJ3QgY2FyZSwgd2UgZXhwZWN0IHRoZSB1c2Vyc3BhY2Ug
dG8ga25vdyB0aGlzIGlzCiAgTkFORCB3aGVuIGRlYWxpbmcgd2l0aCBtdGQgZGV2aWNlcyBkaXJl
Y3RseSwgZGQgaXMgbm90IG10ZC1hd2FyZQogIGFueXdheS4KCiogdWJpZm9ybWF0IHdvdWxkIGxv
b3AgZm9yZXZlcgogIC0+IHRoYXQgb25lIG5lZWRzIGF0dGVudGlvbiBJIGd1ZXNzIDopCgpbMV0g
aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTc5MzkKClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
