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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AA1C54E4B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 07:34:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF454206B7
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 07:34:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Omui4Z0X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uGzylulq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF454206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o0h0aJsTUdddwrTpYq8RPkdXWTeUsF2E/HNNufCigbE=; b=Omui4Z0X0vVbt5
	KBOshMFDEweeJEuCPHwJgx6GL1rabnl8ZovUffodByIWqjC7rYETkKhHu4xzqL/8vmQK755gWIIb1
	TMFm7+CFx6jzkkBM/6Kb1+BgtQfla2whKtaW7MAowQu6FC/+Ql6Td/PpxAT+Oj/+fNeYIGEuXgmeX
	rh7P69DthYxKIkHiAy4/vSjbTSJZyfWl03xSyebPiIyMINxFUQVR17NIGZ4bl6DJu7/ryOtdZLrjy
	Pnu/w8c5UowXzcXZSXImwXBGKFSngywEqBZU0mHX6Zi6rwo8a2kuJzkD9M0Fb3+40gUkFVRiYzNtG
	aHd23sFs00GC3b5J5t4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYPQj-0005P0-KV; Tue, 12 May 2020 07:34:21 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYPQ2-0004em-HD
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 07:33:39 +0000
Received: by mail-wm1-x343.google.com with SMTP id n5so7174338wmd.0
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2020 00:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G5WeydaheRjYC65flS9VBT/GaukdHAjM5PopK1ROBpE=;
 b=uGzylulqminwzQ6povM6ovuuUBe0WiR4xU6SJn+/ZSYfSjJBCwlFQK0jgTnK48gceG
 BDESWCgsNMop/6BdmxKJRpgdT3qA6z/M4og5XoHwArvwSsUiVikxCWL9PR/d2Q3oJBKd
 4D4ag5Wj03XHA0MDGSxGSyso2qvooQRLfFHGagytBBiB0WhxpFyYrtC8cw9Ivc0xJFnJ
 PFp0FFvnX0h1gm8K85juN3SgJ0GpLAjMP0aEVxM8vLScYZd6dZNMwt0Oz6fSSqxoq7nA
 mB5n366zhZTIJpm4Pw+AAsQjkZ3mKxBcWuxqm2tLqFlhrYTVGJ8jTPiVU87inTwss5TP
 vJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G5WeydaheRjYC65flS9VBT/GaukdHAjM5PopK1ROBpE=;
 b=Mg8faS0lGHIiEyyTYw2kFoNrgua/iq1dFZ39HZSPAFZnKhpMxrQXvhN3NXaRD9oOL9
 HNUCQp/M/+ANgo8bTRUt9Xv3tkaXOsZX4m/ZYjO1+PpOskc3SSQqXfFLvlImHPrZRFqQ
 oRHx8V2XP6MUcmE2oLmOGB2bhWy114wylUm2nZFBqPib4z8oX+c9s7PgYO+72zZ9rWHE
 Z+TTBaakf8F6mae54wBDCWI9Gg1dkqqewvsCd/xEYx2BXJmB9ty3tlRQz+5XztPoaeJS
 DcKCzUVuuGoRlsvmMa5+QbJZ5geiBJOXaIPQ+ZgcIv8ixXLlsyf2BmJVGZSYDvXJR5Ey
 sWOQ==
X-Gm-Message-State: AOAM5310gcVSMVstr3090AWSdZJPc4nWyC/8fzxvb6vxMlc0jdHAfCR+
 ySUP2Xe7hTyFGuAYl0aKWQg=
X-Google-Smtp-Source: ABdhPJy5oH7h1efIv7HKPXfxD75jowwabOsBtrEQiCX/KAWe4Acx+HNa053Yh3bIJDVBJsMfhrDqJg==
X-Received: by 2002:a05:600c:22c9:: with SMTP id
 9mr1320114wmg.162.1589268817065; 
 Tue, 12 May 2020 00:33:37 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id d9sm5961197wmd.10.2020.05.12.00.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 00:33:36 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2 3/5] mtd: rawnand: brcmnand: rename page sizes
Date: Tue, 12 May 2020 09:33:27 +0200
Message-Id: <20200512073329.742893-4-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512073329.742893-1-noltari@gmail.com>
References: <20200510151406.2527856-1-noltari@gmail.com>
 <20200512073329.742893-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_003338_589024_20348E52 
X-CRM114-Status: GOOD (  11.14  )
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

Q3VycmVudCBwYWdlcyBzaXplcyBhcHBseSB0byBjb250cm9sbGVycyBhZnRlciB2My40CgpTaWdu
ZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgot
LS0KIHYyOiBhZGQgbmV3IHBhdGNoLgoKIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2Jy
Y21uYW5kLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJj
bW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKaW5kZXgg
NzJiMjY4ZDhlM2E0Li5lZjYwZGJiZWFjMmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2JyY21uYW5kL2JyY21uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5h
bmQvYnJjbW5hbmQuYwpAQCAtNTcxLDcgKzU3MSw3IEBAIHN0YXRpYyBpbnQgYnJjbW5hbmRfcmV2
aXNpb25faW5pdChzdHJ1Y3QgYnJjbW5hbmRfY29udHJvbGxlciAqY3RybCkKIHsKIAlzdGF0aWMg
Y29uc3QgdW5zaWduZWQgaW50IGJsb2NrX3NpemVzX3Y2W10gPSB7IDgsIDE2LCAxMjgsIDI1Niwg
NTEyLCAxMDI0LCAyMDQ4LCAwIH07CiAJc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCBibG9ja19z
aXplc192NFtdID0geyAxNiwgMTI4LCA4LCA1MTIsIDI1NiwgMTAyNCwgMjA0OCwgMCB9OwotCXN0
YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcGFnZV9zaXplc1tdID0geyA1MTIsIDIwNDgsIDQwOTYs
IDgxOTIsIDAgfTsKKwlzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHBhZ2Vfc2l6ZXNfdjNfNFtd
ID0geyA1MTIsIDIwNDgsIDQwOTYsIDgxOTIsIDAgfTsKIAogCWN0cmwtPm5hbmRfdmVyc2lvbiA9
IG5hbmRfcmVhZHJlZyhjdHJsLCAwKSAmIDB4ZmZmZjsKIApAQCAtNjE4LDcgKzYxOCw3IEBAIHN0
YXRpYyBpbnQgYnJjbW5hbmRfcmV2aXNpb25faW5pdChzdHJ1Y3QgYnJjbW5hbmRfY29udHJvbGxl
ciAqY3RybCkKIAkJY3RybC0+bWF4X3BhZ2Vfc2l6ZSA9IDE2ICogMTAyNDsKIAkJY3RybC0+bWF4
X2Jsb2NrX3NpemUgPSAyICogMTAyNCAqIDEwMjQ7CiAJfSBlbHNlIHsKLQkJY3RybC0+cGFnZV9z
aXplcyA9IHBhZ2Vfc2l6ZXM7CisJCWN0cmwtPnBhZ2Vfc2l6ZXMgPSBwYWdlX3NpemVzX3YzXzQ7
CiAJCWlmIChjdHJsLT5uYW5kX3ZlcnNpb24gPj0gMHgwNjAwKQogCQkJY3RybC0+YmxvY2tfc2l6
ZXMgPSBibG9ja19zaXplc192NjsKIAkJZWxzZQotLSAKMi4yNi4yCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
