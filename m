Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B653EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tSCmYFfjB7bg6Z3K/eJdIDEHKYHuD4mbwnUXyR/MWV8=; b=cDDksY9UvLNDyg
	Bhh5Wv8n+W+a6sNHxTUXSxuFueD0DjEAgqV0HMviuvqwFEjH9tu+D1dOXHFQaXuVyLU9tRpn3CmvQ
	DAzcvzfhP65xX6Fta1Q9UO9OHHVw3DO+6SNUYFg3sMD8rivXrEkUWXnJLzV1LxhS3X1yGmKCGNdjH
	eo22/ucndwNIutp7krz5e/sgQxQS3Qvaii42DP8xrF7CF/g3ylGT64Mh8od+iYHDPjl2GmLVSU8kF
	g9PobT7UiarYAJCNbTcWxoEqoMz2mR4NZ4Lll32AGYXvcsrE1G6QnZ9F6iXPL683JxPK4UB8BJRxc
	I06TGpRITBSxq5lUGZkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0p3-005owB-0D;
	Wed, 19 Jul 2023 06:38:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0p0-005ouN-10
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:38:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=IKQrnAAXrxm+V/7/n+4Qloa2USS24OYRqHFta7qvgAQ=; b=Qc3k6kkya2z08JNLxVEYAdX+IL
	yLO2gn7sTPMFare3GfKN3c6WtmetObZzmtgH8J8DvbKh+QF5ebnIgXJrTkFwg8b0sQGREqymJl1Fe
	4PN+7aHRT8Ejqr1N2n2px+BhyPKLEHh6GatsrT49jJDDEwHbJEGaKrcp9vz1tiZISdiwbyu3u+Ido
	7PTers1dmZqNSpQLmKYUBnhILWzZmMZrIlgi9x44sdvPyTlYPqgWF86YPZoV+vvMMmR//B8xhfuaz
	oQ1nReI5mkYUdrINLMZeRkGWi6ouqcFcAckqWTcz1JgqA4xj8fcvUZEIVB/7eaT0y3vvpgzrGZ8kE
	g/SfXePA==;
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLgOT-00BJpu-1t
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 08:49:19 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fb960b7c9dso8866286e87.0
        for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2023 01:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689670090; x=1692262090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IKQrnAAXrxm+V/7/n+4Qloa2USS24OYRqHFta7qvgAQ=;
        b=AeVsisMeDdKDMuBy4M5Ao2mQiTv19RMdqCBe8cETcF3jf7dsgpNOWeHswgA5cAJXuA
         n0lCzW9TLN7VFYDPpK0/ghORSyAZpNKOMAaPri84J9v6cpns3G0n+W2MToiOZc7lQR+G
         AqlqA8fx3uZJShWIFkzAYUhM7qISpYN2mfqjgpBm6NyxUKfai5rpGcip/aX7BAUm6bdf
         1Y1HeLl6CJyRJvoOBLI5RdZ6zgv3TuOFyZghIMH4atj3W7ZgH63MnoByoApnTrFSqcJT
         zhe/DXazrYsDJxRSr19dFQFpwRW0ANPsRulC3HIjfYjdTaW0tnK5dPfJ1wC4Wn3kVYyD
         0prA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689670090; x=1692262090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKQrnAAXrxm+V/7/n+4Qloa2USS24OYRqHFta7qvgAQ=;
        b=hcZcx4GcYisu6NbhEE0X9JSLwP5z7WQFXtvuo05GzjNzN/EbtdmDO3KNUBR/YL2BUo
         gBkc596afn0qTE5+YGMIxVyPta77ir/iW035/kD/V5tPgrQM+L+JnlAK79dGgp16D//N
         JCcrKcJsJwtMegC/DitUOnOr76NJRSqqkyrgbfQ1OOXBtqOnxNKthRYCekTbRLQ/X49n
         l6YP9KBtIy1ozxdwcp5p1MOzTkEsvVAzW/2X4rP+/JkS/CWtiWEb2aqzBE3xeKjKPkvq
         P5PmG2jGb+3cVFAIXXYaixSgN10+MOV4XsVopxVaVZkFrfKCDhiXTva0ZK1EUOyC9nJ3
         y3aQ==
X-Gm-Message-State: ABy/qLYTD+vLxEEqiY5ND10f4dHebML9t6hLMi0anFkqcCcR559kHMJX
	ngvaO5Tz1OOc0D6xrjvFfxc=
X-Google-Smtp-Source: APBJJlGLMz1ucd/cArxQa8D7T8E7JyE0jbBpbHOfVBFkSY3iVue31sdUVun4qUGBLZL/AtmlKuRdCg==
X-Received: by 2002:a05:6512:3b0a:b0:4fb:9595:15e9 with SMTP id f10-20020a0565123b0a00b004fb959515e9mr11844227lfv.22.1689670090272;
        Tue, 18 Jul 2023 01:48:10 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id m15-20020a056512014f00b004fb85ffc82csm340944lfo.10.2023.07.18.01.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 01:48:09 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] Revert "nvmem: add new config option"
Date: Tue, 18 Jul 2023 10:48:04 +0200
Message-Id: <20230718084804.20139-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_094917_848749_B33B77B5 
X-CRM114-Status: GOOD (  16.08  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyByZXZlcnRzIGNv
bW1pdCA1MTdmMTRkOWNmMzUzM2Q1YWI0ZmRlZDE5NWFiNmY4MGE5MmUzNzhmLgoKSXQgc2VlbXMg
dGhhdCAibm9fb2Zfbm9kZSIgY29uZmlnIG9wdGlvbiB3YXMgYWRkZWQgdG8gaGVscCBtdGQncyBj
YXNlLgoKRFQgbm9kZXMgb2YgTVREIHBhcnRpdGlvbnMgKHRoYXQgYXJlIGFsc28gTlZNRU0gZGV2
aWNlcykgbWF5IGNvbnRhaW4Kc3Vibm9kZXMgdGhhdCBTSE9VTEQgTk9UIGJlIHRyZWF0ZWQgYXMg
TlZNRU0gZml4ZWQgY2VsbHMuIFRvIHByZXZlbnQKTlZNRU0gY29yZSBjb2RlIGZyb20gcGFyc2lu
ZyB0aGVtICJub19vZl9ub2RlIiB3YXMgc2V0IHRvIHRydWUgYW5kIHRoYXQKbWFkZSBmb3JfZWFj
aF9jaGlsZF9vZl9ub2RlKCkgaW4gTlZNRU0gYSBuby1vcC4KCldpdGggdGhlIGludHJvZHVjdGlv
biBvZiAiYWRkX2xlZ2FjeV9maXhlZF9vZl9jZWxscyIgY29uZmlnIG9wdGlvbgp0aGluZ3MgZ290
IG1vcmUgZXhwbGljaXQuIE1URCBzdWJzeXN0ZW0gc2ltcGx5IHRlbGxzIE5WTUVNIHdoZW4gdG8g
bG9vawpmb3IgZml4ZWQgY2VsbHMgYW5kIHRoZXJlIGlzIG5vIG5lZWQgdG8gaGFjayAib2Zfbm9k
ZSIgcG9pbnRlciBhbnltb3JlLgoKU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZh
bEBtaWxlY2tpLnBsPgotLS0KSW1wb3J0YW50OiB0aGlzIGlzIGJhc2VkIG9uIHRvcCBvZiB0aGUK
W1BBVENIIFY0XSBudm1lbTogYWRkIGV4cGxpY2l0IGNvbmZpZyBvcHRpb24gdG8gcmVhZCBvbGQg
c3ludGF4IGZpeGVkIE9GIGNlbGxzCi0tLQogZHJpdmVycy9tdGQvbXRkY29yZS5jICAgICAgICAg
IHwgMSAtCiBkcml2ZXJzL252bWVtL2NvcmUuYyAgICAgICAgICAgfCAyICstCiBpbmNsdWRlL2xp
bnV4L252bWVtLXByb3ZpZGVyLmggfCAyIC0tCiAzIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYyBi
L2RyaXZlcnMvbXRkL210ZGNvcmUuYwppbmRleCA5ZGI4ZDc4NTM2MzkuLjNkNzgxZmZiOGMzMiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5jCisrKyBiL2RyaXZlcnMvbXRkL210ZGNv
cmUuYwpAQCAtNTU0LDcgKzU1NCw2IEBAIHN0YXRpYyBpbnQgbXRkX252bWVtX2FkZChzdHJ1Y3Qg
bXRkX2luZm8gKm10ZCkKIAljb25maWcucmVhZF9vbmx5ID0gdHJ1ZTsKIAljb25maWcucm9vdF9v
bmx5ID0gdHJ1ZTsKIAljb25maWcuaWdub3JlX3dwID0gdHJ1ZTsKLQljb25maWcubm9fb2Zfbm9k
ZSA9ICFvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShub2RlLCAibnZtZW0tY2VsbHMiKTsKIAljb25m
aWcucHJpdiA9IG10ZDsKIAogCW10ZC0+bnZtZW0gPSBudm1lbV9yZWdpc3RlcigmY29uZmlnKTsK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZtZW0vY29yZS5jIGIvZHJpdmVycy9udm1lbS9jb3JlLmMK
aW5kZXggNThkODkxOWU2NjgyLi5hMGM5MTUzY2RhMjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbnZt
ZW0vY29yZS5jCisrKyBiL2RyaXZlcnMvbnZtZW0vY29yZS5jCkBAIC0xMDI3LDcgKzEwMjcsNyBA
QCBzdHJ1Y3QgbnZtZW1fZGV2aWNlICpudm1lbV9yZWdpc3Rlcihjb25zdCBzdHJ1Y3QgbnZtZW1f
Y29uZmlnICpjb25maWcpCiAJbnZtZW0tPm5rZWVwb3V0ID0gY29uZmlnLT5ua2VlcG91dDsKIAlp
ZiAoY29uZmlnLT5vZl9ub2RlKQogCQludm1lbS0+ZGV2Lm9mX25vZGUgPSBjb25maWctPm9mX25v
ZGU7Ci0JZWxzZSBpZiAoIWNvbmZpZy0+bm9fb2Zfbm9kZSkKKwllbHNlCiAJCW52bWVtLT5kZXYu
b2Zfbm9kZSA9IGNvbmZpZy0+ZGV2LT5vZl9ub2RlOwogCiAJc3dpdGNoIChjb25maWctPmlkKSB7
CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L252bWVtLXByb3ZpZGVyLmggYi9pbmNsdWRlL2xp
bnV4L252bWVtLXByb3ZpZGVyLmgKaW5kZXggMWI4MWFkZWJkYjhiLi5lMzkzMDgzNTIzNWIgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbnZtZW0tcHJvdmlkZXIuaAorKysgYi9pbmNsdWRlL2xp
bnV4L252bWVtLXByb3ZpZGVyLmgKQEAgLTg5LDcgKzg5LDYgQEAgc3RydWN0IG52bWVtX2NlbGxf
aW5mbyB7CiAgKiBAcmVhZF9vbmx5OglEZXZpY2UgaXMgcmVhZC1vbmx5LgogICogQHJvb3Rfb25s
eToJRGV2aWNlIGlzIGFjY2Vzc2libHkgdG8gcm9vdCBvbmx5LgogICogQG9mX25vZGU6CUlmIGdp
dmVuLCB0aGlzIHdpbGwgYmUgdXNlZCBpbnN0ZWFkIG9mIHRoZSBwYXJlbnQncyBvZl9ub2RlLgot
ICogQG5vX29mX25vZGU6CURldmljZSBzaG91bGQgbm90IHVzZSB0aGUgcGFyZW50J3Mgb2Zfbm9k
ZSBldmVuIGlmIGl0J3MgIU5VTEwuCiAgKiBAcmVnX3JlYWQ6CUNhbGxiYWNrIHRvIHJlYWQgZGF0
YS4KICAqIEByZWdfd3JpdGU6CUNhbGxiYWNrIHRvIHdyaXRlIGRhdGEuCiAgKiBAc2l6ZToJRGV2
aWNlIHNpemUuCkBAIC0xMjIsNyArMTIxLDYgQEAgc3RydWN0IG52bWVtX2NvbmZpZyB7CiAJYm9v
bAkJCWlnbm9yZV93cDsKIAlzdHJ1Y3QgbnZtZW1fbGF5b3V0CSpsYXlvdXQ7CiAJc3RydWN0IGRl
dmljZV9ub2RlCSpvZl9ub2RlOwotCWJvb2wJCQlub19vZl9ub2RlOwogCW52bWVtX3JlZ19yZWFk
X3QJcmVnX3JlYWQ7CiAJbnZtZW1fcmVnX3dyaXRlX3QJcmVnX3dyaXRlOwogCWludAlzaXplOwot
LSAKMi4zNS4zCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
