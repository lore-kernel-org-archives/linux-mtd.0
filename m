Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40FEC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Apr 2022 07:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0MUGBwt/sjYG81mlE3+A2xqu1Chnuw0clb5OKHN7/aw=; b=pCAqjbMq86RvyH
	XIBajH1FJ0FkA1y8Vz0oEJ6p9drA4svcSS+VJPAjYRwp1eWzndatqEkYY+NKYTgh53JO6qKd4eqEW
	tOUrAy+ymFX10JvlJGfE8vM1GOYJvGwWrSYhKTSM4Dh1DeNs1riubgGeBoS1PRnyfGeF/HcvxaYGK
	b3oxT64ryH7hZ5ppTzg2Ep2eAqgH1ZJuzaZSjws1AnMDAughn3Z9SkhSfX3PbUUEafEcw05B4VC9n
	XEUSSCaFUsSMXOO0NtmYF766MlmpSQtscEoT1AZ5o2vYVjxipzGQ23lKoiMs08PcLcmJJOTpYDLnP
	pIf8fL2vkxBoHG1SNplQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njFiL-00CzIj-9V; Tue, 26 Apr 2022 07:34:25 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njFiH-00CzG7-Oy
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2022 07:34:23 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0C36624000E;
 Tue, 26 Apr 2022 07:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650958457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YzyxMk1kPqBBPS6IQztRw56tbzHTTECunJO3rUI8MUI=;
 b=eNGbFIm160Xi1yaYFf8MfVy63nyGDbu4M2ks5NTiLbgI7ppjat+GpNBgwuCWhRdJuKavPB
 pGstTKhrNKo7gFQiSMix01OUKbY7fOobIsf9pVH5rsILXWCfJZaDSIevWk1VhXPb2NZYaK
 RF468+wBZ8fhLgRcwX46AeKWnw03SyjNBDPefwM7HHZ7Cuw8aEeUc9b1TfVw2PR1P8lHlK
 bt6Io9QlezmkeKAhb8i+w0e3jA0Xj7JSSwh4QTqOHDit2yxoRKMwkQOXqpADSA/sxDhfFE
 JzN5Y6Dweb08gCh0utiKh3iYkQd7W4uctE+1MUQXowAp2XuzeIB6eMI4eIt1Xg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jean-Marc Eurin <jmeurin@google.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] mtd: mtdoops: Add a timestamp to the mtdoops
 header.
Date: Tue, 26 Apr 2022 09:34:16 +0200
Message-Id: <20220426073416.36906-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220425160927.3823016-1-jmeurin@google.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'aa641a22bb5b1971a459b37746b845e3f5f084ca'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_003421_992518_827ADB74 
X-CRM114-Status: UNSURE (   6.51  )
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

On Mon, 2022-04-25 at 16:09:27 UTC, Jean-Marc Eurin wrote:
> On some systems, the oops only has relative time from boot.
> 
> Signed-off-by: Jean-Marc Eurin <jmeurin@google.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
