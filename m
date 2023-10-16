Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011E0CDB465
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Oct 2023 10:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QOtrcet30guTsuN0n4tLn9pwgk4LrOFcah9yomdebuc=; b=RoDQBCoOgDvuBE
	HeqIbGalDxOfA9EYY21lJ0sRK4J+LaQMfScK+/uOP0sFlo+7Q+A+xzVMjQWgEa79N2ZPVm2579jvP
	qC4dxhEVVYaK//jaxZloL6ohdxmdjt3+5BQuGbn3bSnkKtaTfOLn2Spjda3TqrI6khzvnWlqyPcn7
	QBBlX+b+UZ/nPEcrOXGfy0BEx4qbrdLBotHQYGEsnmKzo1p+mgLnHYmaiE7e9h6EoGuZfD7WOHUr7
	0pFUTsfkk+FqhoQTRug3g7X8FdrHOw8tkYf+w28T/9SdzC7fIveQK8laX16xtwjmLQEbXsUUh3Vog
	srUt0LEP9inzHPNNtA5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsKrb-009JHA-2d;
	Mon, 16 Oct 2023 10:30:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJuM-0090VL-2g
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Oct 2023 09:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7dA5sh24deOx0xdOnjh0uuUzAi9UNkjie+0RJuqI+ik=; b=KNfndwWQmnQ/E32qC6yrjkRFZB
	R+qgUdZDKVjkzneKCF6970pQUXa7LZBL7APV1HcjRzjCuX2TgOfi7CM2j2+NwWByM4mB/Nw9YD4UP
	yyjt2RWskb+zuLIl8kw2WP12PmI2UOZxSLCvmSFgyUyPzUSemRweHuBjzmS2YXtpmfCeSWzgl9oF/
	6CBlpJBKbdTKm8JzZkDL2/0euUN+ogXDf2ECG34cjkTQnrGQHA5cYIcq6SWgOFbgrX+1UBeTHKH5U
	RbDV3fqDsHC40zZRSz25MVpBOUPF86G+jyCqN7eMUiTnUiovq47ZNwVbLY6nyMc7MU9x7yC76nKD8
	9Mk23UbQ==;
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qsJuG-005EL3-Um
	for linux-mtd@lists.infradead.org; Mon, 16 Oct 2023 09:29:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50FF640007;
	Mon, 16 Oct 2023 09:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697448530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7dA5sh24deOx0xdOnjh0uuUzAi9UNkjie+0RJuqI+ik=;
	b=fumOJkWJBJ5n3piRcioYzM8QsSxLLpXCO374wFUxQHYv/ORwbL0xVOD4qyLKrMlh8zMfQA
	sOrUdTuaNL+nl8VuUuixe+XjpvwvXk1p4u0vI7lG3zD2Xyf8iUZhblsDFhU6qx9DrzdOU4
	vXe7PPOAK9VSzO4f2kMpHL+to3UBBp8iyRuvacBHvQ5LDC44IY4+PiPEw04FNOkpxF4+RO
	3jBEiVysVUQyhtsLLjbk7hyXLwrSiAkDn7ksDHCLvADJ1pTjSg8bsb01GW5edcKPC097w3
	OOiod2EAYf+EIVEn6hOkELAyvXmwNLtoK3GDziwZbfYPKrjYWGrjgZBPEXCrcQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bruce Suen <bruce_suen@163.com>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	richard@nod.at,
	vigneshr@ti.com,
	bruce.sun@xtxtech.com
Subject: Re: [PATCH V2] mtd: spinand: Add support for XTX XT26xxxDxxxxx
Date: Mon, 16 Oct 2023 11:28:48 +0200
Message-Id: <20231016092848.289002-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012102412.10581-1-bruce_suen@163.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd656610ea702f243ac8534637cbbe06b24418b4b'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_102901_021438_61A58CD2 
X-CRM114-Status: UNSURE (   5.34  )
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

On Thu, 2023-10-12 at 10:24:12 UTC, Bruce Suen wrote:
> Add Support XTX Technology XT26G01DXXXXX, XT26G11DXXXXX, XT26Q01DXXXXX,
> XT26G02DXXXXX, XT26G12DXXXXX, XT26Q02DXXXXX, XT26G04DXXXXX, and
> XT26Q04DXXXXX SPI NAND.
> 
> These are 3V/1.8V 1G/2G/4Gbit serial SLC NAND flash device with on-die
> ECC(8bit strength per 512bytes).
> 
> Datasheet Links:
> - http://www.xtxtech.com/download/?AId=458
> - http://www.xtxtech.com/download/?AId=495
> 
> Signed-off-by: Bruce Suen <bruce_suen@163.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
