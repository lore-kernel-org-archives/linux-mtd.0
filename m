Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C969C369BA
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Apr 2025 18:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6aH1ClfEbaAI4wN4zq8ruDtmKCObynDVc+QEbUHpw/c=; b=E97jvZEJxB+nDx
	d65RhvYkfpgpuiA3EacNnrjAsoAfmR5olRk4/s8WF7ntfC3RpkaSOLzRFgBTiqIHbtnTTEZQ3qw8X
	XQSRmpLpUNnQarkxSDXDz3Lg4OWuPSmv+CjW9xc+9z7AY4JWdqPzJK5SmteiBUPwgfpOZ1UXQ2wAY
	7hk18KI94B1kgibZLckvgnFpx9xhsTTmOfXS9qHd2bwFfsnDIfTRQLcmNzxFem5IxBMu8dSbACL10
	QA9POpM+fS9Cn6I78EnDM0o7ftAIovrIhW3CPrkK4u+HlqLRbCAh98tTVs36ucXEWY3XDyU27bluE
	3XE/jqzHF6PBwYJXVjqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4khf-00000006fsj-124Q;
	Tue, 15 Apr 2025 18:08:11 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4kec-00000006fSv-1Gsr
	for linux-mtd@lists.infradead.org;
	Tue, 15 Apr 2025 18:05:04 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id BD2EEA033A;
	Tue, 15 Apr 2025 20:04:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=sPS8nj2wBTS7IxcXsWDBnWC5IdTmxtmClDTDfzz4lXs=; b=
	jhjgINil9atXgMLsXfj/xug9qfrTEqP4k8IuuvkmvwH6R03Hc8XLh0p1BAIMjQ/l
	Ey2x2bH8GAkvakXDj7Q69lNuYI04D+V1HB36pmzyFY6MMHVcllJkiw+ppwBzpA2A
	JmOuWYgSj99eIk7n26pE8KUDR+Jhz2qbw4/K2NFf2r7nErYLlARbx3A5A0n+Akh6
	mFrcDGuCf3VZqfDUaYR5h62zl00Ef49r/JuMSy7n46LDXj4rU+mu0exwwoyPSFlz
	oqEMc78RE8N7e4QrGZ7Qsm/JOSmXT5mb6F0F1EXT3ET+g33lM+YuDXZX/eLiHjDT
	D5+MBOW+gh9Y2DylR9biM+dIZNyGtjZ2cc9Z1ZlDgYtMUUbFsIoqYYmOp0wWM4mw
	TlDj92NF63S+anebINtZUpexrGB9O8clFfqQws8viNtbgspdfok1OdXifYXoPn9e
	Zg5xwf7W5rPWKoY2VVgHu1or7cU20RcK887/TI80nlX9nFW2gtPxWVcUUy3GimDc
	BcmHOcxSpG2yesN49mfWLq90YgrHZu2FOglM1ItPS1HcAljgUG2VwQGSrBSTq3MA
	NpAUWvhrGNDDcZJZAaNitflvdRwJ6b694dyEpgFLskzPsRjQuYGTNQUDZHk+vaFF
	t5l8oFJ97Wpfo7c3aZidUBqRgigbOVKEbWDMGapnK9w=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>,
	=?UTF-8?q?Szentendrei=2C=20Tam=C3=A1s?= <szentendrei.tamas@prolan.hu>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] spi-nor: Verify written data in paranoid mode
Date: Tue, 15 Apr 2025 20:04:32 +0200
Message-ID: <20250415180434.513405-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1744740288;VERSION=7989;MC=1442698083;ID=77153;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94853647662
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_110502_813084_D861E0B4 
X-CRM114-Status: GOOD (  13.37  )
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

RnJvbTogQ3PDs2vDoXMsIEJlbmNlIDxjc29rYXMuYmVuY2VAcHJvbGFuLmh1PgoKQWRkIE1URF9T
UElfTk9SX1BBUkFOT0lEIGNvbmZpZyBvcHRpb24gZm9yIHZlcmlmeWluZyBhbGwgd3JpdHRlbiBk
YXRhIHRvCnByZXZlbnQgc2lsZW50IGJpdCBlcnJvcnMgdG8gYmUgdW5kZXRlY3RlZCwgYXQgdGhl
IGNvc3Qgb2YgaGFsdmluZyBTUEkKYmFuZHdpZHRoLgoKQ28tZGV2ZWxvcGVkLWJ5OiBTemVudGVu
ZHJlaSwgVGFtw6FzIDxzemVudGVuZHJlaS50YW1hc0Bwcm9sYW4uaHU+ClNpZ25lZC1vZmYtYnk6
IFN6ZW50ZW5kcmVpLCBUYW3DoXMgPHN6ZW50ZW5kcmVpLnRhbWFzQHByb2xhbi5odT4KU2lnbmVk
LW9mZi1ieTogQ3PDs2vDoXMsIEJlbmNlIDxjc29rYXMuYmVuY2VAcHJvbGFuLmh1PgotLS0KIGRy
aXZlcnMvbXRkL3NwaS1ub3IvS2NvbmZpZyB8IDEwICsrKysrKysrKysKIGRyaXZlcnMvbXRkL3Nw
aS1ub3IvY29yZS5jICB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBm
aWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
c3BpLW5vci9LY29uZmlnIGIvZHJpdmVycy9tdGQvc3BpLW5vci9LY29uZmlnCmluZGV4IDI0Y2Qy
NWRlMmI4Yi4uNDI1ZWE5YTIyNDI0IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL0tj
b25maWcKKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9LY29uZmlnCkBAIC02OCw2ICs2OCwxNiBA
QCBjb25maWcgTVREX1NQSV9OT1JfU1dQX0tFRVAKIAogZW5kY2hvaWNlCiAKK2NvbmZpZyBNVERf
U1BJX05PUl9QQVJBTk9JRAorCWJvb2wgIlJlYWQgYmFjayB3cml0dGVuIGRhdGEgKHBhcmFub2lk
IG1vZGUpIgorCWhlbHAKKwkgIFRoaXMgb3B0aW9uIG1ha2VzIHRoZSBTUEkgTk9SIGNvcmUgcmVh
ZCBiYWNrIGFsbCBkYXRhIG9uIGEgd3JpdGUKKwkgIGFuZCByZXBvcnQgYW4gZXJyb3IgaWYgaXQg
ZG9lc24ndCBtYXRjaCB0aGUgd3JpdHRlbiBkYXRhLiBUaGlzIGNhbgorCSAgc2FmZWd1YXJkIGFn
YWluc3Qgc2lsZW50IGJpdCBlcnJvcnMgcmVzdWx0aW5nIGZyb20gYSBmYXVsdHkgRmxhc2gsCisJ
ICBjb250cm9sbGVyIG9kZGl0aWVzLCBidXMgbm9pc2UgZXRjLgorCisJICBJZiB5b3UgYXJlIHVu
c3VyZSwgc2VsZWN0ICduJy4KKwogc291cmNlICJkcml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xs
ZXJzL0tjb25maWciCiAKIGVuZGlmICMgTVREX1NQSV9OT1IKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL3NwaS1ub3IvY29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKaW5kZXggYWM0
Yjk2MDEwMWNjLi5jYTA1YTZlYzhhZmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
Y29yZS5jCisrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCkBAIC0yMDYzLDYgKzIwNjMs
NyBAQCBzdGF0aWMgaW50IHNwaV9ub3Jfd3JpdGUoc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZf
dCB0bywgc2l6ZV90IGxlbiwKIAlzaXplX3QgKnJldGxlbiwgY29uc3QgdV9jaGFyICpidWYpCiB7
CiAJc3RydWN0IHNwaV9ub3IgKm5vciA9IG10ZF90b19zcGlfbm9yKG10ZCk7CisJdV9jaGFyICp2
ZXJpZnlfYnVmID0gTlVMTDsKIAlzaXplX3QgaTsKIAlzc2l6ZV90IHJldDsKIAl1MzIgcGFnZV9z
aXplID0gbm9yLT5wYXJhbXMtPnBhZ2Vfc2l6ZTsKQEAgLTIwNzMsNiArMjA3NCwxNCBAQCBzdGF0
aWMgaW50IHNwaV9ub3Jfd3JpdGUoc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCB0bywgc2l6
ZV90IGxlbiwKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCisjaWYgSVNfRU5BQkxFRChDT05G
SUdfTVREX1NQSV9OT1JfUEFSQU5PSUQpCisJdmVyaWZ5X2J1ZiA9IGRldm1fa21hbGxvYyhub3It
PmRldiwgcGFnZV9zaXplLCBHRlBfS0VSTkVMKTsKKwlpZiAoIXZlcmlmeV9idWYpIHsKKwkJcmV0
ID0gLUVOT01FTTsKKwkJZ290byB3cml0ZV9lcnI7CisJfQorI2VuZGlmCisKIAlmb3IgKGkgPSAw
OyBpIDwgbGVuOyApIHsKIAkJc3NpemVfdCB3cml0dGVuOwogCQlsb2ZmX3QgYWRkciA9IHRvICsg
aTsKQEAgLTIwOTksMTEgKzIxMDgsMzUgQEAgc3RhdGljIGludCBzcGlfbm9yX3dyaXRlKHN0cnVj
dCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3QgdG8sIHNpemVfdCBsZW4sCiAJCXJldCA9IHNwaV9ub3Jf
d2FpdF90aWxsX3JlYWR5KG5vcik7CiAJCWlmIChyZXQpCiAJCQlnb3RvIHdyaXRlX2VycjsKKwor
I2lmIElTX0VOQUJMRUQoQ09ORklHX01URF9TUElfTk9SX1BBUkFOT0lEKQorCQkvKiByZWFkIGJh
Y2sgdG8gbWFrZSBzdXJlIGl0J3MgY29ycmVjdCAqLworCQlyZXQgPSBzcGlfbm9yX3JlYWRfZGF0
YShub3IsIGFkZHIsIHdyaXR0ZW4sIHZlcmlmeV9idWYpOworCQlpZiAocmV0IDwgMCkKKwkJCWdv
dG8gd3JpdGVfZXJyOworCQlpZiAocmV0ICE9IHdyaXR0ZW4pIHsKKwkJCS8qIFdlIHNob3VsZG4n
dCBzZWUgc2hvcnQgcmVhZHMgKi8KKwkJCWRldl9lcnIobm9yLT5kZXYsICJWZXJpZnkgZmFpbGVk
LCB3cml0dGVuICV6ZCBidXQgb25seSByZWFkICV6ZCIsCisJCQkJd3JpdHRlbiwgcmV0KTsKKwkJ
CXJldCA9IC1FSU87CisJCQlnb3RvIHdyaXRlX2VycjsKKwkJfQorCisJCWlmIChtZW1jbXAodmVy
aWZ5X2J1ZiwgYnVmICsgaSwgd3JpdHRlbikpIHsKKwkJCWRldl9lcnIobm9yLT5kZXYsICJWZXJp
ZnkgZmFpbGVkLCBjb21wYXJlIG1pc21hdGNoISIpOworCQkJcmV0ID0gLUVJTzsKKwkJCWdvdG8g
d3JpdGVfZXJyOworCQl9CisjZW5kaWYKKworCQlyZXQgPSAwOworCiAJCSpyZXRsZW4gKz0gd3Jp
dHRlbjsKIAkJaSArPSB3cml0dGVuOwogCX0KIAogd3JpdGVfZXJyOgorCWRldm1fa2ZyZWUobm9y
LT5kZXYsIHZlcmlmeV9idWYpOwogCXNwaV9ub3JfdW5sb2NrX2FuZF91bnByZXBfcGUobm9yLCB0
bywgbGVuKTsKIAogCXJldHVybiByZXQ7CgpiYXNlLWNvbW1pdDogODM0YTRhNjg5Njk5MDkwYTQw
NmQxNjYyYjAzYWZmYThiMTU1ZDAyNQotLSAKMi40OS4wCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
