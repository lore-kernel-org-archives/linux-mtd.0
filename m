Return-Path: <SRS0=UEO3=YJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70063FA3728
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 13:07:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F370320854
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 13:07:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sLS+QhSp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F370320854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zBuWZNrI7RlMZpsEj+CbPHC0CVpAW0/nCu+rqf7iJvI=; b=sLS+QhSpsAdcZQ
	Lzjt1ltrpV0NYDi02F3nu2JznXPbVEq0GnQKGrJfyUFyO5T80p8ii5XZQsx2tR1g8tUq20Q1cFbkd
	LKLzmc3IReay70VbDUOB3CnA/wpXuBAjLwuLeraYib38AKg9rxEvCA21ikdOawrfQzz2fMMF+i6+I
	/Y1QsD+sxAaOJi42HYK/WAaY2kVBLN9ta2rTh8KG4PWrSCyAIpmbApY9pLrB1PWmh0CV78uRuFlAb
	WeF2Oc8uC8szqY0OEfXX9uYgR7p3h4bWzuLrsamsZrJd+Z5zpBMzxCNAA8SFGqZArMcnQpuTSu9HQ
	u23X7eXoo7XOb1HSaVNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKj13-0000z4-Iu; Wed, 16 Oct 2019 13:07:01 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKj0z-0000xw-Rj
 for linux-mtd@lists.infradead.org; Wed, 16 Oct 2019 13:06:59 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id BEA03C55B0DD95B0397E;
 Wed, 16 Oct 2019 21:06:53 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.14) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Wed, 16 Oct 2019
 21:06:53 +0800
Subject: Re: [PATCH] mtd: blkdevs: protect tr->devs list by mtd_table_mutex
To: Richard Weinberger <richard@nod.at>
References: <20190929141157.115845-1-houtao1@huawei.com>
 <CAFLxGvwQ=4UOuscf0uuoOvckrncF2RC+rF_Pr70SpayFKfCg7Q@mail.gmail.com>
 <205a5e75-e904-8c8f-a386-f3f51c7c6a01@huawei.com>
 <449133042.24923.1571223967091.JavaMail.zimbra@nod.at>
From: Hou Tao <houtao1@huawei.com>
Message-ID: <14d8a700-de90-efb6-3137-f0402af05d16@huawei.com>
Date: Wed, 16 Oct 2019 21:06:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <449133042.24923.1571223967091.JavaMail.zimbra@nod.at>
Content-Language: en-US
X-Originating-IP: [10.177.31.14]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_060658_072868_C09CAB95 
X-CRM114-Status: GOOD (  18.06  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAyMDE5LzEwLzE2IDE5OjA2LCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4gLS0t
LS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBWb246ICJIb3UgVGFvIiA8aG91dGFvMUBo
dWF3ZWkuY29tPgo+PiBBbjogIlJpY2hhcmQgV2VpbmJlcmdlciIgPHJpY2hhcmQud2VpbmJlcmdl
ckBnbWFpbC5jb20+Cj4+IENDOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVh
ZC5vcmc+LCAiTWlxdWVsIFJheW5hbCIgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+LCAiVmln
bmVzaCBSYWdoYXZlbmRyYSIKPj4gPHZpZ25lc2hyQHRpLmNvbT4sICJyaWNoYXJkIiA8cmljaGFy
ZEBub2QuYXQ+LCAiTWF4aW0gTGV2aXRza3kiIDxtYXhpbWxldml0c2t5QGdtYWlsLmNvbT4sICJN
YXJlayBWYXN1dCIKPj4gPG1hcmVrLnZhc3V0QGdtYWlsLmNvbT4sICJCcmlhbiBOb3JyaXMiIDxj
b21wdXRlcnNmb3JwZWFjZUBnbWFpbC5jb20+LCAiRGF2aWQgV29vZGhvdXNlIiA8ZHdtdzJAaW5m
cmFkZWFkLm9yZz4KPj4gR2VzZW5kZXQ6IE1pdHR3b2NoLCAxNi4gT2t0b2JlciAyMDE5IDEyOjU1
OjEyCj4+IEJldHJlZmY6IFJlOiBbUEFUQ0hdIG10ZDogYmxrZGV2czogcHJvdGVjdCB0ci0+ZGV2
cyBsaXN0IGJ5IG10ZF90YWJsZV9tdXRleAo+IAo+PiBIaSwKPj4KPj4gT24gMjAxOS8xMC8xNiA0
OjEwLCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4+PiBPbiBTdW4sIFNlcCAyOSwgMjAxOSBh
dCA0OjA1IFBNIEhvdSBUYW8gPGhvdXRhbzFAaHVhd2VpLmNvbT4gd3JvdGU6Cj4+Pj4KPj4+PiBU
aGVyZSBtYXkgYmUgbGlzdCBjb3JydXB0aW9uIGlmIHRoZXJlIGFyZSBjb25jdXJyZW50IGxpc3Qg
dHJhdmVyc2FsCj4+Pj4gYW5kIGxpc3QgZGVsZXRpb24gb24gdHItPmRldnMgYXMgc2hvd2VkIGlu
IHRoZSBmb2xsb3dpbmcgY2FzZToKPj4+Pgo+Pj4+IENQVSAwICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIENQVSAxCj4+Pj4KPj4+PiBvcGVuIC9kZXYvbXRkYmxvY2sxCj4+Pj4KPj4+PiAv
LyByZW1vdmUgbXRkMQo+Pj4+IGJsa3RyYW5zX25vdGlmeV9yZW1vdmUoKQo+Pj4+ICAgICBkZWxf
bXRkX2Jsa3RyYW5zX2RldigpCj4+Pj4KPj4+PiBjbG9zZSAvZGV2L210ZGJsb2NrMQo+Pj4+ICAg
YmxrdHJhbnNfcmVsZWFzZQo+Pj4+ICAgICBibGt0cmFuc19kZXZfcHV0Cj4+Pj4gICAgICAgYWNx
dWlyZSBibGt0cmFuc19yZWZfbXV0ZXggICAgIC8vIHJlbW92ZSBtdGQwCj4+Pj4gICAgICAgLy8g
dGhlIGZpbmFsIHJlbGVhc2UgICAgICAgICAgIGFjcXVpcmUgbXRkX3RhYmxlX211dGV4Cj4+Pj4g
ICAgICAgYmxrdHJhbnNfZGV2X3JlbGVhc2UoKSAgICAgICAgIGJsa3RyYW5zX25vdGlmeV9yZW1v
dmUoKQo+Pj4+ICAgICAgICAgLy8gcmVtb3ZlIG10ZGJsb2NrMSAgICAgICAgICAgIC8vIG5leHQg
aXMgbXRkYmxvY2sxCj4+Pj4gICAgICAgICBsaXN0X2RlbCgmZGV2LT5saXN0KSAgICAgICAgICAg
bGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKCkKPj4+Pgo+Pj4+IFdlIGNvdWxkIGZpeCB0aGUgcHJv
YmxlbSBieSBhY3F1aXJpbmcgYmxrdHJhbnNfcmVmX211dGV4IGR1cmluZwo+Pj4+IHRoZSB0cmF2
ZXJzYWwgb2YgdHItPmRldnMsIGJ1dCBibGt0cmFuc19yZWZfbXV0ZXggbmVlZHMgdG8gYmUgcmVs
ZWFzZWQKPj4+PiBiZWZvcmUgaW52b2tpbmcgdHItPnJlbW90ZV9kZXYoKSwgc28gd2UgYWxzbyBu
ZWVkIHRvIGluY3JlYXNlIHRoZSBrcmVmCj4+Pj4gb2YgY3VycmVudCBkZXZpY2UgZWxzZSB0aGUg
ZGV2aWNlIG1heSBiZSBmcmVlZCBhbmQgZGVjcmVhc2UgdGhlIGtyZWYKPj4+PiBhZnRlciB0aGUg
cmVtb3ZhbC4KPj4+Pgo+Pj4+IE9yIHdlIGNvdWxkIG1vdmUgdGhlIGxpc3QgZGVsZXRpb24gdG8g
ZGVsX210ZF9ibGt0cmFuc19kZXYoKSwgYW5kIHByb3RlY3QKPj4+PiB0aGUgb3BlcmF0aW9ucyBv
biB0ci0+ZGV2cyBieSBtdGRfdGFibGVfbXV0ZXggd2hpY2ggaGFzIGFscmVhZHkgYmUgdGFrZW4u
Cj4+Pj4KPj4+PiBUaGUgbGF0dGVyIGZpeCBpcyBzaW1wbGVyLiBXZSBhbHNvIGNhbiByZW1vdmUg
dGhlIHVubmVjZXNzYXJ5IGFjcXVpc2l0aW9ucwo+Pj4+IG9mIGJsa3RyYW5zX3JlZl9tdXRleCBp
biBhZGRfbXRkX2Jsa3RyYW5zX2RldigpIGJlY2F1c2Ugb3BlcmF0aW9ucyBvbgo+Pj4+IHRyLT5k
ZXZzIGhhdmUgYWxyZWFkeSBiZWVuIHByb3RlY3RlZCBieSBtdGRfdGFibGVfbXV0ZXguCj4+Pj4K
Pj4+PiBGaXhlczogMDQ4ZDg3MTk5NTY2ICgibXRkOiBibGt0cmFuczogSG90cGx1ZyBmaXhlcyIp
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSG91IFRhbyA8aG91dGFvMUBodWF3ZWkuY29tPgo+Pj4+IC0t
LQo+Pj4+IEkgZm91bmQgdGhlIHByb2JsZW0gYnkgY29kZSByZXZpZXcsIGFuZCBjb3VsZCBub3Qg
ZmluZCBhIHdheSB0bwo+Pj4+IGVuc3VyZSB0aGUgcHJvYmxlbSwgYmVjYXVzZSB0aGUgcmVtb3Zh
bCBvZiBtdGQgZGV2aWNlcyBhbG1vc3QKPj4+PiBjb21lcyBmcm9tIHRoZSByZW1vdmFsIG9mIG1v
ZHVsZXMsIGFuZCB0aGUgb3BlbiBvZiAvZGV2L210ZGJsb2NrWAo+Pj4+IHdpbGwgcHJldmVudCB0
aGUgbW9kdWxlIGZyb20gcmVtb3ZpbmcuCj4+Pgo+Pj4gSSdtIGNvbmZ1c2VkLiBDYW4gdGhlIHBy
b2JsZW0gb25seSBoYXBwZW4gaWYgeW91IHJlbW92ZSBhIG10ZCB3aGlsZQo+Pj4gaXQgaXMgb3Bl
bj8KPj4+Cj4+IE5vLiBUaGUgcHJvYmxlbSBtYXkgaGFwcGVuIHdoZW4gY2xvc2luZyBhIG10ZCBi
bG9jayBkZXZpY2UgKGluc3RlYWQgb2YKPj4gdGhlIG10ZCBjaGFyIGRldmljZSkgZm9yIHdoaWNo
IGl0cyBtdGQgZGV2aWNlIGhhZCBhbHJlYWR5IGJlZW4gcmVtb3ZlZC4KPj4KPj4gVGhlIHJlYXNv
biB3aHkgSSBjYW4gbm90IGNvbmZpcm0gdGhlIHByb2JsZW0gaXMgdGhhdCBJIGFtIHRyeWluZyB0
bwo+PiBjb25maXJtIHRoZSBwcm9ibGVtIGJ5IHRoZSBmb2xsb3dpbmcgc3RlcHM6Cj4+ICgxKSBp
bnNtb2QgYmxvY2sybXRkLmtvIHRvIGNyZWF0ZSBhIG10ZCBkZXZpY2UgKGUuZy4sIC9kZXYvbXRk
MCkKPj4gKDIpIG9wZW4gL2Rldi9tdGRibG9jazAKPj4gKDMpIHJlbW92ZSAvZGV2L210ZDAgYnkg
cmVtb3ZpbmcgYmxvY2sybXRkLmtvCj4+Cj4+IHN0ZXAgKDMpIGFsd2F5cyBmYWlscyBiZWNhdXNl
IHRoZSBvcGVuaW5nIG9mIC9kZXYvbXRkYmxvY2swIGhhcyBhbHJlYWR5Cj4+IGluY3JlYXNlZCB0
aGUgcmVmZXJlbmNlIGNvdW50IG9mIGJsb2NrMm10ZC5rbywgc28gL2Rldi9tdGQwIGNhbiBub3Qg
YmUgcmVtb3ZlZC4KPiAKPiBPay4gQnV0IHllYWgsIHRoZSBwcm9ibGVtIGlzIHJlYWwgYW5kIEkn
bSBzdXJlIHdpdGggdWJpK2dsdWViaSBpdCBjYW4gYmUgdHJpZ2dlcmVkLgo+IApUaGFua3MgZm9y
IHlvdXIgc3VnZ2VzdGlvbnMuIEkgd2lsbCB0cnkgdG8gdXNlIHViaStnbHVlYmkgdG8gY29uZmly
bSB0aGUgcHJvYmxlbS4KClJlZ2FyZHMsClRhbwo+IFRoYW5rcywKPiAvL3JpY2hhcmQKPiAKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8KPiAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
