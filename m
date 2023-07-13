Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07330C001B0
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 07:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xMDHjgFAi+7ehIf/aduiesMrruyhXSOUNxaV4b/MYBs=; b=gLMGIpRA/Q8z1X
	3LD/uUo9m2IeNUkymKaubJkiosWflILPdcvV/zekDJEweRYiJ/d2VKUuhnUaoxdQjZs3X1LtDxtge
	0JOEvcZfZVomh83CwiHKJQOJMgiNPmustXWIvqvrccppFyEvKn3YUF7UgwNUOJzNnNMl9xK7QYX/O
	XSxo4otcX/gVzGoE5hEVD4ZZ2TWlqxD7oqS56Jat/MaBLppCLAT7ztRKRDtJXsKfIF+bJYQ6RICwd
	dMFHKMUWia29rozmbXxNrGhdFK+P8etBMEdh2zmMbCl9Z/fJC8i+Ku92FuKg5XiET2RwjzXbVMsm+
	EKfnjuXFDG9rIlOzSNWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrDY-002Jpf-0o;
	Thu, 13 Jul 2023 07:58:28 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrDO-002JgV-1k
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 07:58:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77B091BF20D;
	Thu, 13 Jul 2023 07:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YcZSU7fWFWYPuYRC5H+q0VcT3fSmOy61ISNXR8KDvgo=;
	b=m0Agc5wR/CP7sFKeaVWce/caxtfPbh15rQGFIyEWDLTIPolP4Why/S1kbbOFpSkK2txgFA
	uZbzVmU1dOgnsXX1Ww0XKq/pTDuNItZ5tZGAo8dpAjkhFo04PCDM56WZNPDreXNqrj9NiA
	pGbxDVEKijmys2QscN3bH0RnvDsxrMmk7F5wgU/AluA0qjZsid5Qif/az6wlrnqi1haIHu
	p1jHCevCA9W6tH3yJAW+8C5gn9ht71z5CuJOP1ssSMWHzKcSRzyn1LmCnIuCXWl6GI7Xwu
	a1RKBYRPwFLY5awuqJkUAPUDe9hWw5rQ73aESHImpeL+TrYDxIYYtJVYTVJIwQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/18] mtd: rawnand: sh_flctl: Use devm_platform_get_and_ioremap_resource()
Date: Thu, 13 Jul 2023 09:58:16 +0200
Message-Id: <20230713075816.486307-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230707040622.78174-4-frank.li@vivo.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'4eef841d29fac5fc8500668d1498a1ab8f9a91ce'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005818_738887_7AE01C92 
X-CRM114-Status: UNSURE (   5.72  )
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

On Fri, 2023-07-07 at 04:06:08 UTC, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
