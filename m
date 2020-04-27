Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 308D3C5519A
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 17:07:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03F512076A
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 17:07:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QRhpbQ70"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03F512076A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GD20D2cREDKvn7rZbdwnqYoBLMGTjkCfTKrTwanhGRE=; b=QRhpbQ70mxdPIT
	uHkLHXuu/+d5JDlYSMOuNvBNnQyws3dqy57s0EFVijCP4hqbImTJTz1dYwYbVDZJyHJePPvFvZIUs
	bD5/Cg97vLqxxEhZauS1b9E1bS4Xd4ST5qJUIepoIB7NkZuvLVO4+c+1Xoa4i1DL7tfM8KmRXjY8F
	2q7kNyOEqh0dYS97253XJAgIlWfz6lzz6kzpIbpxcsYDtWfdn5OljW7Cj29UEInm4g/KFBbdX0S6L
	7/hHYl4H5jA3jav0jQlWBKNv8zcaAebg5qE3qoWMwHa3KThZeB4DoR+tqxeGccN8QxygE4M/IQ3dg
	BPiGo/CR0rb76Zvf3xxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT7Dz-0006v4-K0; Mon, 27 Apr 2020 17:07:19 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT7Dl-0006gM-Q0
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 17:07:07 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 9B7CFC0004;
 Mon, 27 Apr 2020 17:07:02 +0000 (UTC)
Date: Mon, 27 Apr 2020 19:07:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 4/9] mtd: rawnand: bcm47xx: Demistify a few more things
Message-ID: <20200427190701.6a54d04b@xps13>
In-Reply-To: <20200419125140.1307309-5-boris.brezillon@collabora.com>
References: <20200419125140.1307309-1-boris.brezillon@collabora.com>
 <20200419125140.1307309-5-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_100705_984910_C47121B3 
X-CRM114-Status: GOOD (  14.54  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-mtd@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 bcm-kernel-feedback-list@broadcom.com, openwrt-devel@lists.openwrt.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBTdW4sIDE5IEFwcgoyMDIwIDE0OjUxOjM1ICswMjAwOgoKPiBUaGVyZSB3ZXJl
IGEgZmV3IHBsYWNlcyB3ZXJlIHJhdyBoZXggdmFsdWVzIHdlcmUgdXNlZCBpbnN0ZWFkIG9mIHRo
ZQoKICAgICAgICAgICAgICAgICAgICAgICAgICB3aGVyZQoKPiBtYWNybyBkZWYuCgogICAgICAg
IGRlZj8gOikKCj4gCj4gV2UgYWxzbyBhZGQgbWFjcm9zIHRvIGhlbHAgZm9ybWluZyB0aGUgY29u
ZiB2YWx1ZSAobm90ZSB0aGF0IHdlIHN0aWxsCj4gaGF2ZSBvbmUgbWFnaWMgYml0IHdob3NlIG1l
YW5pbmcgSSBjb3VsZG4ndCBleHRyYWN0IGZyb20gdGhlIGNvZGUpLCBhbmQKPiBhZGQgYW4gZXh0
cmEgbWFjcm8gdG8gc3BlY2lmeSB0aGUgbnVtYmVyIG9mIERBVEEgY3ljbGVzIHRvIGlzc3VlIHdo
ZW4KPiB0aGUgUkVBRCBvciBXUklURSBmbGFnIGlzIHNldC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBC
b3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+IC0tLQo+ICAu
Li4vbXRkL25hbmQvcmF3L2JjbTQ3eHhuZmxhc2gvb3BzX2JjbTQ3MDYuYyAgfCAzNCArKysrKysr
KysrKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9iY200N3h4bmZs
YXNoL29wc19iY200NzA2LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9iY200N3h4bmZsYXNoL29w
c19iY200NzA2LmMKPiBpbmRleCA1OTE3NzUxNzMwMzQuLmZiYjdhY2ViYzhmNyAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9iY200N3h4bmZsYXNoL29wc19iY200NzA2LmMKPiAr
KysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9iY200N3h4bmZsYXNoL29wc19iY200NzA2LmMKPiBA
QCAtMjUsMTIgKzI1LDI5IEBACj4gICNkZWZpbmUgTkNUTF9DTUQxVwkJCTB4MDAwODAwMDAKPiAg
I2RlZmluZSBOQ1RMX1JFQUQJCQkweDAwMTAwMDAwCj4gICNkZWZpbmUgTkNUTF9XUklURQkJCTB4
MDAyMDAwMDAKPiArLyogV2hlbiB0aGUgU1BFQ0FERFIgaXMgc2V0IENNRDEgaXMgaW50ZXJwcmV0
ZWQgYXMgYSBzaW5nbGUgQUREUiBjeWNsZSAqLwo+ICAjZGVmaW5lIE5DVExfU1BFQ0FERFIJCQkw
eDAxMDAwMDAwCj4gICNkZWZpbmUgTkNUTF9SRUFEWQkJCTB4MDQwMDAwMDAKPiAgI2RlZmluZSBO
Q1RMX0VSUgkJCTB4MDgwMDAwMDAKPiArLyoKPiArICogTnVtYmVyIG9mIERBVEEgY3ljbGVzIHRv
IGlzc3VlIHdoZW4gTkNUTF97UkVBRCxXUklURX0gaXMgc2V0LiBUaGUgbWluaW11bQo+ICsgKiB2
YWx1ZSBpcyAxIGFuZCB0aGUgbWF4aW11bSB2YWx1ZSBpcyA0LiBUaG9zZSBieXRlcyBhcmUgdGhl
biBzdG9yZWQgaW4gdGhlCj4gKyAqIEJDTUFfQ0NfTkZMQVNIX0RBVEEgcmVnaXN0ZXIuCj4gKyAq
Lwo+ICsjZGVmaW5lIE5DVExfREFUQV9DWUNMRVMoeCkJCSgoKCh4KSAtIDEpICYgMHgzKSA8PCAy
OCkKPiArLyoKPiArICogVGhlIENTIHBpbiBzZWVtcyB0byBiZSBhc3NlcnRlZCBldmVuIGlmIE5D
VExfQ1NBIGlzIG5vdCBzZXQuIEFsbCB0aGlzIGJpdAo+ICsgKiBzZWVtcyB0byBlbmNvZGUgaXMg
d2hldGhlciB0aGUgQ1MgbGluZSBzaG91bGQgc3RheSBhc3NlcnRlZCBhZnRlciB0aGUKPiArICog
b3BlcmF0aW9uIGhhcyBiZWVuIGV4ZWN1dGVkLiBJbiBvdGhlciB3b3JkcywgeW91IHNob3VsZCBv
bmx5IHNldCBpdCBpZiBpZgoKcy9pdCBpZiBpZi9pdCBpZi8KCj4gKyAqIHlvdSBpbnRlbmQgdG8g
ZG8gbW9yZSBvcGVyYXRpb25zIG9uIHRoZSBOQU5EIGJ1cy4KPiArICovCj4gICNkZWZpbmUgTkNU
TF9DU0EJCQkweDQwMDAwMDAwCj4gICNkZWZpbmUgTkNUTF9TVEFSVAkJCTB4ODAwMDAwMDAKPiAg
Cj4gKyNkZWZpbmUgQ09ORl9NQUdJQ19CSVQJCQkweDAwMDAwMDAyCj4gKyNkZWZpbmUgQ09ORl9D
T0xfQllURVMoeCkJCSgoKHgpIC0gMSkgPDwgNCkKPiArI2RlZmluZSBDT05GX1JPV19CWVRFUyh4
KQkJKCgoeCkgLSAxKSA8PCA2KQo+ICsKCgpXaXRoIHRoZSBhYm92ZSBjb3JyZWN0ZWQsCgpSZXZp
ZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCgoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
