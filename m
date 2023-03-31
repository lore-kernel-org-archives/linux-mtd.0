Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFECC76196
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 19:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TcSBGDSUzwdWMhlM1HyiZJpKR8H+a2FiYcU1ix9ZzhE=; b=N6+TAAsY4IX3VH
	30PCsUHRlK7klqy+9NAj4ftsiHPHImNqdlCG41lN/FKkcCxCkxY8FYulbtGT69nAWNFMFhXuIjgKv
	SviJpLfy7PZ0TN3kQsKqbPB/0M4V5iDLGtxrDfVdiaJKnPnKPnAW2hfT9SVxcioMJ+LV92CIErczc
	y08w4nFaVvOFfaocRBfXA72BFwGOM/ke1mfwAxbxbU38rFMukU1azU6gTDAvn9ab9CNR/H40PpHl3
	huR1XBM8uPX/f1X2vxG0ag0oZ+p3gQeoXyVaiF6t3sZqs1XG2rzsj+crxOGu05p+Y3ge4ME9evix0
	00kxTXu+o+ttoFwTQUhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piKZo-008e0F-1j;
	Fri, 31 Mar 2023 19:38:20 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piKZV-008dxW-0n;
	Fri, 31 Mar 2023 19:38:18 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 67723100004;
	Fri, 31 Mar 2023 19:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680291468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kFBVrVOQyZuP1epBb0KyjiiYxLsReADEa8xtbq9XLdo=;
	b=bjoXShgOmtnAvMopFjcD/VimeL7CocBKS5ZMbzr4UuR/DYJ5BAlnwZ6eTk7RYBYuxoSM6Q
	QocFptOaQgnGvZf+wC8bIGgtxYcvF2iS58AZsUFrwOYPsKpSMSb4gG9TnREZyqwM+YFQg1
	ih6EcCUN0rKhwfWM7JzAHicLI/gP5JiWLfM0iDVO7rsOCGXNk9Q0qasIV149Z18F2LBYEZ
	dxo25brabG4HRvXwNwmJhahvrzkKAHkMNVHnxLcarEqzvaLoPvi793Fo/hwijTnUMgQhLm
	ZIu5/vdjHaf1rRIV7teUuNoaoHwxNpjQWzqhlAjBZvVwhUMfLsVXXZk/yDbibQ==
Date: Fri, 31 Mar 2023 21:37:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: liao jaime <jaimeliao.tw@gmail.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Julien Su <juliensu@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>, Alvin Zhou <alvinzhou@mxic.com.tw>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Michal Simek <monstr@monstr.eu>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 8/8] mtd: spi-nor: macronix: Add support for
 mx25uw51245g with RWW
Message-ID: <20230331213743.25485970@xps-13>
In-Reply-To: <f243010c-72e3-6b59-6696-af7c7cdc6596@linaro.org>
References: <20230328154105.448540-1-miquel.raynal@bootlin.com>
	<20230328154105.448540-9-miquel.raynal@bootlin.com>
	<8ade974e-eb68-f448-7ec5-91c6b636eacf@linaro.org>
	<20230328184536.33f2f023@xps-13>
	<CAAQoYRknqq7=HFAeAB=W59G5ui_t3VSt3Xa33YbXeWPtJyxQsQ@mail.gmail.com>
	<f243010c-72e3-6b59-6696-af7c7cdc6596@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_123816_221440_32568858 
X-CRM114-Status: GOOD (  32.58  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gV2VkLCAyOSBNYXIg
MjAyMyAxMjoxMjoyOSArMDEwMDoKCj4gT24gMy8yOS8yMyAwNjo0OCwgbGlhbyBqYWltZSB3cm90
ZToKPiA+IEhpIE1pcXVlbAo+ID4gICAKPiA+Pgo+ID4+IEhpIFR1ZG9yLAo+ID4+Cj4gPj4gdHVk
b3IuYW1iYXJ1c0BsaW5hcm8ub3JnIHdyb3RlIG9uIFR1ZSwgMjggTWFyIDIwMjMgMTc6MzE6NDYg
KzAxMDA6Cj4gPj4gIAo+ID4+PiBPbiAzLzI4LzIzIDE2OjQxLCBNaXF1ZWwgUmF5bmFsIHdyb3Rl
OiAgCj4gPj4+PiBEZXNjcmliZSB0aGlzIG5ldyBwYXJ0IGFuZCBwcm92aWRlIHRoZSBSV1cgZmxh
ZyBmb3IgaXQuCj4gPj4+Pgo+ID4+Pj4gVGhlcmUgaXMgbm8gcHVibGljIGRhdGFzaGVldCwgYnV0
IGhlcmUgYXJlIHRoZSBzZmRwIHRhYmxlcyBwbHVzIGJhc2UKPiA+Pj4+IHRlc3RpbmcgdG8gc2hv
dyBpdCB3b3Jrcy4KPiA+Pj4+Cj4gPj4+PiBteDI1dXc1MTI0NWcKPiA+Pj4+IGMyODEzYQo+ID4+
Pj4gbWFjcm9uaXgKPiA+Pj4+IDUzNDY0NDUwMDgwMTA0ZmQwMDA3MDExNDQwMDAwMGZmODcwMTAx
MWM5MDAwMDBmZjBhMDAwMTA4MDAwMQo+ID4+Pj4gMDBmZjA1MDAwMTA1MjAwMTAwZmY4NDAwMDEw
MjM0MDEwMGZmMDAwMDAwMDAwMDAwMDAwMGZmZmZmZmZmCj4gPj4+PiBmZmZmZmZmZmU1MjA4YWZm
ZmZmZmZmMWYwMGZmMDBmZjAwZmYwMGZmZWVmZmZmZmZmZmZmMDBmZmZmZmYKPiA+Pj4+IDAwZmYw
YzIwMTBkODAwZmYwMGZmODc3OTAxMDA4MjEyMDBlMjc3MDQ2NzQ2MzBiMDMwYjBmNGJkZDU1Ywo+
ID4+Pj4gMDAwMDAwZmYxMDEwMDAyMDAwMDAwMDAwMDAwMDdjYTE0ODAwMDAwMDAwMDA4ODg4MDAw
MDAwMDAwMDAwCj4gPj4+PiAwMDQwMGZkMWZmZjMwZmQxZmZmMzAwMDUwMDkwMDAwNTAwYjEwMDJi
MDA5NTAwMmIwMDk2NzI3MTAzYjgKPiA+Pj4+IDcyNzEwM2I4MDAwMDAwMDA5MGEzMTg4MjAwYzA2
OTk2MDAwMDAwMDAwMDAwMDAwMDcyNzEwMDk4NzI3MQo+ID4+Pj4gMDBiODcyNzEwMDk5MDAwMDAw
MDA3MjcxMDA5ODcyNzEwMGY4NzI3MTAwOTk3MjcxMDBmOTAwMDAwMDAwCj4gPj4+PiAwMDAwMDAw
MDAxMTUwMWQwNzI3MTA2ZDgwMDAwODY1MDAwMDAwNjAxMDAwMDAwMDAwMjAwMDEwMzAwMDIKPiA+
Pj4+IDAwMDAwMDAwMDYwMTAwMDAwMDAwMDAwMDcyMDYwMDAyMDAwMDAwZWVjMDY5NzI3MjcxNzEw
MGQ4ZjdmNgo+ID4+Pj4gMDAwYTAwMDAxNDQ1OTg4MDQzMDYwZjAwMjFkY2ZmZmYKPiA+Pj4+IDA0
N2E4ODRjZjQ0ZDlmZmMyYTk0ZDNhYjM3YjQ4YzYzICAvc3lzL2J1cy9zcGkvZGV2aWNlcy9zcGkw
LjAvc3BpLW5vci9zZmRwICAKPiA+Pj4KPiA+Pj4gd2hpY2ggaGFzaCBhbGcgd2FzIHVzZWQsIHdh
cyBpdCBzaGExPyBObyBuZWVkIHRvIHJlc3VibW5pdCBqdXN0IGZvciB0aGlzLiAgCj4gPj4KPiA+
PiBBY3R1YWxseSBnaXQganVzdCBpZ25vcmVkIGFsbCB0aGUgbGluZXMgc3RhcnRpbmcgd2l0aCAn
IycKPiA+PiBsaWtlIGlmIHRoZXkgd2VyZSBjb21tZW50cyBhbmQgSSBkaWQgbm90IG5vdGljZS4u
Lgo+ID4+Cj4gPj4gSSB3aWxsIGFtZW5kIG15IGNvbW1pdCBsb2dzIGFuZCByZXNlbmQuCj4gPj4g
IAo+ID4+Pj4KPiA+Pj4+IDYrMCByZWNvcmRzIGluCj4gPj4+PiA2KzAgcmVjb3JkcyBvdXQKPiA+
Pj4+IENvcGllZCA2MjkxNDU2IGJ5dGVzIGZyb20gcXNwaV90ZXN0IHRvIGFkZHJlc3MgMHgwMDAw
MDAwMCBpbiBmbGFzaAo+ID4+Pj4gRXJhc2VkIDYyOTE0NTYgYnl0ZXMgZnJvbSBhZGRyZXNzIDB4
MDAwMDAwMDAgaW4gZmxhc2gKPiA+Pj4+IENvcGllZCA2MjkxNDU2IGJ5dGVzIGZyb20gYWRkcmVz
cyAweDAwMDAwMDAwIGluIGZsYXNoIHRvIHFzcGlfcmVhZAo+ID4+Pj4gMDAwMDAwMCBmZmZmIGZm
ZmYgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmIGZmZmYKPiA+Pj4+ICoKPiA+Pj4+IDA2MDAwMDAK
PiA+Pj4+IENvcGllZCA2MjkxNDU2IGJ5dGVzIGZyb20gcXNwaV90ZXN0IHRvIGFkZHJlc3MgMHgw
MDAwMDAwMCBpbiBmbGFzaAo+ID4+Pj4gQ29waWVkIDYyOTE0NTYgYnl0ZXMgZnJvbSBhZGRyZXNz
IDB4MDAwMDAwMDAgaW4gZmxhc2ggdG8gcXNwaV9yZWFkCj4gPj4+PiBkMjRhOTUyM2RiODI5YTBk
ZjY4OGYzNGI4ZGM3NmExMzgzYjc0MDI0ICBxc3BpX3Rlc3QKPiA+Pj4+IGQyNGE5NTIzZGI4Mjlh
MGRmNjg4ZjM0YjhkYzc2YTEzODNiNzQwMjQgIHFzcGlfcmVhZAo+ID4+Pj4KPiA+Pj4+IFNpZ25l
ZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPj4+
PiAtLS0KPiA+Pj4+ICBkcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMgfCA0ICsrKysKPiA+
Pj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gPj4+Pgo+ID4+Pj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYyBiL2RyaXZlcnMvbXRkL3NwaS1u
b3IvbWFjcm9uaXguYwo+ID4+Pj4gaW5kZXggNjg1M2VjOWFlNjVkLi5iNjVkNDFlNWY3NDkgMTAw
NjQ0Cj4gPj4+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMKPiA+Pj4+ICsr
KyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYwo+ID4+Pj4gQEAgLTgyLDYgKzgyLDEw
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyBtYWNyb25peF9ub3JfcGFydHNbXSA9
IHsKPiA+Pj4+ICAgICB7ICJteDI1dTUxMjQ1ZyIsIElORk8oMHhjMjI1M2EsIDAsIDY0ICogMTAy
NCwgMTAyNCkKPiA+Pj4+ICAgICAgICAgICAgIE5PX1NGRFBfRkxBR1MoU0VDVF80SyB8IFNQSV9O
T1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQpCj4gPj4+PiAgICAgICAgICAgICBGSVhV
UF9GTEFHUyhTUElfTk9SXzRCX09QQ09ERVMpIH0sCj4gPj4+PiArICAgeyAibXgyNXV3NTEyNDVn
IiwgSU5GT0IoMHhjMjgxM2EsIDAsIDE2ICogMTAyNCwgMTAyNCwgNCkgIAo+ID4+Pgo+ID4+PiBT
ZWN0b3Igc2l6ZSBhbmQgbnNlY3RvcnMgc2hhbGwgYmUgZGlzY292ZXJlZCBhdCBwYXJzZSBTRkRQ
IHRpbWUuCj4gPj4+IERvZXMgSU5GT0IoMHhjMjgxM2EsIDAsIDAsIDAsIDQpIHdvcmsgZm9yIHlv
dT8gIAo+ID4+Cj4gPj4gSSdsbCBjaGVjay4KPiA+PiAgCj4gPj4+ICAKPiA+Pj4+ICsgICAgICAg
ICAgIFBBUlNFX1NGRFAgIAo+ID4+Pgo+ID4+PiBZYWF5Cj4gPj4+ICAKPiA+Pj4+ICsgICAgICAg
ICAgIEZMQUdTKFNQSV9OT1JfUldXKQo+ID4+Pj4gKyAgICAgICAgICAgRklYVVBfRkxBR1MoU1BJ
X05PUl80Ql9PUENPREVTKSB9LCAgCj4gPj4+Cj4gPj4+IElzIFNQSV9OT1JfNEJfT1BDT0RFUyBm
bGFnIHJlYWxseSBuZWVkZWQ/ICAKPiA+Pgo+ID4+IEkgaGF2ZSBubyBpZGVhLCBJIHRvb2sgdGhh
dCBmcm9tIG9sZGVyIGNvZGUuCj4gPj4KPiA+PiBKYWltZSwgd2hhdCBkbyB5b3UgdGhpbms/ICAK
PiA+IEkgdGhpbmsgVHVkb3IgaG9wZXMgdGhhdCBTRkRQIHRhYmxlIGNvdWxkIGRldGVybWluZSBo
b3cgbWFueSBhZGRyZXNzIGJ5dGVzLiAgCj4gCj4gTm8sIG5vLgo+IAo+IDopIGFuZCBob3BlIGFu
ZCBwcm9ncmFtbWluZyBkb24ndCBnZXQgYWxvbmcuCj4gCj4gRG9lcyB0aGlzIGZsYXNoIGRlZmlu
ZSB0aGUgNGJhaXQgdGFibGU/IENhbiB5b3UgYWRkIGEgcHJpbnQgaW4KPiBwYXJzZV80YmFpdCB0
YWJsZSBhbmQgY2hlY2sgaWYgU05PUl9GXzRCX09QQ09ERVMgaXMgc2V0PyBJZiB5ZXMsIHRoZQo+
IGZpeHVwIGZsYWcgaXMgbm90IG5lZWRlZC4KPiAKPiBTTk9SX0ZfNEJfT1BDT0RFUyBpcyBhbiBp
bmRpY2F0aW9uIHRoYXQgdGhlIGZsYXNoIHN1cHBvcnRzIGRlZGljYXRlZAo+IG9wY29kZXMgZm9y
IDRieXRlIGFkZHJlc3MsIHdpdGhvdXQgdGhlIG5lZWQgdG8gY2hhbmdlIHRoZSBhZGRyZXNzIG1v
ZGUKPiB0byA0IGJ5dGUuIFdoZW4gNEJfT1BDT0RFUyBhcmUgc3VwcG9ydGVkLCB3ZSBwcmVmZXIg
bm90IGNoYW5naW5nIHRoZQo+IGFkZHJlc3MgbW9kZSwgYmVjYXVzZSB3aGVuIGNoYW5naW5nIHRv
IDQgYnl0ZSBhZGRyZXNzIG1vZGUsIHRoZSBzdGF0ZSBpcwo+IGtlcHQgYXQgcmVzZXQgKG9yIHBv
d2VyIGxvc3MpIGFuZCBmbGFzaGVzIG1pZ2h0IG5vdCBiZSBhYmxlIHRvIGJvb3QgYXQKPiBsb3dl
ciBsYXllcnMgKHUtYm9vdCBmb3IgZXhhbXBsZSkuCgpUaGUgZmxhZyBpcyBzZXQsIG5vIG5lZWQg
Zm9yIGhhcmRjb2RpbmcgaXQuCgpFeGNlbGxlbnQsIEknbGwgcHJlcGFyZSB0aGUgcGF0Y2guCgpX
aGlsZSBJIHdhcyB0ZXN0aW5nIEkgZmlndXJlZCBvdXQ6IHRoZSBiYW5rIHNpemUgY2FsY3VsYXRp
b24gaGFwcGVucwp0b28gZWFybHksIHNvIGlmIHdlIGRpc2NvdmVyIHRoZSBzaXplIHdpdGggdGhl
IFNGRFAgdGFibGUsIHRoYXQgd29uJ3QKd29yay4gSSdsbCBmaXggaXQsIGZlZWwgZnJlZSB0byBz
cXVhc2ggdGhlIHBhdGNoIGlmIHlvdSBwcmVmZXIuCgo+IAo+IFNvIEknZCB0cnk6Cj4geyAibXgy
NXV3NTEyNDVnIiwgSU5GT0IoMHhjMjgxM2EsIDAsIDAsIDAsIDQpCj4gCQlQQVJTRV9TRkRQCj4g
CQlGTEFHUyhTUElfTk9SX1JXVykgfSwKPiAKPiBJbiB0aGUgZnV0dXJlIHdlJ2QgbGlrZSB0byBh
ZGQgYSBzZmRwLWRlY29kZXIgaW4gbXRkLXV0aWxzIHRvIGRlY29kZSB0aGUKPiBzZmRwIGR1bXAg
YW5kIGVhc2UgdGhlIHJldmlldyBhbmQgYXZvaWQgc3VjaCBxdWVzdGlvbnMsIGJ1dCB3ZSBjb3Vs
ZG4ndAo+IGFsbG9jYXRlIHRoZSB0aW1lIHRvIGltcGxlbWVudCBpdCB1cCB0byBub3cuIE1laCwg
d2UncmUgZG9pbmcgaXQgYXQgYmVzdAo+IGVmZm9ydCwgaW4gb3VyIHNwYXJlIHRpbWUuIFZvbHVu
dGVlcnM/Cj4gCj4gQ2hlZXJzLAo+IHRhCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
