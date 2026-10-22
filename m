Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A79606A323
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2026 11:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TFbwj495;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=fbqcgThb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZxEb66FSfQ31HXTAZNqojiRMnbKO7KcuKY9o1OLmQ2s=; b=TFbwj495h11NFoc4/pFZAFehhk
	2tKeePcCfssF6DVEAVws09YTSasq3n21ArDy9k5ubrR1WmZUae8v5mh2b76jmEezokZcgx29PF4b5
	17sPmCz2CPaM4my6hyRvVkvHKF1ZTasZBZ6EnWZO+beO4ns9H2cmee0pE1AuTRLReEzbqYNkuKD/Q
	EwDnVNfmPOJpYLJa9f4pV/RUYDbyOVhfXcqAOOj5CM9T9Zt4wr0eleLGsd4/gh6tnMJ0f9Mck2ewb
	J+R92abxvGVHIA5UI476a/RqbI+sepk+7yHBvCPRE6SwdByjEZzHXPqdwiwogcp1s+rqt31qICOUd
	Bf7LRxvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJrAh-0000000E1QR-2MiU;
	Thu, 22 Oct 2026 11:41:23 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJrAe-0000000E1Q4-0X8l
	for linux-mtd@lists.infradead.org;
	Thu, 22 Oct 2026 11:41:22 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=szxB/dyITK/phILUcJrvxYH1e/hG1kmM9/9Dx4NlOBU=;
	b=fbqcgThbNMiQeqPg2BsoIbYCOlw7TpmbIBxRnBS8GOKONEztbFHjXgAsm3k1aZcmE4IhhkwJa
	Lz5Abjohxh3FxSdXdCcDFpgYO1O1oZwaow6DEZNiPT2YtWSkGYR/7hfLDjb2MCLJMVBCUA3YJA5
	F1HjhnmBCNXPOV/aN7hLcYM=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4j9PNt6SvdzKm5C;
	Thu, 22 Oct 2026 19:41:02 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 3B09940578;
	Thu, 22 Oct 2026 19:41:08 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 22 Oct 2026 19:41:07 +0800
Subject: Re: [PATCH 1/1] ubifs: fix typo in comment
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261022112640.11822-1-alexander.stein@ew.tq-group.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f406a1a9-2bae-e39b-7d7d-62ca43f68937@huawei.com>
Date: Thu, 22 Oct 2026 19:41:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261022112640.11822-1-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_044120_644708_C2BF3B21 
X-CRM114-Status: GOOD (  14.21  )
X-Spam-Score: -3.8 (---)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

1NogMjAyNi8xMC8yMiAxOToyNiwgQWxleGFuZGVyIFN0ZWluINC0tcA6Cj4gU21hbGwgdHlwbyB3
aGljaCBzdGF5ZWQgaGlkZGVuIHNvIGZhci4gRml4IGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRlciBTdGVpbiA8YWxleGFuZGVyLnN0ZWluQGV3LnRxLWdyb3VwLmNvbT4KPiAtLS0KPiAg
IGZzL3ViaWZzL3NjYW4uYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+IApSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhh
bzFAaHVhd2VpLmNvbT4KPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvc2Nhbi5jIGIvZnMvdWJpZnMv
c2Nhbi5jCj4gaW5kZXggY2JmZjJkODAwZTI3YS4uNTA3NDBlOWRhYmY3MyAxMDA2NDQKPiAtLS0g
YS9mcy91Ymlmcy9zY2FuLmMKPiArKysgYi9mcy91Ymlmcy9zY2FuLmMKPiBAQCAtMjQ1LDcgKzI0
NSw3IEBAIHZvaWQgdWJpZnNfc2Nhbm5lZF9jb3JydXB0aW9uKGNvbnN0IHN0cnVjdCB1Ymlmc19p
bmZvICpjLCBpbnQgbG51bSwgaW50IG9mZnMsCj4gICAgKgo+ICAgICogVGhpcyBmdW5jdGlvbiBz
Y2FucyBMRUIgbnVtYmVyIEBsbnVtIGFuZCByZXR1cm5zIGNvbXBsZXRlIGluZm9ybWF0aW9uIGFi
b3V0Cj4gICAgKiBpdHMgY29udGVudHMuIFJldHVybnMgdGhlIHNjYW5uZWQgaW5mb3JtYXRpb24g
aW4gY2FzZSBvZiBzdWNjZXNzIGFuZCwKPiAtICogJS1FVUNMRUFOIGlmIHRoZSBMRUIgbmVhZHMg
cmVjb3ZlcnksIGFuZCBvdGhlciBuZWdhdGl2ZSBlcnJvciBjb2RlcyBpbiBjYXNlCj4gKyAqICUt
RVVDTEVBTiBpZiB0aGUgTEVCIG5lZWRzIHJlY292ZXJ5LCBhbmQgb3RoZXIgbmVnYXRpdmUgZXJy
b3IgY29kZXMgaW4gY2FzZQo+ICAgICogb2YgZmFpbHVyZS4KPiAgICAqCj4gICAgKiBJZiBAcXVp
ZXQgaXMgbm9uLXplcm8sIHRoaXMgZnVuY3Rpb24gZG9lcyBub3QgcHJpbnQgbGFyZ2UgYW5kIHNj
YXJ5Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
