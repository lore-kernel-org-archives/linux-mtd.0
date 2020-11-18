Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFE9C5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 07:20:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 093AB2223D
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 07:20:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F8fY2+pP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U1GoIM1A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 093AB2223D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jPQRGla5vMMGmH/JczIqhtfvsA3V8wKxzHwY6o7yI8o=; b=F8fY2+pPWkRZ3V90AbbCcEg2K
	1CAEk4eQvFWup7BF1VG84h9qLPnCHDvUD+Slo3/8uzZp1kOG04KAdWiDzRnzXTCr42YpO2d4pJoie
	f9rWF/K4DbUMusxMXonrNEWDhYQuahGRzdfUaKXwo+BII6Nuk1NL/Ad5xj2Wx2fwDBb8KujfeXGqX
	tx/viwHcgseZTtLlxojvWTCGzquYbzPvGE+4kwJ+w9faViMnvO3gbH8vjSWWbI1v0jOpDRDHQkiVs
	RY8MnSqwrPM/2TxZHqtVLAxFeA3sW0Guwnfsmj8kvxT6TzX6FhBKvPPywKCc2IpZyyYVDNuMirkHh
	SG/fFZkDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfHl1-0006QL-RW; Wed, 18 Nov 2020 07:19:59 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfHky-0006OY-Kz
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 07:19:58 +0000
Received: by mail-pg1-x543.google.com with SMTP id 81so594240pgf.0
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2020 23:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ogAqzoWb6CN+6DA0U4kbAuwXiWSIUBjOQhukqqaTMWo=;
 b=U1GoIM1AdmuL58NN4XCeb2w7fxo0jF8vBuA/6z7kciUFM/PGFVLarqF/CD/rUGIBec
 zCSqu8XcBIH4CRT4geHYFcs41uy7Bgjl8lZAURJb12FYD1rOAZWfJxBd7tLOaMZSqWPb
 dw2Jxyk1mCon9uig7mYnxDhHOuLrjj+xNZXSYRLwO2ZIwGpBK0fExFQJ+eFhnRWmzbXl
 rmlplR88Zi8UDPDZ1E61nCx3kjmec1UWS+rzNYI41VEigLg2LAxg3LnqKn9VKhQBUMRC
 OYFMYYKm7LV71qkUKTr7vaxPjlEEeHrrpgQRK5KiDRdM6IFnwhQ5gg4VlyWGc9pCgW6Y
 RUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ogAqzoWb6CN+6DA0U4kbAuwXiWSIUBjOQhukqqaTMWo=;
 b=ndDM4zRZRV+lUHxXyMBk/8ooozZ6Guz8MMn2BKDiZvVYRQEzlxywqQ70Y9K7c1J/vn
 bXZKw2d2a2gpMr2+3qpX6uXUf3UvjEpnHYf/g6NgLWODv9MDqfnuSLaiBMdqlbferPQW
 B+nXdP1fyKXJ+tu4tvq1kD+gG+M/xq8h3yeJBL07p3d7p75ncehSOu15SaED5RDbKSOk
 +PfTvfSA+oq8F0pru5RkNavDkyYRNcp1SDeTk6+qjjyI6c9OJhDl/eoeNrAm0RwaLR6s
 ktYl7akDsO5Q9NequzkmsbxKqOrirgC7cqel131OqBCaR2T7pqp3UfI0XfEutLiGuaUB
 IVKQ==
X-Gm-Message-State: AOAM532+VhcKelr6RLNXOi/72V64pzi2vikp4FQAzFCYJypIsJUmzAsK
 N4YSqp3HtNShAX+xbfgGP56F
X-Google-Smtp-Source: ABdhPJzKPAtFVRCbCKxNDq+2mj9Roy24FWwpRwKrKmMA9dbc3IHJxH1l9zjkYhMbcHX0Q0fTfEv3mA==
X-Received: by 2002:a62:7e14:0:b029:18a:d515:dc47 with SMTP id
 z20-20020a627e140000b029018ad515dc47mr3552810pfc.78.1605683994282; 
 Tue, 17 Nov 2020 23:19:54 -0800 (PST)
Received: from work ([103.59.133.81])
 by smtp.gmail.com with ESMTPSA id q23sm23942973pfg.192.2020.11.17.23.19.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 17 Nov 2020 23:19:53 -0800 (PST)
Date: Wed, 18 Nov 2020 12:49:47 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 2/4] mtd: parsers: Add Qcom SMEM parser
Message-ID: <20201118071947.GB3286@work>
References: <20201117174845.28684-1-manivannan.sadhasivam@linaro.org>
 <20201117174845.28684-3-manivannan.sadhasivam@linaro.org>
 <20201118042033.GH8532@builder.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118042033.GH8532@builder.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_021957_040743_71F3027B 
X-CRM114-Status: GOOD (  27.77  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 17, 2020 at 10:20:33PM -0600, Bjorn Andersson wrote:
> On Tue 17 Nov 11:48 CST 2020, Manivannan Sadhasivam wrote:
> 
> > NAND based Qualcomm platforms have the partition table populated in the
> > Shared Memory (SMEM). Hence, add a parser for parsing the partitions
> > from it.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/mtd/parsers/Kconfig        |   8 ++
> >  drivers/mtd/parsers/Makefile       |   1 +
> >  drivers/mtd/parsers/qcomsmempart.c | 169 +++++++++++++++++++++++++++++
> >  3 files changed, 178 insertions(+)
> >  create mode 100644 drivers/mtd/parsers/qcomsmempart.c
> > 
> > diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
> > index e72354322f62..d90c30229052 100644
> > --- a/drivers/mtd/parsers/Kconfig
> > +++ b/drivers/mtd/parsers/Kconfig
> > @@ -160,3 +160,11 @@ config MTD_REDBOOT_PARTS_READONLY
> >  	  'FIS directory' images, enable this option.
> >  
> >  endif # MTD_REDBOOT_PARTS
> > +
> > +config MTD_QCOMSMEM_PARTS
> > +	tristate "Qualcomm SMEM NAND flash partition parser"
> > +	depends on MTD_NAND_QCOM || COMPILE_TEST
> > +	depends on QCOM_SMEM
> > +	help
> > +	  This provides support for parsing partitions from Shared Memory (SMEM)
> > +	  for NAND flash on Qualcomm platforms.
> > diff --git a/drivers/mtd/parsers/Makefile b/drivers/mtd/parsers/Makefile
> > index b0c5f62f9e85..50eb0b0a2210 100644
> > --- a/drivers/mtd/parsers/Makefile
> > +++ b/drivers/mtd/parsers/Makefile
> > @@ -9,3 +9,4 @@ obj-$(CONFIG_MTD_AFS_PARTS)		+= afs.o
> >  obj-$(CONFIG_MTD_PARSER_TRX)		+= parser_trx.o
> >  obj-$(CONFIG_MTD_SHARPSL_PARTS)		+= sharpslpart.o
> >  obj-$(CONFIG_MTD_REDBOOT_PARTS)		+= redboot.o
> > +obj-$(CONFIG_MTD_QCOMSMEM_PARTS)	+= qcomsmempart.o
> > diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
> > new file mode 100644
> > index 000000000000..d8c2a3fa4dfe
> > --- /dev/null
> > +++ b/drivers/mtd/parsers/qcomsmempart.c
> > @@ -0,0 +1,169 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Qualcomm SMEM NAND flash partition parser
> > + *
> > + * Copyright (C) 2020, Linaro Ltd.
> > + */
> > +
> > +#include <linux/ctype.h>
> > +#include <linux/module.h>
> > +#include <linux/mtd/mtd.h>
> > +#include <linux/mtd/partitions.h>
> > +#include <linux/slab.h>
> > +#include <linux/soc/qcom/smem.h>
> > +
> > +#define SMEM_AARM_PARTITION_TABLE	9
> > +#define SMEM_APPS			0
> > +
> > +#define SMEM_FLASH_PART_MAGIC1		0x55ee73aa
> > +#define SMEM_FLASH_PART_MAGIC2		0xe35ebddb
> > +#define SMEM_FLASH_PTABLE_V3		3
> > +#define SMEM_FLASH_PTABLE_V4		4
> > +#define SMEM_FLASH_PTABLE_MAX_PARTS_V3	16
> > +#define SMEM_FLASH_PTABLE_MAX_PARTS_V4	48
> > +#define SMEM_FLASH_PTABLE_HDR_LEN	(4 * sizeof(u32))
> > +#define SMEM_FLASH_PTABLE_NAME_SIZE	16
> > +
> > +/**
> > + * struct smem_flash_pentry - SMEM Flash partition entry
> > + * @name: Name of the partition
> > + * @offset: Offset in blocks
> > + * @length: Length of the partition in blocks
> > + * @attr: Flags for this partition
> > + */
> > +struct smem_flash_pentry {
> > +	char name[SMEM_FLASH_PTABLE_NAME_SIZE];
> > +	u32 offset;
> 
> It would be nice if you noted that these are little endian (using
> __le32) and used le32_to_cpu() below.
> 
> 

Good catch! Will do.

> Apart from that I think this looks really good.
> 

[...]

> > +	}
> > +
> > +	pr_debug("SMEM partition table found: ver: %d len: %d\n",
> > +		 ptable->version, ptable->numparts);
> > +	*pparts = parts;
> > +
> > +	return i;
> 
> Had to check a few times, but afaict this is just ptable->numparts in
> disguise... So how about just writing that instead?
> 

Sure, will do.

Thanks,
Mani

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
