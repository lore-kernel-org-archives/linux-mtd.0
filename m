Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284ADC36008
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Apr 2025 06:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yj5Hg6DOzOUpje1pRpj5u693H4rnTGeWS7QpAaZ8or4=; b=xmZn04XtfgHkKBBj/GFHWQSCUa
	bGTjR0La4gIm+gK1BGr0QdNLKc90tBpqpGaY6TqUZtPGofeLgtPtuttE/lEBq1q8fRHdc9Jg+URTf
	P7YHjONCWiL+WgudY3wLKMlkX9HvcRMJX5tdsXQ4ArTE9PpfFxQ/WBdsMjExy5+1+agKK3EvKJtZx
	L4WBUni8v/LimRpyDdTsZC4u+Z2t6Rl0s4Kj//mJjb30rqzeRPcb5Ku3GPwdRIfsI9tTQuLAXeMpA
	pCEPO/3kBDk8XVjzS/K/zxyl0J6JxVobnZESzqYalWZW3WII4DJl1xu6xHGAu+mb2ytgWSDwyrVgX
	QHTex1fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzVPS-000000027kt-0Ooh;
	Tue, 01 Apr 2025 06:47:42 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzVOX-000000027iX-0KfM
	for linux-mtd@lists.infradead.org;
	Tue, 01 Apr 2025 06:46:48 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4ZRdhF45RYz1f1VT;
	Tue,  1 Apr 2025 14:41:49 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 0176B1401E9;
	Tue,  1 Apr 2025 14:46:37 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 1 Apr 2025 14:46:36 +0800
Subject: Re: [bug report] UBI: Unsorted Block Images
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: "Artem B. Bityutskiy" <dedekind@linutronix.de>,
	<linux-mtd@lists.infradead.org>
References: <b2e341b8-519a-4136-9717-9aa00c90efb1@stanley.mountain>
 <4518b0db-deab-15d5-7824-74db77d3682b@huawei.com>
 <2d283e0e-9d53-4160-a098-33907de08ef6@stanley.mountain>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <c121ca20-4d65-2b7e-a434-71b1ecd4ffea@huawei.com>
Date: Tue, 1 Apr 2025 14:46:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2d283e0e-9d53-4160-a098-33907de08ef6@stanley.mountain>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_234645_462164_0636BD06 
X-CRM114-Status: GOOD (  12.74  )
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjUvMy8zMSAyMzoxNCwgRGFuIENhcnBlbnRlciDlhpnpgZM6Cj4gT24gTW9uLCBNYXIg
MzEsIDIwMjUgYXQgMDg6NDM6NTVQTSArMDgwMCwgWmhpaGFvIENoZW5nIHdyb3RlOgo+PiDlnKgg
MjAyNS8zLzMxIDE3OjQ2LCBEYW4gQ2FycGVudGVyIOWGmemBkzoKPj4gSGkgRGFuLAo+Pj4gSGVs
bG8gQXJ0ZW0gQi4gQml0eXV0c2tpeSwKPj4+Cj4+PiBDb21taXQgODAxYzEzNWNlNzNkICgiVUJJ
OiBVbnNvcnRlZCBCbG9jayBJbWFnZXMiKSBmcm9tIEp1biAyNywgMjAwNgo+Pj4gKGxpbnV4LW5l
eHQpLCBsZWFkcyB0byB0aGUgZm9sbG93aW5nIFNtYXRjaCBzdGF0aWMgY2hlY2tlciB3YXJuaW5n
Ogo+Pj4KPj4+IAlkcml2ZXJzL210ZC91YmkvdnRibC5jOjg0NCB1YmlfcmVhZF92b2x1bWVfdGFi
bGUoKQo+Pj4gCXdhcm46ICd1YmktPnZ0YmwnIGNhbiBhbHNvIGJlIE5VTEwKPj4+Cj4+IFsuLi5d
Cj4+PiAgICAgIDQzMSAgICAgICAgICBpZiAoIWxlYl9jb3JydXB0ZWRbMF0pIHsKPj4+ICAgICAg
NDMyICAgICAgICAgICAgICAgICAgLyogTEVCIDAgaXMgT0sgKi8KPj4+ICAgICAgNDMzICAgICAg
ICAgICAgICAgICAgaWYgKGxlYlsxXSkKPj4+ICAgICAgNDM0ICAgICAgICAgICAgICAgICAgICAg
ICAgICBsZWJfY29ycnVwdGVkWzFdID0gbWVtY21wKGxlYlswXSwgbGViWzFdLAo+Pj4gICAgICA0
MzUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWJp
LT52dGJsX3NpemUpOwo+Pj4gICAgICA0MzYgICAgICAgICAgICAgICAgICBpZiAobGViX2NvcnJ1
cHRlZFsxXSkgewo+Pj4gICAgICA0MzcgICAgICAgICAgICAgICAgICAgICAgICAgIHViaV93YXJu
KHViaSwgInZvbHVtZSB0YWJsZSBjb3B5ICMyIGlzIGNvcnJ1cHRlZCIpOwo+Pj4gICAgICA0Mzgg
ICAgICAgICAgICAgICAgICAgICAgICAgIGVyciA9IGNyZWF0ZV92dGJsKHViaSwgYWksIDEsIGxl
YlswXSk7Cj4+PiAgICAgIDQzOSAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGVycikKPj4+
ICAgICAgNDQwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0X2ZyZWU7
Cj4+PiAgICAgIDQ0MSAgICAgICAgICAgICAgICAgICAgICAgICAgdWJpX21zZyh1YmksICJ2b2x1
bWUgdGFibGUgd2FzIHJlc3RvcmVkIik7Cj4+PiAgICAgIDQ0MiAgICAgICAgICAgICAgICAgIH0K
Pj4+ICAgICAgNDQzCj4+PiAgICAgIDQ0NCAgICAgICAgICAgICAgICAgIC8qIEJvdGggTEVCIDEg
YW5kIExFQiAyIGFyZSBPSyBhbmQgY29uc2lzdGVudCAqLwo+Pj4gICAgICA0NDUgICAgICAgICAg
ICAgICAgICB2ZnJlZShsZWJbMV0pOwo+Pj4gICAgICA0NDYgICAgICAgICAgICAgICAgICByZXR1
cm4gbGViWzBdOwo+Pj4gICAgICA0NDcgICAgICAgICAgfSBlbHNlIHsKPj4+ICAgICAgNDQ4ICAg
ICAgICAgICAgICAgICAgLyogTEVCIDAgaXMgY29ycnVwdGVkIG9yIGRvZXMgbm90IGV4aXN0ICov
Cj4+PiAgICAgIDQ0OSAgICAgICAgICAgICAgICAgIGlmIChsZWJbMV0pIHsKPj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXgo+Pj4gSXMgdGhpcyBOVUxMIGNoZWNrIHJlcXVp
cmVkPwo+Pgo+PiBZZXMsIGxlYiAxIGNvdWxkIGJlIGNvcnJ1cHRlZChlZy4gYmFkIGVjIGhlYWRl
ciksIHRoZW4gdGhlIGxlYiAxIHdvbid0IGJlCj4+IHNjYW5uZWQgZHVyaW5nIGF0dGFjaGluZywg
d2hpY2ggbWVhbnMgJ2xlYlsxXScgd29uJ3QgYmUgaW5pdGlhbGl6ZWQgYnkKPj4gcHJvY2Vzc19s
dm9sKCkuCj4+Pgo+Pj4gICAgICA0NTAgICAgICAgICAgICAgICAgICAgICAgICAgIGxlYl9jb3Jy
dXB0ZWRbMV0gPSB2dGJsX2NoZWNrKHViaSwgbGViWzFdKTsKPj4+ICAgICAgNDUxICAgICAgICAg
ICAgICAgICAgICAgICAgICBpZiAobGViX2NvcnJ1cHRlZFsxXSA8IDApCj4+PiAgICAgIDQ1MiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dF9mcmVlOwo+Pj4gICAgICA0
NTMgICAgICAgICAgICAgICAgICB9Cj4+PiAgICAgIDQ1NCAgICAgICAgICAgICAgICAgIGlmIChs
ZWJfY29ycnVwdGVkWzFdKSB7Cj4+PiAgICAgIDQ1NSAgICAgICAgICAgICAgICAgICAgICAgICAg
LyogQm90aCBMRUIgMCBhbmQgTEVCIDEgYXJlIGNvcnJ1cHRlZCAqLwo+Pj4gICAgICA0NTYgICAg
ICAgICAgICAgICAgICAgICAgICAgIHViaV9lcnIodWJpLCAiYm90aCB2b2x1bWUgdGFibGVzIGFy
ZSBjb3JydXB0ZWQiKTsKPj4+ICAgICAgNDU3ICAgICAgICAgICAgICAgICAgICAgICAgICBnb3Rv
IG91dF9mcmVlOwo+Pj4gICAgICA0NTggICAgICAgICAgICAgICAgICB9Cj4+PiAgICAgIDQ1OQo+
Pj4gICAgICA0NjAgICAgICAgICAgICAgICAgICB1Ymlfd2Fybih1YmksICJ2b2x1bWUgdGFibGUg
Y29weSAjMSBpcyBjb3JydXB0ZWQiKTsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl4KPj4+IFRoaXMgc2hvdWxkIHNheSAjMCBJ
IHRoaW5rPwo+Pgo+PiBJIGd1ZXNzIHRoYXQgJyMxJyByZWZlcnMgdG8gbGViIDAgYW5kICcjMicg
cmVmZXJzIHRvIGxlYiAxLgo+Pj4KPj4+ICAgICAgNDYxICAgICAgICAgICAgICAgICAgZXJyID0g
Y3JlYXRlX3Z0YmwodWJpLCBhaSwgMCwgbGViWzFdKTsKPj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eCj4+PiAgICAgIDQ2MiAg
ICAgICAgICAgICAgICAgIGlmIChlcnIpCj4+PiAgICAgIDQ2MyAgICAgICAgICAgICAgICAgICAg
ICAgICAgZ290byBvdXRfZnJlZTsKPj4+ICAgICAgNDY0ICAgICAgICAgICAgICAgICAgdWJpX21z
Zyh1YmksICJ2b2x1bWUgdGFibGUgd2FzIHJlc3RvcmVkIik7Cj4+PiAgICAgIDQ2NQo+Pj4gICAg
ICA0NjYgICAgICAgICAgICAgICAgICB2ZnJlZShsZWJbMF0pOwo+Pj4gICAgICA0NjcgICAgICAg
ICAgICAgICAgICByZXR1cm4gbGViWzFdOwo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXl5eXl5eCj4+PiBUaGUgTlVMTCBjaGVjayBvbiBsaW5lIDQ0OSBtYWtlcyBTbWF0Y2gg
dGhpbmsgdGhpcyBjYW4gYmUgTlVMTC4KPj4KPj4gSW4gdGhlb3J5LCB0aGUgJ05VTEwnIHdvbid0
IGJlIGEgcmV0dXJuIHZhbHVlLCB0aGVzZSBjYXNlcyBhcmUgYXZvaWRlZCBieQo+PiBsZWJfY29y
cnVwdGVkIGNoZWNraW5nIGJyYW5jaGVzLgo+IAo+IE5vLCB0aGF0IGRvZXNuJ3QgZm9sbG93LiAg
SWYgbGViWzFdIGlzIE5VTEwgdGhlbiB3ZSBrbm93IHRoYXQKPiBsZWJfY29ycnVwdGVkWzFdIGlz
IHplcm8uICBJdCdzIG9ubHkgc2V0IHdoZW4gbGViWzFdIGlzIG5vbi1OVUxMLgo+IAoKSGkgRGFu
LiBUaGUgbGViX2NvcnJ1cHRlZCBhcnJheSBpcyBpbml0aWFsaXplZCBhcyAnMScgaW4gbGluZSAz
Njk6CjM2OSAgICAgICAgIGludCBsZWJfY29ycnVwdGVkW1VCSV9MQVlPVVRfVk9MVU1FX0VCU10g
PSB7MSwgMX07CgpJZiBsZWJbMV0gaXMgTlVMTC4gdGhlIGxlYl9jb3JydXB0ZWRbMV0gaXMgbm9u
LXplcm8sIHRoZW4gdGhlIGZ1bmN0aW9uIAp3aWxsIGV4aXQgaW4gZm9sbG93aW5nIGJyYW5jaDoK
ICA0NTQgICAgICAgICAgICAgICAgIGlmIChsZWJfY29ycnVwdGVkWzFdKSB7CiAgNDU1ICAgICAg
ICAgICAgICAgICAgICAgICAgIC8qIEJvdGggTEVCIDAgYW5kIExFQiAxIGFyZSBjb3JydXB0ZWQg
Ki8KICA0NTYgICAgICAgICAgICAgICAgICAgICAgICAgdWJpX2Vycih1YmksICJib3RoIHZvbHVt
ZSB0YWJsZXMgYXJlIApjb3JydXB0ZWQiKTsKICA0NTcgICAgICAgICAgICAgICAgICAgICAgICAg
Z290byBvdXRfZnJlZTsKICA0NTggICAgICAgICAgICAgICAgIH0KCkFtIGkgbWlzc2luZyBzb21l
dGhpbmc/Cgo+IHJlZ2FyZHMsCj4gZGFuIGNhcnBlbnRlcgo+IAo+IAo+Pj4KPj4+ICAgICAgNDY4
ICAgICAgICAgIH0KPj4+ICAgICAgNDY5Cj4+PiAgICAgIDQ3MCAgb3V0X2ZyZWU6Cj4+PiAgICAg
IDQ3MSAgICAgICAgICB2ZnJlZShsZWJbMF0pOwo+Pj4gICAgICA0NzIgICAgICAgICAgdmZyZWUo
bGViWzFdKTsKPj4+ICAgICAgNDczICAgICAgICAgIHJldHVybiBFUlJfUFRSKGVycik7Cj4+PiAg
ICAgIDQ3NCAgfQo+Pj4KPj4+Cj4+PiByZWdhcmRzLAo+Pj4gZGFuIGNhcnBlbnRlcgo+Pj4KPj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
Pj4gTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cj4+PiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8KPj4+IC4KPj4+Cj4gLgo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
