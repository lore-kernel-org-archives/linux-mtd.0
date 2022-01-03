Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6F7C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jan 2022 16:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tfRs/SO5rBR1hjM6CE4EByERp9DQfCdupPGs+4A+1Cc=; b=Egp9Zvlch+dt5f
	Q1mF/kCDxcaXXxHgW+0ddS5SQm6vBQtzmQRNM7ojEqLlqzMmBfhGHabjwj8bDEBaZnihjsE9fFZVX
	qvKQYpPQLiZb4DB+dQt4VjuVvF4IoYTFG6SPGHe+mUmICTlSTfgMyeZC4cmAOqFtYHP5d6fPvteM0
	xBGR9W8j4bk9MBXzgN5cs7mhjoTOrK2bWLff4KOyqUbbTfze5DGX3rujXnWvpi7dGsqekFPuTdho9
	I2QSV5XZqFlPCPCbNI231nJ9thNSJvb9sa+A2hr9ZiAvDP2tfV07SgPe1q72V0dRM1ZzLfNmIftHP
	luLw/Gmhw/y12KmVdkcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4QX5-009Y3g-7r; Mon, 03 Jan 2022 16:50:03 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4QX1-009Y0g-Qu
 for linux-mtd@lists.infradead.org; Mon, 03 Jan 2022 16:50:02 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7F7CE240005;
 Mon,  3 Jan 2022 16:49:54 +0000 (UTC)
Date: Mon, 3 Jan 2022 17:49:53 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Cai
 Huoqing <caihuoqing@baidu.com>, Colin Ian King <colin.king@intel.com>,
 linux-kernel@vger.kernel.org (open list), linux-wireless@vger.kernel.org
 (open list:BROADCOM SPECIFIC AMBA DRIVER (BCMA)),
 bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM STB NAND FLASH
 DRIVER)
Subject: Re: [PATCH 1/9] mtd: rawnand: brcmnand: Allow SoC to provide I/O
 operations
Message-ID: <20220103174953.40d7fa52@xps13>
In-Reply-To: <20211223002225.3738385-2-f.fainelli@gmail.com>
References: <20211223002225.3738385-1-f.fainelli@gmail.com>
 <20211223002225.3738385-2-f.fainelli@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_085000_200652_B9F0FBEE 
X-CRM114-Status: GOOD (  22.01  )
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

SGkgRmxvcmlhbiwKCmYuZmFpbmVsbGlAZ21haWwuY29tIHdyb3RlIG9uIFdlZCwgMjIgRGVjIDIw
MjEgMTY6MjI6MTcgLTA4MDA6Cgo+IEFsbG93IGEgYnJjbW5hbmRfc29jIGluc3RhbmNlIHRvIHBy
b3ZpZGUgYSBjdXN0b20gc2V0IG9mIEkvTyBvcGVyYXRpb25zCj4gd2hpY2ggd2Ugd2lsbCByZXF1
aXJlIHdoZW4gdXNpbmcgdGhpcyBkcml2ZXIgb24gYSBCQ01BIGJ1cyB3aGljaCBpcyBub3QKPiBk
aXJlY3RseSBtZW1vcnkgbWFwcGVkIEkvTy4gVXBkYXRlIHRoZSBuYW5kX3tyZWFkLHdyaXRlfV9y
ZWcgYWNjb3JkaW5nbHkKPiB0byB1c2UgdGhlIFNvQyBvcGVyYXRpb25zIGlmIHByb3ZpZGVkLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIHwgMTQg
KysrKysrKysrKysrLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQu
aCB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzUgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21u
YW5kL2JyY21uYW5kLmMKPiBpbmRleCBmNzU5Mjk3ODNiOTQuLjdhMTY3M2IxYjFhZiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gKysrIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+IEBAIC01OTQsMTMgKzU5
NCwxOCBAQCBlbnVtIHsKPiAgCj4gIHN0YXRpYyBpbmxpbmUgdTMyIG5hbmRfcmVhZHJlZyhzdHJ1
Y3QgYnJjbW5hbmRfY29udHJvbGxlciAqY3RybCwgdTMyIG9mZnMpCj4gIHsKPiArCWlmIChicmNt
bmFuZF9zb2NfaGFzX29wcyhjdHJsLT5zb2MpKQo+ICsJCXJldHVybiBicmNtbmFuZF9zb2NfcmVh
ZChjdHJsLT5zb2MsIG9mZnMpOwo+ICAJcmV0dXJuIGJyY21uYW5kX3JlYWRsKGN0cmwtPm5hbmRf
YmFzZSArIG9mZnMpOwo+ICB9Cj4gIAo+ICBzdGF0aWMgaW5saW5lIHZvaWQgbmFuZF93cml0ZXJl
ZyhzdHJ1Y3QgYnJjbW5hbmRfY29udHJvbGxlciAqY3RybCwgdTMyIG9mZnMsCj4gIAkJCQkgdTMy
IHZhbCkKPiAgewo+IC0JYnJjbW5hbmRfd3JpdGVsKHZhbCwgY3RybC0+bmFuZF9iYXNlICsgb2Zm
cyk7Cj4gKwlpZiAoYnJjbW5hbmRfc29jX2hhc19vcHMoY3RybC0+c29jKSkKPiArCQlicmNtbmFu
ZF9zb2Nfd3JpdGUoY3RybC0+c29jLCB2YWwsIG9mZnMpOwo+ICsJZWxzZQo+ICsJCWJyY21uYW5k
X3dyaXRlbCh2YWwsIGN0cmwtPm5hbmRfYmFzZSArIG9mZnMpOwo+ICB9Cj4gIAo+ICBzdGF0aWMg
aW50IGJyY21uYW5kX3JldmlzaW9uX2luaXQoc3RydWN0IGJyY21uYW5kX2NvbnRyb2xsZXIgKmN0
cmwpCj4gQEAgLTc2NiwxMyArNzcxLDE4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBicmNtbmFuZF9y
bXdfcmVnKHN0cnVjdCBicmNtbmFuZF9jb250cm9sbGVyICpjdHJsLAo+ICAKPiAgc3RhdGljIGlu
bGluZSB1MzIgYnJjbW5hbmRfcmVhZF9mYyhzdHJ1Y3QgYnJjbW5hbmRfY29udHJvbGxlciAqY3Ry
bCwgaW50IHdvcmQpCj4gIHsKPiArCWlmIChicmNtbmFuZF9zb2NfaGFzX29wcyhjdHJsLT5zb2Mp
KQo+ICsJCXJldHVybiBicmNtbmFuZF9zb2NfcmVhZChjdHJsLT5zb2MsIH4wKTsKPiAgCXJldHVy
biBfX3Jhd19yZWFkbChjdHJsLT5uYW5kX2ZjICsgd29yZCAqIDQpOwo+ICB9Cj4gIAo+ICBzdGF0
aWMgaW5saW5lIHZvaWQgYnJjbW5hbmRfd3JpdGVfZmMoc3RydWN0IGJyY21uYW5kX2NvbnRyb2xs
ZXIgKmN0cmwsCj4gIAkJCQkgICAgIGludCB3b3JkLCB1MzIgdmFsKQo+ICB7Cj4gLQlfX3Jhd193
cml0ZWwodmFsLCBjdHJsLT5uYW5kX2ZjICsgd29yZCAqIDQpOwo+ICsJaWYgKGJyY21uYW5kX3Nv
Y19oYXNfb3BzKGN0cmwtPnNvYykpCj4gKwkJYnJjbW5hbmRfc29jX3dyaXRlKGN0cmwtPnNvYywg
dmFsLCB+MCk7Cj4gKwllbHNlCj4gKwkJX19yYXdfd3JpdGVsKHZhbCwgY3RybC0+bmFuZF9mYyAr
IHdvcmQgKiA0KTsKPiAgfQo+ICAKPiAgc3RhdGljIGlubGluZSB2b2lkIGVkdV93cml0ZWwoc3Ry
dWN0IGJyY21uYW5kX2NvbnRyb2xsZXIgKmN0cmwsCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmggYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNt
bmFuZC9icmNtbmFuZC5oCj4gaW5kZXggZWI0OThmYmU1MDVlLi5hM2YyYWQ1ZjY1NzIgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuaAo+ICsrKyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmgKPiBAQCAtMTEsMTIgKzEx
LDE5IEBACj4gIAo+ICBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlOwo+ICBzdHJ1Y3QgZGV2X3BtX29w
czsKPiArc3RydWN0IGJyY21uYW5kX2lvX29wczsKPiAgCj4gIHN0cnVjdCBicmNtbmFuZF9zb2Mg
ewo+ICAJYm9vbCAoKmN0bHJkeV9hY2spKHN0cnVjdCBicmNtbmFuZF9zb2MgKnNvYyk7Cj4gIAl2
b2lkICgqY3RscmR5X3NldF9lbmFibGVkKShzdHJ1Y3QgYnJjbW5hbmRfc29jICpzb2MsIGJvb2wg
ZW4pOwo+ICAJdm9pZCAoKnByZXBhcmVfZGF0YV9idXMpKHN0cnVjdCBicmNtbmFuZF9zb2MgKnNv
YywgYm9vbCBwcmVwYXJlLAo+ICAJCQkJIGJvb2wgaXNfcGFyYW0pOwo+ICsJY29uc3Qgc3RydWN0
IGJyY21uYW5kX2lvX29wcyAqb3BzOwo+ICt9Owo+ICsKPiArc3RydWN0IGJyY21uYW5kX2lvX29w
cyB7Cj4gKwl1MzIgKCpyZWFkX3JlZykoc3RydWN0IGJyY21uYW5kX3NvYyAqc29jLCB1MzIgb2Zm
c2V0KTsKPiArCXZvaWQgKCp3cml0ZV9yZWcpKHN0cnVjdCBicmNtbmFuZF9zb2MgKnNvYywgdTMy
IHZhbCwgdTMyIG9mZnNldCk7Cj4gIH07Cj4gIAo+ICBzdGF0aWMgaW5saW5lIHZvaWQgYnJjbW5h
bmRfc29jX2RhdGFfYnVzX3ByZXBhcmUoc3RydWN0IGJyY21uYW5kX3NvYyAqc29jLAo+IEBAIC01
OCw2ICs2NSwyMiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgYnJjbW5hbmRfd3JpdGVsKHUzMiB2YWws
IHZvaWQgX19pb21lbSAqYWRkcikKPiAgCQl3cml0ZWxfcmVsYXhlZCh2YWwsIGFkZHIpOwo+ICB9
Cj4gIAo+ICtzdGF0aWMgaW5saW5lIGJvb2wgYnJjbW5hbmRfc29jX2hhc19vcHMoc3RydWN0IGJy
Y21uYW5kX3NvYyAqc29jKQo+ICt7Cj4gKwlyZXR1cm4gc29jICYmIHNvYy0+b3BzICYmIHNvYy0+
b3BzLT5yZWFkX3JlZyAmJiBzb2MtPm9wcy0+d3JpdGVfcmVnOwo+ICt9Cj4gKwo+ICtzdGF0aWMg
aW5saW5lIHUzMiBicmNtbmFuZF9zb2NfcmVhZChzdHJ1Y3QgYnJjbW5hbmRfc29jICpzb2MsIHUz
MiBvZmZzZXQpCj4gK3sKPiArCXJldHVybiBzb2MtPm9wcy0+cmVhZF9yZWcoc29jLCBvZmZzZXQp
Owo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHZvaWQgYnJjbW5hbmRfc29jX3dyaXRlKHN0cnVj
dCBicmNtbmFuZF9zb2MgKnNvYywgdTMyIHZhbCwKPiArCQkJCSAgICAgIHUzMiBvZmZzZXQpCj4g
K3sKPiArCXNvYy0+b3BzLT53cml0ZV9yZWcoc29jLCB2YWwsIG9mZnNldCk7Cj4gK30KPiArCgpJ
dCBtaWdodCBiZSB3b3J0aCBsb29raW5nIGludG8gbW9yZSBvcHRpbWl6ZWQgd2F5cyB0byBkbyB0
aGVzZSBjaGVja3MsCmluIHBhcnRpY3VsYXIgdGhlIHJlYWQvd3JpdGVfcmVnIG9uZXMgYmVjYXVz
ZSB5b3UncmUgY2hlY2tpbmcgYWdhaW5zdApzb21lIHN0YXRpYyBkYXRhIHdoaWNoIGNhbm5vdCBi
ZSBvcHRpbWl6ZWQgb3V0IGJ5IHRoZSBjb21waWxlciBidXQKd29uJ3QgY2hhbmdlIGluIHRoZSBs
aWZldGltZSBvZiB0aGUga2VybmVsLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
