Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC2FC433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jul 2022 15:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ioIK6bLNVXUfV/mGfkq7TMOlQNzu7OYOILR3RkVjRBc=; b=1xszAmz2/1IfTc
	dcLQlss9MKBUrRYsN4hd6oDRGKbkTJDfmx847RyDP+KA9mpTGtGpnlbRTp7MMTNHZZj7v8Pi6zMtR
	cdrd6XHk84jjPwD5LdiYpCe8X3hw8lOV+M43GFQQZ3o7e3XMdD1TNK28Wk5/hNRnIdicNqu6AU2gs
	oBaDMcheS9FLUtBzIn0B4EVb224HTBySVfdjGcG8wIbmUv4mWS8D+lWoWtnLwU12p0IV1tHsVuxFV
	UmNdAhS5lRo7YGERENBY19Z8hYiLoYDmrzMQSXaVLZ14SCGV4qeKcxh6prKMD/txjQT1J27efrZRb
	kMG2Mh1PBXs1Hw88/Txg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFGrW-004iU8-VC; Sat, 23 Jul 2022 15:16:15 +0000
Received: from smtp06.smtpout.orange.fr ([80.12.242.128] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFGrT-004iJ0-Oc
	for linux-mtd@lists.infradead.org; Sat, 23 Jul 2022 15:16:13 +0000
Received: from [192.168.1.18] ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id FGr4o1zigAZYmFGr4oQ8Sf; Sat, 23 Jul 2022 17:16:01 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 23 Jul 2022 17:16:01 +0200
X-ME-IP: 90.11.190.129
Message-ID: <c522ee04-4183-c2ff-8c35-ce2bbbc1bc95@wanadoo.fr>
Date: Sat, 23 Jul 2022 17:15:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/3] SPI: Ingenic: Add SFC support for Ingenic SoCs.
Content-Language: fr
To: =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
 tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aidanmacdonald.0x0@gmail.com, tmn505@gmail.com,
 paul@crapouillou.net, dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
 rick.tyliu@ingenic.com, jinghui.liu@ingenic.com, sernia.zhou@foxmail.com,
 reimu@sudomaker.com
Newsgroups: gmane.linux.ports.mips,gmane.linux.drivers.mtd,gmane.linux.kernel.spi.devel,gmane.linux.kernel,gmane.linux.drivers.devicetree
References: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1658508510-15400-4-git-send-email-zhouyanjie@wanyeetech.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <1658508510-15400-4-git-send-email-zhouyanjie@wanyeetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_081611_989840_9D152F20 
X-CRM114-Status: GOOD (  13.16  )
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
Message-ID: <20220723151546.BFmsGy06FRyX2mobfu49AOf-SSKlwQgWMoWqfqCLXvc@z>

TGUgMjIvMDcvMjAyMiDDoCAxODo0OCwg5ZGo55Cw5p2wIChaaG91IFlhbmppZSkgYSDDqWNyaXTC
oDoKPiBBZGQgU0ZDIHN1cHBvcnQgZm9yIHRoZSBYMTAwMCBTb0MsIHRoZSBYMTYwMCBTb0MsIGFu
ZCB0aGUgWDIwMDAgU29DCj4gZnJvbSBJbmdlbmljLgo+IAo+IFNpZ25lZC1vZmYtYnk6IOWRqOeQ
sOadsCAoWmhvdSBZYW5qaWUpIDx6aG91eWFuamllQHdhbnllZXRlY2guY29tPgo+IC0tLQo+ICAg
ZHJpdmVycy9zcGkvS2NvbmZpZyAgICAgICAgICAgfCAgIDkgKwo+ICAgZHJpdmVycy9zcGkvTWFr
ZWZpbGUgICAgICAgICAgfCAgIDEgKwo+ICAgZHJpdmVycy9zcGkvc3BpLWluZ2VuaWMtc2ZjLmMg
fCA2NjIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICAzIGZp
bGVzIGNoYW5nZWQsIDY3MiBpbnNlcnRpb25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9zcGkvc3BpLWluZ2VuaWMtc2ZjLmMKPiAKClsuLi5dCgo+ICtzdGF0aWMgaW50IGluZ2Vu
aWNfc2ZjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gK3sKPiArCXN0cnVj
dCBpbmdlbmljX3NmYyAqc2ZjOwo+ICsJc3RydWN0IHNwaV9jb250cm9sbGVyICpjdGxyOwo+ICsJ
aW50IHJldDsKPiArCj4gKwljdGxyID0gc3BpX2FsbG9jX21hc3RlcigmcGRldi0+ZGV2LCBzaXpl
b2YoKnNmYykpOwo+ICsJaWYgKCFjdGxyKQo+ICsJCXJldHVybiAtRU5PTUVNOwoKZGV2bV9zcGlf
YWxsb2NfbWFzdGVyKCk/ICgrIGVycm9yIGhhbmRsaW5nIHNpbXBsaWZpY2F0aW9uKQpPciB0aGVy
ZSBzaG91bGQgYmUgYSAucmVtb3ZlKCkgZnVuY3Rpb24uCgpDSgoKPiArCj4gKwlzZmMgPSBzcGlf
Y29udHJvbGxlcl9nZXRfZGV2ZGF0YShjdGxyKTsKPiArCj4gKwlzZmMtPnNvY19pbmZvID0gb2Zf
ZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOwo+ICsJaWYgKCFzZmMtPnNvY19pbmZv
KSB7Cj4gKwkJZGV2X2VycigmcGRldi0+ZGV2LCAiTm8gb2YgbWF0Y2ggZGF0YSBwcm92aWRlZFxu
Iik7Cj4gKwkJcmV0ID0gLUVOT0RFVjsKPiArCQlnb3RvIGVycl9wdXRfbWFzdGVyOwo+ICsJfQo+
ICsKClsuLi5dCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
