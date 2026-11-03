Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFCA606EE83
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2026 02:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L8WpXDmo;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=GB4teFFp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OJRzPcE4meRD/nx4iEXA/YkB54bYxTuvfAxFDOlwP0g=; b=L8WpXDmo9z6zXB0BqIO2lRQAB5
	My4vbmhsVUXXwc2Jw2ER+1CHUu4/CeD4use7XY0wpyZyJ3F4o1qsJ981JP1/TWvYnymZTSi6M0gQR
	sFnUOLfSMJIatWKAj8YmOKdkTfDTDkiQj5Bf3XFyIHKAkIvyDNVQKtX55TPdR/gdI7WJazawZvBPX
	Y6JIeczR8SkYlDgmuA+ontU/8B228rh77DJiP9gk6ypAI4HL4A3E5crP2fr4GG5BxpZqf2t13iVPM
	s7mUoMcenakpk+QaI7RcapdA5sfxBefLfOzX/3fKIEBMrXstgrwW4035Xgv8PjYmsUJtexE9PTr6Q
	HScGMeSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3us-00000000pzq-3h96;
	Tue, 03 Nov 2026 02:06:26 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3um-00000000psR-2geU
	for linux-mtd@lists.infradead.org;
	Tue, 03 Nov 2026 02:06:25 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=RDTCUcSlzVCOYo5WGdhwHy5r1sMLRwFbwFD3/2YwmY4=;
	b=GB4teFFp6SrE4cyFSj7PgfvoF7yq1/7uTSDzZdlrNQr8imjxs/NYcJW67nUnvCBGHTM9tQ9ir
	PozA1Kojzy6ZJUTCfeIJ8nItBl09GHg9frCiSTwHlCNShq5z7UWeO5/GwSGjfAHwKQFMed0CdRM
	rD0Mib2CRyBHH4SFbAMPKFM=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jJX3z5LcbzmV7Z;
	Tue,  3 Nov 2026 10:06:07 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 9DA404048B;
	Tue,  3 Nov 2026 10:06:17 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 3 Nov 2026 10:06:16 +0800
Subject: Re: [PATCH 2/5] ubifs: reject xattr inodes whose size does not match
 the value
To: <shao.mingyin@zte.com.cn>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20261102214934411GPsnXXiPDuCvO4pgPeTgU@zte.com.cn>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <9ff68e0a-18b4-fb7f-238c-105e5b247a9d@huawei.com>
Date: Tue, 3 Nov 2026 10:06:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261102214934411GPsnXXiPDuCvO4pgPeTgU@zte.com.cn>
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_180620_832409_8E6290E4 
X-CRM114-Status: GOOD (  16.45  )
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
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYvMTEvMiAyMTo0OSwgc2hhby5taW5neWluQHp0ZS5jb20uY24g5YaZ6YGTOgo+IEFu
IGV4dGVuZGVkIGF0dHJpYnV0ZSBpbm9kZSBzdG9yZXMgdGhlIHZhbHVlIGluIHRoZSBpbm9kZSBu
b2RlIGFuZAo+IFVCSUZTIGtlZXBzIGlub2RlLT5pX3NpemUgZXF1YWwgdG8gdWJpZnNfaW5vZGUt
PmRhdGFfbGVuIChzZWUKPiBjcmVhdGVfeGF0dHIoKSBhbmQgY2hhbmdlX3hhdHRyKCkpLiAgdmFs
aWRhdGVfaW5vZGUoKSBkb2VzIG5vdCBjaGVjawo+IHRoaXMgZm9yIGlub2RlcyB0aGF0IGNhcnJ5
IFVCSUZTX1hBVFRSX0ZMLCBzbyBhbiBpbWFnZSB3aXRoIGEgbWlzbWF0Y2gKPiBpcyBhY2NlcHRl
ZC4gIHViaWZzX3hhdHRyX2dldCgpIGFuZCByZW1vdmVfeGF0dHIoKSB0aGVuIHRyaXAgdGhlaXIK
PiB1Ymlmc19hc3NlcnQoKSBvbiB0aGUgaW52YXJpYW50OyB3aXRoIHRoZSBhc3NlcnQ9cmVhZC1v
bmx5IG9yCj4gYXNzZXJ0PXBhbmljIG1vdW50IG9wdGlvbiBhIHBsYWluIGdldHhhdHRyKCkgb3Ig
cmVtb3ZleGF0dHIoKSB0dXJucyB0aGUKPiBmaWxlIHN5c3RlbSByZWFkLW9ubHkgb3IgcGFuaWNz
IHRoZSBrZXJuZWwuCj4gCj4gUmVqZWN0IHN1Y2ggaW5vZGVzIGF0IGlnZXQgdGltZS4KPiAKPiBG
aXhlczogMWU1MTc2NGEzYzJhICgiVUJJRlM6IGFkZCBuZXcgZmxhc2ggZmlsZSBzeXN0ZW0iKQo+
IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogU2hhbyBNaW5neWlu
IDxzaGFvLm1pbmd5aW5AenRlLmNvbS5jbj4KPiAtLS0KPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMv
c3VwZXIuYyBiL2ZzL3ViaWZzL3N1cGVyLmMKPiBpbmRleCAzODk3Mjc4NjgxN2UuLjlmNjA4YzEw
YjM5ZSAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9zdXBlci5jCj4gKysrIGIvZnMvdWJpZnMvc3Vw
ZXIuYwo+IEBAIC05MSw2ICs5MSwxOCBAQCBzdGF0aWMgaW50IHZhbGlkYXRlX2lub2RlKHN0cnVj
dCB1Ymlmc19pbmZvICpjLCBjb25zdCBzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+ICAgCWlmICh1aS0+
eGF0dHIgJiYgIVNfSVNSRUcoaW5vZGUtPmlfbW9kZSkpCj4gICAJCXJldHVybiA1Owo+ICAgCj4g
KwkvKgo+ICsJICogRXh0ZW5kZWQgYXR0cmlidXRlIGlub2RlcyBrZWVwIHRoZSB2YWx1ZSBpbiB0
aGUgaW5vZGUgbm9kZSBhbmQKPiArCSAqIG1haW50YWluIGlfc2l6ZSA9PSBkYXRhX2xlbiBldmVy
eXdoZXJlIChzZWUgY3JlYXRlX3hhdHRyKCkgYW5kCj4gKwkgKiBjaGFuZ2VfeGF0dHIoKSkuCj4g
KwkgKi8KPiArCWlmICh1aS0+eGF0dHIgJiYgaW5vZGUtPmlfc2l6ZSAhPSB1aS0+ZGF0YV9sZW4p
IHsKPiArCQl1Ymlmc19lcnIoYywgInhhdHRyIGlub2RlICVsbHUgaGFzIHNpemUgJWxsZCwgYnV0
ICVkIGJ5dGVzIG9mIGRhdGEiLAo+ICsJCQkgIGlub2RlLT5pX2lubywgKGxvbmcgbG9uZylpbm9k
ZS0+aV9zaXplLAo+ICsJCQkgIHVpLT5kYXRhX2xlbik7Cj4gKwkJcmV0dXJuIDY7Cj4gKwl9Cj4g
KwoKQWJvdmUgdHdvIHVpLT54YXR0ciBjaGVjayBjb3VsZCBiZSBtZXJnZWQgbGlrZToKaWYgKHVp
LT54YXR0cikgewogICBpZiAoIVNfSVNSRUcoaW5vZGUtPmlfbW9kZSkpCiAgICAgcmV0dXJuIDU7
CgogICBpZiAoaW5vZGUtPmlfc2l6ZSAhPSB1aS0+ZGF0YV9sZW4pCiAgICAgcmV0dXJuIDY7Cn0K
PiAgIAlpZiAoIXViaWZzX2NvbXByX3ByZXNlbnQoYywgdWktPmNvbXByX3R5cGUpKSB7Cj4gICAJ
CXViaWZzX3dhcm4oYywgImlub2RlICVsbHUgdXNlcyAnJXMnIGNvbXByZXNzaW9uLCBidXQgaXQg
d2FzIG5vdCBjb21waWxlZCBpbiIsCj4gICAJCQkgICBpbm9kZS0+aV9pbm8sIHViaWZzX2NvbXBy
X25hbWUoYywgdWktPmNvbXByX3R5cGUpKTsKPiAuCj4gCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
