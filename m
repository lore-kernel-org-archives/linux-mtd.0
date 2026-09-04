Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379C6C624DE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 11:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q0vwG5xqInlygiOi3AzOtg2Ww++2sqiu5l8tCDG5J34=; b=f4lXWx/anyxuiF
	tQ+aqh33rF4WQI/z2gnFRJuDEUq9wNg9CIH9MGcd6KqDz//saLyT61Xe53NfNenrQrcHYaMA/ar2T
	3mcH5nk7cgSMd6r/4aopLPP7+FK6EFfcFp7UIaUNww0eUVHlAUvf+ebY2jXMLMdez9V461l/1L3f7
	xC9faqGjzVmT34fCW2kVxGu/2d7PjHBdQb+rQuRCnsfbdLvtxN+Je4plqboT6NZ26LyRvWocIif4p
	osOk7w/FpRbQCD1cAda60YazQkl9WWUzs/XOJW/xlTz0MTQtBKSkjSG294wUXzVLAB9tXjaQtRWYX
	6RMyJkucWx/WgPh//8nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2S5n-00000001ozK-2TTF;
	Fri, 04 Sep 2026 11:28:23 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2S5k-00000001oy5-1EhU
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 11:28:21 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2d91518a63fso7027015ad.0
        for <linux-mtd@lists.infradead.org>; Fri, 04 Sep 2026 04:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521299; x=1789126099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D+UaSlxxJLcYKsp2FD1tG5uc8a4SQbta1aiPoRmuIHg=;
        b=c0KHuJ7tjuKygOm4GOkwpygMJKFMjj//V29fUSsvELnrQNCCEr9Rdt4Cektsymb+I9
         jmQmVWXhSB2XLhmJ146O9uE5b1cN3Li60psA5LQhbr8UPWhOhyVxq3cNvETPyoge/Ct0
         pVUcpRalZdx2wG/LBEfQm9yrWvhMCm6/Y0zExcoFSR8zmo44FCH27bn3V0/NDZ3XoIK5
         Ee2VrJUjg8+3YnyAYu/Qc6B6xZpe+Y3RQ73bsly12AbhmNxQHjVqk+h5B0BOLTzsgFWj
         0FyppaEGnl65nHByQ1zHXDnm2OEZ4eI5zCcQwqz7cs0J219OK1yPuK8wvgZ1QJzHJjVB
         hYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521299; x=1789126099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D+UaSlxxJLcYKsp2FD1tG5uc8a4SQbta1aiPoRmuIHg=;
        b=YrJVyc3W4cdoSxNraZyK7cACsSG5jXhitODFmQvqTO57y079qKqK/licBvH04hVv50
         6siemBMlT+P0q1fIARHugbFvOp6nnu+PPjUUuRo9Hr3QZnkADLDyUfaVihE4zJVLKIG/
         eM9CxTPMEuN3Fnbubh8ke4PTDD0QymdqZh8g2fgPGNiBEnv3KFEGmQru4DHtVsMyxtwc
         /ghyEqMa3CjShff5gFkztwIh685vPdGiNm8BeGPpx/ONeBWFnf6ZDyiqWCuBBvYkUe7r
         39fLUbFVIlOBRRNDnjQN5WJncAeHyEwONIvBjkFdBZ3BLzQXK8OXe8AwffGLTcSXt3AY
         Xl0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxKxF/5uXk8w/VACEdpkYq/fXFO1PblrTx4ZANbrILozivMebcAIlbAf8J5wvElF7bH44Rl+VSTCKE=@lists.infradead.org
X-Gm-Message-State: AFuF++mgMhL58Bn/t9dR1sg8/5v6ZxzozGwlsJQdyLJ6l3NLPXcDMETC
	UjKi7DZkq22SwmquCEQJnbaBiQdA3IOB7+FEB6pBH+MaP+q8Dge2kj/Z2xIiA5mR
X-Gm-Gg: AYBFou1gD+e19e2SY4UL0oDWl/I0dGaVbl0OpAVAFaxcVgfDOlYP/Kr8QEcCNg3Hw11
	rnghG+wnFUllLt7LNSqNiuovOmtXUOZJTQQ7RKmRDIhdauo1rZMTFBe9BaIKDRJJLgRKzB5gKYH
	LLxz8sZDW60FPL1YxGjsN2nFkqizY7JPad7OARCaCrCiQ0c6Q+98eUSYlOUW+vEigvK8XYNkkwT
	/s69YqirjZ7Q5bnhPRru9g13OGMkjm2+xDWAlENw+IlFhmWxIaufZaJu7yDZgM9l7i4F2qxrYWQ
	fKGyNVnxGYicrJgwviF9xO67MMvZJJHuXfD5Vr4mFZJ/h2a5UWBmQVpWaCnhtPmyslzuRgAnlwd
	IB3QwLjHOO4oduZKG0MAoQfYUdiQ5EJ65jB2/XswRkrtqUEj+fYWMkldqWOav3AcpvLp8M6deFU
	5sg5dzhMZpPtqyteEOcxd4pABKi0LNBtMjhdFXGn0G8ikXHYiqVzCCxVjE1uEFtQpiEPXYRYDRz
	oiiGLEAFGdbOOs=
X-Received: by 2002:a17:90b:4c86:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-39b25f78ab8mr7839413a91.0.1788521299198;
        Fri, 04 Sep 2026 04:28:19 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243a9388sm6005996c88.10.2026.09.04.04.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:28:18 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH] jffs2: fix typo "informations" in comments
Date: Fri,  4 Sep 2026 16:58:13 +0530
Message-ID: <20260904112814.6768-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_042820_332117_629B0246 
X-CRM114-Status: GOOD (  13.44  )
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

Correct "informations" to "information", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 fs/jffs2/xattr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index 6b4f68593c29..c91ade74c5a8 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -39,8 +39,8 @@
  *   memory usage by cache is over c->xdatum_mem_threshold. Currently, this threshold
  *   is hard coded as 32KiB.
  * do_verify_xattr_datum(c, xd)
- *   is used to load the xdatum informations without name/value pair from the medium.
- *   It's necessary once, because those informations are not collected during mounting
+ *   is used to load the xdatum information without name/value pair from the medium.
+ *   It's necessary once, because those information are not collected during mounting
  *   process when EBS is enabled.
  *   0 will be returned, if success. An negative return value means recoverable error, and
  *   positive return value means unrecoverable error. Thus, caller must remove this xdatum
-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
