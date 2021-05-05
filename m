Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01578C43600
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 17:07:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 762C76102A
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 17:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 762C76102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QyN6XIu1CCHYQ9X4AI0gijicZ+pHV3WJfE8BVJbyS0A=; b=QbVbrnZQekcHr/tYjfzGK55B0
	CurHWHPqjy6rHc52oW8RiPC0ONO8pSkgTGFXhlFEw5WGR49brO4S/tVAqb5Yu1iBm/PRyVNAUFb6P
	m6SYh099/Sa6Sa/MVuilEJx/wHPMQBXwIUK2Z1/u8J1FDr74hzpbagghj1C61RnAkO4CeF4Jk04pl
	Q6LdEBRMFr2bqZF6IYtG37Pgqo8KdvMYb0YsBz3F4kTqM0kx7yeba0K0ltitwDx9HRg0ZRIEq9Yww
	5HGJlTewR3jrD0XOS2lHVpfWBIqxx+ftPTCQnp2r6Das2LV3772u/f1K+GoeAt6K6oLpemNxqEYr8
	npyj098Ww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKyq-001rHB-ND; Wed, 05 May 2021 17:06:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKxN-001qmO-5o
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 17:05:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=sYEeOLVMdJz3if+0nTi25SGNzwSnRfdV3Io7PzqsWAY=; b=2NVHdtdQLU78w3+Xa6M14IOqxD
 GfEsiOBTHl8ULnm58QWMDwoL039Vifn1EtjghUDT+CS5OhaglxW56bEqf8aHcLbJKe3qyS94zrIV0
 cIt8txUZG5RNt5gwR32Q0/1DJ+PldsLVoI2OvxtXC08Nxffu+VdNMuVzKKU4rvAm7+q/PZ8TcPNUI
 DUhGs0MXvp7AqIIhqWuYZyv/9wqfNvjudvfd3BcjDV9+yt+dkXTbGqkUCwvsNulp/jNh9EhxapWnB
 Phe6Xwi/eQl1HGaoSb6hA951PlrxTnLyhqUysCsozAB1+ruaXOwKKegdSh5I+OW0kfUR0iZ/3+HC3
 TaGzI5Tw==;
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKxJ-0051rk-6k
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 17:05:03 +0000
Received: by mail-vs1-xe34.google.com with SMTP id k124so1471289vsk.3
 for <linux-mtd@lists.infradead.org>; Wed, 05 May 2021 10:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sYEeOLVMdJz3if+0nTi25SGNzwSnRfdV3Io7PzqsWAY=;
 b=igcImynuA/M1TcZ0veapxdQTiMFWzZpPDNGijnqz53FHtrk+RhzQg/KD+3pS94sV03
 3u9cW7hVGJOEH4684M2VPAGDCc9l0mDuRVB686o0tRkjzJtjislOCjxCUXITCPRCs0mQ
 NJq4VIHhxtSpVbUn46731dHY/JGMm2KTuJXhB8DwvuYCzyXvSLx6Ml2tjyGYYOHhJNdW
 x/nx4luIpOWWA+oQzZCi4yCZSIO8RKVgsk+u5zNFi2s5si8e2JZigPtwOcAMWeKKffMs
 Ft8LQdrmOrjDVAX/+qeLjqVTcVsptF7C52S7WIE39qvLCylWvvHRmBPIQZIoAw54fKgs
 FUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sYEeOLVMdJz3if+0nTi25SGNzwSnRfdV3Io7PzqsWAY=;
 b=MChU/Jd0oRkgSS5x5O/EcUs8HvMPF4C+4TKTzuvQIVAa8THcElqTweekKQDa1m0aPu
 Y71eMdd10+MV0W1NY97deJl/RxuWO42YfaZDEujBl6XHkO/ayOdy0NGgMkjAXKYM9Nx7
 ASqLsK332ozkpMnLrD0eP6Ba26B1sg9+IAuyW6qvXCU5uczrGbx17Wgux763w2mKWrUZ
 Y3ymhfSPnObKQQ8VcoPsUOJZ9tuvIQDMUcYSzrQnnnpYaCd8heU6gSwuAgjnS6TqMbR0
 ZcxihNcVtPOIxInX8nn5dDsuJVlBvg5l6jdrMx7eIdbcOb2bwy9VXEBs8MidCYbbUU6M
 tTNw==
X-Gm-Message-State: AOAM532x2b9kHAlWASTofPu3TIAgD0LzYG7tryoscUPAWAi3L3jRWYTF
 COAxavI48UOwYphSPELp3+o=
X-Google-Smtp-Source: ABdhPJwuXxIGNqXTCgID7QEFwCSKqjed/v4wtKtvUbJildsk5rUhoLuZWOxxHZaE0snfuWxSWyGkhg==
X-Received: by 2002:a67:f5cc:: with SMTP id t12mr33833vso.9.1620234298716;
 Wed, 05 May 2021 10:04:58 -0700 (PDT)
Received: from localhost.localdomain ([65.48.163.91])
 by smtp.gmail.com with ESMTPSA id r12sm2224099vsf.2.2021.05.05.10.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 10:04:58 -0700 (PDT)
From: Sean Gloumeau <sajgloumeau@gmail.com>
To: Jiri Kosina <trivial@kernel.org>
Cc: Sean Gloumeau <sajgloumeau@gmail.com>, kbingham@kernel.org,
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Rasesh Mody <rmody@marvell.com>,
 Sudarsana Kalluru <skalluru@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sean Gloumeau <sajgloumeau@protonmail.com>
Subject: [PATCH v2] Add entries for words with stem "eleminat"
Date: Wed,  5 May 2021 13:04:50 -0400
Message-Id: <b636dedea2c2ed230bb3d53f45a523eb0f5dfbc0.1620233954.git.sajgloumeau@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <6a526dbf75f6445f3711df0a201a48f8ac3149cd.1620185393.git.sajgloumeau@gmail.com>
References: <6a526dbf75f6445f3711df0a201a48f8ac3149cd.1620185393.git.sajgloumeau@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_100501_283452_81CD5418 
X-CRM114-Status: GOOD (  10.02  )
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

Entries are added to spelling.txt in order to prevent spelling mistakes
involving words with stem "eliminat" from occurring again.

Signed-off-by: Sean Gloumeau <sajgloumeau@gmail.com>
---
 scripts/spelling.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/spelling.txt b/scripts/spelling.txt
index 7b6a01291598..4400f71a100c 100644
--- a/scripts/spelling.txt
+++ b/scripts/spelling.txt
@@ -547,6 +547,9 @@ efficently||efficiently
 ehther||ether
 eigth||eight
 elementry||elementary
+eleminate||eliminate
+eleminating||eliminating
+elemination||elimination
 eletronic||electronic
 embeded||embedded
 enabledi||enabled
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
