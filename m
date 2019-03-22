Return-Path: <SRS0=aBH3=RZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4218C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2019 09:05:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0D6D218E2
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2019 09:05:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zf+wisMP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0D6D218E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wmQiy6VUAnzl7POZyhIde06uwUqyvJJR9WG+kfTlGHE=; b=Zf+wisMPoPVJvs
	B/DN4EcKiCg7BMSVFBOxvOMnLAP5dy0bd6osGsdWgRUBPji09rO/B2qTF4Tw+t57y5swPYV83ctUo
	2QwEX8OHbbEMQ41rWN47R53JP5PcrnrAhJGBdMG76vrU3VNeeZ3hYAJJ2Qger9lYOG7A7/8Fstm41
	2IcaEKQQmzDXktWqqpDyGjELQ7/tinGzeL6pAgR7YmB2zZN4FqVjJqt+J4Q3PSgtXwKbeg/OI2Xc4
	onQ/Vx3XI+dcBZXqIgTmyrXr4/SeApENuDfeanjmX16yMp9Dmmf10GtVf/y8UiJk+jbzxPPzSbH3f
	GuRCrBScmJYYD2525glA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7G7J-0003V5-BC; Fri, 22 Mar 2019 09:05:33 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7G77-0003JB-82; Fri, 22 Mar 2019 09:05:24 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B539327D974;
 Fri, 22 Mar 2019 09:05:17 +0000 (GMT)
Date: Fri, 22 Mar 2019 10:05:14 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: marvell: select target before setting up
 data interface
Message-ID: <20190322100514.25c3f9ee@collabora.com>
In-Reply-To: <20190322093046.71df010d@xps13>
References: <20190321212010.3995-1-daniel@zonque.org>
 <20190322093046.71df010d@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_020521_424808_2B8EA4BC 
X-CRM114-Status: GOOD (  19.42  )
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org, haojian.zhuang@gmail.com,
 Daniel Mack <daniel@zonque.org>, robert.jarzmik@free.fr,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyMiBNYXIgMjAxOSAwOTozMDo0NiArMDEwMApNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSGkgRGFuaWVsLAo+IAo+ICsgUmljaGFyZDog
dGhpcyBpcyBmaXhlcyBtYXRlcmlhbHMKPiAKPiBEYW5pZWwgTWFjayA8ZGFuaWVsQHpvbnF1ZS5v
cmc+IHdyb3RlIG9uIFRodSwgMjEgTWFyIDIwMTkgMjI6MjA6MTAKPiArMDEwMDoKPiAKPiA+IE5v
dyB0aGF0IHRoZSBuYW5kIGRyaXZlcnMgYXJlIHJlc3BvbnNpYmxlIGZvciBzZWxlY3RpbmcgdGhl
IHRhcmdldAo+ID4gcHJpb3IgdG8gaGFyZHdhcmUgYWNjZXNzLCBhIGNhbGwgdG8gbWFydmVsbF9u
ZmNfc2VsZWN0X3RhcmdldCgpIGlzCj4gPiBuZWNlc3NhcnkgZnJvbSBtYXJ2ZWxsX25mY19zZXR1
cF9kYXRhX2ludGVyZmFjZSgpLgo+ID4gCj4gPiBUaGlzIGlzIGEgcmVncmVzc2lvbiBpbnRyb2R1
Y2VkIGJ5IGNvbW1pdCBiMjUyNTE0MTRmNmUgKCJtdGQ6Cj4gPiByYXduYW5kOiBtYXJ2ZWxsOiBT
dG9wIGltcGxlbWVudGluZyAtPnNlbGVjdF9jaGlwKCkiKS4KPiA+IAo+ID4gRml4ZXM6IGIyNTI1
MTQxNGY2ZSAoIm10ZDogcmF3bmFuZDogbWFydmVsbDogU3RvcCBpbXBsZW1lbnRpbmcgLT5zZWxl
Y3RfY2hpcCgpIikKPiA+IENjOiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xs
YWJvcmEuY29tPgo+ID4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+ID4gU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIE1hY2sgPGRhbmllbEB6b25xdWUub3JnPgo+ID4gLS0tCj4gPiAgZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMgfCAyICsrCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvbWFydmVsbF9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxsX25hbmQuYwo+
ID4gaW5kZXggODQyODNjNmJiMGZmLi45M2FiZTViZTg5OTUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxsX25hbmQuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvbWFydmVsbF9uYW5kLmMKPiA+IEBAIC0yMzI1LDYgKzIzMjUsOCBAQCBzdGF0aWMgaW50
IG1hcnZlbGxfbmZjX3NldHVwX2RhdGFfaW50ZXJmYWNlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAs
IGludCBjaGlwbnIsCj4gPiAgCXN0cnVjdCBtYXJ2ZWxsX25mY190aW1pbmdzIG5mY190bWc7Cj4g
PiAgCWludCByZWFkX2RlbGF5Owo+ID4gIAo+ID4gKwltYXJ2ZWxsX25mY19zZWxlY3RfdGFyZ2V0
KGNoaXAsIGNoaXAtPmN1cl9jcyk7CgpNYXliZSBzL2NoaXAtPmN1cl9jcy9jaGlwbnIvCgo+ID4g
Kwo+ID4gIAlzZHIgPSBuYW5kX2dldF9zZHJfdGltaW5ncyhjb25mKTsKPiA+ICAJaWYgKElTX0VS
UihzZHIpKQo+ID4gIAkJcmV0dXJuIFBUUl9FUlIoc2RyKTsgIAo+IAo+IEkgaGFkIGEgc2hvcnQg
bG9vayB5ZXN0ZXJkYXkgYW5kIHRoaXMgaXMgdmVyeSBsaWtlbHkgdG8gYmUgdGhlIHJvb3QKPiBj
YXVzZSBvZiB0aGUgcmVncmVzc2lvbiwgdGhhbmsgeW91IHZlcnkgbXVjaCEKPiAKPiBBY2tlZC1i
eTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiAKPiAKPiBUaGFu
a3MsCj4gTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
