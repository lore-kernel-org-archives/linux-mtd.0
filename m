Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6621ACA1005
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Sep 2025 08:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouwbKNFUIvaQ0iGPahBGxiZ2U2VjPLjwzuknjt2VCZM=; b=2coh6WEaMWOU+j
	QAseL53SJ2W+22d4KCVq2A7Bb7EotO/YV3H/K7zOrQVXl5s6ZXPtL5TPW8vgMbK9PeXRx2YoLLOoW
	pcJRz3k5OD5FsprWS6iY5MwaWFHc3IQII/+utEA0MnOJeq3sWAnI52ipCUn0B3r4oIZ75PSyZkLar
	B1xNWPHxsiAScPwbWx5QyYclGioOXbgaVbGWlhwDxUisZ8ZlydkuV+tLCW2Z9EGGOEfL7BH/cFgYV
	BnPtsdF4pOgRWGLTvH0jBVhHEMJnkkXOqHx3ScLI0d/0yXlFLUZoBiS9p/nLYK1Wm3J4NqaN8oPc2
	Fg2djm2kZq+JVU4JjWvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMhl-0000000GAfR-2Lhz;
	Tue, 02 Sep 2025 08:49:29 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMQn-0000000G3p7-0puB
	for linux-mtd@lists.infradead.org;
	Tue, 02 Sep 2025 08:31:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 26E044E40C70;
	Tue,  2 Sep 2025 08:31:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ECCA060695;
	Tue,  2 Sep 2025 08:31:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B92EA1C22D574;
	Tue,  2 Sep 2025 10:31:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756801912; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hBPhVeSiQFJP1Q2BlDNvNer2/fXDyfLy2fZLzTHFM3w=;
	b=ZkB0TrtSVQwjamvEf1iXhA0YN8n/fCpgacbjZ+Go5cE5Rbv+QYtztUHKPE3nTQpdat6ec+
	XMdjnt1t+7r1RFW/25HkoWtyycI5qAV6pmbiWVKNHZ6F+JVXWFltNHNMCaXftyTDJTJCYm
	PrzTyAjzDyVwcYCvvoSIKtRDxO4BWVD0pelYjDdMIE3Td3nFfgw40fedEU+G//nMPF8Qcw
	Rz6anLSYFbr85HSi/ETi7j61UPPhFc0CrC/a4O4ncacxr0jYPHwct93CQINdqR2XxkVVrK
	cZyMfenCkyC1zwN4D7xzJ/hFdx6fOfhWT2rQXPL0L2O5bhhWKKyK3z41m+jrrA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wang Zhaolong <wangzhaolong@huaweicloud.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  chengzhihao1@huawei.com,
  yi.zhang@huawei.com,  yangerkun@huawei.com
Subject: Re: [PATCH] mtd: core: only increment ecc_stats.badblocks on
 confirmed good->bad transition
In-Reply-To: <20250902080117.3658372-1-wangzhaolong@huaweicloud.com> (Wang
	Zhaolong's message of "Tue, 2 Sep 2025 16:01:17 +0800")
References: <20250902080117.3658372-1-wangzhaolong@huaweicloud.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 02 Sep 2025 10:31:44 +0200
Message-ID: <87ms7dntlb.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_013157_393831_B974FB5A 
X-CRM114-Status: GOOD (  12.86  )
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

SGVsbG8gV2FuZywKCj4gQEAgLTIzNDksMTcgKzIzNTEsMzUgQEAgaW50IG10ZF9ibG9ja19tYXJr
YmFkKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3Qgb2ZzKQo+ICAJCXJldHVybiAtRVJPRlM7
Cj4gIAo+ICAJaWYgKG10ZC0+ZmxhZ3MgJiBNVERfU0xDX09OX01MQ19FTVVMQVRJT04pCj4gIAkJ
b2ZzID0gKGxvZmZfdCltdGRfZGl2X2J5X2ViKG9mcywgbXRkKSAqIG1hc3Rlci0+ZXJhc2VzaXpl
Owo+ICAKPiAtCXJldCA9IG1hc3Rlci0+X2Jsb2NrX21hcmtiYWQobWFzdGVyLCBtdGRfZ2V0X21h
c3Rlcl9vZnMobXRkLCBvZnMpKTsKPiArCW1vZmZzID0gbXRkX2dldF9tYXN0ZXJfb2ZzKG10ZCwg
b2ZzKTsKPiArCj4gKwkvKiBQcmUtY2hlY2s6IHJlbWVtYmVyIGN1cnJlbnQgc3RhdGUgaWYgYXZh
aWxhYmxlLiAqLwo+ICsJaWYgKG1hc3Rlci0+X2Jsb2NrX2lzYmFkKQo+ICsJCW9sZGJhZCA9IG1h
c3Rlci0+X2Jsb2NrX2lzYmFkKG1hc3RlciwgbW9mZnMpOwo+ICsKPiArCXJldCA9IG1hc3Rlci0+
X2Jsb2NrX21hcmtiYWQobWFzdGVyLCBtb2Zmcyk7Cj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiBy
ZXQ7Cj4gIAo+IC0Jd2hpbGUgKG10ZC0+cGFyZW50KSB7Cj4gLQkJbXRkLT5lY2Nfc3RhdHMuYmFk
YmxvY2tzKys7Cj4gLQkJbXRkID0gbXRkLT5wYXJlbnQ7Cj4gKwkvKgo+ICsJICogUG9zdC1jaGVj
ayBhbmQgYnVtcCBzdGF0cyBvbmx5IG9uIGEgY29uZmlybWVkIGdvb2QtPmJhZCB0cmFuc2l0aW9u
Lgo+ICsJICogSWYgX2Jsb2NrX2lzYmFkIGlzIG5vdCBpbXBsZW1lbnRlZCwgYmUgY29uc2VydmF0
aXZlIGFuZCBkbyBub3QgYnVtcC4KPiArCSAqLwo+ICsJaWYgKG1hc3Rlci0+X2Jsb2NrX2lzYmFk
KSB7Cj4gKwkJLyogSWYgaXQgd2FzIGFscmVhZHkgYmFkLCBub3RoaW5nIHRvIGRvLiAqLwo+ICsJ
CWlmIChvbGRiYWQgPiAwKQo+ICsJCQlyZXR1cm4gMDsKPiArCj4gKwkJaWYgKG1hc3Rlci0+X2Js
b2NrX2lzYmFkKG1hc3RlciwgbW9mZnMpID4gMCkgewo+ICsJCQl3aGlsZSAobXRkLT5wYXJlbnQp
IHsKPiArCQkJCW10ZC0+ZWNjX3N0YXRzLmJhZGJsb2NrcysrOwo+ICsJCQkJbXRkID0gbXRkLT5w
YXJlbnQ7Cj4gKwkJCX0KPiArCQl9CgpJIGRvbid0IHRoaW5rIHlvdSBjYW4gYXNzdW1lIHRoZSBi
bG9jayB3YXMgYWxyZWFkeSBiYWQgYW5kIG11c3Qgbm90IGJlCmFjY291bnRlZCBhcyBhIG5ldyBi
YWQgYmxvY2sgaWYgeW91IGNhbm5vdCB2ZXJpZnkgdGhhdC4gSW4gdGhpcyBjYXNlIHdlCm11c3Qg
cmVtYWluIGNvbnNlcnZhdGl2ZSBhbmQgdGVsbCB1c2Vyc3BhY2UgYSBuZXcgYmxvY2sgd2FzIG1h
cmtlZCBiYWQsCkkgYmVsaWV2ZS4KClNhaWQgb3RoZXJ3aXNlLCB0aGUgeyB3aGlsZSAoKSBiYWRi
bG9ja3MrKyB9IGJsb2NrIHNoYWxsIHJlbWFpbiBvdXRzaWRlCm9mIHRoZSBpZiAoX2Jsb2NrX2lz
YmFkKSBjb25kaXRpb24gYW5kIHJlbWFpbiB1bnRvdWNoZWQuIEp1c3QgYmFpbCBvdXQKZWFybHkg
aWYgeW91IGFyZSBzdXJlIHRoaXMgaXMgbm90IG5lZWRlZC4KClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
