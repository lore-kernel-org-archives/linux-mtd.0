Return-Path: <SRS0=76BL=HP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D14FC433E0
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 16:47:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B1F364E3D
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 16:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B1F364E3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QdpSzZqvlG+PKVyucqDobhbF02XbUNbvyuAh1WfqEKE=; b=xvnTrw2TOcgZoaGRffxI8vb/Oe
	N3dhj7tw1y+dIs4/9j2AcUk+s9MLnYFcuFrUgzmI9RLNltwc5pRVSa+jnELZZ8aIFiIBidrljdNIh
	EFJSNACidXshJG0PnhGHWW+i8uQ5a1Dz+uOZwa7k2Ii8aoxxOotq2EgQZbEWQobpmSatP/+H8Tiay
	rQcTIX3lue/p7tg9Hn8KuWH8MugLqomqzZJdStpypuqMJTXKrRI1iQUzHlSx6w8pQ7uOpaUuTTICK
	7aChF2uJ3mjnpAGspBlIVjJFWtldkduMzE28EZQY/Qz4ygu6/zre+UKeyX3tjlTzXDp6Q9GpmWIgz
	bgtjrl3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAy49-0004oQ-Ot; Sat, 13 Feb 2021 16:46:41 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAy47-0004ns-0M
 for linux-mtd@lists.infradead.org; Sat, 13 Feb 2021 16:46:40 +0000
Received: by mail-pl1-x62f.google.com with SMTP id e9so1449605plh.3
 for <linux-mtd@lists.infradead.org>; Sat, 13 Feb 2021 08:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PtZlRFFC+ex+pjaOYETsGKR4hoKgtSzTKa5mItC0Pbg=;
 b=niMEAwq0GDi1ROtssntqWIWRDqPbEvtvFm0UVuSRORREP2jwOqes+zPUgpd1IqEXWx
 6AzXtq5rSmb4gAhcoW2yLeFZYq/9l8QMYkCa0JU3pMw8Xs23S/rc9kHX7uYAO4nqsT4K
 TuUn4dTl7pHF8uHfZSNktA++RDL3OdyfX9Vb1mxvgFtCxN8p0rTcue52QgfOfiFr8hiB
 0NkaFIzh5cFzSdzoXBvdMQLRAD5K7mcCOVSyWgZ1cxRQHRLSK1gXNslMKXyLchUlfVce
 Km6cg+gidZ9BGGHhcpWKeGdTL/3p71QBvsgO+BiEsy3DPA2sq66OHrphS8XQOAv/3FJX
 +VLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PtZlRFFC+ex+pjaOYETsGKR4hoKgtSzTKa5mItC0Pbg=;
 b=um0cfjJ8k3wKp1Vt0UnTAO0SA34HreD/g7aifBVSkxzbTEVyNe/tcGF4OLRLLZ4EgE
 +7JqlWCo17x0UAnB8AnbNPWxr1mqOPyb55BDw2M9InueHtLKom6tVVjQ+WQVXeJPra0b
 +EYsv5CeLtkmj2jLI2N2tDKNjtU8R4jxRLGIWY01lWqQGDCvToK+Avp1guggbImcDk2f
 fanJoRPJz288cgde5VlUzLBYb2V13X33cwk7t5Pd9M4Fk1t6ZN0qn/02GUvWjV/EH1Wx
 /RBdp2Ejdr58qu11qG7bO8SdBkNH9y/RbNfn9BdPgXEWKFW8Q/81ad2cgyaW8kSgQPW7
 DkHg==
X-Gm-Message-State: AOAM533Qe3v6O/RBomsJMqaVXhAXzPirCLthumQJbBDx0XQQgVdANoI8
 hC1G5PgDjnMNLRo7v7W1QR1xHieyoGDrDw==
X-Google-Smtp-Source: ABdhPJwLkckV2e9Edp7CCQuA7r0uMG7v8N5/r2i+0uU/4CqtHNY/YnS11YEnHd6n5NgUpzAVLPMq7Q==
X-Received: by 2002:a17:903:228a:b029:da:d645:ab58 with SMTP id
 b10-20020a170903228ab02900dad645ab58mr7711471plh.25.1613234793925; 
 Sat, 13 Feb 2021 08:46:33 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
 by smtp.gmail.com with ESMTPSA id h70sm12598145pfe.70.2021.02.13.08.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 08:46:33 -0800 (PST)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 nixiaoming@huawei.com
Subject: [PATCH mtd/next 0/8] Introduces the module_mtd_blktrans macro
Date: Sun, 14 Feb 2021 00:45:52 +0800
Message-Id: <20210213164600.409061-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210213_114639_070704_2D621891 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
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
Cc: Dejin Zheng <zhengdejin5@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patchset introduces the module_mtd_blktrans macro which is a
convenience macro for mtd blktrans modules similar to
module_platform_driver. It is intended to be used by drivers which
init/exit section does nothing but register/unregister the mtd
blktrans driver. By using this macro it is possible to eliminate a
few lines of boilerplate code per mtd blktrans driver.

Dejin Zheng (8):
  mtd: Add helper macro for register_mtd_blktrans boilerplate
  mtd: ftl: Use module_mtd_blktrans to register driver
  mtd: inftlcore: Use module_mtd_blktrans to register driver
  mtd: mtdblock: Use module_mtd_blktrans to register driver
  mtd: mtdblock_ro: Use module_mtd_blktrans to register driver
  mtd: mtdswap: Use module_mtd_blktrans to register driver
  mtd: nftlcore: Use module_mtd_blktrans to register driver
  mtd: rfd_ftl: Use module_mtd_blktrans to register driver

 drivers/mtd/ftl.c            | 14 +-------------
 drivers/mtd/inftlcore.c      | 13 +------------
 drivers/mtd/mtdblock.c       | 14 +-------------
 drivers/mtd/mtdblock_ro.c    | 13 +------------
 drivers/mtd/mtdswap.c        | 14 +-------------
 drivers/mtd/nftlcore.c       | 13 +------------
 drivers/mtd/rfd_ftl.c        | 13 +------------
 include/linux/mtd/blktrans.h | 11 +++++++++++
 8 files changed, 18 insertions(+), 87 deletions(-)

-- 
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
