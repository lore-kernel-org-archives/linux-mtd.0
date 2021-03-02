Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3774C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 18:48:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 041EC601FF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 18:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 041EC601FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zDZ9MGyxaMEc37E/TFl66BGPmylCyIYhb/Ylxzp/8bE=; b=N1/jJrMO4Zm4f9DBbeEiNOsw0
	CyPWfnLDIvtZewEf6VJAFpi0L6wkW8oJew6+G7JgxyHsLD7nFjnOcH6JpLpXg00vRfUEMCm1yrPUr
	Rb2VslK8IeYXobCTIclI+YCR15c/Fesea37qQRe7qa6BXSpKtcqA9RIieT2tpj2Evhj0QZdT/CWMO
	dXsSVIjFPyCF52pBErCZ7RiIXXNQLaOl1dhcgWzHlqqIK4fkfUFl3TnbKXK9gxP0gzEPksJyerJ0W
	MgDBez3zCiPLHL3C6g4V+STLApVBtP5qq/ubJ6QbZh2Q7N5H1uyQ1oXrwy5tfx109aQ2DQ7ojTyFO
	9omggu89Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHWWT-00657Y-Os; Wed, 03 Mar 2021 18:47:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT1X-005HOY-6l
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=+ZQNeOTwYPvcuZoLF5FXCfNEplhqBWf+3XSNhJUAZhA=; b=WIBPqTT3Cms8Oorb/uVR+6BGKZ
 KwRRT7T/A4LULjZ0BoIsLXwHKBq68rEDZgQ0yverNjrGPmhEBCX0gDMWDkdWpCb7cEr98Ucsp3m7L
 h1FpgR3IM7r599il1Dnc+71LOcKZtM+pI1Mt3FT5ErgACWC02stydT66bP2u+6GUFHxGyWRKjVgLr
 sXoLv6L4VjqzGqNzaA1kHeRt6I0la1ptLI7+ZrSBHvwL/XBSg3aSQ907hzrUuwOaS3FubOvWA0vHv
 tWLpUhEv/kr3/dOex+/u7h83/0l18t56b47Fb/rJccrQ8VXzN6zWTfA0PqIc075ztfxx+X6I1DBHe
 NK7ugj0Q==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH7yO-00HSJQ-EV
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 16:34:21 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id F376B1BF213;
 Tue,  2 Mar 2021 16:33:49 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Adam Ford <aford173@gmail.com>, ladis@triops.cz
Subject: Re: [PATCH v3 2/9] mtd: nand: ecc-bch: Populate the public nsteps
 field
Date: Tue,  2 Mar 2021 17:33:49 +0100
Message-Id: <20210302163349.24156-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210127203020.9574-3-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: c16459eb54a1a4331f8beb17631cc01944162a9e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_163421_686701_E1975926 
X-CRM114-Status: UNSURE (   6.14  )
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

On Wed, 2021-01-27 at 20:30:13 UTC, Miquel Raynal wrote:
> Advertize the actual number of steps that will actually be used by the
> driver by populating the public field.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
