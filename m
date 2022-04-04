Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B8EC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 08:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cRKTcG3v/81obdm8/HKt8CDQ8JdEl8KzeZmLukafe1g=; b=j3pwu4eHtL+8aS
	xOj4B79ZBC8k0W1GZgaAk+SNXkWJhHrUi6GChMyFuronB6hvq7dSvevml5wZPjdKi+IEL1V/Bx9U/
	O+SJPeuv378qwP902+At77lW4dJ+8xHoWCJm7Ry7XMiWFhhrmU22FA9Ur2TcrdG5l2ZOeoatDTN07
	SphFOExopUnjYAjYa6dyReE24dBITiq5UPsaRRb3cMJrftJ+VqzZ/RWCrEnCVs/E8/z7dCafVab1y
	c7mBb56SWuF637y2c2eV0Ul7SeRuxbbfhYcy4Dy94uc4XyrUdPMShLs4oasBpDe6fKSah/iZi+32F
	+UoSxQzqKYn/F+ecu+Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbINW-00DvFW-JG; Mon, 04 Apr 2022 08:48:02 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbIMq-00Duix-CQ
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2022 08:47:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7B35E20002;
 Mon,  4 Apr 2022 08:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649062038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=avt89o5SBybcyfyH/lllNg9nEWfcYc2z4/7aYXMyPe8=;
 b=X0l+c/fQTrzF2DfVfbVoKEurx0is05tR2htI35ud21mqJkTSSzypMo55EYQQfrCb6aDREN
 /a3v5hHHPeawz2BwvnxiAisG6ttoBFaDAV3gsZkDFcunX8Ads8FreuSxCfdhgPBVWcD5I/
 XoMYDSulu1nvFBRGhWMJ/zRJrh7gvdTdYYvJxKGIG/zFVgvxOc3yciWzHDKZxEMgO107ck
 aY83os34/j1ODNR7SOgn1nStqCaQkmL0XqMf5gPdsLMDQvZ6qih8KFWoCjjY21OxOhtqbY
 f71c5Jzc0S2T1sJa6EdZiORBOaQwfo231sBwGbp9HaUtR6DqzFmUmtgWDhO1pA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chuanhong Guo <gch981213@gmail.com>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, Stefan Roese <sr@denx.de>,
 linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH 3/5] mtd: spinand: gigadevice: add support for
 GD5F1GQ5RExxG
Date: Mon,  4 Apr 2022 10:47:16 +0200
Message-Id: <20220404084716.1202690-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220320100001.247905-4-gch981213@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'620a988813403318023296b61228ee8f3fcdb8e0'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_014720_605895_6118EE23 
X-CRM114-Status: UNSURE (   5.89  )
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

On Sun, 2022-03-20 at 09:59:59 UTC, Chuanhong Guo wrote:
> This chip is the 1.8v version of GD5F1GQ5UExxG.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
