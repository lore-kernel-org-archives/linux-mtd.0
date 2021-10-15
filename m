Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F0BC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 10:32:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9922260F9E
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 10:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9922260F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OJrfW7p/hXKZ8pIW5NOF3Fpbskzrh322MJ737793U9Q=; b=m4OdxHCZRmmCxZ
	IufUXTxXVPHQhWcjD+QcA2BEugBL4gViCfN/rFuK0jwUa6f9ANDOxsUEC7K1ICs72C3BM1HA/gYfS
	KN03CiASPq2RUF3nEemCohnGWSTXTo3x0ecXVpnSgdotrfCRwr1cQwrWtl5briGnAFcMm4cR8i1zT
	CmCTTFsz6S4SdmI4brHjhOaFlPvJZ0vAi/rcwYsN8wQZEIlaHIhPZpPhNuqUfj9mijz7gVH5rIFiG
	OikdDDm3th32kiXCA0zGi+rvK5HLwVhQ1C5HkHli4Jzjuy4IKSZaJmdjJ142EE8weLIDd0gTH6JrX
	8/gthAp9nGyrdthE3MoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbKV6-006UZf-11; Fri, 15 Oct 2021 10:31:44 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbKUm-006UXO-2d
 for linux-mtd@lists.infradead.org; Fri, 15 Oct 2021 10:31:25 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 0BA9C1C0009;
 Fri, 15 Oct 2021 10:31:21 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joachim Wiberg <troglobit@gmail.com>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Joern Engel <joern@lazybastard.org>
Subject: Re: [PATCH v3 2/2] mtd: block2mtd: add support for an optional custom
 MTD label
Date: Fri, 15 Oct 2021 12:31:21 +0200
Message-Id: <20211015103121.948998-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211009060955.552636-3-troglobit@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7b09acdcb944a9be6acc38ab1aa8a0ffd08871c1'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_033124_272801_1A275680 
X-CRM114-Status: GOOD (  10.65  )
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

On Sat, 2021-10-09 at 06:09:55 UTC, Joachim Wiberg wrote:
> This patch adds support for an optional MTD label for mtd2block emulated
> MTD devices.  Useful when, e.g., testing device images using Qemu.
> 
> The following line in /etc/fstab can then be used to mount a file system
> regardless if running on an embedded system, or emulated with block2mtd:
> 
>     mtd:Config  /mnt    jffs2   noatime,nodiratime      0    0
> 
> Kernel command line syntax in the emulated case:
> 
>     block2mtd.block2mtd=/dev/sda,,Config
> 
> Notice the ',,' it is the optional erase_size, which like before this
> patch, defaults to PAGE_SIZE when omitted.  Hence the strlen() check.
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
