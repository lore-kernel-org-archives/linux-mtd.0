Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD2CCCF2D2
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 10:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BeYWrkXigDGOkeEgXWvHIami8LtgcsHIOhhpSbgx1fs=; b=nTGzg44D7aflgl
	VHgrWE1eAgaGoUVQJAz/6TEoGt9LFxJAWaZWxzfN9ewkDWszl3zmGJKSLu9it2WAq/93Han+TCydj
	QVgM9tHlMjetbRoBU0/gScHvOOPDgjLqrEmA58cXM/YAeQoYrdmGLWmlWTc0OhKhlEn+sRi+gmLsh
	2u5LeJZ6HnpY7J8uFYE06RZzOsaMn5gK9ix8jkCkXhE+BO62fwQ7HLSpf3nCOFlhzloJbwqtto/H7
	6WYoqOZyDBKN1HN/iLGH1aL+AJ9etO44dMJNN3Rqv78ov0D7+DVNlReC2vfra+6mjluvLnsslH4/+
	QrGeCBM8ngDorZez3wbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmM2-00000001kKC-3t4V;
	Mon, 19 Jan 2026 10:19:26 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmM0-00000001kJ5-2Q8q
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 10:19:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8FCE84E420D8;
	Mon, 19 Jan 2026 10:19:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64CC060731;
	Mon, 19 Jan 2026 10:19:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 640A910B69C1A;
	Mon, 19 Jan 2026 11:19:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768817961; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8xFkLt+vsNnecP7M2YwuQlsQG01WjP/DH0MEr0eouIo=;
	b=R+BoZGT2jGoWyRpTtu2o4QI2+esBgEAH/ZclBpSsnDDTDJpcBWr5CeqUnZ4XwUekULf+LN
	yX4E3VZVjYH8bmtQ39pGnUfIjsjXeZFU4EVHSubEeJ4nqSZgVi2o9ePbd2nQVVZOZjyugH
	plxRwozwO5hA4XoW9eEDd0FRIjqQH9rhE0MgERWAViCfUXmWlluMtFtwI7o3rvLQ2M9xJi
	79i2RpxkL/NWaQSdgyQKNC/CTHPMLrRV/zgG/Ad9HZhxjrmWgRylNsOkPsbeMzsJXx77DV
	frNLDimscFRkPl1HXyV47P0U3A4Abfw95JNfElqw7lWqhqyXpZnSOx+uI+Q4jA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
 Daniel Palmer <daniel@thingy.jp>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20260104100151.1400182-1-daniel@thingy.jp>
References: <20260104100151.1400182-1-daniel@thingy.jp>
Subject: Re: [PATCH] mtd: parsers: ofpart: Remove code/data for disabled
 custom parsers
Message-Id: <176881795958.2442128.16209814865839859020.b4-ty@bootlin.com>
Date: Mon, 19 Jan 2026 11:19:19 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_021924_744974_C0FAF8A9 
X-CRM114-Status: GOOD (  11.36  )
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

T24gU3VuLCAwNCBKYW4gMjAyNiAxOTowMTo1MSArMDkwMCwgRGFuaWVsIFBhbG1lciB3cm90ZToK
PiBDdXJyZW50bHkgZXZlbiBpZiBub25lIG9mIHRoZSBjdXN0b20gcGFyc2VycyBhcmUgc2VsZWN0
ZWQgYSBzdHJ1Y3QKPiBvZl9kZXZpY2VfaWQgYW5kIGEgZHVtbXkgZnVuY3Rpb24gdGhhdCBqdXN0
IHJldHVybnMgLUVPUE5PVFNVUFAgaXMKPiBjb21waWxlZCBpbiBmb3IgZWFjaCBvZiB0aGVtLgo+
IAo+IEl0cyBub3Qgb2J2aW91cyBmcm9tIHRoZSBjb2RlIGJ1dCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IGlzIG1hc3NpdmUsCj4gMTk2IG9yIDIwMCBieXRlcyAoc2VlIGxpbmspLCBzbyB0aGlzIGlzIGEg
bG90IG1vcmUgd2FzdGVmdWwgdGhhbiB5b3UnZAo+IHRoaW5rIGp1c3Qgc2tpbW1pbmcgdGhlIGNv
ZGUgYW5kIGFzc3VtaW5nIHRoZSB3YXN0ZWQgc2l6ZSBpcyBqdXN0IHRoZQo+IGxlbmd0aCBvZiB0
aGUgc3RyaW5nIHdpdGggc29tZSBzbWFsbCBvdmVyaGVhZC4KPiAKPiBbLi4uXQoKQXBwbGllZCB0
byBtdGQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiBwYXJzZXJzOiBvZnBhcnQ6IFJlbW92ZSBj
b2RlL2RhdGEgZm9yIGRpc2FibGVkIGN1c3RvbSBwYXJzZXJzCiAgICAgIGNvbW1pdDogNTY0Nzdh
ZWE0ODJkZDgxZTAzNjRkOThhMDJhYjgwNWQyNDI0MmI3MgoKUGF0Y2hlKHMpIHNob3VsZCBiZSBh
dmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBS
IChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJk
cywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
