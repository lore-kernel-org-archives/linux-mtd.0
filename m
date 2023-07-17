Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F08C0015E
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 01:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JFzgE6BE0HM766avm0nGhwGsJoNta/hJttHYAAnV2VA=; b=augpKe5SITIwrX
	ta97JAKQmoL3VMZz/EjtnCwxuM+HeyRluwjLLJQsFbwJWYTI3QFpCwd8zySPhfJgYYD6cMzSNhRPw
	OaTZvsqXOnREGzk4kW6IU7ee2Y65VaP4wymbfoll5eUBR0DVDdh5u8iXnrFv52tAHRpzDEto2vFcN
	TTzxjlupo8oNgTLSWJxq5ixxN/rObBYPI7A3ss5nP1HUEsiVFLn8JPW6YSLGaAN1zh+GEMSJoqkDT
	7G40Q3U82qC8hTs+vmL4qOBzJXYgQRROciGpBiFmUO8QXB8bFSjTUSKBITerDCzIdQEOpGADHNQOl
	oZvaRs0/kVAr0M8mXVew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLClG-0006bK-0D;
	Mon, 17 Jul 2023 01:10:50 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLClC-0006YG-2L
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 01:10:48 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-262e839647eso2790949a91.2
        for <linux-mtd@lists.infradead.org>; Sun, 16 Jul 2023 18:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689556245; x=1692148245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QqiELNGb9DMauYavdhyDFrTJKLkDMUtAeWv40aasFEY=;
        b=ge3VQVNYd6+iRcJnXYDSAsIPQYm9KgryPr64795qQ2IkvE41lM6b9bsui2q+mBdLXQ
         eolHPLhUz5N81r8foi6lMRhCBOx0wY8j/8QGOm471WeDLwL8phdE9SZ3tEs93aqnt/RS
         RmD7BicImsiQixB5uXIl0JOF7B7KuTW5NTazeqgOMpSCGLBsPbnq3Tb8oUrJORe7rbBp
         mQAWxmbG1iwnobWPUGmrL7FRLlEIjKznheS+FeLXFe3v1Ot0Dq7sCrPxTskoHXxgF0o9
         ZstE4snO1ICJUMpLDU+H5icm6Vg8CG5cQl8MQCtUdfext27qFfkyk7stxYPObxjKe9t0
         MVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689556245; x=1692148245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QqiELNGb9DMauYavdhyDFrTJKLkDMUtAeWv40aasFEY=;
        b=a5Ke3r1eGpJQAE0V5P092+fjnuNCFxFfXE28EaxH0+FzE8Pk4i2/aCRCR5BlR5SXw9
         aR06ilmw8ohJiubCLSmvfebnYXU7PBIaMdTtII9NBRP3Lco2AB/40aoOntyAhsH/ohME
         B5xqJYyCIjbmjjd4P9khJ97PoqKuS8o9lPm9gswE1Z7JdH2Sw3LdHxhc1eSBFWR+xnUr
         m51HBetQ5VfzVoksrk1+zyS5vTivVVfLOjeoH6F4eLbmwOTRsvSYf1XsTGMiBuiPXenj
         15f8eNVTnAx0ZDxVibp7kk7ypaZEn9F9b3t5B1K91QvaOPDJTCXCcAPYrCdZiEf9tx5Y
         6lNQ==
X-Gm-Message-State: ABy/qLY03xCtGKLG5MahzQlAQgnWIWEdjXVP1WCHmu9YDpUr7u+Ubd1+
	2GUuza5JMLh6nYD+cPOLpVFY25e9p3e0rw7sNHg=
X-Google-Smtp-Source: APBJJlHvwt6RR1ZH0iGNrXEN7pqK9UJlHkU1x77GosaCEtTI7VzbP2wo+MpUbsO2E/orKwYblcunhhunc934U41EfgU=
X-Received: by 2002:a17:90a:1f05:b0:262:f99b:a530 with SMTP id
 u5-20020a17090a1f0500b00262f99ba530mr10268223pja.34.1689556244949; Sun, 16
 Jul 2023 18:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230713105058.101321-1-jaimeliao.tw@gmail.com>
 <20230713105058.101321-2-jaimeliao.tw@gmail.com> <76b5a9e6-bf90-e63f-0669-502bba0bd0dd@linaro.org>
In-Reply-To: <76b5a9e6-bf90-e63f-0669-502bba0bd0dd@linaro.org>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Mon, 17 Jul 2023 09:10:16 +0800
Message-ID: <CAAQoYR=qW7POUDDFtWqXLhqQ5ZMnmHkATrSRSOGNfT6ziHTcfg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] mtd: spi-nor: Modify rule for parse sfdp
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org, michael@walle.cc, 
	miquel.raynal@bootlin.com, leoyu@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_181046_809700_5602A604 
X-CRM114-Status: GOOD (  10.31  )
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

>
>
>
> On 7/13/23 11:50, Jaime Liao wrote:
> >     With various vendors adhering to the JEDEC Standard, the percentage
> >     of SPI-NOR flash devices on the market that can read SFDP table is
> >     increasing.
> >     To enhance reliance on SFDP table, remove PARSE_SFDP flag,
> >     allowing all SPI-NOR flash devices to read SFDP talbe. The exception
> >     to this ule is for ICs that included SPI_NOR_SKIP_SFDP flag.
> >     Furthermore, to establish a complementary relationship between ID
> >     table information and SFDP talbe, organize no_sfdp_flags into
> >     nor->info->flags.
> >     The flash parameters are then organized by spi_nor_init_flags.
>
> what are you trying to achieve?
Sorry, I got something misunderstand.
Please reject this patchset.


Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
