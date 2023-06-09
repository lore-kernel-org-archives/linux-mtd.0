Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C313EC83005
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jun 2023 15:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=isaKceeET5ijePFI5+35pj9QAyOcWEfT4lEhoiBWeGI=; b=fR+6iVz6uyMyZd
	X+ZEau6bxfSNgkdt7Tae63HQl4njDgl05uL10J+sDWSmppXq39RhE+gXpVt31ZCLRei+yn21z4Elo
	0L0G+IalGaCZKrXhr1Mt9XrpGAku/Z5hoBFGa5lq+/tkGBYs4f8DHTytYcI17yvpojk9nmced+/TZ
	eQLQcmtcLc8oUsKdN/hbrPY9fRVea4H5yQMr8n28w0eD2lxuJI2p8I8ZPWjVQnVYwH+IEJNG6Qab5
	tyUyUH7+VEukVHJaJYxYF8Aln+Io7yuIzumIs5Kg/G1h1XEcXtHJbqPBtIgFEQ5qV8B54i09vXtP1
	oGpHg/H9nfH7w4UPm0ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7dzS-00DQR7-1N;
	Fri, 09 Jun 2023 15:25:26 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7dzN-00DQK7-02
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jun 2023 15:25:23 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686324318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=306gdX49aWRqWTeObBTGrv9siCZ4NYBUNF2h3Edi8a8=;
	b=UW5B1xcsQjBCPoDeLLyWxC/PK78c8UNY3/pR7Lq6fvrSlAA1M6p7iVb9brGZDl4kM5vlc6
	CKJVV5euqlCbTF/RWIk1+XIG2z4PeA9MFVbmnvxYBpUdaQH3RmipHWEB3ApsOd14/7QMpS
	SQx7r7iHAvkYi9w9ui2ax8ZO0+AVwYYBYFl6bx0l6s52Cwwgv9AFLLJTah8FBdgrpiPd73
	rLvCSDOV+wkTqm1g7+1Qa7TDK66Wl1jngMmudthHZcJPgCMNnRyUyqjbvEhuIGMoITcvei
	IglIZRZaFX/AIddA+kAA5XPzPN3pU+E3/OYAaOChHi+aNlGJ6R8fs1LOSI7FfQ==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D671FFF80D;
	Fri,  9 Jun 2023 15:25:17 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	git@amd.com,
	amitrkcian2002@gmail.com
Subject: Re: [PATCH] Revert "mtd: rawnand: arasan: Prevent an unsupported configuration"
Date: Fri,  9 Jun 2023 17:25:17 +0200
Message-Id: <20230609152517.1187095-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230607053936.14306-1-amit.kumar-mahapatra@amd.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'21962132044653f42ff8bbb37127c2557d6c39c2'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_082521_175535_FB03A434 
X-CRM114-Status: UNSURE (   8.30  )
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

On Wed, 2023-06-07 at 05:39:36 UTC, Amit Kumar Mahapatra wrote:
> This reverts commit fc9e18f9e987ad46722dad53adab1c12148c213c.
> 
> This patch was a work around to fix timeout issue while operating in NVDDR
> mode with software ECC engine. This patch prevents the Arasan NAND driver
> from operating in NVDDR mode with software ECC engine resulting in a
> significant performance degradation with SW-ECC.
> 'commit 7499bfeedb47 ("mtd: rawnand: arasan: Update NAND bus clock instead
> of system clock")' and 'commit e16eceea863b ("mtd: rawnand: arasan: Fix
> clock rate in NV-DDR")'
> fixes the timeout issue in NVDDR mode with SW-ECC so, reverting the changes
> as this work around is no longer required.
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
