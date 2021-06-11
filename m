Return-Path: <SRS0=BpRd=LF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AEE3C48BE0
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 19:53:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 146CD613D9
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 19:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 146CD613D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q93JxqEEy2WzqAjmzEPKX8kxxKerF7UpAGuLER1pG6o=; b=hVGPvaqm72Kr9Z
	DXmKy9HrrWJU2Hw7EilFDQwwuzzWdh1sKd36wTd3UhoXQ37Zxkqv2bLyEAlcT+xvcI2/4tnqj3Vrr
	gqd5nWyNPX8JcgwQd7D7j9JFrdmpDPfKIYUFWnD35qC5u4FPFUPy7pIxsWeJXQroTaBGEFgijatjK
	/oiicP1VZaAIDnuoUu4nTi4M+gQ8eBHG361LBuShBAhw/L4CZYhyduAa44p1/GzA3TsPvMLIFl5B0
	ewlcW6AIU0Y4UCN/dfCiG3Hk0fyv53F2iT6l/Ph0WmbX7mZ5K9lA7utvBXJq7kZOKf3qx0sLauozu
	VOHm/9lnFkcqivF8IqPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrnDR-006lGm-Do; Fri, 11 Jun 2021 19:53:17 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrmQN-006YmF-3q
 for linux-mtd@lists.infradead.org; Fri, 11 Jun 2021 19:02:36 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id B1619240006;
 Fri, 11 Jun 2021 19:02:32 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhen Lei <thunder.leizhen@huawei.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/1] mtd: rawnand: r852: use DEVICE_ATTR_RO() helper macro
Date: Fri, 11 Jun 2021 21:02:31 +0200
Message-Id: <20210611190232.226335-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210603123339.12089-1-thunder.leizhen@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'fa8f27f50996c2f11f82c3d223e19042431d3706'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_120235_319687_FC1EF4E5 
X-CRM114-Status: UNSURE (   5.83  )
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

On Thu, 2021-06-03 at 12:33:39 UTC, Zhen Lei wrote:
> Use DEVICE_ATTR_RO() helper macro instead of plain DEVICE_ATTR(), which
> makes the code a bit shorter and easier to read.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
