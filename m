Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF17C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 17:14:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21A49206C0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 17:14:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ROI6TtxO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21A49206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1uZo+Rcs5YV+1EJNtILrDzSJSXI3GIP0u8GDBAGFAMI=; b=ROI6TtxOpS6Pbi
	oBi3JSlZLMYWV1jhpoy5mj3IHnSr3QPq7Ov39PKG7p5MT9Mvlqk3g3IuPSafw+/PO7E8Kz4zuIFol
	JBS1ccBjm8bnoZUS1knRrfro9YMwM8Lwo127EQd3V0uzM/4+qMnfd83ZlpkLC0aSRd1cONdDGwUbO
	GhRFY9l/sb8G5/qJZl7t2Cz+YDyvpFNYupch3sse7P/G0Xrvz3Dkf0qkxSwtXhvlxs+5gQZoS9wvO
	pRSo4177TI/ZyXnALkjOQNvwT4p/iwkKlHbro7k7i2BliQzxjqkk6WDiGPTt2IbMGLTjxottv9Rdw
	t9rS9EuaevAlRsDInL5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hB0W0-0002MT-Vk; Mon, 01 Apr 2019 17:14:32 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hB0Vx-0002LH-HI
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 17:14:31 +0000
Received: from xps13 (178.163.185.81.rev.sfr.net [81.185.163.178])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id E9D4B240002;
 Mon,  1 Apr 2019 17:14:20 +0000 (UTC)
Date: Mon, 1 Apr 2019 19:14:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 1/9] mtd: rawnand: denali: use nand_chip pointer more
 for internal functions
Message-ID: <20190401191419.0431882e@xps13>
In-Reply-To: <20190330152323.71734cb8@collabora.com>
References: <1553844501-7119-1-git-send-email-yamada.masahiro@socionext.com>
 <1553844501-7119-2-git-send-email-yamada.masahiro@socionext.com>
 <20190330152323.71734cb8@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_101430_260355_42B34A2F 
X-CRM114-Status: GOOD (  19.90  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEu
Y29tPiB3cm90ZSBvbiBTYXQsIDMwIE1hcgoyMDE5IDE1OjIzOjIzICswMTAwOgoKPiBPbiBGcmks
IDI5IE1hciAyMDE5IDE2OjI4OjEzICswOTAwCj4gTWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFz
YWhpcm9Ac29jaW9uZXh0LmNvbT4gd3JvdGU6Cj4gCj4gPiBXaXRoIHRoZSByZWNlbnQgcmVmYWN0
b3JpbmcsIHRoZSBOQU5EIGRyaXZlciBob29rcyBub3cgdGFrZSBhIHBvaW50ZXIKPiA+IHRvIG5h
bmRfY2hpcC4gQWRkIHRvX2RlbmFsaSgpIGluIG9yZGVyIHRvIGNvbnZlcnQgKHN0cnVjdCBuYW5k
X2NoaXAgKikKPiA+IHRvIChzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqKSBkaXJlY3RseS4gSXQg
aXMgbW9yZSB1c2VmdWwgdGhhbiB0aGUKPiA+IGN1cnJlbnQgbXRkX3RvX2RlbmFsaSgpLgo+ID4g
Cj4gPiBJIGNoYW5nZWQgc29tZSBoZWxwZXIgZnVuY3Rpb25zIHRvIHRha2UgKHN0cnVjdCBuYW5k
X2NoaXAgKikuIFRoaXMgd2lsbAo+ID4gYXZvaWQgcG9pbnRlciBjb252ZXJzaW9uIGJhY2sgYW5k
IGZvcnRoLCBhbmQgZWFzZSBmdXJ0aGVyIGRldmVsb3BtZW50Lgo+ID4gCj4gPiBTaWduZWQtb2Zm
LWJ5OiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgo+ID4g
LS0tCj4gPiAKPiA+IENoYW5nZXMgaW4gdjQ6IE5vbmUKPiA+IENoYW5nZXMgaW4gdjM6IE5vbmUK
PiA+IENoYW5nZXMgaW4gdjI6IE5vbmUKPiA+IAo+ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2Rl
bmFsaS5jIHwgNTcgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkKPiA+
IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2RlbmFsaS5jIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvZGVuYWxpLmMKPiA+IGluZGV4IDI0YWVhZmMuLjRhYzEzMTQgMTAwNjQ0
Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGkuYwo+ID4gKysrIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvZGVuYWxpLmMKPiA+IEBAIC00Nyw2ICs0NywxMSBAQCBzdGF0aWMgaW5s
aW5lIHN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvICptdGRfdG9fZGVuYWxpKHN0cnVjdCBtdGRfaW5m
byAqbXRkKQo+ID4gIAlyZXR1cm4gY29udGFpbmVyX29mKG10ZF90b19uYW5kKG10ZCksIHN0cnVj
dCBkZW5hbGlfbmFuZF9pbmZvLCBuYW5kKTsKPiA+ICB9Cj4gPiAgCj4gPiArc3RhdGljIHN0cnVj
dCBkZW5hbGlfbmFuZF9pbmZvICp0b19kZW5hbGkoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiA+
ICt7Cj4gPiArCXJldHVybiBjb250YWluZXJfb2YoY2hpcCwgc3RydWN0IGRlbmFsaV9uYW5kX2lu
Zm8sIG5hbmQpOwo+ID4gK30KPiA+ICsKPiA+ICAvKgo+ID4gICAqIERpcmVjdCBBZGRyZXNzaW5n
IC0gdGhlIHNsYXZlIGFkZHJlc3MgZm9ybXMgdGhlIGNvbnRyb2wgaW5mb3JtYXRpb24gKGNvbW1h
bmQKPiA+ICAgKiB0eXBlLCBiYW5rLCBibG9jaywgYW5kIHBhZ2UgYWRkcmVzcykuICBUaGUgc2xh
dmUgZGF0YSBpcyB0aGUgYWN0dWFsIGRhdGEgdG8KPiA+IEBAIC0yODIsMTIgKzI4NywxMiBAQCBz
dGF0aWMgdm9pZCBkZW5hbGlfY21kX2N0cmwoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgaW50IGRh
dCwgdW5zaWduZWQgaW50IGN0cmwpCj4gPiAgCWRlbmFsaS0+aG9zdF93cml0ZShkZW5hbGksIERF
TkFMSV9CQU5LKGRlbmFsaSkgfCB0eXBlLCBkYXQpOwo+ID4gIH0KPiA+ICAKPiA+IC1zdGF0aWMg
aW50IGRlbmFsaV9jaGVja19lcmFzZWRfcGFnZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwKPiA+IC0J
CQkJICAgIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIHVpbnQ4X3QgKmJ1ZiwKPiA+ICtzdGF0aWMg
aW50IGRlbmFsaV9jaGVja19lcmFzZWRfcGFnZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAo+ID4g
KwkJCQkgICAgc3RydWN0IGRlbmFsaV9uYW5kX2luZm8gKmRlbmFsaSwgdTggKmJ1ZiwgIAo+IAo+
IFlvdSBkb24ndCBuZWVkIHRvIHBhc3MgYm90aCBjaGlwIGFuZCBkZW5hbGksIGFzIG9uZSBjYW4g
YmUgZXh0cmFjdGVkCj4gZnJvbSB0aGUgb3RoZXIuCj4gCj4gPiAgCQkJCSAgICB1bnNpZ25lZCBs
b25nIHVuY29yX2VjY19mbGFncywKPiA+ICAJCQkJICAgIHVuc2lnbmVkIGludCBtYXhfYml0Zmxp
cHMpCj4gPiAgewo+ID4gLQlzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxpID0gbXRkX3Rv
X2RlbmFsaShtdGQpOwo+ID4gKwlzdHJ1Y3QgbXRkX2VjY19zdGF0cyAqZWNjX3N0YXRzID0gJm5h
bmRfdG9fbXRkKGNoaXApLT5lY2Nfc3RhdHM7Cj4gPiAgCXVpbnQ4X3QgKmVjY19jb2RlID0gY2hp
cC0+b29iX3BvaSArIGRlbmFsaS0+b29iX3NraXBfYnl0ZXM7Cj4gPiAgCWludCBlY2Nfc3RlcHMg
PSBjaGlwLT5lY2Muc3RlcHM7Cj4gPiAgCWludCBlY2Nfc2l6ZSA9IGNoaXAtPmVjYy5zaXplOwo+
ID4gQEAgLTMwMyw5ICszMDgsOSBAQCBzdGF0aWMgaW50IGRlbmFsaV9jaGVja19lcmFzZWRfcGFn
ZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwKPiA+ICAJCQkJCQkgIE5VTEwsIDAsCj4gPiAgCQkJCQkJ
ICBjaGlwLT5lY2Muc3RyZW5ndGgpOwo+ID4gIAkJaWYgKHN0YXQgPCAwKSB7Cj4gPiAtCQkJbXRk
LT5lY2Nfc3RhdHMuZmFpbGVkKys7Cj4gPiArCQkJZWNjX3N0YXRzLT5mYWlsZWQrKzsKPiA+ICAJ
CX0gZWxzZSB7Cj4gPiAtCQkJbXRkLT5lY2Nfc3RhdHMuY29ycmVjdGVkICs9IHN0YXQ7Cj4gPiAr
CQkJZWNjX3N0YXRzLT5jb3JyZWN0ZWQgKz0gc3RhdDsKPiA+ICAJCQltYXhfYml0ZmxpcHMgPSBt
YXhfdCh1bnNpZ25lZCBpbnQsIG1heF9iaXRmbGlwcywgc3RhdCk7Cj4gPiAgCQl9Cj4gPiAgCj4g
PiBAQCAtMzE2LDExICszMjEsMTEgQEAgc3RhdGljIGludCBkZW5hbGlfY2hlY2tfZXJhc2VkX3Bh
Z2Uoc3RydWN0IG10ZF9pbmZvICptdGQsCj4gPiAgCXJldHVybiBtYXhfYml0ZmxpcHM7Cj4gPiAg
fQo+ID4gIAo+ID4gLXN0YXRpYyBpbnQgZGVuYWxpX2h3X2VjY19maXh1cChzdHJ1Y3QgbXRkX2lu
Zm8gKm10ZCwKPiA+ICtzdGF0aWMgaW50IGRlbmFsaV9od19lY2NfZml4dXAoc3RydWN0IG5hbmRf
Y2hpcCAqY2hpcCwKPiA+ICAJCQkgICAgICAgc3RydWN0IGRlbmFsaV9uYW5kX2luZm8gKmRlbmFs
aSwgIAo+IAo+IERpdHRvLgo+IAoKSSBhbSBmaW5lIHdpdGggdGhlIHNlcmllcyBpbiBpdHMgY3Vy
cmVudCBzdGF0ZSwgcGxlYXNlIHN1Ym1pdCBhIHY1CndpdGggQm9yaXMgY29tbWVudCdzIGFkZHJl
c3NlZCBhbmQgSSdsbCBxdWV1ZSBpdCByaWdodCBhd2F5IHRvIG5leHQuCgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
