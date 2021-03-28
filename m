Return-Path: <SRS0=g52K=I3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95FBEC433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:53:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0712F61981
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0712F61981
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uCY22xGrncfgIB5m9DiP3Gxe+Oh7gAdRr2HhdrOB5EY=; b=STQ6PIIKn18aqw/NFBIk2nbvs
	PX01kPJ5OXcIXz6H1bc5bIJfuFzN9YcdPcMy4LybxEbWZGjdYH8uxWv2TOAUJ47qcEh1HypAq/Cmx
	3jpDhQsvqOB+OtwkjT47ZC34qSFm7q2kAWdhMx4jNEZrQmOCFKzPqv9g659P/fDyJK3KoOZAT6zLN
	LBXuRneIPYWzZyOUSQb1DBivdubTTTZSz49FldjZ1nKgz1/msFP1Q6Ypi4TAT+jkDFXk9dGEl/WLK
	Iu+VkLjItRN0YQX3tQru2S28ejfa6d1k1QYPRm+CEF9/QWy8iYvbOZkO6aF0ZMpQDHMpsf0JJANuN
	mtSYEGR4w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQw34-000wXn-47; Mon, 29 Mar 2021 17:51:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQoxA-000ZeH-OZ
 for linux-mtd@desiato.infradead.org; Mon, 29 Mar 2021 10:17:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=kLcodeHT8QsDGqq2D6J8NAEFDwKmhVaFJmBP69hCxK8=; b=bLsKg7H7KsqEd1f1MhcKwtUDSW
 Rqn3MyLOER/b499dAduEXQAko0qR/ZigTQ3CfyDU1giRxjW2Almo4PeJZxNIJxsfC4haSoRI+yZYY
 Gow8MZcXOLihh88TOvdwkbBDVi/YAi4QtIhElbYcNYX7u24u1HfzDofr5PefHQ+BcaoXzRLYHJTcL
 JCstydKLQYhTPcwDvu7ZsnPa/nq9FLdClI3rNpFPZQ3gWvZ7IGgVKIzB3HVjeOVuwbeW7ZlSs2EyY
 vkxusXSNjGcP9DGhNzfXnDPm6uVskEd8FpOwIr/0aabgzh0Sp8mC9HgmakfR5IIh19R1iy7NM5nmb
 +lx8DVbQ==;
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQZ06-000Jh1-0O
 for linux-mtd@lists.infradead.org; Sun, 28 Mar 2021 17:15:06 +0000
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id AA315200003;
 Sun, 28 Mar 2021 17:14:34 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>,
	miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: mxc: Remove unneeded of_match_ptr()
Date: Sun, 28 Mar 2021 19:14:34 +0200
Message-Id: <20210328171434.7514-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210316000042.200392-1-festevam@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'1200c7f834ae7060c61f098db305ef2b92181226'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_181500_468950_C1F7211F 
X-CRM114-Status: UNSURE (   5.17  )
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

On Tue, 2021-03-16 at 00:00:42 UTC, Fabio Estevam wrote:
> i.MX is a DT-only platform, so of_match_ptr() can be safely
> removed.
> 
> Remove the unneeded of_match_ptr().
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
