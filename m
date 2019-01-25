Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12846C282C2
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 11:08:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5C802184B
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 11:08:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iXzUD/Fi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5C802184B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eN7JIGQbROdvUxywoVIcE6+Av0KeKyPp70YtZI1lKvk=; b=iXzUD/FichAbua
	XufwoLuuz+yeMB9cgV16e0uGmq5ilibDCsl1X4jE6XlJSbM3COef+8pzI59rBsWEE2OLxmvLZ+qEs
	k8p47gL6ulvq+zLQWK04M9y2bbeoXpXiIMudCkvV7RoKGrwRfHy+o7LyahXSWeOdnGtm8d92SHSZa
	2doXYivFU4gAnWj2PPMacYDc6ozEUIhktGSu9HrdkQmlyjuR1ZxJyCWUa3aO9wEihLUtG2fR+gdWf
	lxrO77VAn5qVpI8iokxjZ+yoYIKzrMOsJ7T5rU8Zpk3oRV3T84tFRrvANtSzQ9hP4yiSRGpa3MbQz
	933kWatjriyWvVaQl3EQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmzLC-0003PJ-Us; Fri, 25 Jan 2019 11:08:06 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmzL9-0003Oy-SO
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 11:08:05 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 9C30D20712; Fri, 25 Jan 2019 12:08:01 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-87-206.w90-88.abo.wanadoo.fr
 [90.88.29.206])
 by mail.bootlin.com (Postfix) with ESMTPSA id 5D24420746;
 Fri, 25 Jan 2019 12:07:51 +0100 (CET)
Date: Fri, 25 Jan 2019 12:07:51 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH] mtd: spinand: Fix the error/cleanup path in spinand_init()
Message-ID: <20190125120751.3a66715e@xps13>
In-Reply-To: <20190124144654.27626-1-bbrezillon@kernel.org>
References: <20190124144654.27626-1-bbrezillon@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_030804_051833_47C60584 
X-CRM114-Status: GOOD (  15.57  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, stable@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz4gd3JvdGUg
b24gVGh1LCAyNCBKYW4gMjAxOQoxNTo0Njo1NCArMDEwMDoKCj4gVGhlIG1hbnVmYWN0dXJlciBz
cGVjaWZpYyBpbml0aWFsaXphdGlvbiBoYXMgYWxyZWFkeSBiZWVuIGRvbmUgd2hlbgo+IGJsb2Nr
IHVubG9ja2luZyB0YWtlcyBwbGFjZSwgYW5kIGlmIGFueXRoaW5nIGdvZXMgd3JvbmcgZHVyaW5n
IHRoaXMKPiBwcm9jZWR1cmUgd2Ugc2hvdWxkIGNhbGwgc3BpbmFuZF9tYW51ZmFjdHVyZXJfY2xl
YW51cCgpLgo+IAo+IEZpeGVzOiA3NTI5ZGY0NjUyNDggKCJtdGQ6IG5hbmQ6IEFkZCBjb3JlIGlu
ZnJhc3RydWN0dXJlIHRvIHN1cHBvcnQgU1BJIE5BTkRzIikKPiBDYzogPHN0YWJsZUB2Z2VyLmtl
cm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxiYnJlemlsbG9uQGtl
cm5lbC5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyB8IDQgKystLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgYi9kcml2ZXJzL210ZC9uYW5k
L3NwaS9jb3JlLmMKPiBpbmRleCA4YmYzN2RhMTk2NjMuLmZhODdhZTI4Y2RmZSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5k
L3NwaS9jb3JlLmMKPiBAQCAtMTAxNiwxMSArMTAxNiwxMSBAQCBzdGF0aWMgaW50IHNwaW5hbmRf
aW5pdChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQpCj4gIAlmb3IgKGkgPSAwOyBpIDwg
bmFuZC0+bWVtb3JnLm50YXJnZXRzOyBpKyspIHsKPiAgCQlyZXQgPSBzcGluYW5kX3NlbGVjdF90
YXJnZXQoc3BpbmFuZCwgaSk7Cj4gIAkJaWYgKHJldCkKPiAtCQkJZ290byBlcnJfZnJlZV9idWZz
Owo+ICsJCQlnb3RvIGVycl9tYW51Zl9jbGVhbnVwOwo+ICAKPiAgCQlyZXQgPSBzcGluYW5kX2xv
Y2tfYmxvY2soc3BpbmFuZCwgQkxfQUxMX1VOTE9DS0VEKTsKPiAgCQlpZiAocmV0KQo+IC0JCQln
b3RvIGVycl9mcmVlX2J1ZnM7Cj4gKwkJCWdvdG8gZXJyX21hbnVmX2NsZWFudXA7Cj4gIAl9Cj4g
IAo+ICAJcmV0ID0gbmFuZGRldl9pbml0KG5hbmQsICZzcGluYW5kX29wcywgVEhJU19NT0RVTEUp
OwoKCkFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoK
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
