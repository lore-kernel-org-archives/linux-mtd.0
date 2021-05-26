Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF89C2B9F7
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 10:14:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92781613AB
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 10:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92781613AB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G0gz91u/dggWD9+MoSBBys6QKAqdRD/iM1tja2KKcHo=; b=fUV+hqJxyLobzn
	5Eridr0SGwASxqo6Da7wpfwiQoFqpcVmYmNRK2mZ7FtCQIYNuWvqWyfUzlJQVIza4dwVsDQ9u8ED5
	iJNOUdvMX/8hRFjwxI3Bh9XrT1FLyxaQmx6H3gjBPJXN/E8UOz/a91WLyoU+qvvIj8LmOZ9o2MkvV
	TPQ7RkcyKM5Dsfn78BLBVDrRAUWHajuJECauB+6HixZoevnl7tngrONAZ0tOxJSUVJNwqGuRe2ay1
	TqxkW2sZmHD9IwHQQ0snzYbwrd7cssgyfHpV3nq56iF/lemBfPyfgrumvZnn23f1rfZcyxY/f34Gs
	kc4i7D+rp6NgJLHBBAtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llqXZ-00D7hd-Ug; Wed, 26 May 2021 10:13:30 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llpSn-00CiTo-Ae
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 09:04:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 8FEFDC0002;
 Wed, 26 May 2021 09:04:26 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>
Subject: Re: [PATCH 13/22] mtd: rawnand: Access SDR and NV-DDR timings through
 a common macro
Date: Wed, 26 May 2021 11:04:26 +0200
Message-Id: <20210526090426.181884-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505213750.257417-14-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd7a773e8812bcf7a5412e4baebc6eb1c11242551'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_020429_563259_081CC2FC 
X-CRM114-Status: GOOD (  13.74  )
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

On Wed, 2021-05-05 at 21:37:41 UTC, Miquel Raynal wrote:
> Most timings related to the bus timings are different between SDR and
> NV-DDR. However, we identified 9 individual timings which are more
> related to the NAND chip internals. These are common between the two
> interface types. Fortunately, only these common timings are being shared
> through the NAND core and its ->exec_op() interface, which allows the
> writing of a simple macro checking the interface type and depending on
> it, returning either the relevant SDR timing or the NV-DDR timing. This
> is the purpose of the NAND_COMMON_TIMING_PS() macro.
> 
> As all this is evaluated at build time, one will immediately be notified
> in case a non common timing is being accessed through this macro.
> 
> Two handy macros are also inserted at the same time, which use
> PSEC_TO_NSEC or PSEC_TO_MSEC so that it is very easy to return timings
> in milli-, nano- or pico-seconds, as usually requested by the internal
> API.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
