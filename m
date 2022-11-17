Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91529C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 21:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H7aYwpkdS26OCLczVoNceRNUnqLxAw4TB960ATGtRZI=; b=ZrztI6agu9TZRb
	/gS9Fbh9AVMa29mzdSV3hT0ra4sJHhwNfsLOSGaal14GSOP3vtA71CzMDp0VL0dWdMInQTyBV+aRy
	MlIR9oQF0nOCwMqjYTm1SPEjfFQIdnJye/4yd0g7F07HfnE2aSwlde1JN6Jpyym/+5YoVBRndHeMc
	6C4YCVvEHnSEEYOj3nUj9YIc9fE+XFaGpKaERW+Te06cSfa5Ysy5QN6RwGugPJgZl/lZ5OkFSq4di
	800t6MMzE0ncM+9OO/NcQI8c9RnIpI0YbZQbssKhkY539NhdpYiHAC1a7iwmtxhWOQxwrw29mFivK
	kh/sciGF9JV2t6vJPV7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmDq-00HXot-O1; Thu, 17 Nov 2022 21:14:58 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmDn-00HXnW-B0
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 21:14:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C84FC2000A;
	Thu, 17 Nov 2022 21:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668719691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rjOO3HF8VOCT1YGIpGxFB5wFLfZ4kG/wIlQ/PZ/PcF8=;
	b=cNhO9dAyxWPayRx6Cf0hiFc292apajC3QttlCKG7KjYAhsq1gjvmnzUU3vnqNIYUZ0qoK5
	15bmJAFb/2ti7C22iW/ywJeybCLQ7cykGGM426BcFgb+oEDTdbyiRpX4CdcYP6Gp95hIrH
	wVb8BW21F08+9Q0+Js1bXY54FWDkjzcv+1sriMTi1GmmKy6J42niz9I/AQT5biOI+R5SjT
	PH1sm5qreL9j51hdlgeLdBMzcGmi96U59Y6b0mxcVGJ7EN+XsEzGEjOXf+LbsuTLes3w7u
	aACOvqJz4oW4WJ3bc3NRUQhsyPLTHL4IGOMP+vcesEQkRc+EpO4Z2Hw+/pCHiw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: parsers: refer to ARCH_BCMBCA instead of ARCH_BCM4908
Date: Thu, 17 Nov 2022 22:14:49 +0100
Message-Id: <20221117211449.1273138-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116124932.4748-1-lukas.bulwahn@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'085679b15b5af65f9610f619afde41da0f966194'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_131455_545250_1FE2BBCE 
X-CRM114-Status: GOOD (  10.09  )
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

On Wed, 2022-11-16 at 12:49:32 UTC, Lukas Bulwahn wrote:
> Commit dd5c672d7ca9 ("arm64: bcmbca: Merge ARCH_BCM4908 to ARCH_BCMBCA")
> removes config ARCH_BCM4908 as config ARCH_BCMBCA has the same intent.
> 
> Probably due to concurrent development, commit 002181f5b150 ("mtd: parsers:
> add Broadcom's U-Boot parser") introduces 'Broadcom's U-Boot partition
> parser' that depends on ARCH_BCM4908, but this use was not visible during
> the config refactoring from the commit above. Hence, these two changes
> create a reference to a non-existing config symbol.
> 
> Adjust the MTD_BRCM_U_BOOT definition to refer to ARCH_BCMBCA instead of
> ARCH_BCM4908 to remove the reference to the non-existing config symbol
> ARCH_BCM4908.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
