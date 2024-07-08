Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78993C3271E
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jul 2024 07:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kfajr2vzt7bkbWpEwvgaI+jphKCZHB14M+x1mfzRPA0=; b=HzcBFxS2x9oMZC
	cfSTL3T5HQqSm7qmBgGEMIt/vE6C/AAFxz7Q/1C/qKWvSualEiG4PEHbMQWEfUjnk+3WlVFrFdkqX
	MPX90vf9xXxRjb8XEITahlzCOtt/R3KXXNDVRajTdH30Z5CPmyzwojp+tp1zp9zN7kf77d60iECw7
	xnBDtarBR5zROfBQIUJ8O4a3aodr6z6FOw5J8+PRJjgVbD6mt9jQg4iSJ1aelqvvH+Rgt/XXF+dgF
	w+ElkGV7bZQrJAlx0VWW5eTk5b4ZWlk8kGxkpHWx6UP/GNsn3aDOBgmq43pUIUAMsz0DhCSZFMbg3
	w59Bs3YBNfqnGjb4J0hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQiNx-00000002xc0-2mbh;
	Mon, 08 Jul 2024 07:02:05 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQiNj-00000002xY4-2AWt
	for linux-mtd@lists.infradead.org;
	Mon, 08 Jul 2024 07:01:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1672BFF80A;
	Mon,  8 Jul 2024 07:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720422109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0IaAPKCcDN2cUovINHTRRQvROEbqxOoQ8Bs5uDLntLo=;
	b=HQqpX/30vAlKLZs+VPQX8TkROXwJN6lGd2F87LBBGmfs2suBp3A0rEa0YJlgWQ2iKarA/i
	xeK9FYkRIyfwSgkTWSNwDoM/nFp56zU6oCecHhn7Sre7pACTgcs2aNWefTCRJMNjzE6art
	Bj9YKZbevGkwX39CkTkRRR1znELptxIARDmbKLesK/krKz25hn5sDiTjjv6GYZhQbG6r93
	AHLusY9R5LTi+HxAEPS26+y9002xDT3qEQjsV8YjxFg7znBjfZaF03QKI7W8eSNVu6HFjV
	Opwsxua70gr2AUl+816+cPJj2L9VQGNWqXlPddF6RIVWMHE/i4SKfRiQYaam4A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 2/2] mtd: spinand: macronix: Add support for serial NAND flash
Date: Mon,  8 Jul 2024 09:01:48 +0200
Message-Id: <20240708070148.12215-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240704024839.241101-3-linchengming884@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd7e25375f7d988cff65823119961f3a75f2a8c69'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_000151_705000_53C31FAB 
X-CRM114-Status: UNSURE (   7.96  )
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

On Thu, 2024-07-04 at 02:48:39 UTC, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> MX35{U,L}F{2,4}G24AD-Z4I8 are Macronix serial NAND flashes.
> 
> Their main difference from MX35{U,L}F{2,4}G24AD lies in
> the plane number. The plane number for those with the
> postfix Z4I8 is 1.
> 
> These flashes have been validated on Xilinx zynq-picozed
> board which include Macronix SPI Host.
> 
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
