Return-Path: <SRS0=/JSY=7E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 604CFC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 07:26:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30CAA20757
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 07:26:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HD9JQmKU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rnwBD9Yx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30CAA20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SR+uVEAnOKpD93MY7ZwWFFBfl9Ytt0D7sEWJFds1rpA=; b=HD9JQmKUcZF+zV
	iiayaejJBaFFJRn6RvhskLgxQalmbAoCATLsvgqBL1k1ShVc+ectDndvzgHY7Sjl/4ib9yayYeWkK
	WZbWbzcSrLQKmqGZLYEQw3ON/gro4GTF49dgrwZPrtWoGTR7GQzw+ykjxzw+MxsMJufyqxwo1ctKJ
	m/shl7T0XM1a+2fYGgTsY+Vbucbm7qQfpEMOLi2b2USDB2orgKiophFd/qtItiGI3F6sz47x1wbeN
	TeFYLhkI3Lux/8jOLkzVYQwfWAE1Gm5osfBwUJdX25dGzxFP7TVZ+7yJZdxDE5n41Qi7NAUzHtcWn
	2MMhBbBrvVjxQYv9ZP9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc24P-0006fU-KJ; Fri, 22 May 2020 07:26:17 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc23h-00060K-03
 for linux-mtd@lists.infradead.org; Fri, 22 May 2020 07:25:34 +0000
Received: by mail-wm1-x342.google.com with SMTP id n5so8854671wmd.0
 for <linux-mtd@lists.infradead.org>; Fri, 22 May 2020 00:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XDvP7skNJs4tKTlKtdt9bUJvJfxMC8gHW2dP050hlR0=;
 b=rnwBD9Yxv/bc1SSHOCuVjW/0ZvN3Ty/t/Mfk+cHmcAelakXqHg7HQFhklxBkxpo0JJ
 4dmBdVqVyA3qgd83irkTn/vuX6biNTbWd9trr8Gp6HSnhdSmV9ivc0zLSTaP5WPcZXRw
 Av+LtYDLRLg/+kFc/DkMI2v/zeDzBk0F4Q4iw2XR18usJstbFFpj+4YGJwx0wcfirhMS
 cYNWE+Pf+VbegZFTY0jZ5O0BSACeuQz7KWCkyXlMEi/PPhsTkxgXh/q9OrnQtVxpN2l1
 CX25wHDdS49OV3flVdLBAgWY1NDAzRBDZ9Kjau1IzdLnVpJGQOg3PrLh+cwsapUbL3YH
 cyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XDvP7skNJs4tKTlKtdt9bUJvJfxMC8gHW2dP050hlR0=;
 b=XjUuScQ+r67FLlFZp8APIX+gDM3yuHKkX8lYPpib7YvXyNEhbeKEuSMXAg26q8hq8b
 f3SVYOzz/AWAcnpgsRPByStt3DMjkvQlu75KFfW2CgKFqvWvFDsYW6ZcEHuy3WvBLGL9
 bdq4AkmBX3Cczq0QliGjpR5pnZPLFcNxD45w65E5aHhKOuZwS0gxc2y/vDpRRQP5MtE+
 EOB8GTFRH3SqZgVFCvuXJ9eZVTYI7jT26tc1DqBwOQ1L9pJ64VnJetUipJg+KCbBm5ki
 7Sn5eFXX+9Mn6PdpUMZCORp2KrFYiv3oRAFOu4fCmgMu099WoAKqvtKxjYgVXAxGKKeL
 736w==
X-Gm-Message-State: AOAM5330s1XyDQoHiWj9OyKHLoo1k6WPg4NmCEVPoZVXtsnPBzyzScMe
 mQgOubxDCWrQlGJiyAQXygE=
X-Google-Smtp-Source: ABdhPJwLXPwMKkymEIty2nNVw6xiBfgdwwliFlwar3iAAZ9oqW1R/L+QdfQIxeDvNHspsL3mGaOtpg==
X-Received: by 2002:a05:600c:2146:: with SMTP id
 v6mr12656827wml.142.1590132331609; 
 Fri, 22 May 2020 00:25:31 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net.
 [83.44.12.159])
 by smtp.gmail.com with ESMTPSA id f128sm9299898wme.1.2020.05.22.00.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 00:25:31 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 3/5] mtd: rawnand: brcmnand: rename page sizes
Date: Fri, 22 May 2020 09:25:23 +0200
Message-Id: <20200522072525.3919332-4-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522072525.3919332-1-noltari@gmail.com>
References: <20200512073329.742893-1-noltari@gmail.com>
 <20200522072525.3919332-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_002533_046595_6E013FDC 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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
LS0KIHYzOiBubyBjaGFuZ2VzLgogdjI6IGFkZCBuZXcgcGF0Y2guCgogZHJpdmVycy9tdGQvbmFu
ZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQv
YnJjbW5hbmQuYwppbmRleCA3MmIyNjhkOGUzYTQuLmVmNjBkYmJlYWMyYiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYworKysgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCkBAIC01NzEsNyArNTcxLDcgQEAgc3RhdGlj
IGludCBicmNtbmFuZF9yZXZpc2lvbl9pbml0KHN0cnVjdCBicmNtbmFuZF9jb250cm9sbGVyICpj
dHJsKQogewogCXN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgYmxvY2tfc2l6ZXNfdjZbXSA9IHsg
OCwgMTYsIDEyOCwgMjU2LCA1MTIsIDEwMjQsIDIwNDgsIDAgfTsKIAlzdGF0aWMgY29uc3QgdW5z
aWduZWQgaW50IGJsb2NrX3NpemVzX3Y0W10gPSB7IDE2LCAxMjgsIDgsIDUxMiwgMjU2LCAxMDI0
LCAyMDQ4LCAwIH07Ci0Jc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCBwYWdlX3NpemVzW10gPSB7
IDUxMiwgMjA0OCwgNDA5NiwgODE5MiwgMCB9OworCXN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQg
cGFnZV9zaXplc192M180W10gPSB7IDUxMiwgMjA0OCwgNDA5NiwgODE5MiwgMCB9OwogCiAJY3Ry
bC0+bmFuZF92ZXJzaW9uID0gbmFuZF9yZWFkcmVnKGN0cmwsIDApICYgMHhmZmZmOwogCkBAIC02
MTgsNyArNjE4LDcgQEAgc3RhdGljIGludCBicmNtbmFuZF9yZXZpc2lvbl9pbml0KHN0cnVjdCBi
cmNtbmFuZF9jb250cm9sbGVyICpjdHJsKQogCQljdHJsLT5tYXhfcGFnZV9zaXplID0gMTYgKiAx
MDI0OwogCQljdHJsLT5tYXhfYmxvY2tfc2l6ZSA9IDIgKiAxMDI0ICogMTAyNDsKIAl9IGVsc2Ug
ewotCQljdHJsLT5wYWdlX3NpemVzID0gcGFnZV9zaXplczsKKwkJY3RybC0+cGFnZV9zaXplcyA9
IHBhZ2Vfc2l6ZXNfdjNfNDsKIAkJaWYgKGN0cmwtPm5hbmRfdmVyc2lvbiA+PSAweDA2MDApCiAJ
CQljdHJsLT5ibG9ja19zaXplcyA9IGJsb2NrX3NpemVzX3Y2OwogCQllbHNlCi0tIAoyLjI2LjIK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
