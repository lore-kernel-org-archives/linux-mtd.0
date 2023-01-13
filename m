Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0AEC61DB3
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 16:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=smjuUuJLkNsrl8UYJR2IilWFMTN+Gwgqxf6GpJrt7R8=; b=XkuJg2NxpJMUAw
	B58Sz7uWdIyA0/v6UcC3PKhZX8bSJli1nkwbMpFHk3K5b56MM+GhY1wPro1IescX/cxoggnki/LPY
	n1g+SEVSJDPylEsWQC+eHSitsXJUCO/ke3ntGVXB6sL8tQY7qtyYn5HWaj/VM71VODGP1EQJG4us0
	//y92TaHHPGVT3UE8VGh5BAu6OcGN5BocFOeItFkMamEHbS3bQbMVWhM755uySM72UKB17gir2ugp
	aL21oA065Nvf/TPTzECTTZI5fJ08CQ1LEa1nJECQx+ypjZFid/qQFqtQkNoGYm9pXpoJB4HS8yfKS
	C9UnH5lj3n8o56ww960A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGN3E-003SSo-Rb; Fri, 13 Jan 2023 16:37:08 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGN3B-003SQB-QQ
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 16:37:07 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5A1C710000B;
	Fri, 13 Jan 2023 16:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673627821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cGIkgIKAtsx1E2Dmap055klTWe/g2JA5Jfb0pIya9WM=;
	b=Z3sUyi9ZpeNMlnhgV2gWffejmdrWffaCBq3TxFF56E0nHfQTybdToQIItZMRNOqwGfsRDn
	ORRXOYOoNSxodMuTj20Fict+HjtuKklwkfI8pJCzhJezzEsYtE4tvYXGH8Z3V/wAESEdAS
	pOy/wspsAH2TFRKRpvK94tKxpyltLH70FMa2Cg8ycUtH940t9rF0NNKTTQJcG2pWLkwWyk
	rp+IAOOq6qtb6lGZtyflua4p5tG5+Ca+x+BJpdVlFw0EmrENxdveUCuLAsEA4KfkV9kT6s
	TBRZJtFR3rne1dIzF9Tq/xXecL+NDaNh/+xSEJFY63ZgzdsePWmpyQE/wKzugg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 2/3] mtd: rawnand: Prepare the late addition of supported operation checks
Date: Fri, 13 Jan 2023 17:36:57 +0100
Message-Id: <20230113163657.1296051-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112093637.987838-3-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b1f9ffbfda07acee9bdbc77416facf606647b523'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_083706_029669_211769C6 
X-CRM114-Status: UNSURE (   6.89  )
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

On Thu, 2023-01-12 at 09:36:36 UTC, Miquel Raynal wrote:
> Add an empty envelope just to show how to add additional checks for new
> operations. This is going to be used for sequential cached reads, which
> require the page size to be known (and the discovery to be over), hence
> the "late" designation.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
