Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C2ECC433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 04:18:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 736E7613DD
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 04:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 736E7613DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j+0AaSF7sjF07r4VjEdzrcC1XM/EhCllPLd5f2eAdL0=; b=h4jyQHwN96sLW9tC7eNUyTcVy
	J0UDIVTKfja/NcJ8Tn+ifsqaNGH7V6sKTEhcA66bCaV6C4xDPN8nY3FeScNbI3Utc0TWVwbq+b5aL
	MrhoZ4Vbf81XZS55hELsBttPTR9xKJYrllYmCMZf2766mtEzBK1Rdno2BoogOYKfdgIjYvkHIayfw
	MLUnJlSdntOAI8wt1JeUJSX6lfifygJJCrbJvYTXFlIp6fTbLlVWSswh5bNvj4xsPnfaSpgxInTuM
	OZk2UFZJZNE2TdL9a2QxQtiU9xeKkIciVlBOlN9jtnW26VhL9F5nqh8Bp5jKBj0189JzYYGUJrs+A
	WsGxncHKQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1le8y0-000BWq-Bi; Wed, 05 May 2021 04:16:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le8xy-000BWM-Kw
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 04:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=YRrLwnOYEA84tmg2zHBHzNkOy+wKecAskKm67bwSwqE=; b=II1QqwrdYbiisxbVEnZuSDgwX7
 wVBJfBeBhm7T9Z5bo+19MhYJZzPe8RLOQSkGP4PrCXmLQ8K9foPEJDayph0VG/50vPV+MsgtudNM9
 Yjyi3INB06FmGSM7SbSd1GQnNJxEgaGYMjPF6MWFTll9/G1IwyZwYH72TxvLaO0qRwt5kLqf2MbDP
 UBlUoStIgaV0w2i5Uwmqyt6Bhjx3PSb67im2TOv3HfYGK5zvIzIq1ISOvsMjYRV7rP5HIVVUPfN4w
 20omh/JxgqHhFyJOSCsQcVIlU7u0ZuZM2QliR4HMpib929YhHNId9nWQF0ke5XPcUsbCIKARYXmcN
 gA2vk7sA==;
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le8xv-004RzA-PQ
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 04:16:53 +0000
Received: by mail-vk1-xa33.google.com with SMTP id n7so224169vkl.2
 for <linux-mtd@lists.infradead.org>; Tue, 04 May 2021 21:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YRrLwnOYEA84tmg2zHBHzNkOy+wKecAskKm67bwSwqE=;
 b=onQE3U91ERCuu3PL2OXGXlL2WKJzu8RQ7RBjzSnMEXkGcU1aFljk++MdE9mmcIkh5n
 4OlfDAQs3Qb3pFt5q42crM7KClRQIVBnxfYrhklKr5+FoOdCDjW3Mg6QocMmijF9KR+N
 ufRQ0DPii0LAcFs4Qpkedokt7DJ314Tv1F7POs8aAJexI0+eb+j+L8hLvTVtaKiMjZZ7
 p2yjtlsZXqDkUkmbQlCw2KO5RgCWb6LOGl5sHCiqkhEP3UTdp1FeDJfc3wJci7/ULSWw
 DRqpteiduVZ89tuDL0Aj5cSUoyA2cdBZaovu4c2hU6FSwIlmA+Z6Mi/HTrxUMu+qUZfs
 7cfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YRrLwnOYEA84tmg2zHBHzNkOy+wKecAskKm67bwSwqE=;
 b=jex8KXkirL2yFDfe3nWZhkSn6cyKaEqO8WaEiw7bvu95mXfZcmv4QkIxLt5Iv4T7BY
 RrZvLEpeCdP/NJTpf9Kwj8LgEhGNkvSzS2Av1IyFtN4SV05Sfw+LwAlx685GI6wYL7Ko
 MrEVe6KMKAviNgyqTtj2V44bQjLDgcbkDn+GKs3f2yJGgB4Igtu9oyeMmL/kXjkCfHTb
 kWOrDtb5SK3x5JBlxUCh9CPWuWzR1zr9yEx4cPUUb3QDoAlC7DEPHDuoXnd42qeQipmm
 dagfbdCPTH4530Z9eWpB573o54p0qCx126bKZez2/WZ5xRHejJWREOrF7ZxjuPwq432R
 pH0g==
X-Gm-Message-State: AOAM530g12o0fziVXSAKat71wJ0kXxh+M3E19BrtbR9m7TEgGokdf2UT
 Ead2ddRecNaA3+ZK7M9EleQ=
X-Google-Smtp-Source: ABdhPJxyjHnyitCFbIaJA/K2U3QKq5aKlqAn1MAZt3HqbNpkLwVyh7cZBKubVpqZUmutcK6wSDhaWg==
X-Received: by 2002:a1f:e746:: with SMTP id e67mr17487157vkh.3.1620188210808; 
 Tue, 04 May 2021 21:16:50 -0700 (PDT)
Received: from localhost.localdomain ([65.48.163.91])
 by smtp.gmail.com with ESMTPSA id l1sm646405uao.20.2021.05.04.21.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 21:16:50 -0700 (PDT)
From: Sean Gloumeau <sajgloumeau@gmail.com>
To: Jiri Kosina <trivial@kernel.org>
Cc: kbingham@kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Rasesh Mody <rmody@marvell.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Gloumeau <sajgloumeau@protonmail.com>,
 Sean Gloumeau <sajgloumeau@gmail.com>
Subject: [PATCH 2/3] Fix spelling error from "elemination" to "elimination"
Date: Wed,  5 May 2021 00:16:43 -0400
Message-Id: <f1220eaedbc71ee8d19e35b894c21c161e7a33fc.1620185393.git.sajgloumeau@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620185393.git.sajgloumeau@gmail.com>
References: <cover.1620185393.git.sajgloumeau@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_211651_853066_E186E2D0 
X-CRM114-Status: GOOD (  13.29  )
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

Spelling error "elemination" amended to "elimination".

Signed-off-by: Sean Gloumeau <sajgloumeau@gmail.com>
---
 fs/jffs2/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/debug.c b/fs/jffs2/debug.c
index 9d26b1b9fc01..027e4f84df28 100644
--- a/fs/jffs2/debug.c
+++ b/fs/jffs2/debug.c
@@ -354,7 +354,7 @@ __jffs2_dbg_acct_paranoia_check_nolock(struct jffs2_sb_info *c,
 	}
 
 #if 0
-	/* This should work when we implement ref->__totlen elemination */
+	/* This should work when we implement ref->__totlen elimination */
 	if (my_dirty_size != jeb->dirty_size + jeb->wasted_size) {
 		JFFS2_ERROR("Calculated dirty+wasted size %#08x != stored dirty + wasted size %#08x\n",
 			my_dirty_size, jeb->dirty_size + jeb->wasted_size);
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
