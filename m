Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6516C54EBE
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 09:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u8+y7rkdkL89RYeI8NoN9i5Cp/UGV/4lL+Fqi9mRmQc=; b=tQYI16DZlC+Wyz
	Ie5xB7JS0Ha8p2aNYmAFhbIeXLYZY/1PXrAMLrtUkTYjb1y7TdL5df9BWY7W9i9J2NN3ECKkRuUly
	xENm7goODX1//ScvaeW8LWuLI4z/dpgON+OZscoqXzRd6RurpuAB63EGv38OCgd+jKIBJbbeajgJz
	n3QILYTYVdIBIIwTFHcUtAYOzuF4j/+y3ssFyMBUixmh53F3E5BiK3rtfErhb7xUZNVIEelKV4uCN
	fef7C8k00qrX9RTBQK+kJhh4ycTD+qZGd5wieyO+PH+y8og88wWsqIq9dZW0gbk1eokJLDZgWRgSC
	bYdbezW9RfdClWm0BEyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGGhT-001YRj-Mw; Fri, 13 Jan 2023 09:50:15 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGGhR-001YQS-8K
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 09:50:14 +0000
Received: by mail-ed1-x52e.google.com with SMTP id c17so30409010edj.13
        for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2023 01:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ftrudCvXJLVXBRbqfIRHJFLEm5YaepZ41CYo7Cuk+6o=;
        b=ODMGQnkWPWi/MEzaXG55NPMe6AZkNrfkXofl/quYy/sHLj+S9rnypQCWUxFq+55xPI
         QJ/I2i2e3VvcdhsciNR7WIZ4lKlaPq5sIvpRiGvf7wRMWSIpsZgR+43XxEE29LqyYrfK
         a/k3mthFJOsG/9C+vxbEkLL5HI4UQUE2wkFBKbFoTsZiuNw1OSi4qbkRpLj3pwVPmjqT
         FTswPVl23bMIoftdp7rm4pR4H8dZ1YKT/EF0zCDU/rhXOYdBJ+oIKRAM1NZyRvRft56Y
         PDiieliR3FJuurD7YChScD9CT9bvUJ5y16KzgtpOsPUsTpOPgMlRN2jQr6qm5kmqjllS
         879g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ftrudCvXJLVXBRbqfIRHJFLEm5YaepZ41CYo7Cuk+6o=;
        b=GuFbCVKi7r+o4xyJntfupQLfPSRMMjvi2jchDGPg5Wqe89k7Jig/6cX8uVpZbAPOGn
         zsmS+j3u6aZ4Fh4tFO5J1LeA3nG/l7adqTilxIM2bv+3CQa9u1DZAV47GLCkEPyfps6b
         d8bG4pS5kyplqoWdS46sE1G5uZ8Sd+SLVEM/2nPyiNzb5j0VIjLwsdNBoRox6/Uu4TyC
         SuMAJSsocISFj+csAYaoN6tm3WqFBk65R7NXwArQs4E0kREQdnufA7NnjACNE/sBvreO
         fHAJM2BzWNe6B+K+ZdagUj49tAxTg2Hudd+xxKMmROqCYtDdbpE35SeyGV+g1hOAFprD
         B1LQ==
X-Gm-Message-State: AFqh2koWvCD8lqVaML5dEPtoAwDw8MI4vM184v87HkubflW5fE6D2LMV
	FiOAjQBASt7hJxA0JmKJ+SYPGAGWScbTyU6X9sg=
X-Google-Smtp-Source: AMrXdXsP0J6YMOz0HJVl/n1T7XJDMa0mzI0LxLnIZZXB1nupljJO8UMdxvBf+cR04mFeQab5X1wMzcpcmCy3KjoqZY8=
X-Received: by 2002:a05:6402:4515:b0:492:7579:d633 with SMTP id
 ez21-20020a056402451500b004927579d633mr3834600edb.426.1673603410532; Fri, 13
 Jan 2023 01:50:10 -0800 (PST)
MIME-Version: 1.0
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Fri, 13 Jan 2023 17:49:59 +0800
Message-ID: <CAAQoYR=R8NLcdf5PgchzffA1EGx3X15cxR22ntxwKBEsuyVBTg@mail.gmail.com>
Subject: [PATCH v2 1/3] mtd: rawnand: Check the data only read pattern only once
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>, 
	Alvin Zhou <alvinzhou@mxic.com.tw>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_015013_379024_D0F58CE5 
X-CRM114-Status: GOOD (  26.37  )
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

> Instead of checking if a pattern is supported each time we need it,
> let's create a bitfield that only the core would be allowed to fill at
> startup time. The core and the individual drivers may then use it in
> order to check what operation they should use. This bitfield is supposed
> to grow over time.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> drivers/mtd/nand/raw/nand_base.c  | 20 ++++++++++++++++++++
> drivers/mtd/nand/raw/nand_jedec.c |  3 +--
> drivers/mtd/nand/raw/nand_onfi.c  |  3 +--
> include/linux/mtd/rawnand.h       |  8 ++++++++
> 4 files changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 33f2c98a030e..83bfb1ba2fa3 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -4991,6 +4991,24 @@ nand_manufacturer_name(const struct nand_manufacturer_desc *manufacturer_desc)
>  return manufacturer_desc ? manufacturer_desc->name : "Unknown";
> }

> +static void rawnand_check_data_only_read_support(struct nand_chip *chip)
> +{
> + /* Use an arbitrary size for the check */
> + if (!nand_read_data_op(chip, NULL, SZ_512, true, true))
> + chip->controller->supported_op.data_only_read = 1;
> +}
> +
> +static void rawnand_early_check_supported_ops(struct nand_chip *chip)
> +{
> + /* The supported_op fields should not be set by individual drivers */
> + WARN_ON_ONCE(chip->controller->supported_op.data_only_read);
> +
> + if (!nand_has_exec_op(chip))
> + return;
> +
> + rawnand_check_data_only_read_support(chip);
> +}
> +
> /*
> * Get the flash and manufacturer id and lookup if the type is supported.
> */
> @@ -5023,6 +5041,8 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
>  /* Select the device */
>  nand_select_target(chip, 0);

> + rawnand_early_check_supported_ops(chip);
> +
>  /* Send the command for reading device ID */
>  ret = nand_readid_op(chip, 0, id_data, 2);
>  if (ret)
> diff --git a/drivers/mtd/nand/raw/nand_jedec.c b/drivers/mtd/nand/raw/nand_jedec.c
> index 85b6d9372d80..836757717660 100644
> --- a/drivers/mtd/nand/raw/nand_jedec.c
> +++ b/drivers/mtd/nand/raw/nand_jedec.c
> @@ -46,8 +46,7 @@ int nand_jedec_detect(struct nand_chip *chip)
>  if (!p)
>  return -ENOMEM;
>
> - if (!nand_has_exec_op(chip) ||
> -    !nand_read_data_op(chip, p, sizeof(*p), true, true))
> + if (!nand_has_exec_op(chip) || chip->controller->supported_op.data_only_read)
>  use_datain = true;
>
>  for (i = 0; i < JEDEC_PARAM_PAGES; i++) {
> diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
> index 7586befce7f9..f15ef90aec8c 100644
> --- a/drivers/mtd/nand/raw/nand_onfi.c
> +++ b/drivers/mtd/nand/raw/nand_onfi.c
> @@ -166,8 +166,7 @@ int nand_onfi_detect(struct nand_chip *chip)
>  if (!pbuf)
>  return -ENOMEM;
>
> - if (!nand_has_exec_op(chip) ||
> -    !nand_read_data_op(chip, &pbuf[0], sizeof(*pbuf), true, true))
> + if (!nand_has_exec_op(chip) || chip->controller->supported_op.data_only_read)
>  use_datain = true;
>
>  for (i = 0; i < ONFI_PARAM_PAGES; i++) {
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index dcf90144d70b..28c5dce782dd 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -1094,10 +1094,18 @@ struct nand_controller_ops {
>  *
>  * @lock: lock used to serialize accesses to the NAND controller
>  * @ops: NAND controller operations.
> + * @supported_op: NAND controller known-to-be-supported operations,
> + * only writable by the core after initial checking.
> + * @supported_op.data_only_read: The controller supports reading more data from
> + * the bus without restarting an entire read operation nor
> + * changing the column.
>  */
> struct nand_controller {
>  struct mutex lock;
>  const struct nand_controller_ops *ops;
> + struct {
> + unsigned int data_only_read: 1;
> + } supported_op;
> };
>
> static inline void nand_controller_init(struct nand_controller *nfc)
> --
> 2.34.1

Tested-by: Liao Jaime <jaimeliao.tw@gmail.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
