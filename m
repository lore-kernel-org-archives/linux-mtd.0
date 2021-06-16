Return-Path: <SRS0=4SWJ=LK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 737F5C48BE8
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 16:41:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46C0261245
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 16:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46C0261245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cz40pGe0sc82DS5Pf+XpZO46dQ9O5Asvc20bWtC0BJY=; b=TgfAlQcEHuWXov
	onJDnMTt5y8BczOL4/jJGEfo760LYkYNs/tNfRd0pfRiajFzQyjoVxlNO7+fknp4y4Ia53PoEa2g3
	ogwKXVsNiNH62pFU7VH1AmqsP5/gDVCVMGBoLSWBrAWKEgje1OKx5zPh1Fk1i0OSUf1SX6fAh/RFm
	6XiDAEI38qBtJfsqZOOnd8ubOvKtcElbyZOvg2az2rJcVlmTwEhNBRehoNuHtOIHa3o3HsIj/uW2E
	LfuTs+h5sOf+KOYox8rZJureO0n2kF53RhLc7umgfpA1RAgiN1cmXS9XjsaUfea40pKijSObN7rSg
	Q1OhBR/OtpWG2ZcCYHRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltYbC-007C0g-Ha; Wed, 16 Jun 2021 16:41:06 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltYav-007Btp-7F
 for linux-mtd@lists.infradead.org; Wed, 16 Jun 2021 16:40:50 +0000
Received: by mail-pf1-x434.google.com with SMTP id p13so2707226pfw.0
 for <linux-mtd@lists.infradead.org>; Wed, 16 Jun 2021 09:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=epXDcsa+iB2IdU4Gd981bdI+VgdMiEH3uS5c66pfdMk=;
 b=GkLCmFh/vzfPIF7v1q7mJc1wazpBYwrpHlrK8VamLK/tdnFXUDt3Jqpo/4zhnIgkB8
 w2Pa4tHYHF/iTjxBxw7knQzMcGPxxObyF5+9fqOM24ruxemJU2JYyJ4aKfJ6/wO0ElHe
 T6vfoZDbGX45mQjwQTttWWusehKNnlTA3+E6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=epXDcsa+iB2IdU4Gd981bdI+VgdMiEH3uS5c66pfdMk=;
 b=KTA8cok2GlXP4UOFYYL0Wel+LNWd+Puy4V9xw29Y8D984aRyh88P3DpcZ1kw2SuMMX
 olo/WGhqV69odd3T2iq3HXpPS9jitJDcFdrkGYs7x+TIYuXcFoketb2OPqBWvnyjpGyD
 sFqe5+E3FgWmq9giG1J13chRGP1kcjAN4xyPTpe3YllYH6zEEap3JjKS97b4+tYQl+To
 YGoXXcMDM0NfZl45Q/nSSjcthVMgkWN+SDlYSiPhJuuygR9Kb5MrN572QAIsyWKOFnDG
 /z31ChEeCtuEs88EDIHDwzrIFJwj/g1xsMy1W0lmK8IIyaULWUM1ZcZuHB/xAO7opRBU
 pJBw==
X-Gm-Message-State: AOAM5315aTePCAnXhKDH1Lxdy2PdImfXw7dhlE0HPmEeaErdCn7SjmXl
 o5faMYTqi9Et6Z+3ePbP5mwI2g==
X-Google-Smtp-Source: ABdhPJwSppm5irPLhD/8UhbktXBLwwAA5AGV8driRal8NYsxUQyf0Pz+CGSw19WrD/+6GFIZo7Qt8Q==
X-Received: by 2002:a63:5c04:: with SMTP id q4mr453285pgb.127.1623861647276;
 Wed, 16 Jun 2021 09:40:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id c5sm2840547pfn.144.2021.06.16.09.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:40:46 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Christoph Hellwig <hch@lst.de>,
 Al Viro <viro@zeniv.linux.org.uk>, gmpy.liaowx@gmail.com,
 Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>,
 Tony Luck <tony.luck@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-doc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: [PATCH v3 0/5] Use the normal block device I/O path
Date: Wed, 16 Jun 2021 09:40:38 -0700
Message-Id: <20210616164043.1221861-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_094049_323379_3791D498 
X-CRM114-Status: GOOD (  10.45  )
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

Hi,

This fixes up pstore/blk to avoid touching block internals, and includes
additional fixes and clean-ups.

-Kees

v3:
- split verify_size move into a separate patch
- several changes suggested by hch from the v2 thread
- add reviewed-bys
v2: https://lore.kernel.org/lkml/20210615212121.1200820-1-keescook@chromium.org
v1: https://lore.kernel.org/lkml/20210614200421.2702002-1-keescook@chromium.org

Kees Cook (5):
  pstore/blk: Improve failure reporting
  pstore/blk: Move verify_size() macro out of function
  pstore/blk: Use the normal block device I/O path
  pstore/blk: Fix kerndoc and redundancy on blkdev param
  pstore/blk: Include zone in pstore_device_info

 Documentation/admin-guide/pstore-blk.rst |  14 +-
 drivers/mtd/mtdpstore.c                  |  10 +-
 fs/pstore/blk.c                          | 403 +++++++++--------------
 include/linux/pstore_blk.h               |  27 +-
 4 files changed, 171 insertions(+), 283 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
