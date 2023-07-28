Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1B2C001DF
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 12:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jFWz/D5C5/auEWUl4GXrM69ffp3kYAZzobIVuRQJ5jM=; b=TII3LW3qb+Acm3
	6QW5JXNd+39fONubqOS0Q+zALA15DDgFN5YV/S8fMwAao9IEZVIIb1N3cRlHkNgBUIbkAk6PUSdWz
	YwaBZaKQXjijRsNNg6uTLBAogNngdDpmWuuXnAGsSTNAFUVBpmWGuumX9/T1N13y62LBYYnHiN3Ts
	86TMw55D3qDJAOF3k3922Lu/iC78VyKl+cKnU2rSlF4T+Gs8N2OLbGCNo6E41qQMBLAxEqkeoluse
	hzrMKIqd2VCJTyu/l4AK+1oHT+5pFNbTegdlOVczjD/xkWTweswD+G7es8mXCGsd6jE2ARrq3GwQ6
	mctOr1JfINC0bth52Xwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPMh1-003LB1-2I;
	Fri, 28 Jul 2023 12:35:39 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPMgP-003KpI-39;
	Fri, 28 Jul 2023 12:35:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C05A26000F;
	Fri, 28 Jul 2023 12:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690547698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IREJGsSMT4if/90t0FA1zcJzgwI5LVSmFBxNeYLDPeE=;
	b=Jn8H9lGOFNpBs0rpHILQAvOZE2YjcGGbHunz+hGWcMUSvA4knaqUq4WNOpifeJd3VFzt/x
	joKOA3ldkSc2cAFKcqSH1zI+tv1TWq1b62Lur8nuvQ8sZyM2SZV77pAI7bREW5ZX3udqYw
	LV+/d67iPauthOVijBN+dAsYnWBuSFHFudgg0VMSuTpkYkjRIqvr3QfpzQdG177+r4sQ4J
	J2Lt6+y1AbtQdv8PFt0VYUGWIYbeqv5P8WK0Iqr8tJx6PjTKtrabohqA2/CHDSF8o4pIEx
	t2i8T8BitJEVx6PiJSWKyepb0wBaYAnayH6FbLcTTPrpJl9qYH8dpYDI2uc3DA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/8] mtd: rawnand: qcom: Fix the spacing
Date: Fri, 28 Jul 2023 14:34:49 +0200
Message-Id: <20230728123449.640756-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230716144612.32132-5-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3b645b384bb3d1f30c3ac4b8fd5fcdf9d5493f93'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_053502_224711_3D6857F7 
X-CRM114-Status: UNSURE (   6.34  )
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

On Sun, 2023-07-16 at 14:46:08 UTC, Miquel Raynal wrote:
> Fix following checkpatch warning:
> 	"CHECK: Please don't use multiple blank lines"
> 	"CHECK: Please use a blank line after
> 		function/struct/union/enum declarations"
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
