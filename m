Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA82C25B71
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Oct 2023 04:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pF+NCgUJ5UUSKXEJ+7oOLm0htj47H6Qjt6Fh5x6QRAo=; b=Y0JgeQ/5RMyFIo
	RbfDdLoYrTc9zd8G5HxywnVkmnJ8HiMmCHMB6/DZRSDixqUhMUPF6nA1RXALKEsFlqonMLyczpKWL
	/oNoRuEuSlWLL+RhZ4P7DKxm6hrlo8zKQXUXZnhI/JBNfgSVf5HCjSvFTCHedC1cCmLJT6qIXAKZY
	aIO6hiMEdZpq3/YZvMmUQ5PHEKlH2l/tvzolslWABT2yiiYnrSVtqsrmXgcQSYeJtYaqrKv50TDbg
	UAqotcMIbKR7QxNWCY3oqVmsAEIjaGdsFCDxHdGBm71T5Z+HD3tBO3LyQcGZT55H+ZRmdw6In1YCj
	E1e4yZP/ecc4aQmQFqhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvVSv-00BJsm-13;
	Wed, 25 Oct 2023 04:25:57 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvVSq-00BJsN-1r
	for linux-mtd@lists.infradead.org;
	Wed, 25 Oct 2023 04:25:54 +0000
Received: from [127.0.0.1] (ip-109-43-115-212.web.vodafone.de [109.43.115.212])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id D19006C;
	Wed, 25 Oct 2023 06:25:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1698207949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jl9DUJy8yRzO++FF8dyWq38fc0SfZyo5hrCjsG2i7is=;
	b=IzjDm92VnW3bO+JuunQS2V8szoeiD8vRZIH3yOnVUPnKDVxr+fj4EfJdfRQmM2BFnllcch
	/OOXPhaWMCqrbjlo/+0u3sj2KSBF8DVsj35bhrdFFh2vTHmz+caMSajMHTmyaLJjDcNrx4
	qvlUCGgADIuaxF3qMPy/JJmzy4sZ/KIP09hbx2yWjzAP3ScYOiwlTZlUIZTYuecfx5i3lK
	6atWeMwiAW3ZWjj9/Hl1wRxWOKoMeNIDrDoTxKU/rAwciv16SIOl7Yr07q+6RdKEjrCGR/
	ZyQDLQLGJm6ZTKWK27P1KbvhveL5oa3SUH4vvkWZUkOMb6X6th6DOTytnvNigg==
Date: Wed, 25 Oct 2023 06:25:48 +0200
From: Michael Walle <michael@walle.cc>
To: AceLan Kao <acelan.kao@canonical.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3=5D_mtd=3A_spi-nor=3A_Improve_?= =?US-ASCII?Q?reporting_for_software_reset_failures?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20231025030501.490355-1-acelan.kao@canonical.com>
References: <20231025030501.490355-1-acelan.kao@canonical.com>
Message-ID: <6B9232E3-7159-4D97-9B40-EE77E2F6EA5B@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_212552_789359_E9812EE0 
X-CRM114-Status: GOOD (  11.88  )
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

>When the software reset command isn't supported, we now report it
>as an informational message(dev_info) instead of a warning(dev_warn).
>This adjustment helps avoid unnecessary alarm and confusion regarding
>software reset capabilities.
>
>v2. only lower the priority for the not supported failure
>v3. replace ENOTSUPP with EOPNOTSUPP and check the first command only
>
>Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
>---
> drivers/mtd/spi-nor/core.c | 5 ++++-
> drivers/spi/spi-mem.c      | 2 +-
> 2 files changed, 5 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>index 1b0c6770c14e..42e52af76289 100644
>--- a/drivers/mtd/spi-nor/core.c
>+++ b/drivers/mtd/spi-nor/core.c
>@@ -3252,7 +3252,10 @@ static void spi_nor_soft_reset(struct spi_nor *nor)
> 
> 	ret = spi_mem_exec_op(nor->spimem, &op);
> 	if (ret) {
>-		dev_warn(nor->dev, "Software reset failed: %d\n", ret);
>+		if (ret == -EOPNOTSUPP)
>+			dev_info(nor->dev, "Software reset enable command doesn't support: %d\n", ret);

As mentioned in the previous version, this doesn't add any useful information. Please just drop it. That is, just guard the current dev_warn() with "if ret! = - EOPNOTSUPP".

>+		else
>+			dev_warn(nor->dev, "Software reset failed: %d\n", ret);
> 		return;
> 	}
> 
>diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
>index edd7430d4c05..93b77ac0b798 100644
>--- a/drivers/spi/spi-mem.c
>+++ b/drivers/spi/spi-mem.c
>@@ -323,7 +323,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
> 		return ret;
> 
> 	if (!spi_mem_internal_supports_op(mem, op))
>-		return -ENOTSUPP;
>+		return -EOPNOTSUPP;

This should be an own patch and you'll have to fix current users of it. For example, there is at least one in spi-nor core. Probably more. 

-michael

> 
> 	if (ctlr->mem_ops && ctlr->mem_ops->exec_op && !spi_get_csgpiod(mem->spi, 0)) {
> 		ret = spi_mem_access_start(mem);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
