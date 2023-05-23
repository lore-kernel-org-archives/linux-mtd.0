Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FCBC7EE2E
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 17:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A2B/SAfVEZMVY89yhrR9PY2+clue/c0NviBXSwxz9bU=; b=dR2hQt09aQjD0k
	MXymyHcSttWaE0mT9oIPXiqgo27YImrvGdAZGu9syzVrh2PwI7WvVjetGOc71lI66eku7iKIlafIK
	BHGtIbTFOnRnlxzQmoOaq3Pnq/Egw5WYoMhYYr+o1x2RxK2MRPqTSpPaiZZxmh0TBit+Eup7VrU+/
	CII1pOyn7XIGCletcAu0DcD7MExAr50Z7VdDaA7jJY/NLIVGVKw5a5Xgf7gHRKDO6GZh/DHVAIpJc
	dc0JTPqno6C7EZ4ztXaKGjA7SBdFWOJFdEKWuY6/RW7kworlvSnJYy9iBF+MuSQklM4XRQE0X/Dv3
	qztfCfxEFuPjwaWPOXAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Vrh-00Aym9-0g;
	Tue, 23 May 2023 17:32:05 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Vrd-00Ayjp-0P;
	Tue, 23 May 2023 17:32:02 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id A7CAF5FD0E;
	Tue, 23 May 2023 20:31:57 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1684863117;
	bh=H0dShj9ZDjo/qM96gvuxTIEKDSr9ga1R0nehMCt3V4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=Zej3Ig1IoOl93IpqGJz3now4Xd46rc42PD5Wx1qtwdzL5HRKXJr8NQbLESiHNOOUb
	 Sm9ukyTYOyMaUSrgPqNwJ28qqhGnwaXt/llkp6D+v/+X1zc474oUB96YZQgHYxT80i
	 2AwMESZqomknJEqBilSqyh90T5MkOa3vAT+AT5nXzbJfBCVsu7hoFiS3NFkAxB2//i
	 a5mdFtJBJtq+7oqdaq2rLPaMZLZ6YUPeiR/gosmvG8jTCYYUkSW++MzhJDMvvm0gVt
	 RS4RAQ/lVQCupm6A81xvHJmRGqTaSFYHxfL4e+vQnHZ3iCCKnxiuu3OJ3qqMQvYL8N
	 VnafpG39cht3g==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue, 23 May 2023 20:31:57 +0300 (MSK)
Message-ID: <84a2e0c4-cc6f-1743-ee93-c13bc8bf09f1@sberdevices.ru>
Date: Tue, 23 May 2023 20:27:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 3/5] mtd: rawnand: meson: always read whole OOB bytes
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
	Yixun Lan <yixun.lan@amlogic.com>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20230515094440.3552094-1-AVKrasnov@sberdevices.ru>
 <20230515094440.3552094-4-AVKrasnov@sberdevices.ru>
 <20230522173813.08afe6b8@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230522173813.08afe6b8@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/23 12:15:00 #21372692
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_103201_557058_BE31289D 
X-CRM114-Status: GOOD (  17.76  )
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

CgpPbiAyMi4wNS4yMDIzIDE4OjM4LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gQVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIE1vbiwgMTUgTWF5IDIwMjMg
MTI6NDQ6MzcgKzAzMDA6Cj4gCj4+IFRoaXMgY2hhbmdlcyBzaXplIG9mIHJlYWQgYWNjZXNzIHRv
IE9PQiBhcmVhIGJ5IHJlYWRpbmcgYWxsIGJ5dGVzIG9mCj4+IE9PQiAoZnJlZSBieXRlcyArIEVD
QyBlbmdpbmUgYnl0ZXMpLgo+IAo+IFRoaXMgaXMgbm9ybWFsbHkgdXAgdG8gdGhlIHVzZXIgKHVz
ZXIgaW4geW91ciBjYXNlID09IGpmZnMyKS4gVGhlCj4gY29udHJvbGxlciBkcml2ZXIgc2hvdWxk
IGV4cG9zZSBhIG51bWJlciBvZiB1c2VyIGFjY2Vzc2libGUgYnl0ZXMgYW5kCj4gdGhlbiB3aGVu
IHVzZXJzIHdhbnQgdGhlIE9PQiBhcmVhLCB0aGV5IHNob3VsZCBhY2Nlc3MgaXQgZW50aXJlbHku
IE9uCj4gdG9wIG9mIHRoYXQgcmVhZCwgdGhleSBjYW4gZXh0cmFjdCAob3IgIndyaXRlIG9ubHki
KSB0aGUgdXNlciBieXRlcy4KClNvcnJ5LCBJIGRpZG4ndCBnZXQgaXQuIElmIGRyaXZlciBleHBv
c2VzIE4gYnl0ZXMgb2YgdXNlciBhY2Nlc3NpYmxlIGJ5dGVzLApJIG11c3QgYWx3YXlzIHJldHVy
biB3aG9sZSBPT0IgeWVzPyBFLmcuIE4gKyByZXN0IG9mIE9PQgoKPiAKPj4gU2lnbmVkLW9mZi1i
eTogQXJzZW5peSBLcmFzbm92IDxBVktyYXNub3ZAc2JlcmRldmljZXMucnU+Cj4+IC0tLQo+PiAg
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIHwgMjQgKysrKysrKysrKysrKysrKysr
KysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvbWVzb25fbmFuZC5jCj4+IGluZGV4IDg1MjZhNmI4NzcyMC4uYTMxMTA2Yzk0M2Q3IDEw
MDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4gKysrIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+IEBAIC03NTUsNiArNzU1LDMwIEBA
IHN0YXRpYyBpbnQgX19tZXNvbl9uZmNfcmVhZF9vb2Ioc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwg
aW50IHBhZ2UsCj4+ICAJdTMyIG9vYl9ieXRlczsKPj4gIAl1MzIgcGFnZV9zaXplOwo+PiAgCWlu
dCByZXQ7Cj4+ICsJaW50IGk7Cj4+ICsKPj4gKwkvKiBSZWFkIEVDQyBjb2RlcyBhbmQgdXNlciBi
eXRlcy4gKi8KPj4gKwlmb3IgKGkgPSAwOyBpIDwgbmFuZC0+ZWNjLnN0ZXBzOyBpKyspIHsKPj4g
KwkJdTMyIGVjY19vZmZzID0gbmFuZC0+ZWNjLnNpemUgKiAoaSArIDEpICsKPj4gKwkJCSAgICAg
ICBORkNfT09CX1BFUl9FQ0MobmFuZCkgKiBpOwo+PiArCj4+ICsJCXJldCA9IG5hbmRfcmVhZF9w
YWdlX29wKG5hbmQsIHBhZ2UsIDAsIE5VTEwsIDApOwo+PiArCQlpZiAocmV0KQo+PiArCQkJcmV0
dXJuIHJldDsKPj4gKwo+PiArCQkvKiBVc2UgdGVtcG9yYXJ5IGJ1ZmZlciwgYmVjYXVzZSAnbmFu
ZF9jaGFuZ2VfcmVhZF9jb2x1bW5fb3AoKScKPj4gKwkJICogc2VlbXMgd29yayB3aXRoIHNvbWUg
YWxpZ25tZW50LCBzbyB3ZSBjYW4ndCByZWFkIGRhdGEgdG8KPj4gKwkJICogJ29vYl9idWYnIGRp
cmVjdGx5Lgo+IAo+IERNQT8KClllcyBJIGd1ZXNzLCB0aGlzIGFkZHJlc3MgcGFzc2VkIHRvIGV4
ZWNfb3AgY29kZSBhbmQgdXNlZCBhcyBETUEuCgo+IAo+PiArCQkgKi8KPj4gKwkJcmV0ID0gbmFu
ZF9jaGFuZ2VfcmVhZF9jb2x1bW5fb3AobmFuZCwgZWNjX29mZnMsIG1lc29uX2NoaXAtPm9vYl9i
dWYsCj4+ICsJCQkJCQkgTkZDX09PQl9QRVJfRUNDKG5hbmQpLCBmYWxzZSk7Cj4+ICsJCWlmIChy
ZXQpCj4+ICsJCQlyZXR1cm4gcmV0Owo+PiArCj4+ICsJCW1lbWNweShvb2JfYnVmICsgaSAqIE5G
Q19PT0JfUEVSX0VDQyhuYW5kKSwKPj4gKwkJICAgICAgIG1lc29uX2NoaXAtPm9vYl9idWYsCj4+
ICsJCSAgICAgICBORkNfT09CX1BFUl9FQ0MobmFuZCkpOwo+PiArCX0KPj4gIAo+PiAgCW9vYl9i
eXRlcyA9IG1lc29uX25mY19nZXRfb29iX2J5dGVzKG5hbmQpOwo+PiAgCj4gCj4gCj4gVGhhbmtz
LAo+IE1pcXXDqGwKClRoYW5rcywgQXJzZW5peQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
