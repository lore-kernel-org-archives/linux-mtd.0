Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1E5C43219
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Nov 2022 11:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U5MUlRYFalGuWm3dyuLTbXRbgOWxgy7B7w/9M31qroc=; b=XDScYWPq8HeNHj
	hev6hk+x5EA6Xii4RDE7UKyVQmkJfz6TOAM38FrEdjb1aeKaxQZEd7CriyMTW/eG2C5NLn5JXZrbG
	WElCMdnEyNOE7v4U33CTUiPSZ9t0J35wMRR1ho4S1J+DX5mc3Zqvp8mnTFk1pt2CpYP9GXXyua32J
	U82E2fnG0sRpytXSlz9BruLRKbGqny3WwdbPhF23pyJWljMDsRPaIoPeucEXbjOxeVFWSrhsb+kKO
	UsVm0hBXy/TQ2i/xpGKU/lX+pdqDoZpC4p499hlCCbGaM7sDGYVlH1DQWNKakA3RXGHDE7Tu2RusX
	fAmDBottCTx279Yue/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyAWm-00877a-5U; Thu, 24 Nov 2022 11:36:24 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyAWj-00875F-4b
	for linux-mtd@lists.infradead.org; Thu, 24 Nov 2022 11:36:22 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7A5302000A;
	Thu, 24 Nov 2022 11:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669289777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NPQ9iL0V2zuDFEHLP6m5JHoIoi4igoS967cGM7EHc74=;
	b=hDAm9zhaOagyXz0rTbcFmXhklwRIv2vi9K9pn6oCk2StAxC4Z5sfjEyoIXmzMxr0BQth9P
	aRH/Lpdqwnps00D+PVTdC2hhyUPopwRLG3nYm4sp9lzhvEqe3ICqNH0aSWOpFlKrKWn55O
	UAuUr8T76nRg7k4HDqSg5SHlLM3cmbM/uQTnVET90I+zrP/dcgccrgWb16/w7TQE1s8an7
	7M0UpJrLE4lzJDDecGzF/CtSGyTWrFSUAIdRPOjNxikdGrObTH8x9xJktUujX42eMPYm0c
	zqYVuiFz9uOdRJAfRCo+9pEUIzNTs01+VyZbdvT2j+RfC/f/gj1i8JiZnCsF2A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jean Delvare <jdelvare@suse.de>,
	linux-mtd@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Naga Sureshkumar Relli <nagasure@xilinx.com>
Subject: Re: [PATCH] mtd: rawnand: Drop obsolete dependencies on COMPILE_TEST
Date: Thu, 24 Nov 2022 12:36:16 +0100
Message-Id: <20221124113616.266315-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221124115946.5edb771c@endymion.delvare>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9c31d6b40c8e14c0bdd5c2f5728e174da8cf15db'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_033621_354067_F233748D 
X-CRM114-Status: GOOD (  11.03  )
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

On Thu, 2022-11-24 at 10:59:46 UTC, Jean Delvare wrote:
> Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> is possible to test-build any driver which depends on OF on any
> architecture by explicitly selecting OF. Therefore depending on
> COMPILE_TEST as an alternative is no longer needed.
> 
> It is actually better to always build such drivers with OF enabled,
> so that the test builds are closer to how each driver will actually be
> built on its intended target. Building them without OF may not test
> much as the compiler will optimize out potentially large parts of the
> code. In the worst case, this could even pop false positive warnings.
> Dropping COMPILE_TEST here improves the quality of our testing and
> avoids wasting time on non-existent issues.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
