Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E1AC10DC1
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Nov 2023 10:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E64lx3+rEwR67TKI+5yU78MdAm3HnOM1gFK9U/+5UM0=; b=WoS9IKxsrcd9w+
	n9FDFpEtJn0KzHWervAWZSxtqpQN97h7LcSs4l/bWIGj4waoVPNIVQqfoyp5b88TdhecQkrYNLSLU
	QRG5jlg4o3XERqguGuweZJNzuXoeAN3LHAN4g/pCDZsg+BRauwUYpLqf4PQGnLmf+ySu2H/30mIVj
	ej8utwBXahRbluWLLFuQWcbEteh3JL/eIz5YdjlY9SkWnixuNK+B6fu2PS9Lkv5ZcE19hzMeIRYsB
	bhO1A/DWRXgNvEWQOSf0u9XsO3U9wpMqVWntfszGEXQQorisaz/GEc300EnOYyDYP2qkmowbnKP1O
	WFCFmfR1jIxUuvnHwHoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ePd-00ASxu-34;
	Thu, 30 Nov 2023 10:36:53 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ePb-00ASw6-1M
	for linux-mtd@lists.infradead.org;
	Thu, 30 Nov 2023 10:36:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A873EC0002;
	Thu, 30 Nov 2023 10:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701340608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B4R/rT8omslDNFvMUpnsZeXUCmWStLp6MEVstgqvAhQ=;
	b=NaDVvJ0cIuXqVRZEYS3m4S674zZtbn4deFb0tLqg1hOKUc2RMdEECclq1rAaJ21YgBFJIx
	uhaPoQtTGgm5AkXlLsQMS7f6ldArPes5b1tmrDdQXEyDc1HL/NQEu0EiWEaz9a5f35bYAP
	9eNaFYzw5DlEob2qDBtD9NH4DDEyXNBTnO3xrzWVQzJo6oS7TUdV+d95C7ZSNzNWHqTvYg
	NQvhKaw63aQG+U6ym1xAztxIkRgTksrwtMGxqiPter6XzPUjlaL8n1/iU17gG//su8aNOT
	+aQiyuciA6R7dQwV8JMsrtxpy55ED+29WAG0lMfQ4TeOcHoQp6SXrPhyVhzsEA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: dregan@broadcom.com,
	miquel.raynal@bootlin.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-mtd@lists.infradead.org,
	f.fainelli@gmail.com,
	rafal@milecki.pl,
	joel.peshkin@broadcom.com,
	computersforpeace@gmail.com,
	dan.beygelman@broadcom.com,
	william.zhang@broadcom.com,
	frieder.schrempf@kontron.de,
	linux-kernel@vger.kernel.org,
	vigneshr@ti.com,
	richard@nod.at,
	bbrezillon@kernel.org,
	kdasu.kdev@gmail.com,
	JaimeLiao <jaimeliao.tw@gmail.com>,
	Adam Borowski <kilobyte@angband.pl>
Subject: Re: [PATCH v5 1/4] mtd: rawnand: Add destructive operation
Date: Thu, 30 Nov 2023 11:36:44 +0100
Message-Id: <20231130103644.715379-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231125012438.15191-1-dregan@broadcom.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e82a5a014dd54496efa3f09430d5eaa9726b0f5a'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_023651_598508_62C3EEB0 
X-CRM114-Status: UNSURE (   8.49  )
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

On Sat, 2023-11-25 at 01:24:35 UTC, dregan@broadcom.com wrote:
> From: Boris Brezillon <bbrezillon@kernel.org>
> 
> Erase and program operations need the write protect (wp) pin to be
> de-asserted to take effect. Add the concept of destructive
> operation and pass the information to exec_op() so controllers know
> when they should de-assert this pin without having to decode
> the command opcode.
> 
> Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
> Signed-off-by: David Regan <dregan@broadcom.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
