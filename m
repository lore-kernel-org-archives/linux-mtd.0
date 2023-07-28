Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B17C001DF
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 12:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCKY1z95ITvyT+ifFcpWk1907hr/Mc6H5/W2h/eIQnI=; b=sQXaCk88CMAgh0
	8OQxEUtAoJ1KXE5PHXR05GL7txBq8x43KXBRGM6pHUdkxHS1a/L9zyUi4k5D4uOuFJe9CEAnPIVuf
	fZ8bsSTXiC2drPf5fA0u7Xm9pTKDY2yiBnzIpB993tnKfZ2knTrt8bP6WXhadUSo4kKNkHASgAhzO
	iC2CM2sTeiLpZtDl9iFm671CWeZiXoFBTa0S2g4knOrOZgUHq2+NSLNQGcDB/kqGLtc/PjMXwnhp7
	4QwVp6O9f3Ia+nTWEAjcGqezMm9+ms0FeWX83iNt19+gQbR3k7dlWSmZSuy7r4nNCOSBFN3r+Ttny
	BHrRJCpXCUsAANNB0b1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPMgh-003KzC-1h;
	Fri, 28 Jul 2023 12:35:19 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPMgD-003Kjr-2N;
	Fri, 28 Jul 2023 12:34:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id ACEEDFF80A;
	Fri, 28 Jul 2023 12:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690547687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8e4HjHKqiAyvdqjKb7lJ2vJLIirZVw9ELdoJSuXM4kw=;
	b=Ntqag7nlV7sIFI5aVSfMywjglPh6uxyXJ0ZsxrmhElz2EQt7eist5MBs3abjXnCXXBTxn2
	aAbiFI5OkOiR77zDlqI3G3vp2slOCu40VmkGcWPI1Mv1PiX8ns1zKvKqS0hrU5DJnYz7/2
	e6gsQduTlBJ3xJAkUbXvysyLy3pzN9cPRb2B7xDs4sXFF3pnTkhINf3g0+i3F11CnBi7LN
	lhOpz2AwJgn7JNdWchAtedNg/iNoc+czB1kclUva0k45o8EIxqoWRR6jBkNTSJO82f2XGS
	IhB6hBICg0YtG+6LC7oGyBqGV8OFjBX4MJEu7wIlwi+QOUBZOkwY1BO6n2TdFQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/8] mtd: rawnand: qcom: Fix wrong indentation
Date: Fri, 28 Jul 2023 14:34:45 +0200
Message-Id: <20230728123445.640727-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230716144612.32132-6-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'fd29ba6707f9b81e8c79a25f25d76a1d39fd60c9'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_053449_914449_AD103463 
X-CRM114-Status: UNSURE (   5.78  )
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

On Sun, 2023-07-16 at 14:46:09 UTC, Miquel Raynal wrote:
> The main "for" loop in qcom_read_status_exec() does guard the following
> to if's which are badly indented. Fix the indentation.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
