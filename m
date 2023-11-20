Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CAEC5AE5E
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Nov 2023 03:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+TPACNIo8eePDKHNOMpzKDX8x6PIPJObj2Q/GZe+Omw=; b=BMbtmyOYtHBSCk
	hdmZ2yOYUtv+2LVUCB+WT6x3dhMWMBlJlbYo2T3LbDV9DxR9jYQB8ahQVZn0mnPcPwSppT8JlYAve
	8rWYJn6Uo8BsaYZo3X31/Z/FtYn3JjCB472YuRKHjfcOpLNoh/DQIax1cJ1oBr2C3PYDqCJX2kVil
	GrVJWrMapEhHDvE4TtQBuZFS7MgDTi9abLS7xdu9PEubrvmWUa6rynALZbwkhpaVHqSlIgoGKBSeN
	t6+sybMnix2aoc4DFOxTnneoi60zPepMcXcejj/CjMxQMpRI3yuRCDtCnKrgwvuMBVerzbg74Mb4a
	XsXs5r6ZOzIJUyUeOJAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4upU-00B0sc-0i;
	Mon, 20 Nov 2023 03:20:08 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4upO-00B0ou-1r
	for linux-mtd@lists.infradead.org;
	Mon, 20 Nov 2023 03:20:05 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4SYXj30Chkz1P6j8;
	Mon, 20 Nov 2023 11:16:23 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 Nov
 2023 11:19:48 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <Carson.Li1@unisoc.com>, <s.hauer@pengutronix.de>,
	<houtao1@huawei.com>, <ext-adrian.hunter@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] ubifs: ubifs_tnc_locate: Drop TNC mutex lockless reading path
Date: Mon, 20 Nov 2023 19:13:46 +0800
Message-ID: <20231120111347.2254153-3-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120111347.2254153-1-chengzhihao1@huawei.com>
References: <20231120111347.2254153-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_192003_001180_8D8AC18C 
X-CRM114-Status: GOOD (  12.33  )
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

VGhpcyBwcm9ibGVtIGlzIGRlc2NyaWJlZCBpbiBbMV0sIGFuZCBUYW8gaGFzIHByb3Bvc2VkIGEg
c29sdXRpb24gaW4gWzJdLgpUaGVyZSBleGlzdHMgYSByYWNlIGJldHdlZW4gbm9kZSByZWFkaW5n
IGFuZCBnYywgd2hpY2ggaXMgc2hvd24gYXM6CiAgICAgICAgIFAxICAgICAgICAgICAgICAgICBQ
Mgp1Ymlmc190bmNfbG9jYXRlCiB6YnIubG51bSA9IGxudW1fYQogICAgICAgICAgICAgICAgICAg
ICAgICAgR0MgLy8gbm9kZSBpcyBtb3ZlZCBmcm9tIGxudW1fYSB0byBsbnVtX2IKCQkJIGpvdXJu
YWwgaGVhZCBzd2l0Y2hpbmcgLy8gbG51bV9hIGJlY29tZXMgYSBidWQKIHViaWZzX2dldF93YnVm
KGMsIHpici5sbnVtKSAvLyB0cnVlCiB1Ymlmc190bmNfcmVhZF9ub2RlCiAgdWJpZnNfcmVhZF9u
b2RlX3didWYgLy8gcmVhZCBkYXRhIGZyb20gbG51bV9hCiAgY2hlY2sgbm9kZSBmYWlsZWQgIQoK
VGhlcmUgYXJlIHR3byB3YXlzIG9mIHJlYWRpbmcgbm9kZShTZWUgdWJpZnNfdG5jX3JlYWRfbm9k
ZSgpKToKMS4gUmVhZGluZyBmcm9tIHdidWYuIFRoZSBub2RlIGlzIHdyaXR0ZW4gaW4gd2J1Zihp
biBtZW0pLCBhbmQgd2J1ZiBpcwogICBub3Qgd3JpdHRlbiBiYWNrIHRvIGZsYXNoLgoyLiBPdGhl
cndpc2UsIHJlYWRpbmcgZnJvbSBmbGFzaC4KCkluIG1vc3QgY2FzZXMsIHViaWZzX3RuY19yZWFk
X25vZGUoKSBpcyBpbnZva2VkIHdpdGggVE5DIG11dGV4IGxvY2tlZCwKYnV0IGV4Y2VwdCB0aGUg
bG9ja2xlc3MgcGF0aCBpbiB1Ymlmc190bmNfbG9jYXRlKCkgd2hpY2ggaXMgaW1wb3J0ZWQKYnkg
Y29tbWl0IDYwMWMwYmM0Njc1MygiVUJJRlM6IGFsbG93IGZvciByYWNpbmcgYmV0d2VlbiBHQyBh
bmQgVE5DIikuCgpGdW5jdGlvbiB1Ymlmc190bmNfbG9jYXRlKCkgaXMgbWFpbmx5IHVzZWQgZm9y
IHBhdGggbG9va3VwIGFuZCBmaWxlCnJlYWRpbmcsIFZGUyBoYXMgaW5vZGUvZGVudHJ5L3BhZ2Ug
Y2FjaGUgZm9yIG11bHRpcGxlIHRpbWVzIHJlYWRpbmcsIHRoZQpsb2NrbGVzcyBvcHRpbWl6YXRp
b24gb25seSB3b3JrcyBmb3IgZmlyc3QgcmVhZGluZy4gQmFzZWQgb24gdGhlCmRpc2N1c3Npb24g
aW4gWzJdLCB0aGlzIHBhdGNoIHNpbXBseSBkcm9wcyB0aGUgVE5DIG11dGV4IGxvY2tsZXNzIHJl
YWRpbmcKcGF0aCBpbiB1Ymlmc190bmNfbG9jYXRlKCkuCgpGZXRjaCBhIHJlcHJvZHVjZXIgaW4g
WzNdLgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9mZGE4NDkyNi0wOWQxLTFmYzct
NGI3OC05OWUwZDA0NTA4YmNAaHVhd2VpLmNvbS9ULwpbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtbXRkLzIwMjAwMzA1MDkyMjA1LjEyNzc1OC0xLWhvdXRhbzFAaHVhd2VpLmNvbS8K
WzNdIGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE4MTYzCgpG
aXhlczogNjAxYzBiYzQ2NzUzICgiVUJJRlM6IGFsbG93IGZvciByYWNpbmcgYmV0d2VlbiBHQyBh
bmQgVE5DIikKRml4ZXM6IDFlNTE3NjRhM2MyYSAoIlVCSUZTOiBhZGQgbmV3IGZsYXNoIGZpbGUg
c3lzdGVtIikKUmVwb3J0ZWQtYnk6IOadjuWCsuWCsiAoQ2Fyc29uIExpMS85NTQyKSA8Q2Fyc29u
LkxpMUB1bmlzb2MuY29tPgpBbmFseXplZC1ieTogSG91IFRhbyA8aG91dGFvMUBodWF3ZWkuY29t
PgpTaWduZWQtb2ZmLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgot
LS0KIGZzL3ViaWZzL3RuYy5jIHwgMzEgKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZnMvdWJpZnMvdG5jLmMgYi9mcy91Ymlmcy90bmMuYwppbmRleCBmNDcyOGU2NWQxYmQu
LjdiN2Q3NWVkM2VjNyAxMDA2NDQKLS0tIGEvZnMvdWJpZnMvdG5jLmMKKysrIGIvZnMvdWJpZnMv
dG5jLmMKQEAgLTE0NzgsMTEgKzE0NzgsMTAgQEAgc3RhdGljIGludCBtYXliZV9sZWJfZ2NlZChz
dHJ1Y3QgdWJpZnNfaW5mbyAqYywgaW50IGxudW0sIGludCBnY19zZXExKQogaW50IHViaWZzX3Ru
Y19sb2NhdGUoc3RydWN0IHViaWZzX2luZm8gKmMsIGNvbnN0IHVuaW9uIHViaWZzX2tleSAqa2V5
LAogCQkgICAgIHZvaWQgKm5vZGUsIGludCAqbG51bSwgaW50ICpvZmZzKQogewotCWludCBmb3Vu
ZCwgbiwgZXJyLCBzYWZlbHkgPSAwLCBnY19zZXExOworCWludCBmb3VuZCwgbiwgZXJyOwogCXN0
cnVjdCB1Ymlmc196bm9kZSAqem5vZGU7Ci0Jc3RydWN0IHViaWZzX3picmFuY2ggemJyLCAqenQ7
CisJc3RydWN0IHViaWZzX3picmFuY2ggKnp0OwogCi1hZ2FpbjoKIAltdXRleF9sb2NrKCZjLT50
bmNfbXV0ZXgpOwogCWZvdW5kID0gdWJpZnNfbG9va3VwX2xldmVsMChjLCBrZXksICZ6bm9kZSwg
Jm4pOwogCWlmICghZm91bmQpIHsKQEAgLTE1MDUsMzEgKzE1MDQsNyBAQCBpbnQgdWJpZnNfdG5j
X2xvY2F0ZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgY29uc3QgdW5pb24gdWJpZnNfa2V5ICprZXks
CiAJCWVyciA9IHRuY19yZWFkX2hhc2hlZF9ub2RlKGMsIHp0LCBub2RlKTsKIAkJZ290byBvdXQ7
CiAJfQotCWlmIChzYWZlbHkpIHsKLQkJZXJyID0gdWJpZnNfdG5jX3JlYWRfbm9kZShjLCB6dCwg
bm9kZSk7Ci0JCWdvdG8gb3V0OwotCX0KLQkvKiBEcm9wIHRoZSBUTkMgbXV0ZXggcHJlbWF0dXJl
bHkgYW5kIHJhY2Ugd2l0aCBnYXJiYWdlIGNvbGxlY3Rpb24gKi8KLQl6YnIgPSB6bm9kZS0+emJy
YW5jaFtuXTsKLQlnY19zZXExID0gYy0+Z2Nfc2VxOwotCW11dGV4X3VubG9jaygmYy0+dG5jX211
dGV4KTsKLQotCWlmICh1Ymlmc19nZXRfd2J1ZihjLCB6YnIubG51bSkpIHsKLQkJLyogV2UgZG8g
bm90IEdDIGpvdXJuYWwgaGVhZHMgKi8KLQkJZXJyID0gdWJpZnNfdG5jX3JlYWRfbm9kZShjLCAm
emJyLCBub2RlKTsKLQkJcmV0dXJuIGVycjsKLQl9Ci0KLQllcnIgPSBmYWxsaWJsZV9yZWFkX25v
ZGUoYywga2V5LCAmemJyLCBub2RlKTsKLQlpZiAoZXJyIDw9IDAgfHwgbWF5YmVfbGViX2djZWQo
YywgemJyLmxudW0sIGdjX3NlcTEpKSB7Ci0JCS8qCi0JCSAqIFRoZSBub2RlIG1heSBoYXZlIGJl
ZW4gR0MnZWQgb3V0IGZyb20gdW5kZXIgdXMgc28gdHJ5IGFnYWluCi0JCSAqIHdoaWxlIGtlZXBp
bmcgdGhlIFROQyBtdXRleCBsb2NrZWQuCi0JCSAqLwotCQlzYWZlbHkgPSAxOwotCQlnb3RvIGFn
YWluOwotCX0KLQlyZXR1cm4gMDsKKwllcnIgPSB1Ymlmc190bmNfcmVhZF9ub2RlKGMsIHp0LCBu
b2RlKTsKIAogb3V0OgogCW11dGV4X3VubG9jaygmYy0+dG5jX211dGV4KTsKLS0gCjIuMzkuMgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
