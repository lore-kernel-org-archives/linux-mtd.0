Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C48BC2B9F7
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 10:11:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 257A861355
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 10:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 257A861355
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+S5c+2E/e9ylyUCD32RffqiPiQkkP9tDOwl1TS4mOs=; b=w3o/LDBkVPtqdx
	4SdawWFjNGcZrk13nNqfngruBrs13fr/lAvJ0jSmana70wa963pvazMgie6PCaGRbJr6eOXIPSnmT
	4v2xo/XE7XxVkIlD9+gnF3R8nYobkhRGZyyCI0/K7oja3ugynNkfXSPaKZKttv1kBo0yxLdkbxA7c
	SJtLa6Lbn8uR6nOlGEwyW6ZP8NJ01S+s8YRpkmVhtYkm6+Y93cRKzoWxfmjlbySnzLIz1al7cKiNy
	8EOgJsDtEiHkVHMvbjviZsTuI8QWtRDUHyvk564bWgD0ZYH4FMDr3J8hd9zyDNwarOmoC3r5jj1Pc
	Cwer3InNeWGRo7ss77mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llqUK-00D6Xf-AE; Wed, 26 May 2021 10:10:08 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llpSh-00CiRm-TA
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 09:04:25 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1E927C001B;
 Wed, 26 May 2021 09:04:20 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>
Subject: Re: [PATCH 14/22] mtd: rawnand: Handle the double bytes in NV-DDR mode
Date: Wed, 26 May 2021 11:04:20 +0200
Message-Id: <20210526090420.181820-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505213750.257417-15-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'09cdb237c3c8773921a7c265ce1cdd23818a3f14'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_020424_109745_F28BD69C 
X-CRM114-Status: GOOD (  15.85  )
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

On Wed, 2021-05-05 at 21:37:42 UTC, Miquel Raynal wrote:
> As explained in chapter "NV-DDR / NV-DDR2 / NV-DDR3 and Repeat Bytes" of
> the ONFI specification, with some commands (mainly the commands which do
> not transfer actual data) the data bytes are repeated twice and it is
> the responsibility of the receiver to discard them properly. The
> concerned commands are: SET_FEATURES, READ_ID, GET_FEATURES,
> READ_STATUS, READ_STATUS_ENHANCED, ODT_CONFIGURE. Hence, in the NAND
> core we are only impacted by the implementation of READ_ID, GET_FEATURES
> and READ_STATUS.
> 
> The logic is the same for all:
> 2/ Check if it is relevant to read all data bytes twice.
> 1/ Allocate a buffer with twice the requested size (may be done
>    statically).
> 2/ Update the instruction structure to read these extra bytes in the
>    allocated buffer.
> 3/ Copy the even bytes into the original buffer. The performance hit is
>    negligible on such small data transfers anyway and we don't really
>    care about performances at this stage anyway.
> 4/ Free the allocated buffer, if any.
> 
> Note: nand_data_read_op() is also impacted because it is theoretically
> possible to run the command/address cycles first, and, as another
> operation, do the data transfers. In this case we can easily identify
> the impacted commands because the force_8bit flag will be set (due to
> the same reason: their data does not go through the same pipeline).
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
