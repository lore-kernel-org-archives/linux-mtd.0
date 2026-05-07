Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D379ACD3442
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2026 07:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/9mJxJ+Eaeefh94EaQclCvAc6rv6YrsAd2MmEFTmc0=; b=kbrtsQ93qh16IlU/drizIsExa6
	Mf+eZJlDfdnV2zsEPDHszxgk7qbekLYCK03UDaQE9AxK1gLG53a7sZVFTbsitc7hdKPd8xCAMVQw7
	U/ELSaZF1fQ3iN3MbTY5e3Up+fnGrPlHNz89jkTrJSIsAYLwByMlGDzm6JsnI9gbzP4zUt+AzeyMn
	nJ6vSckqVZ3pxPFFVqZO5XwQ7gs0vGsKZ7hba2JaxmAjDwoKivkn6nPElM2VW1W+/xqedfB3VNDvS
	bgOZFC9AE2JJY5zj2lH5c8G5GwAXA5kydy6BxU4JbafIZZ+SAhe4pfXbiVxL8B9JZG3dHmqsCuL5m
	xTTTesXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtLo-000000033Og-0nNz;
	Thu, 07 May 2026 07:40:52 +0000
Received: from [113.46.200.222] (helo=canpmsgout07.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtLm-000000033MO-1A9k
	for linux-mtd@lists.infradead.org;
	Thu, 07 May 2026 07:40:50 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3Vr5xohz+n+kz/ruxUAj62J4VpxUnciK4Pdu96D8bMI=;
	b=f763sY9WjcwGVXaYIxnPHBXMhUz3KChCFC7BFK30j3Cu7JHsV8VseGpssmm4GHeGAWFlfAml+
	KB2uOGrETHLA7j6YImAEK3mZCFcNJ/fSPpx/E+54mehwo6+4Ru1yWFUKJGZ9HbE7WxynO4Jt9Yv
	Bqae256SK35/MVm9asTW7K0=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gB3r15qrczLlSv;
	Thu,  7 May 2026 15:32:49 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B805040539;
	Thu,  7 May 2026 15:40:22 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 7 May 2026 15:40:22 +0800
Subject: Re: [PATCH 1/2] ubi: build: replace simple_strtoul with kstrtouint in
 open_mtd_device()
To: haoyu.lu <hechushiguitu666@gmail.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260507032308.16485-1-hechushiguitu666@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <8a9964a1-bfd8-21c1-10d9-94989cc3a340@huawei.com>
Date: Thu, 7 May 2026 15:40:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260507032308.16485-1-hechushiguitu666@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_004050_958905_D9BFEB4C 
X-CRM114-Status: GOOD (  21.82  )
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

1NogMjAyNi81LzcgMTE6MjMsIGhhb3l1Lmx1INC0tcA6Cj4gRnJvbTogSGFveXUgTHUgPGhlY2h1
c2hpZ3VpdHU2NjZAZ21haWwuY29tPgo+IAo+IFJlcGxhY2UgdGhlIGRlcHJlY2F0ZWQgc2ltcGxl
X3N0cnRvdWwoKSB3aXRoIGtzdHJ0b3VpbnQoKSBmb3IgcGFyc2luZwo+IHRoZSBNVEQgZGV2aWNl
IG51bWJlciBzdHJpbmcuIGtzdHJ0b3VpbnQoKSBwcm92aWRlcyBzdHJpY3RlciB2YWxpZGF0aW9u
Cj4gYW5kIGJldHRlciBlcnJvciBoYW5kbGluZy4KPiAKPiBJbiBvcGVuX210ZF9kZXZpY2UoKSwg
YSBzdHJpbmcgdGhhdCBjYW4gYmUgcGFyc2VkIGFzIGEgcHVyZSBudW1iZXIgaXMKPiB0cmVhdGVk
IGFzIGFuIE1URCBkZXZpY2UgaW5kZXg7IG90aGVyd2lzZSBpdCBpcyB0cmVhdGVkIGFzIGEgZGV2
aWNlCj4gbmFtZS4ga3N0cnRvdWludCgpIHJldHVybnMgMCBvbiBzdWNjZXNzIGFuZCAtRUlOVkFM
IGlmIHRoZSBzdHJpbmcKPiBjb250YWlucyBub24tbnVtZXJpYyBjaGFyYWN0ZXJzLCB3aGljaCBh
bGlnbnMgd2l0aCB0aGlzIGxvZ2ljIGFuZAo+IGVsaW1pbmF0ZXMgdGhlIG5lZWQgZm9yIG1hbnVh
bCBlbmRwIGNoZWNrcy4KPiAKPiBGb3IgY29tcGF0aWJpbGl0eSB3aXRoIGtzdHJ0b3VpbnQoKSwg
bXRkX251bSBpcyBjaGFuZ2VkIGZyb20gaW50IHRvCj4gdW5zaWduZWQgaW50LCBjb25zaXN0ZW50
IHdpdGggdGhlIGV4aXN0aW5nIHNpbXBsZV9zdHJ0b3VsIC0+Cj4ga3N0cnRvdWludCBjb252ZXJz
aW9ucyBpbiBtdGRvb3BzLmMgYW5kIG10ZHN1cGVyLmMuCj4gCj4gVGhlIG11bHRpLWxpbmUgY29t
bWVudCBpcyBzaW1wbGlmaWVkIHRvIGEgY29uY2lzZSBzaW5nbGUtbGluZSBjb21tZW50Cj4gc2lu
Y2UgdGhlIGxvZ2ljIGlzIHNlbGYtZXhwbGFuYXRvcnkgd2l0aCBrc3RydG91aW50KCkuCj4gCj4g
U2lnbmVkLW9mZi1ieTogSGFveXUgTHUgPGhlY2h1c2hpZ3VpdHU2NjZAZ21haWwuY29tPgo+IC0t
LQo+ICAgZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMgfCAxNSArKysrKy0tLS0tLS0tLS0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+IAoKUmV2aWV3
ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jIGIvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPiBp
bmRleCA2NzRhZDg3ODA5ZGYuLjAzZWYxOTVkYzI1YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210
ZC91YmkvYnVpbGQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jCj4gQEAgLTEyMTAs
MjEgKzEyMTAsMTYgQEAgc3RhdGljIHN0cnVjdCBtdGRfaW5mbyAqIF9faW5pdCBvcGVuX210ZF9i
eV9jaGRldihjb25zdCBjaGFyICptdGRfZGV2KQo+ICAgc3RhdGljIHN0cnVjdCBtdGRfaW5mbyAq
IF9faW5pdCBvcGVuX210ZF9kZXZpY2UoY29uc3QgY2hhciAqbXRkX2RldikKPiAgIHsKPiAgIAlz
dHJ1Y3QgbXRkX2luZm8gKm10ZDsKPiAtCWludCBtdGRfbnVtOwo+IC0JY2hhciAqZW5kcDsKPiAr
CXVuc2lnbmVkIGludCBtdGRfbnVtOwo+ICAgCj4gLQltdGRfbnVtID0gc2ltcGxlX3N0cnRvdWwo
bXRkX2RldiwgJmVuZHAsIDApOwo+IC0JaWYgKCplbmRwICE9ICdcMCcgfHwgbXRkX2RldiA9PSBl
bmRwKSB7Cj4gLQkJLyoKPiAtCQkgKiBUaGlzIGRvZXMgbm90IGxvb2sgbGlrZSBhbiBBU0NJSSBp
bnRlZ2VyLCBwcm9iYWJseSB0aGlzIGlzCj4gLQkJICogTVREIGRldmljZSBuYW1lLgo+IC0JCSAq
Lwo+ICsJaWYgKGtzdHJ0b3VpbnQobXRkX2RldiwgMCwgJm10ZF9udW0pICE9IDApIHsKPiArCQkv
KiBOb3QgYSBwbGFpbiBudW1iZXIsIHRyZWF0IGFzIE1URCBkZXZpY2UgbmFtZSAqLwo+ICAgCQlt
dGQgPSBnZXRfbXRkX2RldmljZV9ubShtdGRfZGV2KTsKPiAgIAkJaWYgKFBUUl9FUlIobXRkKSA9
PSAtRU5PREVWKQo+IC0JCQkvKiBQcm9iYWJseSB0aGlzIGlzIGFuIE1URCBjaGFyYWN0ZXIgZGV2
aWNlIG5vZGUgcGF0aCAqLwo+ICAgCQkJbXRkID0gb3Blbl9tdGRfYnlfY2hkZXYobXRkX2Rldik7
Cj4gLQl9IGVsc2UKPiArCX0gZWxzZSB7Cj4gICAJCW10ZCA9IGdldF9tdGRfZGV2aWNlKE5VTEws
IG10ZF9udW0pOwo+ICsJfQo+ICAgCj4gICAJcmV0dXJuIG10ZDsKPiAgIH0KPiAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
