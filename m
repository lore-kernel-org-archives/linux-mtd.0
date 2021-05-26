Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5134BC2B9F7
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 09:52:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B4E861432
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 09:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B4E861432
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0YjXbLrxg4p6kvdwRS4nuQVs88GeiXaifg2hvsF+ns=; b=0H5wRkA8TSd3+m
	tenPoLY8q5VS08ifrArX60U0o0mNfTmLGUjBBIzuH4zO6AHH+usVduGEaVCDRRHC87ZngvHjZDzU1
	4qWokwbbWJSp0dastCSrmnbAHRm26K3azOEuz2s7nkXn6eqUeSRrnRdO2B7fKT82LupO66BwY8nSn
	UDJyiq+buY2El293zPZkE6NYdeUdwOkD1CUMhI9iDz1ZWkjb4f5kipLGDSY27p+vNPOnnBt4cvF90
	vpOZhSOgxDN4ebSxOkngnWEKH+IrcuueRBPqmX9CXPzF01a/Wp2swJPo2BpXmlg5i5rTWPwLNU7Ls
	SL4fwCfhKPOAp/GVrjDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llqCE-00D0kP-4s; Wed, 26 May 2021 09:51:26 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llpSF-00CiHe-Pc
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 09:03:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id CAF8F6000C;
 Wed, 26 May 2021 09:03:52 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>
Subject: Re: [PATCH 21/22] mtd: rawnand: arasan: Workaround a misbehaving prog
 type with NV-DDR
Date: Wed, 26 May 2021 11:03:52 +0200
Message-Id: <20210526090352.181423-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505213750.257417-22-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'10938a08fc4055667da7518685fbd8ea7d09de1b'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_020356_014551_B7E1797E 
X-CRM114-Status: GOOD (  15.98  )
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

On Wed, 2021-05-05 at 21:37:49 UTC, Miquel Raynal wrote:
> As explained in the comment introduced above the fix, the Arasan
> controller driver starts an operation when the prog register is being
> written with a "type" specific to the action to perform.
> 
> The prog type used until now to perform a CHANGE READ COLUMN with an SDR
> interface was the PAGE READ type (CMD + ADDR + CMD +
> DATA). Unfortunately, for an unknown reason (let's call this a silicon
> bug) any CHANGE READ COLUMN performed this way in NV-DDR mode will fail:
> the data ready flag will never be triggered, nor will be the transfer
> complete flag. Forcefully, this leads to a timeout situation which is
> not easy to handle.
> 
> Fortunately, it was spotted that sending the same commands through a
> different prog register "type", CHANGE READ COLUMN ENHANCED, would work
> all the time (even though this particular command is not supported by
> the core and is only available in a limited set of devices - we only
> care about the controller configuration and not the actual command which
> is sent to the device). So let's use this type instead when a CHANGE
> READ COLUMN is requested.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
