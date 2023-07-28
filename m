Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E4DC0015E
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 12:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EvZaCohndD2rb/V/m6O/CtOBZxdufBSKIefzxikQ7Vc=; b=cRwjBKK9KZcwyc
	9XLB/rCQxuKiovveb2nX96fSEB/biGMtx5XYHKfUcjFD5oTN3C2K6uNVJ8CaUfizG9TCVgpgLCBJB
	AhzCCSLBL9Xg8lmSTwmawf4qRzEEfnrMOpzJ06H3w9V/KaAY1C9Pn5YUh/oFZdnRc+csJNv/5maEE
	lkXHAth2UdvcKINLMI0d4oiOwCD2IQ3SKC9vghPr2zAOeOVBrcleRJjI4tOmYZzOi9P+UvFQjoRZv
	ydSucjg/QUziL2XvFuVF8DjL/BRheNx7aHGve558eE342t792GyzOl8KNXiSJ1UO/krLrrJuQTM1D
	DRjOgt0fFNnB25ulG08w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPMgW-003Kte-0m;
	Fri, 28 Jul 2023 12:35:08 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPMg9-003KiB-2A;
	Fri, 28 Jul 2023 12:34:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDB23FF802;
	Fri, 28 Jul 2023 12:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690547682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qYE4MBXSk/zbGqUMLKuWYz/tqU7FremL5gaTRTcg96Y=;
	b=Yse64NJ4qc7AI/91a5atKDoHC2hdYPEH3x2o6JZ5QxLL5aSqQEthJzxxWSyDAeyqVBy/WS
	bGMi5gwZ4GmnK1WgEQ94ldVSg28EVaRJ8CTMDBekIw/QV3loEl0IvIKINJpcV4ZijwdSQ6
	dNcXrfPxNBXbI2jr/sBV4Z9E0f3PcSTq7jP6ATO0HExFTLurk4jA3nGzU+yoeLoRpanR5y
	tSOy0OfBgUzZxZ2vDOZ3CowyRhjnEFGSBuNcyPKAAdF22lodg38uM2T2IIox0RfL7kj21y
	oNljE1cdmbzDPz33fUBSiT+eAKDI5e4IoOvbYHKdvxBO9LSKkWM5ahkYk0FfRw==
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
Subject: Re: [PATCH 6/8] mtd: rawnand: qcom: Fix a typo
Date: Fri, 28 Jul 2023 14:34:38 +0200
Message-Id: <20230728123438.640695-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230716144612.32132-7-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'548b7509d92d1349b01ed2293dcdde88f3d7a907'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_053445_840073_4F77A8C1 
X-CRM114-Status: UNSURE (   5.41  )
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

On Sun, 2023-07-16 at 14:46:10 UTC, Miquel Raynal wrote:
> Fix the following checkpatch warning:
> 	CHECK: 'tranasction' may be misspelled - perhaps 'transaction'?
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
