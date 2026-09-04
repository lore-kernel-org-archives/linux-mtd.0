Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3ED7C624D3
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 18:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HfZeEtvIswR9RuPyRFXpbLZbFs+N/tsliWyT9xsY464=; b=okK45VbkbnUIi3
	sM87MHcrWIxKBjWzCeMNQfnrVj90JO8xguyDiEALbb42uq4NcAgysgciBgWRn4o5F5XR+axssgDJs
	OWi7Tixi1AnhhChmMjJI01r9O+twg/lD0Md7fXboNwZWJer46t+G/ILowZjBy/+5+yKk43y0q+DuF
	rPBrms6tAwf9vlUpSD+ffZ8slUVROqbpNoiPQVN6265uSOMoZ+JmS2Qf2mqcqIK0gI/DB6tbbVVzZ
	1aX7gqoxcugOmYKDDXHyO03qUw32uXPeJXpd3pXaXf1K5x4gcl4Q6PtP9LsJLjee52oBZPsxMLLPq
	EXlLgy1422FwlUZnaOCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YLR-00000002yhw-1QIX;
	Fri, 04 Sep 2026 18:08:57 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YLO-00000002yhB-3Har;
	Fri, 04 Sep 2026 18:08:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F3FD11A19BD;
	Fri,  4 Sep 2026 18:08:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B88136057F;
	Fri,  4 Sep 2026 18:08:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56ACE11C78767;
	Fri,  4 Sep 2026 20:08:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545331; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dWuI5clJsFoY8b2SjzUR4FdsBGhCzDs3OZOhmva406I=;
	b=VPGCrFwhbj3czKymibnU/7EjDzwyWPB/eKuJxg646eOtzC82sduCsgr9hQp12mTj/Z6Vx9
	5ciudHVY8XmceGUuTGNVW47O0phQh7loFPghqmM1UDw7h1w1pTfxtzwJLKnoqw9ojKua7v
	Pg/iBN7juPxrU9rMZxvn8ENLCP+qA8/K50UnzrsV/7J0N+PjeHoApjKVyVzuZ9N5iDNLkS
	KAz9AeY6ES3iVHQNwXGllTf5/gqRRR0lhh24QBR3a9/yAHTlqKNb9tbDx4yP69Jxx7HKQ9
	apgpovFBD2mPvvBlL7W3poUGNXF0FrnnEO+LXhCK2EgHaJvVdiFqKoU0kDdABw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260811-sunxi-nand-protected-oob-fixes-v1-0-412e50444673@gmail.com>
References: <20260811-sunxi-nand-protected-oob-fixes-v1-0-412e50444673@gmail.com>
Subject: Re: [PATCH 0/3] mtd: rawnand: sunxi: harden protected OOB handling
Message-Id: <178854532418.1533016.648068114712048583.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 20:08:44 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_110854_961128_0F07BF03 
X-CRM114-Status: UNSURE (   5.69  )
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

T24gVHVlLCAxMSBBdWcgMjAyNiAwMDowMTo1OCAtMDYwMCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6
Cj4gVGhlIEg2L0g2MTYgdmFyaWFibGUgcHJvdGVjdGVkLU9PQiBpbXBsZW1lbnRhdGlvbiBoYXMg
dGhyZWUgcmVsYXRlZAo+IGZhaWx1cmUgY2FzZXMgYXJvdW5kIGl0cyBwZXItc3RlcCB1c2VyLWRh
dGEgbGVuZ3Rocy4KPiAKPiBGaXJzdCwgcHJvcGFnYXRlIGZhaWx1cmVzIHdoaWxlIGFsbG9jYXRp
bmcgdGhlIHBlci1zdGVwIGxlbmd0aCBhcnJheS4KPiBUaGVuIHJlc2VydmUgYW4gZW5jb2RhYmxl
IGZvdXItYnl0ZSBmaXJzdCBzZWN0aW9uIGZvciB0aGUgYmFkIGJsb2NrCj4gbWFya2VyIGFuZCBy
ZWplY3QgbGF5b3V0cyB3aGljaCBjYW5ub3QgcHJvdmlkZSBpdC4gRmluYWxseSwgcmVwbGFjZSB0
aGUKPiBwZXItd3JpdGUgaGVhcCBhbGxvY2F0aW9uIHVzZWQgZm9yIEJCTSBjb21wZW5zYXRpb24g
d2l0aCB0aGUKPiBjb250cm9sbGVyJ3MgYm91bmRlZCAzMi1ieXRlIHN0YWNrIGJ1ZmZlci4KPiAK
PiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzNdIG10ZDogcmF3bmFu
ZDogc3VueGk6IHByb3BhZ2F0ZSB1c2VyLWRhdGEgYWxsb2NhdGlvbiBlcnJvcnMKICAgICAgY29t
bWl0OiA4Njk2NTAyYjBhYTk2YmNiYjFmMWU3OGFlMTE3NzI2Mzc4ODIzYWU4ClsyLzNdIG10ZDog
cmF3bmFuZDogc3VueGk6IHJlc2VydmUgYSBmdWxsIHVzZXItZGF0YSB3b3JkIGZvciBCQk0KICAg
ICAgY29tbWl0OiBiZGU4ZmQ4ODBkODQ2MjcwNzJjMjI0NzI5YzgxODMwNmM0YjMwZDU4ClszLzNd
IG10ZDogcmF3bmFuZDogc3VueGk6IHVzZSBhIHN0YWNrIGJ1ZmZlciBmb3IgQkJNIHJhbmRvbWl6
YXRpb24KICAgICAgY29tbWl0OiBhODU5NmJiNzE0ODEzNmI5ZTgzOTgwOTAwZDUwOGQwZWY4NjUw
N2VmCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3
aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxh
aW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
