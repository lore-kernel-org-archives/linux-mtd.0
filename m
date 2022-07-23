Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7CCC433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jul 2022 15:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:In-Reply-To:Mime-Version:References:Message-ID:
	Date:Subject:From:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fL28JHOIvVT8dWFfJH09Su43hP0aqXRKsVPVP8DnGA8=; b=yYu4pz/7E0mUI7HiBaIkh8cDbd
	Yizdn2Lpu4eJ+SOZeq4BNlAK1wqEBxPCHfLU92B/Dx4Q6HbC3O9s6aFYt12izW8d/IZvsVOI0LXGZ
	nxxLuHFGAdAyBVxTeEmwmlG3lYC+BDMqbSb7DRjmm02tfF8rTz6strRqFc/Vte9mC47DJhuNbVtW5
	SGFJdO+ozqi8jlZ0qF8ns/KBHJOzGQSc1m4ruNcBVnv/fp4sC0OSdx/KiudW5KWDDL3vyMMU7QDkB
	x9r8COkoB/xorZjp5ZwZTG26LSfQq8t9ny0WWOj0btzFdoHfMjfJhlD+MQe1dz/g8CTHA97TODUF3
	JF3H4IqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFGrI-004iHj-Fm; Sat, 23 Jul 2022 15:16:00 +0000
Received: from ciao.gmane.io ([116.202.254.214])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFGrG-004iEd-2L
	for linux-mtd@lists.infradead.org; Sat, 23 Jul 2022 15:15:59 +0000
Received: from list by ciao.gmane.io with local (Exim 4.92)
	(envelope-from <gldm-linux-mtd-36@m.gmane-mx.org>)
	id 1oFGrB-0007vk-Ix
	for linux-mtd@lists.infradead.org; Sat, 23 Jul 2022 17:15:53 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: linux-mtd@lists.infradead.org
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 3/3] SPI: Ingenic: Add SFC support for Ingenic SoCs.
Date: Sat, 23 Jul 2022 17:15:46 +0200
Message-ID: <c522ee04-4183-c2ff-8c35-ce2bbbc1bc95@wanadoo.fr>
References: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1658508510-15400-4-git-send-email-zhouyanjie@wanyeetech.com>
Mime-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Cc: linux-mips@vger.kernel.org,linux-spi@vger.kernel.org,linux-kernel@vger.kernel.org,devicetree@vger.kernel.org
Content-Language: fr
In-Reply-To: <1658508510-15400-4-git-send-email-zhouyanjie@wanyeetech.com>
Cc: linux-mtd@lists.infradead.org,linux-spi@vger.kernel.org,linux-kernel@vger.kernel.org,devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_081558_129280_3D31E01A 
X-CRM114-Status: GOOD (  13.43  )
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
ICsKClsuLi5dCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
