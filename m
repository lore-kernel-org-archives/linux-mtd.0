Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7D8C61DA4
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Mar 2023 10:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O4htW4qpsoRxogqLeSUahg1MUA373C1WYomfCuycI/A=; b=sgdn8tIGKyKmNw
	0PkCp0ZYKA5rEcA9G7d0JkLGuXPvV+Ipa3BX0CgMfDr8eRWlApK8+74V5uVZiWgIP2kUE0mGB8kAk
	gJ7i8qRw2zK35sahCHLG+NATXyr0rd2/52u+7F0gbMzPq/p+ktuBNzWfPtjlRaDpchU3pCClBC9CO
	mTIGW5MmlMzneMArj506cmOnR5VDpXDjkDhe1+OLIxBTvts5W61TKQOwm75zKenB2rP0EuRyTONYU
	LrGDNBZugOPYH0uReb2QJSphzf1NiroDeppDNSrhq8SiZaxlagGefCb0eVttCbCMjfa0pZmQO0FhP
	XH6kUxgmv/HHUAqgzQLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbfXS-005BlU-J7; Mon, 13 Mar 2023 10:36:22 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbfUS-005BIp-8x
	for linux-mtd@lists.infradead.org; Mon, 13 Mar 2023 10:33:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6293120005;
	Mon, 13 Mar 2023 10:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678703589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h8FPy5uKFiDq2l0zmMVB3owwRxWGEIonz0+Z5WC0wt0=;
	b=A4JqcLCuegFITVmpkqLqjiCFu8ALAvDuaHueT7IMEMjLltfikfkQKdE1Cj7WPvlQqgXtqy
	iwUqyewqMsQjkNX36rcM/wok3PDyWiZ1aJ1oHEW0VX4yQXnRY1ThYkP863I4IEelsFqlzX
	WUTk9NLZzUl7VWMxluzZcmXAiY3OGWoYGNoEinquo9gSOkJfR9QB592ZxlYX+EF+fwNDz/
	HJCNy6bQS/5sVlhgyKusqQc5czd7V0RpT5AAYPpTvEHcH+aN/e1POdcgUM8lAvJ9CXxzO4
	jkezh+JrQr7zRjFwGDVqIO5O++LusmE3eLm89jGboPR9xqjjZvwQb1ScBoTcXw==
Date: Mon, 13 Mar 2023 11:33:04 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>
Cc: Luke He <sixuerain@gmail.com>, tudor.ambarus@linaro.org,
 pratyush@kernel.org, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: Add support for XMC XM25QH256C /
 XM25QU256C / XM25QH512C / XM25QU512C site:
 https://www.xmcwh.com/site/product#
Message-ID: <20230313113304.1611638d@xps-13>
In-Reply-To: <d553beb1c6e38eac748d0b6b62bcd335@walle.cc>
References: <20230313100153.15441-1-sixuerain@gmail.com>
	<d553beb1c6e38eac748d0b6b62bcd335@walle.cc>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_033316_521246_D93A301A 
X-CRM114-Status: GOOD (  18.93  )
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

SGkgTWljaGFlbCwKCm1pY2hhZWxAd2FsbGUuY2Mgd3JvdGUgb24gTW9uLCAxMyBNYXIgMjAyMyAx
MTowODoxNSArMDEwMDoKCj4gSGksCj4gCj4gcGxlYXNlIGhhdmUgYSBsb29rIGF0IERvY3VtZW50
YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0Cj4gaG93IHRvIHByb3Blcmx5IGZv
cm1hdCBwYXRjaGVzLiBCdXQgYWxzbyBzZWUgYmVsb3cuCj4gCj4gQW0gMjAyMy0wMy0xMyAxMTow
MSwgc2NocmllYiBMdWtlIEhlOgo+ID4gU2lnbmVkLW9mZi1ieTogTHVrZSBIZSA8c2l4dWVyYWlu
QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbXRkL3NwaS1ub3IveG1jLmMgfCAxMiAr
KysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+ID4gCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci94bWMuYyBiL2RyaXZlcnMvbXRkL3Nw
aS1ub3IveG1jLmMKPiA+IGluZGV4IDA1MTQxMWU4NjMzOS4uNmRiMDFiODAyMzdmIDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci94bWMuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQv
c3BpLW5vci94bWMuYwo+ID4gQEAgLTE2LDYgKzE2LDE4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
Zmxhc2hfaW5mbyB4bWNfbm9yX3BhcnRzW10gPSB7Cj4gPiAgCXsgIlhNMjVRSDEyOEEiLCBJTkZP
KDB4MjA3MDE4LCAwLCA2NCAqIDEwMjQsIDI1NikKPiA+ICAJCU5PX1NGRFBfRkxBR1MoU0VDVF80
SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwKPiA+ICAJCQkgICAgICBTUElfTk9SX1FVQURfUkVBRCkg
fSwKPiA+ICsJeyAiWE0yNVFIMjU2QyIsIElORk8oMHgyMDQwMTksIDAsIDY0ICogMTAyNCwgNTEy
KQo+ID4gKwkJTk9fU0ZEUF9GTEFHUyhTRUNUXzRLIHwgU1BJX05PUl9EVUFMX1JFQUQgfAo+ID4g
KwkJCSAgICAgIFNQSV9OT1JfUVVBRF9SRUFEIHwgU1BJX05PUl80Ql9PUENPREVTKSB9LAo+ID4g
Kwl7ICJYTTI1UVUyNTZDIiwgSU5GTygweDIwNDExOSwgMCwgNjQgKiAxMDI0LCA1MTIpCj4gPiAr
CQlOT19TRkRQX0ZMQUdTKFNFQ1RfNEsgfCBTUElfTk9SX0RVQUxfUkVBRCB8Cj4gPiArCQkJICAg
ICBTUElfTk9SX1FVQURfUkVBRCB8IFNQSV9OT1JfNEJfT1BDT0RFUykgfSwKPiA+ICsJeyAiWE0y
NVFINTEyQyIsIElORk8oMHgyMDQwMjAsIDAsIDY0ICogMTAyNCwgMTAyNCkKPiA+ICsJCU5PX1NG
RFBfRkxBR1MoU0VDVF80SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwKPiA+ICsJCQkgICAgIFNQSV9O
T1JfUVVBRF9SRUFEIHwgU1BJX05PUl80Ql9PUENPREVTKSB9LAo+ID4gKwl7ICJYTTI1UVU1MTJD
IiwgSU5GTygweDIwNDEyMCwgMCwgNjQgKiAxMDI0LCAxMDI0KQo+ID4gKwkJTk9fU0ZEUF9GTEFH
UyhTRUNUXzRLIHwgU1BJX05PUl9EVUFMX1JFQUQgfAo+ID4gKwkJCSAgICAgU1BJX05PUl9RVUFE
X1JFQUQgfCBTUElfTk9SXzRCX09QQ09ERVMpIH0gIAo+IAo+IEkndmUganVzdCBsb29rZWQgYXQg
WE0yNVFIMjU2QyBbMV0sIGJ1dCBJIHN1c3BlY3QgYWxsIG9mIHRoZXNlCj4gZmxhc2hlcyBzdXBw
b3J0cyBTRkRQLCB0aGVyZWZvcmUgeW91IHNob3VsZG4ndCB1c2UgdGhlIE5PX1NGRFBfRkxBR1Mu
CgpJIGRpZG4ndCBjaGVjaywgZG8gd2UgaGF2ZSBhIGtkb2Mgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dCB3aGljaCBleHBsYWlucwp3aGF0IGZsYWdzIHRvIHVzZSBhbmQgd2hlbj8KCj4gVGhlbiwgd2l0
aG91dCBhbnkgYWRkaXRpb25hbCBmbGFncywgdGhlcmUgaXMgbm8gbmVlZCBmb3IgYW4gZW50cnkK
PiBhdCBhbGwsIGJlY2F1c2UgaXQgc2hvdWxkIGJlIGNvdmVyZXJlZCBieSB0aGUgImdlbmVyaWMg
c3BpLW5vciIKPiBkcml2ZXIgWzJdLgo+IAo+IC1taWNoYWVsCj4gCj4gWzFdIGh0dHBzOi8vd3d3
LnhtY3doLmNvbS91cGxvYWRzLzE5OC9YTTI1UUgyNTZDX1ZlcjEuOC5wZGYKPiBbMl0gaHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMy1yYzIvc291cmNlL2RyaXZlcnMvbXRkL3Nw
aS1ub3IvY29yZS5jI0wxNjM3CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
