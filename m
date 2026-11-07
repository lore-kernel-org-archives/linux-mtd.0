Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C73606D80E
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 05:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gu51SeYh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GmcxtxRn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ECjs1OoCDu0LS8GMeCYcmkIYYra3agz1tVUy4/FBCao=; b=Gu51SeYhSFeeBLFRG2KSQz+HnI
	ZmVt8c1mCiuFYBn5dZiyD9ySKUZgXuJ3xZagPB8nDLcM1zWTBDSewX8fKglHEIyos8fTbq/mMsRcb
	/i2/Hsd5uYcdVa5ZvPNXQaYlD3uf9vWfKH1XJP8tVmSEtvfeXzi7GLgpRb/XEChFrf0dzDOdHjAEa
	MOLh7IhdiPtOG7FYLHaJpLhELCjS9OA3fyEm8420OOtkrGodq21mBEmxq5R7BEsF7XPqiY3EFD6GQ
	THkrWQthJI/arZFjnGygtmVo+dDWkKSy3fFLBKulWWsk3w7+Wggb7SSNfePy3onGh8nZ4//oh+qkC
	KSf3Wi7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPYrA-0000000EDu1-2Wqc;
	Sat, 07 Nov 2026 05:20:48 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPYr7-0000000EDso-2Oek
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 05:20:46 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-4b190cdc9feso772883b6e.0
        for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2026 21:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794028845; x=1794633645; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1C7NKpuGv/wKA/5W5MbBMWRwcogQYVy0tjrhwg6RUVQ=;
        b=GmcxtxRn7OsWPneoVbKDqzcATEe26u4bd6mjVUUY1+YBIk93HDLqZ0Mjjn+Ava/A9F
         9QOqBVDifUCivJQBYI/JPghP0eNACLnPb+Yfdx3fB5ZDlca4p8oE/oOLQMhHwtVus5nw
         mTEBB9F+IhekxEyMYrV50TcwDXlyTWL2pCcGAgHGsAMXeahU4B7zAI7hZ/4WX2hSq7dh
         En3LDVYoPLy/yKOWSjvb6AYnHS7N96+UTh6t+Y/9IO1DOOg8wYs1cXp40uIGHdh4BKjc
         rnJxge1vsBgqNgk6RflUxrZsEyBjUm3kgwrTj7bNfqMx/lP+dnCUDHuqR2liZT5rvp+I
         ng4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794028845; x=1794633645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1C7NKpuGv/wKA/5W5MbBMWRwcogQYVy0tjrhwg6RUVQ=;
        b=tvmg8Eg2DEi8Xum3J+fg5EkKkVkTlm6mh/JvBt3l1lYBeI7Wl+FN2ZkCmkGvBEzgun
         Bm7MkR7moadjm1A5+fCr3OAqsIK/TDDbT2MDTirtpz4HXPb38woaygOym4RgUf7OEyyE
         wme7iNSBOdivHA3pMEIzSX5hawITEk9Il5T/rUzR0s+vAyZcllowxic4k5rb1gsF2oBB
         IPIcZ8hHkkxGR7AKaCq2SEhFsaOabJySLKI9T3djgVmTWK/Ljrn5anahgp2jJvJo4DmH
         7DfziEqDyz4CxKOw5KphI7GQLQjLLopJKQu/YEan1RHRPWj8CiTlcpHwlPsxfPEtwioh
         QZ2A==
X-Gm-Message-State: APuU4Z+t1ykTbFKX10qgmfJ2B9rKy6Eb47uuVFbGlYgKxnH+yrj3R8GJ
	TxOFn0YBZ0YfJpFXh6tHGQjFeGGOeLPh4F2LrfxuFmlADQBEYSdMxgN9
X-Gm-Gg: AYBFou2iQEUIqUv6ZyW1wigkUih2YndekvndKVwT1Up7bfcBg/IdaxIuh4Xn20sSjg9
	bC0fkWRt2f0K0BymGLkfHCt7Jv/Rnl6d/AZOxEv6pOk4hNUzuQhR+ppcb+3Q9NzdpuwwVE5R06x
	NUBnh/u1yPKP/k5OUSxIGKdFrcuXO7Bqtm4ZVgOYnxoMJUvHISHF96uWLzBPx/BDJQRuF2R5tVs
	zVl5zIUGt1ezmEurqlV+O+0EoODW9GQ4IiexQkgs6KYW0ZQMIIVqeV+1XD1d7SNsjc/OCklzqSZ
	+SbKIc+8f4X2wtPQYpEyv1RNxoiSHGEm5f3NzJiWEiqtNitqwD7PIN78+qxFYaBwfwozQXd0LjH
	fWQ538s/nMisD0OPiJDZQrcnSY7JhbWtPuUbdKCd5aoUJtvdh53bs0y8zm9ufjGKC3wppgFEHKH
	/VleeMI/yeW6yjzEuelFafFjXC7oaUbw2Y99e3qBcjVUE+u7cVeOptsabBtPFpO4IV5rxDIu/kd
	Qd8kZG5CMUuFJkjIPZBLDeE1bTcnJb+ImSoL+lXNLYh52duJf5xJR862HD9xATskObfzknUnwXC
	d2oGtRd8vH74YxyB9pbn0U1Cmc9zXxTBByP1Gl5sS3IRi6vYjDLetlfoL1YveMzvo5WWNa6saxY
	DJ8GUfU3OXmb4z+ywF/Zwr0jhId1fiVRSTWn1Zqjfvmng3wV1d8FhmKvWhzBcnLxXdf3UJcEoxs
	SC6e8IVwjsKpuPLl+aseav32bEAtOdgQUqubNeDaoVuUfXQXzkeE1z3w==
X-Received: by 2002:a05:6808:1244:b0:539:4d53:1708 with SMTP id 5614622812f47-567e15e074cmr3293716b6e.49.1794028844621;
        Fri, 06 Nov 2026 21:20:44 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567e7ebf4edsm3059846b6e.13.2026.11.06.21.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:20:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 06 Nov 2026 22:20:40 -0700
Subject: [PATCH 2/3] mtdchar: bound OOB reads to the data in intermediate
 chunks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-submit-mtdchar-page-chunking-v1-v1-2-2973a03531bc@gmail.com>
References: <20261106-submit-mtdchar-page-chunking-v1-v1-0-2973a03531bc@gmail.com>
In-Reply-To: <20261106-submit-mtdchar-page-chunking-v1-v1-0-2973a03531bc@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_212045_710430_1F2D8CC3 
X-CRM114-Status: UNSURE (   8.25  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MEMREAD limits the data and OOB lengths independently for each call to
mtd_read_oob(). A backend such as SPI-NAND continues reading until both
streams are exhausted, so an intermediate call can read OOB from pages
beyond the end of its data chunk.

The next call advances by the data bytes transferred, not by the pages
visited for OOB. If OOB remains, it starts again at pages already read
and returns their OOB a second time.

Limit OOB in intermediate reads to the pages covered by their data,
as MEMWRITE already does. Leave the final call unchanged so SPI-NAND
can still return additional OOB pages when no data chunk follows.

Fixes: 095bb6e44eb1 ("mtdchar: add MEMREAD ioctl")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdchar.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 19d33dacb62d..189e462a9df0 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -769,6 +769,9 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 		if (ops.len == mtd->erasesize)
 			ops.len -= mtd_mod_by_ws(req.start + ops.len, mtd);
 
+		if (ops.len < req.len)
+			adjust_oob_length(mtd, req.start, &ops);
+
 		ret = mtd_read_oob(mtd, (loff_t)req.start, &ops);
 
 		req.ecc_stats.uncorrectable_errors +=

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
