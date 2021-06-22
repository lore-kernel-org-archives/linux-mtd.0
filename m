Return-Path: <SRS0=6QP0=LQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD6EC4743C
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 02:40:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CA776120D
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 02:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CA776120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppBm5IQJah1k95xBWvvfsly+8izVePemLF4k89xGttg=; b=wzguWEyx6X3CgrM7V21jsQjSSy
	6HYkgSZRNJEcjiq00BVo+TEkuZ4pNttM0YPl+yEPE8zAg7PCl2JndupksDL1C6rKSbNr5HQ6Qxs0d
	IMXjfdXglKO5U9WbPYiN1f4OnoVix/i1lN8QQudN4ZTYBOEoHgLFU+4ascMnsDJAnTNF0D2v0tirm
	IoYa/V+6/rB0KagMSosCPNxp8w8R0mhhbKFX/EyADCSI8LTSOI2L06Jv60QxXIeOSc9DSFaLpR2xH
	V1WEe1q3W3x2l2/2ScYuRr3GNsrLmOCdmWuOL8RzkKoEITtkvFQsxsddHpxUFMMTII1E+GHVg9g44
	7B8pyJ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvWJi-005QmA-Hn; Tue, 22 Jun 2021 02:39:10 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvWJe-005Qk6-G6
 for linux-mtd@lists.infradead.org; Tue, 22 Jun 2021 02:39:08 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4G89ST0mxYz1BQKK;
 Tue, 22 Jun 2021 10:33:45 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 22 Jun 2021 10:38:53 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 dggema761-chm.china.huawei.com (10.1.198.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 22 Jun 2021 10:38:53 +0800
Subject: Re: [PATCH] ubifs: Remove a redundant null check on pointer lp
To: Colin King <colin.king@canonical.com>, Richard Weinberger
 <richard@nod.at>, Dan Carpenter <dan.carpenter@oracle.com>,
 <linux-mtd@lists.infradead.org>
CC: <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210621152249.20901-1-colin.king@canonical.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f2ea606a-4a05-8d14-4380-d96ca0f981a1@huawei.com>
Date: Tue, 22 Jun 2021 10:38:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20210621152249.20901-1-colin.king@canonical.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_193907_298356_779181AF 
X-CRM114-Status: GOOD (  15.20  )
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

1NogMjAyMS82LzIxIDIzOjIyLCBDb2xpbiBLaW5nINC0tcA6Cj4gRnJvbTogQ29saW4gSWFuIEtp
bmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiAKPiBBbiBlYXJsaWVyIGZpeCB0byByZXBs
YWNlIGFuIElTX0VSUiBjaGVjayBvbiBscCB3aXRoIGEgbnVsbCBjaGVjawo+IG9uIGxwIGRpZG4n
dCByZW1vdmUgYSBmb2xsb3dpbmcgbnVsbCBjaGVjayBvbiBscC4gVGhlIHNlY29uZCBudWxsCj4g
Y2hlY2sgaXMgcmVkdW5kYW50IGFuZCBjYW4gYmUgcmVtb3ZlZC4KPiAKPiBBZGRyZXNzZXMtQ292
ZXJpdHk6ICgiTG9naWNhbGx5IGRlYWQgY29kZSIpCj4gRml4ZXM6IGM3NzBjZDUxOTBiYSAoInVi
aWZzOiBmaXggYW4gSVNfRVJSKCkgdnMgTlVMTCBjaGVjayIpCj4gU2lnbmVkLW9mZi1ieTogQ29s
aW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiAtLS0KPiAgIGZzL3ViaWZz
L2djLmMgfCAyIC0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZnMvdWJpZnMvZ2MuYyBiL2ZzL3ViaWZzL2djLmMKPiBpbmRleCA3Y2MyMmQ3MzE3
ZWEuLjQ2NWJlZWE1MjE3NiAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9nYy5jCj4gKysrIGIvZnMv
dWJpZnMvZ2MuYwo+IEBAIC04OTksOCArODk5LDYgQEAgaW50IHViaWZzX2djX3N0YXJ0X2NvbW1p
dChzdHJ1Y3QgdWJpZnNfaW5mbyAqYykKPiAgIAkJCWVyciA9IC1FTk9NRU07Cj4gICAJCQlnb3Rv
IG91dDsKPiAgIAkJfQpIaSBDb2xpbiwKSSBqdXN0IGZvdW5kIG91dCBhYm91dCBpdCB0b2RheSB0
aGFua3MgdG8geW91ciBwYXRjaC4gQ29tbWl0IApjNzcwY2Q1MTkwYmEgKCJ1YmlmczogZml4IGFu
IElTX0VSUigpIHZzIE5VTEwgY2hlY2siKSBkaWQgaW1wb3J0IGEgbmV3IApwcm9ibGVtIHRoYXQg
dWJpZnNfZ2Nfc3RhcnRfY29tbWl0KCkgbWF5IHJldHVybiAtRU5PTUVNIHdoaWxlIHN5bmNpbmcg
ZnMuCkkgZ3Vlc3MgdWJpZnNfZmFzdF9maW5kX2ZyZGlfaWR4KCkgcmV0dXJuIE5VTEwgcG9pbnRl
ciBpcyB0aGUgCnRlcm1pbmF0aW9uIGNvbmRpdGlvbiBpbiB3aGlsZS1sb29wLCB3aGljaCBtZWFu
cyB3ZSBjYW5ub3QgZ2V0IGEgCmZyZWVhYmxlIGluZGV4IExFQiBpbiB1Ymlmc19nY19zdGFydF9j
b21taXQoKS4KCj4gLQkJaWYgKCFscCkKPiAtCQkJYnJlYWs7Cj4gICAJCWlkeF9nYyA9IGttYWxs
b2Moc2l6ZW9mKHN0cnVjdCB1Ymlmc19nY2VkX2lkeF9sZWIpLCBHRlBfTk9GUyk7Cj4gICAJCWlm
ICghaWR4X2djKSB7Cj4gICAJCQllcnIgPSAtRU5PTUVNOwo+IApCVFcsIHRoZSBmb2xsb3dpbmcg
bW9kaWZpY2F0aW9ucyBtYXkgYmUgd2hhdCB5b3Ugd2FudD8KZGlmZiAtLWdpdCBhL2ZzL3ViaWZz
L2djLmMgYi9mcy91Ymlmcy9nYy5jCmluZGV4IDdjYzIyZDczMTdlYS4uYjFmMjc2NTk5YjA0IDEw
MDY0NAotLS0gYS9mcy91Ymlmcy9nYy5jCisrKyBiL2ZzL3ViaWZzL2djLmMKQEAgLTg5NSwxMCAr
ODk1LDYgQEAgaW50IHViaWZzX2djX3N0YXJ0X2NvbW1pdChzdHJ1Y3QgdWJpZnNfaW5mbyAqYykK
ICAgICAgICAgLyogUmVjb3JkIGluZGV4IGZyZWVhYmxlIExFQnMgZm9yIHVubWFwcGluZyBhZnRl
ciBjb21taXQgKi8KICAgICAgICAgd2hpbGUgKDEpIHsKICAgICAgICAgICAgICAgICBscCA9IHVi
aWZzX2Zhc3RfZmluZF9mcmRpX2lkeChjKTsKLSAgICAgICAgICAgICAgIGlmICghbHApIHsKLSAg
ICAgICAgICAgICAgICAgICAgICAgZXJyID0gLUVOT01FTTsKLSAgICAgICAgICAgICAgICAgICAg
ICAgZ290byBvdXQ7Ci0gICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgICAgaWYgKCFscCkK
ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICAgICAgICAgIGlkeF9nYyA9
IGttYWxsb2Moc2l6ZW9mKHN0cnVjdCB1Ymlmc19nY2VkX2lkeF9sZWIpLCAKR0ZQX05PRlMpOwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
