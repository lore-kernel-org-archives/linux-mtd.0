Return-Path: <SRS0=jTzi=VC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9BCC4649B
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jul 2019 13:55:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B068B218CA
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jul 2019 13:55:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RtnkBBa5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fx/MCZ+X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B068B218CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pV5cdkBj5FWbwGW/6gj2bw+k3vvrS4YOp1UQ9SgRlZY=; b=RtnkBBa5M2HReN
	hqSTiXZJi14QHcBQ9/Rfbv4VOwGYfRj9qiUpNoz1nztdiU+UJwltIaPvbda3JUnLUCqlnZB63fMwh
	Maxg4zEkrm7HJcTHUGGZIImZOsEwTtDc2Bq0fqsB3Jv1GxZ6amSjqopP9CBhS7wDnryIJHCVnoJZ4
	Ik0b6iAvylhe13I/wo3ZqiR1d1cCzWdsWyvPfqco1H6ZFZ+hJNEUlhcSyo+i9X3bt0VYknZWepNDQ
	hFjYCGBsS23C8K06Tzzi4j6qPnymuOrevELCjKufKkqZ2R4QA93S7aIzUPGe+q7raaUXBlY+oBRRJ
	4lHxYPV6BhyNFBkid7pw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hjOgE-0005wd-7p; Fri, 05 Jul 2019 13:55:14 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjJdI-0008Q4-7x
 for linux-mtd@bombadil.infradead.org; Fri, 05 Jul 2019 08:31:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UtO5zLs1XkxId2nyZ8rJemdbqYePGi+A0mg3wvCFge4=; b=fx/MCZ+XjxF77PLeiWMFYAwTwF
 AW4zzkI2m5Hze5R6Hz6hlcQuPXMkxoqrCGj0sPYuaNsjDfG0srCvczbvOMc1+rSJcP8nJDwZI/yT6
 5yDvNz4RnQjPqEvPsiflzyb9iMEUI6CaRbmuMlgW1A6Tl8fSOZntSf6TZEF691n4qbLEcidcWz2PF
 IZCH0fXVgcWVbekj1kwEGLknSbEWOYXBcdWMUZKXZ9xec1CcvhkERhrYdZl0sqSeP89o/YhItKdqk
 emcrV7Ge+OXLd/+AkzMXsZWX2eEloXP5rlHkdZMs2fWYgQfV85Y/gYk8fsIxgyfAYMm6+J513TlVo
 clD9Blzw==;
Received: from youngberry.canonical.com ([91.189.89.112])
 by merlin.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjJcy-0000Wr-Vt
 for linux-mtd@lists.infradead.org; Fri, 05 Jul 2019 08:31:34 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hjJcu-0005bG-FJ; Fri, 05 Jul 2019 08:31:28 +0000
Subject: Re: [PATCH][next] ubifs: remove redundant assignment to pointer fname
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
References: <20190704222803.4328-1-colin.king@canonical.com>
 <b5e7709b-3494-d415-b36c-b19939a15fb5@cogentembedded.com>
From: Colin Ian King <colin.king@canonical.com>
Openpgp: preference=signencrypt
Autocrypt: addr=colin.king@canonical.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <4741f358-7c21-f721-e9fd-59d73876c62c@canonical.com>
Date: Fri, 5 Jul 2019 09:31:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <b5e7709b-3494-d415-b36c-b19939a15fb5@cogentembedded.com>
Content-Language: en-US
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMDUvMDcvMjAxOSAwOToyNCwgU2VyZ2VpIFNodHlseW92IHdyb3RlOgo+IEhlbGxvIQo+IAo+
IE9uIDA1LjA3LjIwMTkgMToyOCwgQ29saW4gS2luZyB3cm90ZToKPiAKPj4gRnJvbTogQ29saW4g
SWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPj4KPj4gVGhlIHBvaW50ZXIgZm5h
bWUgcmMgaXMgYmVpbmcgYXNzaWduZWQgd2l0aCBhIHZhbHVlIHRoYXQgaXMgbmV2ZXIKPiAKPiDC
oMKgIHJjPwoKT29wcywgY3V0J24ncGFzdGUgZXJyb3IuIERvIHlvdSB3YW50IG1lIHRvIHJlc2Vu
ZCB0byBjYW4gdGhpcyBiZSBmaXhlZAp3aGVuIGl0J3MgYXBwbGllZD8KCkNvbGluCgo+IAo+PiBy
ZWFkIGJlY2F1c2UgdGhlIGZ1bmN0aW9uIHJldHVybnMgYWZ0ZXIgdGhlIGFzc2lnbm1lbnQuIFRo
ZSBhc3NpZ25tZW50Cj4+IGlzIHJlZHVuZGFudCBhbmQgY2FuIGJlIHJlbW92ZWQuCj4+Cj4+IEFk
ZHJlc3Nlcy1Db3Zlcml0eTogKCJVbnVzZWQgdmFsdWUiKQo+PiBTaWduZWQtb2ZmLWJ5OiBDb2xp
biBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+PiAtLS0KPj4gwqAgZnMvdWJp
ZnMvZGVidWcuYyB8IDEgLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvZGVidWcuYyBiL2ZzL3ViaWZzL2RlYnVnLmMKPj4gaW5k
ZXggOTJmZTVjNWVkNzhhLi45NWRhNzFlMTNmYzggMTAwNjQ0Cj4+IC0tLSBhL2ZzL3ViaWZzL2Rl
YnVnLmMKPj4gKysrIGIvZnMvdWJpZnMvZGVidWcuYwo+PiBAQCAtMjgxNyw3ICsyODE3LDYgQEAg
dm9pZCBkYmdfZGVidWdmc19pbml0X2ZzKHN0cnVjdCB1Ymlmc19pbmZvICpjKQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGMtPnZpLnViaV9udW0sIGMtPnZpLnZvbF9pZCk7Cj4+IMKg
wqDCoMKgwqAgaWYgKG4gPT0gVUJJRlNfREZTX0RJUl9MRU4pIHsKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIC8qIFRoZSBhcnJheSBzaXplIGlzIHRvbyBzbWFsbCAqLwo+PiAtwqDCoMKgwqDCoMKgwqAg
Zm5hbWUgPSBVQklGU19ERlNfRElSX05BTUU7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47
Cj4+IMKgwqDCoMKgwqAgfQo+PiDCoCAKPiAKPiBNQlIsIFNlcmdlaQo+IAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
