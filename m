Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1558EC25B7D
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2024 12:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SXRgzMe9q8+ZRhQ2zkN0ncZuRfMOZT++l9yxZmEiaPw=; b=TwLXPp6qRAGLLk
	cO2VySGXZy0qs/2tCB4sgyoV6cOrlg2Qsxp+lC4fJyYZm9pGzxstam0zUOIS/RnEBbAwR1Iwv9e3h
	AtJt+zXOIOCZPma+UZLQh7RLnkaOK3uhIMohanvPVIODQcJURQqou+gnR4XVLkF50fWjKB+9DS7/M
	KIzid106dDy6kSCg0zpQrETlDPjqg27aR3HGRcBxl2T2Us2hGRVKpBbZ//cYmio8KUgDgB7LwDFWg
	78s8IWfnaSbqOJCktmLVrrd2uikAGwQG9GnwlQQ0ShyJ+L4VhPtMUFWCTpYFPn3iAbWJWMTg8fB+o
	uKVXWOAonx/pT5L4t4/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZFv-0000000EoYK-01Rd;
	Mon, 27 May 2024 12:15:11 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZFr-0000000EoTd-08wZ
	for linux-mtd@lists.infradead.org;
	Mon, 27 May 2024 12:15:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F0F0560004;
	Mon, 27 May 2024 12:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716812101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xzi/CRJAcaEIeW06Kq8bs5FFCMW8/bBofcZu7yIzBzU=;
	b=REiI4qdlViC7FaLGKKWsmzxe3zs8YdIgz0DPEgKJv2vFCvyBnN6dIwo+Tz8SLNfX3tKGPx
	IDIVzhl964q0lBJvpMwHJo7s3AU8V97MF16Ka2BOAsnefHBvJCg9PqN3xv+hiITErvHeQI
	/8ETWVUfUdXABYEQLbOrPQufxtumosoxkBJAmTq4yIaNF36pGyg/zCpehgkKBcfC9H98Zc
	OPAV3NmsKuRqcHGg68Ti5sVKEArzhnBJxTUDQ4rK+cH0MsCFr4chhhfXAPhDhRpKKEpyxl
	SvA1ebZjzcwTOSz+DYAPcywt1eEDHXLGZBVJ2GumFCXbiJ1rafhD6j4tKoJKxw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Alexander Dahl <ada@thorsis.com>,
	Steven Seeger <steven.seeger@flightsystems.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mtd: rawnand: Fix the nand_read_data_op() early check
Date: Mon, 27 May 2024 14:15:00 +0200
Message-Id: <20240527121500.29766-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240516131320.579822-2-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'5da39530d19946f6241de84d1db69da2f5c61da7'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_051507_265191_2989CBB5 
X-CRM114-Status: GOOD (  16.54  )
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

On Thu, 2024-05-16 at 13:13:19 UTC, Miquel Raynal wrote:
> The nand_read_data_op() operation, which only consists in DATA_IN
> cycles, is sadly not supported by all controllers despite being very
> basic. The core, for some time, supposed all drivers would support
> it. An improvement to this situation for supporting more constrained
> controller added a check to verify if the operation was supported before
> attempting it by running the function with the check_only boolean set
> first, and then possibly falling back to another (possibly slightly less
> optimized) alternative.
> 
> An even newer addition moved that check very early and probe time, in
> order to perform the check only once. The content of the operation was
> not so important, as long as the controller driver would tell whether
> such operation on the NAND bus would be possible or not. In practice, no
> buffer was provided (no fake buffer or whatever) as it is anyway not
> relevant for the "check_only" condition. Unfortunately, early in the
> function, there is an if statement verifying that the input parameters
> are right for normal use, making the early check always unsuccessful.
> 
> Fixes: 9f820fc0651c ("mtd: rawnand: Check the data only read pattern only once")
> Cc: stable@vger.kernel.org
> Reported-by: Alexander Dahl <ada@thorsis.com>
> Closes: https://lore.kernel.org/linux-mtd/20240306-shaky-bunion-d28b65ea97d7@thorsis.com/
> Reported-by: Steven Seeger <steven.seeger@flightsystems.net>
> Closes: https://lore.kernel.org/linux-mtd/DM6PR05MB4506554457CF95191A670BDEF7062@DM6PR05MB4506.namprd05.prod.outlook.com/
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Alexander Dahl <ada@thorsis.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
