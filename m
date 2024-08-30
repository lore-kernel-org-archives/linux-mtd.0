Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC89CA0EE6
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2024 07:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fBbAfsDbdMDJzHUgJ+j/x83fk0KCUcYcagMU3SMmohM=; b=C84FNsipB8YlQF
	UUrZHQW6OmOVM6UeySfdtbAcZAq6D3dy5g9ukpeLD6EwSljrdGgVmhbPdxPqBFuu7DrNW4OXvBRNu
	eoPPUWWXhXLelW6eqrfUeMGV7CLczdUaLkoIq0z4owb4eIq6E7bfCJMBGrVxMXSaApQE59GqWWc8x
	9X2NF9arG5BmcXzleenEnkpiAWQSLRc/EadTvfRaWIjbl+37eq4aQEwC9TQ3UX66q86nzIgBcSqb1
	F/PSWGsPlgfCVMo5OPIqbPonv7JpdnbuT57/kTYlzGlBMOqliEW9mcEFm12U88wqaRVHZBkur5XSJ
	+FAZRNQuG7MoqeEoET+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjvyU-000000055ck-2UmC;
	Fri, 30 Aug 2024 07:23:14 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjvyQ-000000055bq-3L9n
	for linux-mtd@lists.infradead.org;
	Fri, 30 Aug 2024 07:23:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F19E2C0007;
	Fri, 30 Aug 2024 07:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725002586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zAVkfF861Ic56JJgiKarCbntV6gkuimBD0QcrSHMWW8=;
	b=aphyiIi+Y4U9NbYfwnDiAHBX/fHSozrnuS5FVh5iOvpCEmHy+IAmmsTOe+AXfuEo5XL4fw
	+LSb6psNvgCxJiRF5bKUq2ZdkoE1Bfd9AWhPTT5J/upls0Y0c8up0P6aZt1teqCkX96uZa
	Ly9AWrsX9CechBwBXnUDexDjc/xhcCjZNxuAzCZQ+w0xDu/HDLKS8u5F5l2EyH4gmkUIJN
	cBVepioFrGYkrIQyct5cW8Eq+0+7yd97Ie10thze/vXJZjiunjlrX4dQP4iOWD4cL8E/DE
	cMl4kVJAvPAtH++rIvOUgk3yaeDzi65ht0i3vLGa/P233QlxgKMCyELfsTjpTQ==
Date: Fri, 30 Aug 2024 09:23:03 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw,
 leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v4 2/2] mtd: spinand: macronix: Use the flag in Macronix
 driver
Message-ID: <20240830092303.00ca7cc6@xps-13>
In-Reply-To: <20240829032517.1517198-3-linchengming884@gmail.com>
References: <20240829032517.1517198-1-linchengming884@gmail.com>
	<20240829032517.1517198-3-linchengming884@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_002311_898976_D461231E 
X-CRM114-Status: GOOD (  18.22  )
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

SGkgQ2hlbmdNaW5nLAoKbGluY2hlbmdtaW5nODg0QGdtYWlsLmNvbSB3cm90ZSBvbiBUaHUsIDI5
IEF1ZyAyMDI0IDExOjI1OjE3ICswODAwOgoKPiBGcm9tOiBDaGVuZyBNaW5nIExpbiA8Y2hlbmdt
aW5nbGluQG14aWMuY29tLnR3Pgo+IAo+IE1hY3Jvbml4IHNlcmlhbCBOQU5EIGZsYXNoIHdpdGgg
YSB0d28tcGxhbmUgc3RydWN0dXJlIHJlcXVpcmVzCj4gaW5zZXJ0aW9uIG9mIHRoZSBQbGFuZSBT
ZWxlY3QgYml0IGludG8gdGhlIGNvbHVtbiBhZGRyZXNzIGR1cmluZwo+IHRoZSB3cml0ZV90b19j
YWNoZSBvcGVyYXRpb24uCj4gCj4gQWRkaXRpb25hbGx5LCBmb3IgTVgzNXtVLEZ9MkcxNEFDIGFu
ZCBNWDM1TEYyR0U0QUIsIGluc2VydGlvbiBvZgo+IHRoZSBQbGFuZSBTZWxlY3QgYml0IGludG8g
dGhlIGNvbHVtbiBhZGRyZXNzIGlzIHJlcXVpcmVkIGR1cmluZwo+IHRoZSByZWFkX2Zyb21fY2Fj
aGUgb3BlcmF0aW9uLgo+IAoKUEFUSCAxIGlzIGZpbmUgZXhjZXB0IHRoZSBjb21taXQgdGl0bGUs
IGxldCBtZSBleHBsYWluLiBPbmNlIGFwcGxpZWQgaW4KdGhlIGtlcm5lbCB0cmVlLCB0aGVyZSBp
cyBubyBjb3ZlciBsZXR0ZXIgYW55bW9yZS4gU28gYm90aCB0aXRsZXMgd291bGQKYmUgIkFkZCBz
dXBwb3J0IGZvciB0aGUgZmxhZyIgYW5kICJVc2UgdGhlIGZsYWcuLi4iLCB3aGljaCBpcyByZWFs
bHkKbWlzc2luZyB0aGUgaW1wb3J0YW50IGluZm9ybWF0aW9uIGFzIHdlIGRvbid0IGtub3cgd2hh
dCB0aGlzIGZsYWcgaXMKZm9yLiBGdXJ0aGVybW9yZSwgdGhlIGZhY3QgdGhhdCB3ZSBkZWNpZGVk
IHRvIHVzZSBhIGZsYWcgaXMgYW4KaW1wbGVtZW50YXRpb24gZGV0YWlsLCB3aGF0IGlzIGltcG9y
dGFudCBpcyB0aGUgZmVhdHVyZTogc2V0dGluZyB0aGUKcGxhbmUgc2VsZWN0IGJpdC4KCkNhbiB5
b3UgcGxlYXNlIGNoYW5nZSB0aGUgZmlyc3QgY29tbWl0IHRpdGxlIHRvOgoKbXRkOiBzcGluYW5k
OiBBZGQgc3VwcG9ydCBmb3Igc2V0dGluZyBwbGFuZSBzZWxlY3QgYml0cwoKYW5kIGZvciB0aGUg
c2Vjb25kLCBzb21ldGhpbmcgbGlrZToKCm10ZDogc3BpbmFuZDogbWFjcm9uaXg6IEZsYWcgcGFy
dHMgbmVlZGluZyBleHBsaWNpdCBwbGFuZSBzZWxlY3QKCj4gU2lnbmVkLW9mZi1ieTogQ2hlbmcg
TWluZyBMaW4gPGNoZW5nbWluZ2xpbkBteGljLmNvbS50dz4KPiAtLS0KPiAgZHJpdmVycy9tdGQv
bmFuZC9zcGkvbWFjcm9uaXguYyB8IDE3ICsrKysrKysrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL3NwaS9tYWNyb25peC5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvbWFj
cm9uaXguYwo+IGluZGV4IDNmOWU5YzU3Mjg1NC4uZjE3Y2Q0YTZmNGQwIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvbXRkL25hbmQvc3BpL21hY3Jvbml4LmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5k
L3NwaS9tYWNyb25peC5jCj4gQEAgLTExOCw3ICsxMTgsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHNwaW5hbmRfaW5mbyBtYWNyb25peF9zcGluYW5kX3RhYmxlW10gPSB7Cj4gIAkJICAgICBTUElO
QU5EX0lORk9fT1BfVkFSSUFOVFMoJnJlYWRfY2FjaGVfdmFyaWFudHMsCj4gIAkJCQkJICAgICAg
JndyaXRlX2NhY2hlX3ZhcmlhbnRzLAo+ICAJCQkJCSAgICAgICZ1cGRhdGVfY2FjaGVfdmFyaWFu
dHMpLAo+IC0JCSAgICAgU1BJTkFORF9IQVNfUUVfQklULAo+ICsJCSAgICAgU1BJTkFORF9IQVNf
UUVfQklUIHwgU1BJTkFORF9IQVNfUFBfUExBTkVfU0VMRUNUX0JJVCB8Cj4gKwkJICAgICBTUElO
QU5EX0hBU19SRUFEX1BMQU5FX1NFTEVDVF9CSVQsCgpBbmQgSSBrbm93IHRoaXMgaXMgbm90IHdo
YXQgdGhlIG5vcm1hbCBjb2Rpbmcgc3R5bGUgd291bGQgYXNrIGZvciwgYnV0Ckkgd291bGQgcHJl
ZmVyIHRvIGhhdmUgdGhlIHR3byBwbGFuZSBzZWxlY3QgYml0cyBvbiB0aGUgc2FtZSBsaW5lIGlm
CnBvc3NpYmxlLCBvdGhlcndpc2Ugb24gdHdvIGluZGVwZW5kZW50IGxpbmVzLCBzbyBlaXRoZXI6
CgoJCVFFX0JJVCB8CgkJUFBfU0VMRUNUX0JJVCB8IFJFQUQgU0VMRUNUX0JJVCwKCm9yIG90aGVy
d2lzZToKCgkJUUVfQklUIHwKCQlQUF9TRUxFQ1RfQklUIHwKCQlSRUFEIFNFTEVDVF9CSVQsCgpB
bmQgZmluYWxseSwgY291bGQgd2UgbmFtZSB0aGUgZm9ybWVyCgoJCVNQSU5BTkRfSEFTX1BST0df
UExBTkVfU0VMRUNUX0JJVAoKPyBCZWNhdXNlICJQUCIgc291bmRzIGEgbGl0dGxlIGJpdCB0b28g
Y3J5cHRpYy4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
