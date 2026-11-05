Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337DB606A328
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 05:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y5PbbAGW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nCVL9SMP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=up3wG+ZDUfYM56pFMUIXKSfS1heTTM1/RdOWqQuZOu8=; b=Y5PbbAGWlPbqP43N05mthWffh8
	jhGmZxycVrCa9k6yiwbednEm9vLFKDCxE68ju1cT0YHp3vqRgGr/PkZwzSdsdfA2q/UXjiBe8/3Dk
	uEI3nNnZCN1WNqW5BpY/4fGDZdFQgJj1bYJ/YA2/NJGd+czN43HsLrM3c3DTKhvAWzyXgo5pQNAVr
	nXVn5h6nFixZnb4VO6SEt61zPW8LFBcVeyhn/6LAmthsG8xXxwQkmcCWcVaBEai3I/TtMLWUHguX6
	hJMLupkR+Ar+b/cHgLeGSNDQibF4xAsm25vka2zyhJfeonnfZkyN2iGxOKFrs7SfurrS8DR/iEatx
	U08zzryA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpdj-00000007qFy-3Yr4;
	Thu, 05 Nov 2026 05:03:55 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpdg-00000007qFb-1cuq
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 05:03:53 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-8253bc5a613so999400a34.0
        for <linux-mtd@lists.infradead.org>; Wed, 04 Nov 2026 21:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793855031; x=1794459831; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9/MyriLLIFlAEHMufWPIWBvD7cPvXwMz6qb27EKImvY=;
        b=nCVL9SMP3bJTQSoRJyunh8fxVNi9TRdzZXFb6wsYfl5+JXclGoHpY7mG7HyBtZZlKr
         KLifGXONVSKWE1xxxP4reYJu6T4M2we0XbvljNsyz8Vwh8EQLBkA744KYCESZxn5mAZZ
         n9GoOXok0Xbz+7vaQ2S0qVlizsPeeDrerQzqLYgK+OnP3Zn29BPTYCnbdOyUWMu2E8Dc
         QfUgtx9qwt09TLnhE4WkgVAre3iG0LIqhKgOdAvdzKUEQU8OaTchGy1PfMpn0fHrUqTp
         nYwom0wuW/wsT8P2PfolYuWyuiz8Jch68MXxmAdDY45MgocTsbqnTEs+NPlreobCy05X
         gupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793855031; x=1794459831;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9/MyriLLIFlAEHMufWPIWBvD7cPvXwMz6qb27EKImvY=;
        b=JVi26Y4imOarh5ibx+TAZG99S4mC8Max/kXbM7kELCIz9/WjHt/q0xVncXMf200EIQ
         mZnBCqHWyTIRJscE4k6XqhUD3kRp7/4uy9xzA60fcbTjniAEzOvPI9KcuuVS58KMTuaH
         j2TvTuFopUyJuEaLXdF4wf9FGyEd3EC4bdgzM/7Do8O0rQxC6uXnpcI80Ue/l1qsmjwW
         hWz0D2HopJjWrMrV6TiTMnVDy+ZfeZCJWCoxb3T7/wLC7SWu7YO9Cw6lG0xPedzLPN4J
         7Z451yMyE0x2ywGlqSLeNxATCwYbuxH+xeNSLKXTN9lnPYSS9EM7hZ1BeId8aO5dOCVM
         k3iw==
X-Gm-Message-State: APuU4Z/bvGWxCLEMWoxMzqQW566WvhB8b4jJ/ny52ya6TnwoILTuZ4rw
	Um5hLmsy4JlHF/v2D7YgxJ+pWl0Y41J6ifokyj8fYdy4C1giVJcFuVIA
X-Gm-Gg: AYBFou3/28GhaLMh+2uS3l6zh0NN8knEazoUFiDgoRNNrtuJDDMtSUuupwvXJ6EgqJ2
	Lnc/cuOkf/C/g0kVWbCRrKLdIvBunswA9PyXsa6HtvAfGs9ilsMtcvMNdGHWxEQ6Wt3dGlWaXKc
	iohtIOjjY23x8dvm1682ecytfXcIFbFL+5oCoRwNPRZDDhIK5vDYLNQHy+Eg8Du9EWsWUzDsG1h
	30UuMMsF+Pop7NKIolJnAcSc3PQzUK+7y9GVT0YS+clzynieXux3iOJvnKf2QLJtbAA0XMsi0vu
	h36UdHN86KQQm9nXWxebqL6B6I+SUf5bB63GZ3E5oruzG4zikBdNq06txOKIrn48FD3fryLjgVy
	JV0hzg0cL7kuFupxYkEQEmBvXtWYmYy0a9NT+nEdFaeKjvfDqsu5ySq2TTJrYJfv+QULhDoWNNH
	mq/YT8/dGTsNKnSm1ad5jcjjDFhKp9xsWq3+CTnEyM+vOSHRbuOJXjupH8UEl9mwcnq/1zB5O8p
	iLxAFJcDbFnKcCdCMw5ZfXohO9K590xlb98DPbQkM8H6tcBdKnl0J6GlsgLZEykxm2MT4vkn4Uv
	jwYkK7WBLrJawwW/bN14CpaQ8y53g4kMOL1wVmTkMjfcZlNq6/odYw+qIUxGVj0Ye1OULlNAsxn
	Ju0ifkdRoE5M+a+RRXH+QokGAM3QcwNF7VLK1bgSiSmfqoKkLXeF0XXIcVDq0qPwtUmMF6hD3j4
	cLkPB3gxewYei60xZyuVIvky1NNVWmI760vwIte/boLaE1r2Dy3Aw=
X-Received: by 2002:a05:6808:191f:b0:556:82f5:5aaf with SMTP id 5614622812f47-5640ddca454mr13902714b6e.49.1793855031069;
        Wed, 04 Nov 2026 21:03:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9fdfa53sm3256982b6e.15.2026.11.04.21.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:03:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 04 Nov 2026 22:03:38 -0700
Subject: [PATCH] mtd: core: skip empty read and write requests
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261104-submit-mtd-empty-io-v1-v1-1-3f6bcf474e2a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5FMBBA0V+RWZukgzTyfkUs0MFIirQlRPy7P
 pZnce8Fnp2wh19ygeNdvCxzBKUJdGMzD4xioiFTmSZSBfqttRLQBoNs13CiLLgT6kZp05a6oJw
 gxqvjXo53XNWfYzlxF/43uO8HzgQKvnoAAAA=
X-Change-ID: 20261104-submit-mtd-empty-io-v1-6a06db864131
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_210352_461690_C3930D9D 
X-CRM114-Status: GOOD (  12.60  )
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

Converting mtd_read() and mtd_write() to wrappers around the OOB helpers
removed their zero-length checks. Neither mtd_read_oob() nor
mtd_write_oob() stops an empty request from reaching the driver.

For example, the raw NAND read paths select a target and can read a page
or its OOB area before checking the remaining length. An empty request
at the end of the device can therefore select a target past the last
available one.

Return success from the common helpers when both lengths are zero,
after mtd_check_oob_ops() has normalized lengths for absent buffers.
Keep the existing range, write-protection and operation-support checks,
and clear the per-request read statistics before returning. Both return
lengths have already been initialized to zero.

Fixes: 2431c4f5b46c ("mtd: Implement mtd_{read,write}() as wrappers around mtd_{read,write}_oob()")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/sashiko-outbox-198544@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdcore.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 491a27d0315f..93e7ff3ba8a0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1805,6 +1805,9 @@ int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
 	if (ops->stats)
 		memset(ops->stats, 0, sizeof(*ops->stats));
 
+	if (!ops->len && !ops->ooblen)
+		return 0;
+
 	if (mtd->flags & MTD_SLC_ON_MLC_EMULATION)
 		ret_code = mtd_io_emulated_slc(mtd, from, true, ops);
 	else
@@ -1849,6 +1852,9 @@ int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 	if (!master->_write_oob && (!master->_write || ops->oobbuf))
 		return -EOPNOTSUPP;
 
+	if (!ops->len && !ops->ooblen)
+		return 0;
+
 	if (mtd->flags & MTD_SLC_ON_MLC_EMULATION)
 		return mtd_io_emulated_slc(mtd, to, false, ops);
 

---
base-commit: 1c1a342aceec79528b3ba51f376eca2be5928fe7
change-id: 20261104-submit-mtd-empty-io-v1-6a06db864131

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
