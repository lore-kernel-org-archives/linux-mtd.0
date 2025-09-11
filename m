Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56F5CAC592
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Sep 2025 15:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iieAX8hT8vqW/PpK0BPLUuyaMUw4GXwbkRrbOlwAmMY=; b=AM7o9KlZYPBsM5
	xfze1nv7pLXU3sawuwsxnWwJ7sjttumqPHIsBREGIPhBF2M3hq3Z4Tu8yHpOrEjEXPvuy1fqBZVxK
	v0b/oSnwPOUUpatD12IVCynr73/edKp8v64dQFPfX+5CNwFjWGfZYc5P9ng3b6ho3k1Iw+kunXahh
	nqtqXbTamXi7D+n3BJrVP0xfXgcc7jm+5n2cGy81NXsNYkqS6Xr6svvHhuNUVdv9iJ/ACcT4mFV72
	nFSKX673ResVgoHz/0UTRSx04CLCM4ADK4qXIlFKNZ3NNEA5uijMaiuXw5Y29vSWGBcoM62TyI7lT
	4uYflTsJZBqTZVKaU67g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjIp-00000003vDt-2zy6;
	Thu, 11 Sep 2025 15:33:39 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjIl-00000003vA5-3FAf
	for linux-mtd@lists.infradead.org;
	Thu, 11 Sep 2025 15:33:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4ECDE1A0E06;
	Thu, 11 Sep 2025 15:33:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18D0760630;
	Thu, 11 Sep 2025 15:33:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B96F1102F28ED;
	Thu, 11 Sep 2025 17:33:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757604812; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VuW3XwSlPhCFR38vA2Wai2iQU+azk9EheDFfxT2iJJU=;
	b=jYTRQGMdHcw4facgqioSpwSA42N5i/5gCbX8jxKS5OEO9GYWATCE5MeIlurb91eOJZ5Cfy
	zgZLsoRTJgNo0eCG9AlNoxpV1TW50LbX4I6O7+rVvX2NVZKcQGfDB/+nzaAI99GZWbiUcv
	Cts56LsycQDd/Tqr77V9Q2zMbPiBvxOpUPr+UZ/5xYcjzKLmxtetibTo33BNvuLXNT5n8K
	oI0BwGUrl1vgvgHyqkcSh7nb+wYi+M4HQr6G913hDCKUlIZQjHY/Xd3jUbGL0e7c1J23Bh
	1jHaQY/0nUIjQe6TADLSCzDFeIdCANVb/zIt+VGo02uRM/OJTqLLFutAJ5gkdg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Gabor Juhos <j4g8y7@gmail.com>,  Santhosh Kumar K <s-k6@ti.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org,  Daniel Golle
 <daniel@makrotopia.org>
Subject: Re: [PATCH v2] mtd: core: always verify OOB offset in
 mtd_check_oob_ops()
In-Reply-To: <87a5319j9w.fsf@bootlin.com> (Miquel Raynal's message of "Thu, 11
	Sep 2025 16:05:31 +0200")
References: <20250901-mtd-validate-ooboffs-v2-1-c1df86a16743@gmail.com>
	<175708415877.334139.11409801733118104229.b4-ty@bootlin.com>
	<454e092d-5b75-4758-a0e9-dfbb7bf271d7@ti.com>
	<87348tbeqg.fsf@bootlin.com>
	<a208824c-acf6-4a48-8fde-f9926a6e4db5@gmail.com>
	<mafs0v7lpi1j5.fsf@kernel.org> <87a5319j9w.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Thu, 11 Sep 2025 17:33:11 +0200
Message-ID: <87y0ql80nc.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_083335_943126_68C3AE6E 
X-CRM114-Status: GOOD (  11.95  )
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

T24gMTEvMDkvMjAyNSBhdCAxNjowNTozMSArMDIsIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+IHdyb3RlOgoKPj4+IFNvcnJ5IGZvciB0aGUgaW5jb252ZW5pZW5jZS4K
Pj4+Cj4+Pj4gR2Fib3IsIGNhbiB5b3UgY2hlY2sgd2hhdCBoYXBwZW5zIHdpdGggbXRkYmxvY2s/
Cj4+Cj4+IE15IGd1ZXNzIGZyb20gYSBxdWljayBsb29rIGF0IHRoZSBjb2RlIGlzIHRoYXQgTk9S
IGRldmljZXMgaGF2ZQo+PiBtdGQtPm9vYnNpemUgPT0gMCBhbmQgbXRkX3JlYWQoKSBzZXRzIG9w
cy0+b29ib2ZmcyBhbmQgb3BzLT5vb2JsZW4gdG8gMC4KPj4gU28gbm93IHRoYXQgdGhpcyBjaGVj
ayBpcyBub3QgZ3VhcmRlZCBieSBpZiAob3BzLT5vb2JsZW4pLCBpdCBnZXRzCj4+IHRyaWdnZXJl
ZCBmb3IgTk9SIGRldmljZXMgb24gdGhlIG10ZF9yZWFkKCkgcGF0aCBhbmQgZXNzZW50aWFsbHkg
dHVybnMKPj4gaW50byBhbiBpZiAoMCA+PSAwKSwgcmV0dXJuaW5nIC1FSU5WQUwuCj4+Cj4+IE1h
eWJlIGEgYmV0dGVyIGNoZWNrIGlzIGlmICgob3BzLT5vb2JvZmZzICsgb3BzLT5vb2JsZW4pID4K
Pj4gbXRkX29vYmF2YWlsKCkpPwo+Cj4gSW50ZXJlc3RpbmcsIG1pZ2h0IG1ha2Ugc2Vuc2UgdG8g
ZG8gaXQgdGhpcyB3YXkuCj4KPiBUaGFua3MgUHJhdHl1c2ggZm9yIHRoZSBzdWdnZXN0aW9uLCBp
dCBpcyB3b3J0aCB0aGUgdHJ5LgoKSSBhY3R1YWxseSBoYXZlIGFub3RoZXIgcGF0Y2ggc2VyaWVz
IHRvIHJlbW92ZSBhbmQgSSBkb24ndCBoYXZlIG1vcmUKdGltZSB0byBkZWRpY2F0ZSB0byB0aGVz
ZSBpc3N1ZXMgYXQgdGhlIG1vbWVudCwgc28gSSB3aWxsIGZvcmNlIHB1c2ggYW5kCmRyb3AgYWxs
IHRoZSBwcm9ibGVtYXRpYyBwYXRjaGVzLiBNb3JlIHRlc3RpbmcgaXMgbmVlZGVkLgoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
