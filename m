Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB5A606A31F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2026 11:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V1t001ZL;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ijmtIpiD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ltRTqCrRCKDuzVcCkUuLj+3jHb4stK8Tv4ryb6duk6c=; b=V1t001ZL20rvpRiRcDVUSwcf99
	QCX9vXDaVFKGKccyxFfjCa2yKz32i3AKYkroY4wqQnS7V2ahj+MGFPQ55obNBgbzOQSvnsJuMsloZ
	8UXVuFsSRbtvoHrWAKvaWbRow7vCVfT/EnVmEyzqBCBC4TgzzWk4ZsL/gUiqdeHQIYuGABGwkCj+o
	2lM8dluFNltaicMw0pWpYS6IEKB+H/JQwOlh6ABM2apaaLAO5ZQlFoNmmXSciJHYGVtsD3/6tyIWQ
	NmjIisTrj/5b+bWag5PjAqgYkut1yXpFLFlCyqv2+GcPNLouJUwH1N9TTz3WTvJucqNtAHl4eV35t
	KgyWieJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfCr-00000004T5o-0dCv;
	Tue, 27 Oct 2026 11:19:05 +0000
Received: from [113.46.200.222] (helo=canpmsgout07.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfCn-00000004T36-3xTp
	for linux-mtd@lists.infradead.org;
	Tue, 27 Oct 2026 11:19:04 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=SHLKyJlQ92ycclVRVclHzYt7AhLEu/8J5eYn5vce5kI=;
	b=ijmtIpiDqGjAg+LyC4KtjTcqPEfytqF3S8pSW81KfNo/73c6OSQ+umrfumunmcizZaVSKkein
	ECUjBwpEvNk409dyr1Pf309w/eDSEK5rCEr7ZQN1M/CRKF3IG/XxdjH4oafKDdxf33H+PwgWcna
	Vi7kFdG0/jk70YncXV8qvUI=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jDSfm0dc8zLlXn;
	Tue, 27 Oct 2026 19:18:40 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id EE4B940578;
	Tue, 27 Oct 2026 19:18:45 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 27 Oct 2026 19:18:44 +0800
Subject: Re: [PATCH] mtd: ubi: nvmem: Fix device_node leak in ubi_nvmem_add()
To: Vishal Satle <vishalsatleit24@gmail.com>, Richard Weinberger
	<richard@nod.at>, Daniel Golle <daniel@makrotopia.org>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
References: <20261027091507.130294-1-vishalsatleit24@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <67bc8e42-c4e9-bfbd-f451-1ef5b492a084@huawei.com>
Date: Tue, 27 Oct 2026 19:18:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261027091507.130294-1-vishalsatleit24@gmail.com>
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_041902_448749_9E30D4AB 
X-CRM114-Status: GOOD (  18.80  )
X-Spam-Score: -2.5 (--)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

1NogMjAyNi8xMC8yNyAxNzoxNSwgVmlzaGFsIFNhdGxlINC0tcA6Cj4gdWJpX252bWVtX2FkZCgp
IGNhbGxzIG9mX2dldF9jaGlsZF9ieV9uYW1lKCkgdG8gdmVyaWZ5IHRoYXQgdGhlIFVCSQo+IHZv
bHVtZSBkZXZpY2Ugbm9kZSBjb250YWlucyBhbiAibnZtZW0tbGF5b3V0IiBzdWJub2RlLgo+IG9m
X2dldF9jaGlsZF9ieV9uYW1lKCkgcmV0dXJucyBhIHBvaW50ZXIgdG8gdGhlIGNoaWxkIGRldmlj
ZV9ub2RlCj4gd2l0aCBpdHMgcmVmZXJlbmNlIGNvdW50IGluY3JlbWVudGVkLgo+IAo+IEJlY2F1
c2UgdGhlIHJldHVybmVkIHBvaW50ZXIgd2FzIG9ubHkgZXZhbHVhdGVkIGFzIGEgYm9vbGVhbiBj
b25kaXRpb24KPiBhbmQgbm90IHJldGFpbmVkIG9yIHB1dCwgdGhlIHJlZmVyZW5jZSBjb3VudCBv
ZiB0aGUgIm52bWVtLWxheW91dCIgbm9kZQo+IHdhcyBsZWFrZWQgd2hlbmV2ZXIgYW4gTlZNRU0t
ZW5hYmxlZCBVQkkgdm9sdW1lIHdhcyByZWdpc3RlcmVkLgo+IAo+IEFzc2lnbiB0aGUgY2hpbGQg
bm9kZSB0byBhIGxvY2FsIHZhcmlhYmxlIGFuZCByZWxlYXNlIGl0IHdpdGgKPiBvZl9ub2RlX3B1
dCgpIG9uY2UgZXhpc3RlbmNlIGhhcyBiZWVuIHZhbGlkYXRlZC4KPiAKPiBGaXhlczogMzRhNWQ4
NTI1YjZhICgibXRkOiB1Ymk6IGFkZCBOVk1FTSBzdXBwb3J0IikKPiBDYzogc3RhYmxlQHZnZXIu
a2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IFZpc2hhbCBTYXRsZSA8dmlzaGFsc2F0bGVpdDI0
QGdtYWlsLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvbXRkL3ViaS9udm1lbS5jIHwgNiArKysrKy0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKClJldmll
d2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC91YmkvbnZtZW0uYyBiL2RyaXZlcnMvbXRkL3ViaS9udm1lbS5j
Cj4gaW5kZXggMmRhZGU5NzI3Li4xNTczN2Q1MTEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQv
dWJpL252bWVtLmMKPiArKysgYi9kcml2ZXJzL210ZC91YmkvbnZtZW0uYwo+IEBAIC02MSw2ICs2
MSw3IEBAIHN0YXRpYyBpbnQgdWJpX252bWVtX3JlZ19yZWFkKHZvaWQgKnByaXYsIHVuc2lnbmVk
IGludCBmcm9tLAo+ICAgc3RhdGljIGludCB1YmlfbnZtZW1fYWRkKHN0cnVjdCB1Ymlfdm9sdW1l
X2luZm8gKnZpKQo+ICAgewo+ICAgCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBkZXZfb2Zfbm9k
ZSh2aS0+ZGV2KTsKPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbGF5b3V0Owo+ICAgCXN0cnVjdCBu
dm1lbV9jb25maWcgY29uZmlnID0ge307Cj4gICAJc3RydWN0IHViaV9udm1lbSAqdW52Owo+ICAg
CWludCByZXQ7Cj4gQEAgLTY4LDkgKzY5LDEyIEBAIHN0YXRpYyBpbnQgdWJpX252bWVtX2FkZChz
dHJ1Y3QgdWJpX3ZvbHVtZV9pbmZvICp2aSkKPiAgIAlpZiAoIW5wKQo+ICAgCQlyZXR1cm4gMDsK
PiAgIAo+IC0JaWYgKCFvZl9nZXRfY2hpbGRfYnlfbmFtZShucCwgIm52bWVtLWxheW91dCIpKQo+
ICsJbGF5b3V0ID0gb2ZfZ2V0X2NoaWxkX2J5X25hbWUobnAsICJudm1lbS1sYXlvdXQiKTsKPiAr
CWlmICghbGF5b3V0KQo+ICAgCQlyZXR1cm4gMDsKPiAgIAo+ICsJb2Zfbm9kZV9wdXQobGF5b3V0
KTsKPiArCj4gICAJaWYgKFdBUk5fT05fT05DRSh2aS0+dXNhYmxlX2xlYl9zaXplIDw9IDApIHx8
Cj4gICAJICAgIFdBUk5fT05fT05DRSh2aS0+c2l6ZSA8PSAwKSkKPiAgIAkJcmV0dXJuIC1FSU5W
QUw7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
