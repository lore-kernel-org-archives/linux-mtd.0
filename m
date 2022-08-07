Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB86C19F2A
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Aug 2022 12:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hHN1xaHPWgZ3OVM0fL/tRdU89Bzdbm7CAtyQQJRVr0A=; b=11BpaDCzpyb1cP
	hcipXoCirKNdYTcbgqIb7ITMIHpuZzFOOETU4d7WyzqO2ogxiraTVqCTOsv1Ez3nJb/RFPMYXufHq
	YKAhF52aDJPI4GotJ37XUFqNat/FnxM8OuJK2QNvIRF7N+7xgaU8C9fntkEUtKz3TPfB6n9D2TcvM
	OoAUer/2Qz3hU4WS6QsT7nnLFa9IldLyUR+jP2moQlLoBoRT8TRhaQImgT2M7AwBvLN01Sk5NqOAw
	EZWSTCNi9/uuVV+bY+rzytHqWrL0C046v1O+vHrU0L+I+ebShtctlRKyrb8Yh932i2cyEegeHcKgk
	GwHAn256He3a8/IKzuSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKexb-00Bd5l-5e; Sun, 07 Aug 2022 12:00:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKexV-00BcsM-KM
	for linux-mtd@lists.infradead.org; Sun, 07 Aug 2022 12:00:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 29AE3B808CC;
	Sun,  7 Aug 2022 12:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC8DC433C1;
	Sun,  7 Aug 2022 12:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659873630;
	bh=GhnFK7rXjV4P51zwZhq4ikuweBYVBcfI8NGypJg2r58=;
	h=Date:From:To:Subject:From;
	b=H/es3EaMG1SliRB+vBHoxjy6E5fdmCVK5h2C8JttleboFzwQFvT3EbjXEN5pZtd7v
	 teLesfY8p11vlT8pwVk8ZMJWxBQwnVItlpTUyehlofSzKNbn/14SqeC3cbpvIz/lMf
	 m/PPgHtMgrd/YPdbhRmILcoUrVLrzPiclUEfxC2Jgio1G8DrSAWZxqQEh25hw223Wu
	 LWkWHwkfGAIVCLqskt3oOivNEmvB9AYQY66iBSI2DoXmPJdd0jjglOFQETAGdP7TQG
	 tsnt6Czu9rJDXJVbU6VPq4AvkQatgoGMiSAQr60SCsN7Vn+ecxUfsU4Q88gGOrT+km
	 B/AFRrvSay/Gw==
Received: by pali.im (Postfix)
	id E3E0997B; Sun,  7 Aug 2022 14:00:27 +0200 (CEST)
Date: Sun, 7 Aug 2022 14:00:27 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Scott Wood <oss@buserror.net>, u-boot@lists.denx.de,
	linux-mtd@lists.infradead.org
Subject: Have fsl_elbc_nand controllers subpage write support?
Message-ID: <20220807120027.2zz43afbqtqljhul@pali>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_050041_856700_CC7978F1 
X-CRM114-Status: UNSURE (   8.89  )
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

Hello Scott!

In past you disabled nand subpage write support for freescale eLBC and
IFC U-Boot nand drivers in following patch:
https://lore.kernel.org/u-boot/20121102234432.GA18129@buserror.net/

But in Linux kernel you disabled it only in freescale IFC nand driver:
https://lore.kernel.org/linux-mtd/20130410223437.GA26900@home.buserror.net/

letting kernel's freescale eLBC driver to have enabled subpage write
support.

I would like to ask, has freescale eLBC nand controller support for
subpage writes? Or not and it should be disabled also in kernel?

Or has somebody else these details?

The main issue is that U-Boot nand and UBI support for boards with eLBC
controllers is compatible with Linux kernel nand and UBI support because
these two drivers calculate UBI geometry differently. UBI header offset
is calculated from nand subpage size and nand subpage size obviously
depends on the fact if subpage write is supported or not.

I would like to fix this issue, but I do not know if wrong information
is in U-Boot driver or in Linux kernel driver.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
