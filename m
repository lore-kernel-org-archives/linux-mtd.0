Return-Path: <SRS0=6QP0=LQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B2BC48BDF
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 07:25:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2A2560FD8
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 07:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2A2560FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+qudGqtATQGFgRNcbS8JT6uF3NqSVcwlz5nHLCAp6sU=; b=3S/ebCx1h3yWXJpYEw2sa+saQQ
	AUYQeuoS24EmjCkiUa92AhzXgMqej31L362ugX7O7s7QnjJ3hyz9bArVyZyaBGW6NELrL0raalkPk
	Pg6ZaB8Fp986mJ6wV05oSg9SI3zIP+GIFtNIh8O4zUiJHgwYOT5TdnFPZ3VTZLFFKosmcFtCAnltZ
	ACXGREgAonjzU7h1j7tBtbgMg52oRCLYD/iYsSHDbPM5V5lEb4EPNvrWeb+PFQqixbbV/cHOdbmBt
	4yj+X6UwPSqMEXOZeB2yf3odl0SL4GP5TF5KSBHD80CWlKOAn18zf3b/iMdM4zCqUHkr9ZCQPwWXA
	ifXKXwng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvalj-005zt4-KZ; Tue, 22 Jun 2021 07:24:23 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvalg-005zr3-CF
 for linux-mtd@lists.infradead.org; Tue, 22 Jun 2021 07:24:22 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B1CAA606BA3F;
 Tue, 22 Jun 2021 09:24:15 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id URpEKndo4VDj; Tue, 22 Jun 2021 09:24:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 5D6A261BC7C5;
 Tue, 22 Jun 2021 09:24:15 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Tx88bZgyxVTX; Tue, 22 Jun 2021 09:24:15 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 320C961BC7B2;
 Tue, 22 Jun 2021 09:24:15 +0200 (CEST)
Date: Tue, 22 Jun 2021 09:24:15 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Colin Ian King <colin.king@canonical.com>, 
 Dan Carpenter <dan.carpenter@oracle.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 kernel-janitors <kernel-janitors@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1471996381.142265.1624346654994.JavaMail.zimbra@nod.at>
In-Reply-To: <f2ea606a-4a05-8d14-4380-d96ca0f981a1@huawei.com>
References: <20210621152249.20901-1-colin.king@canonical.com>
 <f2ea606a-4a05-8d14-4380-d96ca0f981a1@huawei.com>
Subject: Re: [PATCH] ubifs: Remove a redundant null check on pointer lp
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Remove a redundant null check on pointer lp
Thread-Index: ZwnP86hcvaby+ZSpOm73bGFflCebzw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_002420_612774_C7901E89 
X-CRM114-Status: GOOD (  10.82  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IEkganVzdCBmb3VuZCBvdXQgYWJvdXQg
aXQgdG9kYXkgdGhhbmtzIHRvIHlvdXIgcGF0Y2guIENvbW1pdAo+IGM3NzBjZDUxOTBiYSAoInVi
aWZzOiBmaXggYW4gSVNfRVJSKCkgdnMgTlVMTCBjaGVjayIpIGRpZCBpbXBvcnQgYSBuZXcKPiBw
cm9ibGVtIHRoYXQgdWJpZnNfZ2Nfc3RhcnRfY29tbWl0KCkgbWF5IHJldHVybiAtRU5PTUVNIHdo
aWxlIHN5bmNpbmcgZnMuCj4gSSBndWVzcyB1Ymlmc19mYXN0X2ZpbmRfZnJkaV9pZHgoKSByZXR1
cm4gTlVMTCBwb2ludGVyIGlzIHRoZQo+IHRlcm1pbmF0aW9uIGNvbmRpdGlvbiBpbiB3aGlsZS1s
b29wLCB3aGljaCBtZWFucyB3ZSBjYW5ub3QgZ2V0IGEKPiBmcmVlYWJsZSBpbmRleCBMRUIgaW4g
dWJpZnNfZ2Nfc3RhcnRfY29tbWl0KCkuCgpHb29kIGNhdGNoISA6LSkKCj4+IC0JCWlmICghbHAp
Cj4+IC0JCQlicmVhazsKPj4gICAJCWlkeF9nYyA9IGttYWxsb2Moc2l6ZW9mKHN0cnVjdCB1Ymlm
c19nY2VkX2lkeF9sZWIpLCBHRlBfTk9GUyk7Cj4+ICAgCQlpZiAoIWlkeF9nYykgewo+PiAgIAkJ
CWVyciA9IC1FTk9NRU07Cj4+IAo+IEJUVywgdGhlIGZvbGxvd2luZyBtb2RpZmljYXRpb25zIG1h
eSBiZSB3aGF0IHlvdSB3YW50Pwo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9nYy5jIGIvZnMvdWJp
ZnMvZ2MuYwo+IGluZGV4IDdjYzIyZDczMTdlYS4uYjFmMjc2NTk5YjA0IDEwMDY0NAo+IC0tLSBh
L2ZzL3ViaWZzL2djLmMKPiArKysgYi9mcy91Ymlmcy9nYy5jCj4gQEAgLTg5NSwxMCArODk1LDYg
QEAgaW50IHViaWZzX2djX3N0YXJ0X2NvbW1pdChzdHJ1Y3QgdWJpZnNfaW5mbyAqYykKPiAgICAg
ICAgIC8qIFJlY29yZCBpbmRleCBmcmVlYWJsZSBMRUJzIGZvciB1bm1hcHBpbmcgYWZ0ZXIgY29t
bWl0ICovCj4gICAgICAgICB3aGlsZSAoMSkgewo+ICAgICAgICAgICAgICAgICBscCA9IHViaWZz
X2Zhc3RfZmluZF9mcmRpX2lkeChjKTsKPiAtICAgICAgICAgICAgICAgaWYgKCFscCkgewo+IC0g
ICAgICAgICAgICAgICAgICAgICAgIGVyciA9IC1FTk9NRU07Cj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgZ290byBvdXQ7Cj4gLSAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAgICAgaWYg
KCFscCkKPiAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgICAgICAgICAg
aWR4X2djID0ga21hbGxvYyhzaXplb2Yoc3RydWN0IHViaWZzX2djZWRfaWR4X2xlYiksCj4gR0ZQ
X05PRlMpOwoKSSdsbCBkcm9wIERhbidzIHBhdGNoIGZyb20gLW5leHQuIERvIHlvdSB3YW50IHRv
IHNlbmQgYSBmb2xsb3d1cCBwYXRjaCB3aGljaCByZW1vdmVzIHRoZQppbiB2YWluIGNoZWNrPwoK
VGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
