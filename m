Return-Path: <SRS0=7qHi=45=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11CAC10DCE
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2020 21:34:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81FE0205F4
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2020 21:34:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ipL/oZcn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dWo2ygHI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81FE0205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9RF+s6OYJqmEesI/apqegLbERb4hssh4BmR1sduVgyM=; b=ipL/oZcnPja9Mz
	uEGUDu6L3li/bL8bUQLp4w9WWzuHuKZjif8TpfODQ+dsRiqEHoe2uGGapUW6e9fi7mW10OEKObb4J
	c26W2aRX7+2aT7UUBi16EGqCvG0jCPz15wQQCzdbVTmM2FOT+d30ajyef6736iMqSoU2VARmhUQnC
	/RBOr9VXIi9kW9cs5XtElnhl0Z3gvljAPeMYD+keTQyC89qMShuCnFNeGYn/V794PAqOybbZXLM54
	6Y/O1OzCVmCWJXCIR7spKCHTunnEN4YW6t3yflSytgGK5D60h2zkYuSZl7POF2H+R2YkPnhO/jE/r
	CPuenZDBEAbAwrpmyWEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCVTM-0006ky-3n; Thu, 12 Mar 2020 21:34:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCVSx-0006N2-Om
 for linux-mtd@bombadil.infradead.org; Thu, 12 Mar 2020 21:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=pd/FdESe04KjrnZFYBdn/iabXVBk/lI2TOowByevgiU=; b=dWo2ygHIVntK+zOYTD6Yydpj2S
 55KAglK/TalhRwcn6oXoCHmqli8DIq5Fe9wPG+ufakzvckbuP5yazfxsrFZzZuCsfHqK44Gjho77W
 y81wLYKPFSFrkG+Ib6joO3QHy5vQQpDznw9uC+PedoWJclSnG+ESsvjAu59BfsamaMZo9hUa1VhZo
 cMY4Ll5Cz3apVxcxIDmx/OiQkWfce39u1WT/0Mfsg8Wt03qOj14oZh+YlIb0uuZFAmuX8nITZM+0l
 45Hh/A/z3vmyouS17xQb07FNi8GGMeinXgHvwr2mXX8NcWQjK8bdbCXQO1FDyFmrWesPFAUmrDa69
 i2i/VCKw==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCVSt-00029Z-54
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2020 21:34:06 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 5C2D2FF804;
 Thu, 12 Mar 2020 21:33:10 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: shiva.linuxworks@gmail.com, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 5/6] mtd: spinand: micron: Add M70A series Micron SPI
 NAND devices
Date: Thu, 12 Mar 2020 22:33:09 +0100
Message-Id: <20200312213309.7248-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200311175735.2007-6-sshivamurthy@micron.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: a7e5daccc310c3b892ae5e598cadb7a9274c2547
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_213403_342403_7C8CC07E 
X-CRM114-Status: UNSURE (   5.56  )
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
Cc: Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2020-03-11 at 17:57:34 UTC, shiva.linuxworks@gmail.com wrote:
> From: Shivamurthy Shastri <sshivamurthy@micron.com>
> 
> Add device table for M70A series Micron SPI NAND devices.
> 
> Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
