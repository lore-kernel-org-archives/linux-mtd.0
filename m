Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EB1C7618D
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 03:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KnRC1DtSV7Swf0PGy9B8GzLj3s3VyIFeladVT9929fk=; b=hxWk6RrSPDosFGZmDaWtniACiH
	bKmEer4JWqE+UYbl4U9KJmOuG9y5zBTX2WNh6ESdLczDv6A7Prd3EHuRU+/++3tpCOxTxN8bqlk0G
	EgS1yaJ5YvAC3VTyI0aPO2lJ1VJz2GtVzV+eeiXTSWpz9Cy1B/0D8MfT4mU/d2OpQ1ZIBeLlu6sJY
	SIYMUgg+i4VTnBClgJtE3pYXDHImwV2OV35tsMpiQbF1iJ8+RiOk58YzhenN0j+lgwbqg7z/faxyY
	CxY8xD5DzeFSbWXxvGK9NTddJO1gbZZvP7KuECX8WrZ6peb8vdlWJKCMzcGHNzRYhNW+9Y2Z7vXCl
	dN/5WukQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkGRM-006Eba-1k;
	Thu, 06 Apr 2023 03:37:36 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkGRJ-006EZv-0F
	for linux-mtd@lists.infradead.org;
	Thu, 06 Apr 2023 03:37:34 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PsRt90MNrzSqlF;
	Thu,  6 Apr 2023 11:33:37 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 6 Apr 2023 11:36:48 +0800
Subject: Re: [PATCH] ubifs: remove unnecessary kobject_del()
To: Yangtao Li <frank.li@vivo.com>, Richard Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-ext4@vger.kernel.org>, <tytso@mit.edu>, <jack@suse.com>, yangerkun
	<yangerkun@huawei.com>
References: <20230405130747.66006-1-frank.li@vivo.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <828681d9-153f-2499-baa6-9a5e782be586@huawei.com>
Date: Thu, 6 Apr 2023 11:36:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230405130747.66006-1-frank.li@vivo.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_203733_456959_F0A8D76D 
X-CRM114-Status: GOOD (  15.71  )
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

SGksIFlhbmd0YW8KPiBrb2JqZWN0X3B1dCgpIGFjdHVhbGx5IGNvdmVycyBrb2JqZWN0IHJlbW92
YWwgYXV0b21hdGljYWxseSwgd2hpY2ggaXMKPiBzaW5nbGUgc3RhZ2UgcmVtb3ZhbC4gU28gaXQg
aXMgc2FmZSB0byBraWxsIGtvYmplY3RfZGVsKCkgZGlyZWN0bHkuCj4gCj4gU2lnbmVkLW9mZi1i
eTogWWFuZ3RhbyBMaSA8ZnJhbmsubGlAdml2by5jb20+Cj4gLS0tCj4gICBmcy91Ymlmcy9zeXNm
cy5jIHwgMSAtCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9mcy91Ymlmcy9zeXNmcy5jIGIvZnMvdWJpZnMvc3lzZnMuYwo+IGluZGV4IDFjOTU4MTQ4
YmI4Ny4uMWZmZGMzYzliMzQwIDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL3N5c2ZzLmMKPiArKysg
Yi9mcy91Ymlmcy9zeXNmcy5jCj4gQEAgLTEzMCw3ICsxMzAsNiBAQCBpbnQgdWJpZnNfc3lzZnNf
cmVnaXN0ZXIoc3RydWN0IHViaWZzX2luZm8gKmMpCj4gICAKPiAgIHZvaWQgdWJpZnNfc3lzZnNf
dW5yZWdpc3RlcihzdHJ1Y3QgdWJpZnNfaW5mbyAqYykKPiAgIHsKPiAtCWtvYmplY3RfZGVsKCZj
LT5rb2JqKTsKPiAgIAlrb2JqZWN0X3B1dCgmYy0+a29iaik7Cj4gICAJd2FpdF9mb3JfY29tcGxl
dGlvbigmYy0+a29ial91bnJlZ2lzdGVyKTsKPiAgIAo+IAoKVGhpcyBwYXRjaCBsb29rcyBoYXJt
bGVzcyBhdCB0aGUgdmlldyBvZiB1Ymlmcywga29iamVjdF9jbGVhbnVwKCkgCmZpbmFsbHkgaW52
b2tlcyBfX2tvYmplY3RfZGVsIGFuZCByZWxlYXNlcyBwYXJlbnQganVzdCBsaWtlIAprb2JqZWN0
X2RlbCgpIGRvZXMuIEEgZGlmZmVyZW5jZSBpcyB0aGF0IHRoZSByZWxlYXNpbmcgc2VxdWVuY2Ug
b2YgCmtvYmoncyBwYXJlbnQgaXMgcHV0IGFmdGVyIHJlbGVhc2luZyBrb2JqLgoKQWJvdXQgdGhl
IHVzZSBjYXNlIG9mIGtvYmplY3RfZGVsKCksIHdlIG1heSByZWZlciB0byBvdGhlciBmaWxlc3lz
dGVtcycgCmltcGxlbWVudGF0aW9ucywgZWcuIGV4dDRfcHV0X3N1cGVyKCkuIEZpcnN0bHkgZXh0
NF91bnJlZ2lzdGVyX3N5c2ZzKCkgCnJlbW92ZXMgYWxsIHN5c2ZzIGludGVyZmFjZXMsIHRoZW4g
amJkMl9qb3VybmFsX2Rlc3Ryb3koKSBkZXN0cm95cyAKc2JpLT5zX2pvdXJuYWwsIGZpbmFsbHkg
c2JpLT5zX2tvYmogaXMgcmVsZWFzZWQuIEhlcmUga29iamVjdF9kZWwoKSAKc3RvcHMgdXNlciBh
Y2Nlc3Npbmcgc2JpLT5zX2pvdXJuYWwgYnkgc3lzZnMgaW50ZXJmYWNlIApqb3VybmFsX3Rhc2uj
rGJlY2F1c2Ugc2JpLT5zX2pvdXJuYWwgd2lsbCBiZSByZWxlYXNlZCBzb29uIGJlZm9yZSAKa29i
amVjdF9wdXQoKS4KCkkgdGhpbmsgd2Ugc2hvdWxkIHN0aWxsIHJlc2VydmUgdGhlICdyZWR1bmRh
bnQnIGtvYmplY3RfZGVsKCksIHJlbW92aW5nIAppdCB3b24ndCBicmluZyBhbnkgcGVyZm9ybWFu
Y2UgaW1wcm92ZW1lbnQuCgpCVFcsIGluIGV4dDRfcHV0X3N1cGVyKCksIGZsdXNoX3N0YXNoZWRf
ZXJyb3Jfd29yayh3aGljaCBjb3VsZCBhY2Nlc3MgCnNiaS0+c19rb2JqKSBpcyBmbHVzaGVkIGFm
dGVyIGtvYmplY3QgcmVtb3ZlZC4gaXMgaXQgb2theSB0byByZXBsYWNlIAprb2JqZWN0X2RlbCgm
c2JpLT5zX2tvYmopIHdpdGgga29iamVjdF9wdXQoJnNiaS0+c19rb2JqKT8KCmRpZmYgLS1naXQg
YS9mcy9leHQ0L3N1cGVyLmMgYi9mcy9leHQ0L3N1cGVyLmMKaW5kZXggYTIyNDE3ZDExM2NhLi45
ZTM3NDQwOTlkMWUgMTAwNjQ0Ci0tLSBhL2ZzL2V4dDQvc3VwZXIuYworKysgYi9mcy9leHQ0L3N1
cGVyLmMKQEAgLTEyOTYsOCArMTI5Niw2IEBAIHN0YXRpYyB2b2lkIGV4dDRfcHV0X3N1cGVyKHN0
cnVjdCBzdXBlcl9ibG9jayAqc2IpCiAgICAgICAgICAqIE5vdyB0aGF0IHdlIGFyZSBjb21wbGV0
ZWx5IGRvbmUgc2h1dHRpbmcgZG93biB0aGUKICAgICAgICAgICogc3VwZXJibG9jaywgd2UgbmVl
ZCB0byBhY3R1YWxseSBkZXN0cm95IHRoZSBrb2JqZWN0LgogICAgICAgICAgKi8KLSAgICAgICBr
b2JqZWN0X3B1dCgmc2JpLT5zX2tvYmopOwotICAgICAgIHdhaXRfZm9yX2NvbXBsZXRpb24oJnNi
aS0+c19rb2JqX3VucmVnaXN0ZXIpOwogICAgICAgICBpZiAoc2JpLT5zX2Noa3N1bV9kcml2ZXIp
CiAgICAgICAgICAgICAgICAgY3J5cHRvX2ZyZWVfc2hhc2goc2JpLT5zX2Noa3N1bV9kcml2ZXIp
OwogICAgICAgICBrZnJlZShzYmktPnNfYmxvY2tncm91cF9sb2NrKTsKZGlmZiAtLWdpdCBhL2Zz
L2V4dDQvc3lzZnMuYyBiL2ZzL2V4dDQvc3lzZnMuYwppbmRleCAxMmQ2MjUyZTNlMjIuLmJlOTJh
MDliYjhhMCAxMDA2NDQKLS0tIGEvZnMvZXh0NC9zeXNmcy5jCisrKyBiL2ZzL2V4dDQvc3lzZnMu
YwpAQCAtNTYyLDcgKzU2Miw4IEBAIHZvaWQgZXh0NF91bnJlZ2lzdGVyX3N5c2ZzKHN0cnVjdCBz
dXBlcl9ibG9jayAqc2IpCgogICAgICAgICBpZiAoc2JpLT5zX3Byb2MpCiAgICAgICAgICAgICAg
ICAgcmVtb3ZlX3Byb2Nfc3VidHJlZShzYi0+c19pZCwgZXh0NF9wcm9jX3Jvb3QpOwotICAgICAg
IGtvYmplY3RfZGVsKCZzYmktPnNfa29iaik7CisgICAgICAga29iamVjdF9wdXQoJnNiaS0+c19r
b2JqKTsKKyAgICAgICB3YWl0X2Zvcl9jb21wbGV0aW9uKCZzYmktPnNfa29ial91bnJlZ2lzdGVy
KTsKICB9CgogIGludCBfX2luaXQgZXh0NF9pbml0X3N5c2ZzKHZvaWQpCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
