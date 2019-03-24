Return-Path: <SRS0=La3s=R3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B4BC43381
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Mar 2019 16:48:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B86592087F
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Mar 2019 16:48:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="conUhnuP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWNlsDmZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B86592087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=styeNuO3mL4lc5M91GwqNUqOTmm4iy3hCjNjP8L1K68=; b=conUhnuP9Kqf4k
	z/3HVJSP+b3a1/l0jCWgeQWw6uJkCVeyvzfssa/xt82TGcXuTLlXaW6udT1WUw2ljjjX+Mvy3Le6z
	cYMT9LiJHaAFNh1pKyCZDENgsb8os+qWfo9MFefza1fqXwmFx22YDiKPEw11pMhzlI6NUVaX0sFb3
	V26Fo2sEbXDeC/X1erXlfOkTmXF6TfBiBRXvIPz/wck9e94oe7dRsXu7VC1tFACh61vxO1VNR+Pnb
	TCPFJL2EKPGellqgGhcV6Rcj03t45tOy9kp/sOe7477d05e0QcbtIorsJk8VlK/fKv0FilIqmuMsl
	ShcRPN7xDYoQgnlTpDhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h86IU-0002Hg-DW; Sun, 24 Mar 2019 16:48:34 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h86IR-0002Gu-Q5; Sun, 24 Mar 2019 16:48:33 +0000
Received: by mail-lj1-x241.google.com with SMTP id l7so5760283ljg.6;
 Sun, 24 Mar 2019 09:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b1U9n/t18wnXKhRjLFYD2gjH0o+xCH9hI2JLlh3jrEQ=;
 b=jWNlsDmZfw1BhmENeKMJNFMpaoNMtEohfdG1sudB7Tdo64fVoty7f328ILDHh9ICb1
 Ux+U58FUO7yQx6lmVeKrebPKHqDKvX8uZnUxNZqsYTHGodj8yDAtNqVNEun4YJg9ZE3I
 0CjWQ6iCdVxxIRPL8MSCilpybL5PT59OZa1J11uabZqsSiiz5erKO/y9yoJHvgttJrlD
 ZpEX3VcOclRn1mLZ/iRF43y5ntEUFhnW07+ek6h0136axxQK568bNmsYgSQQeldDPTYj
 /Jf2Qs9mqVs/v8RY9Opzj4ucJuqgZopK8UQrZBZ3VCDUJlNgyhkzy3bYMRUupsz9Cc1q
 JvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b1U9n/t18wnXKhRjLFYD2gjH0o+xCH9hI2JLlh3jrEQ=;
 b=WhH0LeSw98jDAaELxTQoavmYk1A0KsTLp8lWBEVOGKuuhlaMQTi5QwkLjJlXpkk8VG
 qJ149p+kxpU+jslmYbfuVtZd4EkDmMGxYBnUhrGVjS+B4i6sdD0Lypo+mqsHtc6wgWFu
 dcO7LHDrzWZUPOGd5eDSs1PVHBEKzJGq/ErcQePTykXnBJWSWk3u+crPEiYbym5q3Z0k
 fvHCeU3Qvbulz7IqwyEWNVfDqS51mgV2WsjSy9FnlHvrBWGxbFR6SZrxdh9Bo4gEOVnl
 /+jLw93ha1D2V7aLoext8uVvBX1w4Pi3uTTc+TcCyt2I2cULueC8Q7DKjK8MnJ+BzTEH
 3cjg==
X-Gm-Message-State: APjAAAU1pfkgfdE94FrzROSrx47HujU7nkRrUxsHEiYstct2KSEFZ5cR
 kRbDmfDiISg4Ti/Y0qZSyGs=
X-Google-Smtp-Source: APXvYqyRT39fP1KHInPKbhDDKFdmjTM2OITzznmI5qvR/PHnqi5ZpwANDdHcX1mmV0TJkTvbc0GNyQ==
X-Received: by 2002:a2e:4715:: with SMTP id u21mr10582949lja.156.1553446106051; 
 Sun, 24 Mar 2019 09:48:26 -0700 (PDT)
Received: from z50.localnet (109241207190.gdansk.vectranet.pl.
 [109.241.207.190])
 by smtp.gmail.com with ESMTPSA id b15sm3007352ljj.70.2019.03.24.09.48.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 Mar 2019 09:48:24 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH] mtd: rawnand: ams-delta: Drop board specific partition
 info
Date: Sun, 24 Mar 2019 17:48:22 +0100
Message-ID: <2631901.52Nzq63B5o@z50>
In-Reply-To: <20190320011630.GB7872@darkstar.musicnaut.iki.fi>
References: <20190319223718.26131-1-jmkrzyszt@gmail.com>
 <20190320011630.GB7872@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_094831_892840_750FD19B 
X-CRM114-Status: GOOD (  21.82  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-omap@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Richard Weinberger <richard@nod.at>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Aaro,

Thanks for your review.

On Wednesday, March 20, 2019 2:16:30 AM CET Aaro Koskinen wrote:
> On Tue, Mar 19, 2019 at 11:37:18PM +0100, Janusz Krzysztofik wrote:
> > After recent modifications, only a hardcoded partition info makes
> > the driver device specific.  Other than that, the driver uses GPIO
> > exclusively and can be used on any hardware.
> > 
> > Drop the partition info and use MTD partition parser with default
> > list of partition types instead.
> > 
> > Amstrad Delta users should append the followig partition info to their
>                                         ^^^^^^^^
> Should be "following".
> 
> > kernel command line, possibly by embedding it in CONFIG_CMDLINE:
> > mtdparts=ams-delta-nand:3584k(Kernel),256k(u-boot),256k(u-boot_params),\
> > 256k(Amstrad_LDR),27m(File_system),768k(PBL_reserved).  For their
> > convenience, select CONFIG_MTD_CMDLINE_PARTS  symbol from that board
> > Kconfig automatically if this NAND driver is also selected.
> > 
> > Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> > Cc: Tony Lindgren <tony@atomide.com>
> 
> Could we move the fixed partition setup to the board file
> instead? Otherwise this kind of change is not really nice for the users,
> as it will likely break existing setups. The default partition layout
> should remain the same.

I'm wondering if it would be acceptable to pass partition info from a .dts 
file.  I think that would be a better, more modern approach than adding a new 
header under include/linux/platform_data.

The problem with a device tree based implementation is, I know of no u-boot 
version supporting both Amstrad Delta and FDT.  However, I've already tested 
two solutions that work for me.

One uses CONFIG_ARM_APPENDED_DTB and requires a user to manually append the 
blob to zImage and (re)generate uImage.  I'm not sure how much more user-
friendly it looks for you, compared to the command line version I proposed 
initially.

If the above is not acceptable. I can propose still another approach. The blob 
is automagically built and embedded into the kernel with some assembler glue, 
then unflattened from the board init_machine(), somehow similar to the way 
drivers/of/unittest.c does it.

Please advise which approach sounds best to you (platform_data, 
CONFIG_ARM_APPENDED_DTB or unittest like).

Thanks,
Janusz


> 
> A.
> 





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
