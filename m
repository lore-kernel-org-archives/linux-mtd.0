Return-Path: <SRS0=Hh3Q=UD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D989CC282CE
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2019 08:01:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAEFA24D45
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2019 08:01:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B3PBh4kG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOyG1y+6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAEFA24D45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n8fdUq2g6bqWIDRivFrfthPf+2omxeWCeO/MygRCcTI=; b=B3PBh4kGS2UuxN
	5lVtaw3DeRmD2DNzKLTyD7AWdwpyAqeagT7ilO3tlFPtQIaQ52XAME+zppq4b/Dq3kYTTiVzQE+6w
	OEW9b2sanS72qbKWbEyzBSd9JIrcxyuipAunTbenVUU9EM4DKdjYytGEgQNk4WQnVAtPJ4FinceC7
	iLz21APLpLQ81+DcoNYGWVaMkeyYX/y0eG09Qn8REdPbBf4ErUzzcsjigno1UQYHf859nHC+HjEbu
	KDv4M8cY2qHo9Sih6C3L79tXD5S4VxGmyRoGabsTHvpYX99z8auRfdynYkd57fKdaJfLvYRqvwzp/
	75qi++pAhqwTnErCzfYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hY4O7-0003GD-D8; Tue, 04 Jun 2019 08:01:43 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hY4O5-0003FZ-2o; Tue, 04 Jun 2019 08:01:42 +0000
Received: by mail-pf1-x442.google.com with SMTP id y11so12168745pfm.13;
 Tue, 04 Jun 2019 01:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BflzF/9Mq7TxpywjPmEVZJWnPb0ih69tG/7eIZyGT6M=;
 b=QOyG1y+6Z69FqYlxpBzkXexBnATJO3+SIt01a4+TzjEuqAsHve0P8vQMFZ46mnqc9S
 uYpqAEcZW8MT9sSSSoOO86+CSKhi6R9I0GEDuARyMUJHbsT5IuOU37iqa1/SP3DPpHXD
 r3iJpB8bvGGZ/X1ECgsWYo90sQR6NgU7rC++oE2E+zQRoRpdDMiFTvqwWI5ld5zC53Qq
 Esc/yfL47SksRb5cinXh0EjRSHIDSsROKUX5HN+DNvs3H9Td4WmpY1DBtZu9LB8NhvXw
 8i2yI6vIa+RB8NQaeTHkt0qrvW1TnSsswyCZuT/alFNoKJVsLkcTFprvL7gaeHIk4i7u
 lTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BflzF/9Mq7TxpywjPmEVZJWnPb0ih69tG/7eIZyGT6M=;
 b=iGvW7uspHBo9qxHMBGPPE3hMVi+f5OCF4PrC51WOdxu7MkYm68hthXhKgzmfefqV9m
 ddtUd/RdVtWloQHFMhUYIXB0UIYrQPNoYWnGKX9mgn51BbbSC4/Zl1YPIbR4T+hnLLHC
 16gIb9zS2Ktiuj7u1I9UE4BbFuaFKbklksvG1uvLud0dck9wLyaH5220O5pvVGQj/9nL
 RdtZEpdSdfK68vOOImgwXf+OwJb3rqLE27ENJzYAXEfPlRKpjjf2tvxNSkl4Uc9zy/Sm
 GZifYxsc8VG4pMAwux1GKCfc9YRGHQYWrzYCi5vXzPnOnnK4mGh2H62IRH45F9uHsDeN
 /Yfg==
X-Gm-Message-State: APjAAAXh0fIqc9522MxYDelE05edSLkfKJgTUmEjH7FFEUKkpIPOHROI
 p6tuR16+7nbJa67QBORgl6/VqCvsxT8GIrHHH8E=
X-Google-Smtp-Source: APXvYqxXSHK8ClWs1knrmCEzuP4NmMpxv/uwe3GjLVJVP5SHJZkILQ0KAEnkVza6R3l7cxLb9FyyEfM1uLfoOSuYj6Q=
X-Received: by 2002:a62:2fc6:: with SMTP id
 v189mr36398914pfv.136.1559635299994; 
 Tue, 04 Jun 2019 01:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190304201522.11323-1-miquel.raynal@bootlin.com>
 <20190304201522.11323-2-miquel.raynal@bootlin.com>
In-Reply-To: <20190304201522.11323-2-miquel.raynal@bootlin.com>
From: Emil Lenngren <emil.lenngren@gmail.com>
Date: Tue, 4 Jun 2019 10:01:30 +0200
Message-ID: <CAO1O6se5=FDf2YTEEzmFJ4K6HQp_2ayU=WubxGAQJdMA4V4m-Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] mtd: nand: Add max_bad_eraseblocks_per_lun info
 to memorg
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190604_010141_129316_7E8422EA 
X-CRM114-Status: GOOD (  10.95  )
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
Cc: Mason Yang <masonccyang@mxic.com.tw>, Vignesh R <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Marek Vasut <marek.vasut@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

>  static const struct spinand_info macronix_spinand_table[] = {
>         SPINAND_INFO("MX35LF1GE4AB", 0x12,
> -                    NAND_MEMORG(1, 2048, 64, 64, 1024, 1, 1, 1),
> +                    NAND_MEMORG(1, 2048, 64, 64, 1024, 40, 1, 1, 1),
>                      NAND_ECCREQ(4, 512),
>                      SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
>                                               &write_cache_variants,
> @@ -103,7 +103,7 @@ static const struct spinand_info macronix_spinand_table[] = {
>                      SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
>                                      mx35lf1ge4ab_ecc_get_status)),
>         SPINAND_INFO("MX35LF2GE4AB", 0x22,
> -                    NAND_MEMORG(1, 2048, 64, 64, 2048, 2, 1, 1),
> +                    NAND_MEMORG(1, 2048, 64, 64, 2048, 20, 2, 1, 1),
>                      NAND_ECCREQ(4, 512),

Maybe a bit late to the discussion, but shouldn't 20 and 40 be swapped
here, i.e. isn't it the larger flash that has more max bad blocks than
the smaller one?

/Emil

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
