Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118BCC6FD18
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Apr 2023 12:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PEoMIt23uTaVNqxterwkhz9+PhscHtsfTeKri6pIF5o=; b=aI6jL8eAXNrO46
	NHCf7RQ85kq8JL3NaIFo53DOb858PXodGZ1DqdsWV0U9ZOHhDc0LB9/KjVITEdb/DedzJJIhxOrcX
	2vYLwLV2TIKeTt5T5TViN+r7TrAjLhBcnK356s/v5u7eAn9w8KfrADOHtYxlWf5B9JQ00ByLU2si2
	ZxCXCIepU4CvKvAsGpbp0MyN8eLFg3vCXwpO8FDEnRyFsbqoCKCIkzSFgJWZS5nv8yX07bjBcyEA2
	mfIHbEiyVPdJB16XTx66va/f2SKiOt+cXwkwceQAeRHd15l8/A8j6OsmuVYfb9g/BBnnmJUsByxzc
	1YDx+sWprkt7tSSGeqCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqZEn-00EKk4-06;
	Sun, 23 Apr 2023 12:54:41 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqZEj-00EKiE-2m
	for linux-mtd@lists.infradead.org;
	Sun, 23 Apr 2023 12:54:39 +0000
Received: from dggpemm500009.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Q47VN5l6BzKsxn;
	Sun, 23 Apr 2023 20:53:32 +0800 (CST)
Received: from [10.174.178.209] (10.174.178.209) by
 dggpemm500009.china.huawei.com (7.185.36.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 23 Apr 2023 20:54:27 +0800
Message-ID: <c6185f05-bbc6-355f-6061-73e81a8a0070@huawei.com>
Date: Sun, 23 Apr 2023 20:54:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/5] ubi: Enhanced fault injection capability for the UBI
 driver
To: Richard Weinberger <richard@nod.at>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, chengzhihao1 <chengzhihao1@huawei.com>, yi
 zhang <yi.zhang@huawei.com>
References: <20230318015621.1408243-1-wangzhaolong1@huawei.com>
 <1751647898.236371.1682111895850.JavaMail.zimbra@nod.at>
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
In-Reply-To: <1751647898.236371.1682111895850.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.209]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_055438_107378_CD20C341 
X-CRM114-Status: GOOD (  10.62  )
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

VGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgcmVwbHlpbmcgdG8gbXkgZW1haWwuIEkgYWdyZWUgd2l0
aCB5b3UuCgpJJ2xsIHR3ZWFrIG15IHBhdGNoIGluIHRoZSBuZXh0IGZldyB3ZWVrcywgdHJ5IHRv
IGtlZXAgdGhlIG9sZCBpbnRlcmZhY2UgYW5kCmJlIGNvbXBhdGlibGUgd2l0aCB0aGUgbmV3IGlu
dGVyZmFjZS4KCkJlc3QgUmVnYXJkcwpaaGFvTG9uZyBXYW5nCgrlnKggMjAyMy80LzIyIDU6MTgs
IFJpY2hhcmQgV2VpbmJlcmdlciDlhpnpgZM6Cj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAt
LS0tLQo+PiBWb246ICJaaGFvTG9uZyBXYW5nIiA8d2FuZ3poYW9sb25nMUBodWF3ZWkuY29tPgo+
PiBUaGUgZXhpc3RpbmcgZmF1bHQgaW5qZWN0aW9uIGNhcGFiaWxpdHkgb2YgVUJJIGlzIHRvbyBz
aW1wbGUuCj4+IEl0IHVzZXMgaGFyZC1jb2RlZCBmYXVsdCBwcm9iYWJpbGl0eSB2YWx1ZXMgYW5k
IGxhY2tzIG90aGVyCj4+IGNvbmZpZ3VyYWJsZSBvcHRpb25zLiBBcyBhIHJlc3VsdCwgdGhlc2Ug
aW50ZXJmYWNlcyBhcmUgZGlmZmljdWx0Cj4+IHRvIHVzZSB3aGVuIGRpZ2dpbmcgZGVmZWN0cyBp
biB0aGUgYWJub3JtYWwgcGF0aCBvZiBjb2RlIGFuZAo+PiByZXByb2R1Y2luZyBzb21lIHByb2Js
ZW1zLgo+Pgo+PiBUaGUga2VybmVsIHByb3ZpZGVzIGEgcG93ZXJmdWwgZmF1bHQgaW5qZWN0aW9u
IGZyYW1ld29yaywgd2hpY2gKPj4gcHJvdmlkZXMgcmljaCBjb25maWd1cmFibGUgZmF1bHQgaW5q
ZWN0aW9uIGF0dHJpYnV0ZXMgZHVyaW5nIHJ1bnRpbWUuCj4+IFNvIGl0IGNhbiBiZSB1c2VkIHRv
IGltcHJvdmUgdGhlIGZhdWx0IGluamVjdGlvbiBjYXBhYmlsaXR5IG9mIHRoZQo+PiBVQkkgZHJp
dmVyLgo+Pgo+PiBUaGlzIHNlcmllcyBvZiBwYXRjaGVzIHJlZmFjdG9yIHRoZSBleGlzdGluZyBm
YXVsdCBpbmplY3Rpb24gaW50ZXJmYWNlCj4+IGFuZCBhZGQgc29tZSBmYXVsdCBpbmplY3Rpb24g
dHlwZXMgdG8gaGVscCB0ZXN0ZXJzIGFuZCBkZXZlbG9wZXJzCj4+IGZpbmQgcG90ZW50aWFsIHBy
b2JsZW1zIGluIHRoZSBjb2RlLgo+IEluIGdlbmVyYWwgSSBsaWtlIGhhdmluZyBzb21lIG5ldyBh
bmQgYWR2YW5jZWQgd2F5IHRvIHRlc3QgVUJJLgo+IEJ1dCB5b3VyIHBhdGNoZXMgc2VlbSB0byBy
ZW1vdmUgdGhlIG9sZCBpbnRlcmZhY2UgZnJvbSBkZWJ1Z2ZzLAo+IHRoaXMgd2lsbCBjYXVzZSBi
cmVha2FnZSBvZiBleGlzdGluZyB0ZXN0IHNjcmlwdHMuCj4KPiBTbyBwbGVhc2Uga2VlcCB0aGUg
b2xkIGludGVyZmFjZSB0b28uCj4KPiBUaGFua3MsCj4gLy9yaWNoYXJkCj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
