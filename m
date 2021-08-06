Return-Path: <SRS0=GkoH=M5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22831C4338F
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 20:06:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB54061154
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 20:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB54061154
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gdd1XDhOzbv4KTGqi60EGia9mDQnatgMdG9DPpAawlc=; b=e1zzTQ6fxDmO3i
	YMxoN+jwz9jHsHpsNiqA3xFCwM4mQIOMhTV1e7vGzby1HeItVr/UyXGS3DRTRKXLpwPtWZVTI/9uG
	oD48mIT5Gaa19H92VRchehPAsShbHOn50Cj39YDcg64QzVfdTLAWn/Bm6etvtnTk/xkGZaZm6fpHj
	bl8n/cDd2xkqJLZA/h8zmqcd2w8ufEpmojQil3Lk6RixKRTcTZR6qxFfPKFEJWLdHkgJ5t9ScQ+co
	NiJNIxyETf0KKWSeJSUOYw4hfI/O69f1TwNt3zxuzbSLPhGK0i8cA868CTEqLDBRFRtat1i/WlygB
	re8pB73mE4mVXLye8DAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC66I-00DQnm-0p; Fri, 06 Aug 2021 20:05:50 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC668-00DQjK-H0
 for linux-mtd@lists.infradead.org; Fri, 06 Aug 2021 20:05:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 4804AC0005;
 Fri,  6 Aug 2021 20:05:38 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ezequiel Garcia <ezequiel@collabora.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 3/3] mtdblock: Warn if the added for a NAND device
Date: Fri,  6 Aug 2021 22:05:37 +0200
Message-Id: <20210806200537.394260-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210801234509.18774-8-ezequiel@collabora.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b4675c64f9326a8caff211ec02599d5d64eb4f81'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_130540_733374_D146B82B 
X-CRM114-Status: UNSURE (   9.45  )
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

On Sun, 2021-08-01 at 23:45:09 UTC, Ezequiel Garcia wrote:
> There is a surprisingly large number of tutorials
> that suggest using mtdblock to mount SquashFS filesystems
> on flash devices, including NAND devices.
> 
> This approach is suboptimal than using UBI. If the flash device
> is NAND, this is specially true, due to wear leveling, bit-flips and
> badblocks. In this case UBI is strongly preferred, so be nice to users
> and print a warning suggesting to consider UBI block, if mtdblock
> is added for a NAND device.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
