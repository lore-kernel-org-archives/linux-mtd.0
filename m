Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E188CC56201
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:11:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F06022255
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:11:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KxzxJgJV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F06022255
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZT97Vjeij5iWHUawC1QSAB4/a4B2HpfCvWL0iDG9jTc=; b=KxzxJgJVPt358dDwMZLYFkOs0
	zXC91zyGG1hSbtgibHKSdRr/JC0dtP8lPDRJvSyK/FUZPFBS19YYngYby++ORQL7EGRmmUPTLq1dX
	n8UiUHbAOPIKQpODpvHLJNGMErMnnRA+mmO1yeq2EioERCqRAc3FFrD6cEQAzT2m9LFq4rmf1nggP
	dex9RErzWJJ2I433PWok8dr1H8u/E2Bvr34JlrZtPDMoiIYVSzhPcCpkUkC26e0sLRKTUn++4EsaD
	ihuIANnbPdAweqiKucVKsIvJPCl3bC/CKCOFkLF4AowHxC6FxRg+HwgK0waHAoxnSZWokHKi5dvtE
	Zw8gUmydg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfrC4-00036B-44; Thu, 19 Nov 2020 21:10:16 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfrAw-0002VK-94
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 21:09:07 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 499F660003;
 Thu, 19 Nov 2020 21:09:04 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 12/23] mtd: ubi: wl: Fix a couple of kernel-doc issues
Date: Thu, 19 Nov 2020 22:09:03 +0100
Message-Id: <20201119210903.26049-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201109182206.3037326-13-lee.jones@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 46bf8c58b0c67cf7bc5b318894b6fbe51c396b49
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_160906_455069_61FE4A65 
X-CRM114-Status: UNSURE (   8.51  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2020-11-09 at 18:21:55 UTC, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/mtd/ubi/wl.c:584: warning: Function parameter or member 'nested' not described in 'schedule_erase'
>  drivers/mtd/ubi/wl.c:1075: warning: Excess function parameter 'shutdown' description in '__erase_worker'
> 
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
