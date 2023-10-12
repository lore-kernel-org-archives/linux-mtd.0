Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87116CDB465
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 02:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	CC:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=am2lYV590QxxfDWMA7rkAx8kTxIa0YCHZzGzyYHH+r4=; b=cWmA7XrRHXefdbv0qmHHHslGzj
	IAdBwjOpRwkUDpWrqXc5V3JE3+VvbsYMkRTfhFDz77xGy1cwC85f0IFim6ccVPSR5thXoZsBy5J7B
	CLoH1OUep/5m7euNEv9yJpQKkaRSbJY5UJinH+1hPLF3UlWpnKRkRrYSvqvBY5ha165Yq3fo7WfFn
	3tcFiuwGRQGZpQd9L17TqTQtWR7MB2b+RkcIuEgwiBFG2tPu2q8jj8qGOp5P5Q12PXLsqTHunSLtp
	HipGJFRIM2DLAUcZ2P7P9/m85Pn+mSHQdFFWVjMDDJTIKdlWTFl+0MAJk7W4Tzy7ULo6zQxlJSh88
	xgVaENbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqltn-00HEn1-0F;
	Thu, 12 Oct 2023 02:58:07 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqlti-00HEm5-1Z;
	Thu, 12 Oct 2023 02:58:04 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4S5Z4l2Jlpz1M98b;
	Thu, 12 Oct 2023 10:55:19 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 12 Oct 2023 10:57:52 +0800
Subject: Re: [PATCH v2 00/12] ubi: fastmap: Fix a series of wear leveling
 problems
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <linux-mtd@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <bagasdotme@gmail.com>
References: <20230828063845.3142561-1-chengzhihao1@huawei.com>
Message-ID: <ee01780b-f5ef-26c8-f632-3bc56cd46b96@huawei.com>
Date: Thu, 12 Oct 2023 10:57:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230828063845.3142561-1-chengzhihao1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_195802_873051_F128710F 
X-CRM114-Status: GOOD (  15.54  )
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

1NogMjAyMy84LzI4IDE0OjM4LCBaaGloYW8gQ2hlbmcg0LS1wDoKPiBUaGlzIHNlcmllcyBvZiBw
YXRjaGVzIGZpeCB0aHJlZSBwcm9ibGVtczoKPiAxLiBJbmNvbnNpc3RlbnQgZXJhc2UgY291bnRl
ciBmcm9tIHdsIGVudHJ5IGFuZCBkaXNrLCBmb3IgcGF0Y2hlcyAxfjQuCj4gMi4gU2FtZSBQRUIg
aXMgYWx3YXlzIHJlc3VlZCBmb3IgZmFzdG1hcCBkYXRhLCBmb3IgcGF0Y2hlcyA1fjkuCj4gMy4g
Rmlyc3QgNjQgUEVCcyBoYXZlIGxhcmdlIGVyYXNlIGNvdW50ZXIgdGhhbiBvdGhlcnMsIGZvciBw
YXRjaGVzIDEwfjEyLgo+IAo+IEJlc2lkZXMsIHBhdGNoZXMgNC81IGJyaW5nIGFuIGltcHJvdmVt
ZW50IG9mIHRoZSBVQkkgc2VydmljZSBsaWZlLgo+IAo+IFJlZ3Jlc3Npb24gdGVzdHMgYXJlIGlu
IFtMaW5rXS4KPiAKPiBMaW5rOiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcu
Y2dpP2lkPTIxNzc4Ny4KPiAKPiB2MS0+djI6Cj4gICAgUGF0Y2ggNjogQ2hhbmdlIHdhaXQgY29u
ZGl0aW9uIGluIHdhaXRfZnJlZV9wZWJzX2Zvcl9wb29sKCksIHRoZXJlIGFyZQo+IAkgICB0d28g
c2l0dWF0aW9ucyB0aGF0IGNhdXNlIHdhaXRpbmcgaW5maW5hdGVseToKPiAJICAgMS4gX19lcmFz
ZV93b3JrZXIgc2NoZWR1bGVzIGl0c2VsZiBpZiAtRUJVU1kgcmV0dXJuZWQgd2hlbgo+IAkgICAg
ICBzaHV0dGluZyBkb3duIHN5c3RlbS4KPiAJICAgMi4gVGhlICdtaW5fZXhwZWN0X2ZyZWUnIGNh
bm5vdCBiZSBzYXRpc2ZpZWQgd2hlbiBiYWQgYmxvY2sKPiAJICAgICAgb2NjdXJzIGFuZCB1Ymkg
YmVjb21lcyBybyhUaGUgZXJhc2VkIFBFQiBzaG91bGQgYmUgdGhlCj4gICAgICAgICAgICAgICAg
bGFzdCBvbmUgb2YgJ21pbl9leHBlY3RfZnJlZScsIGJ1dCBpdCBiZWNvbWVzIGJhZCBpbgo+IAkg
ICAgICBfX2VyYXNlX3dvcmtlcikuCj4gICBQUzogQWZ0ZXIgcmUtdGVzdGluZywgdGhlIHRlc3Rp
bmcgcmVzdWx0cyBpbiBbTGlua10gaXMgbm90IGFmZmVjdGVkLgo+IAoKSGksIFJpY2hhcmQuIEkg
aG9wZSB5b3UgY2FuIHRha2Ugc29tZSB0aW1lKHdoZW4geW91IGhhdmUgZnJlZSB0aW1lKSB0byAK
aGF2ZSBhIGdsYW5jZSBvZiB0aGlzIHNlcmllcyBvZiBwYXRjaGVzLCBJIGhhdmUgbWFkZSBzb21l
IHRlc3RzIG9uIAp2aXJ0dWFsIG1hY2hpbmUgZm9yIDIrIG1vbnRocyhhbmQgaGFsZiBtb250aCBm
b3IgcGh5c2ljYWwgbmFuZCBmbGFzaCksIApzbyBmYXIgdWJpIHdvcmtzIGZpbmUgd2l0aCBwYXRj
aGVzIGFwcGxpZWQuCgo+IAo+IFpoaWhhbyBDaGVuZyAoMTIpOgo+ICAgIHViaTogZmFzdG1hcDog
Rml4IG1pc3NlZCBlYyB1cGRhdGluZyBhZnRlciBlcmFzaW5nIG9sZCBmYXN0bWFwIGRhdGEKPiAg
ICAgIGJsb2NrCj4gICAgdWJpOiBmYXN0bWFwOiBlcmFzZV9ibG9jazogR2V0IGVyYXNlIGNvdW50
ZXIgZnJvbSB3bF9lbnRyeSByYXRoZXIgdGhhbgo+ICAgICAgZmxhc2gKPiAgICB1Ymk6IGZhc3Rt
YXA6IEFsbG9jYXRlIG1lbW9yeSB3aXRoIEdGUF9OT0ZTIGluIHViaV91cGRhdGVfZmFzdG1hcAo+
ICAgIHViaTogUmVwbGFjZSBlcmFzZV9ibG9jaygpIHdpdGggc3luY19lcmFzZSgpCj4gICAgdWJp
OiBmYXN0bWFwOiBVc2UgZnJlZSBwZWJzIHJlc2VydmVkIGZvciBiYWQgYmxvY2sgaGFuZGxpbmcK
PiAgICB1Ymk6IGZhc3RtYXA6IFdhaXQgdW50aWwgdGhlcmUgYXJlIGVub3VnaCBmcmVlIFBFQnMg
YmVmb3JlIGZpbGxpbmcKPiAgICAgIHBvb2xzCj4gICAgdWJpOiBmYXN0bWFwOiBSZW1vdmUgdW5u
ZWVkZWQgYnJlYWsgY29uZGl0aW9uIHdoaWxlIGZpbGxpbmcgcG9vbHMKPiAgICB1Ymk6IGZhc3Rt
YXA6IG1heV9yZXNlcnZlX2Zvcl9mbTogRG9uJ3QgcmVzZXJ2ZSBQRUIgaWYgZm1fYW5jaG9yCj4g
ICAgICBleGlzdHMKPiAgICB1Ymk6IGZhc3RtYXA6IEdldCB3bCBQRUIgZXZlbiBlYyBiZXlvbmRz
IHRoZSAnbWF4JyBpZiBmcmVlIFBFQnMgYXJlCj4gICAgICBydW4gb3V0Cj4gICAgdWJpOiBmYXN0
bWFwOiBGaXggbGFwc2VkIHdlYXIgbGV2ZWxpbmcgZm9yIGZpcnN0IDY0IFBFQnMKPiAgICB1Ymk6
IGZhc3RtYXA6IEFkZCBtb2R1bGUgcGFyYW1ldGVyIHRvIGNvbnRyb2wgcmVzZXJ2aW5nIGZpbGxp
bmcgcG9vbAo+ICAgICAgUEVCcwo+ICAgIHViaTogZmFzdG1hcDogQWRkIGNvbnRyb2wgaW4gJ1VC
SV9JT0NBVFQnIGlvY3RsIHRvIHJlc2VydmUgUEVCcyBmb3IKPiAgICAgIGZpbGxpbmcgcG9vbHMK
PiAKPiAgIGRyaXZlcnMvbXRkL3ViaS9idWlsZC5jICAgICAgfCAgMjUgKysrKysrKy0KPiAgIGRy
aXZlcnMvbXRkL3ViaS9jZGV2LmMgICAgICAgfCAgIDMgKy0KPiAgIGRyaXZlcnMvbXRkL3ViaS9l
YmEuYyAgICAgICAgfCAgIDMgLQo+ICAgZHJpdmVycy9tdGQvdWJpL2Zhc3RtYXAtd2wuYyB8IDEx
MiArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQo+ICAgZHJpdmVycy9tdGQvdWJp
L2Zhc3RtYXAuYyAgICB8ICA2NiArKystLS0tLS0tLS0tLS0tLS0tLS0KPiAgIGRyaXZlcnMvbXRk
L3ViaS91YmkuaCAgICAgICAgfCAgMTAgKysrLQo+ICAgZHJpdmVycy9tdGQvdWJpL3dsLmMgICAg
ICAgICB8ICA0OCArKysrKysrKystLS0tLS0KPiAgIGRyaXZlcnMvbXRkL3ViaS93bC5oICAgICAg
ICAgfCAgIDYgKy0KPiAgIGluY2x1ZGUvdWFwaS9tdGQvdWJpLXVzZXIuaCAgfCAgIDQgKy0KPiAg
IDkgZmlsZXMgY2hhbmdlZCwgMTY0IGluc2VydGlvbnMoKyksIDExMyBkZWxldGlvbnMoLSkKPiAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
