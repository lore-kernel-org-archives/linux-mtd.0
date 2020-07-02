Return-Path: <SRS0=vsLb=AN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B49C433E0
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2020 19:04:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F62820702
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2020 19:04:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EQbkCdlX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F62820702
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4v4scqyvAFVy/U2RJRc6i7qLUo3SALDh+gPVs1vHyec=; b=EQbkCdlXtxhSkgfQUC95xmldQ
	LaQCBc9unBInnndqUEtmiKhaFd8NGG8v6HuACjlrXhgV5YA9wQRYJJdnMSz3Srpz6eIY7neHyk2SP
	mHYsiP2bsx0MzxYOLK+CZ70VLp41d6LxVZBN+b0Tvs+d04MFYjgMO0TVnjHUPa8qNvL5lH0n/JOUw
	j+etdmanaqzHQXByGxex+rb9IgNLoYeytY2EdmkhxxKDuHxAxnWYnSOJU8DIBwCiofXwPXyJ9bu9+
	bh5UiRJduXvLyD+v+F5iMWi9/IQLGTCTl4uqZZj/pN3th+A73kLZMP2SzgciyZEYRiEAWfu6WIMMr
	jADcv9mTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jr4V5-0006Rd-5k; Thu, 02 Jul 2020 19:03:59 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jr4V2-0006Qp-UZ
 for linux-mtd@lists.infradead.org; Thu, 02 Jul 2020 19:03:57 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1E3C362468ED;
 Thu,  2 Jul 2020 21:03:55 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id COujqZh9TDR1; Thu,  2 Jul 2020 21:03:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B2F1C623A7C1;
 Thu,  2 Jul 2020 21:03:54 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id s55Vwe2lB18P; Thu,  2 Jul 2020 21:03:54 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 7F9CF607400F;
 Thu,  2 Jul 2020 21:03:54 +0200 (CEST)
Date: Thu, 2 Jul 2020 21:03:54 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: tglx <tglx@linutronix.de>
Message-ID: <1162063436.84431.1593716634407.JavaMail.zimbra@nod.at>
In-Reply-To: <87wo3lsqg6.fsf@nanos.tec.linutronix.de>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <20200626112907.13201-1-torben.hohn@linutronix.de>
 <1644538308.62483.1593181011127.JavaMail.zimbra@nod.at>
 <20200629090734.GB17241@linutronix.de>
 <1031805083.71374.1593427612787.JavaMail.zimbra@nod.at>
 <875zb6t1yf.fsf@nanos.tec.linutronix.de>
 <1142766008.83787.1593702042460.JavaMail.zimbra@nod.at>
 <87wo3lsqg6.fsf@nanos.tec.linutronix.de>
Subject: Re: [PATCH v2 0/4] ubifs: support authentication without hmac
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: support authentication without hmac
Thread-Index: DlF6Rz1yx3SWzspNkOncU++o1HMtug==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_150357_093878_009431CC 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: bigeasy <bigeasy@linutronix.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, david <david@sigma-star.at>,
 Torben Hohn <torben.hohn@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+Pj4+IEFueXdheSwgbGlrZSBzYWlkIGlu
IHRoZSBvdGhlciBtYWlsLCBJIHRoaW5rIGlmIHdlIGNoYW5nZSB0aGUgZmVhdHVyZSB0bwo+Pj4+
ICJrZWVwIG9mZmxpbmUgc2lnbiBrZXkgYW5kIGltcGx5IHJvIG1vdW50IiB0aGluZ3Mgd2lsbCBi
ZSBtb3JlIHNtb290aCB3aXRoIGxlc3MKPj4+PiBjb3JuZXIKPj4+PiBjYXNlcy4KPj4+IAo+Pj4g
SSBkb24ndCB0aGluayBzby4gVGhlIGRlc2lyZWQgbW9kZSBpcyB0byBwcmV2ZW50IFJXIG1vdW50
cyBmb3IgYSBmYWN0b3J5Cj4+PiBzaWduZWQgaW1hZ2Ugd2hpY2ggaW1wbGllcyB0aGUgcHJldmVu
dGlvbiBvZiByZXdyaXRpbmcgdGhlIHN1cGVyYmxvY2suCj4+Cj4+IFRoaXMgaXMgZXhhY3RseSB3
aGF0IEknbSBhc2tpbmcgZm9yLgo+PiBLZWVwIHRoZSBmYWN0b3J5IHNpZ25lZCBzdXBlciBibG9j
ayBhbmQgaW1wbHkgcmVhZC1vbmx5IG1vZGUuCj4gCj4gQW5kIHRoYXQncyB3aGF0IFRvcmJlbiBp
bXBsZW1lbnRlZCB1bmxlc3MgSSdtIG1pc3Npbmcgc29tZXRoaW5nLgoKVG9yYmVuIGltcGxlbWVu
dGVkIGl0IHRoZSBvdGhlciB3YXkgYXJvdW5kLCBoZSBhbGxvd3MgbW91bnRpbmcgd2l0aG91dAp0
aGUgSE1BQyBpZiBVQklGUyBtb3VudCBpcyByZWFkLW9ubHkuClRoaXMgY292ZXJzIGFsc28gdGhl
IHByb3Bvc2VkIHVzZS1jYXNlIGJ1dCBhcyBJIHN0YXRlZCBpdCBoYXMgaXNzdWVzIHdpdGgKcmVt
b3VudGluZyBhbmQgbWFrZXMgdGhlIGltcGxlbWVudGF0aW9uIG1vcmUgY29tcGxpY2F0ZWQgdGhh
biBpdCBzaG91bGQgYmUuCgpUaGF0J3Mgd2h5IEkgcHJvcG9zZWQgYWRkaW5nIGEgbmV3IG1vdW50
IG9wdGlvbiBsaWtlICJrZWVwX29mZmxpbmVfc2lnbmF0dXJlIiBvcgp3aGF0IG5hbWUgZml0cyBi
ZXR0ZXIuIFRoYXQgZ2l2ZXMgdXMgdGhlIGZvbGxvd2luZyBwcm9zOgoKMS4gTWFrZXMgdGhlIGlt
cGxlbWVudGF0aW9uIHN1cGVyIHNpbXBsZS4KICAgSWYga2VlcF9vZmZsaW5lX3NpZ25hdHVyZSBp
cyBzZXQgYW5kIHJ3IG1vdW50IHJlcXVlc3RlZCwgcmVqZWN0LgogICBSVyByZW1vdW50IGNhbiBy
ZWplY3RlZCB2ZXJ5IGVhc2lseSwgc3RvcmUga2VlcF9vZmZsaW5lX3NpZ25hdHVyZSBpbiB0aGUg
dWJpZnMgY29udGV4dC4KCjIuIElmIHRoZSBzdXBlciBibG9jayBnb3QgYWxyZWFkeSByZS13cml0
dGVuLCByZWplY3QuCiAgIFlvdSBjYW4gY2hlY2sgc3ViLT5obWFjW10gZm9yIGJlaW5nIG5vbi16
ZXJvLgogICBUaGF0IHdheSB3ZSBjYW4gZ2l2ZSB0aGUgdXNlciBhIGRlY2VudCBlcnJvciBtZXNz
YWdlIGluIGNhc2UgdGhleSBkbyBzdHVwaWQgdGhpbmdzLgoKMy4gVXNlcnNwYWNlIGNhbiB2ZXJp
Znkgd2hldGhlciB0aGUgVUJJRlMgZnMgaXMgcHJpc3RpbmUgYnkgY2hlY2tpbmcKICAgZm9yIHRo
ZSBrZWVwX29mZmxpbmVfc2lnbmF0dXJlIG1vdW50IGZsYWcgaW4gL3Byb2Mvc2VsZi9tb3VudGlu
Zm8uCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
