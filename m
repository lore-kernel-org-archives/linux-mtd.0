Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B51CC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Jul 2022 14:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFQu72B9AzJqrJjNDZ80neFmMxd/6goY2GtB/ZC356M=; b=Q+T2HLsLHwLZr9
	yYm02t9AnuRpRgkhCsFIheJettI7OjA88w5pNlGCoDiUJdaoU/VJninCJT9GIjoCJJajFzdQgKOpd
	Ljx66/y1FT4xfgVc8osmYZv+lpj1dqEsqYvMySOYUH+cgVb2EtZ1pjenAJjbJET0qY5VDvsv0kPnX
	YnXsv3UKG0ZB298zCiZI5+EYEkSy9OL6GwiEEFRsyKBMG+t7yYkZqIVQEzAL5Ru35BCYSgunsSA+I
	H519wqqq6B5/nSnMs8y2G53yEWCj9FhZaTWCuV9ZBDBbaQrU1v2oGZsHpOPfW+8rbruD+9UbqYzSq
	9fsSrX7zVUAtSMhvy4OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDSBQ-00Fy5X-2D; Mon, 18 Jul 2022 14:57:16 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDSBL-00Fy10-T7
	for linux-mtd@lists.infradead.org; Mon, 18 Jul 2022 14:57:13 +0000
Received: by mail-ed1-x52d.google.com with SMTP id e15so15681043edj.2
        for <linux-mtd@lists.infradead.org>; Mon, 18 Jul 2022 07:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GLp8K++n9KMgI9eZk9401SwTQ2J7JPpZzm1JjFRZrUQ=;
        b=BGJvgeBAvkSdbeQGW/dHUHI0Y88d1+TbTCt+BW1YVWT2SBD5nDHWgK/ab6P0qWFGDL
         7I3zL/jX7wt5o+UtASkPTwY0XxD7p0aK/BeiZFNzxWEjX0xw/sGBqR1KvxFGooNGyS04
         V4y8FN0I9rqIVw2ic7edFAbFgJ5xpw1j/LJGxwQG8pQE9xL0fLUepfRRzHupDW0ZxHh8
         rwa03d7VKVaQhngb7IaaSLG67qruEXWzPxEurtQshqOK8hmJ2SCANrng5EBfjYgZDYPE
         tLtHPf6K5lA9e8ZPSJG5kbl1VjOfStYp8q4WB+pbiXD3S+3Anx46fV6BCq9xTc2kEWx7
         9Y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GLp8K++n9KMgI9eZk9401SwTQ2J7JPpZzm1JjFRZrUQ=;
        b=jeockJCnmY0gOl0sV9bDNRMBbjh0nL5Eta2e/UH4FdmeFXxUPUtbbio5FoippmTsKW
         yfGPLT1Ugcc07WwWU19ngxocSCkpYP838s8KfswEdYcR21xnbvHnXqfRkQdgeHhAm84n
         YbBXsvUL0zHulmSLHisIxHcHNTC1AV+wnpyX9KczavXDrBfqm69Pg76IYpn5U8yNxQ+S
         vaQO8B8uy9ZK3GJ7/1Zf9f7ZurdTQZT384/kz2rwrtQjXONyCmfKGgIlFYl7nzTOMxDc
         RdXjwPCbk6GugzczSefLeO+j0gU1OVJ7fAJM9ie8ktSpA/juVY4jqAGqHAdPTCPLJANY
         F9Pw==
X-Gm-Message-State: AJIora/B9Xgw17LYQIqVCF+G26cThMMzAY4Uian3vIijdyxsOzsGl0eH
	FFB/GxaLgnIDFTYQAUmykpPF/u4O9xrwE9CccYrTlg==
X-Google-Smtp-Source: AGRyM1tF7nG5nEk3jJFLsgDlXZSXZg9czq75bC/OsMF5KBmxQUk03bCv3Q8Lgaf/trizJ44Uc6xGhmgpUIob3G+0U7I=
X-Received: by 2002:a05:6402:42c8:b0:43a:a1ee:a097 with SMTP id
 i8-20020a05640242c800b0043aa1eea097mr37145301edc.150.1658156227476; Mon, 18
 Jul 2022 07:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220712163823.428126-1-sudip.mukherjee@sifive.com>
 <20220712163823.428126-4-sudip.mukherjee@sifive.com> <d918c4d3d91adac247ebae6418b409b7@walle.cc>
In-Reply-To: <d918c4d3d91adac247ebae6418b409b7@walle.cc>
From: Sudip Mukherjee <sudip.mukherjee@sifive.com>
Date: Mon, 18 Jul 2022 15:56:56 +0100
Message-ID: <CAHyZL-cUJ7Zu=r5ZGD3p4XY9Ypdc-YuaqbKmdHjYQfAT6Fu_fA@mail.gmail.com>
Subject: Re: [PATCH 3/3] mtd: spi-nor: issi: is25wp256: Enable Quad Input Page Program
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Jude Onyenegecha <jude.onyenegecha@sifive.com>, William Salmon <william.salmon@sifive.com>, 
	Adnan Chowdhury <adnan.chowdhury@sifive.com>, Ben Dooks <ben.dooks@sifive.com>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_075712_007832_4BB8D21F 
X-CRM114-Status: GOOD (  12.35  )
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

Hi Michael,

On Mon, Jul 18, 2022 at 8:39 AM Michael Walle <michael@walle.cc> wrote:
>
> Am 2022-07-12 18:38, schrieb Sudip Mukherjee:
> > The flash chip is25wp256 supports Quad Input Page Program. Enable it
> > in its no_sfdp_flags flags.
>
> Are you sure, that chip doesn't have SFDP? Even the oldest datasheet
> I've found [1] mention SFDP.

Yes, that is what I expected from the datasheet. But from the driver code,
spi_nor_init_params() is calling spi_nor_init_params_deprecated() as
'parse_sfdp' is not true.
and looking at issi_nor_parts[], I can see is25wp256 is not marked
with 'PARSE_SFDP' so it
will skip parsing SFDP. The same datasheet also has is25lp256 which is
marked with 'PARSE_SFDP'
in the driver.
I tried to add 'PARSE_SFDP' to is25wp256, and I can see its mostly
working but its not using
Quad Input Page Program. I guess this support was not discovered from SFDP.


--
Regards
Sudip

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
