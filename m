Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0ACCC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Feb 2022 09:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pc114mkRGIxzSRC79JWvgoHN4OkJVPl+bXMGKSZDjK4=; b=Yf2I7zj4bJKJmi
	5qP/d8SHz4QGFVUYG5Fek3EnBov28C33I3SMUnqcJ+/btgzm38ZATFyw0+nJGOgrVB9eG6A6w4PAs
	SSaNaNpzwAzPHBagO3TRB8Tv+PbGWVyOuSNPrNZpb9cno8Fb/xzewam494ZjQrcJ06Bw2hfRZRfmO
	uFLq/yCjiijHJCp9GL1bAKDl+jWrC2Qgyi10fwZ6G8pMXP4Wdxep83Wv4UDMccmjHooNSIKNkIBxv
	VMpadGC3umb7kLLJ7nbaBLf1ffgt7ueDrFOhbCZ/nZtJCUv4eCTDZmQD5HNBUx7g4h3vBx7QYoSC5
	nG0J29jG6JXP9z0Kquow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYhn-000Y94-Sj; Thu, 03 Feb 2022 09:47:07 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYhk-000Y7D-On
 for linux-mtd@lists.infradead.org; Thu, 03 Feb 2022 09:47:06 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3923C200018;
 Thu,  3 Feb 2022 09:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643881618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v5Jk2Zg/jlnzRSMuz3x0o8u6pgBwywiIWqNlylIDzik=;
 b=FJP4qh95Kbu7zw26XluYKyrhAzkUwwlYyfNwTNiNcTTqTP8F/XXU35UWacDuPTJjweoYEL
 GiYjvWHc3hP69mR6Nd8Y0X0WY1MhVMAE0YigfhdKbkDTFm6Yu3ty06aWvtNuFAP7d/DjX7
 07kNGOCCR7yu9HNPPsuBlqObJA+bm99wZDIvMY+LYOn7+NsuVHHfCklCayId2CpF6Y4Z7q
 CyRux8QYr/Z54JvD/4L9g9CK7j7Dvj1objxwbKHwaSMbZC9vELYTo7Un6BxICoGvKpQ3//
 pVIe7usTj7Dk0FeyvXGdhXTmYPjK4+X/EGYWZzhO1tyN32ChRI3QEgTDofZlSg==
Date: Thu, 3 Feb 2022 10:46:54 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Vignesh
 Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] mtdchar: add MEMREAD ioctl
Message-ID: <20220203104654.6cb43ea3@xps13>
In-Reply-To: <1173246756.12597.1643879936765.JavaMail.zimbra@nod.at>
References: <20220125104822.8420-1-kernel@kempniu.pl>
 <20220125104822.8420-5-kernel@kempniu.pl>
 <1173246756.12597.1643879936765.JavaMail.zimbra@nod.at>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_014704_954847_8CDC16E5 
X-CRM114-Status: GOOD (  11.76  )
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

SGkgUmljaGFyZCwKCnJpY2hhcmRAbm9kLmF0IHdyb3RlIG9uIFRodSwgMyBGZWIgMjAyMiAxMDox
ODo1NiArMDEwMCAoQ0VUKToKCj4gTWljaGHFgiwKPiAKPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBN
YWlsIC0tLS0tCj4gPiBWb246ICJNaWNoYcWCIEvEmXBpZcWEIiA8a2VybmVsQGtlbXBuaXUucGw+
Cj4gPiBBbjogIk1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiwgInJp
Y2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJWaWduZXNoIFJhZ2hhdmVuZHJhIiA8dmlnbmVzaHJA
dGkuY29tPgo+ID4gQ0M6ICJCb3JpcyBCcmV6aWxsb24iIDxib3Jpcy5icmV6aWxsb25AY29sbGFi
b3JhLmNvbT4sICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJs
aW51eC1rZXJuZWwiCj4gPiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4KPiA+IEdlc2Vu
ZGV0OiBEaWVuc3RhZywgMjUuIEphbnVhciAyMDIyIDExOjQ4OjIyCj4gPiBCZXRyZWZmOiBbUEFU
Q0ggdjMgNC80XSBtdGRjaGFyOiBhZGQgTUVNUkVBRCBpb2N0bCAgCj4gCj4gPiArCWlmIChyZXEu
c3RhcnQgKyByZXEubGVuID4gbXRkLT5zaXplKSB7ICAKPiAKPiBJIHRoaW5rIHRoaXMgY2FuIG92
ZXJmbG93IHNpbmNlIGJvdGggcmVxLnN0YXJ0IGFuZCByZXEubGVuIGFyZSB1NjQuCj4gU28gYW4g
ZXZpbC1kb2VyIG1pZ2h0IGJ5cGFzcyB0aGlzIGNoZWNrLgo+IAo+ID4gKwkJcmV0ID0gLUVJTlZB
TDsKPiA+ICsJCWdvdG8gb3V0Owo+ID4gKwl9Cj4gPiArCj4gPiArCWRhdGJ1Zl9sZW4gPSBtaW5f
dChzaXplX3QsIHJlcS5sZW4sIG10ZC0+ZXJhc2VzaXplKTsKPiA+ICsJaWYgKGRhdGJ1Zl9sZW4g
PiAwKSB7Cj4gPiArCQlkYXRidWYgPSBrbWFsbG9jKGRhdGJ1Zl9sZW4sIEdGUF9LRVJORUwpOyAg
Cj4gCj4gSWYgbXRkLT5lcmFzZXNpemUgaXMgbGFyZ2UgKHdoaWNoIGlzIG5vdCB1bmNvbW1vbiB0
aGVzZSBkYXlzKSB5b3UgbWlnaHQKPiByZXF1ZXN0IG1vcmUgZnJvbSBrbWFsbG9jKCkgdGhhbiBp
dCBjYW4gc2VydmUuCj4gTWF5YmUga3ZtYWxsb2MoKSBtYWtlcyBtb3JlIHNlbnNlPwoKTW1taCwg
SSB3b3VsZCByZWFsbHkgbGlrZSB0aGVzZSBidWZmZXJzIGRtYS1hYmxlLgoKSSBqdXN0IGRpc2Nv
dmVyZWQgbXRkX2ttYWxsb2NfdXBfdG8oKS4gV291bGQgdGhpcyB3b3JrPwoKPiAKPiA+ICsJCWlm
ICghZGF0YnVmKSB7Cj4gPiArCQkJcmV0ID0gLUVOT01FTTsKPiA+ICsJCQlnb3RvIG91dDsKPiA+
ICsJCX0KPiA+ICsJfQo+ID4gKwo+ID4gKwlvb2JidWZfbGVuID0gbWluX3Qoc2l6ZV90LCByZXEu
b29ibGVuLCBtdGQtPmVyYXNlc2l6ZSk7Cj4gPiArCWlmIChvb2JidWZfbGVuID4gMCkgewo+ID4g
KwkJb29iYnVmID0ga21hbGxvYyhvb2JidWZfbGVuLCBHRlBfS0VSTkVMKTsgIAo+IAo+IFNhbWUu
Cj4gCj4gVGhhbmtzLAo+IC8vcmljaGFyZAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
