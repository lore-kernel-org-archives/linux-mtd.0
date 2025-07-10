Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83492C83F09
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jul 2025 07:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jsVMeLFNl8T7TIPlCv66T3VSbQ+aV6wB+rUUPB6heWc=; b=EOamxZvNlcNP32
	1cOFy1R0neINsZGuF2jVbQgPWiVWF8JEWjokDQHnupjK31XQjXruEVk+sbFuUFGjiMCiN+bTcei0z
	ebjKHcKVDMoxH9TV0XeL401wCAVzM9R2B/a+8o7EogZp+XSbZnwXxO5I9/84FMlstZVskp3Rj9A+2
	XHQxH6B4SEyU89YOIlGkkRV1YHQcNNTX6R5cl1cJDIwwGXcKxK7uCctnZ9qbDhfgp4DMMlBWtiTKT
	Ze8LbvfSknK290pkJJGv05nSStekkyAqElNgrDPO9EWe0ku+unU1Lfp+0G3nGyLRfTC96yjUkz/x9
	OEeyIgbi0Q3ssRG6cTTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlV1-0000000AyJi-3lun;
	Thu, 10 Jul 2025 07:15:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZkTt-0000000AokD-40iG
	for linux-mtd@lists.infradead.org;
	Thu, 10 Jul 2025 06:10:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2699DA53F4D;
	Thu, 10 Jul 2025 06:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A372C4CEF7;
	Thu, 10 Jul 2025 06:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752127804;
	bh=c0LblWZjHtA+pSM3OGRGzXlBbR2Gy8KHxtMN1dzIorg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gooy9tEnWaUjAMYDxpZ1+MvVzB2Bl/WqS7VxX2kK5a4rhcDe9g2c9LPur896JqQGM
	 Q8pv+24fuPNDwojiVqYEnPDCe8W+zZ8gF4ASRIkhQjZQwYNCwLI6HJO80iU4dwrs2/
	 RrCsJN/+uCheB1eygag4QHchL1Nt+XDk7PBsAWzOsPTEi1xyX+fXlgU76g0Q0Q2Nyp
	 huB4eTNiObsmAuv/KSBxND1pVqKke1J6BEccZSbuMRUhdBOSVwfnXp1J3nAh3MgQ+D
	 XcWzwk1EPhFois5+o38tvnnb8kvkZPWKQ7e9n9EVqbKWweKlaNIafpN+AN3g4q9Y1L
	 a/tfsbLCWpMuw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	Yuwen Chen <ywen.chen@foxmail.com>,
	linux-mtd@lists.infradead.org,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 2/6] fscrypt: Drop FORBID_WEAK_KEYS flag for AES-ECB
Date: Wed,  9 Jul 2025 23:07:49 -0700
Message-ID: <20250710060754.637098-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250710060754.637098-1-ebiggers@kernel.org>
References: <20250710060754.637098-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_231006_062522_11D61400 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This flag only has an effect for DES, 3DES, and XTS mode.  It does
nothing for AES-ECB, as there is no concept of weak keys for AES.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/crypto/keysetup_v1.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/crypto/keysetup_v1.c b/fs/crypto/keysetup_v1.c
index 3fdf174384f3d..75b0f1211a1e6 100644
--- a/fs/crypto/keysetup_v1.c
+++ b/fs/crypto/keysetup_v1.c
@@ -57,11 +57,10 @@ static int derive_key_aes(const u8 *master_key,
 	if (IS_ERR(tfm)) {
 		res = PTR_ERR(tfm);
 		tfm = NULL;
 		goto out;
 	}
-	crypto_skcipher_set_flags(tfm, CRYPTO_TFM_REQ_FORBID_WEAK_KEYS);
 	req = skcipher_request_alloc(tfm, GFP_KERNEL);
 	if (!req) {
 		res = -ENOMEM;
 		goto out;
 	}
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
