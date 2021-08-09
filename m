Return-Path: <SRS0=6ym3=NA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA7BC4338F
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Aug 2021 13:07:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 781FF60F93
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Aug 2021 13:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 781FF60F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SegJtqtIHrbfmR+CGAwWuAxKoFxYJtoqCNc7BP8KidY=; b=sQu0barRVjwbEj
	KSnBz1xyF4hvn4pXN4kpyq7lqfYFQjaUTsVzX1puPGVAyI2688x3GjHdsofc2wwd9AnWR1b/WCp6G
	xxXcT7o0P86/PRsLd//aNBKO8jUbozRW+dbg0VC+Mp7HwaddLyPuSPIW3h+goPfXzsm9f2cmLHTE5
	ESqM6+41npFC//p0VTzB3DWKJBbcIogw0SRVXybf9Q/dkScPsQasp+kWP47owTWIM6ADKMRGBUB8A
	sUHaKS7pKTEkvuzRrv96ky0nGh/OJNDJmmijvuQ/PnhQsBzKdkZY6AIcH4Lj3chq/WDFiFvR2QxYK
	1zXP6NYauO/eXaZ4jPDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD4zC-000gLN-CP; Mon, 09 Aug 2021 13:06:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD4z9-000gKd-NT
 for linux-mtd@lists.infradead.org; Mon, 09 Aug 2021 13:06:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3003D60F93;
 Mon,  9 Aug 2021 13:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628514390;
 bh=er6P7KMpkJN4hEnMUEV9ytmn+sMhCbCLS0cRciYT8LQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XCR86qqZ7cNIOOzwPkGV66KKwrf4Thlw4ncEC54o9lZiu94cFwT6rdJyNM7/R2wrc
 sR9yHFkKAEKbujkgr0ht/BX4BmBKt4p+9D+rJ6rmG1M4NHSilswcsgZDFQHZrGFMoL
 q3QEd6VelLKNhW96A9WoyqsjIMXfYYv8183/jeceCRE3wHESXhdb7kSgU/GDpgZoQ3
 otjuag/v5ykNEaGMeGFpjJd/k/8EmpygHVcIfP8dFo6DiAYIoX79IpzycJJuJgYMMW
 5vfKCc2U/BwLHHnTi88XJaWq0N3lMiDK0phEWVlqwZLTbfGwEQlA0r7csUW1fUE/yp
 lmP0RARJCxMkA==
From: Mark Brown <broonie@kernel.org>
To: zhengxunli <zhengxunli@mxic.com.tw>, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, linux-spi@vger.kernel.org, vigneshr@ti.com
Cc: Mark Brown <broonie@kernel.org>, juliensu@mxic.com.tw, ycllin@mxic.com.tw
Subject: Re: (subset) [PATCH v2 0/2] Add octal DTR support for Macronix flash
Date: Mon,  9 Aug 2021 14:06:05 +0100
Message-Id: <162851432637.51983.3793788915457019257.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1612517808-10010-1-git-send-email-zhengxunli@mxic.com.tw>
References: <1612517808-10010-1-git-send-email-zhengxunli@mxic.com.tw>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_060631_827415_9E2AAF4E 
X-CRM114-Status: GOOD (  14.88  )
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

On Fri, 5 Feb 2021 17:36:46 +0800, zhengxunli wrote:
> This series adds support for Octal DTR for Macronix flashes. The
> first set of patches is add Macronix octaflash series octal dtr
> mode support. The second set of patches add the Octal DTR mode
> support for host driver.
> 
> Changes in v2:
> - Define with a generic name to describe the maximum dummy cycles.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[2/2] spi: mxic: patch for octal DTR mode support
      commit: d05aaa66ba3ca3fdc2b5cd774ff218deb238b352

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
