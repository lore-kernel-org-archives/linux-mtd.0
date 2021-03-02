Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C81D0C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 21:56:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D66364E2E
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 21:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D66364E2E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EHTcyVkMX0k8FFjP/JON1tUMrG1Z0DycUzX/XA9LDHQ=; b=JoR7L7MMCPMcRvDBoYU10hykF
	JQJE61EyqBqHeJBnqrUq7ZFyPBSzaEQi2OoyWgK9W/aIvxnRe08bpRNE7efa/2o6WJAW1GnyU4FdQ
	xE9tSgVNoB1d2yzjAsZRpLHYT+9ERMbNSqHpGnDJQlthEffo/5Eu2qftCWoEnBx7Ite0sDGC+Nnzn
	it2u8dbkEkHWutNyoou/biG2AAzkqZ+Ku3DQBo/ZuzyC326zMzr0ivDekT9z/RoEKvvIx+2sbhv2s
	XoNcG1U/KwNbmKFOoOsmDMrsrrTVkDkl9ugjiwYQWvO4MTOpGUoADWRPnyW1hmxgBK4Z5JlRxosDG
	M4v8CK8gw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHZSF-006f8s-Cj; Wed, 03 Mar 2021 21:54:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHTA4-005KQn-0f
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=vyDiYctvbK2GMZg48dS5YE6j6JN9HfaaUePeo15QC2o=; b=MrF7WIgixnQIu73dJQf5rqR9Wq
 NcUh7jA5hwlpCaIsJPexAlFgbfQB7/biLAlqkfHqUbUylDM40sMYhNZef/4aLwWL2SqldDx8o3XI5
 7ddbzyUywfePbfj5BpMvsGJnRcm6Ymwc6ORYatDuW6OJNX06KWAOfGQvzYJl3FT2/jtW622RwH6MV
 wW8VeS5ZnI8+YLTLgYOvNtN7BMfXa+L2Qjp460n6h4zbCst52BYpcyJGC2s++sYDc+P/83i6vidqA
 ewN3WOjxi5sDO6Cq878lVBmW43+60asKQhPYZXInirM2Hiu5ds/G9HDpamdlXxhhpyNQhMgvpuwjF
 eg6nfJsA==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH7yS-00HSJc-3d
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 16:34:21 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 73DA11BF203;
 Tue,  2 Mar 2021 16:33:54 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Adam Ford <aford173@gmail.com>, ladis@triops.cz
Subject: Re: [PATCH v3 1/9] mtd: nand: Let ECC engines advertize the exact
 number of steps
Date: Tue,  2 Mar 2021 17:33:54 +0100
Message-Id: <20210302163354.24218-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210127203020.9574-2-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 031937ce00a888e4cc8985b01bc80c936409bcb6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_163421_686852_A498F51B 
X-CRM114-Status: UNSURE (   6.77  )
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

On Wed, 2021-01-27 at 20:30:12 UTC, Miquel Raynal wrote:
> This is an information that might be useful for specific uses, so
> export it, which might avoid having to guess the number of steps when
> necessary.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Tested-by: Adam Ford <aford173@gmail.com> #logicpd Torpedo

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
