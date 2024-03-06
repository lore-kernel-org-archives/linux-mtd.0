Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9F1C54798
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2024 01:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrvNqvfKavSD4s2X2LfJ8JhBEPReU8xoyIPr6q1Kycs=; b=X0Z2hwMarphghWygvMTQc508dB
	6mI/212FyXGljA9fMBn+WduOYilTUYI/vX8dkx1Jp7Ngub00hV+9jeca7IdEIIjHxsNGlrlpE19Qk
	WehseWSOD3irYeqfv4JGZlfAw3iiBPQyFzHpveMVdpyfCyNO6ddcAZxF9aVAQ6piMoMLpc8pThHG6
	OgZfkppWjTZG0ho4ut49/WtB6rk8havVEj00Do+2Xh5R5rMIoVBSeOBcvlPXEORcnOYQel4dzvqXi
	srh+JbBhP0dc7FAyZihF0PJ4LVx5Oejfw9q8bZOlUG3MO+CGC8RARlMr7ZSNHShGWTH5MVsvEOnjK
	zqvz5ICA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhfyz-0000000Fr9H-3vpS;
	Wed, 06 Mar 2024 01:22:09 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhfyv-0000000Fr64-0nIQ
	for linux-mtd@lists.infradead.org;
	Wed, 06 Mar 2024 01:22:07 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4TqF3d4hMlzNlsR;
	Wed,  6 Mar 2024 09:20:13 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 5B7F4140114;
	Wed,  6 Mar 2024 09:21:51 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 09:21:50 +0800
Subject: Re: [PATCH] mtd: ubi: make ubi_class constant
To: "Ricardo B. Marliere" <ricardo@marliere.net>, Richard Weinberger
	<richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh
 Raghavendra <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240305-class_cleanup-mtd-v1-1-7861914e2218@marliere.net>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <0e612171-d3f0-f284-12b7-373f4da350d3@huawei.com>
Date: Wed, 6 Mar 2024 09:21:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240305-class_cleanup-mtd-v1-1-7861914e2218@marliere.net>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_172205_574274_1C68C9B5 
X-CRM114-Status: GOOD (  15.38  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyNC8zLzYgMzozNSwgUmljYXJkbyBCLiBNYXJsaWVyZSDQtLXAOgo+IFNpbmNlIGNvbW1p
dCA0M2E3MjA2YjA5NjMgKCJkcml2ZXIgY29yZTogY2xhc3M6IG1ha2UgY2xhc3NfcmVnaXN0ZXIo
KSB0YWtlCj4gYSBjb25zdCAqIiksIHRoZSBkcml2ZXIgY29yZSBhbGxvd3MgZm9yIHN0cnVjdCBj
bGFzcyB0byBiZSBpbiByZWFkLW9ubHkKPiBtZW1vcnksIHNvIG1vdmUgdGhlIHViaV9jbGFzcyBz
dHJ1Y3R1cmUgdG8gYmUgZGVjbGFyZWQgYXQgYnVpbGQgdGltZQo+IHBsYWNpbmcgaXQgaW50byBy
ZWFkLW9ubHkgbWVtb3J5LCBpbnN0ZWFkIG9mIGhhdmluZyB0byBiZSBkeW5hbWljYWxseQo+IGFs
bG9jYXRlZCBhdCBib290IHRpbWUuCj4gCj4gQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2to
QGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gU3VnZ2VzdGVkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4g
PGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFJpY2FyZG8gQi4g
TWFybGllcmUgPHJpY2FyZG9AbWFybGllcmUubmV0Pgo+IC0tLQo+ICAgZHJpdmVycy9tdGQvdWJp
L2J1aWxkLmMgfCAyICstCj4gICBkcml2ZXJzL210ZC91YmkvdWJpLmggICB8IDIgKy0KPiAgIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQt
Ynk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jIGIvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPiBp
bmRleCA3ZDRmZjExOTNkYjYuLjE5MzhiNjFlMWI3NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210
ZC91YmkvYnVpbGQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jCj4gQEAgLTExMSw3
ICsxMTEsNyBAQCBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqdWJpX2NsYXNzX2F0dHJzW10gPSB7
Cj4gICBBVFRSSUJVVEVfR1JPVVBTKHViaV9jbGFzcyk7Cj4gICAKPiAgIC8qIFJvb3QgVUJJICJj
bGFzcyIgb2JqZWN0IChjb3JyZXNwb25kcyB0byAnLzxzeXNmcz4vY2xhc3MvdWJpLycpICovCj4g
LXN0cnVjdCBjbGFzcyB1YmlfY2xhc3MgPSB7Cj4gK2NvbnN0IHN0cnVjdCBjbGFzcyB1YmlfY2xh
c3MgPSB7Cj4gICAJLm5hbWUJCT0gVUJJX05BTUVfU1RSLAo+ICAgCS5jbGFzc19ncm91cHMJPSB1
YmlfY2xhc3NfZ3JvdXBzLAo+ICAgfTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJpL3Vi
aS5oIGIvZHJpdmVycy9tdGQvdWJpL3ViaS5oCj4gaW5kZXggMGI0MmJiNDVkZDg0Li4yMWMzMjA4
YTkyMTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvdWJpL3ViaS5oCj4gKysrIGIvZHJpdmVy
cy9tdGQvdWJpL3ViaS5oCj4gQEAgLTgxMiw3ICs4MTIsNyBAQCBleHRlcm4gc3RydWN0IGttZW1f
Y2FjaGUgKnViaV93bF9lbnRyeV9zbGFiOwo+ICAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBmaWxlX29w
ZXJhdGlvbnMgdWJpX2N0cmxfY2Rldl9vcGVyYXRpb25zOwo+ICAgZXh0ZXJuIGNvbnN0IHN0cnVj
dCBmaWxlX29wZXJhdGlvbnMgdWJpX2NkZXZfb3BlcmF0aW9uczsKPiAgIGV4dGVybiBjb25zdCBz
dHJ1Y3QgZmlsZV9vcGVyYXRpb25zIHViaV92b2xfY2Rldl9vcGVyYXRpb25zOwo+IC1leHRlcm4g
c3RydWN0IGNsYXNzIHViaV9jbGFzczsKPiArZXh0ZXJuIGNvbnN0IHN0cnVjdCBjbGFzcyB1Ymlf
Y2xhc3M7Cj4gICBleHRlcm4gc3RydWN0IG11dGV4IHViaV9kZXZpY2VzX211dGV4Owo+ICAgZXh0
ZXJuIHN0cnVjdCBibG9ja2luZ19ub3RpZmllcl9oZWFkIHViaV9ub3RpZmllcnM7Cj4gICAKPiAK
PiAtLS0KPiBiYXNlLWNvbW1pdDogNzdiZjAzMjUyODM5M2QyZGM5NDMwYjNjZWExZmVlOGQwNzYy
YTg2Zgo+IGNoYW5nZS1pZDogMjAyNDAzMDUtY2xhc3NfY2xlYW51cC1tdGQtYjdkZmUyZWE4YzI2
Cj4gCj4gQmVzdCByZWdhcmRzLAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
