Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7229E77188
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Dec 2024 10:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SwdeG4M5LtKdMmVndqNFc8QLyquyxQ9P79POebXhFyQ=; b=26ujeIJIE4rVOg
	OaTRYQwZ3Ff7gaEa+5CdfUPsB7D05m6abDfq0ChJdsrMTkQqQF0p3ReZXOG3a/d2MR1CfaQGV+sqV
	zUysq8dqERar29ize2cxbl2M7Kcll5w4/v4dc9YVWfLDrznasUnlhckUjTh6d78vJ1HwqMcztK4Wc
	hQ6MZRQzEAcFCz27SjsC+OX1zBIpRJd20gfNNJwdR70z3QlNMZXprr1Bhz2eAkYQU4FGMMG6OUXUs
	pMbn03mRakBdNFZ0mdfCIcDsRj2KLXwM2fMM8Q1I4pUNyM63ELwI5yFjqn5zoYheB/ipuqgUwz6Uq
	DizL66FiWIxik3ab0uug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSDCo-000000053fi-1x1g;
	Mon, 30 Dec 2024 10:41:02 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBsw-00000004uT8-22WT
	for linux-mtd@lists.infradead.org;
	Mon, 30 Dec 2024 09:16:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 31BF5E000A;
	Mon, 30 Dec 2024 09:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735550183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=30qJniL6f2CSMnlAsj4d7FMH8lqsrWJ+fg4klQCq7mY=;
	b=fvDS+YTKlc6ZG0pfDggZ2mz+oxoyLWl/aSXxvTaifEk6/kYJ/C/ez0HzOKzHrchgsYe7oY
	JXmjBXK/vGgByfUUsifd8HBYFYzgPIMPOVmg2cU+hmoW3IjR8pvcrfquixd2mSEV5NMEmY
	be1JCKx9pIH797Bp2OJS3yOtfOOrEZhX7SuehMxt+w4eJNab9OnQ1k72qTHrqFtb2bNJ7g
	Iwhwz+JA8wX82MXLXpfFi3mHzre3KaK7nmxekYcxm6iayF9u0GE7oT+PuJJjAdUGDn+csB
	Bl5ep75dqvI+OP5p7ppfZGdj8NaLbwW3mgSpbKM8vR63wxuivHMxYx64hWov0g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Kurbanov <mmkurbanov@salutedevices.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Ezra Buehler <ezra.buehler@husqvarnagroup.com>,
  Alexey Romanov <avromanov@salutedevices.com>,  Frieder Schrempf
 <frieder.schrempf@kontron.de>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <kernel@salutedevices.com>
Subject: Re: [PATCH v3 4/7] mtd: spinand: add start_page to otp layout
In-Reply-To: <20241226135623.43098-5-mmkurbanov@salutedevices.com> (Martin
	Kurbanov's message of "Thu, 26 Dec 2024 16:55:49 +0300")
References: <20241226135623.43098-1-mmkurbanov@salutedevices.com>
	<20241226135623.43098-5-mmkurbanov@salutedevices.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 30 Dec 2024 10:16:22 +0100
Message-ID: <87o70t7cpl.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_011626_670632_115D9B98 
X-CRM114-Status: UNSURE (   9.15  )
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

T24gMjYvMTIvMjAyNCBhdCAxNjo1NTo0OSArMDMsIE1hcnRpbiBLdXJiYW5vdiA8bW1rdXJiYW5v
dkBzYWx1dGVkZXZpY2VzLmNvbT4gd3JvdGU6Cgo+IFRoZSBPVFAgYXJlYSBpcyBkaXZpZGVkIGlu
dG8gdHdvIHBhcnRzOiB0aGUgZmFjdG9yeSBhbmQgdGhlIHVzZXIuCj4gSW4gU1BJLU5BTkQsIGl0
IGlzIHVzdWFsbHkgdGhpcyBvbmUgT1RQIHJlZ2lvbjogdGhlIGZpcnN0IGZldyBwYWdlcwo+IGFy
ZQoKKHRoaXMgc2VudGVuY2UgbWlnaHQgYmUgcmV3b3JkZWQsIGl0IGlzIG5vdCB2ZXJ5IGNsZWFy
KQoKPiBhbGxvY2F0ZWQgdG8gdGhlIGZhY3RvcnkgYXJlYS4gVGhlcmVmb3JlLCBlbnRlciB0aGUg
c3RhcnRfcGFnZSBmaWVsZCwKPiB3aGljaCBpbmRpY2F0ZXMgZnJvbSB3aGljaCBwYWdlIHRoZSBj
dXN0b20gT1RQIHJlZ2lvbiBzdGFydHMuCgpUQkggSSBkb24ndCBsaWtlIHRoaXMgc2hvcnRjdXQg
YW5kIEkgd291bGQgcHJlZmVyIGhhdmluZzoKLSB0d28gb3RwIHN0cnVjdHVyZXMgZGVmaW5pbmcg
ZWFjaCBwYXJ0cyAodXNlci9mYWN0b3J5KQotIGJvdGggdGhlIHVzZXIgYW5kIGZhY3Rvcnkgb3Rw
IGhvb2tzIHByb3ZpZGVkCi0gcGVyaGFwcyBhIHRvcCBsZXZlbCBtYWNybyB3aGljaCBkb2VzIGJv
dGggaW5pdGlhbGl6YXRpb25zIGJhc2VkIG9uCnRoZSAodXNlcl9vdHBfKXN0YXJ0X3BhZ2UgcGFy
YW1ldGVyLgoKQnV0IEkgZG9uJ3QgbGlrZSBtdWNoIGhpZGluZyB0aGUgbGF5b3V0IHN1YnRsZXR5
IGJlaGluZCBhCiJzdGFydF9wYWdlIiBtZW1iZXIgKGFsdGhvdWdoIGl0IHNob3VsZCBwcm9iYWJs
eSBiZSBuYW1lZAoidXNlcl9hcmVhX3N0YXJ0X3BhZ2UiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQs
IG90aGVyd2lzZSBpdCdzCm1pc2xlYWRpbmcpLgoKVGhpcyB3b3VsZCBhbHNvIGJlIG1vcmUgZnV0
dXJlIHByb29mLCBtYW51ZmFjdHVyZXJzIGFyZSBjcmVhdGl2ZS4KClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
