Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76116EB64DD
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jul 2023 12:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+YUu9MOEAf7kquoTOG8ZkA2HfGu12eiRqOIQyVcHFho=; b=0XFehggfVATgA02+5dH6Stqrf4
	Thw6Z+/Hck4nRqnu6sj5/iXLJGvQ4BlZ1eaZX0EXwkGgajsX9MD+g2fI+reU/Yirq1EJYS0v/X5ao
	BLyf4DOJY6uuSheBnHmXkEeXTWwWJy6rrb0Lrkiv6spi4/+Ip3deAXsRve4wsySLMy7iYSmP5Hnt/
	O4Od0QIzkedoYCMkxRW0kUCOxi2GjldJXL5hEbDkPDg+jQjIfOzAkuqkuiS/QN7WTDm8Z2U7Fs1Wq
	9cdCqknrJb2WShh+oN/EIkX1baEM5WV6b6xy+rzS4KHlvqtt3FVdvPg83oV/YXK/ndaNMJhFLCXkr
	ksn6/qEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHNmf-001Z6f-0x;
	Thu, 06 Jul 2023 12:08:29 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHNmb-001Z4N-2R
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jul 2023 12:08:27 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4QxZxN23rRzPjxy;
	Thu,  6 Jul 2023 20:06:00 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 20:08:13 +0800
Subject: Re: [PATCH v2 10/92] ubifs: convert to simple_rename_timestamp
To: Jeff Layton <jlayton@kernel.org>, Christian Brauner <brauner@kernel.org>,
	Richard Weinberger <richard@nod.at>
CC: Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	<linux-fsdevel@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
References: <20230705185755.579053-1-jlayton@kernel.org>
 <20230705190309.579783-1-jlayton@kernel.org>
 <20230705190309.579783-8-jlayton@kernel.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <7ceadd6a-a19a-5ba0-fab4-ff79d90c8c77@huawei.com>
Date: Thu, 6 Jul 2023 20:08:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230705190309.579783-8-jlayton@kernel.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_050826_230049_B7228A2E 
X-CRM114-Status: GOOD (  17.77  )
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

1NogMjAyMy83LzYgMzowMCwgSmVmZiBMYXl0b24g0LS1wDoKPiBBIHJlbmFtZSBwb3RlbnRpYWxs
eSBpbnZvbHZlcyB1cGRhdGluZyA0IGRpZmZlcmVudCBpbm9kZSB0aW1lc3RhbXBzLgo+IENvbnZl
cnQgdG8gdGhlIG5ldyBzaW1wbGVfcmVuYW1lX3RpbWVzdGFtcCBoZWxwZXIgZnVuY3Rpb24uCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4KPiAtLS0K
PiAgIGZzL3ViaWZzL2Rpci5jIHwgMTUgKysrLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiAKClJldmlld2VkLWJ5OiBaaGlo
YW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKPiBkaWZmIC0tZ2l0IGEvZnMvdWJp
ZnMvZGlyLmMgYi9mcy91Ymlmcy9kaXIuYwo+IGluZGV4IGVmMDQ5OWVkYzI0OC4uN2VjMjUzMTBi
ZDhhIDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL2Rpci5jCj4gKysrIGIvZnMvdWJpZnMvZGlyLmMK
PiBAQCAtMTQxNCw4ICsxNDE0LDcgQEAgc3RhdGljIGludCBkb19yZW5hbWUoc3RydWN0IGlub2Rl
ICpvbGRfZGlyLCBzdHJ1Y3QgZGVudHJ5ICpvbGRfZGVudHJ5LAo+ICAgCSAqIExpa2UgbW9zdCBv
dGhlciBVbml4IHN5c3RlbXMsIHNldCB0aGUgQGlfY3RpbWUgZm9yIGlub2RlcyBvbiBhCj4gICAJ
ICogcmVuYW1lLgo+ICAgCSAqLwo+IC0JdGltZSA9IGN1cnJlbnRfdGltZShvbGRfZGlyKTsKPiAt
CW9sZF9pbm9kZS0+aV9jdGltZSA9IHRpbWU7Cj4gKwlzaW1wbGVfcmVuYW1lX3RpbWVzdGFtcChv
bGRfZGlyLCBvbGRfZGVudHJ5LCBuZXdfZGlyLCBuZXdfZGVudHJ5KTsKPiAgIAo+ICAgCS8qIFdl
IG11c3QgYWRqdXN0IHBhcmVudCBsaW5rIGNvdW50IHdoZW4gcmVuYW1pbmcgZGlyZWN0b3JpZXMg
Ki8KPiAgIAlpZiAoaXNfZGlyKSB7Cj4gQEAgLTE0NDQsMTMgKzE0NDMsMTEgQEAgc3RhdGljIGlu
dCBkb19yZW5hbWUoc3RydWN0IGlub2RlICpvbGRfZGlyLCBzdHJ1Y3QgZGVudHJ5ICpvbGRfZGVu
dHJ5LAo+ICAgCj4gICAJb2xkX2Rpci0+aV9zaXplIC09IG9sZF9zejsKPiAgIAl1Ymlmc19pbm9k
ZShvbGRfZGlyKS0+dWlfc2l6ZSA9IG9sZF9kaXItPmlfc2l6ZTsKPiAtCW9sZF9kaXItPmlfbXRp
bWUgPSBvbGRfZGlyLT5pX2N0aW1lID0gdGltZTsKPiAtCW5ld19kaXItPmlfbXRpbWUgPSBuZXdf
ZGlyLT5pX2N0aW1lID0gdGltZTsKPiAgIAo+ICAgCS8qCj4gICAJICogQW5kIGZpbmFsbHksIGlm
IHdlIHVubGlua2VkIGEgZGlyZW50cnkgd2hpY2ggaGFwcGVuZWQgdG8gaGF2ZSB0aGUKPiAgIAkg
KiBzYW1lIG5hbWUgYXMgdGhlIG1vdmVkIGRpcmVudHJ5LCB3ZSBoYXZlIHRvIGRlY3JlbWVudCBA
aV9ubGluayBvZgo+IC0JICogdGhlIHVubGlua2VkIGlub2RlIGFuZCBjaGFuZ2UgaXRzIGN0aW1l
Lgo+ICsJICogdGhlIHVubGlua2VkIGlub2RlLgo+ICAgCSAqLwo+ICAgCWlmICh1bmxpbmspIHsK
PiAgIAkJLyoKPiBAQCAtMTQ2Miw3ICsxNDU5LDYgQEAgc3RhdGljIGludCBkb19yZW5hbWUoc3Ry
dWN0IGlub2RlICpvbGRfZGlyLCBzdHJ1Y3QgZGVudHJ5ICpvbGRfZGVudHJ5LAo+ICAgCQkJY2xl
YXJfbmxpbmsobmV3X2lub2RlKTsKPiAgIAkJZWxzZQo+ICAgCQkJZHJvcF9ubGluayhuZXdfaW5v
ZGUpOwo+IC0JCW5ld19pbm9kZS0+aV9jdGltZSA9IHRpbWU7Cj4gICAJfSBlbHNlIHsKPiAgIAkJ
bmV3X2Rpci0+aV9zaXplICs9IG5ld19zejsKPiAgIAkJdWJpZnNfaW5vZGUobmV3X2RpciktPnVp
X3NpemUgPSBuZXdfZGlyLT5pX3NpemU7Cj4gQEAgLTE1NTcsNyArMTU1Myw2IEBAIHN0YXRpYyBp
bnQgdWJpZnNfeHJlbmFtZShzdHJ1Y3QgaW5vZGUgKm9sZF9kaXIsIHN0cnVjdCBkZW50cnkgKm9s
ZF9kZW50cnksCj4gICAJaW50IHN5bmMgPSBJU19ESVJTWU5DKG9sZF9kaXIpIHx8IElTX0RJUlNZ
TkMobmV3X2Rpcik7Cj4gICAJc3RydWN0IGlub2RlICpmc3RfaW5vZGUgPSBkX2lub2RlKG9sZF9k
ZW50cnkpOwo+ICAgCXN0cnVjdCBpbm9kZSAqc25kX2lub2RlID0gZF9pbm9kZShuZXdfZGVudHJ5
KTsKPiAtCXN0cnVjdCB0aW1lc3BlYzY0IHRpbWU7Cj4gICAJaW50IGVycjsKPiAgIAlzdHJ1Y3Qg
ZnNjcnlwdF9uYW1lIGZzdF9ubSwgc25kX25tOwo+ICAgCj4gQEAgLTE1ODgsMTEgKzE1ODMsNyBA
QCBzdGF0aWMgaW50IHViaWZzX3hyZW5hbWUoc3RydWN0IGlub2RlICpvbGRfZGlyLCBzdHJ1Y3Qg
ZGVudHJ5ICpvbGRfZGVudHJ5LAo+ICAgCj4gICAJbG9ja180X2lub2RlcyhvbGRfZGlyLCBuZXdf
ZGlyLCBOVUxMLCBOVUxMKTsKPiAgIAo+IC0JdGltZSA9IGN1cnJlbnRfdGltZShvbGRfZGlyKTsK
PiAtCWZzdF9pbm9kZS0+aV9jdGltZSA9IHRpbWU7Cj4gLQlzbmRfaW5vZGUtPmlfY3RpbWUgPSB0
aW1lOwo+IC0Jb2xkX2Rpci0+aV9tdGltZSA9IG9sZF9kaXItPmlfY3RpbWUgPSB0aW1lOwo+IC0J
bmV3X2Rpci0+aV9tdGltZSA9IG5ld19kaXItPmlfY3RpbWUgPSB0aW1lOwo+ICsJc2ltcGxlX3Jl
bmFtZV90aW1lc3RhbXAob2xkX2Rpciwgb2xkX2RlbnRyeSwgbmV3X2RpciwgbmV3X2RlbnRyeSk7
Cj4gICAKPiAgIAlpZiAob2xkX2RpciAhPSBuZXdfZGlyKSB7Cj4gICAJCWlmIChTX0lTRElSKGZz
dF9pbm9kZS0+aV9tb2RlKSAmJiAhU19JU0RJUihzbmRfaW5vZGUtPmlfbW9kZSkpIHsKPiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
