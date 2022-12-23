Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9382C4167B
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Dec 2022 07:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CZ2rI9zBhDHce41pfZ7hRPhWQ+uu00vvthNr1vxr10M=; b=yQZT+6GP8pi3mh
	ALG+4hYobBzE2AO46bjcX34cfLGSsar0I5sZHgBHVks/NkbeFfW3NidFKvCBygbxSDgrOaoz0Husm
	J3PRmSPka+9AWj3pmwbOXdVEkv6K9AK+/AMSwMgAmEVmpFxfqR6HUwLy6dhMvBorhLdejep8b3m0Q
	LYEF7tS1/dNPaojjGhVsHU++pkxBTWPNjDqkzSpu/Q0wRQQ6GKprhR6/WTWTgIrelwzpTi+BBUS//
	QWI0pvEHjIYae8M5yynib4L5m0YffUprxgFCoAXgwpE8Uf3XbzZwgsZmq4lmRZH1NMQx+e7wYUcOm
	c7ovkx1XcIzR2wj8e9eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8cNi-004jVe-3N; Fri, 23 Dec 2022 07:22:14 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8cNd-004jQw-Pr
	for linux-mtd@lists.infradead.org; Fri, 23 Dec 2022 07:22:11 +0000
Received: by mail-pg1-x52b.google.com with SMTP id s196so2828454pgs.3
        for <linux-mtd@lists.infradead.org>; Thu, 22 Dec 2022 23:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eJAkWt2qiYGFJn7WEj31+ckInBClcHqc6c25FPLQ/HA=;
        b=EAd7bF4J5ruRoeDGwYduFRPcrW5MTMtctstw+ShQaB70c8t6ICyhSf8Vq5bywwcqsE
         +eKmjf701WYuViZZnChvMlhphAP+LswfmV9gjkkxOK2yj8bBrUUw/WrTbfyXacYdV4LQ
         7JIl0tNM4fYXc5eN9n+ZzJH6fHkXvVpOVF2yolNn068kTXv4TY8wm6xSyIltsguWP5IB
         p3Bkz1pySqGORWMA4Ty/fERrn0Vufm2/C5nRnouwGXoK7QegBDpzlfUCvsyIypzusVyU
         RMQ/8/Sw7V+7xOZ+L0YHCiyi28BQpAVtvLWpadx1xxHelLf9hxSqdTK2XkMHHc86u6qd
         LWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJAkWt2qiYGFJn7WEj31+ckInBClcHqc6c25FPLQ/HA=;
        b=LmNkaZcD+jb2VGW8G/8FUVg1X/HZ0OTzq+Pt0TZ7WwqjKFAQ4H70t90ONtzjIJJbZT
         R6iCMgRwXnUiNt5x0mghItAsExqRpt+BsKYAPukRNz7urPv5abAbIv9LOtcaseq0kHqq
         DR1Fr9d0fJII105iYbHE3qS2yjnx9IleESzeEpfuGA6GlOq3ARDuSx3KPGtGKrBkFw1J
         LNE51KE4ZX5Lek1Xb2YhXztnBo7tqA+nkdnyYcVzOzR8ynYZNfYsM8kCi/57oVgJM8u8
         bv0eGA6pP9FTtSMg+KmK0vzZil8hrDGvYRLiwp9kxcOZdIo92v0rSRZgclYZjPYylo8T
         Fqyg==
X-Gm-Message-State: AFqh2kooJ08+gA5nOhsVWVtkmaB4lMdB1YnLRbReEtR4olDuexcZ0iIn
	5sFKznRyo7eiV4eskb9nyNcVW8FEFEg=
X-Google-Smtp-Source: AMrXdXsHtw3H77BrAMq94m1LUgWUqMZCgYU6GNP0ySI5Z1ohlIYH6pEbni+QAb9M7M54N5t8zIwuXQ==
X-Received: by 2002:a62:52c8:0:b0:580:8c1b:e8d7 with SMTP id g191-20020a6252c8000000b005808c1be8d7mr2578864pfb.31.1671780126716;
        Thu, 22 Dec 2022 23:22:06 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id a24-20020aa795b8000000b00576ce9ed31csm1848146pfk.56.2022.12.22.23.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 23:22:06 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 0/3] mtd: spi-nor: sfdp: Introduce SFDP_DWORD() macro
Date: Fri, 23 Dec 2022 16:21:38 +0900
Message-Id: <cover.1671684805.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_232209_899290_B8443C08 
X-CRM114-Status: UNSURE (   7.46  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Existing BFPT_DWORD() converts 1-based indexing to 0-based indexing for
C arrays, and is used in BFPT parse. This is applicable to other parameter
tables than BFPT.

Based on a suggestion in:
https://patchwork.ozlabs.org/project/linux-mtd/patch/20220912051317.2369-1-Takahiro.Kuwano@infineon.com/

Confirmed all parameter tables described in JESD216F.02 use the same
(1-based) indexing.

Tested with S25HS01GT and S28HS01GT.

Takahiro Kuwano (3):
  mtd: spi-nor: sfdp: Fix index value for SCCR dwords
  mtd: spi-nor: sfdp: Rename BFPT_DWORD() macro to SFDP_DWORD()
  mtd: spi-nor: sfdp: Use SFDP_DWORD() macro for optional parameter
    tables

 drivers/mtd/spi-nor/issi.c     |  2 +-
 drivers/mtd/spi-nor/macronix.c |  2 +-
 drivers/mtd/spi-nor/sfdp.c     | 72 ++++++++++++++++++----------------
 drivers/mtd/spi-nor/sfdp.h     |  9 ++---
 4 files changed, 44 insertions(+), 41 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
