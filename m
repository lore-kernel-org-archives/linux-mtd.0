Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FF2E63F3D
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Feb 2026 09:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LdK8L+CUyIMxmPZdphWmdB5whn1+EU8IUCMMM/7jIdQ=; b=Rau3hhvhnk18bs
	AXQN3I+v2qQx3MnFGacOhEYQlxiIWV2WOVYMsOKBr4lxzF218D0wr5JlzOf6WTMRmZiNKRB3nvaso
	0iwKF1jThruVvOmG7IxzlkC8zi4paHB7fgPHGMd54kZgT8cbt8owxNMy4xg2EmHpkHwuvedvdUq2T
	Yng2yTI6t9TVEpBOzzhm3rLWJ7sf3/CZMuGvyEqiGCtvLxhHJIT2jnH36kgTUi5eFw3kmJFzSZ8Ac
	iazrN82wLiDk8V0XPxocOuIhM3xJ6juEVU0iMrq3bVlVL0vlL7Kfe/+XBpSAOoiX/XcnwIZ0KMOhZ
	sFZ76VpGnfoTU4Izf5wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vruWv-00000006DUg-1Rv4;
	Mon, 16 Feb 2026 09:04:33 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vruWt-00000006DU4-1Xqc
	for linux-mtd@lists.infradead.org;
	Mon, 16 Feb 2026 09:04:32 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48375f10628so15740535e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 16 Feb 2026 01:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771232669; x=1771837469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bCOBB7qLBaGCSdaWS+9arntDbhsW2HD4WwoHB51dfEs=;
        b=Er8llQzoV8oJqt9BjRXBo0X8/p4klSUoh89szmpDv077e4G8H0b+MQdJGZYZuDUgb2
         VpnWv7MUWC4qzQaGenfKbfY0xeHH2cWkWZbpk1/J3xfrFucF3fKXbMjDN+saQw4OMrmv
         D9bd/f/wjoGBuguaHcr9fX+P8blFrGvfRNWzWgpNgxYHcuk/jRAJhhrtORFtbCcPtKy5
         lHKKBQIfq10eHmShT2jwkJiKhlcCrWcLL+b/M5QNOJm3a1C+Q+A9NKyiHvlKL83vPDzA
         YIIVd8FNFwYBcMVT+HR4d6DqUrYst2scM5BSW8G5YHCaA3jngH3Uqw/LYxoIzVk9haHH
         KMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232669; x=1771837469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCOBB7qLBaGCSdaWS+9arntDbhsW2HD4WwoHB51dfEs=;
        b=PhqawLdKM0aHJ7XXIIboquZejVemwrHXSticyU7RZNIM7G6QB6CVDdfcye9IMWL/Ph
         PZeSyzbM86NTRa53ZfPTLycZtTqMTWTNUBeIAx1svQewabkWnDG/aTAZygEBFN1rMsNr
         ZEIGkmzzeTEi3qCxXpccJZzfBFj0v1V3XONR15wcgdx/ixDzbjMDk+XM2VIU01fBjqzk
         5dv8i35rgYmczA2scYmjf0F9rMZYKorteSF4MOUmme90RHZ54KPCaT/SGqWiJZCRjCyK
         BQXHLKWTg3F4J2jmvHYC2O17rxJ2sUIn1/NJ9u2k+i6TkpbBoS2ATRTBcQ0ARhmoftL+
         7rvg==
X-Forwarded-Encrypted: i=1; AJvYcCXK5U4RxMGLaxhIQHhMoyj4vFI34X+nq4UB428lgEwJSUElnZOC59Dz4iq7rfcocarI3iVQen6VeEo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrGlY5okCnT564byRFMOt4G+6l3gnbiDUpo1wThx68KeHotxum
	H103+RcC4rWxqwwbqeH19+oH2jntWDOPDC4sfd9ssNoxqAjYUjDH2Q8c
X-Gm-Gg: AZuq6aLXUDOuwEOCbnX/rAyQe8dphOsn+VuoQ22mNsYV7BK5OlCEd1VcKNzdRNIUwu/
	A36/d+7Y7klHRoBSmq20aGLKt2hKr//SOI7SItaxh5XQKnO25zXwCm6+bcBlvNKwXJZP7q0rEF8
	Ao4y9J74RtTBUU9OtJNZBPnQ5qjyel3QEcxtXFz+Slp+rJwIny6/adf4WT1DQhQC5+sbYhs/vm/
	O6QLv9tbMh7WP8HDwS+wI7p1Msy0TE9fEUTHMA/SlITCuBrD9dnhqzFV44xPgWU63w6z+dbINCA
	NikZWX8MJbpIad6qYpCF6S/9f8cq9nQzD1WTDTFT7+0/kxcBMLOOZ/euVhKZ1EFA8aYAPBIoRwu
	Lo3i07Zqoo5ZInoyI/ie5jRxJpWxX5znEdrfofd+/91Aau5Cu9h54sxhWywR5gXHOdhl/e9yqHZ
	uDEf7L1Do+LKb54idVSV4sjJ3WTAUSmGY1o/geTpbPxWM941g=
X-Received: by 2002:a05:600c:1e89:b0:480:1b1a:5526 with SMTP id 5b1f17b1804b1-48373a0cd0bmr169365875e9.16.1771232668799;
        Mon, 16 Feb 2026 01:04:28 -0800 (PST)
Received: from dev-linux.homserver.local ([51.154.248.223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abe3b3sm30043726f8f.18.2026.02.16.01.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 01:04:28 -0800 (PST)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] mtd: rawnand: cafe: Use generic power management
Date: Mon, 16 Feb 2026 09:02:44 +0000
Message-ID: <20260216090415.675368-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_010431_435429_A2A95C11 
X-CRM114-Status: GOOD (  12.99  )
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

U3dpdGNoIHRvIHRoZSBnZW5lcmljIFBDSSBwb3dlciBtYW5hZ2VtZW50IGZyYW1ld29yayBhbmQg
cmVtb3ZlIGxlZ2FjeQpjYWxsYmFja3MgbGlrZSAucmVzdW1lKCkuIFdpdGggdGhlIGdlbmVyaWMg
ZnJhbWV3b3JrLCB0aGUgc3RhbmRhcmQgUENJCnJlbGF0ZWQgd29yayBsaWtlOgoJLSBwY2lfc2F2
ZS9yZXN0b3JlX3N0YXRlKCkKCS0gcGNpX2VuYWJsZS9kaXNhYmxlX2RldmljZSgpCgktIHBjaV9z
ZXRfcG93ZXJfc3RhdGUoKQppcyBoYW5kbGVkIGJ5IHRoZSBQQ0kgY29yZS4KClRoaXMgZHJpdmVy
IHNob3VsZCBpbXBsZW1lbnQgb25seSBjYWZlX25hbmQgc3BlY2lmaWMgb3BlcmF0aW9ucyBpbiBp
dHMKY2FsbGJhY2sgZnVuY3Rpb24gZm9yIHJlc3VtZS4KClNpZ25lZC1vZmYtYnk6IFZhaWJoYXYg
R3VwdGEgPHZhaWJoYXZndXB0YTQwQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9jYWZlX25hbmQuYyB8IDcgKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWZl
X25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2NhZmVfbmFuZC5jCmluZGV4IDY2Mzg1YzRm
Yjk5NC4uYWY3NzFjMzc5ZWMxIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWZl
X25hbmQuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWZlX25hbmQuYwpAQCAtODM3LDkg
KzgzNywxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgY2FmZV9uYW5kX3Ri
bFtdID0gewogCiBNT0RVTEVfREVWSUNFX1RBQkxFKHBjaSwgY2FmZV9uYW5kX3RibCk7CiAKLXN0
YXRpYyBpbnQgY2FmZV9uYW5kX3Jlc3VtZShzdHJ1Y3QgcGNpX2RldiAqcGRldikKK3N0YXRpYyBp
bnQgY2FmZV9uYW5kX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJdWludDMyX3QgY3Ry
bDsKKwlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoZGV2KTsKIAlzdHJ1Y3QgbXRk
X2luZm8gKm10ZCA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAlzdHJ1Y3QgbmFuZF9jaGlwICpj
aGlwID0gbXRkX3RvX25hbmQobXRkKTsKIAlzdHJ1Y3QgY2FmZV9wcml2ICpjYWZlID0gbmFuZF9n
ZXRfY29udHJvbGxlcl9kYXRhKGNoaXApOwpAQCAtODc3LDEyICs4NzgsMTQgQEAgc3RhdGljIGlu
dCBjYWZlX25hbmRfcmVzdW1lKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQogCXJldHVybiAwOwogfQog
CitzdGF0aWMgREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTKGNhZmVfbmFuZF9vcHMsIE5VTEwsIGNh
ZmVfbmFuZF9yZXN1bWUpOworCiBzdGF0aWMgc3RydWN0IHBjaV9kcml2ZXIgY2FmZV9uYW5kX3Bj
aV9kcml2ZXIgPSB7CiAJLm5hbWUgPSAiQ0FGw4kgTkFORCIsCiAJLmlkX3RhYmxlID0gY2FmZV9u
YW5kX3RibCwKIAkucHJvYmUgPSBjYWZlX25hbmRfcHJvYmUsCiAJLnJlbW92ZSA9IGNhZmVfbmFu
ZF9yZW1vdmUsCi0JLnJlc3VtZSA9IGNhZmVfbmFuZF9yZXN1bWUsCisJLmRyaXZlci5wbSA9ICZj
YWZlX25hbmRfb3BzLAogfTsKIAogbW9kdWxlX3BjaV9kcml2ZXIoY2FmZV9uYW5kX3BjaV9kcml2
ZXIpOwotLSAKMi41My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
