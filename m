Return-Path: <SRS0=prrA=7Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEE3C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 07:23:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D03D207F7
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 07:23:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f0hZc84S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D03D207F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VDVMSDcp1nbiso0CpkHps8z9w/eO+oxXWpcew3C4EFQ=; b=f0hZc84SUnR4b1
	m9aXV3jfTMxhYr2OmHOtOUetMJ5nkDbtOMpQ5SfuU95sF5nZwQ41fewkEi/1A3XQQDV/Cx0Wgw32s
	WW8trrmw4EzoiOQvHVOaScm/mfQyBVMeHVd5UBg9EZgF/aQ3aFB9OCm/xAAJoBKv+8PUDTjWRb3CE
	oYV+svDo1Oggi8qQacSv7fDYofSSU2+3kmYDNuukRQ+p9WXZ7odq8Ft1vww4v7zDXPLiO8nSld6hX
	axoxtXPN0ZFSFn8rytEQ/p/Fx6huYUg/8JH4JQIBTVrsBsn7d5nEWQUJsKS6gpJVkEC9aeylDDog9
	gFBAnIbMfDVIvxXL0FLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jje24-00047m-7h; Fri, 12 Jun 2020 07:23:20 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jje21-00047M-D8
 for linux-mtd@lists.infradead.org; Fri, 12 Jun 2020 07:23:18 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 926A320003;
 Fri, 12 Jun 2020 07:23:14 +0000 (UTC)
Date: Fri, 12 Jun 2020 09:23:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: Re: [PATCH V3 2/2] mtd: rawnand: qcom: set BAM mode only if not set
 already
Message-ID: <20200612092313.3d8df859@xps13>
In-Reply-To: <1591944589-14357-3-git-send-email-sivaprak@codeaurora.org>
References: <1591944589-14357-1-git-send-email-sivaprak@codeaurora.org>
 <1591944589-14357-3-git-send-email-sivaprak@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_002317_581578_1E5F7EFF 
X-CRM114-Status: GOOD (  14.38  )
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
Cc: architt@codeaurora.org, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, peter.ujfalusi@ti.com,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2l2YXByYWthc2gsCgpTaXZhcHJha2FzaCBNdXJ1Z2VzYW4gPHNpdmFwcmFrQGNvZGVhdXJv
cmEub3JnPiB3cm90ZSBvbiBGcmksIDEyIEp1bgoyMDIwIDEyOjE5OjQ5ICswNTMwOgoKPiBCQU0g
aXMgRE1BIGNvbnRyb2xsZXIgb24gUUNPTSBpcHEgcGxhdGZvcm1zLCBCQU0gbW9kZSBvbiBOQU5E
IGRyaXZlcgo+IGlzIHNldCBieSB3cml0aW5nIEJBTV9NT0RFX0VOIGJpdCBvbiBOQU5EX0NUUkwg
cmVnaXN0ZXIuCj4gCj4gTkFORF9DVFJMIGlzIGFuIG9wZXJhdGlvbmFsIHJlZ2lzdGVyIGFuZCBp
biBCQU0gbW9kZSBvcGVyYXRpb25hbAo+IHJlZ2lzdGVycyBhcmUgcmVhZCBvbmx5Lgo+IAo+IFNv
LCBiZWZvcmUgd3JpdGluZyBpbnRvIE5BTkRfQ1RSTCByZWdpc3RlciBjaGVjayBpZiBCQU0gbW9k
ZSBpcyBhbHJlYWR5CgpTbywgYmVmb3JlIGVuYWJsaW5nIEJBTSBtb2RlIGJ5IHdyaXRpbmcgdGhl
IE5BTkRfQ1RSTCByZWdpc3RlciwgY2hlY2sKaWYgQkFNIG1vZGUgd2FzIGFscmVhZHkgZW5hYmxl
ZCBieSB0aGUgYm9vdGxvYWRlci4KCj4gZW5hYmxlZCBieSBib290bG9hZGVyLCBhbmQgc2V0IEJB
TSBtb2RlIG9ubHkgaWYgaXQgaXMgbm90IHNldCBhbHJlYWR5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFNpdmFwcmFrYXNoIE11cnVnZXNhbiA8c2l2YXByYWtAY29kZWF1cm9yYS5vcmc+Cj4gLS0tCj4g
W1YzXQo+ICAqIENoYW5nZWQgY29tbWl0IG1lc3NhZ2UgdG8gZ2l2ZSBhIHNtYWxsIGluZm8gYWJv
dXQgQkFNCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyB8IDkgKysrKysrKyst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gaW5kZXggZTBjNTViYi4uNDgyN2VkZCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiArKysgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiBAQCAtMjc4NCw3ICsyNzg0LDE0IEBAIHN0YXRp
YyBpbnQgcWNvbV9uYW5kY19zZXR1cChzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIgKm5hbmRj
KQo+ICAJLyogZW5hYmxlIEFETSBvciBCQU0gRE1BICovCj4gIAlpZiAobmFuZGMtPnByb3BzLT5p
c19iYW0pIHsKPiAgCQluYW5kX2N0cmwgPSBuYW5kY19yZWFkKG5hbmRjLCBOQU5EX0NUUkwpOwo+
IC0JCW5hbmRjX3dyaXRlKG5hbmRjLCBOQU5EX0NUUkwsIG5hbmRfY3RybCB8IEJBTV9NT0RFX0VO
KTsKPiArCQkvKiBOQU5EX0NUUkwgaXMgYW4gb3BlcmF0aW9uYWwgcmVnaXN0ZXJzLCBhbmQgQ1BV
Cj4gKwkJICogYWNjZXNzIHRvIG9wZXJhdGlvbmFsIHJlZ2lzdGVycyBhcmUgcmVhZCBvbmx5Cj4g
KwkJICogaW4gQkFNIG1vZGUuIFNvIHVwZGF0ZSB0aGUgTkFORF9DVFJMIHJlZ2lzdGVyCj4gKwkJ
ICogb25seSBpZiBpdCBpcyBub3QgaW4gQkFNIG1vZGUuIEluIG1vc3QgY2FzZXMgQkFNCgogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQkFNIG1vZGUgYWxyZWFkeSAoQm9v
dGxvYWRlcnMKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1pZ2h0IGhh
dmUgYWxyZWFkeSBlbnRlcmVkCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB0aGlzIG1vZGUpLgoKPiArCQkgKiBtb2RlIHdpbGwgYmUgZW5hYmxlZCBpbiBib290bG9hZGVy
Cj4gKwkJICovCj4gKwkJaWYgKCEobmFuZF9jdHJsIHwgQkFNX01PREVfRU4pKQo+ICsJCQluYW5k
Y193cml0ZShuYW5kYywgTkFORF9DVFJMLCBuYW5kX2N0cmwgfCBCQU1fTU9ERV9FTik7Cj4gIAl9
IGVsc2Ugewo+ICAJCW5hbmRjX3dyaXRlKG5hbmRjLCBOQU5EX0ZMQVNIX0NISVBfU0VMRUNULCBE
TV9FTik7Cj4gIAl9CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
