Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB13C28B28
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Mar 2025 08:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xb2x13fHD6HA/mGUbvHnhSmSZU6B7//NBoPmESrC+bg=; b=HkSpL4i4+ivoj1wxSvKJ3hr16u
	OX4jkWrF/3OSiwHXlebMSjfzYGLdnEd2s7UbDnrcoIkrnZBaLhv3XPku73QbjJyqoAFpEXeBpIwhb
	9Dqsiosevdde+Eo2Xw7scbu1CcIgJpM62NDBF9m6KpiIKW0JS/h2FBBf/q3A4xTDJ/pqOGm4htqPV
	blhMYG4Qk2P9Vy3W5+GoPPRA8We1MLqkR56Utsty+jcegzyCktQb6H9KQ+s1C9lZ3U5jP/WR5K77k
	FKsHYoBNigk1d8AWwlCzak9JJiIRO0HhJNvXrdj7OTyPrL6qUQa1VAc76Xpr+aM6pRDC/eCTFYmPi
	iOTapWAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNLw-0000000G4VV-0cLz;
	Sat, 15 Mar 2025 08:58:44 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNLt-0000000G4V3-1KzO
	for linux-mtd@lists.infradead.org;
	Sat, 15 Mar 2025 08:58:43 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4ZFFS85G52zDsqJ;
	Sat, 15 Mar 2025 16:55:20 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 197CA1800EC;
	Sat, 15 Mar 2025 16:58:33 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 15 Mar 2025 16:58:32 +0800
Subject: Re: [v4 PATCH 10/13] ubifs: Use crypto_acomp interface
To: Herbert Xu <herbert@gondor.apana.org.au>, Linux Crypto Mailing List
	<linux-crypto@vger.kernel.org>
CC: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	<linux-pm@vger.kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>,
	<netdev@vger.kernel.org>
References: <cover.1741954523.git.herbert@gondor.apana.org.au>
 <349a78bc53d3620a29cc6105b55985db51aa0a11.1741954523.git.herbert@gondor.apana.org.au>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e5792e49-588d-8dee-0e3e-9e73e4bedebf@huawei.com>
Date: Sat, 15 Mar 2025 16:58:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <349a78bc53d3620a29cc6105b55985db51aa0a11.1741954523.git.herbert@gondor.apana.org.au>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_015841_691179_930FD1A2 
X-CRM114-Status: UNSURE (   9.71  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyNS8zLzE0IDIwOjIyLCBIZXJiZXJ0IFh1INC0tcA6Cj4gUmVwbGFjZSB0aGUgbGVnYWN5
IGNyeXB0byBjb21wcmVzc2lvbiBpbnRlcmZhY2Ugd2l0aCB0aGUgbmV3IGFjb21wCj4gaW50ZXJm
YWNlLgo+IAo+IFJlbW92ZSB0aGUgY29tcHJlc3Npb24gbXV0ZXhlcyBhbmQgdGhlIG92ZXJhbGxv
Y2F0aW9uIGZvciBtZW1vcnkKPiAodGhlIG9mZmVuZGVyIExaTyBoYXMgYmVlbiBmaXhlZCkuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSGVyYmVydCBYdSA8aGVyYmVydEBnb25kb3IuYXBhbmEub3JnLmF1
Pgo+IC0tLQo+ICAgZnMvdWJpZnMvY29tcHJlc3MuYyB8IDExNiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+ICAgZnMvdWJpZnMvam91cm5hbC5jICB8ICAgMiAr
LQo+ICAgZnMvdWJpZnMvdWJpZnMuaCAgICB8ICAxNSArLS0tLS0KPiAgIDMgZmlsZXMgY2hhbmdl
ZCwgNzcgaW5zZXJ0aW9ucygrKSwgNTYgZGVsZXRpb25zKC0pCj4gCgpIaSwgSGVyYmVydCwgSSBn
b3Qgc29tZSB3YXJuaW5nIG1lc3NhZ2VzIHdoaWxlIHJ1bm5pbmcgeGZzdGVzdHMsIGl0IApsb29r
cyBsaWtlIHRoZSBjb21wcmVzc29yIHJldHVybnMgZXJyb3IgY29kZS4KClsgIDM5Ny45NzEwODZd
IHJ1biBmc3Rlc3RzIGdlbmVyaWMvMTAzIGF0IDIwMjUtMDMtMTUgMTY6NDg6MjkKWyAgMzk4LjE4
MjM0N10gcnVuIGZzdGVzdHMgZ2VuZXJpYy8xMDQgYXQgMjAyNS0wMy0xNSAxNjo0ODoyOQpbICAz
OTguMzk2OTg2XSBydW4gZnN0ZXN0cyBnZW5lcmljLzEwNSBhdCAyMDI1LTAzLTE1IDE2OjQ4OjI5
ClsgIDM5OC42MDI2NDBdIHJ1biBmc3Rlc3RzIGdlbmVyaWMvMTA2IGF0IDIwMjUtMDMtMTUgMTY6
NDg6MjkKWyAgMzk4LjgxNjgxOV0gcnVuIGZzdGVzdHMgZ2VuZXJpYy8xMDcgYXQgMjAyNS0wMy0x
NSAxNjo0ODozMApbICAzOTkuMDMyNjAyXSBydW4gZnN0ZXN0cyBnZW5lcmljLzEwOCBhdCAyMDI1
LTAzLTE1IDE2OjQ4OjMwClsgIDM5OS4yNzE2NjldIHJ1biBmc3Rlc3RzIGdlbmVyaWMvMTA5IGF0
IDIwMjUtMDMtMTUgMTY6NDg6MzAKWyAgMzk5LjQ0OTIyOF0gVUJJRlMgKHViaTE6MCk6IGRlZmF1
bHQgZmlsZS1zeXN0ZW0gY3JlYXRlZApbICAzOTkuNDQ5MjU3XSBVQklGUyAodWJpMTowKTogTW91
bnRpbmcgaW4gdW5hdXRoZW50aWNhdGVkIG1vZGUKWyAgMzk5LjQ0OTM1OV0gVUJJRlMgKHViaTE6
MCk6IGJhY2tncm91bmQgdGhyZWFkICJ1Ymlmc19iZ3QxXzAiIHN0YXJ0ZWQsIApQSUQgMTcwMwpb
ICAzOTkuNDQ5ODc2XSBVQklGUyAodWJpMTowKTogVUJJRlM6IG1vdW50ZWQgVUJJIGRldmljZSAx
LCB2b2x1bWUgMCwgCm5hbWUgInZvbF9hIgpbICAzOTkuNDQ5ODgyXSBVQklGUyAodWJpMTowKTog
TEVCIHNpemU6IDEyOTAyNCBieXRlcyAoMTI2IEtpQiksIAptaW4uL21heC4gSS9PIHVuaXQgc2l6
ZXM6IDIwNDggYnl0ZXMvMjA0OCBieXRlcwpbICAzOTkuNDQ5ODg2XSBVQklGUyAodWJpMTowKTog
RlMgc2l6ZTogMjIwNjMxMDQwIGJ5dGVzICgyMTAgTWlCLCAxNzEwIApMRUJzKSwgbWF4IDE3MjIg
TEVCcywgam91cm5hbCBzaXplIDExMDk2MDY0IGJ5dGVzICgxMCBNaUIsIDg2IExFQnMpClsgIDM5
OS40NDk4OTBdIFVCSUZTICh1YmkxOjApOiByZXNlcnZlZCBmb3Igcm9vdDogNDk1MjY4MyBieXRl
cyAoNDgzNiBLaUIpClsgIDM5OS40NDk4OTJdIFVCSUZTICh1YmkxOjApOiBtZWRpYSBmb3JtYXQ6
IHc1L3IwIChsYXRlc3QgaXMgdzUvcjApLCAKVVVJRCA1NkU4RkVGRC1DRjI1LTQ0NUQtOTE1OS1C
RTY1RkMxMEVDOUIsIHNtYWxsIExQVCBtb2RlbApbICAzOTkuNDQ5OTA0XSBVQklGUyAodWJpMTow
KTogZnVsbCBhdGltZSBzdXBwb3J0IGlzIGVuYWJsZWQuClsgIDQwMC4wNTQwODddIFVCSUZTIHdh
cm5pbmcgKHViaTA6MCBwaWQgMTEwKTogdWJpZnNfY29tcHJlc3NfcmVxIApbdWJpZnNdOiBjYW5u
b3QgY29tcHJlc3MgNDA5NiBieXRlcywgY29tcHJlc3NvciB6c3RkLCBlcnJvciAtMjIsIGxlYXZl
IApkYXRhIHVuY29tcHJlc3NlZApbICA0MDAuMDU1NjMxXSBVQklGUyB3YXJuaW5nICh1YmkwOjAg
cGlkIDExMCk6IHViaWZzX2NvbXByZXNzX3JlcSAKW3ViaWZzXTogY2Fubm90IGNvbXByZXNzIDQw
OTYgYnl0ZXMsIGNvbXByZXNzb3IgenN0ZCwgZXJyb3IgLTIyLCBsZWF2ZSAKZGF0YSB1bmNvbXBy
ZXNzZWQKWyAgNDAwLjA1NzEzN10gVUJJRlMgd2FybmluZyAodWJpMDowIHBpZCAxMTApOiB1Ymlm
c19jb21wcmVzc19yZXEgClt1Ymlmc106IGNhbm5vdCBjb21wcmVzcyA0MDk2IGJ5dGVzLCBjb21w
cmVzc29yIHpzdGQsIGVycm9yIC0yMiwgbGVhdmUgCmRhdGEgdW5jb21wcmVzc2VkClsgIDQwMC4w
NTg3NjBdIFVCSUZTIHdhcm5pbmcgKHViaTA6MCBwaWQgMTEwKTogdWJpZnNfY29tcHJlc3NfcmVx
IApbdWJpZnNdOiBjYW5ub3QgY29tcHJlc3MgNDA5NiBieXRlcywgY29tcHJlc3NvciB6c3RkLCBl
cnJvciAtMjIsIGxlYXZlIApkYXRhIHVuY29tcHJlc3NlZAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
