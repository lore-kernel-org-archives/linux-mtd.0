Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B58EBC56202
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 08:58:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3257A20B1F
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 08:58:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="esNJPxOU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C78jLXgX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3257A20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P3w5JBG/AKAEmllge/TnntOAMZzausbnr2Dxq/d/nYY=; b=esNJPxOUhQKd6wEv0I1arC3+kT
	0BpKOZGcJ31crXcKZ9NcoDmFZAKsoBTWn7d6WYNkwAxSF4yZDfJOeqVQ1pPpE5iihsjrQtmotZMew
	77Xx56/ooA+FQfwSDyxC7vZBLOiAkKhQjHIflrkuD60JRqH7kd2LkNUEPl3YKpJ3WJob7Sa0cyw5P
	FNGSokiQ35QHSZ5IkssnMkP8qYnliastw3tloIstn6rf8Cd8KLtyy43FJnC4tSm0xV6VbdHE1D7om
	mvuID7zLqQ7HFegI9kTL8eCmmPY66Gvyx4UC60ebxFNcX1WgVAjDlCbWKG6b64ogrRr+W70KAOrOp
	S1GUWCuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiD5i-0004By-Do; Thu, 26 Nov 2020 08:57:26 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiD5f-0004BH-G8
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 08:57:24 +0000
Received: by mail-pf1-x444.google.com with SMTP id t8so1057517pfg.8
 for <linux-mtd@lists.infradead.org>; Thu, 26 Nov 2020 00:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zBk45UGqX1rgO6p2p4L/BSx2nT0KQMbdrzG7UvM86KA=;
 b=C78jLXgXMiFH/Usf47+DKSw77CHHlU5mb0TYh4eeLxXYjZ7PQLZ2GDBG6QbkB9r+ii
 jK6ujtuLKvjfO09SYGwXMPQRdJb12mV4Q/0Bk7J3B3PcqCi+tqZRlAxlpVVX5lhmIKED
 airzgxVy1WbjSPo0A4BvFYEBhfxQdOUYB0Y3lPR2gPO7F/KptbuhfpqVmGxIjKpfRyv0
 uUG/EDM/skPK2m6/vo0wDA61e/Na15qpZ3B8sdGd9a2RL/6AAYPlETdOMdJGJxrtgY6r
 ZASANM0b2hPQcdcRxamuq8zyxLtNgMb0aA2OZ+3ctfQKz6RBpEYo8ZBu+M8i9DAeX0Uh
 LKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zBk45UGqX1rgO6p2p4L/BSx2nT0KQMbdrzG7UvM86KA=;
 b=S2jcZ0LYVHT5azQS+xnwhLC14sX3qdePOR0WHXimKXcYZv5DeBcpRwNtSdYmswh/ys
 f/9NOUwLT1zOvqADvqLe2LlReZ7108v+Trwnj+BI3S+7NOsn9Pem2ya9QED36a1DMR/L
 XfQF3g4KA7OzQ/94g8+T3N7QSCf+HvADQbPf3aao9iN/GX7EgWqq0PBu0v45q2rjTYyC
 oPGFB9Mb+vraHNNd0c+EP/CeBNUksduN1bp0gaSU7jkDfbPL3j2bCKjVx64LTItMNdYZ
 Vpj4OTfKW1T2SkM88gyxnqprIQv/OpCHF8m7BwAHInWux0kJXtEnFzp0qrAJrO+gt2le
 QiaQ==
X-Gm-Message-State: AOAM533LfW7jUuEPGOdrwqGVThZ2AquAH181p3wuUkmC++nY01+eDpy9
 jl1zW4pygR3TkL+pyExuC2u/fTF2HQ2K
X-Google-Smtp-Source: ABdhPJwvhW69S9YlC1fdzsXhRhsXEGklez9ytKJZknlv8opt1HGJ5w3ORfEDBpYEWhORW2jBe1HXrA==
X-Received: by 2002:a17:90a:d503:: with SMTP id
 t3mr2585033pju.10.1606381039668; 
 Thu, 26 Nov 2020 00:57:19 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6e95:f2a:3996:9d7f:e389:7f7d])
 by smtp.gmail.com with ESMTPSA id e29sm4025603pgl.58.2020.11.26.00.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 00:57:18 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH 0/2] Add NAND support for SDX55
Date: Thu, 26 Nov 2020 14:27:03 +0530
Message-Id: <20201126085705.48399-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_035723_570676_BE8859E6 
X-CRM114-Status: GOOD (  11.79  )
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 linux-mtd@lists.infradead.org, sivaprak@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

This series adds NAND controller support for SDX55 platform. SDX55 uses
QPIC IP v2 which slightly differs from the former ones. The difference
in the driver is handled by using 'qpic_v2' flag.

The major difference in QPIC IP v2 is the DEV_CMD* registers which got
moved to operational state, and access to them seems restricted. So in the
driver, access to DEV_CMD* registers is excluded. For reading the ONFI
parameters, a separate field 'OP_PAGE_READ_ONFI_READ' in 'NAND_FLASH_CMD'
register is used.

This series has been tested on SDX55 MTP along with the SMEM partition
parser [1].

Thanks,
Mani

[1] https://lore.kernel.org/patchwork/cover/1340600/

Manivannan Sadhasivam (2):
  dt-bindings: qcom_nandc: Add SDX55 QPIC NAND documentation
  mtd: rawnand: qcom: Add NAND controller support for SDX55

 .../devicetree/bindings/mtd/qcom_nandc.txt    |  2 +
 drivers/mtd/nand/raw/qcom_nandc.c             | 68 ++++++++++++++-----
 2 files changed, 53 insertions(+), 17 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
