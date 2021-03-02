Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D26DC433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 16:04:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DB1B64EDC
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 16:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DB1B64EDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oMaCilvPKHN/NVRzVSZnz1M0rKeEQj5QA5XJkr+OkCs=; b=XaOhHt6EmlNvr9YNvsAWjTb06
	2BS8WlQ0WT1DtgirzrQIGA8WjASSYHrj960YJFG1yLpjYtYU1YHW8kbUwEnpTGw8CL+l82fOg3kmX
	APVJ5stWDb+Woarqnymiq9GmM4N+gCjerTP9LZGM8N4UjaPv32Xy70vjGFE/a+URJ/3RAzRqpjI2M
	LGDXugLiyxOTruRVjHZRsVq8nX5j+gPycy02NFdpWpfEAusvrsu/UHxp77QxqePaFIyQ+dVDDSq+Q
	3rer/5QguQJPuHBteqEWy1w6GKrkpWGh2rc3/CA3M6DGiawZ1zfYSFkEPOJVAv2Y5AUK+uWqUFV2H
	oJz1cRxcg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHTyK-005W79-Rm; Wed, 03 Mar 2021 16:03:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSoE-005DXh-DB
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:49:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=3DF4ZrSLkZoFle1AkckY8R8NFUgtkoa7CJ5a6g8XnYI=; b=ODrwjRE+yxcFuxSVwBVbz/LyT2
 uPA0WEqZJ/aJ3zUEzfZS+K6GkmHvbbh00AT71RJzXOE66yQgd+3O7F0HutKClarh5555CtuI4XMRC
 sWtn35R5ov6XGSIpjEGH9ueuOVN+SEFNcR2V0MsfX35VG+KNgxgAiX3fiPmsWUkTRrbEaSvm0VRfq
 Nbf4PLADjudRsyWQ6y8WEfcYJHkq4Vz16NNI8khHFd9Eek5p0dbS/2h8KB6DwRQIXMqukQYyC83K6
 8MwUmb8ewrpT08SrZpaXkjNnIgi2TrBnG4SkubUGBS+N8Xk+TS3foj3oErZz0fRqFHAtPNCmPvdHB
 DfEvPzFw==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH7xq-00HSGy-AP
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 16:33:44 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 1C8021BF203;
 Tue,  2 Mar 2021 16:33:14 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Adam Ford <aford173@gmail.com>, ladis@triops.cz
Subject: Re: [PATCH v3 9/9] mtd: nand: ecc-hamming: Use the public nsteps field
Date: Tue,  2 Mar 2021 17:33:13 +0100
Message-Id: <20210302163313.23715-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210127203020.9574-10-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 0b92937c03162a305676a5c125f64ec18c644bb9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_163344_164232_D38F4162 
X-CRM114-Status: UNSURE (   6.35  )
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

On Wed, 2021-01-27 at 20:30:20 UTC, Miquel Raynal wrote:
> The software Hamming ECC engine stores the nsteps variable in its own
> private structure while it is also exported as a public ECC field.
> 
> Let's get rid of the redundant private one and let's use the
> nand_ecc_context structure when possible.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
