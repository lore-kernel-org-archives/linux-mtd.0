Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB76DC87FD2
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 08:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m4CTs1iRKS5nCcRY2WJY97KkGW2keGtzCw/TRMVCTK8=; b=fHDxrM/2vV9lN1
	7U+yMhlUP4Hvh/Zgmia+BzyTPhvC6ouYx6Ko55EMwNE2SPs4Rc5sCWSPLK04xYiMGpjDdEEeUVx/C
	QLdzXWfkq/IWSAgu19KcChXywgnXwBouSvNbJekORvOTUb8CaxB+rJRa+/XHdOAwxJ2FDM4SaaDwT
	VA0UPvHefWotq0HyhjW5Exs7vI1TCAxsg909+BDym0HXQjrqJSivceMz/JM4uN9lgOM2f2rKNu2jh
	E9AIQJwcBef/2Whg4iF0zFnpZSVSLugjWnji16T3HbYfXHvfobDLTElwsGlmMVy3zn7zf62RlTqr+
	4j8SQKuId1Ss6941RgDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOJz-00000006vc1-2yZN;
	Mon, 11 Aug 2025 08:55:59 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNw2-00000006rPv-02s3
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 08:31:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-458b885d6eeso25231625e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2025 01:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754901072; x=1755505872; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wOtd9kWma43H7P5MqRsKQkGoPo3236xREv3Mb1e2gt4=;
        b=m9HYFxM0sE/8CXk//TGp01PRS0eh8sx3dMES25E0U+CqjP8cWm78ZC4HigTI7oxQoa
         VEawyELeVQDG9RhsmWjET+bxPJsf1TvZlzlvbsqfMg2t8s6TmDhujEJW8zXYXtzLsM3d
         ZSoBlzRvn43KckToGmSetQdnbim0ogh/ubf4sYPDcNV1Btv6eCiUM6HQlxc60YOJMBC8
         aupbdkyVhRyz/jA9KzJ0IieYg3O/f51qxDfdOl1NpLEGNhrdrQdT/O9Ph4J3EPPmLC2R
         UP8lsHlL42BPgJRkn4ytbQseXqwO6XNkbjAlmXk5AEYMcgIwyndmJ3MzXYi7QOHPg/UC
         soSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754901072; x=1755505872;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOtd9kWma43H7P5MqRsKQkGoPo3236xREv3Mb1e2gt4=;
        b=K+crXFfvjSBav8LMN9HB7e4KKFVGuP9CHrZDieOd+Qz2wAomDsVE0uwPmmhNaMC2Xe
         ezeWT6q7FKQ0/DbNrvMcxSs/5zqke6hKHY1TIfpVWUOn4z5nVjzZeuy2OGbJRYCp7dEQ
         c9DX/SZ0H+vgEq7icC12Rd9vP4+jkej5fsQbIcft0ameCXgeYhdrZaz+7uOmvVopoSa7
         Fyhi5DzkpM/PI6j8HUHcWMHpaBQ69TRFtzHCwAjxnmyvMWjFVWubgWdHXDby1LIqaR0j
         /SrybcmjbmSgzYhQZTV36g3uUtRIxkBsOBfESxde5oSUhkCLH0LjYcM8Ia0/CK5hTDtE
         JhQA==
X-Gm-Message-State: AOJu0YwHTx3Z1S2vBg6AM71BLgCQ7fz7CG0VUtscfMpjB8PExvjpyRFh
	sDBQj8mArFkoCT4i31OmUbCPfUOPGg6qgmoRbDV6TkXLPofhoRrtBxD0
X-Gm-Gg: ASbGnctqA7Q38tNJm2SbYF5T8llyQ8nf6r1Ta2HbbMlN61x/ks5oLgJv4cexmX4iT7E
	U7bJol7cNiLmn9/u12xc4RPudGJNsfhtwU2flvmkmfgV/Gvvi623GT8bdnnHe4NlQxkLIrATm0F
	ikQXZTv6DZA2cLwjwAgOYAUUwcRopX8ELMqqvZHDAgXyeNAY2eRTK33MrMChKQprVG8RPGJSTEo
	Eps1u1j0qWpJujD+un8ea+G74dHcLcK6treVdVt7S3h8iYNpksxy4ln6n3+cCReTebK0qSnHFbm
	vsWnpausUopNz0L/qKBPXU9KsM9UM57dNra11c5yK6ydP6ntYq3JfBKdCYKJ6l9zER+XBwHWVAl
	0ypZi6FCWs+ZGPWKYFMDQ66CSWlCJwmSLS3YVi0bjfThGZzM3/hs=
X-Google-Smtp-Source: AGHT+IFgLlz/HnaQehSt4Y6L68idWWxRSs7RRcM0JgVnx/De2YA7SJzeSHYNdYXnIOPvP3AWZzaJ6Q==
X-Received: by 2002:a05:600c:19d2:b0:456:29da:bb25 with SMTP id 5b1f17b1804b1-459f4f04f66mr107162695e9.19.1754901072370;
        Mon, 11 Aug 2025 01:31:12 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-459e5887b7fsm243580255e9.30.2025.08.11.01.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 01:31:11 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 11 Aug 2025 10:30:42 +0200
Subject: [PATCH] mtd: nand: qpic_common: use {cmd,data}_sgl_nitems for
 sg_init_table()
MIME-Version: 1.0
Message-Id: <20250811-qpic_common-sgl-nitems-v1-1-a71b5ece54ab@gmail.com>
X-B4-Tracking: v=1; b=H4sIADGqmWgC/x3MQQqEMAxA0atI1hOoxYp6FRkGiVEDttVmEEG8u
 8XlW/x/gXISVuiKCxIfohJDRvkpgJYhzIwyZoM11pnGtLhvQj+K3seAOq8Y5M9esSV21VCPhqy
 DHG+JJznfcf+97wevltygaAAAAA==
X-Change-ID: 20250809-qpic_common-sgl-nitems-9ce54a6d0c25
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_013114_057236_1DBF2DF6 
X-CRM114-Status: UNSURE (   9.34  )
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

Since commit ddaad4ad774d ("mtd: nand: qpic_common: prevent out of
bounds access of BAM arrays"), the {cmd,data}_sgl_nitems members in
the 'bam_transaction' structure are containing the number of elements
in the cmd/data scatter-gather lists.

Change the qcom_clear_bam_transaction() function to use these numbers
while reinitializing the sg lists instead of recomputing the number of
elements to make it less error prone.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/nand/qpic_common.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
index 8e604cc22ca310159edf4d8dbc2f6a82d5119eb4..db6c46a6fe01c71e8bb0379eb1f289c7e56701c9 100644
--- a/drivers/mtd/nand/qpic_common.c
+++ b/drivers/mtd/nand/qpic_common.c
@@ -89,10 +89,8 @@ void qcom_clear_bam_transaction(struct qcom_nand_controller *nandc)
 	memset(&bam_txn->bam_positions, 0, sizeof(bam_txn->bam_positions));
 	bam_txn->last_data_desc = NULL;
 
-	sg_init_table(bam_txn->cmd_sgl, nandc->max_cwperpage *
-		      QPIC_PER_CW_CMD_SGL);
-	sg_init_table(bam_txn->data_sgl, nandc->max_cwperpage *
-		      QPIC_PER_CW_DATA_SGL);
+	sg_init_table(bam_txn->cmd_sgl, bam_txn->cmd_sgl_nitems);
+	sg_init_table(bam_txn->data_sgl, bam_txn->data_sgl_nitems);
 
 	reinit_completion(&bam_txn->txn_done);
 }

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250809-qpic_common-sgl-nitems-9ce54a6d0c25

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
