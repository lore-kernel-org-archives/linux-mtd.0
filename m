Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B35FC25B47
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Oct 2023 03:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bX9TUDBk4H3WJpLFXw5ypBzS8x51ibzBmMEc0i+/t8E=; b=f27DgHI2a7/TvmM899faCC3KM6
	4BKoyN1+1ePApE/RFUHOn1K4cCNymAJzIXwPTlGfgfnM5ZUvjlXNUqRJxI7mCqKu/5CEKtIoQeywu
	A5gTPlUmBY8A4k0jV3TnGylDL2NEZtVylP5V8qpa4+PP8P89pK2XRdZ8aLd7t3LRwCX1tghSTSC5s
	/nuGMzgIKJaCupEtgNaVJgI1T05X5GD197R/x2/mKBe2KgK5k3DuWtJNo4v856+JEehtSN/waycKF
	W0Sbcd553+SKURwUSvSOZHyP6RpiAbIVNjFmgoUf+HLV926J11V24kydNzjoFOggi0OZa+TYYz9Jd
	LpPWtyFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwDS3-00FUzI-04;
	Fri, 27 Oct 2023 03:23:59 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwDRz-00FUxe-2b
	for linux-mtd@lists.infradead.org;
	Fri, 27 Oct 2023 03:23:58 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SGntn4ZhpzpWQB;
	Fri, 27 Oct 2023 11:18:41 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 27 Oct 2023 11:23:34 +0800
Subject: Re: [PATCH v3] mtd: Fix gluebi NULL pointer dereference caused by ftl
 notifier
To: ZhaoLong Wang <wangzhaolong1@huawei.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <Artem.Bityutskiy@nokia.com>,
	<dpervushin@embeddedalley.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>, <yangerkun@huawei.com>
References: <20231027012033.50280-1-wangzhaolong1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <04a142af-a4e6-bb2c-fb92-61fc1df8ed98@huawei.com>
Date: Fri, 27 Oct 2023 11:23:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20231027012033.50280-1-wangzhaolong1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_202356_033078_E1F420C7 
X-CRM114-Status: GOOD (  11.59  )
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

5ZyoIDIwMjMvMTAvMjcgOToyMCwgWmhhb0xvbmcgV2FuZyDlhpnpgZM6Cj4gSWYgYm90aCBmbHQu
a28gYW5kIGdsdWViaS5rbyBhcmUgbG9hZGVkLCB0aGUgbm90aWllciBvZiBmdGwKPiB0cmlnZ2Vy
cyBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2Ugd2hlbiB0cnlpbmcgdG8gYWNjZXNzCj4g4oCYZ2x1
ZWJpLT5kZXNj4oCZIGluIGdsdWViaV9yZWFkKCkuCj4KPiB1YmlfZ2x1ZWJpX2luaXQKPiAgICB1
YmlfcmVnaXN0ZXJfdm9sdW1lX25vdGlmaWVyCj4gICAgICB1YmlfZW51bWVyYXRlX3ZvbHVtZXMK
PiAgICAgICAgdWJpX25vdGlmeV9hbGwKPiAgICAgICAgICBnbHVlYmlfbm90aWZ5ICAgIG5iLT5u
b3RpZmllcl9jYWxsKCkKPiAgICAgICAgICAgIGdsdWViaV9jcmVhdGUKPiAgICAgICAgICAgICAg
bXRkX2RldmljZV9yZWdpc3Rlcgo+ICAgICAgICAgICAgICAgIG10ZF9kZXZpY2VfcGFyc2VfcmVn
aXN0ZXIKPiAgICAgICAgICAgICAgICAgIGFkZF9tdGRfZGV2aWNlCj4gICAgICAgICAgICAgICAg
ICAgIGJsa3RyYW5zX25vdGlmeV9hZGQgICBub3QtPmFkZCgpCj4gICAgICAgICAgICAgICAgICAg
ICAgZnRsX2FkZF9tdGQgICAgICAgICB0ci0+YWRkX210ZCgpCj4gICAgICAgICAgICAgICAgICAg
ICAgICBzY2FuX2hlYWRlcgo+ICAgICAgICAgICAgICAgICAgICAgICAgICBtdGRfcmVhZAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG10ZF9yZWFkX29vYgo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbXRkX3JlYWRfb29iX3N0ZAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBnbHVlYmlfcmVhZCAgIG10ZC0+cmVhZCgpCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZ2x1ZWJpLT5kZXNjIC0gTlVMTAo+Cj4gRGV0YWlsZWQgcmVwcm9kdWN0aW9uIGlu
Zm9ybWF0aW9uIGF2YWlsYWJsZSBhdCB0aGUgbGlua1sxXSwKPgo+IFRoZSBzb2x1dGlvbiBmb3Ig
dGhlIGdsdWViaSBtb2R1bGUgaXMgdG8gcnVuIGpmZnMyIG9uIHRoZSBVQkkKPiB2b2x1bWUgd2l0
aG91dCBjb25zaWRlcmluZyB3b3JraW5nIHdpdGggZnRsIG9yIG10ZGJsb2NrLlsyXS4KPiBUaGVy
ZWZvcmUsIHRoaXMgcHJvYmxlbSBjYW4gYmUgYXZvaWRlZCBieSBwcmV2ZW50aW5nIGdsdWViaQo+
IGZyb20gY3JlYXRpbmcgbXRkYmxvY2sgZGV2aWNlcy4KPgo+IEZpeGVzOiAyYmEzZDc2YTFlMjkg
KCJVQkk6IG1ha2UgZ2x1ZWJpIGEgc2VwYXJhdGUgbW9kdWxlIikKPiBMaW5rOiBodHRwczovL2J1
Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxNzk5MiBbMV0KPiBMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9sa21sLzQ0MTEwNzEwMC4yMzczNC4xNjk3OTA0NTgwMjUyLkph
dmFNYWlsLnppbWJyYUBub2QuYXQvIFsyXQo+IFNpZ25lZC1vZmYtYnk6IFpoYW9Mb25nIFdhbmcg
PHdhbmd6aGFvbG9uZzFAaHVhd2VpLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvbXRkL210ZF9ibGtk
ZXZzLmMgfCA0ICsrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2Vp
LmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
