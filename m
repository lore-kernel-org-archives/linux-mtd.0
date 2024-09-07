Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16ACE6FE4D
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Sep 2024 07:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLyhExZSQeMu0VSXnRNN+6gEqTNqnX4d91vr7fgH1Bo=; b=sU/iIEe8bj1ZyD
	MRVyQY27qbsqwTHTmvgN15zmhlCeQdCiOT2cBCpGTyGLE4r/wQ9F6OmVA91muDZWA5JNU3OZLdzIM
	rN/SxnXmU0NIt93SQb3l3jNu3tcragKoS3zYYo90z63rqKa5Qv5CHdXeI04k4AsPBXKj3mI+MH+9C
	qOZes6uwfTKLX0eP6jSLNYjreuNIOnysNyHuhmDjqBWDIA57fevN8qhk6QwPRKRdf7L41hEmHNYTr
	MCC9JEhuSM5mxzx7jIPQyGq0o01aql5c5Lvj2+BlyWmxHI8nbpQl41xvIlmxroVJ1hmjGG9REciPK
	gsd9e0+3/ir3sNKAWxqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smpVF-0000000EXMi-2imB;
	Sat, 07 Sep 2024 07:05:01 +0000
Received: from smtp-27.smtpout.orange.fr ([80.12.242.27] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smpVC-0000000EXM0-0bfb
	for linux-mtd@lists.infradead.org;
	Sat, 07 Sep 2024 07:05:00 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id mpV5s8vX641DAmpV5s0s85; Sat, 07 Sep 2024 09:04:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725692693;
	bh=ws6woaw3V59PogyDNQ6FMv2g3JohNKI2FGtYQY5L58I=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ph9P0haqZtBjA0qJLG0dPNjjC55IG/FYry9togkk2reDnvuHXC686t6x0u7Tq1hNW
	 Kj8Ss4m63CGDlmqvO7YbCNZ+PJYDnN8bVLHaQiV4RTDkcCmIv2BwPXSOT10fUkPM+C
	 im84USas1ww6OEHJcM0gdrrp1ke81vLVCvx54jL9LSdlWJv1CDB2pNy8hkVRC9PK9I
	 3Eo0ww9gDgjSdmOdoNAcKYpGDJaiFTw2bXwBciqvLHfek5DJxYsf1WHVjcOeXKjduO
	 H4Smx1nSl2QuUq9UkJVdsb+CADj7cJVJNe2Hth54rKtoWEFX6Wh4nTOmUQgsTxe5ro
	 zevYN9RzzEyrQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 07 Sep 2024 09:04:53 +0200
X-ME-IP: 90.11.132.44
Message-ID: <47e0745c-e7a4-4201-b1bf-bb8e44e5911d@wanadoo.fr>
Date: Sat, 7 Sep 2024 09:04:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: Add support for gd25 and gd55 series chips.
To: Renjun Wang <renjunw0@foxmail.com>, tudor.ambarus@linaro.org,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <tencent_983A0FB4662661C03E98E1AC214E32179F0A@qq.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <tencent_983A0FB4662661C03E98E1AC214E32179F0A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240907_000458_343633_6B8FB280 
X-CRM114-Status: GOOD (  14.01  )
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

TGUgMDcvMDkvMjAyNCDDoCAwODozMiwgUmVuanVuIFdhbmcgYSDDqWNyaXTCoDoKPiBBZGQgc3Vw
cG9ydCBmb3IgZ2QyNWxxMjU1LCBnZDI1bGIyNTYsIGdkMjVsYjUxMm0sIGdkMjViNTEybSwgZ2Q1
NWIwMWdlCj4gYW5kIGdkNTVsYjAxZ2UuIEFsbCB0aGVzZSBjaGlwcyBhcmUgdGVzdGVkIG9uIFJv
Y2tjaGlwIGJvYXJkc1sxXS4KPiAKPiBbMV1odHRwczovL2dpdGh1Yi5jb20vcm9ja2NoaXAtbGlu
dXgva2VybmVsL2Jsb2IvZGV2ZWxvcC01LjEwL2RyaXZlcnMvbXRkL3NwaS1ub3IvZ2lnYWRldmlj
ZS5jCj4gCj4gU2lnbmVkLW9mZi1ieTogUmVuanVuIFdhbmcgPHJlbmp1bncwQGZveG1haWwuY29t
Pgo+IC0tLQo+ICAgZHJpdmVycy9tdGQvc3BpLW5vci9naWdhZGV2aWNlLmMgfCA0MyArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDQzIGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9naWdhZGV2aWNlLmMg
Yi9kcml2ZXJzL210ZC9zcGktbm9yL2dpZ2FkZXZpY2UuYwo+IGluZGV4IGVmMWVkZDBhZGQ3MC4u
ZjAwNjlhNGFkYmJmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvZ2lnYWRldmlj
ZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9naWdhZGV2aWNlLmMKPiBAQCAtNjEsNiAr
NjEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8gZ2lnYWRldmljZV9ub3JfcGFy
dHNbXSA9IHsKPiAgIAl9LCB7Cj4gICAJCS5pZCA9IFNOT1JfSUQoMHhjOCwgMHg0MCwgMHgxOSks
Cj4gICAJCS5uYW1lID0gImdkMjVxMjU2IiwKPiArCQkuc2l6ZSA9IFNaXzMyTSwKCkhpLCBqdXN0
IGZvciBteSB1bmRlcnN0YW5kaW5nLCB3aHkgdGhpcyBjaGFuZ2U/CgpJZiBpdCBpcyBhIGZpeCwg
c2hvdWxkIGl0IGJlIGRvbmUgYSBzZXBhcmF0ZSBwYXRjaD8KT3Igc2hvdWxkIGl0IGJlIG1lbnRp
b25lZCBpbiB0aGUgY29tbWl0IGRlc2NyaXB0aW9uPwoKQ0oKCj4gICAJCS5mbGFncyA9IFNQSV9O
T1JfSEFTX0xPQ0sgfCBTUElfTk9SX0hBU19UQiB8IFNQSV9OT1JfVEJfU1JfQklUNiwKPiAgIAkJ
LmZpeHVwcyA9ICZnZDI1cTI1Nl9maXh1cHMsCj4gICAJCS5maXh1cF9mbGFncyA9IFNQSV9OT1Jf
NEJfT1BDT0RFUywKPiBAQCAtODIsNiArODMsNDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFz
aF9pbmZvIGdpZ2FkZXZpY2Vfbm9yX3BhcnRzW10gPSB7Cj4gICAJCS5zaXplID0gU1pfMTZNLAo+
ICAgCQkuZmxhZ3MgPSBTUElfTk9SX0hBU19MT0NLIHwgU1BJX05PUl9IQVNfVEIsCj4gICAJCS5u
b19zZmRwX2ZsYWdzID0gU0VDVF80SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFE
X1JFQUQsCj4gKwl9LCB7Cj4gKwkJLmlkID0gU05PUl9JRCgweGM4LCAweDYwLCAweDE5KSwKPiAr
CQkubmFtZSA9ICJnZDI1bHEyNTUiLAo+ICsJCS5zaXplID0gU1pfMzJNLAo+ICsJCS5mbGFncyA9
IFNQSV9OT1JfSEFTX0xPQ0ssCj4gKwkJLm5vX3NmZHBfZmxhZ3MgPSBTRUNUXzRLIHwgU1BJX05P
Ul9EVUFMX1JFQUQgfCBTUElfTk9SX1FVQURfUkVBRCwKPiArCQkuZml4dXBfZmxhZ3MgPSBTUElf
Tk9SXzRCX09QQ09ERVMsCj4gKwl9LCB7Cj4gKwkJLmlkID0gU05PUl9JRCgweGM4LCAweDY3LCAw
eDE5KSwKPiArCQkubmFtZSA9ICJnZDI1bGIyNTYiLAo+ICsJCS5zaXplID0gU1pfMzJNLAo+ICsJ
CS5mbGFncyA9IFNQSV9OT1JfSEFTX0xPQ0ssCj4gKwkJLm5vX3NmZHBfZmxhZ3MgPSBTRUNUXzRL
IHwgU1BJX05PUl9EVUFMX1JFQUQgfCBTUElfTk9SX1FVQURfUkVBRCwKPiArCQkuZml4dXBfZmxh
Z3MgPSBTUElfTk9SXzRCX09QQ09ERVMsCj4gKwl9LCB7Cj4gKwkJLmlkID0gU05PUl9JRCgweGM4
LCAweDY3LCAweDFhKSwKPiArCQkubmFtZSA9ICJnZDI1bGI1MTJtIiwKPiArCQkuc2l6ZSA9IFNa
XzY0TSwKPiArCQkuZmxhZ3MgPSBTUElfTk9SX0hBU19MT0NLLAo+ICsJCS5ub19zZmRwX2ZsYWdz
ID0gU0VDVF80SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQsCj4gKwkJ
LmZpeHVwX2ZsYWdzID0gU1BJX05PUl80Ql9PUENPREVTLAo+ICsJfSwgewo+ICsJCS5pZCA9IFNO
T1JfSUQoMHhjOCwgMHg0NywgMHgxYSksCj4gKwkJLm5hbWUgPSAiZ2QyNWI1MTJtIiwKPiArCQku
c2l6ZSA9IFNaXzY0TSwKPiArCQkuZmxhZ3MgPSBTUElfTk9SX0hBU19MT0NLLAo+ICsJCS5ub19z
ZmRwX2ZsYWdzID0gU0VDVF80SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JF
QUQsCj4gKwkJLmZpeHVwX2ZsYWdzID0gU1BJX05PUl80Ql9PUENPREVTLAo+ICsJfSwgewo+ICsJ
CS5pZCA9IFNOT1JfSUQoMHhjOCwgMHg0NywgMHgxYiksCj4gKwkJLm5hbWUgPSAiZ2Q1NWIwMWdl
IiwKPiArCQkuc2l6ZSA9IFNaXzEyOE0sCj4gKwkJLmZsYWdzID0gU1BJX05PUl9IQVNfTE9DSywK
PiArCQkubm9fc2ZkcF9mbGFncyA9IFNFQ1RfNEsgfCBTUElfTk9SX0RVQUxfUkVBRCB8IFNQSV9O
T1JfUVVBRF9SRUFELAo+ICsJCS5maXh1cF9mbGFncyA9IFNQSV9OT1JfNEJfT1BDT0RFUywKPiAr
CX0sIHsKPiArCQkuaWQgPSBTTk9SX0lEKDB4YzgsIDB4NjcsIDB4MWIpLAo+ICsJCS5uYW1lID0g
ImdkNTVsYjAxZ2UiLAo+ICsJCS5zaXplID0gU1pfMTI4TSwKPiArCQkuZmxhZ3MgPSBTUElfTk9S
X0hBU19MT0NLLAo+ICsJCS5ub19zZmRwX2ZsYWdzID0gU0VDVF80SyB8IFNQSV9OT1JfRFVBTF9S
RUFEIHwgU1BJX05PUl9RVUFEX1JFQUQsCj4gKwkJLmZpeHVwX2ZsYWdzID0gU1BJX05PUl80Ql9P
UENPREVTLAo+ICAgCX0sCj4gICB9Owo+ICAgCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
