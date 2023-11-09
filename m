Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F516C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Nov 2023 10:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bM7E2KbShbuaFHwxGnzKna4f5vSnihQdo/W63zo+n4I=; b=DuhBjq7KLH/EAW7plSlaXRtJLd
	WgLIDQo6MOT71HWY44nyIi3S2stQoz3aZatpprwHVLC3wHdreg/VQt+59oViPKODzhzYg/dKPf4BD
	jn6q3e0NnjjRisxpfJXdxYZiRxMpiZJkkDH0maExPTxUjufN8OydP/7ohECeMGdfcaSaMMck2XQIu
	r6j+jk1k0TX9YSAJpWzj/uSqpoJ9n1Rzxx0ZH74mzEtCNZoGyK5dUkQiv3OIbyhdhxw7jz0XSJguG
	JjDh2FdaSS/ac25vsd9i0hZtn+ogI1QD2i1OTqZ0qn3Z7iSCqpgxYAdMKqNhfnoPEE6nAYPEYQ+SN
	TvXiQdAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r12jR-0060Hy-19;
	Thu, 09 Nov 2023 10:57:53 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r12jO-0060HP-2L
	for linux-mtd@lists.infradead.org;
	Thu, 09 Nov 2023 10:57:51 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id AE36E4FB;
	Thu,  9 Nov 2023 11:57:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1699527468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I0Pp3wxLQxwvqinEldW2iB8JkRt+g+vtQ+Ggstn4sQ8=;
	b=DhiHDNjfo+83A4Ge6f7D1E28o+nCjbDt1ahL8+q0oxAO7tXocl2jBhkhutCtMla3A8oWFj
	XezJEdEE5Es65SeYXsZ6jak9edvWPvYFUIvfDwUbhkqR/CPcxzzngmbY9NSqfnva6QyC0V
	zq6/BCP/1GEqS0G6xhioLDq0ZwRVtvUfp8lyFMBtsG4CYW5sA4wjZ2ZygYJym6QF/5jpvz
	Rry+DmmU9oTWo3wnWNugwXAG3QEYeNtt6j0a/KMAyjLFs0wF8BRRZMuYfMm6VfGUtEJ3IT
	zB1yShHcA/8yyQ6FNf7pc9E6Kx47FKFIljwpo9oBLERuyRxNCpJLy6oPSfX6UQ==
MIME-Version: 1.0
Date: Thu, 09 Nov 2023 11:57:48 +0100
From: Michael Walle <michael@walle.cc>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mika
 Westerberg <mika.westerberg@linux.intel.com>, Dhruva Gole <d-gole@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] mtd: spi-nor: Stop reporting warning message when
 soft reset is not suported
In-Reply-To: <20231108094303.46303-2-acelan.kao@canonical.com>
References: <20231108094303.46303-1-acelan.kao@canonical.com>
 <20231108094303.46303-2-acelan.kao@canonical.com>
Message-ID: <7fbd05e9683e7c79d7d9ef1bf2cec5e8@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_025750_916301_78D673BB 
X-CRM114-Status: UNSURE (   6.60  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

> From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
> 
> When the software reset command isn't supported, we now stop reporting
> the warning message to avoid unnecessary warnings and potential 
> confusion.
> 
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
