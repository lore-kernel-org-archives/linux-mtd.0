Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76858606A320
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 21:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hibTBiBA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KAGT2Qk8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ihTcjVJkMmJXjqpU3EO1iKzdzSsq6XTV6rwwSurTwoo=; b=hibTBiBA2w7x7qVVmjKmSbqt4B
	eWVpoBZT+tqfh8UmGLQvOLygiIdnFzKlspEUlnP8ABW+6Dp7DC+xLK08qvrM//kfeb/Q0cVG+9amr
	o9X0MqzU013a9OMroBSh0F+foOcDNCRTKENeY6oSO44gW/cABNehhdctfXEFeIfMrHub50LKxhVgo
	LR7IxuQrkOSPkQ5ZyXfVMzFaNIPlOB9WAVAbPLCCuLRyTqluf5iqIss6N4WhF5EF0GBl3rJ+1JBfo
	mvxipld1XOyYpWWhDKm16VelvhgvPLcSTpYTVX8cWjPDcIqTnw3LnHXO8KX+N0ntGszCJKLX+gIic
	pZxZewpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTnOf-0000000ALOt-1ypv;
	Wed, 18 Nov 2026 21:40:53 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTnOc-0000000ALO3-1gj2
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 21:40:51 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1372390f8f.2
        for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2026 13:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795038048; x=1795642848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V2TQ5JY/IVs2S8RR8BAhrV4k+I9Ja4L1F05T35wN/6Q=;
        b=KAGT2Qk89QsLOzCDiD3AmqkYMEDcz1YJVZ2yfPqTiA43rFQhKXyROGoJ2y1V4JtfAd
         BVQhg8G+on5cjCk290BWjrwSxpdZYUtQnmPrgAMUBVJcH/8+VT48RlsICPbxWDtStw/Z
         lJHxYq6lb8XCWcQxTJUxfPrjrKYUqBOWT3sdR05XzKmcUf0qgDNcD7cPlN8jcB3iLbXy
         WNy9k9o0i+y0i7wtjoBuilticigbQKSLi8lVvPmNRfhIn1pZjI5V9CEiLovc9F/09ynO
         0TEHfL+yt+QpmY6kfcqQ2jfec2E5Iqtrwao0ZbwrnkdNFZanewffmjJ1u/iP6id/wBrB
         pLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795038048; x=1795642848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V2TQ5JY/IVs2S8RR8BAhrV4k+I9Ja4L1F05T35wN/6Q=;
        b=DSlauOGDkOpGXLdzD0VEaTOGrEXvweh0jurZzOqjuoQGdWd1P4rLgZhfuMTnkLWXrJ
         lVBL2ZbdAtbXtnZT3Bwdnu4y3ax7E6eR16nusH8TAugrNtPGTqiuYDsFbbVQxZ1b8V7K
         cyKLJLuyLrN9ckdTu0t6Lp5qIQdBeMuWkvgW1pt1dFS1WJx7pXFoRj7B41n4D/F3du1P
         oe0N0dza4mjb2C5QPfQrpSsS8U5bM8Sb5LMGMGSn47X2qxTcMeOW3/Ze3qvQEN20WL0V
         oq1WAu9dXTYTCi0HOWuqlXUYxaNXcAcLhLgwLSwMrDAOCdbuMaC2wvkEot+m+D2VkcS0
         Ds6A==
X-Forwarded-Encrypted: i=1; AL+hErEhM1qmwhx3THFOVd3ZlmLt2KJKcx1AzQqbaAD/Xm2778DNTkwLQ30b3iXYeDSSBNAGsEICpcmyhIw=@lists.infradead.org
X-Gm-Message-State: APuU4Z+aDu8Jwfl8vo4JmA6XsGTSySnTZf9GaJjVqc37SZx13VZuoMoR
	BrsnAcvsuIFQRVH9DXd6fkOpuMiqryo4JcBp6bRYdfrmAiI0EgTGPeKS
X-Gm-Gg: AZFdTZdH3VRIZ2wwibTZkflV/sty+uuspXUHkqA1KvKY+BmDR/xsookhuWxKrpiQYlE
	MBMNnH0S/gFyqvK/kA2CbdpobxJzU3nYKVJC5aEiAU4j4pAZVbBcUDCRRhSxbjZCgqOu8gy+aeJ
	QRzGNuzv8EUwwPvP1SjQhTlPcfT+RXWAV4u8O9oKhgulKhRQkeZjmLWauPwjqNOAczY4lSuC+Vn
	53DzZw+8sSPpMGKVJT1PGy7IxL5yic6Sc9X1FY8V1ZJmQ7FG4sHZCxN59Js6+aQXiaEnRACTjD0
	BEc5K14QnHwzLfrg+zN8tna2gR0hBzrilKFz2zp1XQfsETdNP9vCWNN0Liul6FCm5YUVx0OCQSC
	F7/dZbe4ud/1FunZs06EFbd5yeefWC6kc3VUdgLLgiAqcfuxOXM+wIsIvi5Oevq+WbodWLsaOPi
	pWxLq5BY8Xe6MiZwL/k/AlictZOc4sfHyUmJMAK30U8L/XmLM2LOxKne/jbzOJ+yAnAmk8b/2I0
	BT/NNiIJl9YMxyRWcYNZXzQyhazZcYuOqvG6cO4S6NxYLi/9aJSI7J+zG5V0mYeVz7ttmAiU5Uu
	ODMRyXaGTJlvsXJOWXuOjuAfnienXcGJBCIOJ486aOn8Eycb82hh2jKjEvs/3aXG+bNgVmZhoXK
	wxrRgez+jmxY+DuZs4s6mwRKOcrmU+wWNw8EVKXT6j0WhUQo=
X-Received: by 2002:a5d:5f42:0:b0:4a7:9630:7b4c with SMTP id ffacd0b85a97d-4a796308123mr6018312f8f.47.1795038048353;
        Wed, 18 Nov 2026 13:40:48 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c3c6sm6361300f8f.19.2026.11.18.13.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:40:47 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: dwmw2@infradead.org,
	richard@nod.at
Cc: miquel.raynal@bootlin.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] jffs2: reschedule between the data CRC checks of an inode
Date: Wed, 18 Nov 2026 21:40:45 +0000
Message-ID: <20261118214045.107562-2-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118214045.107562-1-orgads@gmail.com>
References: <20261118214045.107562-1-orgads@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_134050_460403_65CD2917 
X-CRM114-Status: GOOD (  11.60  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The first read of an inode checks the data CRC of each of its unchecked
nodes, all in one call. On an Octeon board with an 8-bit NOR, a
46.6 MB file takes 13.8 s of kernel time there. Without kernel
preemption, nothing else ran on that CPU in the meantime: an RT
watchdog thread missed its deadline and the board rebooted. With
this, the lookup takes as long, but the watchdog, the per-CPU
workqueue and the other tasks of that CPU keep running.

jffs2_get_inode_nodes() already reschedules per node while it reads
the headers; do the same before each data check.

Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
 fs/jffs2/readinode.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 18a47b432..bfee9e57f 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -39,6 +39,13 @@ static int check_node_data(struct jffs2_sb_info *c, struct jffs2_tmp_dnode_info
 
 	BUG_ON(tn->csize == 0);
 
+	/*
+	 * A large inode has thousands of data nodes to check on its first
+	 * read, and a slow flash takes seconds over them; give the CPU
+	 * away between nodes.
+	 */
+	cond_resched();
+
 	/* Calculate how many bytes were already checked */
 	ofs = ref_offset(ref) + sizeof(struct jffs2_raw_inode);
 	len = tn->csize;
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
