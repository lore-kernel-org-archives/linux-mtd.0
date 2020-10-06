Return-Path: <SRS0=jvb0=DN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBCDC4363D
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 23:20:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5866208C7
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 23:20:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OgrogE2u";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="RhcyxEe1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5866208C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v+cfEdPdUTZ7I2y52l9RYEW8EJzMdaA/9eGpl8MBoJc=; b=OgrogE2u5F7d5b962A9nymHWA
	gqLSyVK2mIIEeV0cdq+nHPxrSOVM2n+6cpqZ7e6DeTqfQumEFRpgXWj1AcU5FR6K5TqiveTlhqZla
	DP+exVv//Gdeynl0HPSxBjPgzb4cK3qhjjs02o+C6fuQEAW3UD3fEh5wqY5qwz6A0GBw51RbBnQY5
	oqiU+P6ZGNo3TjuMCbH7JW+eRASg8F/FcnfhywmemNYBX7HrfdHyKrzgLNfL44u4g8C8mfB1flY1/
	BSns2ggap0YcMj5C8BNy1/KUil57PRNuXsCD36N6hQMv7DPJFpNjrZ9kqwMCTahnI4ePsETNUNG+Y
	2tI3j/9JQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPwFc-0004xJ-Bb; Tue, 06 Oct 2020 23:20:08 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPwFZ-0004wJ-Dm
 for linux-mtd@lists.infradead.org; Tue, 06 Oct 2020 23:20:06 +0000
Received: by mail-qk1-x743.google.com with SMTP id q5so577030qkc.2
 for <linux-mtd@lists.infradead.org>; Tue, 06 Oct 2020 16:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IWB1ebee9pteOb/1MXVwCCrbMEWDB3ppGDM3SA6pBOI=;
 b=RhcyxEe1FSxdVyWWjik5L8oP0dlBRmNhl8eHTKZPcwOmfonQ13IokUdXJRuKCJ6SPh
 dHxp7bXBRxe79JznPcgush7ktPkgNsiGgO2fACJlaqwsTwroLQAgYh28Qv7Xk9Iqr4NM
 y4NzZw/l+Zf7ndDdCnCkPHptsNmLIhBOzvef0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IWB1ebee9pteOb/1MXVwCCrbMEWDB3ppGDM3SA6pBOI=;
 b=s7RsAWb+ssvdLR0AmHviiuuN0jJldWO11DwymFQKpZb6EKzBYrjE1whLi+tSIPyyKg
 bUcEcIfi7PunWlMQWYZ8XUkAvrTP53XbKREJscyKx0UzgTPCX5u5tBp98yjEgygP99JZ
 mRz1Vyqtb1af1X0Y4XouYVoE5gAcxGkY9xNIbaLiik/ZZmkCUXMb93uwLtwd4EK8djx1
 4x4XMoT62diS4E/DC80Sp2Y0qGGjFG84jVklBxqTY8Jf8t3S+RG+SgRdQUOqEaRHSx7h
 gL2KvVOZOsuAY/F0CPaBtF+pjZ5xWyIb2bomjv05LOvFJBHXrqja/G8pXtJAcRyFP0Cb
 +Jug==
X-Gm-Message-State: AOAM533G4Rf2eLoVDXWqDT/Zvnkro2W4aj2kVLNKOVkq5+eUHk4gs+CW
 y8yNq5dGd14DbFmn4P/0WPCL+gkNXjFLtpaB+Wo=
X-Google-Smtp-Source: ABdhPJwr2Fnlr684SJmgZQPRnrOuC932FRlVujDc1a96wpgQ80hGE45C/QVYuxFsMyeJJ11qvjuGrYXtSqY1Td3/YtE=
X-Received: by 2002:a37:48cc:: with SMTP id v195mr242091qka.66.1602026401689; 
 Tue, 06 Oct 2020 16:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200930235611.6355-1-bert@biot.com>
 <20201001063421.qcjdikj2tje3jn6k@ti.com>
 <801445c9-4f59-5300-3a03-b48a3d631efe@biot.com>
In-Reply-To: <801445c9-4f59-5300-3a03-b48a3d631efe@biot.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 6 Oct 2020 23:19:49 +0000
Message-ID: <CACPK8XfBqLA0e+tx6WN16G-v8+PY6UFH4jvP_YmOjiK8EhZ8Cg@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Fix 3-or-4 address byte mode logic
To: Bert Vermeulen <bert@biot.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_192005_941363_B5BE3759 
X-CRM114-Status: GOOD (  34.68  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 1 Oct 2020 at 22:23, Bert Vermeulen <bert@biot.com> wrote:
>
> On 10/1/20 8:34 AM, Pratyush Yadav wrote:
> > So using an address width of 4 here is not necessarily the right thing
> > to do. This change would break SMPT parsing for all flashes that use
> > 3-byte addressing by default because SMPT parsing can involve register
> > reads/writes. One such device is the Cypress S28HS flash. In fact, this
> > was what prompted me to write the patch [0].
> >
> > Before that patch, how did MX25L25635F decide to use 4-byte addressing?
>
> The SoCs I'm dealing with have an SPI_ADDR_SEL pin, indicating whether it
> should be in 3 or 4-byte mode. The vendor's hacked-up U-Boot sets the mode
> accordingly, as does their BSP. It seems to me like a misfeature, and I want
> to just ignore it and do reasonable JEDEC things, but I have the problem
> that the flash chip can be in 4-byte mode by the time it gets to my spi-nor
> driver.
>
> > Coming out of BFPT parsing addr_width would still be 0. My guess is that
> > it would go into spi_nor_set_addr_width() with addr_width still 0 and
> > then the check for (nor->mtd.size > 0x1000000) would set it to 4. Do I
> > guess correctly?
>
> No, it comes out of that with addr_width=3 because the chip publishes 3_OR_4
> and hence gets 3, even if that's nonsensical for a 32MB chip to publish.
>
> Certainly that's the problem, I just want to solve it in a more general case
> than just a fixup for this chip.
>
> > In that case maybe we can do a better job of deciding what gets priority
> > in the if-else chain. For example, giving addr_width from nor->info
> > precedence over the one configured by SFDP can solve this problem. Then
> > all you have to do is set the addr_width in the info struct, which is
> > certainly easier than adding a fixup hook. There may be a more elegant
> > solution to this but I haven't given it much thought.

Thanks for starting this conversation Bert. I had intended on
mentioning this broke our systems but didn't get to it. It broke a few
different Aspeed platforms where the flashes are >= 32MB.

We are running with a revert of the 3_OR_4 patch in OpenBMC kernels:

 https://github.com/openbmc/linux/commit/ee41b2b489259f01585e49327377f62b76a24748

>
> Since Tudor doesn't want the order of sfdp->info changed, how about
> something like this instead?
>
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3028,13 +3028,15 @@ static int spi_nor_set_addr_width(struct spi_nor *nor)
>          /* already configured from SFDP */
>      } else if (nor->info->addr_width) {
>          nor->addr_width = nor->info->addr_width;
> -   } else if (nor->mtd.size > 0x1000000) {
> -       /* enable 4-byte addressing if the device exceeds 16MiB */
> -       nor->addr_width = 4;
>      } else {
>          nor->addr_width = 3;
>      }
>
> +   if (nor->addr_width == 3 && nor->mtd.size > 0x1000000) {
> +       /* enable 4-byte addressing if the device exceeds 16MiB */
> +       nor->addr_width = 4;
> +   }
> +
>
> Still fixes the general case, but I'm not sure what the SMPT parsing problem
> is -- would this still trigger it?

I tested this change you proposed and it fixed the issue for me.

Cheers,

Joel

>
>
> --
> Bert Vermeulen
> bert@biot.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
