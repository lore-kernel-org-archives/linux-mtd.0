Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB38C3ABBC
	for <linux-mtd@archiver.kernel.org>; Mon, 12 May 2025 08:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MQeGp4T9/IKK9Hr3hjliqES/2xnlbh35mBKYylaJlos=; b=Md2Lze+OwFFE68
	aOwaH0Lt74to+onFXbAAxSlDXzUfuwI+pY+nfHKn8IHzz4PJL4fiuqKhZKNk4zciA+bFR8wFnDeC7
	LJsK8fHmYF3qRxj/NVYyeF0rWTrxJK1b3ZZyCo4XxR+u84k8Kkh9E1WRnDigC7C8AqjYHSRCHQl+c
	dXHWg6Pe97ITdDzFvLQRN2C8VD5OeS1Csvjor+zTcsvBdCjvHnxWN3i2tjPA1qnwWsN9R4JcAER3x
	/Elm3VrpkdsRiSzoAg1Qv0CWNJmRThM/IzZoTzLrJzgHkbu4pdE6zBCDBpf3jHCPi/AyXPhMWL5Wy
	sqtLqxPkz1g/Ws34kKZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOkz-00000008nZu-46bq;
	Mon, 12 May 2025 08:43:29 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOiZ-00000008mma-3jmx
	for linux-mtd@lists.infradead.org;
	Mon, 12 May 2025 08:41:01 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 20063A02DE;
	Mon, 12 May 2025 10:40:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=ImjZYltpC8UtJ1XqLatuQGpmKeR3ofzGZdgoV3xDUmY=; b=
	Zt//YHv+3bK9+LYybw6czZWiVcQqV43oz+ZFM3nNO9vxkGIfUL+J52lXLmz8++Fk
	hvkKyEjWgA42JgQOzYaISirzmStssm9AnglwWtKqLoqO51LKkt5/MXdxM17Y9xOz
	xPk8ewm7Bch7mK29VQxoIlV7vVrsHn40xIsAovhhrr+t3xWnsUQ/Vyjgg4grdBi8
	qu40vxaKmYMyYx85rJ8cwwZfQPmwFGpW/QULoDRZv8ITyIrJyrTTsT/2+Oa+deWW
	kF7KtNmf2FQbLEtWSvPx6CPw5Xa1pewOVm0IkEk+OIatMnMc23nS0sGQFlf0w6oW
	5kPhAqTIyDYczk+ZCivvOiL3/NmvaPXj/aBkUJtaOR3LyRchdJeiiedCT+iAu7XD
	rvhD+Jb3XO3zHdgodz9HF+ntp1ePXkEdjA1Lm1PXmu9I4I0qDJpZqL+AhhxhzORc
	6uvtPLYyz6mAieKXalW5p0xHEqOD5fcZe1IkJbYNgsFXATGOfcOI37mcnLgg2ujW
	bWDVzkeShjZWAPsNoH6LroiF7+JqC78wpPXSO4bDXKsU9Y4jJ5+Tz7wYkmIZmZut
	Snoy88TYtdkrB2ZuUtZf2kxlUj3QqAcnmI+m9Q5DQtXNQ8ZrsMK/wH2St4Lsilfc
	R/EaIY4afiBeeg7Bgh0vDPqwYDralcSJPgWXzGTIm2M=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v3] mtd: Verify written data in paranoid mode
Date: Mon, 12 May 2025 10:40:32 +0200
Message-ID: <20250512084033.69718-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1747039248;VERSION=7990;MC=3341281455;ID=271136;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94853617466
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_014100_388990_DFEDC963 
X-CRM114-Status: GOOD (  16.45  )
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

QWRkIE1URF9QQVJBTk9JRCBjb25maWcgb3B0aW9uIGZvciB2ZXJpZnlpbmcgYWxsIHdyaXR0ZW4g
ZGF0YSB0byBwcmV2ZW50CnNpbGVudCBiaXQgZXJyb3JzIGJlaW5nIHVuZGV0ZWN0ZWQsIGF0IHRo
ZSBjb3N0IG9mIHNvbWUgYmFuZHdpZHRoIG92ZXJoZWFkLgoKU2lnbmVkLW9mZi1ieTogQmVuY2Ug
Q3PDs2vDoXMgPGNzb2thcy5iZW5jZUBwcm9sYW4uaHU+Ci0tLQogZHJpdmVycy9tdGQvS2NvbmZp
ZyAgIHwgMTQgKysrKysrKysrKysrCiBkcml2ZXJzL210ZC9tdGRjb3JlLmMgfCA1MSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDYz
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
S2NvbmZpZyBiL2RyaXZlcnMvbXRkL0tjb25maWcKaW5kZXggNzk2YTJlY2NiZWYwLi5lNzVmNGE1
N2RmNmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL0tjb25maWcKKysrIGIvZHJpdmVycy9tdGQv
S2NvbmZpZwpAQCAtMjA2LDYgKzIwNiwyMCBAQCBjb25maWcgTVREX1BBUlRJVElPTkVEX01BU1RF
UgogCSAgdGhlIHBhcmVudCBvZiB0aGUgcGFydGl0aW9uIGRldmljZSBiZSB0aGUgbWFzdGVyIGRl
dmljZSwgcmF0aGVyIHRoYW4KIAkgIHdoYXQgbGllcyBiZWhpbmQgdGhlIG1hc3Rlci4KIAorY29u
ZmlnIE1URF9QQVJBTk9JRAorCWJvb2wgIlJlYWQgYmFjayB3cml0dGVuIGRhdGEgKHBhcmFub2lk
IG1vZGUpIgorCWhlbHAKKwkgIFRoaXMgb3B0aW9uIG1ha2VzIHRoZSBNVEQgY29yZSByZWFkIGJh
Y2sgYWxsIGRhdGEgb24gYSB3cml0ZSBhbmQKKwkgIHJlcG9ydCBhbiBlcnJvciBpZiBpdCBkb2Vz
bid0IG1hdGNoIHRoZSB3cml0dGVuIGRhdGEuIFRoaXMgY2FuCisJICBzYWZlZ3VhcmQgYWdhaW5z
dCBzaWxlbnQgYml0IGVycm9ycyByZXN1bHRpbmcgZnJvbSBhIGZhdWx0eSBGbGFzaCwKKwkgIGNv
bnRyb2xsZXIgb2RkaXRpZXMsIGJ1cyBub2lzZSBldGMuCisKKwkgIEl0IGlzIHVwIHRvIHRoZSBs
YXllciBhYm92ZSBNVEQgKGUuZy4gdGhlIGZpbGVzeXN0ZW0pIHRvIGhhbmRsZQorCSAgdGhpcyBj
b25kaXRpb24sIGZvciBleGFtcGxlIGJ5IGdvaW5nIHJlYWQtb25seSB0byBwcmV2ZW50IGZ1cnRo
ZXIKKwkgIGRhdGEgY29ycnVwdGlvbiwgb3IgdG8gbWFyayBhIGNlcnRhaW4gcmVnaW9uIG9mIEZs
YXNoIGFzIGJhZC4KKworCSAgSWYgeW91IGFyZSB1bnN1cmUsIHNlbGVjdCAnbicuCisKIHNvdXJj
ZSAiZHJpdmVycy9tdGQvY2hpcHMvS2NvbmZpZyIKIAogc291cmNlICJkcml2ZXJzL210ZC9tYXBz
L0tjb25maWciCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMgYi9kcml2ZXJzL210
ZC9tdGRjb3JlLmMKaW5kZXggNWJhOWE3NDFmNWFjLi4zZjk4NzRjZDQxMjYgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbXRkL210ZGNvcmUuYworKysgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKQEAgLTE3
NDUsOCArMTc0NSw4IEBAIGludCBtdGRfcmVhZF9vb2Ioc3RydWN0IG10ZF9pbmZvICptdGQsIGxv
ZmZfdCBmcm9tLCBzdHJ1Y3QgbXRkX29vYl9vcHMgKm9wcykKIH0KIEVYUE9SVF9TWU1CT0xfR1BM
KG10ZF9yZWFkX29vYik7CiAKLWludCBtdGRfd3JpdGVfb29iKHN0cnVjdCBtdGRfaW5mbyAqbXRk
LCBsb2ZmX3QgdG8sCi0JCQkJc3RydWN0IG10ZF9vb2Jfb3BzICpvcHMpCitzdGF0aWMgaW50IF9t
dGRfd3JpdGVfb29iKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3QgdG8sCisJCQkgIHN0cnVj
dCBtdGRfb29iX29wcyAqb3BzKQogewogCXN0cnVjdCBtdGRfaW5mbyAqbWFzdGVyID0gbXRkX2dl
dF9tYXN0ZXIobXRkKTsKIAlpbnQgcmV0OwpAQCAtMTc3MSw2ICsxNzcxLDUzIEBAIGludCBtdGRf
d3JpdGVfb29iKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3QgdG8sCiAKIAlyZXR1cm4gbXRk
X3dyaXRlX29vYl9zdGQobXRkLCB0bywgb3BzKTsKIH0KKworc3RhdGljIGludCBfbXRkX3Zlcmlm
eShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IHRvLCBzaXplX3QgbGVuLCBjb25zdCB1OCAq
YnVmKQoreworCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZtdGQtPmRldjsKKwl1X2NoYXIgKnZlcmlm
eV9idWY7CisJc2l6ZV90IHJfcmV0bGVuOworCWludCByZXQ7CisKKwl2ZXJpZnlfYnVmID0gZGV2
bV9rbWFsbG9jKGRldiwgbGVuLCBHRlBfS0VSTkVMKTsKKwlpZiAoIXZlcmlmeV9idWYpCisJCXJl
dHVybiAtRU5PTUVNOworCisJcmV0ID0gbXRkX3JlYWQobXRkLCB0bywgbGVuLCAmcl9yZXRsZW4s
IHZlcmlmeV9idWYpOworCWlmIChyZXQgPCAwKQorCQlnb3RvIGVycjsKKworCWlmIChsZW4gIT0g
cl9yZXRsZW4pIHsKKwkJLyogV2Ugc2hvdWxkbid0IHNlZSBzaG9ydCByZWFkcyAqLworCQlkZXZf
ZXJyKGRldiwgIlZlcmlmeSBmYWlsZWQsIHdyaXR0ZW4gJXpkIGJ1dCBvbmx5IHJlYWQgJXpkIiwK
KwkJCWxlbiwgcl9yZXRsZW4pOworCQlyZXQgPSAtRUlPOworCQlnb3RvIGVycjsKKwl9CisKKwlp
ZiAobWVtY21wKHZlcmlmeV9idWYsIGJ1ZiwgbGVuKSkgeworCQlkZXZfZXJyKGRldiwgIlZlcmlm
eSBmYWlsZWQsIGNvbXBhcmUgbWlzbWF0Y2ghIik7CisJCXJldCA9IC1FSU87CisJfQorCitlcnI6
CisJZGV2bV9rZnJlZShkZXYsIHZlcmlmeV9idWYpOworCXJldHVybiByZXQ7Cit9CisKK2ludCBt
dGRfd3JpdGVfb29iKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3QgdG8sCisJCSAgc3RydWN0
IG10ZF9vb2Jfb3BzICpvcHMpCit7CisJaW50IHJldCA9IF9tdGRfd3JpdGVfb29iKG10ZCwgdG8s
IG9wcyk7CisKKwlpZiAocmV0IDwgMCkKKwkJcmV0dXJuIHJldDsKKworCWlmIChJU19FTkFCTEVE
KENPTkZJR19NVERfUEFSQU5PSUQpKQorCQlyZXQgPSBfbXRkX3ZlcmlmeShtdGQsIHRvLCBvcHMt
PnJldGxlbiwgb3BzLT5kYXRidWYpOworCisJcmV0dXJuIHJldDsKK30KIEVYUE9SVF9TWU1CT0xf
R1BMKG10ZF93cml0ZV9vb2IpOwogCiAvKioKCmJhc2UtY29tbWl0OiBkNzZiYjFlYmI1NTg3ZjY2
YjBmOGI4MDk5YmZiYjQ0NzIyYmMwOGIzCi0tIAoyLjQzLjAKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
