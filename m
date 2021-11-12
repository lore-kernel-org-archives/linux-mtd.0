Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6DCC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 12:06:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0720860F0F
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 12:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0720860F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4VN0R1Xj/69gyoFJkO7Nz6Ru/oEYaPvPtEzDxOjbwgc=; b=cOGi+r1oICSA8J
	21CFHlrG2fA0RyJNUIuzcQJV2gxVV9YCj7NlMNGxBuGqcA5XCTCdHBihfv3Av5hhMP/m/Zyr9sZF9
	A2SDaWwH/jhkslEQP5GebqBRhRmYA7CYOHx7UVbyauRvBewBoZ52Z+kY82s4v/VzglSIbz3YtBbXu
	zW4fCms7IWwP1mGj/5DuuUqEtHDQs/rTceW/ygfEhFvQueyPydjnp8JKC5J3cnvI+pHdXnZnrtWo1
	XWYMITIn5EEry0zoo5PZyaY9DF7csXUtHjyP+GZyuqywxrSJcr+dReBXaeedYHkVGDb8y5Nr2UQpr
	XULrMh7GV7thIu/h5pyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlVJU-00ADJQ-Qz; Fri, 12 Nov 2021 12:05:48 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlVJP-00ADEW-KI
 for linux-mtd@lists.infradead.org; Fri, 12 Nov 2021 12:05:47 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HrHN16V0Tz913k;
 Fri, 12 Nov 2021 20:05:21 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Fri, 12 Nov 2021 20:05:33 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 12 Nov
 2021 20:05:32 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <s.hauer@pengutronix.de>, <miquel.raynal@bootlin.com>,
 <vigneshr@ti.com>, <mcoquelin.stm32@gmail.com>,
 <kirill.shutemov@linux.intel.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>
Subject: [PATCH v3 02/12] ubifs: Fix deadlock in concurrent rename whiteout
 and inode writeback
Date: Fri, 12 Nov 2021 20:17:48 +0800
Message-ID: <20211112121758.2208727-3-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112121758.2208727-1-chengzhihao1@huawei.com>
References: <20211112121758.2208727-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_040544_027013_EA653426 
X-CRM114-Status: UNSURE (   9.67  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Rm9sbG93aW5nIGh1bmcgdGFza3M6ClsgICA3Ny4wMjg3NjRdIHRhc2s6a3dvcmtlci91ODo0ICAg
IHN0YXRlOkQgc3RhY2s6ICAgIDAgcGlkOiAgMTMyClsgICA3Ny4wMjg4MjBdIENhbGwgVHJhY2U6
ClsgICA3Ny4wMjkwMjddICBzY2hlZHVsZSsweDhjLzB4MWIwClsgICA3Ny4wMjkwNjddICBtdXRl
eF9sb2NrKzB4NTAvMHg2MApbICAgNzcuMDI5MDc0XSAgdWJpZnNfd3JpdGVfaW5vZGUrMHg2OC8w
eDFmMCBbdWJpZnNdClsgICA3Ny4wMjkxMTddICBfX3dyaXRlYmFja19zaW5nbGVfaW5vZGUrMHg0
M2MvMHg1NzAKWyAgIDc3LjAyOTEyOF0gIHdyaXRlYmFja19zYl9pbm9kZXMrMHgyNTkvMHg3NDAK
WyAgIDc3LjAyOTE0OF0gIHdiX3dyaXRlYmFjaysweDEwNy8weDRkMApbICAgNzcuMDI5MTYzXSAg
d2Jfd29ya2ZuKzB4MTYyLzB4N2IwCgpbICAgOTIuMzkwNDQyXSB0YXNrOmFhICAgICAgICAgICAg
ICBzdGF0ZTpEIHN0YWNrOiAgICAwIHBpZDogMTUwNgpbICAgOTIuMzkwNDQ4XSBDYWxsIFRyYWNl
OgpbICAgOTIuMzkwNDU4XSAgc2NoZWR1bGUrMHg4Yy8weDFiMApbICAgOTIuMzkwNDYxXSAgd2Jf
d2FpdF9mb3JfY29tcGxldGlvbisweDgyLzB4ZDAKWyAgIDkyLjM5MDQ2OV0gIF9fd3JpdGViYWNr
X2lub2Rlc19zYl9ucisweGIyLzB4MTEwClsgICA5Mi4zOTA0NzJdICB3cml0ZWJhY2tfaW5vZGVz
X3NiX25yKzB4MTQvMHgyMApbICAgOTIuMzkwNDc2XSAgdWJpZnNfYnVkZ2V0X3NwYWNlKzB4NzA1
LzB4ZGQwIFt1Ymlmc10KWyAgIDkyLjM5MDUwM10gIGRvX3JlbmFtZS5jb2xkKzB4N2YvMHgxODcg
W3ViaWZzXQpbICAgOTIuMzkwNTQ5XSAgdWJpZnNfcmVuYW1lKzB4OGIvMHgxODAgW3ViaWZzXQpb
ICAgOTIuMzkwNTcxXSAgdmZzX3JlbmFtZSsweGRiMi8weDExNzAKWyAgIDkyLjM5MDU4MF0gIGRv
X3JlbmFtZWF0MisweDU1NC8weDc3MAoKLCBhcmUgY2F1c2VkIGJ5IGNvbmN1cnJlbnQgcmVuYW1l
IHdoaXRlb3V0IGFuZCBpbm9kZSB3cml0ZWJhY2sgcHJvY2Vzc2VzOgoJcmVuYW1lX3doaXRlb3V0
KFRocmVhZCAxKQkgICAgICAgIHdiX3dvcmtmbihUaHJlYWQyKQp1Ymlmc19yZW5hbWUKICBkb19y
ZW5hbWUKICAgIGxvY2tfNF9pbm9kZXMgKEhvbGQgdWlfbXV0ZXgpCiAgICB1Ymlmc19idWRnZXRf
c3BhY2UKICAgICAgbWFrZV9mcmVlX3NwYWNlCiAgICAgICAgc2hyaW5rX2xpYWJpbGl0eQoJICBf
X3dyaXRlYmFja19pbm9kZXNfc2JfbnIKCSAgICBiZGlfc3BsaXRfd29ya190b193YnMgKFF1ZXVl
IG5ldyB3YiB3b3JrKQoJCQkJCSAgICAgIHdiX2RvX3dyaXRlYmFjayh3YiB3b3JrKQoJCQkJCQlf
X3dyaXRlYmFja19zaW5nbGVfaW5vZGUKCQkJCQkgICAgICAgICAgdWJpZnNfd3JpdGVfaW5vZGUK
CQkJCQkgICAgICAgICAgICBMT0NLKHVpX211dGV4KQoJCQkJCQkJICAg4oaRCgkgICAgICB3Yl93
YWl0X2Zvcl9jb21wbGV0aW9uIChXYWl0IHdiIHdvcmspIDwtLSBkZWFkbG9jayEKClJlcHJvZHVj
ZXIgKERldGFpbCBwcm9ncmFtIGluIFtMaW5rXSk6CiAgMS4gU1lTX3JlbmFtZWF0MigiL21wL2Rp
ci9maWxlIiwgIi9tcC9kaXIvd2hpdGVvdXQiLCBSRU5BTUVfV0hJVEVPVVQpCiAgMi4gQ29uc3Vt
ZSBvdXQgb2Ygc3BhY2UgYmVmb3JlIGtlcm5lbChtZGVsYXkpIGRvaW5nIGJ1ZGdldCBmb3Igd2hp
dGVvdXQKCkZpeCBpdCBieSBkb2luZyB3aGl0ZW91dCBzcGFjZSBidWRnZXQgYmVmb3JlIGxvY2tp
bmcgdWJpZnMgaW5vZGVzLgpCVFcsIGl0IGFsc28gZml4ZXMgd3JvbmcgZ290byB0YWcgJ291dF9y
ZWxlYXNlJyBpbiB3aGl0ZW91dCBidWRnZXQKZXJyb3IgaGFuZGxpbmcgcGF0aChJdCBzaG91bGQg
YXQgbGVhc3QgcmVjb3ZlciBkaXIgaV9zaXplIGFuZCB1bmxvY2sKNCB1YmlmcyBpbm9kZXMpLgoK
Rml4ZXM6IDllMGExZmZmOGRiNTZlYSAoInViaWZzOiBJbXBsZW1lbnQgUkVOQU1FX1dISVRFT1VU
IikKTGluazogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTQ3
MzMKU2lnbmVkLW9mZi1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4K
LS0tCiBmcy91Ymlmcy9kaXIuYyB8IDI1ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9mcy91Ymlmcy9kaXIuYyBiL2ZzL3ViaWZzL2Rpci5jCmluZGV4IGNmYTg4ODFkOGNjYS4uMjcz
NWFkMWFmZmVkIDEwMDY0NAotLS0gYS9mcy91Ymlmcy9kaXIuYworKysgYi9mcy91Ymlmcy9kaXIu
YwpAQCAtMTMyNCw2ICsxMzI0LDcgQEAgc3RhdGljIGludCBkb19yZW5hbWUoc3RydWN0IGlub2Rl
ICpvbGRfZGlyLCBzdHJ1Y3QgZGVudHJ5ICpvbGRfZGVudHJ5LAogCiAJaWYgKGZsYWdzICYgUkVO
QU1FX1dISVRFT1VUKSB7CiAJCXVuaW9uIHViaWZzX2Rldl9kZXNjICpkZXYgPSBOVUxMOworCQlz
dHJ1Y3QgdWJpZnNfYnVkZ2V0X3JlcSB3aHRfcmVxOwogCiAJCWRldiA9IGttYWxsb2Moc2l6ZW9m
KHVuaW9uIHViaWZzX2Rldl9kZXNjKSwgR0ZQX05PRlMpOwogCQlpZiAoIWRldikgewpAQCAtMTM0
NSw2ICsxMzQ2LDIwIEBAIHN0YXRpYyBpbnQgZG9fcmVuYW1lKHN0cnVjdCBpbm9kZSAqb2xkX2Rp
ciwgc3RydWN0IGRlbnRyeSAqb2xkX2RlbnRyeSwKIAkJd2hpdGVvdXRfdWktPmRhdGEgPSBkZXY7
CiAJCXdoaXRlb3V0X3VpLT5kYXRhX2xlbiA9IHViaWZzX2VuY29kZV9kZXYoZGV2LCBNS0RFVigw
LCAwKSk7CiAJCXViaWZzX2Fzc2VydChjLCAhd2hpdGVvdXRfdWktPmRpcnR5KTsKKworCQltZW1z
ZXQoJndodF9yZXEsIDAsIHNpemVvZihzdHJ1Y3QgdWJpZnNfYnVkZ2V0X3JlcSkpOworCQl3aHRf
cmVxLmRpcnRpZWRfaW5vID0gMTsKKwkJd2h0X3JlcS5kaXJ0aWVkX2lub19kID0gQUxJR04od2hp
dGVvdXRfdWktPmRhdGFfbGVuLCA4KTsKKwkJLyoKKwkJICogVG8gYXZvaWQgZGVhZGxvY2sgYmV0
d2VlbiBzcGFjZSBidWRnZXQgKGhvbGRzIHVpX211dGV4IGFuZAorCQkgKiB3YWl0cyB3YiB3b3Jr
KSBhbmQgd3JpdGViYWNrIHdvcmsod2FpdHMgdWlfbXV0ZXgpLCBkbyBzcGFjZQorCQkgKiBidWRn
ZXQgYmVmb3JlIHViaWZzIGlub2RlcyBsb2NrZWQuCisJCSAqLworCQllcnIgPSB1Ymlmc19idWRn
ZXRfc3BhY2UoYywgJndodF9yZXEpOworCQlpZiAoZXJyKSB7CisJCQlpcHV0KHdoaXRlb3V0KTsK
KwkJCWdvdG8gb3V0X3JlbGVhc2U7CisJCX0KIAl9CiAKIAlsb2NrXzRfaW5vZGVzKG9sZF9kaXIs
IG5ld19kaXIsIG5ld19pbm9kZSwgd2hpdGVvdXQpOwpAQCAtMTQxOSwxNiArMTQzNCw2IEBAIHN0
YXRpYyBpbnQgZG9fcmVuYW1lKHN0cnVjdCBpbm9kZSAqb2xkX2Rpciwgc3RydWN0IGRlbnRyeSAq
b2xkX2RlbnRyeSwKIAl9CiAKIAlpZiAod2hpdGVvdXQpIHsKLQkJc3RydWN0IHViaWZzX2J1ZGdl
dF9yZXEgd2h0X3JlcSA9IHsgLmRpcnRpZWRfaW5vID0gMSwKLQkJCQkuZGlydGllZF9pbm9fZCA9
IFwKLQkJCQlBTElHTih1Ymlmc19pbm9kZSh3aGl0ZW91dCktPmRhdGFfbGVuLCA4KSB9OwotCi0J
CWVyciA9IHViaWZzX2J1ZGdldF9zcGFjZShjLCAmd2h0X3JlcSk7Ci0JCWlmIChlcnIpIHsKLQkJ
CWlwdXQod2hpdGVvdXQpOwotCQkJZ290byBvdXRfcmVsZWFzZTsKLQkJfQotCiAJCWluY19ubGlu
ayh3aGl0ZW91dCk7CiAJCW1hcmtfaW5vZGVfZGlydHkod2hpdGVvdXQpOwogCi0tIAoyLjMxLjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
