Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D843106703C
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2026 14:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+tlPnLsy1SnZDRRZVdsXe/h5m/ffPnZeEmupxZVGVcg=; b=ILn5o3qnKbc87h
	Q9G1T1WP6ANPgUF5LkTxBeye/8kSbpSp537rRiwv4ibgcmGcD5egkBnx9nr7afO6EOUMON+E62QSM
	p2aGPxf9DhXcYoUGjQXd5oM17JkfI11/fGt7bdjbaUUfb3muAG9lG9A4+eT2L8EozkLHzm5ZrXSz0
	qhZeBysSKxX9eRzhZYanZiT/ovRw5eU+wWDJqS6LSqCBv00FHIjH0n5rk3hJ5PH2asYCu1Cca+ca9
	oaY+M5EYf6AYzL03Z1TsHN1jKgMXN86gV+RLh3YqfelzlNKP4mxQfZWl3Zwq+enzICsvl/RL0CYQO
	X8RDl9osvFojuwGmpAzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hEZ-0000000EDsT-1AyB;
	Thu, 12 Mar 2026 14:41:55 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hEU-0000000EDrh-3ubm
	for linux-mtd@lists.infradead.org;
	Thu, 12 Mar 2026 14:41:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 39F20C415B4
	for <linux-mtd@lists.infradead.org>; Thu, 12 Mar 2026 14:42:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D5475FDEB;
	Thu, 12 Mar 2026 14:41:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F0A210369D80;
	Thu, 12 Mar 2026 15:41:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773326503; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ltlhWB/R+dYGhwgGAypvr2FmzCOvy+OJ80K5UktbZIE=;
	b=kV0XiLLpl4YNjd6gU8pjNriysy8QLHtVqlgAPiNuSIDpxocFAZ98E0y6tD6BaKry4u3SFN
	KAEvXGtWCbFfJtsbTk7yJq3ZoVQ9N7aclod3WLXq6l/Y+jorST7y0mPhxgv2doAaI7dLY3
	2slj7/07RR5LtJZhp8A151pDaMflTE7+Qmp16V6a9/ckHcHP+gDvQjm7iJIjB3jT568ATs
	YwmvkArjHljO9a3iz7FyOpyoWz6YTyJUCcczcGtrMWWQvnbmzz2+pA09scVrJX9nMfuvUo
	8Ngy9QYTATB++eYBEmYgM1qsF1qEupUNEHf4LbsyjXVDXYQWXcKb//pz1dNoIA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Chen-Yu Tsai <wens@csie.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,  Wentao
 Liang <vulab@iscas.ac.cn>,  Maxime Ripard <mripard@kernel.org>,  Boris
 Brezillon <bbrezillon@kernel.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] mtd: rawnand: sunxi: introduce variable user
 data length
In-Reply-To: <20260305100137.2558423-7-richard.genoud@bootlin.com> (Richard
	Genoud's message of "Thu, 5 Mar 2026 11:01:37 +0100")
References: <20260305100137.2558423-1-richard.genoud@bootlin.com>
	<20260305100137.2558423-7-richard.genoud@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 12 Mar 2026 15:41:37 +0100
Message-ID: <87a4wdkt3y.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_074151_156234_FC021718 
X-CRM114-Status: GOOD (  13.92  )
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

SGVsbG8gUmljaGFyZCwKCk9uIDA1LzAzLzIwMjYgYXQgMTE6MDE6MzcgKzAxLCBSaWNoYXJkIEdl
bm91ZCA8cmljaGFyZC5nZW5vdWRAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBJbiBBbGx3aW5uZXIg
U29DcywgdXNlciBkYXRhIGNhbiBiZSBhZGRlZCBpbiBPT0IgYmVmb3JlIGVhY2ggRUNDIGRhdGEu
Cj4gRm9yIG9sZGVyIFNvQ3MgbGlrZSBBMTAsIHRoZSB1c2VyIGRhdGEgc2l6ZSB3YXMgdGhlIHNp
emUgb2YgYSByZWdpc3Rlcgo+ICg0IGJ5dGVzKSBhbmQgd2FzIG1hbmRhdG9yeSBiZWZvcmUgZWFj
aCBFQ0Mgc3RlcC4KPiBTbywgdGhlIEExMCBPT0IgTGF5b3V0IGlzOgo+IFs0Qnl0ZXMgVVNFUl9E
QVRBX1NURVAwXSBbRUNDX1NURVAwIGJ5dGVzXQo+IFs0Ynl0ZXMgVVNFUl9EQVRBX1NURVAxXSBb
RUNDX1NURVAxIGJ5dGVzXQo+IC4uLgo+IE5COiB0aGUgQkJNIGlzIHN0b3JlZCBhdCB0aGUgYmVn
aW5uaW5nIG9mIHRoZSBVU0VSX0RBVEFfU1RFUDAuCj4KPiBOb3csIGZvciBINi9INjE2IE5BTkQg
Zmxhc2ggY29udHJvbGxlciwgdGhpcyB1c2VyIGRhdGEgY2FuIGhhdmUgYQo+IGRpZmZlcmVudCBz
aXplIGZvciBlYWNoIHN0ZXAuCj4gQW5kIHRoZSB2ZW5kb3IgaGFzIGNob3NlbiBhIGRpZmZlcmVu
dCBsYXlvdXQgZnJvbSB0aGUgb25lIG9uIEExMCwgdXNpbmcKPiA4IGJ5dGVzIGZvciBzdGVwIDAg
YW5kIG5vdGhpbmcgZm9yIGZ1cnRoZXIgc3RlcHM6Cj4gWzhieXRlcyBVU0VSX0RBVEFfU1RFUDBd
IFtFQ0NfU1RFUDAgYnl0ZXNdIFtFQ0NfU1RFUDEgYnl0ZXNdLi4uCj4gKFN0aWxsIHdpdGggQkJN
IHN0b3JlZCBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZSBVU0VSX0RBVEFfU1RFUDApCgpJIHdvdWxk
IHJhdGhlciBiZSBpbiBmYXZvdXIgb2Ygbm90IGZvbGxvd2luZyAkKHJhbmRvbSB2ZW5kb3IpIGZp
cm13YXJlCmxheW91dC4gVXBzdHJlYW0sIGl0IG1ha2VzIHByb2JhYmx5IG1vcmUgc2Vuc2UgdG8g
anVzdCBhbGxvdyBhY2Nlc3MgdG8KdGhlIG1heGltdW0gbnVtYmVyIG9mIGJ5dGVzIHRoYXQgY2Fu
IGJlIGNvdmVyZWQgYnkgdGhlIEVDQyBlbmdpbmUsIHNvIEkKd291bGQgcmF0aGVyIGJlIGluIGZh
dm91ciBvZiBjb21wdXRpbmcgdGhlIG1heGltdW0gc2l6ZSB0aGF0IHlvdSBjYW4gc2V0CmZvciBl
YWNoIHN0ZXAsIHdpdGhvdXQgZ29pbmcgb3ZlciB0aGUgT09CIHNpemUuCgpPbmNlIHRoaXMgc2V0
IHVwLCBJIGJlbGlldmUgYWRhcHRpbmcgdGhlIGRyaXZlciBsb2NhbGx5IChvdXQgb2YgdHJlZSkg
dG8KbWF0Y2ggYSBzcGVjaWZpYyB2ZW5kb3IgbGF5b3V0IHdvdWxkIGJlIHJhdGhlciBzdHJhaWdo
dGZvcndhcmQsIGFzIGFsbAp0aGUgY29uZmlndXJhdGlvbiBwaWVjZXMgd291bGQgYWxyZWFkeSBi
ZSBpbiBwbGFjZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
