Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC99F606A326
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2026 04:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4EnAi7zO;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=LEuibVSA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hrE+GaWfCJ23eTOWO5535+xStAgRpZDgAQFRylLSfJI=; b=4EnAi7zOW6YnbRDyVOyv7dVWuS
	q00MVc2LAoyzUjSSQ40XUlPUuCtwC3op+syAqfAoDH8DzTrKqZQYscS7KFe4yOc2k0zSl2XpboJ1E
	UgKIaLxF3ZAtdDrasBK6ctHyURg+Jt2rT5HjqwjjERnCYt5zg7R4nWdayqxm+/Ttm5/+kIrk2t9lr
	S5J4um9dem6Lp9bLWeVIHVInrqyDccMoKrfV5graduSdDQgSvOt5EicbhKGpGPVZy2K3MPfGRzavb
	jMFPp+sOgAx4fIWbogKY0GxweQjZ51AoonnPd3ZBqTRwD4gKxlxyfIBEIsd06zhVDrUCgE/jIUu/F
	1LonEHjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6UJ-000000016Se-2cVI;
	Tue, 03 Nov 2026 04:51:11 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6UE-000000016S6-3nIo
	for linux-mtd@lists.infradead.org;
	Tue, 03 Nov 2026 04:51:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xaVG5gHIVqbQ9ul/dJPjVIZQfI9Fixu/KkPob37v9NY=;
	b=LEuibVSAF+UvrgJznpG2pGaxo2AR0TiCltYbq0cXoZCkUUZGx/cF1Bx5sA5JRJVWPaGncLnCc
	wNadBv1noSdJ1Vf6zQGoJ3hjyjij7DygQFIbbTyjFcAMctAjSKsdUH2zhca49Tnn3ozgmTxbVqu
	s9Zawf+tIh9w3T9CAs23+r8=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jJbjv42Zzz1T4HJ;
	Tue,  3 Nov 2026 12:50:43 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 893BF40561;
	Tue,  3 Nov 2026 12:51:01 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 3 Nov 2026 12:51:00 +0800
Subject: Re: [PATCH 0/5] ubifs: harden validation of on-disk inode and node
 metadata
To: <shao.mingyin@zte.com.cn>
CC: <richard@nod.at>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20261103123059667zqKLXZXpg5bc5F5FV7Xy8@zte.com.cn>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f9a31ba0-2a71-440a-6fe1-42641bdde01d@huawei.com>
Date: Tue, 3 Nov 2026 12:50:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261103123059667zqKLXZXpg5bc5F5FV7Xy8@zte.com.cn>
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_205107_405013_957D93A7 
X-CRM114-Status: GOOD (  19.30  )
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYvMTEvMyAxMjozMCwgc2hhby5taW5neWluQHp0ZS5jb20uY24g5YaZ6YGTOgo+PiAg
IEZyb20gbXkgcGVyc3BlY3RpdmUsIEknbSBub3QgcmVhbGx5IGludGVyZXN0ZWQgaW4gdGhlIHBy
b2JsZW0gc2NlbmFyaW9zCj4+IHRyaWdnZXJlZCBieSBtYWxpY2lvdXMgZnMgaW1hZ2UsIGxldCBS
aWNoYXJkIGRlY2lkZSB3aGV0aGVyIHRvIG1lcmdlIGl0Lgo+PiBUaGlzIHNlcmllcyBkb2VzIG5v
dCBzZWVtIHRvIGludHJvZHVjZSBhbnkgaXNzdWVzLCB0aGVyZSBhcmUgdHdvIHNtYWxsCj4+IG5p
dHMgaW4gcGF0Y2ggMiYzLgo+IAo+IFRoYW5rcyBmb3IgdGhlIHJldmlldy4gIFRoZSB0aHJlYXQg
bW9kZWwgaW4gdGhlIGNvdmVyIGlzIHRoZSBvbmx5IG9uZSB0aGUKPiBzZXJpZXMgY2xhaW1zOiBt
b3VudGluZyBzdWNoIGFuIGltYWdlIG5lZWRzIENBUF9TWVNfQURNSU4gaW4gdGhlIG1vdW50aW5n
Cj4gbmFtZXNwYWNlIG9yIGFjY2VzcyB0byB0aGUgZmxhc2guCj4gCj4gVHdvIG9mIHRoZSBmaXZl
IGFyZSBub3Qgc3RyaWN0bHkgIm1hbGljaW91cyBpbWFnZSBvbmx5IiwgaW4gY2FzZSB0aGF0IGlz
Cj4gdXNlZnVsIGZvciBSaWNoYXJkJ3MgY2FsbDoKPiAKPiAtIDQvNSBpcyByZXBsYXk6IGEgbm9k
ZSB0aGF0IHdhcyBjb3JydXB0ZWQgb24gZmxhc2ggb3Igd3JpdHRlbiB3cm9uZyB3b3VsZAo+ICAg
IG90aGVyd2lzZSBsZXQgdWJpZnNfcmVjb3Zlcl9zaXplKCkgZXh0ZW5kIGFuIGlub2RlIHRvIGEg
Ym9ndXMgc2l6ZS4KPiAtIDUvNSBsZWF2ZXMgdGhlIGltYWdlIHVubW91bnRhYmxlIGFmdGVyIGEg
c2luZ2xlIHJlbW92ZXhhdHRyKCk6IHRoZQo+ICAgIHVuZGVyZmxvd2VkIGNvdW50ZXJzIGFyZSB3
cml0dGVuIGJhY2sgdG8gZmxhc2gsIHNvIGl0IHN1cnZpdmVzIHJlbW91bnQuCj4gCj4gVGhlIG90
aGVyIHRocmVlIGFyZSBtb3VudC10aW1lIHZhbGlkYXRpb24gb2YgZmllbGRzIHRoYXQgdmFsaWRh
dGVfaW5vZGUoKQo+IGFuZCB2YWxpZGF0ZV9tYXN0ZXIoKSBhbHJlYWR5IHJhbmdlLWNoZWNrIGZv
ciBvdGhlciB2YWx1ZXMsIHNvIHRoZXkgY2hhbmdlCj4gbm90aGluZyBmb3IgYSB2YWxpZCBpbWFn
ZS4gIFRoZSBwYXRjaGVzIGFyZSBpbmRlcGVuZGVudCBhbmQgYW55IHN1YnNldAo+IGFwcGxpZXMs
IHNvIGRyb3BwaW5nIHNvbWUgaXMgZmluZSAtLSBJIHdpbGwgbGVhdmUgdGhlIGRlY2lzaW9uIHRv
IFJpY2hhcmQuCj4gCj4gQm90aCBuaXRzIGFyZSB0YWtlbjogcGF0Y2ggMiBmb2xkcyB0aGUgc2l6
ZSBjaGVjayBpbnRvIHRoZSBleGlzdGluZwo+IHVpLT54YXR0ciBibG9jaywgcGF0Y2ggMyBtZXJn
ZXMgdGhlIGxvd2VyIGJvdW5kIGludG8gdGhlIGhpZ2hlc3RfaW51bQo+IGNoZWNrICh0aGF0IG9u
ZSB0aGVuIHJlcG9ydHMgZXJyb3IgMyBmb3IgYm90aCBib3VuZHMpLgo+IAo+IEZvciB0aGUgc2Vy
aWVzOiBJIHdpbGwgcmVwb3N0IG9ubHkgdGhvc2UgdHdvIGFzIFtQQVRDSCB2Ml0gaW4gYSBuZXcK
PiB0aHJlYWQsIGVhY2ggbm90aW5nIHRoYXQgaXQgc3VwZXJzZWRlcyAyLzUgb3IgMy81IG9mIHRo
ZSB2MSBzZXJpZXMuICAxLzUsCj4gNC81IGFuZCA1LzUgYXJlIHVudG91Y2hlZCwgc28gSSB3b3Vs
ZCByYXRoZXIgbm90IHJlc2VuZCB0aGVtIC0tIHNheSB0aGUKPiB3b3JkIGlmIHlvdSB3b3VsZCBw
cmVmZXIgdGhlIHdob2xlIHNlcmllcyBhcyB2Mi4KUmVzZW5kIHYyIHNlcmllcyBwbGVhc2UuCj4g
Cj4gVGhhbmtzLAo+IFNoYW8KPiAuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
