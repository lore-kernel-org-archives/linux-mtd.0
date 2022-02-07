Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06049C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Feb 2022 16:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q8OwmtN1Vz0m13awpDRzoUP5nWcl6Qd+am1aMA3Sdc8=; b=fmcRxhdn/gP/3h
	2J4JU6dQjoUNeBAqBVJdNQt6uxh76KWXi1AghgIxYelBvNuT3/h2SASraZfhR7TBPLJjINenggd0A
	uDhAoUQtiMbgm1DcsUBQaMmj23ZJKS2pMqPRexqtOuKFdmutxjh9KC47IBbHE85JRpvmRRhUiniQS
	pJ6LeqswpdlhY7RySwAN8X7fkL/43xbIPDq+nTBlhfLBeQjMBzNubpo8ORkEm2/S9JVEyyOKbA7p6
	abN+gZN36yWli6Ej7Od50kfz+kbE1z9vCqIfJKz6ALOMbsWZ2ZAircTmSiDZptLyrMtvP0osSDaV7
	UZOQAhslT8Gu5wh+IRWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH6ai-00Azbg-20; Mon, 07 Feb 2022 16:10:12 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH679-00An33-06
 for linux-mtd@lists.infradead.org; Mon, 07 Feb 2022 15:39:40 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B2FED60004;
 Mon,  7 Feb 2022 15:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644248377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Qlu/dP32EO/7XpfI3Bdu08FGjiLX1Jb6BHfpiBveSY=;
 b=CMwBo8YFwsotBlQjXMY3iBpnfB5BTbe4jDv76zIRAfEMmu3eBu7h9HOHTLBJBUtY/4sWXY
 AhL8FVmwp9mr4E+mHHEOj6tzMAlXYbm2yjEdtEcO75FrJRzIxlIt02S8NIW/HZIUR004QG
 wCy4V5Uvm4QUvYFEZsRKNvNwW5/nCRTgU58fOoo4Fcw31+lE0MubX5xSZilEwLa1WO6Mkv
 4WihSErJx6POsiTEhp2ju5dhyRjjUApWzN7TOTEO7AtG1c1v0xSMX1Sv6X5GqIUJFmWg+G
 qf008J56Y1Kw0PhmYW1B1o4WELu9ZKFhu/bNLPrcmx1m4GHsPYBfxSqYjltK6Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 2/3] mtd: mchp23k256: Add SPI ID table
Date: Mon,  7 Feb 2022 16:39:36 +0100
Message-Id: <20220207153936.710399-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220202143404.16070-3-broonie@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'bc7ee2e34b219da6813c17a1680dd20766648883'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_073939_258210_41A09ED7 
X-CRM114-Status: UNSURE (   8.80  )
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

On Wed, 2022-02-02 at 14:34:03 UTC, Mark Brown wrote:
> Currently autoloading for SPI devices does not use the DT ID table, it uses
> SPI modalises. Supporting OF modalises is going to be difficult if not
> impractical, an attempt was made but has been reverted, so ensure that
> module autoloading works for this driver by adding an id_table listing the
> SPI IDs for everything.
> 
> Fixes: 96c8395e2166 ("spi: Revert modalias changes")
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Michael Walle <michael@walle.cc>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
