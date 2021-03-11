Return-Path: <SRS0=XuJY=IJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D106EC433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 11:44:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4441D64E45
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 11:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4441D64E45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9Kd2emrUjBSQuTvn0S9AsZ4COsBmZW5V3GttWGWiOJI=; b=m346JRFdu2Z9nHKRFWnDgRau7
	VxzsGa+h+UJ1doHJaQ2Y9Q8HyY+RDya3v1tjEO6ngsmB4sW1GybM1KaN/scoOtUuSYhlXcDeErBLw
	rZkG0DFz4OFIgBN/AipPSBeYOTWUEVtlxqciLhZNDhMsTRBDoZzEx4gAGGgd8xADv0qg6rPqbUtxE
	oCmMeR1BSh/WCzpjWT6r/FHawHJbsMWhdjyrBFxy8yfFka3z391Ss/S5iYQW4mfWLbc8RM4NY6aI5
	wZYy60lIBFzSHpNZhlqlgG6Q3tk4NDO8Fjw4ZnlLph85FFTaGIwuctABiw6AoLQuUdtb6GjK1LowG
	CmJE2N/qw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKJie-008xyZ-N1; Thu, 11 Mar 2021 11:43:08 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKJf8-008xD7-CO
 for linux-mtd@lists.infradead.org; Thu, 11 Mar 2021 11:39:33 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id C0E381C0005;
 Thu, 11 Mar 2021 11:39:28 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Cc: kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] mtd: parsers: qcom: Fix error condition
Date: Thu, 11 Mar 2021 12:39:28 +0100
Message-Id: <20210311113928.306079-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303084634.12796-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c95310e1b33eae9767af9698aa976d5301f37203'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_113930_785954_509DC9B8 
X-CRM114-Status: UNSURE (   7.67  )
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

On Wed, 2021-03-03 at 08:46:34 UTC, Miquel Raynal wrote:
> qcom_smem_get() does not return NULL, and even if it did, the NULL
> condition is usually not an error but a success condition and should
> not trigger an error trace.
> 
> Let's replace IS_ERR_OR_NULL() by IS_ERR().
> 
> This fixes the following smatch warning:
> drivers/mtd/parsers/qcomsmempart.c:109 parse_qcomsmem_part() warn: passing zero to 'PTR_ERR'
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: 803eb124e1a6 ("mtd: parsers: Add Qcom SMEM parser")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
