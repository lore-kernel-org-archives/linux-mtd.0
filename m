Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A134DC41535
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Dec 2023 02:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VCOwZmumFEzcnVjvD2CcWMxUdEkQJuDtrGREAyL9jMI=; b=ely//Hj4+jBqrz
	pEW3fYZxl4/pskeOUNSzdilvIU/Mk1adV81RiKTzSstbsFLbwA5L8KuCeIQQGEGDHADh9f37mmPyA
	/ifQWQntTKQfrq9yJ+pREGzxiSL59WheK2sUgC2jNfgxBUvqYJcOIdUf/1ji4Gm2jx7I0jBqHwbFT
	75NvBmAdn8JAERTtxLNUoyz8sHepZjUcZVzfFnTkl8AVdQyqP9SFI5sMCet67eh9D2FZznairFDIl
	5k23SuZUDO2jWpBPeDjQPps8ZiSXECi9ZPiKDBuMFm+cMYrNtMyiMXgd8SO4KCGQf5Xqdm/chBKEU
	kIkfnGpR9zaoeQrB3OUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFmYE-00FzTL-1q;
	Wed, 20 Dec 2023 02:43:14 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFmY9-00FzSu-0l
	for linux-mtd@lists.infradead.org;
	Wed, 20 Dec 2023 02:43:12 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4SvyXR18DQz1wnwQ;
	Wed, 20 Dec 2023 10:42:47 +0800 (CST)
Received: from dggpemd200001.china.huawei.com (unknown [7.185.36.224])
	by mail.maildlp.com (Postfix) with ESMTPS id 6CE0F140412;
	Wed, 20 Dec 2023 10:43:01 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpemd200001.china.huawei.com
 (7.185.36.224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1258.28; Wed, 20 Dec
 2023 10:43:00 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<dpervushin@embeddedalley.com>, <Artem.Bityutskiy@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>,
	<yangerkun@huawei.com>
Subject: [PATCH V4] mtd: Fix gluebi NULL pointer dereference caused by ftl notifier
Date: Wed, 20 Dec 2023 10:46:19 +0800
Message-ID: <20231220024619.2138625-1-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemd200001.china.huawei.com (7.185.36.224)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_184309_467381_056FBF66 
X-CRM114-Status: GOOD (  12.12  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SWYgYm90aCBmdGwua28gYW5kIGdsdWViaS5rbyBhcmUgbG9hZGVkLCB0aGUgbm90aWZpZXIgb2Yg
ZnRsCnRyaWdnZXJzIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSB3aGVuIHRyeWluZyB0byBhY2Nl
c3MK4oCYZ2x1ZWJpLT5kZXNj4oCZIGluIGdsdWViaV9yZWFkKCkuCgp1YmlfZ2x1ZWJpX2luaXQK
ICB1YmlfcmVnaXN0ZXJfdm9sdW1lX25vdGlmaWVyCiAgICB1YmlfZW51bWVyYXRlX3ZvbHVtZXMK
ICAgICAgdWJpX25vdGlmeV9hbGwKICAgICAgICBnbHVlYmlfbm90aWZ5ICAgIG5iLT5ub3RpZmll
cl9jYWxsKCkKICAgICAgICAgIGdsdWViaV9jcmVhdGUKICAgICAgICAgICAgbXRkX2RldmljZV9y
ZWdpc3RlcgogICAgICAgICAgICAgIG10ZF9kZXZpY2VfcGFyc2VfcmVnaXN0ZXIKICAgICAgICAg
ICAgICAgIGFkZF9tdGRfZGV2aWNlCiAgICAgICAgICAgICAgICAgIGJsa3RyYW5zX25vdGlmeV9h
ZGQgICBub3QtPmFkZCgpCiAgICAgICAgICAgICAgICAgICAgZnRsX2FkZF9tdGQgICAgICAgICB0
ci0+YWRkX210ZCgpCiAgICAgICAgICAgICAgICAgICAgICBzY2FuX2hlYWRlcgogICAgICAgICAg
ICAgICAgICAgICAgICBtdGRfcmVhZAogICAgICAgICAgICAgICAgICAgICAgICAgIG10ZF9yZWFk
X29vYgogICAgICAgICAgICAgICAgICAgICAgICAgICAgbXRkX3JlYWRfb29iX3N0ZAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBnbHVlYmlfcmVhZCAgIG10ZC0+cmVhZCgpCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZ2x1ZWJpLT5kZXNjIC0gTlVMTAoKRGV0YWlsZWQgcmVw
cm9kdWN0aW9uIGluZm9ybWF0aW9uIGF2YWlsYWJsZSBhdCB0aGUgTGluayBbMV0sCgpJbiB0aGUg
bm9ybWFsIGNhc2UsIG9idGFpbiBnbHVlYmktPmRlc2MgaW4gdGhlIGdsdWViaV9nZXRfZGV2aWNl
KCksCmFuZCBhY2Nlc3MgZ2x1ZWJpLT5kZXNjIGluIHRoZSBnbHVlYmlfcmVhZCgpLiBIb3dldmVy
LApnbHVlYmlfZ2V0X2RldmljZSgpIGlzIG5vdCBleGVjdXRlZCBpbiBhZHZhbmNlIGluIHRoZQpm
dGxfYWRkX210ZCgpIHByb2Nlc3MsIHdoaWNoIGxlYWRzIHRvIE5VTEwgcG9pbnRlciBkZXJlZmVy
ZW5jZS4KClRoZSBzb2x1dGlvbiBmb3IgdGhlIGdsdWViaSBtb2R1bGUgaXMgdG8gcnVuIGpmZnMy
IG9uIHRoZSBVQkkKdm9sdW1lIHdpdGhvdXQgY29uc2lkZXJpbmcgd29ya2luZyB3aXRoIGZ0bCBv
ciBtdGRibG9jayBbMl0uClRoZXJlZm9yZSwgdGhpcyBwcm9ibGVtIGNhbiBiZSBhdm9pZGVkIGJ5
IHByZXZlbnRpbmcgZ2x1ZWJpIGZyb20KY3JlYXRpbmcgdGhlIG10ZGJsb2NrIGRldmljZSBhZnRl
ciBjcmVhdGluZyBtdGQgcGFydGl0aW9uIG9mIHRoZQp0eXBlIE1URF9VQklWT0xVTUUuCgpGaXhl
czogMmJhM2Q3NmExZTI5ICgiVUJJOiBtYWtlIGdsdWViaSBhIHNlcGFyYXRlIG1vZHVsZSIpCkxp
bms6IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE3OTkyIFsx
XQpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzQ0MTEwNzEwMC4yMzczNC4xNjk3
OTA0NTgwMjUyLkphdmFNYWlsLnppbWJyYUBub2QuYXQvIFsyXQpTaWduZWQtb2ZmLWJ5OiBaaGFv
TG9uZyBXYW5nIDx3YW5nemhhb2xvbmcxQGh1YXdlaS5jb20+ClJldmlld2VkLWJ5OiBaaGloYW8g
Q2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgpBY2tlZC1ieTogUmljaGFyZCBXZWluYmVy
Z2VyIDxyaWNoYXJkQG5vZC5hdD4KLS0tCiBkcml2ZXJzL210ZC9tdGRfYmxrZGV2cy5jIHwgNCAr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmMgYi9kcml2ZXJzL210ZC9tdGRfYmxr
ZGV2cy5jCmluZGV4IGZmMTg2MzZlMDg4OS4uNWJjMzIxMDhjYTAzIDEwMDY0NAotLS0gYS9kcml2
ZXJzL210ZC9tdGRfYmxrZGV2cy5jCisrKyBiL2RyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmMKQEAg
LTQ2Myw3ICs0NjMsNyBAQCBzdGF0aWMgdm9pZCBibGt0cmFuc19ub3RpZnlfYWRkKHN0cnVjdCBt
dGRfaW5mbyAqbXRkKQogewogCXN0cnVjdCBtdGRfYmxrdHJhbnNfb3BzICp0cjsKIAotCWlmICht
dGQtPnR5cGUgPT0gTVREX0FCU0VOVCkKKwlpZiAobXRkLT50eXBlID09IE1URF9BQlNFTlQgfHwg
bXRkLT50eXBlID09IE1URF9VQklWT0xVTUUpCiAJCXJldHVybjsKIAogCWxpc3RfZm9yX2VhY2hf
ZW50cnkodHIsICZibGt0cmFuc19tYWpvcnMsIGxpc3QpCkBAIC01MDMsNyArNTAzLDcgQEAgaW50
IHJlZ2lzdGVyX210ZF9ibGt0cmFucyhzdHJ1Y3QgbXRkX2Jsa3RyYW5zX29wcyAqdHIpCiAJbXV0
ZXhfbG9jaygmbXRkX3RhYmxlX211dGV4KTsKIAlsaXN0X2FkZCgmdHItPmxpc3QsICZibGt0cmFu
c19tYWpvcnMpOwogCW10ZF9mb3JfZWFjaF9kZXZpY2UobXRkKQotCQlpZiAobXRkLT50eXBlICE9
IE1URF9BQlNFTlQpCisJCWlmIChtdGQtPnR5cGUgIT0gTVREX0FCU0VOVCAmJiBtdGQtPnR5cGUg
IT0gTVREX1VCSVZPTFVNRSkKIAkJCXRyLT5hZGRfbXRkKHRyLCBtdGQpOwogCW11dGV4X3VubG9j
aygmbXRkX3RhYmxlX211dGV4KTsKIAlyZXR1cm4gMDsKLS0gCjIuMzEuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
