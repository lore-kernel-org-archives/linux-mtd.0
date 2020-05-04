Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE01C3A5A9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 19:00:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69B38206B8
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 19:00:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U3gV/wRc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXnA4P7h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69B38206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=04ahB2DZzrJjkW9/NPAYP4MNRU2P9bfcWTKQyaJLLKo=; b=U3gV/wRcQXvwat
	5pxJ9GX2VfSHu7iyPyR3lDKFwuUI/K+QZQlev7X9VHgEZGYcmXE7YuLOpmDONj69CduJ3GZWx7/Ey
	2OXfkuVIqV1DwmsfUknAZzZ34xwMqaj5WGcskic1l+HGWP+zUchugWuphRxkEy6y2jVqXxJydEAns
	If6f+hADZ1OUH99Pw3ONpEAPGwTM66FktppwVvZpgrLL/beSrWBHoo12tDfc2l6HzSD9JpvGQwrDe
	jfZ48+HtDJaJdZGmuEg6mUpLIgmFP2V/MqLSu9MLhvXWO6Nlaf9nuke8NFCZ6heh5EKTSI2Y+JFlQ
	bGyrrsly6wdo2g5E20aw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVgJm-0004Mf-9Y; Mon, 04 May 2020 18:59:54 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVgJj-0004L2-E1
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 18:59:52 +0000
Received: by mail-wm1-x344.google.com with SMTP id u16so678509wmc.5
 for <linux-mtd@lists.infradead.org>; Mon, 04 May 2020 11:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2NDwq7adscftTrwiJQh+VER8nqxnsXi/L2yYoLQDIBw=;
 b=HXnA4P7h4efQixO7cYzcRhvRD93Ncw3vXuzps64vW0rY/ha+K3x9lOlgfUPy41i7av
 oZNH72AzCZIzOoW28BgnfC9fZL4qNCAPNfZT0wT/K2BWXmCK2/K5hTdfv9sWug1fTvYt
 mHJ/E9TnVFUObJF6sy9rFm4erjzgu1pqsSTxxQUwJJT+D2hUMhfi0xZj5+WxjKkhqpzd
 9vG8G6C/E2weGyQhFtsnsQtdzMSAo6BJDORuwDHr0dQL+IRWxxlF+sNNIYCy0YLCrqAR
 kGqexMqX4kwgHMdw2+/oE6h5buDdAIFsRHn03G/hVV5kfeM2Mn/5HCvQaD+Xdq5l7FzH
 Axog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2NDwq7adscftTrwiJQh+VER8nqxnsXi/L2yYoLQDIBw=;
 b=bRtvv5oS3Tlm3ykqpiFZxgT+4PUsEIL2znpBR2TJAamzhsFb6FyCN+evpaYDFwWf3B
 vXpZFGzXrFS+t5lLAMKbizhtgfbmZAuC8W0RCFAkw8tUBcFqeOlyBFAAkHA5wkwaT9Y8
 Eidbi4f8SYRFZPMDB2DqTA797zDuig0/sH7w0U4MLdRZFkMvhnA5oktsuQcyZBtZex+b
 MH2dB1blPZ3Gm7akdvxMXs93Ahzsgxud0V/yGERBmVkj+36H0OUgEQZOErQw8zmgtsY7
 gN4UD7SWAAiIjyucsMPKp2ZLmo4fJarsVydhXfZJ77AXMSZmcRrF+7UyyGWXIWn3iY85
 Kl1A==
X-Gm-Message-State: AGi0Pua93kKiuqgwUlnPacDJOM4mLV+Hxgxms65LtqsWRa9MmOdD5fhm
 Jx0y9P5xaK+sD9BoYxH5O1w=
X-Google-Smtp-Source: APiQypJSTQuFjpD6p2G9gmeFTpAmO96arAeQQH23JsTcN6wYA30d9Ts7qzlC5PKevWHz0bmf9ibNtw==
X-Received: by 2002:a1c:1983:: with SMTP id 125mr15856870wmz.43.1588618789726; 
 Mon, 04 May 2020 11:59:49 -0700 (PDT)
Received: from skynet.lan (246.red-83-44-9.dynamicip.rima-tde.net.
 [83.44.9.246])
 by smtp.gmail.com with ESMTPSA id i25sm452952wml.43.2020.05.04.11.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 11:59:49 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2 1/2] nand: brcmnand: improve hamming oob layout
Date: Mon,  4 May 2020 20:59:44 +0200
Message-Id: <20200504185945.2776148-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504093034.2739968-1-noltari@gmail.com>
References: <20200504093034.2739968-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_115951_474579_7417AA28 
X-CRM114-Status: GOOD (  13.31  )
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
Ynk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+Ci0tLQogdjI6
IGtlZXAgb3JpZ2luYWwgY29tbWVudCBhbmQgZml4IGNvcnJlY3RseSBza2lwIGJ5dGUgNiBmb3Ig
c21hbGwtcGFnZSBuYW5kCgogZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQu
YyB8IDM0ICsrKysrKysrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2Vy
dGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2JyY21uYW5kL2JyY21uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9i
cmNtbmFuZC5jCmluZGV4IGU0ZTNjZWVhYzM4Zi4uNzY3MzQzZTBlNmU3IDEwMDY0NAotLS0gYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCisrKyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKQEAgLTExMDAsMzAgKzExMDAsMzIgQEAgc3Rh
dGljIGludCBicmNtbmFuZF9oYW1taW5nX29vYmxheW91dF9mcmVlKHN0cnVjdCBtdGRfaW5mbyAq
bXRkLCBpbnQgc2VjdGlvbiwKIAlzdHJ1Y3QgYnJjbW5hbmRfY2ZnICpjZmcgPSAmaG9zdC0+aHdj
Zmc7CiAJaW50IHNhcyA9IGNmZy0+c3BhcmVfYXJlYV9zaXplIDw8IGNmZy0+c2VjdG9yX3NpemVf
MWs7CiAJaW50IHNlY3RvcnMgPSBjZmctPnBhZ2Vfc2l6ZSAvICg1MTIgPDwgY2ZnLT5zZWN0b3Jf
c2l6ZV8xayk7CisJdTMyIG5leHQ7CiAKLQlpZiAoc2VjdGlvbiA+PSBzZWN0b3JzICogMikKKwlp
ZiAoc2VjdGlvbiA+IHNlY3RvcnMpCiAJCXJldHVybiAtRVJBTkdFOwogCi0Jb29icmVnaW9uLT5v
ZmZzZXQgPSAoc2VjdGlvbiAvIDIpICogc2FzOworCW5leHQgPSAoc2VjdGlvbiAqIHNhcyk7CisJ
aWYgKHNlY3Rpb24gPCBzZWN0b3JzKQorCQluZXh0ICs9IDY7CiAKLQlpZiAoc2VjdGlvbiAmIDEp
IHsKLQkJb29icmVnaW9uLT5vZmZzZXQgKz0gOTsKLQkJb29icmVnaW9uLT5sZW5ndGggPSA3Owor
CWlmIChzZWN0aW9uKSB7CisJCW9vYnJlZ2lvbi0+b2Zmc2V0ID0gKChzZWN0aW9uIC0gMSkgKiBz
YXMpICsgOTsKIAl9IGVsc2UgewotCQlvb2JyZWdpb24tPmxlbmd0aCA9IDY7Ci0KLQkJLyogRmly
c3Qgc2VjdG9yIG9mIGVhY2ggcGFnZSBtYXkgaGF2ZSBCQkkgKi8KLQkJaWYgKCFzZWN0aW9uKSB7
Ci0JCQkvKgotCQkJICogU21hbGwtcGFnZSBOQU5EIHVzZSBieXRlIDYgZm9yIEJCSSB3aGlsZSBs
YXJnZS1wYWdlCi0JCQkgKiBOQU5EIHVzZSBieXRlIDAuCi0JCQkgKi8KLQkJCWlmIChjZmctPnBh
Z2Vfc2l6ZSA+IDUxMikKLQkJCQlvb2JyZWdpb24tPm9mZnNldCsrOwotCQkJb29icmVnaW9uLT5s
ZW5ndGgtLTsKKwkJLyoKKwkJICogU21hbGwtcGFnZSBOQU5EIHVzZSBieXRlIDYgZm9yIEJCSSB3
aGlsZSBsYXJnZS1wYWdlCisJCSAqIE5BTkQgdXNlIGJ5dGUgMC4KKwkJICovCisJCWlmIChjZmct
PnBhZ2Vfc2l6ZSA+IDUxMikgeworCQkJb29icmVnaW9uLT5vZmZzZXQgPSAxOworCQl9IGVsc2Ug
eworCQkJb29icmVnaW9uLT5vZmZzZXQgPSAwOworCQkJbmV4dC0tOwogCQl9CiAJfQogCisJb29i
cmVnaW9uLT5sZW5ndGggPSBuZXh0IC0gb29icmVnaW9uLT5vZmZzZXQ7CisKIAlyZXR1cm4gMDsK
IH0KIAotLSAKMi4yNi4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
