Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80BCC4707C
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jan 2024 08:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cOvGg061HZ0LcYGR0PTF4k84vYy6GmnbKZYkDczXyY=; b=H822b8vJzSfBL0/P34HN5FL4Qb
	yBFjf48JZ3bz1lbqQ0btnJJGwnybjfH3VoaWClg+LZ3RFDyq805fMA2K6iG1UMqtZquosoLR42XIh
	qqcjc1bm+z4rqUW0LN3+X6d5xupXni62A/VUwNIIV/lWLLTXBJZi0rN4IW2wlHmqcKxu5qJidGSsC
	0EwDFT0tIUguS0jLbmxsF1W02Vt8DxGnbiUonZkjm2eBb3MKi17iUa99+IVocEFRxva9Rvdpg0DGt
	SYZD4IS6nxnP54MoXXh9raf0C7bgifQgZeY1lRyk4Z0ev+5HB3iFGkKF+0XlsgjRh113vskBjvyAW
	B5UOiCpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOCww-002D8S-2A;
	Fri, 12 Jan 2024 08:31:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOCwt-002D7i-2r
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jan 2024 08:31:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B510A61D0E;
	Fri, 12 Jan 2024 08:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1DF3C433F1;
	Fri, 12 Jan 2024 08:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705048290;
	bh=tKb0aSj13GAZ7zK0BOTCLL0jT/qUgDgXOG/4Iq9jb6k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aUR0/tHB0YiNIda89Q6pYS9kFRUNCdsmX90ncSXH8FfHOZ/WNNNDSXWOLCNZV3Xu0
	 wLeeNvzTUh5BCqIfogzxtJxGox66YbbCJO+ITQRvjicP2aMndvo3MhonVHgGsz4OEW
	 bv2Y0KSK/W7M6iWnPzb3jd3vlgGSx7v01FaFNRWvnkH6WUbPj/vhWcN+LV0as2kcGN
	 LELqFowmQ09MFuRL+jx4H/PldBIp6VHf2JkrF0zXpPjyxo7bs5POkSoJ6R2uJHUWVs
	 aFCNCBjmNHsE+ULafITwrrul5LBnOAIfnGciC8Fv4gBdaUDnWAKQ0DuOibK08oWSEE
	 6WCY0N5aOmMAw==
MIME-Version: 1.0
Date: Fri, 12 Jan 2024 09:31:26 +0100
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v7 2/7] spi: spi-mem: Allow specifying the byte order in
 DTR mode
In-Reply-To: <abd91bff-2e28-46bc-9269-e5c294bbab68@linaro.org>
References: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
 <20231221090702.103027-3-jaimeliao.tw@gmail.com>
 <efe82e9c57edd12714e67215bb71d286@kernel.org>
 <abd91bff-2e28-46bc-9269-e5c294bbab68@linaro.org>
Message-ID: <2793744f3567a818ace9a686a735e426@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_003131_987716_81F8A7C1 
X-CRM114-Status: UNSURE (   6.98  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Pj4+IMKgICogQGRhdGEuZWNjOiB3aGV0aGVyIGVycm9yIGNvcnJlY3Rpb24gaXMgcmVxdWlyZWQg
b3Igbm90Cj4+PiDCoCAqIEBkYXRhLmRpcjogZGlyZWN0aW9uIG9mIHRoZSB0cmFuc2Zlcgo+Pj4g
wqAgKiBAZGF0YS5uYnl0ZXM6IG51bWJlciBvZiBkYXRhIGJ5dGVzIHRvIHNlbmQvcmVjZWl2ZS4g
Q2FuIGJlIHplcm8gCj4+PiBpZgo+Pj4gdGhlCj4+PiBAQCAtMTIzLDYgKzEyNSw3IEBAIHN0cnVj
dCBzcGlfbWVtX29wIHsKPj4+IMKgwqDCoMKgIHN0cnVjdCB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKg
IHU4IGJ1c3dpZHRoOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoCB1OCBkdHIgOiAxOwo+Pj4gK8KgwqDC
oMKgwqDCoMKgIHU4IGR0cl9zd2FiMTYgOiAxOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoCB1OCBlY2Mg
OiAxOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoCB1OCBfX3BhZCA6IDY7Cj4+IAo+PiBfX3BhZCA6IDU7
Cj4+IAo+PiBEb2VzIGFueW9uZSBrbm93IGlmIHRoaXMgaXMgcmVhbGx5IG5lY2Vzc2FyeT8KPj4g
Cj4gCj4gaXQncyB0byBtaXRpZ2F0ZSBhIGdjYy17MTIsIDEzfSBidWcsIHNlZQo+IDcxYzhmOWNm
MjYyM2QwZGI3OTY2NWY4NzZiOTVhZmNkZDgyMTRhZWMKPiAKPiBObyBpZGVhIGlmIHRoZSBidWcg
d2FzIGZpeGVkIGluIHRoZSBtZWFudGltZS4KCkFoaCByaWdodCwgbWUgb2YgYWxsLCBzaG91bGQn
dmUgcmVtZW1iZXJlZCB0aGF0IDspCgotbWljaGFlbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
