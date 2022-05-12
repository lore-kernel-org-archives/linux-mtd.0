Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C94CC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 15:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kPZUr+HyObQsUQKWJx5pGogRtwi1G8pofn1zdkWfimY=; b=jcuZQ5vWnPQAQk
	hi/UbTHHqem/i9ydWWmv5AKogmBF2vFlp5eJb/vkc1SXJBT4h0Fx1GnEE1K/iCG5NMQgk1a6aCg8z
	WgoNJP15APn/oYWMxwgptUMssnnfVj8tTgFYk3K9A3IEO+CXnc3/os/JtIF1b4fA57bzDIliVbq/3
	qHtj5pYPLHAMrayzwvemIBWeU+gusCjp3wmyd+DwWJe233vITEmn4hR5BrAQNFS1XdmJeEnKaFxhl
	smCWaV/VInlC7xzw64cDQaErobIU6F912NNrRz+R/GNN1oNSRjqZeT7KlPr0IJx9U4WxzulIgN2jn
	VaS5H7UEirkNRbtzvHkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npAjF-00Cc7O-Ia; Thu, 12 May 2022 15:27:49 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npAjB-00Cc0b-7J
 for linux-mtd@lists.infradead.org; Thu, 12 May 2022 15:27:47 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BE743100005;
 Thu, 12 May 2022 15:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652369261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wr4+NB3BzgBncll9+GH0V30Tb3C46q+QizFJHz7cOFw=;
 b=ovPVtgiRIL8mVmIMNoLt6FkuALQ0Z5ZLxgrtRiPs2M6jN1AQeqKBjhHQeRzmQUW84oUHAQ
 kE44XL12XnY2SMDEyk4xPAMumFceFkvDSHr8laRx4VGY4rGixNNQY6egER6J1WiOI+aOmj
 4uQa4XiYVxzhZwrVN80CwWFYncvcRmttGOk7yABt0vF5BvboBpugtTHK9ZW8MphRn+aGHI
 MPMp2do82F0WAPXt3IW+b9uXPmCNVUm0+RfcDALPdm0HXkzi5Xm62sVgcu9RWSUYmY7JQQ
 asOTaCNkxHiEBJ5khEyu8ms7I9K+rQrsRqSQ9dlqcikBOky3SvwdTIonl3O2OQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Milan Stevanovic <milan.stevanovic@se.com>,
 Jimmy Lalande <jimmy.lalande@se.com>,
 Pascal Eberhard <pascal.eberhard@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Clement Leger <clement.leger@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: renesas: Fix the NAND controller
 description
Date: Thu, 12 May 2022 17:27:35 +0200
Message-Id: <20220512152735.245009-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220509154943.25422-2-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ba93392a6af8c4bac39f27b477ede060fcf4e7c9'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_082745_415202_064354C0 
X-CRM114-Status: UNSURE (   6.01  )
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

On Mon, 2022-05-09 at 15:49:42 UTC, Miquel Raynal wrote:
> Add the missing power-domain property which is needed on all the
> RZ/N1 SoC IPs.
> 
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
