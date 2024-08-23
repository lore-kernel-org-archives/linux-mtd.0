Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76B0C531DC
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2024 17:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJRvJwcJHcMBzpXjGMFWw4/HyZJPoRdbyUCpqoRLvrU=; b=EhN0u+VLaUwAEZ
	No+sheHYAK+G4Zyt1Wqlu07IWyJgcW/J9NxHC5fbcaJJSAJ5EH6eJEyjZx+cucVrEHdT7NRdNtpwm
	siVs7RdVSizQ0vlxfVU/NC20yJvZrlh3FCvsMJ1wKPCfmp1Hte0agrk11HVEPcjbrbUyuV06aJVhq
	72FI2KA9H4iArffv7YQtWfFtRVU7BMCWN7LBTmHeCuqTpvPzdWLy9QQh+wPzI68/ymiuNOfY/546k
	CEIIY3zccLGnfE3y8TsFA1X+BbiHem3GVhcrldsNvKmlpUWJ7gw2bRclVlg0O7o2aWi7ma4bADw5S
	An51URYxiuHDKJQOOo3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shYBr-00000000AOb-3chH;
	Fri, 23 Aug 2024 17:35:11 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shYBo-00000000ANc-37xN
	for linux-mtd@lists.infradead.org;
	Fri, 23 Aug 2024 17:35:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FABEFF804;
	Fri, 23 Aug 2024 17:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724434506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yav6FfBY2mdoY+qbaALX6Tr4ZG1sBYCqncdIlsNWbOM=;
	b=ge/5YVrUA1lUsygn8G9axXSqAy9IvfzOza2lqYy6KCahH7MOT8wZU8jw8LjORIYY5rHnvG
	o0nQhCac1jHf16k7PxxlB0fqNcW9pKHIOMcqzZp4hyRrQJFOiEbta8Q3YLHjGrsem1GJob
	MoJxqWl6DWfRX0QEcwllnCQolozXXfc4nVM6pjw6AzrMYljvybec7PM6zvB0x/h2hxz6qa
	ayt7sxWAcJF6RXELz9HbCFHZXMcZJfg79KWkkIvo6GSGN7ZE87Jf7ZTX/6j1gmDGvR1utE
	PKWKilV0J8BQ7mc90LfSOGz+UfP3YYlgOkwBVcK2vuj3ZPBuL7t//RIzvfwb6Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] mtd: rawnand: davinci: make platform_data private
Date: Fri, 23 Aug 2024 19:35:05 +0200
Message-ID: <20240823173505.517411-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814122120.13975-1-brgl@bgdev.pl>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ccce71013406a0a3c81850dab940f07b112349d3'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_103508_975831_BCB72548 
X-CRM114-Status: UNSURE (   7.20  )
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

On Wed, 2024-08-14 at 12:21:18 UTC, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> There are no longer any users of the platform data for davinci rawnand
> in board files. We can remove the public pdata headers and move the
> structures that are still used into the driver compilation unit while
> removing the rest.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
