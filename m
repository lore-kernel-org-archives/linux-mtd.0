Return-Path: <SRS0=g+sZ=5J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AFA7C10DCE
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 21:52:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEA9120735
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 21:52:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zvw8Uhl/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEA9120735
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9OLcMZpQh72qc/o7a/9sXHk98nvnKSVKUTTO9vauQ0I=; b=Zvw8Uhl/w2c//5
	vvLWCW0xMmaiJ8+zUVYJOHPogn9IiNuKqMLbhPUciCtdcxvfsp3jbGum57HKK+JJCUqi9oDrK7Hez
	ZVmQ5PFRl2rVzwvtlOZRoygc9rj050n4SQg8wRfWbcPoQDAFo/cYNy/DjfLhhKKrlSFQhWj+0k5jo
	/oGtf1ZmiDYqLYikQu4tsVZ/YbK7nbXaEns85WXc3n2W9vQ7AAP7NqH+OVZQAoGJO2vIFq3xL6Wti
	FNItUFdmjZaix7/94HsjKj8E8IEYbizdglVyuNhmPQdAHiA4ztTBF0CpGVPj4P7wAY++Rl80yxn7b
	a7DghgaBPB8O8yZmGaPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGrTc-0008QQ-6b; Tue, 24 Mar 2020 21:52:48 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGrTT-0008HL-Ez
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2020 21:52:41 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id F1EC920003;
 Tue, 24 Mar 2020 21:52:26 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mason Yang <masonccyang@mxic.com.tw>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, bbrezillon@kernel.org
Subject: Re: [PATCH v4 1/2] mtd: rawnand: Add support for manufacturer
 specific suspend/resume operation
Date: Tue, 24 Mar 2020 22:52:25 +0100
Message-Id: <20200324215225.14249-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1584517348-14486-2-git-send-email-masonccyang@mxic.com.tw>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: adc6162b9a0c60a81cf6a107196924526cd186f6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_145239_686675_69E6F367 
X-CRM114-Status: UNSURE (   4.86  )
X-CRM114-Notice: Please train this message.
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
Cc: juliensu@mxic.com.tw, s.hauer@pengutronix.de, yuehaibing@huawei.com,
 linux-kernel@vger.kernel.org, stefan@agner.ch, linux-mtd@lists.infradead.org,
 frieder.schrempf@kontron.de, tglx@linutronix.de, allison@lohutok.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2020-03-18 at 07:42:27 UTC, Mason Yang wrote:
> Patch nand_suspend() & nand_resume() to let manufacturers overwrite
> suspend/resume operations.
> 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
