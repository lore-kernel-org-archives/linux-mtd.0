Return-Path: <SRS0=/JSY=7E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CEC0C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 12:15:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAF8720756
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 12:15:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dl3bAzGC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ma0iYnPO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAF8720756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9tBS25KsQm5lXLYJSo/8LUgH6L8ch01OH/1DtFCqyms=; b=Dl3bAzGCR8N+es
	TbtNqH9L4E+rtND6Je7JtXv3put47xs5jBp/R5a7d/YiNpC8DqZVefYdPO9dj2obn6pZauEwZa4FS
	/AyMEPNgFWuB1ZGIwNu0e/GMJbi4MqywbiJiEalEqsqU4QZ0QwcIo1oe33FkcLLa+R44zVxk31s1q
	C6R9TGRy3kmqKQVNN/Lk5L0mpNgMB4birsbb3rd8pPSGGegoUkMqgnpaH2EsqY9tAwGRN1FXpkHzx
	WO6Hw+N5GHZF1nRRFse079LKK67HfuU5xHm50Fhy+5aTxdocsRDQ92bwxU8ZkDcVhKMcrTndFgtwa
	NposZtKQl/GZmE6SWGGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc6aa-000637-Tp; Fri, 22 May 2020 12:15:48 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc6aH-0005oW-In
 for linux-mtd@lists.infradead.org; Fri, 22 May 2020 12:15:31 +0000
Received: by mail-wm1-x341.google.com with SMTP id u188so9613825wmu.1
 for <linux-mtd@lists.infradead.org>; Fri, 22 May 2020 05:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BKAL92q0Ci52kZCwbvnlfVSuzATsT4BlcolHSe2kRwA=;
 b=Ma0iYnPOu18BXyUM2shyVIEPYAFkkDlzr4V0aTIoaJMJu2X0bZtj1x1MiTOvGqa0JJ
 zbe9aFR1z083hhwx2sYPPpD6K9MDaa0JNYDfZPYkWb6+ZQRnKlKKvUwB3jiJzxk96bTg
 AMaQW8IYqJnKo6PBH1UilzfJGZB7TjcrcfZHu+9CuPAr200CyRAcfMd1oU0q0x5Y9oO3
 Im1+W9qaZ4mikvdB91CP83kXAywPrthNh0duQHX+hVNot/MxYoWc9r03BvS2nx7iIUlu
 k+fVjm1ZPvi9cYlCfBraVVSAz6BN9dIQR3xGAz68B1GQg37++HQNgvYF4dH1w8egnrh3
 6CRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BKAL92q0Ci52kZCwbvnlfVSuzATsT4BlcolHSe2kRwA=;
 b=oFzvxvndHzj+/PulLqf14nhz4Qs235dnkPslRFS9FWo8E0oC/CU3JikOYtaIBuYeD5
 tyUCdUDEAkXcIoxWHlDml8Aw/nudK6Hs3Lh//c4oGIsq8YnXo8Pqs2Rl7fh6sF8Zcax0
 8QD9i27Gwc8+rNuKpWq9jt9YkHPEJvXp2Eoj5kBD8gaK+FwiUcfIPalfHDCc4YQ2LFwT
 VEpUMPpMKXMZIrzmAtZdaQqE/HIamkofSyb7NbJQjbXrAEkpPrJMjcYodtcopnBbVwTu
 lrZVAHv8CWN5HoZS2yuFWtCMz2R7b33OwSwN7ZodmTTP75xD1WP2E61DijXZ42L+J9J0
 owow==
X-Gm-Message-State: AOAM5313vAT0YnA7qje4QdcvHwYf5vqzA+x6cD65j6Rc6KJ14sGjzemj
 soGU/HH80W7ZyL6rC2QB37s=
X-Google-Smtp-Source: ABdhPJxfxLCgrUYA6xryeUMaIeXfb1eR8QQ5Ia19IxIsjWiD/P2PTMcWNjzdcSkchlscqpb3L5SE7w==
X-Received: by 2002:a05:600c:2dd0:: with SMTP id
 e16mr14105746wmh.121.1590149728253; 
 Fri, 22 May 2020 05:15:28 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net.
 [83.44.12.159])
 by smtp.gmail.com with ESMTPSA id g6sm9293784wrp.75.2020.05.22.05.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 05:15:27 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 1/5] mtd: rawnand: brcmnand: rename v4 registers
Date: Fri, 22 May 2020 14:15:20 +0200
Message-Id: <20200522121524.4161539-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522121524.4161539-1-noltari@gmail.com>
References: <20200522072525.3919332-1-noltari@gmail.com>
 <20200522121524.4161539-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_051529_617618_DBA28E52 
X-CRM114-Status: UNSURE (   8.47  )
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

VGhlc2UgcmVnaXN0ZXJzIGFyZSBhbHNvIHVzZWQgb24gdjMuMy4KClNpZ25lZC1vZmYtYnk6IMOB
bHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgotLS0KIHY0OiBubyBjaGFu
Z2VzLgogdjM6IG5vIGNoYW5nZXMuCiB2MjogZml4IGNvbW1pdCB0aXRsZS4KCiBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
YnJjbW5hbmQvYnJjbW5hbmQuYwppbmRleCBlNGUzY2VlYWMzOGYuLjZhMDhkZDA3YjA1OCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYworKysgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCkBAIC0zMzgsOCArMzM4LDgg
QEAgZW51bSBicmNtbmFuZF9yZWcgewogCUJSQ01OQU5EX0ZDX0JBU0UsCiB9OwogCi0vKiBCUkNN
TkFORCB2NC4wICovCi1zdGF0aWMgY29uc3QgdTE2IGJyY21uYW5kX3JlZ3NfdjQwW10gPSB7Cisv
KiBCUkNNTkFORCB2My4zLXY0LjAgKi8KK3N0YXRpYyBjb25zdCB1MTYgYnJjbW5hbmRfcmVnc192
MzNbXSA9IHsKIAlbQlJDTU5BTkRfQ01EX1NUQVJUXQkJPSAgMHgwNCwKIAlbQlJDTU5BTkRfQ01E
X0VYVF9BRERSRVNTXQk9ICAweDA4LAogCVtCUkNNTkFORF9DTURfQUREUkVTU10JCT0gIDB4MGMs
CkBAIC01OTEsOCArNTkxLDggQEAgc3RhdGljIGludCBicmNtbmFuZF9yZXZpc2lvbl9pbml0KHN0
cnVjdCBicmNtbmFuZF9jb250cm9sbGVyICpjdHJsKQogCQljdHJsLT5yZWdfb2Zmc2V0cyA9IGJy
Y21uYW5kX3JlZ3NfdjYwOwogCWVsc2UgaWYgKGN0cmwtPm5hbmRfdmVyc2lvbiA+PSAweDA1MDAp
CiAJCWN0cmwtPnJlZ19vZmZzZXRzID0gYnJjbW5hbmRfcmVnc192NTA7Ci0JZWxzZSBpZiAoY3Ry
bC0+bmFuZF92ZXJzaW9uID49IDB4MDQwMCkKLQkJY3RybC0+cmVnX29mZnNldHMgPSBicmNtbmFu
ZF9yZWdzX3Y0MDsKKwllbHNlIGlmIChjdHJsLT5uYW5kX3ZlcnNpb24gPj0gMHgwMzAzKQorCQlj
dHJsLT5yZWdfb2Zmc2V0cyA9IGJyY21uYW5kX3JlZ3NfdjMzOwogCiAJLyogQ2hpcC1zZWxlY3Qg
c3RyaWRlICovCiAJaWYgKGN0cmwtPm5hbmRfdmVyc2lvbiA+PSAweDA3MDEpCi0tIAoyLjI2LjIK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
