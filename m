Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AEDC71157
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 14:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZITP9YWKYgGZEiP/6h0mUCNMPGcc7VfdK2Lyu4ONbM=; b=WXGDW8AVQXkP0P
	NW5eXnU4425t/wqwG04Pgi+c6RnXJxW2GcaRPW2sn+ETj/dI29hKDuC1mUNJ7D0aky6PgCWNrfF+I
	PQlIqe2mmgv/LNYiNe/HcRLyxG8udP2aP/J9razvcm2eFB8kgQ12RZco6xCn2EclvDtvOnEv0IF9w
	YvPR2OROpbqSn3RlHEnn4QrLZbHu+781zU2qZLtKasPxt6wykAOa5v9HKRGD+/S6axrciiCD7nPE5
	yS0JEE0si4+7Z5tkIRhb/OBz1DJUmMKY65wtYZDxNpubXCzTsDwK+ncB+l4GRm7AS4pyIbAZo/b3s
	QUInhbhpOtMC9yEb8JCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0fJ-009Vii-39;
	Fri, 18 Aug 2023 14:41:29 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0fC-009Vfi-2g
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 14:41:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 693B4C0003;
	Fri, 18 Aug 2023 14:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692369680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JL8VnhWsZioufp73fM1Z9QHnAnuH4IfQprUTEmxqQC0=;
	b=g6DYzWAGwbZKQFOBEloy7GG6QL7uZPtqY+DHNwf/A6H8o5Wpe8mhioOThew8RibHB9oz1W
	kDgt5u77r7FILjbcud3tpf36LTjUB6/N9MyWNqt7U3vD+Fv2hCRgP7p71EvhTPhDsKxGoK
	0E2Mc5M0ZQ5IoAfwACxIUeNxTN5yStyTmjpZbYoTAS5NrrsQM/r02vjJBRsa6wHqZLIluH
	SVKaVj0eTCR58YbW+eVxU7ptZ/6JrpIP/ZKRvBE83n90jKAWHr1cWitZZVupHiWJGl0nWt
	yGblCb/v5WYzbss5Eik2a4fSYagngyla6+xAKu+OOhXx/sdThIE+KkzDUTwsRg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_mdalam@quicinc.com,
	quic_srichara@quicinc.com,
	dan.carpenter@linaro.org
Subject: Re: [PATCH 08/10] mtd: rawnand: qcom: Simplify the call to nand_prog_page_end_op()
Date: Fri, 18 Aug 2023 16:41:19 +0200
Message-Id: <20230818144119.145938-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230805174146.57006-9-manivannan.sadhasivam@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c56de1e5b916154afcaa9f4df46f685cae75f173'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_074123_003309_3F5F1480 
X-CRM114-Status: UNSURE (   5.00  )
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

On Sat, 2023-08-05 at 17:41:44 UTC, Manivannan Sadhasivam wrote:
> Now that the dma desc cleanup is moved inside submit_descs(), let's
> simplify the call to nand_prog_page_end_op() inside qcom_nandc_write_page()
> and qcom_nandc_write_page_raw() to match other functions.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
