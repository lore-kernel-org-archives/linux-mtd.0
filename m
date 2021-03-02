Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDFEC433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 19:25:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12BEA601FB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 19:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12BEA601FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PH6ijsreWfjlKqgOn0XzWXdUM+ZUTo0366CByJE4nfc=; b=Ce/uwDkWL9ljkkG5DrYwUmDvz
	ToRl44hdYxnNaMbDZkybFwb4WnbxglddUz7Y7r3PsHA2tyHa8snPk5jQpgSqtSJwYAAGj3R6w0Tx8
	tBMCzWDq7k9ttdVr0V3xOtD+cICzSOkdWlJjkG8PnHAtQpq13JDrJIZuXGkbVkX9VdgY5zo6tVvkT
	QubStPPpqlQHsJxccc6VEo3RrnMlXoPODU1Qg1wo9lkKcdKSQpLz9EXh5ks0AJfa4uqirzh7UfLTM
	wzWBfz5EmVoD0F4apq5rJ4VKWbr+QP+VYaU63SRZr3acbsfxiOtnuDYrun3P79lAdI0oTtkbP2VGB
	474fiT/Pw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHX6p-006Ca6-S5; Wed, 03 Mar 2021 19:24:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT3I-005I01-2W
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:04:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=82gymoE2e7SwT9F0/LL9HsjAIE0UemriXWiFd1vJePg=; b=ka1o5mtA0m7ozGINkvC6FI+wQC
 Wg71gqR6Ml+qF3/rp6IUtWlcD3vXIJF81WlwwtgbFzzrdrQVtGgHHtyrP7+/BvpfwWFOqGVCI7oCi
 JPFFiFu922mow6FuMFTW8rSmA/O2tC2Egp/RHbQRy7DrkBPkThH+zijkO7oJWPBV284/96392LKaG
 GBxRCpSgPe5GS9pbQpdykmViQ46i8ug42ghzE9aT3WlE0UUQOd/uZlsuY4OgFEOu8aV5y2u7ePcOb
 lvpTJje6UwVGARjFL1USa4+m17Pu2cphJ59D8mpZ8xCOJ/Hd/Kk/kYtIbeQoxSye2LnTm64c9MTxW
 79HkQBYQ==;
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH7xd-00HSFO-SK
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 16:33:29 +0000
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 47EF4200018;
 Tue,  2 Mar 2021 16:33:03 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, kernel@pengutronix.de
Subject: Re: [PATCH 1/2] mtd: nand: fix error handling in nand_prog_page_op()
 #1
Date: Tue,  2 Mar 2021 17:33:02 +0100
Message-Id: <20210302163302.23591-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205142725.13225-1-s.hauer@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 52f67def97f1c56779a86babdc96ea65b3a0af3e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_163329_848575_C5FD702E 
X-CRM114-Status: UNSURE (   7.77  )
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

On Fri, 2021-02-05 at 14:27:24 UTC, Sascha Hauer wrote:
> On success chip->legacy.waitfunc() returns the NAND status byte, but on
> failure it returns a negative error code. This was never tested for and
> instead the return value was interpreted as NAND status without error
> checking. Add the missing error check.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
