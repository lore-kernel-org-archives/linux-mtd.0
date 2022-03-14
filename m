Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CB4C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Mar 2022 16:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1HZmGPnIae7XlkyQr3imxX1x8b0VdPRZL3giAURodVY=; b=R5xRxCurByZmLB
	EXYYuxV0GEjr1qa0i+ltXtcXwaVGuXBt/MHO87vZj8GGNhFK+nxz2fOOIFzjKZxsPe6zJet3U7qEg
	5rV0W7tl5nRBA5fYmG1s7ZXUwTqDkvs1lCf8tSTRn74HZ+4fdjzfYzTFXTUvPGUVPVuMOTo/0vpSJ
	lkhGtqsh2vbXC4N2cDzTiJIS7/sIGsMcuAigGdfTKFUffD9UO0dBgc7NopJ1HWpqPQ/rXg2TAtLvy
	/bLR6my1HKycmu04zIqpNcDs0lhOWtn4W6pUZi0BOKTdd2V2bFmzp7MkTnASZ9b3TalD30dvBBSMD
	l/FGkbMA1BKuQCfT4a3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTn7A-005uLj-FA; Mon, 14 Mar 2022 16:00:08 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTn6q-005uDv-8C
 for linux-mtd@lists.infradead.org; Mon, 14 Mar 2022 15:59:49 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D5BFE40002;
 Mon, 14 Mar 2022 15:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647273585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kYC1TumYa2PoTn+cMonI8OUD98rDtrkZYlmD5KS7gGk=;
 b=ccG8x6LibDpAjcUmDVJ2k8ZrhsYzxoRilLD1Iz0d0n7F5Y3m4yKS7YdPzd8ano9CGRWmU4
 +q6s6MTQvDG8Q+lGWvOt9RIm+Ihp8c3LnUEic/JFsn4S8ITDDznJJYq36AjGqzciQOthLp
 P1cnYjxkHSjEC6J3v8g4l/GPkiAnsAEPoUG9uWN5SigG0gxdTQyylbpYcZmHkd/S991WNR
 Q35Ep6jDlAz7WE/4wEVdcGGtjhJZoQVTwsdZH6tybdhn7SVeDd2vJwOc8JGl39+KqBtb4+
 oMrkOGEgYB0t0HnBQ3HKlFbePgs6sC2vCybjmdBkx4JCxryaSOJCwTOL17FwdA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v2] mtd: core: Remove partid and partname debugfs files
Date: Mon, 14 Mar 2022 16:59:43 +0100
Message-Id: <20220314155943.77271-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220225144656.634682-1-tudor.ambarus@microchip.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'23362093da4e3b0fce515b556df649b59884b4e8'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_085948_471699_18B5DA94 
X-CRM114-Status: UNSURE (   6.44  )
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

On Fri, 2022-02-25 at 14:46:56 UTC, Tudor Ambarus wrote:
> partid and partname debugfs files were used just by SPI NOR, but they were
> replaced by sysfs entries. Since these debugfs files are no longer used in
> mtd, remove dead code. The directory is kept as it is used by nandsim,
> mtdswap and docg3.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
