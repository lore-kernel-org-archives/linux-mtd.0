Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C66EC54E4A
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 07:58:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3C0C20643
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 07:58:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oiOMjIpe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jboMYWLV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3C0C20643
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WNhNx5WvAVkoLEvtwsDVQg/cxKtt1a0yvloJu11doik=; b=oiOMjIpeBEjrSZ
	TJqP3iOJI4+n/fAkktTtHuUQS8J24f7m/jKlDAcQKLSGo2nSaog0vJRQiqnE5NVefVDUBqXs0/yKg
	XxNZ10axPykfjjGRnwYOXWcbSeYb+aTgS9QYfbRJozuWrCirp1ohinQle5hvmtvJOyUDU+3Y8xaNh
	PjwTr3og9RpxhfT4eY79L8byv6avx34obkPX0G5nCdVIfTlsf2r58I3l9vWpNsBvt8dCmZt/ge/zn
	EMuKT0V8bablvpVrehpXHHddYB/FOs0S+KTZKkLSa4W4EbHxkthEuhxeAY3usZJxCQFapQruV5a7B
	qtJPA7E7ooIustecaU3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYPni-0008Qs-CG; Tue, 12 May 2020 07:58:06 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYPnJ-0007m0-SZ
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 07:57:43 +0000
Received: by mail-wm1-x344.google.com with SMTP id d207so5754551wmd.0
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2020 00:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tFcfq1Co9SytjH3sVz+L8DNsAe/xBUib75WR/Wft0yA=;
 b=jboMYWLVIcKnSUU1lJdYaZxv10npVgcGjiRko0heKTBbyZwALuh7aNckSBFb9pQ6Qj
 OzbRt8OvRcEjSV+iaALVoYUCch4Y/DVgfbF2Kxd0CK1swO00+poureihDJa/C2nAEYAF
 AZf+P1JXBsn1ivpGU7M2DMtnjz9gkFZNozDkfJTS4HAHdwRz6FHr9/hP0E9IWyWJ7LCO
 WWzrICbJHuDGRSrEr3wNNhv59Hgtutqav78MN2zDvo2G8RErxb6bQfHzNuSILOINqwO6
 7PJevt0JwnWoPz10Q+QVQOBIF/5erDihYrnF3nws0BDS8DjpvDoC2j/aRI38vBsaFonm
 3Abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tFcfq1Co9SytjH3sVz+L8DNsAe/xBUib75WR/Wft0yA=;
 b=syvVPbasZ6zfP13ynv95ALAV5nwpmbR4Oi63CzENz0ju+Yc4bviN/zWC1507hq+wug
 feKeRZiAs3pLocOHpue4fJxwjDEuRcpi3pIQ10DGn7bz9pGpUYwetwZcVGc1X3XKibB5
 mfSydr6WVhrbicWyhXopi8XR8Q3eRb+ntLFV+bWeBtDTPpzguRMP6mS8zwsc/OsDVrtD
 Z5ie1ghUoFPHft5cpm2dvp5dyDGG4OKJ1HcPjfA6IzrNkTOtJvCuzoxgeWG01cRZ8qEz
 YlS+sXWQC8GU8fN2anaaXzgEz5PENZejPoEe/hxTIdLZGm6RGlIu0WKuinbsgPiho91L
 T7OQ==
X-Gm-Message-State: AGi0PubAc66IydTTEI5ZxvVDKBu79VHl0vZ+DX4iZ/SCgvb3hOYib2mZ
 GYf/cXr+Md8FIKw7z0HWJ1c=
X-Google-Smtp-Source: APiQypLKON9sl5IDWScY2h+SLVUk6vFpneY1AgQBxbxsKwjUe6BaiRw1lQifpRUyFd55zPV9DE3r+Q==
X-Received: by 2002:a1c:b104:: with SMTP id a4mr34821227wmf.24.1589270260673; 
 Tue, 12 May 2020 00:57:40 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id p8sm25946618wma.45.2020.05.12.00.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 00:57:40 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 2/2] mtd: rawnand: brcmnand: improve hamming oob layout
Date: Tue, 12 May 2020 09:57:33 +0200
Message-Id: <20200512075733.745374-3-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512075733.745374-1-noltari@gmail.com>
References: <20200512060023.684871-1-noltari@gmail.com>
 <20200512075733.745374-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_005741_922117_EC8DFC25 
X-CRM114-Status: GOOD (  13.63  )
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhlIGN1cnJlbnQgY29kZSBnZW5lcmF0ZXMgOCBvb2Igc2VjdGlvbnM6ClMxCTEtNQpFQ0MJNi04
ClMyCTktMTUKUzMJMTYtMjEKRUNDCTIyLTI0ClM0CTI1LTMxClM1CTMyLTM3CkVDQwkzOC00MApT
Ngk0MS00NwpTNwk0OC01MwpFQ0MJNTQtNTYKUzgJNTctNjMKCkNoYW5nZSBpdCBieSBtZXJnaW5n
IGNvbnRpbnVvdXMgc2VjdGlvbnM6ClMxCTEtNQpFQ0MJNi04ClMyCTktMjEKRUNDCTIyLTI0ClMz
CTI1LTM3CkVDQwkzOC00MApTNAk0MS01MwpFQ0MJNTQtNTYKUzUJNTctNjMKClNpZ25lZC1vZmYt
Ynk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+Ci0tLQogdjQ6
IGNsYXJpZnkgc21hbGwvbGFyZ2UgcGFnZXMgY29tbWVudAogdjM6IGludmVydCBwYXRjaCBvcmRl
cgogdjI6IGtlZXAgb3JpZ2luYWwgY29tbWVudCBhbmQgZml4IGNvcnJlY3RseSBza2lwIGJ5dGUg
NiBmb3Igc21hbGwtcGFnZSBuYW5kCgogZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJj
bW5hbmQuYyB8IDM1ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE2
IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNt
bmFuZC9icmNtbmFuZC5jCmluZGV4IDFjMTA3MDExMWViYy4uNjI5MmZhYzZjYzRmIDEwMDY0NAot
LS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCisrKyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKQEAgLTExMDAsMzMgKzExMDAsMzAg
QEAgc3RhdGljIGludCBicmNtbmFuZF9oYW1taW5nX29vYmxheW91dF9mcmVlKHN0cnVjdCBtdGRf
aW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKIAlzdHJ1Y3QgYnJjbW5hbmRfY2ZnICpjZmcgPSAmaG9z
dC0+aHdjZmc7CiAJaW50IHNhcyA9IGNmZy0+c3BhcmVfYXJlYV9zaXplIDw8IGNmZy0+c2VjdG9y
X3NpemVfMWs7CiAJaW50IHNlY3RvcnMgPSBjZmctPnBhZ2Vfc2l6ZSAvICg1MTIgPDwgY2ZnLT5z
ZWN0b3Jfc2l6ZV8xayk7CisJdTMyIG5leHQ7CiAKLQlpZiAoc2VjdGlvbiA+PSBzZWN0b3JzICog
MikKKwlpZiAoc2VjdGlvbiA+IHNlY3RvcnMpCiAJCXJldHVybiAtRVJBTkdFOwogCi0Jb29icmVn
aW9uLT5vZmZzZXQgPSAoc2VjdGlvbiAvIDIpICogc2FzOworCW5leHQgPSAoc2VjdGlvbiAqIHNh
cyk7CisJaWYgKHNlY3Rpb24gPCBzZWN0b3JzKQorCQluZXh0ICs9IDY7CiAKLQlpZiAoc2VjdGlv
biAmIDEpIHsKLQkJb29icmVnaW9uLT5vZmZzZXQgKz0gOTsKLQkJb29icmVnaW9uLT5sZW5ndGgg
PSA3OworCWlmIChzZWN0aW9uKSB7CisJCW9vYnJlZ2lvbi0+b2Zmc2V0ID0gKChzZWN0aW9uIC0g
MSkgKiBzYXMpICsgOTsKIAl9IGVsc2UgewotCQlvb2JyZWdpb24tPmxlbmd0aCA9IDY7Ci0KLQkJ
LyogRmlyc3Qgc2VjdG9yIG9mIGVhY2ggcGFnZSBtYXkgaGF2ZSBCQkkgKi8KLQkJaWYgKCFzZWN0
aW9uKSB7Ci0JCQkvKgotCQkJICogU21hbGwtcGFnZSBOQU5EIHVzZSBieXRlIDYgZm9yIEJCSSB3
aGlsZSBsYXJnZS1wYWdlCi0JCQkgKiBOQU5EIHVzZSBieXRlcyAwIGFuZCAxLgotCQkJICovCi0J
CQlpZiAoY2ZnLT5wYWdlX3NpemUgPiA1MTIpIHsKLQkJCQlvb2JyZWdpb24tPm9mZnNldCArPSAy
OwotCQkJCW9vYnJlZ2lvbi0+bGVuZ3RoIC09IDI7Ci0JCQl9IGVsc2UgewotCQkJCW9vYnJlZ2lv
bi0+bGVuZ3RoLS07Ci0JCQl9CisJCWlmIChjZmctPnBhZ2Vfc2l6ZSA+IDUxMikgeworCQkJLyog
TGFyZ2UgcGFnZSBOQU5EIHVzZXMgZmlyc3QgMiBieXRlcyBmb3IgQkJJICovCisJCQlvb2JyZWdp
b24tPm9mZnNldCA9IDI7CisJCX0gZWxzZSB7CisJCQkvKiBTbWFsbCBwYWdlIE5BTkQgdXNlcyBs
YXN0IGJ5dGUgYmVmb3JlIEVDQyBmb3IgQkJJICovCisJCQlvb2JyZWdpb24tPm9mZnNldCA9IDA7
CisJCQluZXh0LS07CiAJCX0KIAl9CiAKKwlvb2JyZWdpb24tPmxlbmd0aCA9IG5leHQgLSBvb2Jy
ZWdpb24tPm9mZnNldDsKKwogCXJldHVybiAwOwogfQogCi0tIAoyLjI2LjIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
