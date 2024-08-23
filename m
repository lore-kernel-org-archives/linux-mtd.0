Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BF9C52D7C
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2024 17:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r1t4qRHuoysxpIAAP/AFwlgy1/QcK9+3fLg8YT8clrU=; b=n9f6X5nlFT645x
	ofxSSmr7NZDwSE5WvoflAGLzApXP580FoAhDTdmQx36kDlxhHjSdgGfrQVmF+BRD8EbVOD/FF2gH+
	skXDZt8g8yrDuAUTw/DqX4TPJ7fipn/HS0A5r4Lqf0ZEoPM9E62KcZWc+rdmd6KBBqGxhsEX3+P3Y
	krp1K0yf9agSZXsGiLCka4JadtcgyOvBsW05gDTPe/xyV7I8XGE1AWPTWjNZvt3UWUMrrZAVRs2t3
	rt43SPT1LKKEUatrHlCLI+FHqIphj3yyQM3gjmOtbz67U4kIkkb1zNRnNjMEmbZhLkPUcgIPNPjDV
	Sx+2NTOSkSsxkPgb3J3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shYAE-000000009SH-1Gdr;
	Fri, 23 Aug 2024 17:33:30 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shYAA-000000009Pu-0v4z
	for linux-mtd@lists.infradead.org;
	Fri, 23 Aug 2024 17:33:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B297E20002;
	Fri, 23 Aug 2024 17:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724434404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vd3XM6I+bhkf19E2ISY/vWU7c3FMnr6EDatsnOXb95E=;
	b=LQoxKiTkpOvuNiu9r/gu6JHkeBpOzUc3doyMjdFDwza6+Wqvi9vEpp1cFqNPsrUIPmGGgy
	4ulzXYAZGwahqxzh6f2M+pRywdJuNtnxAfi/QNaD889KuTB3oAMk/tmko418vlLEUadJUs
	2WpzxvxqC9SMS4LiQruqaRWepHHuuVUrwEDBnP/6UjxP5a7thYkPU52380ws3u8Q1C5ypR
	J07FaKOfQffni8BdidLJlnuDxUaTNHJd6Djc7kzCMT3vT5z5NguliUTwIy83fKbv2KtfHF
	zp/NgUG2fdgck1PGI01i3C4V/vAqHOtA6wySMd0KHGo2SHXG/3rrlO1JS3F61w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Colin Ian King <colin.i.king@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] mtd: parsers: bcm47xxpart: make read-only array possible_nvram_sizes static const
Date: Fri, 23 Aug 2024 19:33:23 +0200
Message-ID: <20240823173323.441793-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240822164632.638171-1-colin.i.king@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e334c01df28225139cc831e4871c590a7851b4fc'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_103326_419602_C03204FB 
X-CRM114-Status: UNSURE (   5.61  )
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

On Thu, 2024-08-22 at 16:46:32 UTC, Colin Ian King wrote:
> Don't populate the read-only array possible_nvram_sizes on the stack at
> run time, instead make it static const.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
