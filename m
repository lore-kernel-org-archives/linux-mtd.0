Return-Path: <SRS0=Oy4p=7G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A42C433E0
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 19:07:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32B24207D8
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 19:07:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ko0GwB4h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jOWEnQOI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32B24207D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ko9PXe/fL6uDrNYqJ/HLlM2P3EDmuQf2Ud74VsTugkU=; b=Ko0GwB4hf9t9Pe
	DUsIaSf4gO+JueQMNxf/CfYphR6zvIsVtuN3Iru4VQSBK2AZrfUo9OIfj8uzt1/ObN4PbnWrkXoE6
	R+LOLv9lNYclEf4xBPSGqLaypWbBWlPRir6YndCk9LieiZrR5e+dh9l3eJFR2QqAb/rK50ab+r2Mp
	coZCzFg3B84hh9R46z08hE9GVPrMqt0XvGE3L7wS3XP6zTVr3/jLoeO866B0xKcMc1B9Mx+T1HuCw
	HOXVTZtRCaiO7qjYsvhF7ZXOnJyrVPGZgGyY804lbS6QVLkhhrd6fyW6DKqgCErKjt5pPz6T5TgOg
	5/G6zwBleZzEYxG3N0Ww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcvxZ-00055D-GS; Sun, 24 May 2020 19:06:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcvv2-0000hM-FS
 for linux-mtd@bombadil.infradead.org; Sun, 24 May 2020 19:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=xo4isy4AI0R12SoYT7Tx2O2SHN1R6DvJSb3Vgo/1mvw=; b=jOWEnQOIHtbuHstwwCjJjPUyE5
 pUYyAxs0Y+LVmnadLw/dV74F+radfxtgkHEMuu9iIwDFilyuLTauOQAqRBcCJKgZP7dXW4xXlrGlz
 1cpcg3ptRZNFfmN9Vc7PBlkYFtywKZlusYRLCdv0BRONzaokj2AiGSTPDPSQ7VSdjm9nvPrvHQCUk
 SoahgO66VNnf537pv2A2+vI9BXG2PHAqhyz8S/R6mn72zn1Ecc529iJoggQ3LfOMHJITVzzZCaU8B
 rItag7ut1BzOnooyNL/sEOUhvYvF/1YFXSGHAk8d1T3NN9VjgdHCAO8+1lC2jVcxKjViVLh1DXc+u
 qDV95I7g==;
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcvuy-00087J-2n
 for linux-mtd@lists.infradead.org; Sun, 24 May 2020 19:04:18 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5DBEE200008;
 Sun, 24 May 2020 19:03:42 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 60/62] mtd: rawnand: xway: Fix the probe error path
Date: Sun, 24 May 2020 21:03:41 +0200
Message-Id: <20200524190341.4579-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519130035.1883-61-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: cc02e67b66292891cb540ee5289057d53df14439
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200524_200416_378367_D3EA7F39 
X-CRM114-Status: UNSURE (   9.02  )
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
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2020-05-19 at 13:00:33 UTC, Miquel Raynal wrote:
> nand_release() is supposed be called after MTD device registration.
> Here, only nand_scan() happened, so use nand_cleanup() instead.
> 
> There is no real Fixes tag applying here as the use of nand_release()
> in this driver predates the introduction of nand_cleanup() in
> commit d44154f969a4 ("mtd: nand: Provide nand_cleanup() function to free NAND related resources")
> which makes this change possible. However, pointing this commit as the
> culprit for backporting purposes makes sense even if this commit is not
> introducing any bug.
> 
> Fixes: d44154f969a4 ("mtd: nand: Provide nand_cleanup() function to free NAND related resources")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: stable@vger.kernel.org

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
