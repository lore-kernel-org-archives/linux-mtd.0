Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E3DC61DA4
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Feb 2023 07:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4zmq8nCMLyaejdQf0Xl8wzhFk2MyqhuAuBZ0vSv+tM=; b=jb5CElouuXbWTf3+9fcgYi30Cb
	FZ6S08vi6k+Mx+/E0UxuwxqmnffqmK/tu2wCG9WPUX4Kj3JPr6Aone3lp8WJNQ8j8MRqdT1g8w72T
	lhxXUWuxQGMlMMzmbUPI9KHunXmjFyELeaqgAt0Uv/gEUa7pCXggHRM9ggr7dOzjaJd/Zy5dEWw5p
	kuKFmcLpy0m2BWFI1/wg0TmTB0lKah1fPqVL70fcXdgXCwZViaxacOaeDECKWJYEWLC9pIiHgFkgE
	ZI7laJQtqaNyyevAu0UvYANfFjVgTpDrdHIbkVcEzs/bLZl1NPjW1zPZKNECWsUFphufwC21vyXlA
	E6YEYUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQk8n-008vJm-2O; Sat, 11 Feb 2023 07:17:45 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQk8j-008vHk-0g
	for linux-mtd@lists.infradead.org; Sat, 11 Feb 2023 07:17:43 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PDMLS5XR0zRrvJ;
	Sat, 11 Feb 2023 15:14:56 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Sat, 11 Feb 2023 15:17:23 +0800
Subject: Re: [PATCH] ubifs: make kobj_type structures constant
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>, Richard
 Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230210-kobj_type-ubifs-v1-1-052419f90fae@weissschuh.net>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <a445d84b-2f08-69bf-9b23-5b5c79031d65@huawei.com>
Date: Sat, 11 Feb 2023 15:17:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230210-kobj_type-ubifs-v1-1-052419f90fae@weissschuh.net>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_231741_263552_56A4B51D 
X-CRM114-Status: GOOD (  12.18  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjMvMi8xMCAxMDoxNiwgVGhvbWFzIFdlacOfc2NodWgg5YaZ6YGTOgo+IFNpbmNlIGNv
bW1pdCBlZTZkM2RkNGVkNDggKCJkcml2ZXIgY29yZTogbWFrZSBrb2JqX3R5cGUgY29uc3RhbnQu
IikKPiB0aGUgZHJpdmVyIGNvcmUgYWxsb3dzIHRoZSB1c2FnZSBvZiBjb25zdCBzdHJ1Y3Qga29i
al90eXBlLgo+IAo+IFRha2UgYWR2YW50YWdlIG9mIHRoaXMgdG8gY29uc3RpZnkgdGhlIHN0cnVj
dHVyZSBkZWZpbml0aW9ucyB0byBwcmV2ZW50Cj4gbW9kaWZpY2F0aW9uIGF0IHJ1bnRpbWUuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdlaXNzc2NodWgubmV0
Pgo+IC0tLQo+ICAgZnMvdWJpZnMvc3lzZnMuYyB8IDQgKystLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKClJldmlld2VkLWJ5OiBaaGloYW8g
Q2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMv
c3lzZnMuYyBiL2ZzL3ViaWZzL3N5c2ZzLmMKPiBpbmRleCAwNmFkOGZhMWZjZmIuLjQ0MDRjYTRm
MmNlOSAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9zeXNmcy5jCj4gKysrIGIvZnMvdWJpZnMvc3lz
ZnMuYwo+IEBAIC03NCwxMyArNzQsMTMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzeXNmc19vcHMg
dWJpZnNfYXR0cl9vcHMgPSB7Cj4gICAJLnNob3cJPSB1Ymlmc19hdHRyX3Nob3csCj4gICB9Owo+
ICAgCj4gLXN0YXRpYyBzdHJ1Y3Qga29ial90eXBlIHViaWZzX3NiX2t0eXBlID0gewo+ICtzdGF0
aWMgY29uc3Qgc3RydWN0IGtvYmpfdHlwZSB1Ymlmc19zYl9rdHlwZSA9IHsKPiAgIAkuZGVmYXVs
dF9ncm91cHMJPSB1Ymlmc19ncm91cHMsCj4gICAJLnN5c2ZzX29wcwk9ICZ1Ymlmc19hdHRyX29w
cywKPiAgIAkucmVsZWFzZQk9IHViaWZzX3NiX3JlbGVhc2UsCj4gICB9Owo+ICAgCj4gLXN0YXRp
YyBzdHJ1Y3Qga29ial90eXBlIHViaWZzX2t0eXBlID0gewo+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IGtvYmpfdHlwZSB1Ymlmc19rdHlwZSA9IHsKPiAgIAkuc3lzZnNfb3BzCT0gJnViaWZzX2F0dHJf
b3BzLAo+ICAgfTsKPiAgIAo+IAo+IC0tLQo+IGJhc2UtY29tbWl0OiBlNTQ0YTA3NDM4NTIyYWIz
Njg4NDE2ZTZlMmUzNGJmMGVlNmQ4NzU1Cj4gY2hhbmdlLWlkOiAyMDIzMDIxMC1rb2JqX3R5cGUt
dWJpZnMtNTc5MGEzZDQ2ZTk3Cj4gCj4gQmVzdCByZWdhcmRzLAo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
