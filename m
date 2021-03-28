Return-Path: <SRS0=g52K=I3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EBD5C433C1
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:06:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A8AC61959
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A8AC61959
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cyhZdnhzzoFTTFyWAJWkziyBuq47NlIW6/VOv9McVcc=; b=rceNME0ez0O2WqSkY9fIeWSlV
	GUFHRpTjyB3i3HDVxYfyz3WDKx3KBm/SkoZN535x2KU1ky31D+V3cxoQbNsAOW0SK1sfd/64xHVP6
	A48sKW3IVSQKvF8NqXzdyRsies87WQPuTimK6R9hib4xAl1G7zYN9Q29FWhZkrV2pwj6k+x18Z/D7
	KsTFFwqYl9EceDxaIiB94igEHPVAEMXTXi55Fc/L2g6SDQIoPg8S8FRrV3HJSCKl/sJ7F52r1wOoQ
	8i7U2hSR63LFeC0nPaQu/Nnm2wD5Gf/nKLdEE2JSm8W4GaJIwtotmWir61j96qor1etRe38gM2xcb
	OGRqrvK3A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQvJa-000qJU-Se; Mon, 29 Mar 2021 17:04:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQou6-000ZVB-Ly
 for linux-mtd@desiato.infradead.org; Mon, 29 Mar 2021 10:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=y/z6zEdFR6fzM+xjVlNBcILShhHgKLWa/RwriR8jpT4=; b=ssgnj8+QkmwLzOiMgGHZofQNTZ
 SxmQPT0lvb/JZH5V2mhG6TvHYav/huCr/eLQUrN/3AfQcwiZ2jDjoQA96GHVPz60u2RzN4F+V89E6
 9U6BXgVowsVQxKFq+Ty/nXOsPfzz8JR5n6hDsssFz1G3kk2Ck7SeuoTpjxVm/YLqF8W0s/blJZVeI
 gNHXsoqbBX/hs2eetY/2IsA5BKPLge3Md8lEqcicoKzrbTpnem0d5C4AAfFzCKfL/HP9c1OeFQTt0
 kBUL8BRIh/KKbAJhmJ7SMaZQQGg0jpKDZl1s014HBJdFW7tMr8gITadOn3gqVxeNf0ivRXZWxGYe2
 tiEJNWEQ==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQZ0V-000Jnc-HL
 for linux-mtd@lists.infradead.org; Sun, 28 Mar 2021 17:15:30 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 54FD21BF203;
 Sun, 28 Mar 2021 17:14:58 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: f.fainelli@gmail.com, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: rawnand: brcmnand: read/write oob during EDU
 transfer
Date: Sun, 28 Mar 2021 19:14:57 +0200
Message-Id: <20210328171457.7775-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210311170909.9031-1-kdasu.kdev@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a071912636cc3420f54e2a6312c1625ac763cf03'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_181526_395175_8C92AE74 
X-CRM114-Status: UNSURE (   5.31  )
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

On Thu, 2021-03-11 at 17:09:08 UTC, Kamal Dasu wrote:
> Added support to read/write oob during EDU transfers.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
