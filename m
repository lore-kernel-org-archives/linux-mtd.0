Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32319C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 10:38:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E75AA61056
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 10:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E75AA61056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=frsluD9kG4jpXRh2EqKfLQMlwIifHCxbLD56u+lGxIU=; b=HlpFVs0jiBQYVs
	UyTTldLrGtA8iSrYqXxaA9Kg5wLR2EXpf6K1i85yF4F91aT3Ku7vMHN99eL7CooW433Wj44n8pNBR
	v3MG3gIDC7Vft/rrBlJkGxc9BX7Alg+WFWZ3aHC5zoVkjyI78S2WB/DawyWI2h+pK/bsSg4VAWGpc
	tkfD8gNRd6i+athcugr392FBFTBZJKWAGdat2oUniK9bY0bEDZrp52MUs5Nnm7me8adLg5OBDlGTO
	qxb+SO4x1H6vBXme3zQAgfmBmJekHUzWHsCwbGaVufMVjQWRJh/90MYECiyEym6wqCX23iTso4B+e
	qknA4uPnA/77kg6w5cvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbKay-006WRK-N0; Fri, 15 Oct 2021 10:37:48 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbKVY-006Ujg-LE
 for linux-mtd@lists.infradead.org; Fri, 15 Oct 2021 10:32:14 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 8F26B1BF20D;
 Fri, 15 Oct 2021 10:32:10 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 6/9] mtd: rawnand: pasemi: Keep the driver compatible with
 on-die ECC engines
Date: Fri, 15 Oct 2021 12:32:10 +0200
Message-Id: <20211015103210.949577-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210928222258.199726-7-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f16b7d2a5e810fcf4b15d096246d0d445da9cc88'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_033212_863453_9866EE3D 
X-CRM114-Status: GOOD (  19.50  )
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

On Tue, 2021-09-28 at 22:22:45 UTC, Miquel Raynal wrote:
> Following the introduction of the generic ECC engine infrastructure, it
> was necessary to reorganize the code and move the ECC configuration in
> the ->attach_chip() hook. Failing to do that properly lead to a first
> series of fixes supposed to stabilize the situation. Unfortunately, this
> only fixed the use of software ECC engines, preventing any other kind of
> engine to be used, including on-die ones.
> 
> It is now time to (finally) fix the situation by ensuring that we still
> provide a default (eg. software ECC) but will still support different
> ECC engines such as on-die ECC engines if properly described in the
> device tree.
> 
> There are no changes needed on the core side in order to do this, but we
> just need to leverage the logic there which allows:
> 1- a subsystem default (set to Host engines in the raw NAND world)
> 2- a driver specific default (here set to software ECC engines)
> 3- any type of engine requested by the user (ie. described in the DT)
> 
> As the raw NAND subsystem has not yet been fully converted to the ECC
> engine infrastructure, in order to provide a default ECC engine for this
> driver we need to set chip->ecc.engine_type *before* calling
> nand_scan(). During the initialization step, the core will consider this
> entry as the default engine for this driver. This value may of course
> be overloaded by the user if the usual DT properties are provided.
> 
> Fixes: 8fc6f1f042b2 ("mtd: rawnand: pasemi: Move the ECC initialization to ->attach_chip()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
