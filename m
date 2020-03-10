Return-Path: <SRS0=Hg3y=43=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65988C10F27
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 18:30:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3250120727
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 18:30:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lCsFSXfs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dz686jM9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3250120727
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iq1NAUqZ3eTXbjRTBxXYl0naOyg7MFytbYcsX1HKP+w=; b=lCsFSXfsYQBPan
	Sx331kKVsEbpuIZ2xGpu/6YxKqyqSQpZFPHW3ezxzUFdCsfjn2aPYERSg3Lkzu7vk7WQXXEQX8dBM
	syXLjN6F7yksqzBGr/4Mo6Wp+YPVZe3PqxAJA/gAHEDLfmzLey/i4WwLZDFMLLQfN01GOeFmlkaCQ
	X3KNFg4fxVTRszydA24+g8LXyyME/jBjgZZAvOxcplB7VUJlqaaOV0g+1rTdyAm6royAYYA+G/N7C
	FnhhzEIS84E2AJBxOolgfvpDN/RK8YPgYv8BG59LscJ1f7pdGO+PICVuPTdG4FdpaJNaGOHY2T7lN
	VkFdB0a3TSiCrD/iybvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBje7-0003OH-Va; Tue, 10 Mar 2020 18:30:27 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBje1-0003KY-AR
 for linux-mtd@bombadil.infradead.org; Tue, 10 Mar 2020 18:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=ZGITTAySN1rrfID6PBa9R6XhcVv5vqprerniGyqhjJQ=; b=dz686jM9D4WFRk7od+SnGKCazI
 UK9UgGovhrJRuAAmlrC5ZOfrzjLyTb2wFbypBHmt+yfz6caf5+3Eh49DsgWlrrRutvjztVltz/Pr5
 iz10WC7gek/Lb4BTZV5zs9N4P7RV0sRv8+l2OCmi23/QD2ruRHAQDzbQuQZ7d/UbHY+OQM/zQYIVh
 /pOCDy+WUGoNosYCIf+0NjLqT2CW3rViiBWdajOikZnJ3ALvlYB5uJZTITfnUinqKUlDnwdXBuIul
 k4gjibzcDdsW6s+epihTVeXi9eb7HxRahDPPNwZUgcdND6VOutn71yV/QUTCJgCuR/hYAXYiSXAfj
 OBPSsbQg==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBjdy-0003Rj-Mn
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2020 18:30:19 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id CF7D8C000D;
 Tue, 10 Mar 2020 18:29:45 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Piotr Sroka <piotrs@cadence.com>
Subject: Re: [PATCH 3/4] mtd: rawnand: cadence: change bad block marker size
Date: Tue, 10 Mar 2020 19:29:44 +0100
Message-Id: <20200310182944.17732-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1581328530-29966-3-git-send-email-piotrs@cadence.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: bc78e96b34543947405e488b469fbd1b5f3f280e
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Kazuhiro Kasai <kasai.kazuhiro@socionext.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2020-02-10 at 09:55:27 UTC, Piotr Sroka wrote:
> Increase bad block marker size from one byte to two bytes.
> Bad block marker is handled by skip bytes feature of HPNFC.
> Controller excpects this value to be an even number.
> 
> Signed-off-by: Piotr Sroka <piotrs@cadence.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
