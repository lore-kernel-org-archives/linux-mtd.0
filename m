Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882C8CD8C8E
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Oct 2023 14:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K+4Ki0uS5eRuwb6Z8TmvbWmFdZxcqRPzk75wzINnBjk=; b=XU4Y1KrW/NaRgp
	9B2NPeQa8PcfC5dmMGdWZz4F2gpcZOj1oNiG+oT7pFIo+tezX5k9pAODiPwOr1/OK4OhciUNAeFr4
	t3UpKVQEHyzuBwEcfcMZCAwkrFqwXEA44RDtn5XvfkWJhVNxA/1lOBR00dDjC3ObBgFpsflFmEpey
	lGoUD0ibubEFCyoF5j43knauQVzBRbHFnT+14JAmKK9rVDy6OqZsd8KMfwP8lTVLCOLhPDoJqNjT7
	o9r1hclgxMBFj/NX494hsPnFo1liln3Ois0oCIWaNShYBH5EnKrVQ79qP6go+6Hc6SQY4TfnHDCvG
	Au4xDybHXZ6pmkuCMgCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqDfg-00DYdH-2N;
	Tue, 10 Oct 2023 14:25:16 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqDfR-00DYc4-36
	for linux-mtd@lists.infradead.org;
	Tue, 10 Oct 2023 14:25:04 +0000
Received: from dggpemm500009.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4S4dMW62kfztTGK;
	Tue, 10 Oct 2023 22:19:51 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 10 Oct
 2023 22:24:27 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>,
	<yangerkun@huawei.com>
Subject: [PATCH RFC] ubi: gluebi: Fix NULL pointer dereference caused by ftl notifier
Date: Tue, 10 Oct 2023 22:29:25 +0800
Message-ID: <20231010142925.545238-1-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_072502_181749_D46332DD 
X-CRM114-Status: GOOD (  11.92  )
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

SWYgYm90aCBmbHQua28gYW5kIGdsdWViaS5rbyBhcmUgbG9hZGVkLCB0aGUgbm90aWllciBvZiBm
dGwKdHJpZ2dlcnMgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIHdoZW4gdHJ5aW5nIHRvIHZpc2l0
CuKAmGdsdWViaS0+ZGVzY+KAmSBpbiBnbHVlYmlfcmVhZCgpLgoKdWJpX2dsdWViaV9pbml0CiAg
dWJpX3JlZ2lzdGVyX3ZvbHVtZV9ub3RpZmllcgogICAgdWJpX2VudW1lcmF0ZV92b2x1bWVzCiAg
ICAgIHViaV9ub3RpZnlfYWxsCiAgICAgICAgZ2x1ZWJpX25vdGlmeSAgICBuYi0+bm90aWZpZXJf
Y2FsbCgpCiAgICAgICAgICBnbHVlYmlfY3JlYXRlCiAgICAgICAgICAgIG10ZF9kZXZpY2VfcmVn
aXN0ZXIKICAgICAgICAgICAgICBtdGRfZGV2aWNlX3BhcnNlX3JlZ2lzdGVyCiAgICAgICAgICAg
ICAgICBhZGRfbXRkX2RldmljZQogICAgICAgICAgICAgICAgICBibGt0cmFuc19ub3RpZnlfYWRk
ICAgbm90LT5hZGQoKQogICAgICAgICAgICAgICAgICAgIGZ0bF9hZGRfbXRkICAgICAgICAgdHIt
PmFkZF9tdGQoKQogICAgICAgICAgICAgICAgICAgICAgc2Nhbl9oZWFkZXIKICAgICAgICAgICAg
ICAgICAgICAgICAgbXRkX3JlYWQKICAgICAgICAgICAgICAgICAgICAgICAgICBtdGRfcmVhZAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgbXRkX3JlYWRfb29iCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGdsdWViaV9yZWFkICAgbXRkLT5yZWFkKCkKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBnbHVlYmktPmRlc2MgLSBOVUxMCgpEZXRhaWxlZCByZXByb2R1Y3Rpb24g
aW5mb3JtYXRpb24gYXZhaWxhYmxlIGF0IHRoZSBsaW5rWzFdLAoKSW4gdGhlIG5vcm1hbCBjYXNl
LCBvYnRhaW4gZ2x1ZWJpLT5kZXNjIGluIHRoZSBnbHVlYmlfZ2V0X2RldmljZSgpLAphbmQgYWNj
ZXNzZXMgZ2x1ZWJpLT5kZXNjIGluIHRoZSBnbHVlYmlfcmVhZCgpLiBIb3dldmVyLApnbHVlYmlf
Z2V0X2RldmljZSgpIGlzIG5vdCBleGVjdXRlZCBpbiBhZHZhbmNlIGluIHRoZQpmdGxfYWRkX210
ZCgpIHByb2Nlc3MsIHdoaWNoIGxlYWRzIHRvIG51bGwgcG9pbnRlciBkZXJlZmVyZW5jZS4KClRo
aXMgcGF0Y2ggYXNzdW1lcyB0aGF0IHRoZSBnbHVlYmkgbW9kdWxlIGlzIG5vdCBkZXNpZ25lZCB0
byB3b3JrIHdpdGgKdGhlIGZ0bCBtb2R1bGUuIEluIHRoaXMgY2FzZSwgdGhlIHBhdGNoIG9ubHkg
bmVlZHMgdG8gcHJldmVudCB0aGUgZnRsCm5vdGlmaWVyIG9wZXJhdGlvbi4KCkFkZCBzb21lIGNv
cnJlY3RuZXNzIGNoZWNrIGZvciBnbHVlYmktPmRlc2MgaW4gZ2x1ZWJpX3JlYWQvd3JpdGUvZXJh
c2UoKSwKSWYgdGhlIHBvaW50ZXIgaXMgaW52YWxpZCwgdGhlIC1FSU5WQUwgaXMgcmV0dXJuZWQu
CgpMaW5rOiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxNzk5
MiBbMV0KU2lnbmVkLW9mZi1ieTogWmhhb0xvbmcgV2FuZyA8d2FuZ3poYW9sb25nMUBodWF3ZWku
Y29tPgotLS0KIGRyaXZlcnMvbXRkL3ViaS9nbHVlYmkuYyB8IDggKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91YmkvZ2x1
ZWJpLmMgYi9kcml2ZXJzL210ZC91YmkvZ2x1ZWJpLmMKaW5kZXggMWI5ODBkMTVkOWZiLi4xODll
Y2MwZWFjZDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL3ViaS9nbHVlYmkuYworKysgYi9kcml2
ZXJzL210ZC91YmkvZ2x1ZWJpLmMKQEAgLTE1Nyw2ICsxNTcsOSBAQCBzdGF0aWMgaW50IGdsdWVi
aV9yZWFkKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3QgZnJvbSwgc2l6ZV90IGxlbiwKIAlz
dHJ1Y3QgZ2x1ZWJpX2RldmljZSAqZ2x1ZWJpOwogCiAJZ2x1ZWJpID0gY29udGFpbmVyX29mKG10
ZCwgc3RydWN0IGdsdWViaV9kZXZpY2UsIG10ZCk7CisJaWYgKElTX0VSUl9PUl9OVUxMKGdsdWVi
aS0+ZGVzYykpCisJCXJldHVybiAtRUlOVkFMOworCiAJbG51bSA9IGRpdl91NjRfcmVtKGZyb20s
IG10ZC0+ZXJhc2VzaXplLCAmb2Zmcyk7CiAJYnl0ZXNfbGVmdCA9IGxlbjsKIAl3aGlsZSAoYnl0
ZXNfbGVmdCkgewpAQCAtMTk3LDYgKzIwMCw5IEBAIHN0YXRpYyBpbnQgZ2x1ZWJpX3dyaXRlKHN0
cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3QgdG8sIHNpemVfdCBsZW4sCiAJc3RydWN0IGdsdWVi
aV9kZXZpY2UgKmdsdWViaTsKIAogCWdsdWViaSA9IGNvbnRhaW5lcl9vZihtdGQsIHN0cnVjdCBn
bHVlYmlfZGV2aWNlLCBtdGQpOworCWlmIChJU19FUlJfT1JfTlVMTChnbHVlYmktPmRlc2MpKQor
CQlyZXR1cm4gLUVJTlZBTDsKKwogCWxudW0gPSBkaXZfdTY0X3JlbSh0bywgbXRkLT5lcmFzZXNp
emUsICZvZmZzKTsKIAogCWlmIChsZW4gJSBtdGQtPndyaXRlc2l6ZSB8fCBvZmZzICUgbXRkLT53
cml0ZXNpemUpCkBAIC0yNDIsNiArMjQ4LDggQEAgc3RhdGljIGludCBnbHVlYmlfZXJhc2Uoc3Ry
dWN0IG10ZF9pbmZvICptdGQsIHN0cnVjdCBlcmFzZV9pbmZvICppbnN0cikKIAlsbnVtID0gbXRk
X2Rpdl9ieV9lYihpbnN0ci0+YWRkciwgbXRkKTsKIAljb3VudCA9IG10ZF9kaXZfYnlfZWIoaW5z
dHItPmxlbiwgbXRkKTsKIAlnbHVlYmkgPSBjb250YWluZXJfb2YobXRkLCBzdHJ1Y3QgZ2x1ZWJp
X2RldmljZSwgbXRkKTsKKwlpZiAoSVNfRVJSX09SX05VTEwoZ2x1ZWJpLT5kZXNjKSkKKwkJcmV0
dXJuIC1FSU5WQUw7CiAKIAlmb3IgKGkgPSAwOyBpIDwgY291bnQgLSAxOyBpKyspIHsKIAkJZXJy
ID0gdWJpX2xlYl91bm1hcChnbHVlYmktPmRlc2MsIGxudW0gKyBpKTsKLS0gCjIuMzEuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
