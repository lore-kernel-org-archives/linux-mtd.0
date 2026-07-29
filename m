Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E15C53219
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jul 2026 08:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B9shn154+FG3Da11+GUhahBiG7RRjjv2MDnHOEfGB2o=; b=vD5afzjbnA0Npx
	xL4lZa9rk80tUTuVRBHwiP75rImtw8+HWiVx25GqwVWesRaH9HarXJZV1pB1PGhQBsblftDg/t8ku
	UHfFoeLH5Beyc7IE98gMuhYK5jE5TsV/eIefRDscX6cuNzeRhBA5uORiNB85v8ogQOfmz8+ixda6R
	lceGeaINBjGbDGpZ+AOAnBW7v9HgZg2U1mmF0hDj+vwZf1yn0cFbNH/DTIGVqXHO/Vxhf3KsMlKt9
	DmMKIUr3rkc3qs+E7xGbs7rIXwfMBtCQ2yltjkd1R5YQaAKfiFVUzXt0Wmg9hlzezoxmyWMsUnBGA
	WzTvCJIuyIXKnQ1j2J8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozIU-00000007CGf-3gXz;
	Wed, 29 Jul 2026 08:05:51 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozIR-00000007CEi-3iUJ
	for linux-mtd@lists.infradead.org;
	Wed, 29 Jul 2026 08:05:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2DD541A12EE;
	Wed, 29 Jul 2026 08:05:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDDB36039A;
	Wed, 29 Jul 2026 08:05:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6731D11C14A9A;
	Wed, 29 Jul 2026 10:05:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785312340; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2lOcs+UTw4dmBloNALI7qAVSlEXtyPQR37rH78D+i/o=;
	b=bVqCxwN9tmkJZHooqpLflcnipllDTeApHDS43Wkq+JUrUrmHB/HNCQCE2xxH5DADd3i8HM
	hZVA1yRYWaOXJbHVEJ2IR1rBBt6AiQLhy5UsKbEXE8Z/46D6VvGrxDMPpN6PVOCbGE2+U5
	yux3fRBm5zIpf3jFTjbqZ2Je9KPoLe/f5XNg5G4luFUTfyV7398WnCLA19Fr1ahpEWnXL2
	0LwRYpirYPLTESRKVq4AL882zx+tX5KfDsqGme9qulBjS0PAOc/h0ODF62KhUoRIIPWpxj
	ubP6nKLSiWgYhw2v0wMjW5DACMWWLTaMqyvWUe8OytndfIaA2wpxQrqBkeXWlw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: han.xu@oss.nxp.com
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  imx@lists.linux.dev,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: add debugfs entry for BCH geometry
In-Reply-To: <20260727-nand_debugfs-v1-1-7cba1ceab5ee@nxp.com> (han xu's
	message of "Mon, 27 Jul 2026 16:09:08 -0500")
References: <20260727-nand_debugfs-v1-1-7cba1ceab5ee@nxp.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 29 Jul 2026 10:05:36 +0200
Message-ID: <87jyqenru7.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_010548_369886_955AB6DA 
X-CRM114-Status: GOOD (  19.82  )
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

SGkgSGFuLAoKT24gMjcvMDcvMjAyNiBhdCAxNjowOTowOCAtMDUsIGhhbi54dUBvc3MubnhwLmNv
bSB3cm90ZToKCj4gRnJvbTogSGFuIFh1IDxoYW4ueHVAbnhwLmNvbT4KPgo+IEV4cG9ydCB0aGUg
QkNIIGdlb21ldHJ5IHBhcmFtZXRlcnMgdmlhIGRlYnVnZnMgdG8gYWlkIGRlYnVnZ2luZyBhbmQK
PiBwcm92aWRlIHRoZSBuZWNlc3NhcnkgaW5mb3JtYXRpb24gZm9yIGxlZ2FjeSBrb2JzLW5nIHRv
b2wuIFRoZSBkZWJ1Z2ZzCj4gZGlyZWN0b3J5ICJncG1pLW5hbmQiIGlzIGNyZWF0ZWQgdW5kZXIg
dGhlIHJvb3QgZGVidWdmcyB0cmVlLCBleHBvc2luZzoKPgo+IGJjaF9nZW9tZXRyeSAgLSBibG9i
IGNvbnRhaW5pbmcgdGhlIHN0cnVjdCBiY2hfZ2VvbWV0cnkgZmllbGRzCj4gcmF3X21vZGUgICAg
ICAtIGZsYWcgaW5kaWNhdGluZyByYXcgbW9kZSBzdGF0dXMKPgo+IFRoZSBpbXBsZW1lbnRhdGlv
biBpcyBndWFyZGVkIHdpdGggI2lmZGVmIENPTkZJR19ERUJVR19GUyB0byBhdm9pZAo+IGJ1aWxk
IGZhaWx1cmVzIHdoZW4gZGVidWdmcyBpcyBkaXNhYmxlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEhh
biBYdSA8aGFuLnh1QG54cC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWkt
bmFuZC9ncG1pLW5hbmQuYyB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWkt
bmFuZC9ncG1pLW5hbmQuYwo+IGluZGV4IGMxZjc2NmNiMjI1YWEuLjNjZWI4ZGY3ZjhmOTMgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5jCj4g
KysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5jCj4gQEAgLTcs
NiArNyw3IEBACj4gICAqLwo+ICAjaW5jbHVkZSA8bGludXgvY2xlYW51cC5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvY2xrLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9kZWJ1Z2ZzLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9kZWxheS5oPgo+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ICAjaW5jbHVkZSA8
bGludXgvc2NoZWQvdGFza19zdGFjay5oPgo+IEBAIC03MzIsNiArNzMzLDI2IEBAIHN0YXRpYyBp
bnQgY29tbW9uX25mY19zZXRfZ2VvbWV0cnkoc3RydWN0IGdwbWlfbmFuZF9kYXRhICp0aGlzKQo+
ICAJcmV0dXJuIGVycjsKPiAgfQo+ICAKPiArI2lmZGVmIENPTkZJR19ERUJVR19GUwo+ICtzdGF0
aWMgc3RydWN0IGRlYnVnZnNfYmxvYl93cmFwcGVyIGRiZ19iY2hfZ2VvOwoKV2h5IGRvIHlvdSB1
c2UgYSBzdGF0aWMgdmFyaWFibGUgZm9yIHRoYXQ/IFRoaXMgc2hvdWxkIGJlIGR5bmFtaWNhbGx5
CmFsbG9jYXRlZCBvdGhlcndpc2UgaWYgeW91IGV2ZXIgaGF2ZSBtb3JlIHRoYW4gb25lIGRldmlj
ZSB5b3UnbGwgaGF2ZQpzdHJhbmdlIHJlc3VsdHMuCgo+ICtzdGF0aWMgdm9pZCBiY2hfY3JlYXRl
X2RlYnVnZnMoc3RydWN0IGdwbWlfbmFuZF9kYXRhICp0aGlzKQo+ICt7Cj4gKwlzdHJ1Y3QgYmNo
X2dlb21ldHJ5ICpiY2hfZ2VvID0gJnRoaXMtPmJjaF9nZW9tZXRyeTsKPiArCXN0cnVjdCBkZW50
cnkgKmRiZ19yb290Owo+ICsKPiArCWRiZ19yb290ID0gZGVidWdmc19jcmVhdGVfZGlyKCJncG1p
LW5hbmQiLCBOVUxMKTsKPiArCWRiZ19iY2hfZ2VvLmRhdGEgPSAodm9pZCAqKWJjaF9nZW87Cj4g
KwlkYmdfYmNoX2dlby5zaXplID0gc2l6ZW9mKHN0cnVjdCBiY2hfZ2VvbWV0cnkpOwo+ICsJZGVi
dWdmc19jcmVhdGVfYmxvYigiYmNoX2dlb21ldHJ5IiwgMDQ0NCwgZGJnX3Jvb3QsICZkYmdfYmNo
X2dlbyk7Cj4gKwkvKiBjcmVhdGUgcmF3IG1vZGUgZmxhZyAqLwo+ICsJZGVidWdmc19jcmVhdGVf
ZmlsZV9mdWxsKCJyYXdfbW9kZSIsIDA0NDQsIGRiZ19yb290LCBOVUxMLCBOVUxMLAo+IE5VTEwp
OwoKSSBhbSBub3Qgc3VyZSBhYm91dCB0aGUgX2Z1bGwgc3VmZml4LCBidWcgZGVidWZzX2NyZWF0
ZV9maWxlKCkgaXMgZW5vdWdoCmhlcmUsIHByb3ZpZGVkIHRoYXQgeW91IGdpdmUgYSB0YW5naWJs
ZSB2YXJpYWJsZSB0byBleHBvc2UuCgo+ICt9Cj4gKyNlbHNlCj4gK3N0YXRpYyB2b2lkIGJjaF9j
cmVhdGVfZGVidWdmcyhzdHJ1Y3QgZ3BtaV9uYW5kX2RhdGEgKnRoaXMpCj4gK3sKPiArfQo+ICsj
ZW5kaWYgLyogQ09ORklHX0RFQlVHX0ZTICovCj4gKwo+ICAvKiBDb25maWd1cmVzIHRoZSBnZW9t
ZXRyeSBmb3IgQkNILiAgKi8KPiAgc3RhdGljIGludCBiY2hfc2V0X2dlb21ldHJ5KHN0cnVjdCBn
cG1pX25hbmRfZGF0YSAqdGhpcykKPiAgewo+IEBAIC0yMjgyLDYgKzIzMDMsOSBAQCBzdGF0aWMg
aW50IGdwbWlfaW5pdF9sYXN0KHN0cnVjdCBncG1pX25hbmRfZGF0YSAqdGhpcykKPiAgCWlmIChy
ZXQpCj4gIAkJcmV0dXJuIHJldDsKPiAgCj4gKwkvKiBzYXZlIEJDSCBnZW9tZXRyeSB0byBkZWJ1
Z2ZzIGlmIENPTkZJR19ERUJVR19GUyBpcyBlbmFibGVkICovCj4gKwliY2hfY3JlYXRlX2RlYnVn
ZnModGhpcyk7CgpZb3UgbmVlZCB0byBjYWxsIGRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2ZSgpIGlu
IHRoZSByZW1vdmFsIHBhdGguCgo+ICsKPiAgCS8qIEluaXQgdGhlIG5hbmRfZWNjX2N0cmx7fSAq
Lwo+ICAJZWNjLT5yZWFkX3BhZ2UJPSBncG1pX2VjY19yZWFkX3BhZ2U7Cj4gIAllY2MtPndyaXRl
X3BhZ2UJPSBncG1pX2VjY193cml0ZV9wYWdlOwo+Cj4gLS0tCj4gYmFzZS1jb21taXQ6IGY5N2Jk
YzhlYzFkYzdiMzM3ODFhNzAyZWViYTU1MzI2YzIwNmJlNTYKPiBjaGFuZ2UtaWQ6IDIwMjYwNzI3
LW5hbmRfZGVidWdmcy03NGQ2ZDZiYTUyZGYKPgo+IEJlc3QgcmVnYXJkcywKClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
