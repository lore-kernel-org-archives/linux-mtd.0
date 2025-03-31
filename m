Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CFCC3600B
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Mar 2025 12:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xE0dWiseYX+Go2m1YI2+5SaP0MgDkr4pMkLjyTkoswI=; b=EI7eg0aninYp6xx1AE/CLI3yD0
	wUT2CgzerB3kBrMkgTtnhmr2i1uH/8R8AMlpuACBYc0lVYOGkLUWKgoKhyOcn9daq0ZXzMIpuypss
	d9B/Y3eBkNAZjkSyJ8v03dxuMi+3C0U7k+nrUAUjNN5xDga9bweV2PZ3MJwqkTste4+Zp5zdgz8t+
	vdYnI3cGwNa56QLkdtfu299eef2e61StcLGDjqW9n8bMq1mhqE/oanHZDcB4F5USu71C0o2foVRRZ
	TPneajVTwaIHWd9Msp/mubnLfSBL9PhiiNBIu/JeGsL6FtW3m3mojQdhMTz11KqRlIQ/8xSTJ1M8a
	hJ+SrbwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzEWa-00000000NjE-3nwN;
	Mon, 31 Mar 2025 12:45:56 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzEUp-00000000NSN-3uFL
	for linux-mtd@lists.infradead.org;
	Mon, 31 Mar 2025 12:44:10 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZR9gx5SCCzvWpx;
	Mon, 31 Mar 2025 20:39:57 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id C72EC14027D;
	Mon, 31 Mar 2025 20:43:56 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 31 Mar 2025 20:43:56 +0800
Subject: Re: [bug report] UBI: Unsorted Block Images
To: Dan Carpenter <dan.carpenter@linaro.org>, "Artem B. Bityutskiy"
	<dedekind@linutronix.de>
CC: <linux-mtd@lists.infradead.org>
References: <b2e341b8-519a-4136-9717-9aa00c90efb1@stanley.mountain>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <4518b0db-deab-15d5-7824-74db77d3682b@huawei.com>
Date: Mon, 31 Mar 2025 20:43:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <b2e341b8-519a-4136-9717-9aa00c90efb1@stanley.mountain>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_054408_380133_AB084C92 
X-CRM114-Status: GOOD (  13.83  )
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

1NogMjAyNS8zLzMxIDE3OjQ2LCBEYW4gQ2FycGVudGVyINC0tcA6CkhpIERhbiwKPiBIZWxsbyBB
cnRlbSBCLiBCaXR5dXRza2l5LAo+IAo+IENvbW1pdCA4MDFjMTM1Y2U3M2QgKCJVQkk6IFVuc29y
dGVkIEJsb2NrIEltYWdlcyIpIGZyb20gSnVuIDI3LCAyMDA2Cj4gKGxpbnV4LW5leHQpLCBsZWFk
cyB0byB0aGUgZm9sbG93aW5nIFNtYXRjaCBzdGF0aWMgY2hlY2tlciB3YXJuaW5nOgo+IAo+IAlk
cml2ZXJzL210ZC91YmkvdnRibC5jOjg0NCB1YmlfcmVhZF92b2x1bWVfdGFibGUoKQo+IAl3YXJu
OiAndWJpLT52dGJsJyBjYW4gYWxzbyBiZSBOVUxMCj4gClsuLi5dCj4gICAgIDQzMSAgICAgICAg
ICBpZiAoIWxlYl9jb3JydXB0ZWRbMF0pIHsKPiAgICAgNDMyICAgICAgICAgICAgICAgICAgLyog
TEVCIDAgaXMgT0sgKi8KPiAgICAgNDMzICAgICAgICAgICAgICAgICAgaWYgKGxlYlsxXSkKPiAg
ICAgNDM0ICAgICAgICAgICAgICAgICAgICAgICAgICBsZWJfY29ycnVwdGVkWzFdID0gbWVtY21w
KGxlYlswXSwgbGViWzFdLAo+ICAgICA0MzUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdWJpLT52dGJsX3NpemUpOwo+ICAgICA0MzYgICAgICAgICAg
ICAgICAgICBpZiAobGViX2NvcnJ1cHRlZFsxXSkgewo+ICAgICA0MzcgICAgICAgICAgICAgICAg
ICAgICAgICAgIHViaV93YXJuKHViaSwgInZvbHVtZSB0YWJsZSBjb3B5ICMyIGlzIGNvcnJ1cHRl
ZCIpOwo+ICAgICA0MzggICAgICAgICAgICAgICAgICAgICAgICAgIGVyciA9IGNyZWF0ZV92dGJs
KHViaSwgYWksIDEsIGxlYlswXSk7Cj4gICAgIDQzOSAgICAgICAgICAgICAgICAgICAgICAgICAg
aWYgKGVycikKPiAgICAgNDQwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8g
b3V0X2ZyZWU7Cj4gICAgIDQ0MSAgICAgICAgICAgICAgICAgICAgICAgICAgdWJpX21zZyh1Ymks
ICJ2b2x1bWUgdGFibGUgd2FzIHJlc3RvcmVkIik7Cj4gICAgIDQ0MiAgICAgICAgICAgICAgICAg
IH0KPiAgICAgNDQzCj4gICAgIDQ0NCAgICAgICAgICAgICAgICAgIC8qIEJvdGggTEVCIDEgYW5k
IExFQiAyIGFyZSBPSyBhbmQgY29uc2lzdGVudCAqLwo+ICAgICA0NDUgICAgICAgICAgICAgICAg
ICB2ZnJlZShsZWJbMV0pOwo+ICAgICA0NDYgICAgICAgICAgICAgICAgICByZXR1cm4gbGViWzBd
Owo+ICAgICA0NDcgICAgICAgICAgfSBlbHNlIHsKPiAgICAgNDQ4ICAgICAgICAgICAgICAgICAg
LyogTEVCIDAgaXMgY29ycnVwdGVkIG9yIGRvZXMgbm90IGV4aXN0ICovCj4gICAgIDQ0OSAgICAg
ICAgICAgICAgICAgIGlmIChsZWJbMV0pIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF5eXl5eXgo+IElzIHRoaXMgTlVMTCBjaGVjayByZXF1aXJlZD8KClllcywgbGViIDEgY291bGQg
YmUgY29ycnVwdGVkKGVnLiBiYWQgZWMgaGVhZGVyKSwgdGhlbiB0aGUgbGViIDEgd29uJ3QgCmJl
IHNjYW5uZWQgZHVyaW5nIGF0dGFjaGluZywgd2hpY2ggbWVhbnMgJ2xlYlsxXScgd29uJ3QgYmUg
aW5pdGlhbGl6ZWQgCmJ5IHByb2Nlc3NfbHZvbCgpLgo+IAo+ICAgICA0NTAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGxlYl9jb3JydXB0ZWRbMV0gPSB2dGJsX2NoZWNrKHViaSwgbGViWzFdKTsK
PiAgICAgNDUxICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAobGViX2NvcnJ1cHRlZFsxXSA8
IDApCj4gICAgIDQ1MiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dF9m
cmVlOwo+ICAgICA0NTMgICAgICAgICAgICAgICAgICB9Cj4gICAgIDQ1NCAgICAgICAgICAgICAg
ICAgIGlmIChsZWJfY29ycnVwdGVkWzFdKSB7Cj4gICAgIDQ1NSAgICAgICAgICAgICAgICAgICAg
ICAgICAgLyogQm90aCBMRUIgMCBhbmQgTEVCIDEgYXJlIGNvcnJ1cHRlZCAqLwo+ICAgICA0NTYg
ICAgICAgICAgICAgICAgICAgICAgICAgIHViaV9lcnIodWJpLCAiYm90aCB2b2x1bWUgdGFibGVz
IGFyZSBjb3JydXB0ZWQiKTsKPiAgICAgNDU3ICAgICAgICAgICAgICAgICAgICAgICAgICBnb3Rv
IG91dF9mcmVlOwo+ICAgICA0NTggICAgICAgICAgICAgICAgICB9Cj4gICAgIDQ1OQo+ICAgICA0
NjAgICAgICAgICAgICAgICAgICB1Ymlfd2Fybih1YmksICJ2b2x1bWUgdGFibGUgY29weSAjMSBp
cyBjb3JydXB0ZWQiKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXl4KPiBUaGlzIHNob3VsZCBzYXkgIzAgSSB0aGluaz8KCkkgZ3Vl
c3MgdGhhdCAnIzEnIHJlZmVycyB0byBsZWIgMCBhbmQgJyMyJyByZWZlcnMgdG8gbGViIDEuCj4g
Cj4gICAgIDQ2MSAgICAgICAgICAgICAgICAgIGVyciA9IGNyZWF0ZV92dGJsKHViaSwgYWksIDAs
IGxlYlsxXSk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF5eXl5eXgo+ICAgICA0NjIgICAgICAgICAgICAgICAgICBpZiAoZXJyKQo+ICAg
ICA0NjMgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0X2ZyZWU7Cj4gICAgIDQ2NCAg
ICAgICAgICAgICAgICAgIHViaV9tc2codWJpLCAidm9sdW1lIHRhYmxlIHdhcyByZXN0b3JlZCIp
Owo+ICAgICA0NjUKPiAgICAgNDY2ICAgICAgICAgICAgICAgICAgdmZyZWUobGViWzBdKTsKPiAg
ICAgNDY3ICAgICAgICAgICAgICAgICAgcmV0dXJuIGxlYlsxXTsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF5eXl5eXgo+IFRoZSBOVUxMIGNoZWNrIG9uIGxpbmUgNDQ5IG1ha2Vz
IFNtYXRjaCB0aGluayB0aGlzIGNhbiBiZSBOVUxMLgoKSW4gdGhlb3J5LCB0aGUgJ05VTEwnIHdv
bid0IGJlIGEgcmV0dXJuIHZhbHVlLCB0aGVzZSBjYXNlcyBhcmUgYXZvaWRlZCAKYnkgbGViX2Nv
cnJ1cHRlZCBjaGVja2luZyBicmFuY2hlcy4KPiAKPiAgICAgNDY4ICAgICAgICAgIH0KPiAgICAg
NDY5Cj4gICAgIDQ3MCAgb3V0X2ZyZWU6Cj4gICAgIDQ3MSAgICAgICAgICB2ZnJlZShsZWJbMF0p
Owo+ICAgICA0NzIgICAgICAgICAgdmZyZWUobGViWzFdKTsKPiAgICAgNDczICAgICAgICAgIHJl
dHVybiBFUlJfUFRSKGVycik7Cj4gICAgIDQ3NCAgfQo+IAo+IAo+IHJlZ2FyZHMsCj4gZGFuIGNh
cnBlbnRlcgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdAo+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo+IC4KPiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
