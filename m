Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F19C2FC14
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Aug 2023 13:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DSkusQmC6HUIRIgpQ2KSJZSdIl3gawC5aJmu7Qa8omU=; b=3l2eGdPO85VQhZ
	QDaIyWbXp9a+17FI0vNm3vG7iTFjR+vfmaJA1JKwkW5fhNOUyOIDresFo0NuSHo6sNNosnC2E9eF3
	koEMH5MKwjsQkpj6VZSmn97T8VzYW6F7Um2wcdJ8JUdVFcttBRi+7CxnWnGC4vBk3himXLrPYgBun
	05aEOnOK0nFJEQiYbdJ3I0jZKvEoa8QUanSZ72ShPbqc1/npAhEhq78BsDWOh7dAYJtkslYKp3fcN
	tWDWoR6iU2jLbLro+mNY4JVDF2MQFdFYjPcRj8PAZOtkOVE2BfpsV/ef4ChJ5qfVNyK9CkUF9g7xy
	kk6MasV3yJF1SjERFjUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWcvs-006Rui-3D;
	Thu, 17 Aug 2023 13:21:01 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWcvp-006Ru1-2v
	for linux-mtd@lists.infradead.org;
	Thu, 17 Aug 2023 13:20:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6035F1BF20A;
	Thu, 17 Aug 2023 13:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692278452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TpkYJnEPG/Xi0SDa3SsdHsTZH3oAXFOzG5T3t2lM324=;
	b=IzdrsoV8tGuQYKemeHLyhFseeaBfFOOlh4vxvABN0qMP0IEb0+M23SX4fb408x6nwaEDkh
	gvpJktO/3CkI1m+NXwtJCHU5w/Dze72wZ15fBGQakMi+KXlx+fX9G/w6QXZlHeYS7LR/zd
	xAYikvjHkt3z/wX4TdIyOWWO8ofgYKlTNJ8LbQgfOwmsKbBcmGrhzBoBXOIzKoRDoEZeLB
	vVLsD/ck+quwgSwl6VhiucdoiHHYVWDIAK6hbl6yhEBosmz7rtLtdpOgJCKiFlPVAAs1iV
	ARjIA+dXWNEdVhspbMocz0Hoj+aR+m1uFiAIxmLKbRXSyQjx3eGhz1UT7EP7Dg==
Date: Thu, 17 Aug 2023 15:20:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: SSunk <ssunkkan@gmail.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org, michael@walle.cc,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Add support for more XMC series
Message-ID: <20230817152050.6679eae3@xps-13>
In-Reply-To: <20230817124655.13023-1-ssunkkan@gmail.com>
References: <20230817124655.13023-1-ssunkkan@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_062058_222081_649A80D0 
X-CRM114-Status: GOOD (  14.92  )
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

SGVsbG8sCgpzc3Vua2thbkBnbWFpbC5jb20gd3JvdGUgb24gVGh1LCAxNyBBdWcgMjAyMyAyMDo0
Njo1NSArMDgwMDoKCj4gQWRkIFhNQyBYTTI1UUgxMjhDL1hNMjVRSDI1NkMvWE0yNVFVMjU2Qy9Y
TTI1UUg1MTJDL1hNMjVRVTUxMkMKPiBhbmQgc2V0IHRoZSBwYXJzZV9zZmRwIGZsYWcuCgpQbGVh
c2UgbG9vayBhdCB0aGUgZ2l0IGhpc3RvcnkgYW5kIGNvcnJlY3QgdGhlIHRpdGxlLgoKPiBTaWdu
ZWQtb2ZmLWJ5OiBLYW5rYW4gU3VuIDxzc3Vua2thbkBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvbXRkL3NwaS1ub3IveG1jLmMgfCAxNiArKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxNiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1u
b3IveG1jLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3htYy5jCj4gaW5kZXggMDUxNDExZTg2MzM5
Li5iMjM3NDE4N2VjNGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci94bWMuYwo+
ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IveG1jLmMKPiBAQCAtMTYsNiArMTYsMjIgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIHhtY19ub3JfcGFydHNbXSA9IHsKPiAgCXsgIlhN
MjVRSDEyOEEiLCBJTkZPKDB4MjA3MDE4LCAwLCA2NCAqIDEwMjQsIDI1NikKPiAgCQlOT19TRkRQ
X0ZMQUdTKFNFQ1RfNEsgfCBTUElfTk9SX0RVQUxfUkVBRCB8Cj4gIAkJCSAgICAgIFNQSV9OT1Jf
UVVBRF9SRUFEKSB9LAo+ICsJeyAiWE0yNVFIMTI4QyIsIElORk8oMHgyMDQwMTgsIDAsIDY0ICog
MTAyNCwgMjU2KQo+ICsJCU5PX1NGRFBfRkxBR1MoU0VDVF80SyB8IFNQSV9OT1JfRFVBTF9SRUFE
IHwKPiArCQkJICAgICAgU1BJX05PUl9RVUFEX1JFQUQpIH0sCj4gKwl7ICJYTTI1UUgyNTZDIiwg
SU5GTygweDIwNDAxOSwgMCwgNjQgKiAxMDI0LCA1MTIpCj4gKwkJTk9fU0ZEUF9GTEFHUyhTRUNU
XzRLIHwgU1BJX05PUl9EVUFMX1JFQUQgfAo+ICsJCQkgICAgICBTUElfTk9SX1FVQURfUkVBRCB8
IFNQSV9OT1JfNEJfT1BDT0RFUykgfSwKPiArCXsgIlhNMjVRVTI1NkMiLCBJTkZPKDB4MjA0MTE5
LCAwLCA2NCAqIDEwMjQsIDUxMikKPiArCQlOT19TRkRQX0ZMQUdTKFNFQ1RfNEsgfCBTUElfTk9S
X0RVQUxfUkVBRCB8Cj4gKwkJCSAgICAgIFNQSV9OT1JfUVVBRF9SRUFEIHwgU1BJX05PUl80Ql9P
UENPREVTKSB9LAo+ICsJeyAiWE0yNVFINTEyQyIsIElORk8oMHgyMDQwMjAsIDAsIDY0ICogMTAy
NCwgMTAyNCkKPiArCQlOT19TRkRQX0ZMQUdTKFNFQ1RfNEsgfCBTUElfTk9SX0RVQUxfUkVBRCB8
Cj4gKwkJCSAgICAgIFNQSV9OT1JfUVVBRF9SRUFEIHwgU1BJX05PUl80Ql9PUENPREVTKSB9LAo+
ICsJeyAiWE0yNVFVNTEyQyIsIElORk8oMHgyMDQxMjAsIDAsIDY0ICogMTAyNCwgMTAyNCkKPiAr
CQlOT19TRkRQX0ZMQUdTKFNFQ1RfNEsgfCBTUElfTk9SX0RVQUxfUkVBRCB8Cj4gKwkJCSAgICAg
IFNQSV9OT1JfUVVBRF9SRUFEIHwgU1BJX05PUl80Ql9PUENPREVTKSB9LAoKWW91IHNheSB5b3Ug
ZW5hYmxlIFNGRFAgaW4gdGhlIGNvbW1pdCBsb2cgYnV0IHRoZSBkaWZmIHNob3dzIHRoZQpvcHBv
c2l0ZT8KCj4gKwo+ICB9Owo+ICAKPiAgY29uc3Qgc3RydWN0IHNwaV9ub3JfbWFudWZhY3R1cmVy
IHNwaV9ub3JfeG1jID0gewoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
