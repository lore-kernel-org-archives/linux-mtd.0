Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CAAC43334
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 20:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DgHSnhQ3lDtgjF5lWDNZwQcZ7KuveVouUEHqxvUx2bo=; b=f9AgofRNTHnjYO1AAhUqfZTnrG
	1kMJGsptJAInDNM5BfnQcDMp+w+SAvnTthLAZWcBTBgJJWQJAYME19EMytAnF2SRQieuxhRwjkKim
	r965uBMn8mZt68nov5BJKgRcb+kow5KaLhLC58HCtyszXx3QVVZsU9Q1TLjOnouHMMJramDCpySh2
	aEblFA6jGRaT5S5pQXWmOZQy3eV8mfFn63n/6us+fN8B3Q97Az4LBb5mCYs6OvbLiopr7Qom8dxlc
	DamtZ7/aVLOrsTFOvpS05IEWnRC31D27TsgqN015CjX8e/49woVINA2Hmq/5RttSMJs5LUEUD1Y0r
	zcaVYJnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyfqT-009Xm7-Tu; Tue, 07 Jun 2022 20:30:33 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyfqQ-009Xlp-P9
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2022 20:30:32 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 39C0361B8B4C;
	Tue,  7 Jun 2022 22:30:29 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id HT-WCvRXO0X0; Tue,  7 Jun 2022 22:30:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id AFAB261B8B68;
	Tue,  7 Jun 2022 22:30:28 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 13BXEJVUW9oh; Tue,  7 Jun 2022 22:30:28 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8F1A061B8B4C;
	Tue,  7 Jun 2022 22:30:28 +0200 (CEST)
Date: Tue, 7 Jun 2022 22:30:28 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <75745632.147517.1654633828458.JavaMail.zimbra@nod.at>
In-Reply-To: <20220516070601.11428-3-kernel@kempniu.pl>
References: <20220516070601.11428-1-kernel@kempniu.pl> <20220516070601.11428-3-kernel@kempniu.pl>
Subject: Re: [PATCH 2/2] mtdchar: use kvmalloc() for potentially large
 allocations
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: mtdchar: use kvmalloc() for potentially large allocations
Thread-Index: GV6LOGkacTyBnlb9cH8NJV3ZRtoFFQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_133031_012375_54F0F49F 
X-CRM114-Status: UNSURE (   6.67  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pY2hhxYIgS8SZcGllxYQi
IDxrZXJuZWxAa2VtcG5pdS5wbD4KPiBBbjogIk1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPiwgInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJWaWduZXNoIFJhZ2hh
dmVuZHJhIiA8dmlnbmVzaHJAdGkuY29tPgo+IENDOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxp
c3RzLmluZnJhZGVhZC5vcmc+LCAibGludXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZz4KPiBHZXNlbmRldDogTW9udGFnLCAxNi4gTWFpIDIwMjIgMDk6MDY6MDEKPiBCZXRy
ZWZmOiBbUEFUQ0ggMi8yXSBtdGRjaGFyOiB1c2Uga3ZtYWxsb2MoKSBmb3IgcG90ZW50aWFsbHkg
bGFyZ2UgYWxsb2NhdGlvbnMKCj4gbXRkY2hhcl93cml0ZV9pb2N0bCgpIGNhbGxzIGttYWxsb2Mo
KSB3aXRoIHRoZSAnc2l6ZScgYXJndW1lbnQgc2V0IHRvCj4gdGhlIHNtYWxsZXIgb2YgdHdvIHZh
bHVlczogdGhlIHdyaXRlIHJlcXVlc3QncyBkYXRhL09PQiBsZW5ndGggcHJvdmlkZWQKPiBieSB1
c2VyIHNwYWNlIGFuZCB0aGUgZXJhc2UgYmxvY2sgc2l6ZSBvZiB0aGUgTVREIGRldmljZS4gIElm
IHRoZSBsYXR0ZXIKPiBpcyBsYXJnZSwga21hbGxvYygpIG1heSBub3QgYmUgYWJsZSB0byBzZXJ2
ZSBzdWNoIGFsbG9jYXRpb24gcmVxdWVzdHMuCj4gVXNlIGt2bWFsbG9jKCkgaW5zdGVhZC4gIENv
cnJlc3BvbmRpbmdseSwgcmVwbGFjZSBrZnJlZSgpIGNhbGxzIHdpdGgKPiBrdmZyZWUoKSBjYWxs
cy4KPiAKPiBTdWdnZXN0ZWQtYnk6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+
Cj4gU2lnbmVkLW9mZi1ieTogTWljaGHFgiBLxJlwaWXFhCA8a2VybmVsQGtlbXBuaXUucGw+CgpM
b29rcyBnb29kIHRvIG1lLgpBY2tlZC1ieTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5v
ZC5hdD4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
