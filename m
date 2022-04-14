Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B46C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Apr 2022 14:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rg7R6nzb7CZT1KHMCms/94iT0B9+El3Ckv0eQIDrpfA=; b=ooUTTIjCgE2uOo
	k3iM4MsfE3+1qPAUWUfRRn0oEu2QyfARVnaGrCV4kPo1eZQFJYSfwsexXG+BtelDbcCIpkyRsCg9h
	lTdqfoCvxIsBgeiGayuVVmfgBsoOWq+xqULDUTUzIXyXuvokbuzvGv2ymMtd2mroftSrjPCBgK7gD
	+TxZqkuG62yjUPpuFcTbT4jOUxpEdYqijwzkIz8WiAOJRJpWsiaVWcKDh8UXclfOz78qc959M6D0t
	H+ZaukUFZxJ28APtyyzuyP3tK3sRXgeYw6gIJWbbMFXWvH5Yfw+O4BIHUBwRWz9zNpJ68wGuZGbLD
	aDsvxiPzBCgbQkYUxLVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf0YS-0061aq-Tm; Thu, 14 Apr 2022 14:34:40 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf0YR-0061ZV-3C
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2022 14:34:40 +0000
Received: by mail-pf1-x42d.google.com with SMTP id n43so1022390pfv.10
 for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2022 07:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JR7TGUzg2jTgqyV7dtws4W0P36w8/I4C5KP+KUJ6XkY=;
 b=e/V0toUXFKIfbzcWd3+aVJ6Rmm/EpLtj5P9sXxAoSV5ff6JEJlaZJEtSh3kvQI50QE
 wazu2qVsYBARhMzzJnyULXLSLNXJRTvqXWlZl0WJmUyxzhrXzHSqrJgXHWkmZLbFJE+i
 SiRJweI/ucaEcCKzvQW3k0KmmBBt1B2AOQnxdeYZG39hurUIUfGETH/4XttlHlRXFe4e
 8e/KtAADwZk2MplvC14VF5f/7ml0h+b3bJmtS1dQmL3B5L1dP0ERLUQgXMNdBMm2NJNK
 tiSVKTE0pjhwDhrlEx4+EBeIbeHrGEAomsW2G1g1F9P7xqZRqhbo5uxa9aJQSU5ewMnJ
 i5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JR7TGUzg2jTgqyV7dtws4W0P36w8/I4C5KP+KUJ6XkY=;
 b=hHaKfJQGbGmoMFvV62bFWuF6+hMPE5AYkFvMFzCuqT1mX8bA68Xz2L8BfC6ykmublP
 LHL4VMn+RP73+vQQf5JfGXiEzTdfC8mg4yNz+yX9KiMiuyMD+Uo7aHTqxzWc2o6TuDi4
 lny263JT+5piX9vQHF9Y/NB6bTrtx6wsI6xtOY0IOmwYTsx3jzJ3Z/1s2Jc7M1guGOL5
 BpRfw/9DdgPvLBE4ZzGx+Kf6WsTCGY5THZxBWbXSbs6ToIEt70RJ+ZmOumxey1aC0pWJ
 FgZzLE6VV1TO9IRlCXeiOPhpmb6KiTc070/uME9/okvLgtv1Ta+40OiSVJzJc6oAqoPt
 5I3w==
X-Gm-Message-State: AOAM533ksVEX1S9bjI7x7C7L94rKl7qAe8YojUv3Hzojp72JVgAzZooz
 RTj2oSzEg8EJjiyG7YI5obUz57OkbU8GpTHl
X-Google-Smtp-Source: ABdhPJwE+zcDwE+ksowryjT2STP8byQ3rarD4EqmnKcvx4kkuBg2EJ8HEW9UA/mzKKQTl8P4SUy0jA==
X-Received: by 2002:a05:6a00:b8e:b0:505:8d7e:cb02 with SMTP id
 g14-20020a056a000b8e00b005058d7ecb02mr4202119pfj.68.1649946876042; 
 Thu, 14 Apr 2022 07:34:36 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a17090ac50500b001cd5ffcca96sm4411017pjt.27.2022.04.14.07.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 07:34:35 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Chuanhong Guo <gch981213@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Mark Brown <broonie@kernel.org>, Daniel Palmer <daniel@0x0f.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/2] mtd: spinand: add support for detection with param page
Date: Thu, 14 Apr 2022 22:34:24 +0800
Message-Id: <20220414143426.723168-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_073439_195630_BBD8C59D 
X-CRM114-Status: UNSURE (   8.69  )
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

This patchset adds support for spi-nand detection using parameter page.
This helps dealing with future JEDEC ID conflicts introduced by crazy
vendors. Also, the added ability to auto-detect chip capacity can help
reducing number of entries in our spi-nand id table.

Chuanhong Guo (2):
  mtd: spinand: add support for detection with param page
  mtd: spinand: probe Winbond W25N01GV/W using param page

 drivers/mtd/nand/spi/Makefile  |   2 +-
 drivers/mtd/nand/spi/core.c    |  23 +--
 drivers/mtd/nand/spi/onfi.c    | 298 +++++++++++++++++++++++++++++++++
 drivers/mtd/nand/spi/winbond.c |  25 ++-
 include/linux/mtd/spinand.h    |  53 ++++++
 5 files changed, 380 insertions(+), 21 deletions(-)
 create mode 100644 drivers/mtd/nand/spi/onfi.c

-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
