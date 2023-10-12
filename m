Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788A7CDB46E
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 09:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+25zQRCHASMzy8SdsuY/9QXH3ViF774D+fLBDhwTng0=; b=R2MChdUbLD8no8
	e1ODepWLzqUxA0YARSJLc1niQu93mSrOVj/oaCGTRw7NMMMrDFfIrqzNBnvB3lR+fDKeuuA/i0JAu
	pJcou5u4T0Mw7/RZoausi/3QAw/lP5sia8S2iMAdikvweLEIZbgOc2bPVuMALiuve2tNGd6dXqOwI
	ha8nR4Ttkp+bNz6hpn+jB97UzqYR2xN1Q5zYpf8IO1JhtXxmZoDGGSU7sdGcwQb6I/SdqF7Fz23cP
	9iJijW+HIs5veXkaJcmftI2D6BF4jiNjLQXu8jRR9i7oNkBzJEZ9dcpgO0vvUMnKyBsYHbYxmuqTU
	E3kebUW7cZ+v91ztwiEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqs2N-000OkQ-1Z;
	Thu, 12 Oct 2023 09:31:23 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqs2J-000Oi4-0z
	for linux-mtd@lists.infradead.org;
	Thu, 12 Oct 2023 09:31:21 +0000
Received: from dggpemm500009.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4S5kpY2whvz1M9NF;
	Thu, 12 Oct 2023 17:28:37 +0800 (CST)
Received: from [10.174.178.209] (10.174.178.209) by
 dggpemm500009.china.huawei.com (7.185.36.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 12 Oct 2023 17:31:11 +0800
Message-ID: <2d04fa9e-e594-705c-339b-3090cb7d6fbd@huawei.com>
Date: Thu, 12 Oct 2023 17:31:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH RFC] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
To: Zhihao Cheng <chengzhihao1@huawei.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>, <yangerkun@huawei.com>
References: <20231010142925.545238-1-wangzhaolong1@huawei.com>
 <9f96baf1-962e-d595-0e4f-797315cd0348@huawei.com>
 <b972f615-3882-18cf-5b44-7ec021f92e0a@huawei.com>
 <a8a2dc17-7a7a-e725-8ae2-e7e0146150f0@huawei.com>
 <d089e4ff-26dc-22e4-58b3-8756f8ebaabc@huawei.com>
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
In-Reply-To: <d089e4ff-26dc-22e4-58b3-8756f8ebaabc@huawei.com>
X-Originating-IP: [10.174.178.209]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_023119_694123_D1DB97A6 
X-CRM114-Status: UNSURE (   4.35  )
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

Cj4+Cj4+PiAzLsKgwqDCoMKgwqDCoMKgwqAgUDHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBQMgo+Pj4gwqDCoMKgIGdsdWViaV9jcmVhdGUgLT4gbXRkX2RldmljZV9yZWdp
c3RlciAtPiBhZGRfbXRkX2RldmljZToKPj4+IMKgwqDCoCBkZXZpY2VfcmVnaXN0ZXLCoMKgIC8v
IGRldi9tdGQxIGlzIHZpc2libGUKPj4+Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZmQgPSBvcGVuKC9kZXYvbXRkMSwgT19XUk9OTFkpCj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnbHVlYmlfZ2V0X2RldmljZQo+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnbHVlYmkt
PmRlc2MgPSB1Ymlfb3Blbl92b2x1bWUKPj4+Cj4+PiDCoMKgwqAgZnRsX2FkZF9tdGQKPj4+IMKg
wqDCoMKgIG10ZF9yZWFkCj4+PiDCoMKgwqDCoMKgIGdsdWViaV9yZWFkCj4+PiDCoMKgwqDCoMKg
wqAgZ2x1ZWJpLT5kZXNjIGlzIG5vdCBFUlJfUFRSL05VTEwKPj4+Cj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb3NlKGZkKQo+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdsdWViaV9wdXRfZGV2aWNlCj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1YmlfY2xvc2Vfdm9sdW1lCj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGtmcmVlKGRl
c2MpCj4+PiDCoMKgwqDCoMKgwqAgdWJpX3JlYWQoZ2x1ZWJpLT5kZXNjKcKgwqAgLy8gVUFGwqAg
KMOXKQo+Pj4KPj4KPj4gWWVzLCBpdCdzIGFsc28gYSBwcm9ibGVtLiBQZXJoYXBzIGl0IHNob3Vs
ZCBiZSBzZXQgdG8gTlVMTCBhZnRlcgo+PiBkZXN0cm95aW5nIGdsdWViaS0+ZGVzYy4KPiAKPiBU
aGUga2V5IHBvaW50IGlzIHRoYXQgJ2dsdWViaS0+ZGVzYycgY2hlY2sgJiB1c2FnZSBpcyBub3Qg
YXRvbWljIGluIAo+IGdsdWViaV9yZWFkLiBTbyBmb2xsb3dpbmcgcGF0Y2ggc3RpbGwgY2FuJ3Qg
aGFuZGxlIHNpdHVhdGlvbiAzLgo+IAoKU2V0dGluZyB0aGUgZGVzYyB0byBOVUxMIHdvcmtzIGJl
Y2F1c2UKbXV0ZXhfbG9jayAibXRkX3RhYmxlX211dGV4IiBpcyBoZWxkIG9uIGFsbCBwYXRocyB3
aGVyZQpmdGxfYWRkX210ZCgpIGlzIGNhbGxlZC4KCgp1YmlfZ2x1ZWJpX2luaXQKICAgdWJpX3Jl
Z2lzdGVyX3ZvbHVtZV9ub3RpZmllcgogICAgIHViaV9lbnVtZXJhdGVfdm9sdW1lcwogICAgICAg
dWJpX25vdGlmeV9hbGwKICAgICAgICAgZ2x1ZWJpX25vdGlmeSAgICBuYi0+bm90aWZpZXJfY2Fs
bCgpCiAgICAgICAgICAgZ2x1ZWJpX2NyZWF0ZQogICAgICAgICAgICAgbXRkX2RldmljZV9yZWdp
c3RlcgogICAgICAgICAgICAgICBtdGRfZGV2aWNlX3BhcnNlX3JlZ2lzdGVyCiAgICAgICAgICAg
ICAgICAgYWRkX210ZF9kZXZpY2UKICAgICAgICAgICAgICAgICAgIG11dGV4X2xvY2soJm10ZF90
YWJsZV9tdXRleCk7CiAgICAgICAgICAgICAgICAgICBibGt0cmFuc19ub3RpZnlfYWRkICAgbm90
LT5hZGQoKQogICAgICAgICAgICAgICAgICAgICBmdGxfYWRkX210ZCAgICAgICAgIHRyLT5hZGRf
bXRkKCkKICAgICAgICAgICAgICAgICAgICAgICBzY2FuX2hlYWRlcgogICAgICAgICAgICAgICAg
ICAgICAgICAgbXRkX3JlYWQKICAgICAgICAgICAgICAgICAgICAgICAgICAgbXRkX3JlYWQKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBtdGRfcmVhZF9vb2IKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGdsdWViaV9yZWFkICAgbXRkLT5yZWFkKCkKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZ2x1ZWJpLT5kZXNjIC0gTlVMTAogICAgICAgICAgICAgICAgICAgbXV0
ZXhfdW5sb2NrKCZtdGRfdGFibGVfbXV0ZXgpOwoKdWJpX2NkZXZfaW9jdGwKICAgdWJpX2NyZWF0
ZV92b2x1bWUKICAgICB1Ymlfdm9sdW1lX25vdGlmeQogICAgICAgYmxvY2tpbmdfbm90aWZpZXJf
Y2FsbF9jaGFpbiAgW2tlcm5lbC9ub3RpZmllci5jXQogICAgICAgICBub3RpZmllcl9jYWxsX2No
YWluCiAgICAgICAgICAgZ2x1ZWJpX25vdGlmeSAgIG5iLT5ub3RpZmllcl9jYWxsKCkKICAgICAg
ICAgICAgIGdsdWViaV9jcmVhdGUKICAgICAgICAgICAgICAgbXRkX2RldmljZV9yZWdpc3Rlcgog
ICAgICAgICAgICAgICAgIG10ZF9kZXZpY2VfcGFyc2VfcmVnaXN0ZXIKICAgICAgICAgICAgICAg
ICAgIGFkZF9tdGRfZGV2aWNlCiAgICAgICAgICAgICAgICAgICAgIG11dGV4X2xvY2soJm10ZF90
YWJsZV9tdXRleCk7CiAgICAgICAgICAgICAgICAgICAgIGJsa3RyYW5zX25vdGlmeV9hZGQgICBu
b3QtPmFkZCgpCiAgICAgICAgICAgICAgICAgICAgICAgZnRsX2FkZF9tdGQgICAgIHRyLT5hZGRf
bXRkKCkKICAgICAgICAgICAgICAgICAgICAgICAgIHNjYW5faGVhZGVyCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG10ZF9yZWFkKHBhcnQtPm1iZC5tdGQsCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbXRkX3JlYWRfb29iCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnbHVl
YmlfcmVhZCAgIG10ZC0+cmVhZCgpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVi
aV9yZWFkKGdsdWViaS0+ZGVzYwogICAgICAgICAgICAgICAgICAgICBtdXRleF91bmxvY2soJm10
ZF90YWJsZV9tdXRleCk7Cgpsb2FkX21vZHVsZSBmdGwKICAgcmVnaXN0ZXJfbXRkX2Jsa3RyYW5z
CiAgICAgbXV0ZXhfbG9jaygmbXRkX3RhYmxlX211dGV4KTsKICAgICBmdGxfYWRkX210ZCAgbm90
LT5hZGQoKQogICAgICAgc2Nhbl9oZWFkZXIKICAgICAgICAgbXRkX3JlYWQocGFydC0+bWJkLm10
ZCwKICAgICAgICAgICBtdGRfcmVhZF9vb2IKICAgICAgICAgICAgIGdsdWViaV9yZWFkICAgbXRk
LT5yZWFkKCkKICAgICAgICAgICAgICAgdWJpX3JlYWQoZ2x1ZWJpLT5kZXNjCiAgICAgbXV0ZXhf
dW5sb2NrKCZtdGRfdGFibGVfbXV0ZXgpOwoKVGhpcyBsb2NrIGlzIGFsc28gaGVsZCBkdXJpbmcg
dGhlIHByb2Nlc3Mgb2YgY2xvc2luZyB0aGUgZmlsZS4KCmNsb3NlKGZkKQogICBtdGRjaGFyX2Ns
b3NlCiAgICAgcHV0X210ZF9kZXZpY2UKICAgICAgIG11dGV4X2xvY2soJm10ZF90YWJsZV9tdXRl
eCk7CiAgICAgICBfX3B1dF9tdGRfZGV2aWNlCiAgICAgICAgIGdsdWViaV9wdXRfZGV2aWNlCiAg
ICAgICAgICAgdWJpX2Nsb3NlX3ZvbHVtZQogICAgICAgICAgICAga2ZyZWUoZGVzYykKICAgICAg
ICAgICAgIC8vIGRlc2MgPT0gTlVMTAogICAgICAgbXV0ZXhfdW5sb2NrKCZtdGRfdGFibGVfbXV0
ZXgpOwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
