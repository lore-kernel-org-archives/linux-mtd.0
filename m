Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5A1C48BC3
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Feb 2024 05:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5JFPiZbZPNzyv1LTCMk5RMc+nIL4W6li7FDNCkP+uK8=; b=Un01rK9hwhXJ3q
	fmcBwMoCJlZSequvs74fYgUTFTntf3Iae4AQlzvcpnIKuVJ/mWQPE9KQtNl6f4v/cUE1SIL9eO2S3
	Efc+xY8RdnSdTvMjbzvBq9K4ApyECVEPlsgJ7PGeigmM4VTC6xpV0b2ifTcRSD9dLf9EKyYsJxm8E
	+A/9wR3si+hfzLykVQ1CNKEtGCMMnqnr/BF0jBgCSpiaVzH/yyLppYkU+itmuYwudlGk9OO3kX90+
	DJxTRYJ4qiHLRrzjfFzMb53rNWlOjKL/otWiVGqoFddeG+dPD2wv92A1xWW9DHDMsbNKWxzJ3BxMj
	cygQ/rfL83CKelE1uang==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcfPG-0000000HFM9-16bp;
	Wed, 21 Feb 2024 05:44:34 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcfPD-0000000HFKR-1dGX
	for linux-mtd@lists.infradead.org;
	Wed, 21 Feb 2024 05:44:33 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id AF02468D07; Wed, 21 Feb 2024 06:44:24 +0100 (CET)
Date: Wed, 21 Feb 2024 06:44:24 +0100
From: Christoph Hellwig <hch@lst.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Justin Sanders <justin@coraid.com>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Geoff Levand <geoff@infradead.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>, Ming Lei <ming.lei@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	ceph-devel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
Message-ID: <20240221054424.GA12033@lst.de>
References: <20240215070300.2200308-1-hch@lst.de> <20240215070300.2200308-18-hch@lst.de> <CAMuHMdWV4nWQHUpBKM2gHWeH9j9c0Di4bhg+F4-SAPEAmZuNSA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdWV4nWQHUpBKM2gHWeH9j9c0Di4bhg+F4-SAPEAmZuNSA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_214431_740386_27C953EF 
X-CRM114-Status: GOOD (  28.39  )
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

T24gVHVlLCBGZWIgMjAsIDIwMjQgYXQgMTE6MDE6MDVQTSArMDEwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IEhpIENocmlzdG9waCwKPiAKPiBPbiBUaHUsIEZlYiAxNSwgMjAyNCBhdCA5
OjE24oCvQU0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+IHdyb3RlOgo+ID4gUGFzcyB0
aGUgcXVldWUgbGltaXQgc2V0IGF0IGluaXRpYWxpemF0aW9uIHRpbWUgZGlyZWN0bHkgdG8KPiA+
IGJsa19tcV9hbGxvY19kaXNrIGluc3RlYWQgb2YgdXBkYXRpbmcgaXQgcmlnaHQgYWZ0ZXIgdGhl
IGFsbG9jYXRpb24uCj4gPgo+ID4gVGhpcyByZXF1aXJlcyByZWZhY3RvcmluZyB0aGUgY29kZSBh
IGJpdCBzbyB0aGF0IHdoYXQgd2FzIG1tY19zZXR1cF9xdWV1ZQo+ID4gYmVmb3JlIGFsc28gYWxs
b2NhdGVzIHRoZSBnZW5kaXNrIG5vdyBhbmQgYWN0dWFsbHkgc2V0cyBhbGwgbGltaXRzLgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IAo+IFRo
YW5rcyBmb3IgeW91ciBwYXRjaCwgd2hpY2ggaXMgbm93IGNvbW1pdCA2MTZmODc2NjE3OTI3NzMy
ICgibW1jOiBwYXNzCj4gcXVldWVfbGltaXRzIHRvIGJsa19tcV9hbGxvY19kaXNrIikgaW4gYmxv
Y2svZm9yLW5leHQuCj4gCj4gSSBoYXZlIGJpc2VjdGVkIHRoZSBmb2xsb3dpbmcgZmFpbHVyZSBv
biBXaGl0ZS1IYXdrIChhbHNvIHNlZW4gb24KPiBvdGhlciBSLUNhciBHZW4zLzQgc3lzdGVtcykg
dG8gdGhpcyBjb21taXQ6Cj4gCj4gICAgIHJlbmVzYXNfc2RoaV9pbnRlcm5hbF9kbWFjIGVlMTQw
MDAwLm1tYzogbW1jMCBiYXNlIGF0Cj4gMHgwMDAwMDAwMGVlMTQwMDAwLCBtYXggY2xvY2sgcmF0
ZSAyMDAgTUh6Cj4gICAgIG1tYzA6IG5ldyBIUzQwMCBNTUMgY2FyZCBhdCBhZGRyZXNzIDAwMDEK
PiAgICAgLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4gICAgIFdBUk5JTkc6
IENQVTogMSBQSUQ6IDIwIGF0IGJsb2NrL2Jsay1zZXR0aW5ncy5jOjIwMgo+IGJsa192YWxpZGF0
ZV9saW1pdHMrMHgxMmMvMHgxZTAKClRoaXMgaXM6CgoJaWYgKGxpbS0+dmlydF9ib3VuZGFyeV9t
YXNrKSB7CgkJaWYgKFdBUk5fT05fT05DRShsaW0tPm1heF9zZWdtZW50X3NpemUgJiYKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgbGltLT5tYXhfc2VnbWVudF9zaXplICE9IFVJTlRf
TUFYKSkKCQkJcmV0dXJuIC1FSU5WQUw7CgpzbyB3ZSBlbmQgdXAgaGVyZSB3aXRoIGJvdGggYSB2
aXJ0X2JvdW5kYXJ5X21hc2sgYW5kIGEKbWF4X3NlZ21lbnRfc2l6ZSBzZXQsIHdoaWNoIGlzIHJh
dGhlciBib2d1cy4gIEkgdGhpbmsgdGhlCnByb2JsZW0gaXMgdGhlIG9yZGVyIG9mIGNoZWNrIGlu
IHRoZSBjb3JlIGJsa192YWxpZGF0ZV9saW1pdHMKdGhhdCBhcnRpZmljaWFsbHkgY2F1c2VzIHRo
aXMuICBDYW4geW91IHRyeSB0aGlzIHBhdGNoPwoKZGlmZiAtLWdpdCBhL2Jsb2NrL2Jsay1zZXR0
aW5ncy5jIGIvYmxvY2svYmxrLXNldHRpbmdzLmMKaW5kZXggYzQ0MDZhYWNjMGVmYzYuLjIxMjBi
NmY5ZmVmOGVhIDEwMDY0NAotLS0gYS9ibG9jay9ibGstc2V0dGluZ3MuYworKysgYi9ibG9jay9i
bGstc2V0dGluZ3MuYwpAQCAtMTgyLDE2ICsxODIsNiBAQCBzdGF0aWMgaW50IGJsa192YWxpZGF0
ZV9saW1pdHMoc3RydWN0IHF1ZXVlX2xpbWl0cyAqbGltKQogCWlmIChXQVJOX09OX09OQ0UobGlt
LT5zZWdfYm91bmRhcnlfbWFzayA8IFBBR0VfU0laRSAtIDEpKQogCQlyZXR1cm4gLUVJTlZBTDsK
IAotCS8qCi0JICogVGhlIG1heGltdW0gc2VnbWVudCBzaXplIGhhcyBhbiBvZGQgaGlzdG9yaWMg
NjRrIGRlZmF1bHQgdGhhdAotCSAqIGRyaXZlcnMgcHJvYmFibHkgc2hvdWxkIG92ZXJyaWRlLiAg
SnVzdCBsaWtlIHRoZSBJL08gc2l6ZSB3ZQotCSAqIHJlcXVpcmUgZHJpdmVycyB0byBhdCBsZWFz
dCBoYW5kbGUgYSBmdWxsIHBhZ2UgcGVyIHNlZ21lbnQuCi0JICovCi0JaWYgKCFsaW0tPm1heF9z
ZWdtZW50X3NpemUpCi0JCWxpbS0+bWF4X3NlZ21lbnRfc2l6ZSA9IEJMS19NQVhfU0VHTUVOVF9T
SVpFOwotCWlmIChXQVJOX09OX09OQ0UobGltLT5tYXhfc2VnbWVudF9zaXplIDwgUEFHRV9TSVpF
KSkKLQkJcmV0dXJuIC1FSU5WQUw7Ci0KIAkvKgogCSAqIERldmljZXMgdGhhdCByZXF1aXJlIGEg
dmlydHVhbCBib3VuZGFyeSBkbyBub3Qgc3VwcG9ydCBzY2F0dGVyL2dhdGhlcgogCSAqIEkvTyBu
YXRpdmVseSwgYnV0IGluc3RlYWQgcmVxdWlyZSBhIGRlc2NyaXB0b3IgbGlzdCBlbnRyeSBmb3Ig
ZWFjaApAQCAtMjAzLDYgKzE5MywxNiBAQCBzdGF0aWMgaW50IGJsa192YWxpZGF0ZV9saW1pdHMo
c3RydWN0IHF1ZXVlX2xpbWl0cyAqbGltKQogCQkJCSBsaW0tPm1heF9zZWdtZW50X3NpemUgIT0g
VUlOVF9NQVgpKQogCQkJcmV0dXJuIC1FSU5WQUw7CiAJCWxpbS0+bWF4X3NlZ21lbnRfc2l6ZSA9
IFVJTlRfTUFYOworCX0gZWxzZSB7CisJCS8qCisJCSAqIFRoZSBtYXhpbXVtIHNlZ21lbnQgc2l6
ZSBoYXMgYW4gb2RkIGhpc3RvcmljIDY0ayBkZWZhdWx0IHRoYXQKKwkJICogZHJpdmVycyBwcm9i
YWJseSBzaG91bGQgb3ZlcnJpZGUuICBKdXN0IGxpa2UgdGhlIEkvTyBzaXplIHdlCisJCSAqIHJl
cXVpcmUgZHJpdmVycyB0byBhdCBsZWFzdCBoYW5kbGUgYSBmdWxsIHBhZ2UgcGVyIHNlZ21lbnQu
CisJCSAqLworCQlpZiAoIWxpbS0+bWF4X3NlZ21lbnRfc2l6ZSkKKwkJCWxpbS0+bWF4X3NlZ21l
bnRfc2l6ZSA9IEJMS19NQVhfU0VHTUVOVF9TSVpFOworCQlpZiAoV0FSTl9PTl9PTkNFKGxpbS0+
bWF4X3NlZ21lbnRfc2l6ZSA8IFBBR0VfU0laRSkpCisJCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAK
IAkvKgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
