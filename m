Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E5AC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jan 2022 10:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dxkoXn+IUMQt4Djhvc77qK3jMSL07oiJ8fox5bMDvKo=; b=ixY31GD/ROiOpJ
	g25OBM+4J6SIblP+db4eOGkU4cuM6fQW9mqGVjhhphJ/BTylsbxmDTLn/nbUSgg8dCd60KTqgjGyM
	a+GrmIxQV+tfEWLIFe7sagcR+WgmDfF1DYlnAIlTgQnjUUSPMHIu9y05cdcKtp5/NrXHaHYH7cqSj
	QPq6RPCkG5V8GYo1ViQ4JYBk79wfwnAe7UJQaKyYoELdNrCyfk5vFaEEfAbbZiPkgtn8FChL7E4AL
	12NaLz6jd2ZZdRTalaR3TViZ2wRRrEJUmmL0rVyLL7UWRMVUH54qtmNXdmBCrwjI/wb0RnFdDSlCn
	2WBmnfInEuy5NQaMbUTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4Khs-008oNl-VH; Mon, 03 Jan 2022 10:36:49 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4Khq-008oNQ-Pg
 for linux-mtd@lists.infradead.org; Mon, 03 Jan 2022 10:36:48 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0A5631F41F71;
 Mon,  3 Jan 2022 10:36:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641206205;
 bh=7vrzXz0wxw0kDWHD24+zdSJOw16tOJ0SRxitDlg9cUg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ko2VXqiqKs95AVrJCp3fe/PjDKZ4DFCIhDPPvpr/VsQa/0IGKmIkJBFDxzbo0w08i
 JMi+qLAREwLOraWbJZ7+3sNf/w2xYkhrn2WU04kQVVNOLUZ53Bsu7ABpXDL6lTAsm0
 DRD4gq+L1ZnmbPtZs2sd3mFsk4vZ2MP/5gq4O8AGcC191GPOTy1OS99ZwxTfbvwLP8
 2IAMx6s5TL14qB/DTwp1Z9G8FAlysqRchVAWztazBgsKp80Xqi8KtZ8S59pp9oW34x
 9aWSBrojeqfKrj+ppFogioY4W2Hf6p0ZFY1P1+QjoL2ojVmi8WG4JwYIFfOYcnaR10
 6F3fF67nawYZg==
Date: Mon, 3 Jan 2022 11:36:41 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>, Daniel Palmer
 <daniel@0x0f.com>, Alexander Lobakin <alobakin@pm.me>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <p.yadav@ti.com>
Subject: Re: [PATCH v3 05/17] mtd: spinand: Define ctrl_ops for non-page
 read/write op templates
Message-ID: <20220103113641.03160d95@collabora.com>
In-Reply-To: <20220103110107.45594e78@collabora.com>
References: <20220101074250.14443-1-a-nandan@ti.com>
 <20220101074250.14443-6-a-nandan@ti.com>
 <20220103110107.45594e78@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_023647_001835_E9E1B8CE 
X-CRM114-Status: UNSURE (   9.61  )
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

On Mon, 3 Jan 2022 11:01:07 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:


> struct spinand_device {
> 	...
> 	enum spinand_protocol protocol;
> 	const struct spinand_op_templates *op_templates[SPINAND_NUM_PROTOCOLS];

My bad, it should be:

	struct spinand_op_templates op_templates[SPINAND_NUM_PROTOCOLS];

since those templates get populated dynamically at probe time based on
what the flash and the controller support.

> 	...
> };
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
