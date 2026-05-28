Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A3FCD5BD5
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2026 08:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LH7M6dZJhLYf9OLeAdBGDdfD6uuKwTRpIa3ZudQaQ78=; b=mDmFop8Rfn2WKX
	S6Hwu50sMEP9A9xjJh2xp2i2i9eyXMBgFbxhpX376Km7RHeOIVV7+LVDJuPcMhIsm+Ev+tfHWPsWC
	uCJv/OY3kR0ysx78A4fSf7t0v2xYBS/4afpll7MYfkFRhwonpWHolWYM2A8t58Pf8BWaacmi/lfNQ
	SyIJkkGUVmdLt6G+URM4QUpD5o/JH5XbnC9+smawgJfebtZCuZmbGRjBOTM6df8Z1qW8RL4MRrN/d
	zfNNOjpoChTSlJGhj0ann/vezK6EoaA4gt2fbtKBSYCfEn+UzKkBArJw2GOdBLNhncMY9re90bzkD
	JJmNdWbu/GsJ4fDvtQDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWLI-00000005Q9K-0IWR;
	Thu, 28 May 2026 08:43:52 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWLC-00000005Q8N-0OI4
	for linux-mtd@lists.infradead.org;
	Thu, 28 May 2026 08:43:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A4345C62447;
	Thu, 28 May 2026 08:43:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7649760495;
	Thu, 28 May 2026 08:43:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8AE091088877F;
	Thu, 28 May 2026 10:43:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779957822; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=h2kVHQEqX8g0aaw1EzvwKkX3jQo/8qRPm2UDvNjcGhQ=;
	b=Q1vg9MXiwaqWlUytakMIDHNo0oEZfTUlBWYXTEB5TftXYDK9PWsLRHNycUUastAkwdKagw
	OVp7GTGOkprytXhS9bp5nhq4IHs7nGO2qVm6UopaIfS5OOA7S47e1CNyEtkeksU/s7ew3b
	PbYmNdcg9PaZxHHQmWhSHAJigkwE0/hmvAcFcj9WpiXhb13/aGX59dMTvMYewOaq0bM+x3
	4iSESBCJSpVWRXd4r0epMahnry335EwmEH6kv4veg6/Thb3GJneED+ppd5QG1jMB87MK1G
	k6NQWTqIvKIwMjzefeiAOBrPuKWKXt++0GLW9qdRmoQ9YlkTapmEKCd6XFmwpA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [PATCH v3 04/13] spi: spi-mem: add spi_mem_apply_base_freq_cap()
In-Reply-To: <20260527175527.2247679-5-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Wed, 27 May 2026 23:25:18 +0530")
References: <20260527175527.2247679-1-s-k6@ti.com>
	<20260527175527.2247679-5-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 28 May 2026 10:43:39 +0200
Message-ID: <87fr3bhqkk.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_014346_286817_0BA61F19 
X-CRM114-Status: UNSURE (   7.25  )
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

SGkgU2FudGhvc2gsCgo+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1tZW0uYwo+ICsrKyBiL2RyaXZl
cnMvc3BpL3NwaS1tZW0uYwo+IEBAIC0zOTgsNyArMzk4LDExIEBAIGludCBzcGlfbWVtX2V4ZWNf
b3Aoc3RydWN0IHNwaV9tZW0gKm1lbSwgY29uc3Qgc3RydWN0IHNwaV9tZW1fb3AgKm9wKQo+ICAJ
dTggKnRtcGJ1ZjsKPiAgCWludCByZXQ7Cj4gIAo+IC0JLyogTWFrZSBzdXJlIHRoZSBvcGVyYXRp
b24gZnJlcXVlbmN5IGlzIGNvcnJlY3QgYmVmb3JlIGdvaW5nIGZ1dGhlciAqLwo+ICsJLyoKPiAr
CSAqIE9wcyBub3QgY29uZmlndXJlZCBmb3IgbWF4aW11bSBzcGVlZCBhcmUgbGltaXRlZCB0byB0
aGUgY29uc2VydmF0aXZlCj4gKwkgKiBiYXNlIHNwZWVkOyBzcGlfbWVtX2FkanVzdF9vcF9mcmVx
KCkgdGhlbiBjYXBzIHRvIHRoZSBkZXZpY2UgbWF4aW11bS4KPiArCSAqLwo+ICsJc3BpX21lbV9h
cHBseV9iYXNlX2ZyZXFfY2FwKG1lbSwgKHN0cnVjdCBzcGlfbWVtX29wICopb3ApOwo+ICAJc3Bp
X21lbV9hZGp1c3Rfb3BfZnJlcShtZW0sIChzdHJ1Y3Qgc3BpX21lbV9vcCAqKW9wKTsKClRoZXJl
IGFyZSBtYW55IG1vcmUgc3BpX21lbV9hZGp1c3Rfb3BfZnJlcSgpIGNhbGxzIGluIHRoZSBjb3Jl
IHdoZXJlIHdlIHdvdWxkCm5vdCBhcHBseSB0aGUgYmFzZSBmcmVxdWVuY3kuIEFyZW4ndCB3ZSBt
aXNzaW5nIHRoZXNlIHBsYWNlcz8gV291bGRuJ3QgaXQKYmUgbW9yZSBhcHByb3ByaWF0ZSB0byBj
YWxsIHNwaV9tZW1fYXBwbHlfYmFzZV9mcmVxX2NhcCgpIGF0IHRoZSBiZWdpbm5pbmcKb2Ygc3Bp
X21lbV9hZGp1c3Rfb3BfZnJlcSgpID8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
