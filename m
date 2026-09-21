Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCDDC982DE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 10:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9OfZO48Ci1Iry992hC6cRZqO0+ztJe95jvT/+tFY3aQ=; b=OKAAV8Z8QuRSmh
	gaTTWG+SaMaYgf8Z8TCkhkc5wAIiygOOsHOZqm0OXuBmiFWW3Fhj+LINr1weLlVoI0kkyqwcPjIgz
	T7rSiQicogd64PnI37HHUWKM//d1NG/BoRTlFti67zHUEbyynzYOFDX11flkoY7+UL2m/Izt/h4Gu
	OnM5l3/mjt9/FaGZAeBepWiiCcwuEamPHr5dGbm62PeXggk9d0v01ncnlMqndsmwqh5o33dpaNdSs
	OEZB9Yj6fQwCWAsJ9L+QTAW1Mn4hP8YhII0A5+ivsSJbd6A6rKaAv7KNFLpdor0nkytenTDdVUeiV
	nGtG8ab3bzc+PITnD0Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bSX-00000001jHk-2bH7;
	Mon, 21 Sep 2026 10:41:17 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bSV-00000001jGz-2WaM
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 10:41:16 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so14493125e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 21 Sep 2026 03:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789987274; x=1790592074; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wASVZEAHXQVuqSirWWZ9H5tns/M0AboKjXEiHFDzbAo=;
        b=Gzl9Yiv9+YGr1Qxdz7jrd0bNOV+NgC/VRVDOQNOrV4l7lc5TdZTDE2xcMYE8iP0kAx
         Pnby9Lidt+kA4SdIa8D3bNQiTlV2YxgjSrKkuDu6iRE8VeMia8VCK1cQxH/ivz2uX33B
         5/L08SG0jdemsUNJlbtLmn25ASz3XZ7N7mgRLZeILH7Wy9Xdg2lzbX8zt9dGJaFEmqwv
         hZ/79vlQPKT99fT35cftKrC9yeFH+rirGH2MSlH0BidJX6AUx9MOY6fkFi5ZeLNdjpbt
         BPadGdFqPuEQd5poLoa4VTDiBQ5/UzqVQZgRgewpfa1rasy7Cgf0ROgKxaXX9+dm9TUz
         IESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789987274; x=1790592074;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wASVZEAHXQVuqSirWWZ9H5tns/M0AboKjXEiHFDzbAo=;
        b=vdz75eQmc9/RDzFmuk4/1zGy8gepEp97RLYHZEVDKmV2tQVR7o6TM0V3/fvlWvzZaw
         vmFJeDJKMFHGkL2L9j0sBzwqYzuydpJVQXbJXfzDkTZapH0r9LfNaUE6H6W7e6dLF7b5
         MepXzrtKx8Dn/B9vz6mJtsecoJ2fouTv1/TSTFgO4JilR9HzAGD6erzyAMZen6s6z67R
         FM9xtmraJwCui84T1Lh1A+lkE/4tmb886sYvl+xjXhYL95jtcRTLzfIRBz0WvMUZTpqM
         SNhu13FNv8+GA9mg7MCRJxLeBpg78ryoZ+r7qp+rRdFlyczA5Yrh5trYImCY8qs+94pN
         U5Dg==
X-Forwarded-Encrypted: i=1; AKwUvBzHZ57Kyp8ZbgRSLX19w0zbQLQ5c6aoY2iyM+KaMI/FqXKJdeAI7lN6Fy6aVMIGYS+eJKGB59pQ73c=@lists.infradead.org
X-Gm-Message-State: AFuF++mc1WDyjqAm0gVYX2jusg0LmuTcGv1+8ms3up/r2U2OHC30tV1c
	st+fLnksHk7iTNMfFdtl1TlsRpyUfEoC9FWwlVEEs1RECJVKXrZXrlXT
X-Gm-Gg: AYBFou19T4pRcrS37JPTdZeJACTySLU/Jbcd4sWMyCC0S0va1ShQQnBwltfliJjXrvE
	M13tDTbbcrmdRJzKm8ERdFwC0YZ75fMLVbwMgHykQaRAKcE+LDjGiDJ7IwOp/fJvEygcOCwlShm
	XVoP7Yn7BoT+3nkU3IK4vfPbH4Gza/zGdXXAzib67uyrvPQBUd9RIY3akrmROI0yqcYJCa3irb2
	9N1KETRU/ecuk+acubZd4M7IsP3UWSnYPPcXj1GmoCHWpzR1zKN/wN29SlANzT8LcLavjkBC0by
	6coyM18an6Eo67nQGcgw8aIlSQ+7INgxOZZ9YSLJsyrmwrjjT21lbH6/L5J8c6YVfK8d6DAiEFm
	4fidWceSIAfqd12iQbr4VQ5zhirm0K/aAgegtTN+JUQBaL5B1/nXi7JanxZlwWkXqj0RNlHFCHy
	YrO2IGWNYkr3G3P6HyCSwts03fP4VxNsG/qD/ztZMlFAt7vMl7KuKtXNQu5XT3tFRYMeyRFXfG9
	0Z0DeJ5fRlmgNIfCf+rp9+YOOEdtQJSpjc=
X-Received: by 2002:a05:600d:486:10b0:49c:fc6e:a3e1 with SMTP id 5b1f17b1804b1-49fc58682a5mr100899815e9.32.1789987273176;
        Mon, 21 Sep 2026 03:41:13 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0874c3sm300694495e9.14.2026.09.21.03.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:41:12 -0700 (PDT)
Date: Mon, 21 Sep 2026 11:41:11 +0100
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
Message-ID: <20260921114111.525a2257@pumpkin>
In-Reply-To: <20260921095924.2f845215@pumpkin>
References: <20260915194203.3511147-1-arnd@kernel.org>
	<DLKU0CTP0OES.30VZXJXDXRLNW@kernel.org>
	<20260921095924.2f845215@pumpkin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_034115_672295_1F7978E8 
X-CRM114-Status: GOOD (  27.70  )
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

On Mon, 21 Sep 2026 09:59:24 +0100
David Laight <david.laight.linux@gmail.com> wrote:

> On Mon, 21 Sep 2026 09:55:37 +0200
> "Michael Walle" <mwalle@kernel.org> wrote:
> 
> > Hi Arnd,
> > 
> > On Tue Sep 15, 2026 at 9:40 PM CEST, Arnd Bergmann wrote:  
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > Two large spi_nor_flash_parameter structures on a function stack
> > > is really too much, and this can exceed an otherwise reasonable
> > > frame limit:
> > >
> > > drivers/mtd/spi-nor/sfdp.c: In function 'spi_nor_parse_sfdp':
> > > drivers/mtd/spi-nor/sfdp.c:1717:1: error: the frame size of 1600 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
> > >
> > > Change one of them to a dynamic allocation to make this more reasonable.    
> > 
> > Thanks for taking care of that. Will you respin the patch with what
> > David suggested?  
> 
> This compiles...

It didn't - I thought I had compiled it :-(
Try:

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 641f17ad51a0..cec699b52f27 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1519,9 +1519,9 @@ int spi_nor_check_sfdp_signature(struct spi_nor *nor)
  */
 int spi_nor_parse_sfdp(struct spi_nor *nor)
 {
+       struct spi_nor_flash_parameter *save_params __free(kfree) = kmalloc_objs(*save_params, 2);
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
+       if (!save_params)
+               return -ENOMEM;
+       save_params[0] = *nor->params;

        /* Get the SFDP header. */
        err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(header), &header);
@@ -1653,7 +1655,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)

        /* Parse optional parameter tables. */
        for (i = 0; i < header.nph; i++) {
-               memcpy(&params2, nor->params, sizeof(params2));
+               save_params[1] = *nor->params;
                param_header = &param_headers[i];

                switch (SFDP_PARAM_HEADER_ID(param_header)) {
@@ -1691,7 +1693,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
                         * spi_nor_flash_parameter data.
                         */
                        err = 0;
-                       memcpy(nor->params, &params2, sizeof(*nor->params));
+                       *nor->params = save_params[1];
                }
        }

@@ -1712,7 +1714,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 free_param_headers:
        kfree(param_headers);
        if (err)
-               memcpy(nor->params, &params, sizeof(*nor->params));
+               *nor->params = save_params[0];

        return err;
 }
--

David

...
> > 
> > -michael
> >   
> > > Fixes: d20029474a76 ("mtd: spi-nor: push the rollback mechanism into the sfdp module")
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > ---
> > >  drivers/mtd/spi-nor/sfdp.c | 10 +++++++---
> > >  1 file changed, 7 insertions(+), 3 deletions(-)    
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
