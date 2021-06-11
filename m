Return-Path: <SRS0=BpRd=LF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D78C48BD1
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 19:52:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEF7A610A7
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 19:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEF7A610A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vy5MPZb/221CQFlORaw4BB/QztWZi6xl7u/zNKVIoM=; b=0tX6ErkpM+tVWQ
	XUIL5S6lAxK59DRA8Dg7kVmDW1o2Zb3p/a02yw+KeD3zt/Ihl0Ojt6OxydlgFNffACay9JDebc8pr
	gVNnuorKNbj4QhZBAENbwLlEaG3BLxdlzUEAEtSXvt3A66qvGFV19IL5QRSr14ub0ggqplWFCZFbk
	jimsuI+YpwMlwIdqiYBt1nvPIgdHcb0DZ5i4NtnKzMj7fa26QN5/Phw4K+yonm8R3C+lRZS7U1snq
	wT/zCz8j1b+in9SMC7ngxVAgwUhBQmyyZtVLDHAGY/czpupU8Dur0f+rzeig1VWt8EvFMaKuHQLHV
	uRa0wfkG9YVHtX81vcHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrnBe-006kPV-Kj; Fri, 11 Jun 2021 19:51:26 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrmQH-006YjN-CP
 for linux-mtd@lists.infradead.org; Fri, 11 Jun 2021 19:02:30 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id F39DDC0003;
 Fri, 11 Jun 2021 19:02:25 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Souptick Joarder <jrdr.linux@gmail.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] mtd: rawnand: marvell: Minor documentation correction
Date: Fri, 11 Jun 2021 21:02:25 +0200
Message-Id: <20210611190225.226268-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210607193736.4654-1-jrdr.linux@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e45fde98e2968e7d5101757f76f8da3abf2cfa15'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_120229_590818_B33B1303 
X-CRM114-Status: UNSURE (   5.26  )
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

On Mon, 2021-06-07 at 19:37:36 UTC, Souptick Joarder wrote:
> Kernel test robot throws below warning ->
> drivers/mtd/nand/raw/marvell_nand.c:454: warning: This comment starts
> with '/**', but isn't a kernel-doc comment. Refer
> Documentation/doc-guide/kernel-doc.rst
> 
> Minor documentation correction.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
