Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D599C433EC
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 16:39:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E3D922CBE
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 16:39:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HJ2K+31j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pensando.io header.i=@pensando.io header.b="q/VUYRgy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E3D922CBE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pensando.io
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ccvYmdMvuuG4JizMlw1jNUztTtE7ytuY0u1ReBLfqZM=; b=HJ2K+31jo/dB1kovJ6xnVoBDF0
	La+KeBS4fgtsT+B+L23awqGyMI3NsxABhcrEz5cW3ywQJAivWB/Czgcep21DZeTEBjdM6kKjMbMp2
	CkE8F+ZxBhaykExTdqgrGZTup6lT5VkbQWFYD/TYqOtmoV0szhhEndiZ9M7vcXBro9O9ezUB5sgOY
	5xY/gua0u3Q8y/+hLnd4GPr6wgR2DdHkB3VnrUeaHp92zrGMryZJt0ibkdfG2CaQlVv0Iq9HbgO+g
	1BNmiMOeYDqUHoKIvieC/3P851HqjoN67Oj1t9G2S7My1Q4UgQ4Fdjme4TcBSh0rp4qeA/l6oMZzI
	3nZRkOeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxYn1-000518-QG; Mon, 20 Jul 2020 16:37:19 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxYmz-0004zw-5O
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2020 16:37:18 +0000
Received: by mail-pl1-x641.google.com with SMTP id m16so8906553pls.5
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jul 2020 09:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pensando.io; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=+YntdObTcm/k3/ROyBRFTzE3jOnRbjovtEwmPRYU5HQ=;
 b=q/VUYRgyOfs2TDgSrztIOoLsFKkZxLUEpJejy1fKiu/E9Ji7wLAFH7nXZDujnDjjLa
 XjQ4ZUHXzkRU9tPGQ/P2DTc8hGuNdswGWnyq6O8aBvsHTeQxu5ArfZKaizLdW7BjTnkd
 VvyQ/exGYc1S1jfa+l/bnfQZW/qkGwfb0jH3y1qOZIOnKRo7pk5eWwdUTh8M9DvFrhXp
 xji9rEB4DrtiHVqNoXxhasz+ZQX0WYoNckk/GVArx+nSIMvNRUuK7LnmGK98fxu9+1KN
 vyzhzXKvXzmYYMitFL2lFkeVuDtJ4hknM3h1475TqPcFt4dFrfk2LSsaH8GXeQ8daULE
 nXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+YntdObTcm/k3/ROyBRFTzE3jOnRbjovtEwmPRYU5HQ=;
 b=cjRfJgW+NG8s843vXqhCGLBF278zhFfV4ezFmxFJEkDjkAjTFF2r+4jxKR/RXalkKs
 N+AAhe+7gXiQACxLvCOUC+X1X8nPzEXg2gSAok4J/RdYxBiDl5BAcLBlum2gJ45seIL+
 Wn6o16O0xiP9K5Kv7T6zXfYAWH9NW8J3VSYybjvSm/wYLO2n7xOgEO2th37n2C6hjm8+
 Jq2Vpox/EHwNOXRadKklkYOkTwhPCqVRbKU9DOMUshF6D/r/FPK3Bk5L8x/uSa9l6WcA
 eAdk/Pn1MiDqh5Vkbcin7JOAPZ+H5gZfV/g2NNND/gBLtAM1SlvjrBxBG4a/XwDLsgkg
 aNDw==
X-Gm-Message-State: AOAM533mhKdceIxtQXK8v+fZqUU4nXK5RakrxsVb17+LjqH0KXxAiQq3
 Ait6TfV38rlYsuHXENq4xPt7fA==
X-Google-Smtp-Source: ABdhPJy3/dWI6nPZfaccSd4qhKkZSZ3X5fCaem22LGsxYU3odPYNCWfLcHz3gnCSiZ0mW78GHVvHMw==
X-Received: by 2002:a17:90b:124c:: with SMTP id
 gx12mr228556pjb.191.1595263033890; 
 Mon, 20 Jul 2020 09:37:13 -0700 (PDT)
Received: from platform-dev1.pensando.io ([12.226.153.42])
 by smtp.gmail.com with ESMTPSA id z25sm17342472pfg.140.2020.07.20.09.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 09:37:13 -0700 (PDT)
From: David Clear <dac2@pensando.io>
To: tudor.ambarus@microchip.com,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2 0/2] Support flash devices used on Pensando boards
Date: Mon, 20 Jul 2020 09:36:54 -0700
Message-Id: <20200720163656.38006-1-dac2@pensando.io>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_123717_475109_B04DB2E4 
X-CRM114-Status: GOOD (  10.09  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: snelson@pensando.io, David Clear <dac2@pensando.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Changes since v1:
  - Added test descriptions to the patches.

Pensando boards use Macronix and Micron flash devices in x2 mode.  This
patchset adds support for the previously unlisted Macronix mx66u2g45g, and
it enables x2 mode on the Micron mt25qu02g.

This patchset applies to the spi-nor/next tree.

David Clear (2):
  mtd: spi-nor: Add support for Macronix mx66u2g45g.
  mtd: spi-nor: Support SPI_NOR_DUAL_READ on Micron mt25qu02g.

 drivers/mtd/spi-nor/macronix.c  | 3 +++
 drivers/mtd/spi-nor/micron-st.c | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)


base-commit: fb249e1007e0270e305ea674012dcc4f95f1304e
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
