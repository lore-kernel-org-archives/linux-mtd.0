Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6695C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Feb 2022 14:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WDGBiy38sig+befna9RtZf2ep4Xz4Pab2aUoLj1/bMY=; b=0z6I6Rjsx9q/RZ7Fir9EjQUVZh
	h4GRbgB47apNlPlwcIYVVb9F8VdXou2qmlQxsyYGb+4/S7EsQOwtWfyuTM2p7JiOijEXrOArpi2TK
	v9gILUjZxpwk+z9YZgh0d059pnDwLIGVq4B3dVDEfWhyrnGFI4XsQW3G2c4C4XnJuK6g1AaqhbuR8
	8uHq7ugq3IwiBwTzvj4ia1RXueHb3DcJQj2J558Sjm68aeo2RFOp10ZP6X+VToAAthZpEWmQk665q
	HH5EjQ192MGqK8rAsF0JYyxTx/HKZRSyKwEAc/ulLBCRqxzeyfAEa07LWEjQNDMVqwN5APlaaFwZ+
	4YHulVug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNbs1-005RNT-7y; Fri, 25 Feb 2022 14:46:57 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNbrl-005RKg-PB
 for linux-mtd@lists.infradead.org; Fri, 25 Feb 2022 14:46:43 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id E134A608F445;
 Fri, 25 Feb 2022 15:46:30 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id VQYLjsqEbPlR; Fri, 25 Feb 2022 15:46:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 5637C609B3EF;
 Fri, 25 Feb 2022 15:46:30 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id hW8gdPhChCi4; Fri, 25 Feb 2022 15:46:30 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2A545608F445;
 Fri, 25 Feb 2022 15:46:30 +0100 (CET)
Date: Fri, 25 Feb 2022 15:46:30 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
 OpenWrt Development List <openwrt-devel@lists.openwrt.org>
Message-ID: <1583488718.86714.1645800389992.JavaMail.zimbra@nod.at>
In-Reply-To: <a03b8735-685f-d488-a3fb-81d017358808@gmail.com>
References: <7bc0ee19-2943-3503-046e-130de73a2cdf@gmail.com>
 <a03b8735-685f-d488-a3fb-81d017358808@gmail.com>
Subject: Re: ubifs: handling dirty data (writing back) + power cuts
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: handling dirty data (writing back) + power cuts
Thread-Index: svq6xM8sd5cvDXpiyc0AJF939t5+lg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_064642_010903_6CC4F5EC 
X-CRM114-Status: UNSURE (   6.33  )
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

UmFmYcWCLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlJhZmHFgiBN
acWCZWNraSIgPHphamVjNUBnbWFpbC5jb20+Cj4gT24gMjUuMDIuMjAyMiAxNToxNywgUmFmYcWC
IE1pxYJlY2tpIHdyb3RlOgo+PiBNeSBhY3R1YWwgcHJvYmxlbSBpcyByZWxhdGVkIHRvIHViaWZz
IGJlaGF2aW91ciBmb3IgcG93ZXIgY3V0cyBoYXBwZW5pbmcKPj4gYmV0d2VlbiA1IGFuZCAzNSBz
ZWNvbmRzIGFmdGVyIHNhdmluZyBhIGZpbGU6Cj4+IGRhdGUgPiAvbW91bnQvdWJpZnMvdGVzdC50
eHQgJiYgc2xlZXAgMTUgJiYgZWNobyBDVVQgUE9XRVIgKk5PVyoKPj4gCj4+IE9uIHRoZSBuZXh0
IGJvb3QgdGVzdC50eHQgZXhpc3RzIGJ1dCBpdCdzIEVNUFRZIChmaWxlIHNpemUgMCkuCj4gCj4g
RldJVyBJIGdldCBhY2NlcHRhYmxlIHViaWZzIGJlaGF2aW91ciBpZiBwb3dlciBjdXQgaGFwcGVu
cyBpbiBsZXNzIHRoYW4KPiA1IHNlY29uZHMgYWZ0ZXIgc2F2aW5nIGEgZmlsZS4gRm9yIGV4YW1w
bGU6Cj4gZGF0ZSA+IC9tb3VudC91Ymlmcy9mb28udHh0ICYmIHNsZWVwIDQgJiYgZWNobyBDVVQg
UE9XRVIgKk5PVyoKPiAKPiBPbiB0aGUgbmV4dCBib290IGZvby50eHQgc2ltcGx5IGRvZXNuJ3Qg
ZXhpc3QuCj4gCj4gCj4gRXZlcnl0aGluZyB3b3JrcyBmaW5lIGZvciBwb3dlciBjdXRzIGhhcHBl
bmluZyBhZnRlciAzMCArIDUgc2Vjb25kczoKPiBkYXRlID4gL21vdW50L3ViaWZzL2Jhci50eHQg
JiYgc2xlZXAgMzUgJiYgZWNobyBDVVQgUE9XRVIgKk5PVyoKPiAKPiBPbiB0aGUgbmV4dCBib290
IGJhci50eHQgZXhpc3RzIGFuZCBpdCBjb250YWlucyBhIGRhdGUuCgpTZWU6Cmh0dHA6Ly93d3cu
bGludXgtbXRkLmluZnJhZGVhZC5vcmcvZmFxL3ViaWZzLmh0bWwjTF9lbXB0eV9maWxlCgpQbGVh
c2UgbGV0IG1lIGtub3cgd2hldGhlciB0aGlzIGhlbHBlZC4KSSBndWVzcyBtb3VudGluZyBVQklG
UyBpbiBzeW5jIG1vZGUgaXMgd2hhdCB5b3Ugd2FudC4KQnV0IHBsZWFzZSBhbHNvIGtlZXAgdGhp
cyBpbiBtaW5kOgpodHRwOi8vd3d3LmxpbnV4LW10ZC5pbmZyYWRlYWQub3JnL2RvYy91Ymlmcy5o
dG1sI0xfc3luY19zZW1hbnRpY3MKClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
