Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160ECC2BD09
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 12:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=80xUImhreTku+n3+OYXcmiMYTLRNT90sp810zb14g88=; b=y0PtbBMOBYWA3s
	K4foXU5QmWgnRv/YuZHHaPmbwGuvIGqx35vmfxhyS91vtFO1Fp8Uo/AB5gY971cHRTFw9EwVY42kF
	gsVpZQWVZS3ktWbU7k3hmrTQJvjeCk+ZEcMLO1sb1J0qJ+h174q+ZGSG1w3EINiOrNi55krP2AmPx
	/CFsBKqmxEjF0fdaEhvGVwTtCTFhh2gZSZJ1nYAMe1Qz/oxhXt1oFbx0l/UFbodWP132CP3gkM6ZO
	XClDq7tU7J8sF7TbWtsit3vILFvfjanWJ5DZj2tyckRq5xjPV7hK6zfyutptG5P385CkAWuwndvi4
	k9w6cYGosM0piLc2CoKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOG4p-00000003AGP-0Spr;
	Mon, 01 Jul 2024 12:24:11 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOFi1-0000000302T-4BvF
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 12:00:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4F3160007;
	Mon,  1 Jul 2024 12:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719835233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=64LFwUS4Is69wJ6D0Vpr/kBDvHoL1J6TvpQz+n9BfAY=;
	b=pklm/J+pHxLS6jke9M71TPZjw/5/1KY+Hb/WI+jtYFo+73jz/h918s4WeBbz7mpjkfZxEQ
	HXo75L36noysRxjErknWqFPMJXRRf1rccxUi2L/ZBIXatHDcXzIjxRNJOyLivn1jVm5/uP
	Fy4WzsAVoq7jrsMine9OdYsh2uS68vuSObNAjq+f/8w6wZi3rOXOmbhQGApjZ6MMT0htlF
	1QwPaBZyzFzjWp8P3SPS0f5GZQriTAT77HnAQc968mZ4BBmJHkya4ObaKSyb3uT6c6Lhga
	6Z3nGjHt2z2XX2bMCR1P0+j3Ewj4Dgk0msT4NZ1EsClJdr8ZVysGeRMzuzdiHg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: nand: mxc_nand: always copy_spare() for page write
Date: Mon,  1 Jul 2024 14:00:32 +0200
Message-Id: <20240701120032.525600-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240528203006.1479230-1-s.hauer@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd3dfbae6d4adee33deb804d28d10045878974471'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_050038_222729_A1970993 
X-CRM114-Status: UNSURE (   7.41  )
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

On Tue, 2024-05-28 at 20:30:06 UTC, Sascha Hauer wrote:
> When doing a page write we always have to copy the OOB data in place,
> as the controller will always write it. Not copying it means we write
> random data to the OOB area.
> 
> Fixes: 3df54960b63cc ("mtd: nand: mxc_nand: implement exec_op")
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
