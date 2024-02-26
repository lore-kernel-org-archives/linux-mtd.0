Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC864C48BF6
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 14:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=42i5DYRaBrWL8GdZQZoCRqjze06kRl4p1frggzlOQ8E=; b=R+ZhOoxCSUSzbu
	UB/Zmzdp1fH0MXjpxnMLTahUKuMqTpHkXa70K6jvV60INcr8dCwmlDXJg7cZM6A+5NIiJlYrAH7nI
	URKNrwSGwI+Sib62nT9dpt19YDsvMjCAJ/7CvDnOc2/J3/h+D1q1EOro5VUTHUrELBovQ/jcjPccn
	4JJ5bJLZXsHr+m1mE2erYV1t+xy5bqquaBmoFf1uVl20mfO39IaWwy0NA02vxg1qArtV6ieWEmOQb
	3dRGF1wBYzaw97T7Ri2IUI2bz4Z5WMVC8/8MQS+LXm/aCr8xmQIuNFkVkWk0QyQJhAlVu5bR13ldO
	yjEtA9/i5WqPk/itAGvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebY7-00000000y5K-2NCe;
	Mon, 26 Feb 2024 14:01:43 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYTK-0000000099L-0kYA;
	Mon, 26 Feb 2024 10:44:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1750240013;
	Mon, 26 Feb 2024 10:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sjjoQd67ueW9tUYehmx3lew+ekNl/RgJiOHf+uKawh4=;
	b=KPPulmTgjrIL8rQttjQzYXq/5WbvureAD6QpZbuHZsTmNCI9wJy5OFk6rDbjxOuvwexqkM
	VC3n0TSGNi0k2NFNOSs9wvcw/X+aLZyD6wbhDwALgbBR4nIcgyIb+aIqVaV856k+yexQOM
	5TR2tpIXfncqfmbHRZ8d6/FXpr5ee2BdORY0WiSZGiA2vMtnenMqUayllsBl38TyJ7iJIr
	BoyKopTFGn/w6nUyKo37WFdFRsSQbXSx3EoSwGRh4C7u8v7dZ6ToNr9/60V/R5aqSUX/p4
	8jikYP9qZxjVmMA+tfsuXV75heOWabZXfsdORQeGT4brmBuckuKJhDryKurGIQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>,
	Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	f.fainelli@gmail.com,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	David Regan <dregan@broadcom.com>,
	linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v6 03/13] mtd: rawnand: brcmnand: update log level messages
Date: Mon, 26 Feb 2024 11:44:30 +0100
Message-Id: <20240226104430.489749-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223034758.13753-4-william.zhang@broadcom.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'5542164bbe4bc33f88e42edec1ff3164d1ea4086'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_024435_329982_78223E90 
X-CRM114-Status: UNSURE (   6.41  )
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

On Fri, 2024-02-23 at 03:47:48 UTC, William Zhang wrote:
> From: David Regan <dregan@broadcom.com>
> 
> Update log level messages so that more critical messages can be logged
> to console and help the troubleshooting with field devices.
> 
> Signed-off-by: David Regan <dregan@broadcom.com>
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: William Zhang <william.zhang@broadcom.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
