Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC3FC71156
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 14:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1uVWU5RcTmqHzvNfug+p85seZGYixoxYYZHGRkHHo8=; b=gqGK801QO3I2kH
	3keQT+zvWtRzJhCTM0hRkAsHCETY71q2gQfqJUre6auu9tjZMDwciJU+xy3cub6fdNa4ZK/wkF+Or
	a3HscLykkNtCperXtjnyQbt0yiIp9Mc9N3reuK80EAUhBbnE2y+9415X3I4DSSjC2BEmeVrxKtOb9
	OuhggQDCU56rmdtZqxAaKoaDEC8qWc/nrC013O5gLMovjUwY+JpYFp/I75mvqi0SAzg0t0Dhga/LG
	1u1jsLWqRjTp957Twd7dAsFaRynXeWnvJ9EwvoZGZthYqf1A9FvajADSUpQ8nb8MCrAsMgEYOQMjk
	fqk3epBhAv3lDREsmDvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0fg-009Vz4-2Q;
	Fri, 18 Aug 2023 14:41:52 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0fa-009Vre-0a
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 14:41:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EAEB20004;
	Fri, 18 Aug 2023 14:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692369702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lyznu4cPe0CCri4js4T7LBA0b1sDnyzuZNSR3Uosod4=;
	b=SheUuMlVRP3GeXpJVSZeRYPvFM1QyDmwi5gETIHeIRRfoQD7uaYPNIJa6fwVgSX5iIfW2V
	NUngfJe7foSHkUQH+bTdY4yceFHS6i6B6vFih/ppK5pE7VdwVVUV6Wig7YlsNsTEKjvdKL
	OoXpiZTYqUQ/f0jPHRRQ9XV3JX7hV+tGCFONTtnr6jq9LYbkPZ6woLCWdfSLHZA90uDgIX
	qSxWe+jxFQwYMVAelt9s/cz4OOLG5YZJQ+HK5UasHCJizbCL3q2wFX4rp275IWG9sZYwif
	xJ19sEoQFi1hWXjKtoTpqklLdRDlBs+OVQrPKjcCs/h9xhV387lLGfq+NIloQA==
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
Subject: Re: [PATCH 02/10] mtd: rawnand: qcom: Rename variables in qcom_op_cmd_mapping()
Date: Fri, 18 Aug 2023 16:41:40 +0200
Message-Id: <20230818144140.146111-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230805174146.57006-3-manivannan.sadhasivam@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd68b7e5f49b81944656eeb70fae1b733f5ac26d8'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_074146_368454_936372EB 
X-CRM114-Status: UNSURE (   4.92  )
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

On Sat, 2023-08-05 at 17:41:38 UTC, Manivannan Sadhasivam wrote:
> qcom_op_cmd_mapping() function accepts opcode and returns the corresponding
> command register. So let's rename the local variables and parameters to
> reflect the same.
> 
> Reported-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Closes: https://lore.kernel.org/all/20230804190750.3367a044@xps-13/
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
