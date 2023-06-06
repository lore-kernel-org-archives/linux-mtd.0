Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABA6C77B7A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 14:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIVpB7sb7IS2lppLF2hzFw7eOXBq9UtBSVbY49JGibY=; b=Ep08USACnXOjV8JYoRrXMZae94
	ipH7R4EMlhsCBYsibmycqtT3L/sVLGkGKymu9Iscpv15BaPZfi0VxF9ZXW91CaHzMeXTqn+tlx29L
	gNxgWr3ymcII6w8PRHOlmrPff/1Q11usXShKEqbHxYs8rvuuE32gr3HpC3BYS0JP3DEMmf0kRKhPm
	eIgCacK11he9jD6Dz6bEsMiiTpgnUQ9KQSE8aYp/bbk9eTWwVM02aDpqFOp+8cAv7MYe4vby+d215
	05fVe6/5CnhWjgL9hcf08PaEb9n6wc2892iqMHfBSuPTNMYgjPaomlfs7sJhptRQGZMKeVLKn2MvH
	TZy1QX4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Xp8-0023Vy-23;
	Tue, 06 Jun 2023 14:38:14 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Xp4-0023OO-2z
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 14:38:13 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4QbCgr3KGNztQbW;
	Tue,  6 Jun 2023 22:35:36 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 22:37:57 +0800
Subject: Re: [PATCH 1/4] ubifs: Convert from writepage to writepages
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20230605165029.2908304-1-willy@infradead.org>
 <20230605165029.2908304-2-willy@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <be9f30d1-d840-fb76-f185-5ebc70a7b72b@huawei.com>
Date: Tue, 6 Jun 2023 22:37:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230605165029.2908304-2-willy@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_073811_221131_9AD575A4 
X-CRM114-Status: GOOD (  18.46  )
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

1NogMjAyMy82LzYgMDo1MCwgTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkg0LS1wDoKSGksCj4gVGhp
cyBpcyBhIHNpbXBsaXN0aWMgY29udmVyc2lvbiB0byBzZXBhcmF0ZSBvdXQgYW55IGVmZmVjdHMg
b2YKPiBubyBsb25nZXIgaGF2aW5nIGEgd3JpdGVwYWdlIG1ldGhvZC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KPiAtLS0K
PiAgIGZzL3ViaWZzL2ZpbGUuYyB8IDEyICsrKysrKysrKystLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2ZzL3Vi
aWZzL2ZpbGUuYyBiL2ZzL3ViaWZzL2ZpbGUuYwo+IGluZGV4IDk3OWFiMWQ5ZDBjMy4uOGJiNGNi
OWQ1MjhmIDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL2ZpbGUuYwo+ICsrKyBiL2ZzL3ViaWZzL2Zp
bGUuYwo+IEBAIC0xMDAzLDggKzEwMDMsMTAgQEAgc3RhdGljIGludCBkb193cml0ZXBhZ2Uoc3Ry
dWN0IHBhZ2UgKnBhZ2UsIGludCBsZW4pCj4gICAgKiBvbiB0aGUgcGFnZSBsb2NrIGFuZCBpdCB3
b3VsZCBub3Qgd3JpdGUgdGhlIHRydW5jYXRlZCBpbm9kZSBub2RlIHRvIHRoZQo+ICAgICogam91
cm5hbCBiZWZvcmUgd2UgaGF2ZSBmaW5pc2hlZC4KPiAgICAqLwo+IC1zdGF0aWMgaW50IHViaWZz
X3dyaXRlcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSwgc3RydWN0IHdyaXRlYmFja19jb250cm9sICp3
YmMpCj4gK3N0YXRpYyBpbnQgdWJpZnNfd3JpdGVwYWdlKHN0cnVjdCBmb2xpbyAqZm9saW8sIHN0
cnVjdCB3cml0ZWJhY2tfY29udHJvbCAqd2JjLAo+ICsJCXZvaWQgKmRhdGEpCj4gICB7Cj4gKwlz
dHJ1Y3QgcGFnZSAqcGFnZSA9ICZmb2xpby0+cGFnZTsKPiAgIAlzdHJ1Y3QgaW5vZGUgKmlub2Rl
ID0gcGFnZS0+bWFwcGluZy0+aG9zdDsKPiAgIAlzdHJ1Y3QgdWJpZnNfaW5mbyAqYyA9IGlub2Rl
LT5pX3NiLT5zX2ZzX2luZm87Cj4gICAJc3RydWN0IHViaWZzX2lub2RlICp1aSA9IHViaWZzX2lu
b2RlKGlub2RlKTsKPiBAQCAtMTA3Niw2ICsxMDc4LDEyIEBAIHN0YXRpYyBpbnQgdWJpZnNfd3Jp
dGVwYWdlKHN0cnVjdCBwYWdlICpwYWdlLCBzdHJ1Y3Qgd3JpdGViYWNrX2NvbnRyb2wgKndiYykK
PiAgIAlyZXR1cm4gZXJyOwo+ICAgfQo+ICAgCj4gK3N0YXRpYyBpbnQgdWJpZnNfd3JpdGVwYWdl
cyhzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPiArCQlzdHJ1Y3Qgd3JpdGViYWNrX2Nv
bnRyb2wgKndiYykKPiArewo+ICsJcmV0dXJuIHdyaXRlX2NhY2hlX3BhZ2VzKG1hcHBpbmcsIHdi
YywgdWJpZnNfd3JpdGVwYWdlLCBOVUxMKTsKPiArfQo+ICsKClRoZXJlIGlzIGEgc21hbGwgZGlm
ZmVyZW5jZS4KYmVmb3JlIHBhdGNoIGFwcGxpZWQ6CmRvX3dyaXRlcGFnZXMgLT4gd3JpdGVfY2Fj
aGVfcGFnZXMgLT4gd3JpdGVwYWdlX2NiOgogIHViaWZzX3dyaXRlcGFnZQogIG1hcHBpbmdfc2V0
X2Vycm9yKG1hcHBpbmcsIHJldCkKClNvLCB3ZSBjYW4gZ2V0IGVycm9yIHJldHVybmVkIGZyb20g
ZXJyc2VxX2NoZWNrX2FuZF9hZHZhbmNlIGluIHN5bmNmcyAKc3lzY2FsbCBpZiB1Ymlmc193cml0
ZXBhZ2Ugb2NjdXJzIEVJTy4KCmFmdGVyIHBhdGNoIGFwcGxpZWQ6Cgpkb193cml0ZXBhZ2VzIC0+
IHViaWZzX3dyaXRlcGFnZXMgLT4gd3JpdGVfY2FjaGVfcGFnZXMgLT4gCnViaWZzX3dyaXRlcGFn
ZSwgbWFwcGluZyB3b24ndCBiZSBzZXQgZXJyb3IgaWYgdWJpZnNfd3JpdGVwYWdlIGZhaWxlZC4g
ClVuZm9ydHVuYXRlbHksIHViaWZzIGlzIG5vdCBhIGJsb2NrIGZpbGVzeXN0ZW0sIHNvIApzeW5j
X2ZpbGVzeXN0ZW0tPnN5bmNfYmxvY2tkZXZfbm93YWl0IHdpbGwgcmV0dXJuIDAuIEZpbmFsbHks
IHN5bmNmcyAKc3lzY2FsbCB3aWxsIHJldHVybiAwLgoKCj4gICAvKioKPiAgICAqIGRvX2F0dHJf
Y2hhbmdlcyAtIGNoYW5nZSBpbm9kZSBhdHRyaWJ1dGVzLgo+ICAgICogQGlub2RlOiBpbm9kZSB0
byBjaGFuZ2UgYXR0cmlidXRlcyBmb3IKPiBAQCAtMTYzNiw3ICsxNjQ0LDcgQEAgc3RhdGljIGlu
dCB1Ymlmc19zeW1saW5rX2dldGF0dHIoc3RydWN0IG1udF9pZG1hcCAqaWRtYXAsCj4gICAKPiAg
IGNvbnN0IHN0cnVjdCBhZGRyZXNzX3NwYWNlX29wZXJhdGlvbnMgdWJpZnNfZmlsZV9hZGRyZXNz
X29wZXJhdGlvbnMgPSB7Cj4gICAJLnJlYWRfZm9saW8gICAgID0gdWJpZnNfcmVhZF9mb2xpbywK
PiAtCS53cml0ZXBhZ2UgICAgICA9IHViaWZzX3dyaXRlcGFnZSwKPiArCS53cml0ZXBhZ2VzICAg
ICA9IHViaWZzX3dyaXRlcGFnZXMsCj4gICAJLndyaXRlX2JlZ2luICAgID0gdWJpZnNfd3JpdGVf
YmVnaW4sCj4gICAJLndyaXRlX2VuZCAgICAgID0gdWJpZnNfd3JpdGVfZW5kLAo+ICAgCS5pbnZh
bGlkYXRlX2ZvbGlvID0gdWJpZnNfaW52YWxpZGF0ZV9mb2xpbywKPiAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
