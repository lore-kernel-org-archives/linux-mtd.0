Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACB9C636D3
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Feb 2023 12:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T0DXsLbS+KbsziQkaAnKPiD1NwJIzAs6rhu3UeuSIPU=; b=igkWfgN9E3vOkV
	ZV0E6X1lP6NvwuJk3YA/C4eNhp2sbtvGl8jAXU1Odhef1HtE4c5IDlED8WhxT9aakDEr7lhdM5uYH
	i2hWcsxOeyEHpJL8UAEap0gAADIAPR9AfxUuJL4wWmmAUiR7UzR7gFilSrMEC/R9asn0g2BZ1E09T
	NQcCxZrzQ6AKzEjsZDGhyaVmp/VP/ZAii7GgbJDRRMEDRk6Y9+zi9vdCGdvy7BPsWWWwq42T3AdiJ
	VXu/nnE/Gw6s/4lfxkk3U6sxppSbMwFLLQKw9W/C0Gdy/XTcPbeZhd0QAdeDZFR8oZFb8GHGchuEZ
	STCgatNd3pHI+bM+8wCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ5jf-001SIU-It; Thu, 09 Feb 2023 12:09:07 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ5jY-001SG2-Qi
	for linux-mtd@lists.infradead.org; Thu, 09 Feb 2023 12:09:02 +0000
Received: by mail-pj1-x1029.google.com with SMTP id e10-20020a17090a630a00b0022bedd66e6dso5932997pjj.1
        for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2023 04:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ePWwy6uTVdbCiMtl+ZpmpIAXO3C14OxRkdLmjAEp9wQ=;
        b=gwz6Shvj5NvVBkv8QWOIUXdkbExty8f6jOYxp0VkVMRUQGcahjon7G2PP3pbw53AYF
         iUmRINZLQ7HfqJNkeeCnaXPIAByaGLF4un2Ex9c1KJYPHINlPz8Gsy2DgphvGXhBFFN6
         mnhv0z4+1LYCvBHGIAzJMRZxk82wLXmktpq5KpjDesg6LGkd2CTaCUO1uUZ7H2Ivs6VA
         QNy/PkGUoX/a2YyfigCWsdxuXMlp1/twYsoU6r8UKQQWlTWJHGxCvcp2xaYIKGeswGH9
         ZWDHAyTLFipTb+4DOsKcmWLnBsAyLurqr2K1Azvkp/nHw+WLwyqoiqyK+o2n7F70k2XW
         r9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePWwy6uTVdbCiMtl+ZpmpIAXO3C14OxRkdLmjAEp9wQ=;
        b=nBfUsG+YfRkYHgZM12VFL9vwdab6Mc4+pnUXCXD8BhmaF2uHahcPEgXR+aM3rv0Nrt
         chEki6KKP5IP2cdHi/3n1wU8yIE+1qVeBqljTGarm3hb7KbU/Tf4OcoeqRWrHNOLAziO
         XYHc31YkLR4xcgDrDnXX9TJonmsCdZtzcimq2TaWcjfaEPrDpXCWi05dN5kXFdezB+/8
         Ii5FVDeETxRuP/QqAa8ie5twhwNeAIrqFxFzIUG8Qmn8eoCn0UpdDE/e1D/lBXvs3WOi
         iwDkOofMRJAYkgKPnqS+8RX2lHlv6MIOI6FvX2Y6NJQLLbnA8Z8pT3WWT2zBm3hk2ghI
         t6kA==
X-Gm-Message-State: AO0yUKXTOaSVyrJV7qqZwla+0S+FGR+WXivgmjx+tJKIjLWEyAv5ntpq
	4yrk9t+uYAFPstcs/sVM4qqZOIHlz+I=
X-Google-Smtp-Source: AK7set+XkyAnFRy+n9tmplaUWVME22kBZhRY/zZpeILwbCKqGWQe4uVi45zaQ9ad6mTuX8p/ng8HLQ==
X-Received: by 2002:a17:90b:4a0f:b0:230:d387:8bbb with SMTP id kk15-20020a17090b4a0f00b00230d3878bbbmr13437857pjb.5.1675944536991;
        Thu, 09 Feb 2023 04:08:56 -0800 (PST)
Received: from mp600-ThinkCentre-M710t.. ([123.51.145.88])
        by smtp.gmail.com with ESMTPSA id ms15-20020a17090b234f00b00233217fa85esm449746pjb.28.2023.02.09.04.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 04:08:56 -0800 (PST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at
Cc: jaimeliao@mxic.com.tw,
	jaimeliao.tw@gmail.com
Subject: [PATCH v2 0/4] mtd: spinand: Add continuous read mode support
Date: Thu,  9 Feb 2023 20:08:49 +0800
Message-Id: <20230209120853.660564-1-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_040900_908042_81A14104 
X-CRM114-Status: UNSURE (   6.94  )
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

This series add support continuous read mode for SPI NAND.

v2:
  correct typos
  change error handle when continuous read error

Jaime Liao (4):
  mtd: spinand: Add support continuous read mode
  mtd: spinand: Add continuous read state
  mtd: spinand: Add support continuous read operation
  mtd: spinand: macronix: Add continuous read support for Macronix Flash

 drivers/mtd/nand/spi/core.c     | 116 ++++++++++++++++++++++++++++++++
 drivers/mtd/nand/spi/macronix.c |  14 ++--
 include/linux/mtd/spinand.h     |   4 ++
 3 files changed, 127 insertions(+), 7 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
