Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76678C2B9F7
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 10:35:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3672E613D3
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 10:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3672E613D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nthj6lOGSDPJkqcvZ4tM8W67CNS09UI+bMIvFfokc8s=; b=xuJVdAKJ7dYX4G
	1pRc2i1Qsk+FM4uOZOpQIgA+wCtJ4DEg89UELdYIp+QgWY11cESFFBpptFUcfl7TiFZJ4g/Nzpx++
	0HkfSGzwXE06Iw+Y5hndNyeJs2x9YogyqP4qkjRUv54sBZdP00gm5DlNFZUGzg4KMwJnrHGEMFAk2
	HEenFMwQIGQMr0fLv9AYsB915dj5meQTfgIe90BJdPUQCrB1yZzbNrnTYqdnN5SGxXX0JCPU/Lrbd
	rlXz31oKHQ5QgOODKIYKuJaLvNZ+I2Tuwak2i1sDRQAO6kfLm4cP+OJWbAkCjTRJXrYXbN9eFTP/t
	YhOsUVd35CCCO7i1sc8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llqs0-00DESW-Rp; Wed, 26 May 2021 10:34:36 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llpTJ-00Cigh-NH
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 09:05:03 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 2933C4001C;
 Wed, 26 May 2021 09:04:59 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>
Subject: Re: [PATCH 07/22] mtd: rawnand: Clarify the NV-DDR entries in the
 ONFI structure
Date: Wed, 26 May 2021 11:04:58 +0200
Message-Id: <20210526090458.182271-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505213750.257417-8-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7ce872d9f55f46ef54b60ed39c0144b24578d7c3'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_020501_957489_49976715 
X-CRM114-Status: UNSURE (   8.48  )
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

On Wed, 2021-05-05 at 21:37:35 UTC, Miquel Raynal wrote:
> Both src_sync_timing_mode and src_ssync_features entries of the ONFI
> parameter page have been updated and now are named nvddr_timing_modes,
> nvddr2_timing_modes and nvddr_nvddr2_features, which is much more
> understandable for someone which do not know the history of the ONFI
> specification. Update the relevant structure with regard to these
> changes.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
