Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BE5C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 14:10:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B5CA64E89
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 14:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B5CA64E89
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b0WVfSZU1g5rZyzOuEaf6cpTBhK9USG33MRk/p3ZtQk=; b=Fcj5rht/F/W9rBIaS1e1Y2cMD
	wRFAgqbj47PBL8uA68X/ux2KBNemGFJ5Pc2ZSFf8ItSuSkuU5ggkSdOCb0CGRNQ+iE+VCkr/3S9+z
	UsAqkvn7KT+uUfxDDTQBagnjHxbq6mVquMDAi0eZossr03AWDSVbZzKi3a5qRx+Qa83rzEDik7O3D
	fM/8qGHbteIItG0cuTwozCsOIaKFiG7nLQaHJpP53VHN1WLq5aZ1ppTIajr7futQMapY9+uc3hwIF
	Yi33iKj54+IDsyY4ipL3FMeDSVJpCNfjXh+VdxnYka2siqTX0JcREXUgpSv8gp02GuyVHOkxu9xiH
	I8aeo8DSg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHSBJ-0054KW-N4; Wed, 03 Mar 2021 14:08:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHS56-00527U-P3
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description;
 bh=o6kCqn2MAa0g1QfKp+HWjkjYZ+/o/D18hOA4pvkHpa0=; b=uxj5v8JnqqqqAJ8Hd8uADnc9wa
 aIuWTUxmiEv4YFQtxT4FJ2Tn6fiWGXyJdKIqAI5sLx7Wn2c0JmQwJ7ykSIszItgqYbiMbbfahIwKN
 oRciRCnFT2F9RAov9lEKHqGNg1mLRjlHAck/p8yZd/dTY1XOlBznPCRXQj42BNufVaaglNTr2SMnM
 ldgp32TJJLOdkSUl+wAPW/K6kSYGA5XeRcWUqKU3ynyYDCmCQiDQP/UdyN+ez3uuuGq9aUSfNKB21
 I653z8GfMV/ciNH1zEU81jPSPIqkHsgSmoVHB6umiDSj0wjPnXXivBQ5WAyN/LGwi/+9cxTRdk9tI
 DoCGqnlw==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH8bM-00HW8u-Sl
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 17:14:39 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 40AF5FF806;
 Tue,  2 Mar 2021 17:14:05 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Bauer <mail@david-bauer.net>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: don't lock when recursively deleting partitions
Date: Tue,  2 Mar 2021 18:14:04 +0100
Message-Id: <20210302171404.1172-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210217195320.893253-1-mail@david-bauer.net>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 6f89cd33e45cccf37c3d515aca0f5312e30c0127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_171439_122268_62A102F0 
X-CRM114-Status: UNSURE (   5.53  )
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

On Wed, 2021-02-17 at 19:53:20 UTC, David Bauer wrote:
> When recursively deleting partitions, don't acquire the masters
> partition lock twice. Otherwise the process ends up in a deadlocked
> state.
> 
> Fixes commit 46b5889cc2c5 ("mtd: implement proper partition handling")
> 
> Signed-off-by: David Bauer <mail@david-bauer.net>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
