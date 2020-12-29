Return-Path: <SRS0=fJla=GB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652E5C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Dec 2020 05:53:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E15D920727
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Dec 2020 05:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E15D920727
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/JeqpC5sPQNQiwbZt6MmPVD9nGjaSgmst5vZd9DGrps=; b=tY5ltNiZ/U9Skg47jnohg406qW
	demhUpb0AZS87IVqQAkVNuHra5nriJ+upNExprPFpdeeIL7GQOPvSs2Q8hlVK5rVxvT8RykjzibjJ
	1zsu7W4ahr1tpwz+bWB6I5GeihVT1EU64Lz4Y2EIxf/ibAXFanlcqBL3UvO+9XB0NoyiM8r7kGydB
	zvLgUc1hYK0dqX0G7a0F45MDAy134EZsPxuDmwHvrg6wFQjz4lENVbhNQekyXD1ci+1sQ7Lt3UeTd
	Oj2K4zX31s05vjcPvjlni4YXVQwOpaE5DM4zpg/4cGbKqa0O8VtO923lykRzzITH2SCIi7vLRBOuk
	NTBYktAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ku7uz-0005oj-1O; Tue, 29 Dec 2020 05:51:37 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ku7uu-0005nx-ES
 for linux-mtd@lists.infradead.org; Tue, 29 Dec 2020 05:51:34 +0000
Received: by mail-pl1-x62b.google.com with SMTP id v3so6698504plz.13
 for <linux-mtd@lists.infradead.org>; Mon, 28 Dec 2020 21:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ws6av0vO/n+wtrNUa74n3tClewh7290nN7ExGkq43UI=;
 b=YY41nMVeSFbTCpTx+MYE+RLVcV7VcqULCF0sXiC5fu3HDw4t/KZWH7ZUF1rr8VHw8u
 4i0NUe0+vqLBoKxuvW761+OekAaEKXolvcFlzmK76eVnaWnhEQjf+VhNQLvvhO3NrTq3
 qCIgzBCCmuUYOTIku0kq01wRcRZd7K+1ybJtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ws6av0vO/n+wtrNUa74n3tClewh7290nN7ExGkq43UI=;
 b=VnGgTfx9vLz3hltS4fMd4VoJJSLk//UdD7iwaAkAq6C0nkbV/3CWM4TQGlUYPtrcMF
 bRfE8LzmiWJBf65oGPqs2lnu44Qqd6YuF5pgMjx9kqbcxXaYLVCJsTubyE8OxqCXXFgI
 EQscuxkqWhch0VnWT/0YE3ytxGUo0n7Ckodp6ND6vmVwME558WG++gqFrc5jnbxI3zPp
 el0Hrh+m41Ro3FkkUg8r6Ox8lExfkeG/UhbgLjdcBqM9ntMlRp7PqDhlOwGQ/X+MeXhA
 uDMmmgvxJzGG/PkOlbrHlTzUtowbFPlu8YPTSYelJiYp7IEXgKRqMRCHhXTpQahsKzaG
 elKA==
X-Gm-Message-State: AOAM532hj3DyMHDO966vIKmzz8ClmmrqZ7vQ0/IpqbkaJCGJmBky+XBR
 VaK4OqAnxd3x18EyINA3zRk3uSnbt7p2oQ==
X-Google-Smtp-Source: ABdhPJyho6BEPlXg0tseu2Gzc0+n/F44qHf9yOCIxgGR0kpQZq/Rh9SpXsyWd3kxTKjiFY3PI0SXaA==
X-Received: by 2002:a17:90b:90f:: with SMTP id
 bo15mr2474480pjb.148.1609221085820; 
 Mon, 28 Dec 2020 21:51:25 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp.
 [118.13.124.123])
 by smtp.googlemail.com with ESMTPSA id x23sm45041113pge.47.2020.12.28.21.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Dec 2020 21:51:25 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/1] Add basic support for Foresee SPI NAND
Date: Tue, 29 Dec 2020 14:50:58 +0900
Message-Id: <20201229055059.2255021-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201229_005132_655163_99A81F6F 
X-CRM114-Status: GOOD (  13.79  )
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
Cc: vigneshr@ti.com, richard@nod.at, Daniel Palmer <daniel@0x0f.com>,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is my very crude attempt at adding support for Longsys'
Foresee branded SPI NAND parts that are showing up on some
boards.

I fully admit I have no idea what I'm doing here and I basically
took one of the existing files, ripped out what I didn't
understand and tried to fill in the numbers from the datasheet
without really knowing what they mean.

This worked well enough for me to get something that looks like
a correct dump of the SPI NAND from a board I'm working with.
I need the vendor firmware on the board for reverse engineering
so I haven't actually tried to write anything yet.

The datasheet for this chip is linked. If someone that actually
knows what they're doing could take a look and point out my
mistakes that would be great.

Link: https://datasheet.lcsc.com/szlcsc/2008121142_FORESEE-FS35ND01G-S1Y2QWFI000_C719495.pdf

Daniel Palmer (1):
  mtd: spinand: add support for Foresee FS35ND01G

 drivers/mtd/nand/spi/Makefile  |  2 +-
 drivers/mtd/nand/spi/core.c    |  1 +
 drivers/mtd/nand/spi/longsys.c | 45 ++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h    |  1 +
 4 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/nand/spi/longsys.c

-- 
2.30.0.rc2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
