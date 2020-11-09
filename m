Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8D6C388F7
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:25:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86AB5206A1
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:25:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="izLl13s0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eespszn+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86AB5206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n/DTXePThcgrH6HMtQaU/usSvTmxDbR/cIp+unxHlng=; b=izLl13s0AhUr0BgnM1Pb26WYN
	xSf1cLu1tcRJl9MbZ4tJBf589eCxICWRYxQ8VFOn9zRb1AoJBenh6EBXfK9imu82u58qg8w2swirl
	X4r9C4iO5wYMqsN6uvQisovkygFkQ7d08W8cMgN/VZUfXcGixJv3ODGKNEe/mb2VEQqP6iRdc8umA
	1iMVtQUU16FKGeQbYDMXrVs07vwRop65AlIlltcaHRRmzZNBL1F8ELa+i7k79a0MsP/Rg6tsMfQKk
	J2YkaJBIpVnKVLCftgklB7LS0NNy2wpmZCnVBInq684Ap21v0RtwyexS3SYj/g9z2KESFfXEpuGNa
	biN1CXBoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcBqj-00022g-7w; Mon, 09 Nov 2020 18:25:05 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcBoR-0000wd-0v
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 18:22:53 +0000
Received: by mail-wr1-x444.google.com with SMTP id o15so1970968wru.6
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2020 10:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zU6AEe7QJ86BUUdNT9vgeNl78+UInfUWOmxhJubmBR0=;
 b=eespszn+YzerPW89j0B6QI6zk+RxJ1PHs9P1SEM5hZerhh3ZzcZTRQ7GHYMYUf+Dga
 ++A4cusms1L/Pe1u5fJ/lrRe8YuhE0YY4giowbFwEgp7orkXRh/ShfipGTynSUZfJG6n
 39I7QLU/e3j/1irF9M3iDMWnl/RkEj1RCEy3SK0goOba5IQrXJWY6/lDuy2s6qVpbGcD
 4JTixvz6bWmsoKNFGRlTSQOfZPXUMjf7969pxHbsAuzxn1/emvmh3hcYmCMpR9/GwKmE
 /1L09ZZE7s99hP1qDvCXoyVha6cwY597da0n090H+kuJ4XNbD/lqED4riT3Nev2R1ZIB
 zvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zU6AEe7QJ86BUUdNT9vgeNl78+UInfUWOmxhJubmBR0=;
 b=ZU0GFFKCtC8a/yWlOhqah6ZCPOH5SSu6xqM//Dr+K0mHvLY2zSWSPJOExcFPWjrkgx
 716HsdRQpRZoRr1lE/7aWNlP37iITyUXYBX0a73ZL2rSoSV0RdDNDJWV+lHARLZqIfeC
 GIwx7FINBYvn5yLhYuB4sf7r/f5/4l4jzOff/heltkMheigt4mgPTY/rcH43vuosolkU
 SSz9F5GX4nBlJyUDF/WjBzEZaHdmARkSwzQO2YPRegHFhnDLFrlI3ntCHMa/bUBGsbOM
 tqyG6gTsLrSRKhjneF4DcCWM9x1CqO4rPV3b25grDWgWztnivSLA8BgPPNLEAC9m1iQX
 F+dA==
X-Gm-Message-State: AOAM531KXaUNFK/MSjtQOFTJtpBMMYPaExPPaJt8DWSN/7JAjebcN/dn
 lraB01PFBgqJAVfxDiK9cN/70A==
X-Google-Smtp-Source: ABdhPJwh4ngGh6y8Wlc6J5atpBxTT52cWGhiUWgeYB5bTlJSHS3m0gEHxir0U09GRfBwvJAcMdrCRA==
X-Received: by 2002:adf:f9c4:: with SMTP id w4mr20167333wrr.64.1604946161879; 
 Mon, 09 Nov 2020 10:22:41 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:41 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 15/23] mtd: rawnand: diskonchip: Marking unused variables
 as __always_unused
Date: Mon,  9 Nov 2020 18:21:58 +0000
Message-Id: <20201109182206.3037326-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109182206.3037326-1-lee.jones@linaro.org>
References: <20201109182206.3037326-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_132243_117520_49ED3569 
X-CRM114-Status: GOOD (  20.05  )
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
Cc: Dan Brown <dan_brown@ieee.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

J2R1bW15JyBpcyBuZXZlciBjaGVja2VkIChhcyBwZXIgdGhlIG5vbWVuY2xhdHVyZSkgYW5kIHRo
ZSB1c2Ugb2YKJ2VtdHB5bWF0Y2gnIGlzIGN1cnJlbnRseSAjaWYgMCdlZCBvdXQuICBXZSBjb3Vs
ZCBhbHNvICNpZiAwIHRoZQpkZWNsYXJhdGlvbiwgYnV0ICNpZmVyeSBpcyBwcmV0dHkgdWdseSwg
c28gSSBsaWtlIHRvIGtlZXAgaXQgdG8gYQptaW5pbXVtLgoKRml4ZXMgdGhlIGZvbGxvd2luZyBX
PTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVycy9tdGQvbmFuZC9yYXcvZGlza29u
Y2hpcC5jOiBJbiBmdW5jdGlvbiDigJhEb0NfRGVsYXnigJk6CiBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9kaXNrb25jaGlwLmM6MjE5OjE2OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhkdW1teeKAmSBzZXQg
YnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQogZHJpdmVycy9tdGQvbmFu
ZC9yYXcvZGlza29uY2hpcC5jOiBJbiBmdW5jdGlvbiDigJhkb2MyMDB4X2NhbGN1bGF0ZV9lY2Pi
gJk6CiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9kaXNrb25jaGlwLmM6NzA2OjY6IHdhcm5pbmc6IHZh
cmlhYmxlIOKAmGVtcHR5bWF0Y2jigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNl
dC12YXJpYWJsZV0KCkNjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29t
PgpDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KQ2M6IFZpZ25lc2ggUmFn
aGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KQ2M6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJl
emlsbG9uQGNvbGxhYm9yYS5jb20+CkNjOiBEYW4gQnJvd24gPGRhbl9icm93bkBpZWVlLm9yZz4K
Q2M6IERhdmlkIFdvb2Rob3VzZSA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4KQ2M6IFRob21hcyBHbGVp
eG5lciA8dGdseEBsaW51dHJvbml4LmRlPgpDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5v
cmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9kaXNrb25jaGlwLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvZGlza29uY2hpcC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZGlza29uY2hp
cC5jCmluZGV4IDk0NDMyYTQ1M2U1ZWUuLmQ1MDUwZTMyY2M0MjEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvbXRkL25hbmQvcmF3L2Rpc2tvbmNoaXAuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9k
aXNrb25jaGlwLmMKQEAgLTIxNiw3ICsyMTYsNyBAQCBzdGF0aWMgaW50IGRvY19lY2NfZGVjb2Rl
KHN0cnVjdCByc19jb250cm9sICpycywgdWludDhfdCAqZGF0YSwgdWludDhfdCAqZWNjKQogCiBz
dGF0aWMgdm9pZCBEb0NfRGVsYXkoc3RydWN0IGRvY19wcml2ICpkb2MsIHVuc2lnbmVkIHNob3J0
IGN5Y2xlcykKIHsKLQl2b2xhdGlsZSBjaGFyIGR1bW15OworCXZvbGF0aWxlIGNoYXIgX19hbHdh
eXNfdW51c2VkIGR1bW15OwogCWludCBpOwogCiAJZm9yIChpID0gMDsgaSA8IGN5Y2xlczsgaSsr
KSB7CkBAIC03MDMsNyArNzAzLDcgQEAgc3RhdGljIGludCBkb2MyMDB4X2NhbGN1bGF0ZV9lY2Mo
c3RydWN0IG5hbmRfY2hpcCAqdGhpcywgY29uc3QgdV9jaGFyICpkYXQsCiAJc3RydWN0IGRvY19w
cml2ICpkb2MgPSBuYW5kX2dldF9jb250cm9sbGVyX2RhdGEodGhpcyk7CiAJdm9pZCBfX2lvbWVt
ICpkb2NwdHIgPSBkb2MtPnZpcnRhZHI7CiAJaW50IGk7Ci0JaW50IGVtcHR5bWF0Y2ggPSAxOwor
CWludCBfX2Fsd2F5c191bnVzZWQgZW1wdHltYXRjaCA9IDE7CiAKIAkvKiBmbHVzaCB0aGUgcGlw
ZWxpbmUgKi8KIAlpZiAoRG9DX2lzXzIwMDAoZG9jKSkgewotLSAKMi4yNS4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
