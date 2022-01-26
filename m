Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E831C28CF5
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 11:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wzmzpu2H/vQ7Z0aZ9J/f2qEXUi4ZsSL8UL3sRevq1KI=; b=O9Cnu40Opqc41T
	Gel1LxWpQqznFfBAyS1yYRibDYY5Q86wlrHaRdjs+AX9ag5nAYdYmspvlcheFUs44qUXs7Yifn9/6
	8UvdLSRCR2EWW1mw+madg0BYIKCnra0lEuyKfV8f4sCx+b6Ewtf62uUqDIfsdUyxdciAhVbhUKVNo
	YovVNHf3LsThGt3igRhfMkfJnfL/O+hSfajtXuq2WZ4EZH0Eg4QzVOvjS/e4fX8TLcabj/poMuDih
	a8ARxlOszLxAqHIFCzM9oyj4q3ghB6e3ciXAFvPuutD1xHF/8zhN4epQccMLgGjjT7Jk+bm8t41Gs
	7HqhkdR7fverUe8tXLaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCg5g-00BNrG-GC; Wed, 26 Jan 2022 11:03:52 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCfvg-00BL34-3w
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 10:53:33 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 948696000A;
 Wed, 26 Jan 2022 10:53:28 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v9 02/13] spi: spi-mem: Check the controller extra
 capabilities
Date: Wed, 26 Jan 2022 11:53:28 +0100
Message-Id: <20220126105328.883201-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220104083631.40776-3-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'85d1fd68668010b505512e2fdce85cd2483d6666'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_025332_334170_5DB77F29 
X-CRM114-Status: UNSURE (   7.48  )
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

On Tue, 2022-01-04 at 08:36:20 UTC, Miquel Raynal wrote:
> Controllers can now provide a spi-mem capabilities structure. Let's make
> use of it in spi_mem_controller_default_supports_op(). As we want to
> check for DTR operations as well as normal operations in a single
> helper, let's pull the necessary checks from spi_mem_dtr_supports_op()
> for now.
> 
> However, because no controller provide these extra capabilities, this
> change has no effect so far.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-mem-ecc.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
