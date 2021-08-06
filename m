Return-Path: <SRS0=GkoH=M5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B279C4338F
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 19:46:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B806860F44
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 19:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B806860F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ea+u9Gd3L8PWlWofqjkuSC+GXSIzobB/uXnwcI8Q06k=; b=ZAQ4juLFpyGS0L
	Ap9o54/tikx/GZrRdzaj3zctAw0vtdN6+kagIxPE4mSnIvpn3YjOagEv0EsuKTEiFhFntKIDrCjMi
	N0q0cS21qjd42+LBOdB9YWKGgMpd43ULYn+Vac5IL4b/95eZGNBkSACaGHNozelI1wd6prkXN+crX
	ZdBcoFwr0Th/05Kt2LVScBeXU47sW9JLQZgV4PSX99AjxhkOcNR4RAgVQwfEXl7dpFNPJwDkhByAM
	FNCwlWYNpfYoQlZdiA0Ug2gb4pEy5T03Vng11I515JhQwKaXG5c/SkWr2aOOD5+4Jvn6P8wVpSDQ2
	YcAC/0nRKuwO9jYomj5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC5n4-00DLxN-Rc; Fri, 06 Aug 2021 19:45:58 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC5n1-00DLwg-Cb
 for linux-mtd@lists.infradead.org; Fri, 06 Aug 2021 19:45:56 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E5C281BF203;
 Fri,  6 Aug 2021 19:45:50 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, boris.brezillon@collabora.com,
 tudor.ambarus@microchip.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dan.carpenter@oracle.com, martin@kaiser.cx
Subject: Re: [PATCH] mtd: rawnand: Fix probe failure due to
 of_get_nand_secure_regions()
Date: Fri,  6 Aug 2021 21:45:50 +0200
Message-Id: <20210806194550.392325-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210727062813.32619-1-manivannan.sadhasivam@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b48027083a78b13356695555a05b0e085e378687'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_124555_619174_E99A8E6B 
X-CRM114-Status: GOOD (  11.08  )
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

On Tue, 2021-07-27 at 06:28:13 UTC, Manivannan Sadhasivam wrote:
> Due to 14f97f0b8e2b, the rawnand platforms without "secure-regions"
> property defined in DT fails to probe. The issue is,
> of_get_nand_secure_regions() errors out if
> of_property_count_elems_of_size() returns a negative error code.
> 
> If the "secure-regions" property is not present in DT, then also we'll
> get -EINVAL from of_property_count_elems_of_size() but it should not
> be treated as an error for platforms not declaring "secure-regions"
> in DT.
> 
> So fix this behaviour by checking for the existence of that property in
> DT and return 0 if it is not present.
> 
> Fixes: 14f97f0b8e2b ("mtd: rawnand: Add a check in of_get_nand_secure_regions()")
> Reported-by: Martin Kaiser <martin@kaiser.cx>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Martin Kaiser <martin@kaiser.cx>
> Tested-by: Martin Kaiser <martin@kaiser.cx>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
