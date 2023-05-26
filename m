Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C1EC77B73
	for <linux-mtd@archiver.kernel.org>; Fri, 26 May 2023 18:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DRhn8tySvDDeeE3WC48PThWFvRu/mSqgPQ2GDusOTNs=; b=uZBgLGRQb1P6UX
	H+kd/ms0CypEjNeVsQpZ/DXkszCQOExDG1UsuHe6nnxj140/oIwxJQpqJPydbw+Fp9c8rKqEbOL6M
	5q/XK8Xe+u2nsfcqtdOQt3uBt27BpaGtg+HytGR+jeDo2Leek3Mcyb8iqE0iBTT3SqISFqPECnCXX
	od6tzim8NnWfMLr5A9lO+L6wbxyLJkshZ7FVOf0UPkpjLiGfL1VgWedf8cnCYT4DJJKmT3sNT6biR
	R9j94At408Yp384ar60UYqevOoU8aG3K81Lqe3y8RbyLuAeQOs5HLZ/ryXgToZVS1ZXrf8yo+E7dg
	kLXPSL+gYiqscM/P4shA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2bll-003Owx-2U;
	Fri, 26 May 2023 18:02:29 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2blg-003Ou8-2X
	for linux-mtd@lists.infradead.org;
	Fri, 26 May 2023 18:02:26 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685124137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D2WoWOQXtKlpe3ao06i3Mft9mNFnFGHReEa4645KcNU=;
	b=RpibYJkcEKorvueyaca/oyFDtBa00jdSCdOf0UB9oNcHSbjCu1SsdlVqpTVjZV0wRf84uy
	fNZyvD7onJYGEz8ydtDfv1l9xMfvmDBb3YKRLj+7cIgZ93XtjhpEuxfD94RcFae5UFJNFw
	Y+ZydEqKXALC5gzlEHsD3xaqTztfqgf2DiWTQ39rzQla45jnHpIxZysGFk1wyO0kfuLhMC
	eA0KIoRRDV7ISLcSy771TqS0JlgYniKI0Qp+qjiOcVFoFL4LdQ4OZdBUGRprtOxCyeHYd2
	PEdjTCNoFLIcK1+wIgQnsJUyFYFZDQkSK/44HjjjvqXqyG1bxV2JgJZVc3kaLA==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C6031C0003;
	Fri, 26 May 2023 18:02:15 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	bbrezillon@kernel.org
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] mtd: rawnand: marvell: don't set the NAND frequency select
Date: Fri, 26 May 2023 20:02:15 +0200
Message-Id: <20230526180215.924342-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525003154.2303012-2-chris.packham@alliedtelesis.co.nz>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'87dee04f3c828dec34e94f1bd90ed423c3f9813f'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_110224_979111_C785C5D7 
X-CRM114-Status: UNSURE (   9.36  )
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

On Thu, 2023-05-25 at 00:31:53 UTC, Chris Packham wrote:
> marvell_nfc_setup_interface() uses the frequency retrieved from the
> clock associated with the nand interface to determine the timings that
> will be used. By changing the NAND frequency select without reflecting
> this in the clock configuration this means that the timings calculated
> don't correctly meet the requirements of the NAND chip. This hasn't been
> an issue up to now because of a different bug that was stopping the
> timings being updated after they were initially set.
> 
> Fixes: b25251414f6e ("mtd: rawnand: marvell: Stop implementing ->select_chip()")
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
