Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D5FC71159
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 14:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7LIrvvMUA1mTHXJSJGX9iibzbdgpGaziJMy4ahsz2EI=; b=iW0wNbe/dotmHO
	GCiVCLKNACwA273+oFmxcfRZaSvCTtCocNdy6LLBzoGjw9lKI/Y8C9oMMBK69PZognxXaBcj9BSoF
	4Xv3/DdTdy/jwyo5xCLe62eESZKDHBSPax0TYRNeBTgzzWP65j7gv31m64njAYOwCTGIfLZbtUVUy
	/arWPIbf+qkIJtYdQgrHYHRfoCWu2HZFEL1KFjxZk3SiYHwZ33KHgZOso3zcgPoQbqsqBJZDozzCm
	AGfsCSXjOEnKyB6WdGJ8l7tvfpXmfhkUcHYZCWzpSuD+UdGIuOxDKAB9IwjIOwVhBB/Os5Hez1kk3
	w0Y4YjtRHHgiDt9JBVYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0fP-009VlX-1W;
	Fri, 18 Aug 2023 14:41:35 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0fL-009Vi7-2b
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 14:41:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56F46E000A;
	Fri, 18 Aug 2023 14:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692369687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yld0FzR6F0CNi0vpEAY11IySucmtoTiH1jcXNX7iZ8c=;
	b=U1arqpZMVyGJ2r0hHLcPGfuT6a/IjpOUIlES/h2EOl04zB5kxV9PaQiclkxaBKkO29ds6G
	M68dLbmDJh/mMU6elsabezrgRyrp/0m7YSlyluFRqxwOB7pyPR/8UzTgAl2qLe7qRNGBRx
	Ah6JDS1Ly81hcUosAj0V4c6yym/byXr4DDWpzCJ41ExrcE5b+3vqH95h8Nx9qsk1oYZsdo
	3UbBzwekgM0UgEEEnn1pP8s/WzilujlArx7LD5T4GUI3wpoNKqRMI1OJfVH7I2HWGaL5ME
	9vOvf8d7YktEFqrE1GixKTxRjW6yN3mF3gAb6Es2JlXqEnRcyukfLmUFv4xKPA==
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
Subject: Re: [PATCH 06/10] mtd: rawnand: qcom: Wrap qcom_nand_exec_op() to 80 columns
Date: Fri, 18 Aug 2023 16:41:25 +0200
Message-Id: <20230818144125.145994-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230805174146.57006-7-manivannan.sadhasivam@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'cf82436dd831a87c87f3d625a527a9ee35ae6f4d'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_074132_038146_DE092CCB 
X-CRM114-Status: UNSURE (   4.85  )
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

On Sat, 2023-08-05 at 17:41:42 UTC, Manivannan Sadhasivam wrote:
> Both the function arguments and the definition could be wrapped to 80
> columns to save line space.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
