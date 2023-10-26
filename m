Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D42C25B48
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Oct 2023 06:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zhz8O+Y65zYNT3WvVTKS80h2AxCmdUNvJFNVkWpe9KM=; b=woFX//aq+HmTNU
	+kT4ZTUmP//2yMbGadt8xPpXQogFQLS7M9v1sQgZH1eqipbI8v5x2JL//9JdY6x8JAonD3WM3GKj3
	dUROCTN9cG5768MUnZfTS8caxhXUeZWe960BKeMe3kl+tR9YuVSufwMj0RDiiqU0MCGK9jDRp6+c9
	hFleAXa2AwCi/qIIfkoKvAh4ryMcbfsIh/WvjHPYM99BFy/KhH3MpRB1eS7gzpri/K66KR4Vu792e
	wR0J7u5lhMkeaS6FahERtG1c7QnRYGsDmqDJmueLQ/wokpnB+CtNLuHH+uKEu4AwbUFHp76EsTBVr
	uu8hIvusI4i/XD5yQFkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvtqm-00Dm4D-2b;
	Thu, 26 Oct 2023 06:28:12 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvtqj-00Dm3e-1v
	for linux-mtd@lists.infradead.org;
	Thu, 26 Oct 2023 06:28:11 +0000
Received: from [127.0.0.1] (unknown [154.134.133.58])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id E67FC6FB;
	Thu, 26 Oct 2023 08:28:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1698301683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IKIJ9pz/6EelcsD3a+FNse1RgjHqReUk/N6IeQ8agD0=;
	b=QjfTdqrrPXwyDOeS0DcSV0WIao1R/jbdIkBMLxnP/rfGfwoj05rWZojGmqROIJv1nuBv4b
	NalHvOgdtYzNI3YudfDrOWe9Icl5d5gXL+G5+QAMQGvksC4f+2vFkA+3ApDkeyI7aNR/O8
	PaMIO5oSLmp1mgFA8ZIB0BmciV79cPC9GkzmNxD/w8wtolIiAwp5VNaZ0IZuKs6ZlwqAvJ
	88TYAG+eBUcZA6nRayAq9AH+lYRYDjlE55M0uGwCtousTPH2vBrWej5CorUSILFfmi6Fob
	slJzISECcy04LenBRnCEGoYPfSZ2p1lrucEHDtLwjMswblcEwXlcvXxRIIOKug==
Date: Thu, 26 Oct 2023 09:28:01 +0300
From: Michael Walle <michael@walle.cc>
To: AceLan Kao <acelan.kao@canonical.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4=5D_mtd=3A_spi-nor=3A_Improve_?= =?US-ASCII?Q?reporting_for_software_reset_failures?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20231026012017.518610-1-acelan.kao@canonical.com>
References: <20231026012017.518610-1-acelan.kao@canonical.com>
Message-ID: <F56F4D7D-1264-41E1-9CE7-5DA410A22D73@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_232809_884031_D3308D2A 
X-CRM114-Status: UNSURE (   9.00  )
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

Am 26. Oktober 2023 04:20:17 OESZ schrieb AceLan Kao <acelan.kao@canonical.com>:
>From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
>
>When the software reset command isn't supported, we now report it
>as an informational message(dev_info) instead of a warning(dev_warn).
>This adjustment helps avoid unnecessary alarm and confusion regarding
>software reset capabilities.
>
>Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>

NAK. You surely missed my comments on the previous version. 

-michael

>---
>v2. only lower the priority for the not supported failure
>v3. replace ENOTSUPP with EOPNOTSUPP and check the first command only
>v4. move the version information below the '---' line
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
> 
> 	if (ctlr->mem_ops && ctlr->mem_ops->exec_op && !spi_get_csgpiod(mem->spi, 0)) {
> 		ret = spi_mem_access_start(mem);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
