Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C240C982E1
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 08:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3LGapaDOZVnw6hVCjVdIOAeaawjMmgde7B21QMFDaSM=; b=nqb1Kix4fR8p5F
	LhMBs1mwbr0uXNawf2KKOY1oqc+GuByPs3L6Fzl6jREhDC3VgV6vr5qyjlLGKu+XZ0oNhtWQ+kNev
	BWRU4pQurgmZBgT+Qq+O4kEt+Rcntqd2G/ZIf2AGPG6b8jWvx2qZ2X24tZ4W1LQX8UGQS7i23hPof
	NUMx5dBmtWX6sO2hTk5+hwl/hlBQmkk0jhnxQO3h0NiMWKQTV8DSNgTgzucSkwHd0O89ofjDkfQPJ
	8hWa83fQs3I5qcJdTgQjk0swTnMBW4WzEl8zAKyneIX+YeG9y3XnOAaW3zHIGyNs5GhzEP8mb3ptO
	6H13vGte2xdTZZnZ6/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Zs5-00000001Q9O-0aOG;
	Mon, 21 Sep 2026 08:59:33 +0000
Received: from mail-wr2-x27.google.com ([2a00:1450:4864:30::27])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Zs1-00000001Q8K-1jhi
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 08:59:30 +0000
Received: by mail-wr2-x27.google.com with SMTP id ffacd0b85a97d-4843796e373so1453822f8f.1
        for <linux-mtd@lists.infradead.org>; Mon, 21 Sep 2026 01:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789981166; x=1790585966; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vo4X1gyksG3IrTY1hUwlLoQK1ASX088BlxfO3PRFUAI=;
        b=Zf20aJOpiLTODgJbbXKcjbJ4OE1/JIaAWy0VybvkNwiRscFDV5BAXvD4r3XQTRocfL
         sWy6HXhxclcpwP38s6ksmOn2Ir9rq/adBEifZVC4n++M8JgyDyzUDsfmBbQnPr3HMDjm
         IFC0DAx11fUlCOXepPxyShvnOBA9kzkwe7cplyNIXa8A947vL/EC+7/fPHOBr5S5NsNy
         cq22m6AXFcrNBkxIdD4TK+ZCa4eTrn9nDRA+aP3dC5PMkc1scVy49xlo7P1cfne+TC74
         cvBIOn+Hh/4njxhy/7Z10Xtr+uRPpCHtLK3ywwH2iKWbPjyzVua6TjhYyu3cDEA3QMLU
         aNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981166; x=1790585966;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vo4X1gyksG3IrTY1hUwlLoQK1ASX088BlxfO3PRFUAI=;
        b=MA/EYO/FYqz0s0W5cn2vODsE+Clbw35VvQVEdZaGiMuQ+2gOQyH+yD07LsDtXsb0hR
         eV4lKLStvqr8z5HAY+ZP+22gLmYadKgIHE6ZQ8gcvIAo5oDOctlwTd4q+etHJ0IKFrJm
         i7PdJoRlz1Z2muVaay3yPu2LB3qYprGxUJARJIhuojAGJ9PXiLiLZv2Cu9SpbOGzS61n
         v9XeWIU7KIZNq+NHgd66pQz7Zwd4s5/tPkru0P0HtjssAtHxq0VwhDSH4E0FAoaUGv/P
         Ng1SaIATJAnWDgpptzvRjhZ7uWw9bFl45jf46SgE0lmmrXMnLptajPVIXVTE8vRbEyYJ
         FTIw==
X-Forwarded-Encrypted: i=1; AKwUvBwvA0dbTfqHonlwALkfEMxJnYMM6TTieBro4Vl49ZzLDBMzhoRBzzAlYOxSG/x6dgIlwS4BLTpM8ps=@lists.infradead.org
X-Gm-Message-State: AFuF++nagIoD0cn7J+zJqcnZhs86aFJkLQo6rLXV4A9FpiizRMkk6lTs
	iG/SDoNUyHMEf5eo86Ci8fqKvyRNB/g+1iZtp7Oz0LlENlRBmBtpUp0J
X-Gm-Gg: AYBFou28SUjFwVpjwwpHcksGK5eby7mLfr7zjO3fNegOL51chvyOZikRMbRxM2+qnW8
	Hl3qE4IvBukOYusqs4rK2KlOyuQEGdsbrYNExi5wNjuIKTlNtCobkWwT4sEaJCzc0CKIXJc0oKX
	7XF+d4EBZEKqIS9+Gy7vfaTVIEsXlsoqAnMUW9goaPy2aOcXugFS5DQJPE58G2ZMHjsWgACFozw
	YBwOYDFxmK9XbUnl/i6W3JKKMcMLF+ww7vovOeKEWjmwMeXBFwOzcY1+OYLmILgzA6IwR+Z94+y
	9+ymh3MAjKyhlXTBQRst/3wGWk2CBA6nYh+Q3quUX6qHV7bmtXHaHvm7FfPf9nFnoFmKL4gjbVe
	kQvWKjtJSI7whwmPWXcZKPAwmxpngL9SDPkO/h6AO2nHdTrvpfO6EOxM3h3pgozcu+2CNxAm4qu
	6ZHOwSzmrMReNOg2j3jnXRrAZLK7J3WL+Q/Z9S8ueWk0jCV0aiKoD+tYrBO+fYAbspEVq8feMya
	WuYGRTQM2OvmFNBiu0SUAvl86x0y5Cr3SNMtSLhrI/+U3TZ
X-Received: by 2002:a5d:5f04:0:b0:487:a15:dbee with SMTP id ffacd0b85a97d-4871e225ae5mr11911859f8f.21.1789981165887;
        Mon, 21 Sep 2026 01:59:25 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872456325esm21322512f8f.15.2026.09.21.01.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:59:25 -0700 (PDT)
Date: Mon, 21 Sep 2026 09:59:24 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Arnd Bergmann" <arnd@arndb.de>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "HyeongJun An" <sammiee5311@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: reduce stack usage in
 spi_nor_parse_sfdp()
Message-ID: <20260921095924.2f845215@pumpkin>
In-Reply-To: <DLKU0CTP0OES.30VZXJXDXRLNW@kernel.org>
References: <20260915194203.3511147-1-arnd@kernel.org>
	<DLKU0CTP0OES.30VZXJXDXRLNW@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_015929_474102_5C27E70B 
X-CRM114-Status: GOOD (  25.79  )
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

On Mon, 21 Sep 2026 09:55:37 +0200
"Michael Walle" <mwalle@kernel.org> wrote:

> Hi Arnd,
> 
> On Tue Sep 15, 2026 at 9:40 PM CEST, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Two large spi_nor_flash_parameter structures on a function stack
> > is really too much, and this can exceed an otherwise reasonable
> > frame limit:
> >
> > drivers/mtd/spi-nor/sfdp.c: In function 'spi_nor_parse_sfdp':
> > drivers/mtd/spi-nor/sfdp.c:1717:1: error: the frame size of 1600 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
> >
> > Change one of them to a dynamic allocation to make this more reasonable.  
> 
> Thanks for taking care of that. Will you respin the patch with what
> David suggested?

This compiles...
David

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 641f17ad51a0..cec699b52f27 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1519,9 +1519,9 @@ int spi_nor_check_sfdp_signature(struct spi_nor *nor)
  */
 int spi_nor_parse_sfdp(struct spi_nor *nor)
 {
+       struct spi_nor_flash_parameter sv_params __free(kfree) = kmalloc_objs(*sv_params, 2);
        const struct sfdp_parameter_header *param_header, *bfpt_header;
        struct sfdp_parameter_header *param_headers = NULL;
-       struct spi_nor_flash_parameter params, params2;
        struct sfdp_header header;
        struct device *dev = nor->dev;
        struct sfdp *sfdp;
@@ -1533,7 +1533,9 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
         * Get a backup of all the parameter to roll back to in case of an
         * error.
         */
-       memcpy(&params, nor->params, sizeof(params));
+       if (!sv_params)
+               return -ENOMEM
+       sv_params[0] = nor->params;

        /* Get the SFDP header. */
        err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(header), &header);
@@ -1653,7 +1655,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)

        /* Parse optional parameter tables. */
        for (i = 0; i < header.nph; i++) {
-               memcpy(&params2, nor->params, sizeof(params2));
+               sv_params[1] nor->params;
                param_header = &param_headers[i];

                switch (SFDP_PARAM_HEADER_ID(param_header)) {
@@ -1691,7 +1693,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
                         * spi_nor_flash_parameter data.
                         */
                        err = 0;
-                       memcpy(nor->params, &params2, sizeof(*nor->params));
+                       nor->params = sv_params[1];
                }
        }

@@ -1712,7 +1714,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 free_param_headers:
        kfree(param_headers);
        if (err)
-               memcpy(nor->params, &params, sizeof(*nor->params));
+               nor->params = sv_params[0];

        return err;
 }
--

> 
> -michael
> 
> > Fixes: d20029474a76 ("mtd: spi-nor: push the rollback mechanism into the sfdp module")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/mtd/spi-nor/sfdp.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
