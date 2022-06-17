Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEC7CCA479
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jun 2022 06:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SgLmD5cqqAMvO3WX/yma/uomK2ybISXZ9rpBmGFfVdg=; b=1bYQLCXMaqdAu+
	Pb2vUPJEWDmbkfftHON246iWv7w+Ih/55bawxJ3wO2ZkYOev2W0AO/fg4i1VppGF9A6cpGqe7b26/
	W1wFwhzqt1zRHNbXd53IO7Kom1jenNUVTCJeLBhJ/7DQGnCjzyEf22gqL0RlwSgk6uokroKU8jgxK
	n9Yv2/tMIlKRJPV30kP4iG+Hf5ry8TjIoJfmJezF/kuyAoYAZaekh2QxrPX6O1pJM+2iSxh5Lz148
	RiOynfqtYvh4BNG0buUHDVeqv2N1kmh3/84pDRnHnjPzm5PqHOfQZTBY6lSzCRH9xATVVGk6srfj5
	RvE31pZODlGr//Dluwrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o25W9-005jUz-Lq; Fri, 17 Jun 2022 06:31:41 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o25W6-005jTi-Fe
	for linux-mtd@lists.infradead.org; Fri, 17 Jun 2022 06:31:39 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AC2671BF209;
	Fri, 17 Jun 2022 06:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655447497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qs4Ga9UsrtSUQJ3nyuPtG8TEyz2aTJ8HG3dkzhkbi4s=;
	b=OeEGkApYT5PJAodV4MBkOZx9QAeuT2bQJQIjpQZfFZzz8bNWr9m4cSh3pa28eFB6LIVJhM
	w5PRf2vf9BOQfjTUEEZ50j5djrwVNBspg997ekuYy3WVQfd550fe0oTSOvRsXM4ny0g2aY
	MIsVwJv2f+41UBB7I7vv2gDT141QKgAAt3tWt+ZNB9NanQgfHthEguT4CgbcA/SAcVz383
	Wk3HPd3/5knDzUZLU7ffhjCKK/frCyoRN9By9nldGZsOCpH+nQTw4HzDqVcjcFUQiRMBHc
	UfCtJ8Mz2+x5fsY1kc5kJWkPWSBBjI0Qr7yENzBQyQMv43P42DdSV8MKBVh66w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/3] mtd: nand: raw: qcom_nandc: reorder qcom_nand_host struct
Date: Fri, 17 Jun 2022 08:31:34 +0200
Message-Id: <20220617063134.446748-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616001835.24393-2-ansuelsmth@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b360514edb4743cbf86fc377699c75e98b1264c7'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_233138_692654_DD2E0A6D 
X-CRM114-Status: UNSURE (   4.63  )
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

On Thu, 2022-06-16 at 00:18:33 UTC, Christian Marangi wrote:
> Reorder structs in nandc driver to save holes.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
