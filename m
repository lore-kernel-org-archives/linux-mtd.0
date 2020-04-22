Return-Path: <SRS0=Xpy7=6G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0941BC5518A
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 07:26:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC4E920738
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 07:26:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="swL1b/UQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC4E920738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/VNlPxU8I1iRqYRhKeAKLaUvnyRfI6WqdrmDJ2XmXXI=; b=swL1b/UQF01mti
	+VgP7xU8eFJnAQACz/ox8FXj8lM1wgHTCvySIA8reV3fqvD5+k6CGQ311WLAybJ0f5z577E5m1ErZ
	4HRVCNI1QchtTLQQQ+PkJBWRp1IBQrXofyOui1VNcxQny3W3W8Qmz3F3fTMJXXhvd8xu1ZYJluenj
	4HX+JMoyJy6I9L0qA8oi2vQHUQel7PX42h8dhFQ7A2XfRbZGh1PPXusqJBtd2Wcuoa5ZhzY+nT3Hx
	cDV7dCmBgAMVTyzbk/U73ThdgrYq7qTzf9OmJaPWhUfv8QzdDzlqVIHuSFXsvi3c/yShjx98AQT6m
	IGJE7KkjYpg4LuRbkx0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jR9lj-0007wa-NY; Wed, 22 Apr 2020 07:26:03 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jR9lg-0007vR-Ot
 for linux-mtd@lists.infradead.org; Wed, 22 Apr 2020 07:26:02 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 546AD240005;
 Wed, 22 Apr 2020 07:25:56 +0000 (UTC)
Date: Wed, 22 Apr 2020 09:25:54 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 6/8] mtd: rawnand: onfi: Simplify the NAND operations
 during detection
Message-ID: <20200422092554.5f6f5313@xps13>
In-Reply-To: <20200422090052.5f27a42c@collabora.com>
References: <20200421164637.8086-1-miquel.raynal@bootlin.com>
 <20200421164637.8086-7-miquel.raynal@bootlin.com>
 <20200422090052.5f27a42c@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_002600_944654_D565E95C 
X-CRM114-Status: GOOD (  15.38  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBXZWQsIDIyIEFwcgoyMDIwIDA5OjAwOjUyICswMjAwOgoKPiBPbiBUdWUsIDIx
IEFwciAyMDIwIDE4OjQ2OjM1ICswMjAwCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4gd3JvdGU6Cj4gCj4gPiBUaGVyZSBpcyBubyBuZWVkIGZvciBzZXBhcmF0ZSBw
YXJhbWV0ZXIgcGFnZSByZWFkcywgdGhlIGRlbGF5IHBlbmFsdHkKPiA+IGlzIG5lZ2xpZ2libGUg
c28gbGV0J3MgZG8gcmVhZCB0aGUgdGhyZWUgY29waWVzIGluIG9uZSBnby4gIAo+IAo+IAkJICAg
IF5sZXQncyByZWFkCj4gCj4gSW4gdGhlb3J5IHRoYXQncyBjb3JyZWN0LCBidXQgSSBmZWFyIHRo
aXMgd2FzIGRvbmUgYmVjYXVzZSBzb21lCj4gY29udHJvbGxlcnMgY291bGRuJ3QgcmVhZCA3Njgg
Ynl0ZXMgaW4gb25lIGdvLiBDb3VsZCB3ZSBkbyB0aGF0IG9ubHkgaWYKPiB0aGUgY29udHJvbGxl
ciBpbXBsZW1lbnRzIGV4ZWNfb3AoKSBhbmQgZXhlY19vcChjaGVja19vbmx5KSByZXR1cm5zIHRy
dWU/CgpUaGFua3MgZm9yIHJldmlld2luZyBhbGwgdGhlIHBhdGNoZXMuIFlvdSBhcmUgcmlnaHQg
dGhhdCBpdCBtaWdodCBicmVhawpkcml2ZXJzIHNvIEknbGwgZmluZCBhIG1vcmUgYXBwcm9wcmlh
dGUgd2F5IHRvIGRvIGl0IChzYW1lIGZvciBKRURFQykuCgo+IAo+ID4gCj4gPiBTaWduZWQtb2Zm
LWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4gLS0tCj4g
PiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9vbmZpLmMgfCA4ICstLS0tLS0tCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA3IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9vbmZpLmMgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9uYW5kX29uZmkuYwo+ID4gaW5kZXggZDYxMjQxODBiNDdiLi5iNzY3NzI2NjZiODIg
MTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX29uZmkuYwo+ID4gKysr
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9vbmZpLmMKPiA+IEBAIC0xNjAsMTkgKzE2MCwx
MyBAQCBpbnQgbmFuZF9vbmZpX2RldGVjdChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ID4gIAlp
ZiAoIXBidWYpCj4gPiAgCQlyZXR1cm4gLUVOT01FTTsKPiA+ICAKPiA+IC0JcmV0ID0gbmFuZF9y
ZWFkX3BhcmFtX3BhZ2Vfb3AoY2hpcCwgMCwgTlVMTCwgMCk7Cj4gPiArCXJldCA9IG5hbmRfcmVh
ZF9wYXJhbV9wYWdlX29wKGNoaXAsIDAsIHBidWYsIDMgKiBzaXplb2YoKnBidWYpKTsKPiA+ICAJ
aWYgKHJldCkgewo+ID4gIAkJcmV0ID0gMDsKPiA+ICAJCWdvdG8gZnJlZV9vbmZpX3BhcmFtX3Bh
Z2U7Cj4gPiAgCX0KPiA+ICAKPiA+ICAJZm9yIChpID0gMDsgaSA8IDM7IGkrKykgewo+ID4gLQkJ
cmV0ID0gbmFuZF9yZWFkX2RhdGFfb3AoY2hpcCwgJnBidWZbaV0sIHNpemVvZigqcGJ1ZiksIHRy
dWUpOwo+ID4gLQkJaWYgKHJldCkgewo+ID4gLQkJCXJldCA9IDA7Cj4gPiAtCQkJZ290byBmcmVl
X29uZmlfcGFyYW1fcGFnZTsKPiA+IC0JCX0KPiA+IC0KPiA+ICAJCWNyYyA9IG9uZmlfY3JjMTYo
T05GSV9DUkNfQkFTRSwgKHU4ICopJnBidWZbaV0sIDI1NCk7Cj4gPiAgCQlpZiAoY3JjID09IGxl
MTZfdG9fY3B1KHBidWZbaV0uY3JjKSkgewo+ID4gIAkJCXAgPSAmcGJ1ZltpXTsgIAo+IAoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
