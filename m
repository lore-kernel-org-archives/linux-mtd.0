Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8D8C25B74
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2024 12:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sxpFNLfga3ouzI5UVkyIp1WUAA9IBCsy3W0ywgOqf+E=; b=GHfg+rxBVKBA3X
	7sq+WHgXdGKhAx8hVHoPD5q0ARTM667X4NvdKA52MV93bOWpfAJr4nTyWpSW4w9J3DX7O1sjYRlmc
	b+EG8r8H2HutMyGE0E1aL0OPQtnwPc0W3Z0ImxqM86cb1lwuOU1VT+r/LM5G/BS2pjnWxp37i2Nzf
	MoLQMrD8smY5r+2VWDKxdAxDqZT6oC4sERD74BPU/zmpuSnisI35RzvUbNCYEI/S64sVSb/RgzdU1
	4bO7hmaOEIjOIeQpoHTSmwCJ2PTE7GT0SD4JblFK5bDRiZtJkWakGyexVhIxB0BjLeAJfy4DCIbeN
	/locNcX8IWB8VA7U8UbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZHM-0000000EpDd-2rb0;
	Mon, 27 May 2024 12:16:40 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZHJ-0000000EpD7-3U28
	for linux-mtd@lists.infradead.org;
	Mon, 27 May 2024 12:16:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C1367FF808;
	Mon, 27 May 2024 12:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716812196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UJ5YURNdvw7Mm1Ei1FkK4NMTuUkuMXP1FS+gaKbKcuw=;
	b=MyqNIIN/nP1ifiOMu6NmlcYAUV273gjY3dXdTWR2IfEqyCLR6AIn08vLfu8cKFpmUFtGpg
	XP5Y3qpBcoyMSla6QiUPgIrG2oKiZq3V1Tx18NrTrb3taC7WBiHEQsILZyLMWmanA9QKCW
	0Y01AwNL3Zy4a47lgevcWOh+3717WudVci7WhMMNY5H3ygQFTHCCVdEYArP8is8oVCRHW2
	KTX14ll2qzEjtOtzRl3MvQVz+kku0tvMg4RJzViYjj0qOzveJdGNYTsBCPuo3hkVIJltOx
	zx8K1My4yipHx8OCgQttkp9laQRbjAN29+fwp0AJlqEsRxn0sb9Ka2+jUw4W0g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 1/1] mtd: physmap: Use *-y instead of *-objs in Makefile
Date: Mon, 27 May 2024 14:16:35 +0200
Message-Id: <20240527121635.104011-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240508151222.1443491-1-andriy.shevchenko@linux.intel.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'cf4ccd1c029e60bae787a9c8f75623b37ec2a558'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_051638_023062_168EA597 
X-CRM114-Status: UNSURE (   6.98  )
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

On Wed, 2024-05-08 at 15:11:53 UTC, Andy Shevchenko wrote:
> *-objs suffix is reserved rather for (user-space) host programs while
> usually *-y suffix is used for kernel drivers (although *-objs works
> for that purpose for now).
> 
> Let's correct the old usages of *-objs in Makefiles.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
