Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA9BC982CF
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2026 11:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ysbKBMhJPqoGcEeqn3jKxRdWwC4YiiMAckspsa7hK4=; b=Mw8v0oXszhRyy4Es9BG3GIdcJI
	vzfWuiOaXKwyNpuLcQj9G2t5WpOmmpYoc+yma1LdwPbDAUQsclZohGVLrfZlJkCEdlhCZSJ1BF+Xi
	MhCQYLueyLurMiOP+RGZXYr+Zr11aUvhvhai0I1yu6ePI8iQiyZrf0Ot8b6lVeDICqmQyWZ+2p4Ta
	Cy9Wcf1AVD8p/c119XDa2dW8gI/D7PCFyt6ESGAp+3SwIwystamZd7/ivDdH7DbatbPvfu2r0C9YE
	tfBoodIGCIVA1YzXxdB04eJAt22W9Nrwjz839E57hHjtdJJLMgugxwVzqPe0ZLhDcK/IYKjqK8JDo
	PNSKt+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AAp-0000000BAyJ-1J6P;
	Thu, 17 Sep 2026 11:21:03 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AAl-0000000BAxH-2BDJ
	for linux-mtd@lists.infradead.org;
	Thu, 17 Sep 2026 11:21:01 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=qBT9oEMuSH+QUhAv8dwdu6RDMpOUzUIuwB5dGjyEQHk=;
	b=EjjPOXlRIweH68rSem4lpfEB0qXbK0kdZEsNtk7liGQLLdXcwCFIRzykehkn6T79Hnvxq7xNg
	CNFcC9yCmgsnzg9xT5gBnHHFzL7gxqfJEOmnGmonN9p+Xp2vzl8lN2vPzxSHsh2HDLbHUH8dK40
	0iTbAedqwtZkShJnTPnb1ho=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hltLk0LfJz12LHh;
	Thu, 17 Sep 2026 19:09:34 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 9599640591;
	Thu, 17 Sep 2026 19:20:41 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 17 Sep 2026 19:20:40 +0800
Subject: Re: [PATCH] mtd: ubi: Fix UBI device reference leak in
 ubi_detach_mtd_dev()
To: Wentao Liang <vulab@iscas.ac.cn>
CC: <daniel@makrotopia.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <stable@vger.kernel.org>
References: <20260917103102.2147038-1-vulab@iscas.ac.cn>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <103ef14f-85e7-8f4d-4ba4-eab5e36ddfe2@huawei.com>
Date: Thu, 17 Sep 2026 19:20:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260917103102.2147038-1-vulab@iscas.ac.cn>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_042100_025215_C44373C5 
X-CRM114-Status: GOOD (  17.48  )
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

1NogMjAyNi85LzE3IDE4OjMxLCBXZW50YW8gTGlhbmcg0LS1wDoKPiB1YmlfZGV0YWNoX210ZF9k
ZXYoKSB0YWtlcyBhIHJlZmVyZW5jZSBvbiB0aGUgVUJJIGRldmljZSB3aXRoCj4gdWJpX2dldF9k
ZXZpY2UoKSBhbmQgZHJvcHMgdGhlIG1hdGNoaW5nIGtvYmplY3QgcmVmZXJlbmNlIG9ubHkgYWZ0
ZXIKPiB0aGUgc2h1dGRvd24gbm90aWZpY2F0aW9uIGhhcyBiZWVuIHNlbnQuICBXaGVuIHRoZSBk
ZXZpY2UgaXMgc3RpbGwgaW4KPiB1c2UgYW5kIGEgZm9yY2VkIGRldGFjaCB3YXMgbm90IHJlcXVl
c3RlZCwgdGhlIGZ1bmN0aW9uIHJldHVybnMgLUVCVVNZCj4gYmVmb3JlIHRoYXQgcHV0X2Rldmlj
ZSgpLCBzbyB0aGUgcmVmZXJlbmNlIHRha2VuIGJ5IHViaV9nZXRfZGV2aWNlKCkgaXMKPiBuZXZl
ciByZWxlYXNlZCBhbmQgdGhlIGRldmljZSBpcyBuZXZlciBmcmVlZC4KPiAKPiBEcm9wIHRoZSBy
ZWZlcmVuY2Ugb24gdGhlIGJ1c3kgcGF0aCBhcyB3ZWxsLgo+IAo+IEZpeGVzOiA3ZTg0Yzk2MWIy
ZWIgKCJtdGQ6IHViaTogaW50cm9kdWNlIHByZS1yZW1vdmFsIG5vdGlmaWNhdGlvbiBmb3IgVUJJ
IHZvbHVtZXMiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTog
V2VudGFvIExpYW5nIDx2dWxhYkBpc2Nhcy5hYy5jbj4KPiAtLS0KPiAgIGRyaXZlcnMvbXRkL3Vi
aS9idWlsZC5jIHwgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCkhpLCBX
ZW50YW8sIGl0IGhhcyBiZWVuIGZpeGVkIGJ5IFsxXS4KClsxXSAKaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC9k
cml2ZXJzL210ZC91YmkvYnVpbGQuYz9pZD0zMWRkNzEwY2Q4NGQ1ZGQ2M2M0OWY2NDBkM2E5ZjM2
Yzk2OTljYTk1Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jIGIvZHJp
dmVycy9tdGQvdWJpL2J1aWxkLmMKPiBpbmRleCA2NzRhZDg3ODA5ZGYuLmQ4MWY1ZTAzOTVhYyAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwo+ICsrKyBiL2RyaXZlcnMvbXRk
L3ViaS9idWlsZC5jCj4gQEAgLTExMDYsNiArMTEwNiw3IEBAIGludCB1YmlfZGV0YWNoX210ZF9k
ZXYoaW50IHViaV9udW0sIGludCBhbnl3YXkpCj4gICAJaWYgKHViaS0+cmVmX2NvdW50KSB7Cj4g
ICAJCWlmICghYW55d2F5KSB7Cj4gICAJCQlzcGluX3VubG9jaygmdWJpX2RldmljZXNfbG9jayk7
Cj4gKwkJCXB1dF9kZXZpY2UoJnViaS0+ZGV2KTsKPiAgIAkJCXJldHVybiAtRUJVU1k7Cj4gICAJ
CX0KPiAgIAkJLyogVGhpcyBtYXkgb25seSBoYXBwZW4gaWYgdGhlcmUgaXMgYSBidWcgKi8KPiAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
