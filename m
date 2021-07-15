Return-Path: <SRS0=WX7q=MH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7097DC636C8
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jul 2021 22:54:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 317D8601FE
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jul 2021 22:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 317D8601FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jcTU5RbPud0CK4WA29kjxVv4BMqlwh+YzO+iiM6bJ/I=; b=FfKHf5ZbOIb77X
	XjtkZ7NMLg6x/FD1IPlNxDCinvMydSnAMeWq4oNUi4V/h6m1oainbheKO+g4Fplk09JU1IZs5zOB4
	2FcuG2YdyllHyeJthlmNViDhUgnwdRrwoMYLJtAVAUASSxMzDEVraQozUOKrjVJyThZevNLsFUoLH
	Cru/7Zj6iX4OLFRMeuTJ5NvRAP4v78L/u6t1sFtHNzkgKzoNsOLkk0t4tn6Tlj/G6pCp1S/D4kvNV
	cDsK/oh+zFCjmPJd/F4ptZ/SsmtT4jG3DZrgkTrLJ54CWfnQ3SzygvzIdH/7eOpwqoyQrlha0iSf8
	UWykUEAwE5G27ZMMBIXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4AEs-002ZTe-M6; Thu, 15 Jul 2021 22:53:55 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4ABr-002YUD-Ps
 for linux-mtd@lists.infradead.org; Thu, 15 Jul 2021 22:50:49 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 6A5D51BF209;
 Thu, 15 Jul 2021 22:50:45 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: Add a check in of_get_nand_secure_regions()
Date: Fri, 16 Jul 2021 00:50:45 +0200
Message-Id: <20210715225045.66185-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <YMtQFXE0F1w7mUh+@mwanda>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'14f97f0b8e2b9950c028d0cb7311ffe26a3cc1c0'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_155048_010115_DCEEF01B 
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

On Thu, 2021-06-17 at 13:37:25 UTC, Dan Carpenter wrote:
> Check for whether of_property_count_elems_of_size() returns a negative
> error code.
> 
> Fixes: 13b89768275d ("mtd: rawnand: Add support for secure regions in NAND memory")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
