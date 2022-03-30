Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10F6C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Mar 2022 18:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=eKnc51/CzQ+Zfm7eoAlE7TTF7/wuw6h2nLqm+ihsXiQ=; b=lqEIdg8tLHukTfRcAjK1te17F/
	dB9q5OxxY+plSD+jqWILEib9/Xwaq3Buc6D8vor4Ln3ZitHAt9i2vgtcO8zY1mH2lRGQTvFu/UrTg
	UAG6pTJj/RQCrQqWGz+lidrCwI5Oz5RBkZeDZqUnJ42bhyJXDLPWOxNBsRcWkOM7mElYSeG4XABlr
	0jJnhXqGw2p0YaJcBJxAm0CTxVC/tKnAB9bmvSmQHNWgjiOO3gi71imAvriTYLVMCbW/leFS/J0uf
	kyvCh76C9QKwm2Q5u2qAv4yKPwSiPipSXy1WF1vI4e5PAQCeYp0Df1/Anzd0vz2rCAWYDrglDU5It
	nWd6UfXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZd3f-00H7xO-9b; Wed, 30 Mar 2022 18:28:39 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZd3W-00H7uq-Ok
 for linux-mtd@lists.infradead.org; Wed, 30 Mar 2022 18:28:32 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 j133-20020a25d28b000000b006337bb01016so16094285ybg.11
 for <linux-mtd@lists.infradead.org>; Wed, 30 Mar 2022 11:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ysfkn8590uSwiZlCj0dUf9b84jhm3+YPx7U6wcF1Lh4=;
 b=Ec80YCYBr3+7x1dgVlMKktNo8EJlr6iPYG0vTk8LWgCyoQP+XN9M1gzNkurZEEaMcj
 S78oygo+a/0db+2wSn3eVgplMSdrZG+n2X5aw7yL8YZzxgEqHqGDPyZThvThA2B6GoG2
 ct0/Rt6/nROfnrFCDxmArktdywO+QKCq3JmmhVjDS4yT2e8CkY6xCGgSGHgb400XPAcC
 t60jjmZCLi5eoGzVOvw5vbl+9zEXtLLQm/sMMj9uPIyBCgIuWLvWleTSpsgAYMZmNMe+
 BSjgeGkNVpTq0p3Z8d+U8Dzr2nWFPF1uLCyCJgxjasTT7s9O6DB1Mb4G1xIU4Izfn1SL
 7Iog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ysfkn8590uSwiZlCj0dUf9b84jhm3+YPx7U6wcF1Lh4=;
 b=xI5KeYJuM2/ApV4aJXHMCTAnRR4BdkrHP6ydtLZ08EcZ0qEnlZ7bpBonoQSGf2qmv6
 lY/yBiKmkMLZp/iY2Drdrfkg+PFPSh4auWgY56RN5dTILNRqXHwzS3xhJSMfdAOqUN/d
 rIJspMGkevCnGndPgv6Lo2SU1yBCZQXuv9oUUBci7mdmAvKNdpFrt71S8fi5WzltwnLI
 9fYtn736QjH9JGTBd7HkMdceQPtjwgmdcdNWzfE7IduGLFy4Ko9obOxHDNbO3HVJDLLQ
 o3VfSr8fEKR4aBqi/j/p9cqytWpDSjfjiEXcm2rpG6uuR1xb1LU2+5IU7MIneHlXcjaR
 YEOg==
X-Gm-Message-State: AOAM530dg2rDjHdIvfXAoMb5cTFoR+iz7N55Xn+Tx6W0mj6WYhqRXWtK
 so207fBQU1OtBqeJF3ak1Y9nQgvQf84w
X-Google-Smtp-Source: ABdhPJw0Duj6d5LABUuiiO1V+ipIt5z0acafBXL2Y3+v+mwd4Jvo8mt5MynPoHu41wYCZvlDqtw6v+bLefA/
X-Received: from pigloo.svl.corp.google.com
 ([2620:15c:2c5:13:1db:3f32:3ad1:f38])
 (user=jmeurin job=sendgmr) by 2002:a5b:7d1:0:b0:628:d9f7:c5b8 with SMTP id
 t17-20020a5b07d1000000b00628d9f7c5b8mr990898ybq.347.1648664909434; Wed, 30
 Mar 2022 11:28:29 -0700 (PDT)
Date: Wed, 30 Mar 2022 11:28:14 -0700
In-Reply-To: <20220330182816.1177341-1-jmeurin@google.com>
Message-Id: <20220330182816.1177341-2-jmeurin@google.com>
Mime-Version: 1.0
References: <20220207163409.19c3bc4c@xps13>
 <20220330182816.1177341-1-jmeurin@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH v2 0/2] mtd: mtdoops: Structure the header of the dumped oops.
From: Jean-Marc Eurin <jmeurin@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jean-Marc Eurin <jmeurin@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_112830_830544_169976FD 
X-CRM114-Status: UNSURE (   7.67  )
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

The current header consists of 2 32-bit values which makes it difficult
and error prone to expand. This creates a structure for the header.

Changelog since v1:
- Create a header structure to simplify code.
- Patches in series.
- Patch prefix.

Jean-Marc Eurin (2):
  mtd: mtdoops: Fix the size of the header read buffer.
  mtd: mtdoops: Create a header structure for the saved mtdoops.

 drivers/mtd/mtdoops.c | 53 +++++++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 24 deletions(-)

-- 
2.35.1.1094.g7c7d902a7c-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
