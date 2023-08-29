Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF81C6FA8F
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Aug 2023 04:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E3Pu2r2Iltme/1psq1Jt0dCMPFPeXwlpFz9HMm9tjnY=; b=XUWvsDGGkq432C4rEPx+GglotE
	6xxevNXnp9AG5YtqdYTN3MyMR8NPBsrFPA5Rz1cU2Wr5bbSjuBZwfh+yWMdT2zGHjTQfAyGbO+1wd
	VKbEXZ8aWXXURtPdd5aKBu6BWtuGJXAz+ORqr0jjx4X8PoiUyTJ0zDDp9RPWKJBLtD+Q8QTSn9Uz/
	aOYC+puGf9EX58toRRMKJNrULG1G45vCnVcWOhdGftk/QEoY/EHTG/MGzEHvZdDA+8ooEHgpENFIF
	d38woOI5RGYYXvGUi5x9Dp0w67HJYo2JWjUdshU4EOy0ucBYq4+oYyDMhJaDJ/WvJO3ycBEE0bIbo
	ZofCfUwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaqm2-00AmWa-1p;
	Tue, 29 Aug 2023 04:56:18 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaqlz-00AmW9-1Y
	for linux-mtd@lists.infradead.org;
	Tue, 29 Aug 2023 04:56:17 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-792918c5f33so85431139f.3
        for <linux-mtd@lists.infradead.org>; Mon, 28 Aug 2023 21:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693284974; x=1693889774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56RQyKIWsd8kpcaxGIljWlOIf/R2gwH1nmqcYMjfge8=;
        b=jQKq+OLkMrlIpEcrq5CSyptHHLDPZMI4hUcG/7Jcxsb58he671zk0zvgSI52h/8E5P
         VRKEZBR9rwMum+R5P/OUwz0W85iCVWShOcHPN2pV8wnOAA1Vvil5LeDwlXmwreca55tb
         gqvyOSBdoCeFtLfDGV3j+ilKs4+sMz2EnIvK7gzft0txvPR3FVrJzi2fbrgBYTHyrmka
         9w2gYJidZcaj0T3LoD3oLtSIEtGkU9bWD4FoT1/2s32byzLlW2XXYI5yR0smkpBrSPon
         6at21CsQqoBg2wNVPJ1IXpFlYso/vh5GUPsbWJB1jeUC0Crk69p7jkivPELnx0d6IDz2
         R8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693284974; x=1693889774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56RQyKIWsd8kpcaxGIljWlOIf/R2gwH1nmqcYMjfge8=;
        b=BfoZEJnLx/7Og3r5OD+pDBQJxtLuRvJxjY3OLvekYYcNI0YBw2+CiIjPMJxcrhw9td
         Unk/7/ASuNcD8/0YSgVTc6AUmtOWagFvB+AgFckKUmOHDNAxjSu/yk1V0We98qSl4jUh
         kstp32iRboz8F9h3t/ugKB0kE34drA/KC9QzGl4NVdx1GK0/hmiLcN1fVfN9K4zJa9KC
         BhbjFi/8UOohpyemVDAMtCo2OOPMg7pxtjP/8J/ETlUMKl/qQ3c6NLZWtH3G2f60BXNA
         MCMHE5FNGz9QeV1Gi1NAHhZwaC7dAjiXcfYvZdgKjjOAuZmB9mywwbqIwLx7vSkQRG+L
         O1yg==
X-Gm-Message-State: AOJu0YyQJpPTT+yFYvVpke2Z6sn1v9R4IlkIxgXFTvPYD5NR2JGKP2Wl
	7nVYgDEg1GVoxWrnECsKNbE=
X-Google-Smtp-Source: AGHT+IEHMR6LmyvlNvHDGgy5W+SLGvFUf0xRqottL/TYP7YVWzKH8m2bPsr9ZU1J0RlXulwI8aALaw==
X-Received: by 2002:a05:6e02:e08:b0:345:fbdc:bb78 with SMTP id a8-20020a056e020e0800b00345fbdcbb78mr16896466ilk.29.1693284973893;
        Mon, 28 Aug 2023 21:56:13 -0700 (PDT)
Received: from sun-virtual-machine.localdomain ([103.149.144.245])
        by smtp.gmail.com with ESMTPSA id c1-20020a92cf41000000b0034ca3b29c5asm2868605ilr.57.2023.08.28.21.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 21:56:13 -0700 (PDT)
From: SSunk <ssunkkan@gmail.com>
To: ssunkkan@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	pratyush@kernel.org,
	richard@nod.at,
	tudor.ambarus@linaro.org,
	vigneshr@ti.com
Subject: Re: [PATCH] Add support for more XMC series
Date: Tue, 29 Aug 2023 12:56:00 +0800
Message-Id: <20230829045600.5254-1-ssunkkan@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2F4A4D23-1C71-42B9-8B2C-06496F773BDA@gmail.com>
References: <2F4A4D23-1C71-42B9-8B2C-06496F773BDA@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_215615_522660_79E2F884 
X-CRM114-Status: GOOD (  15.51  )
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
Content-Type: multipart/mixed; boundary="===============3523531453230226108=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3523531453230226108==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

>Hi Michael,
>Since this is the first time I've submitted code to the Linux community, please forgive me for some of the missteps that I've made.
>I uploaded the incorrect patch file.
>In a previous e-mail you said：
>XMC parts seem to have SFDP tables and they should work out of the box
>without any patches with the generic spi nor driver [1]. Therefore,
>you don't need any entry at all.
>
>I think it is related to the PARSE_SFDP flag.
>The XMC flash part supports SFDP, so i don’t need to add NO_SFDP_FLAGS() macro.
> drivers/mtd/spi-nor/xmc.c | 17 +++++++++++++----
> 1 file changed, 13 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
>index 051411e86339..e78bf11792d9 100644
>--- a/drivers/mtd/spi-nor/xmc.c
>+++ b/drivers/mtd/spi-nor/xmc.c
>@@ -11,11 +11,20 @@
> static const struct flash_info xmc_nor_parts[] = {
> 	/* XMC (Wuhan Xinxin Semiconductor Manufacturing Corp.) */
> 	{ "XM25QH64A", INFO(0x207017, 0, 64 * 1024, 128)
>-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>-			      SPI_NOR_QUAD_READ) },
>+		PARSE_SFDP },
> 	{ "XM25QH128A", INFO(0x207018, 0, 64 * 1024, 256)
>-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>-			      SPI_NOR_QUAD_READ) },
>+		PARSE_SFDP },
>+	{ "XM25QH128C", INFO(0x204018, 0, 64 * 1024, 256)
>+		PARSE_SFDP },
>+	{ "XM25QH256C", INFO(0x204019, 0, 64 * 1024, 512)
>+		PARSE_SFDP },
>+	{ "XM25QU256C", INFO(0x204119, 0, 64 * 1024, 512)
>+		PARSE_SFDP },
>+	{ "XM25QH512C", INFO(0x204020, 0, 64 * 1024, 1024)
>+		PARSE_SFDP },
>+	{ "XM25QU512C", INFO(0x204120, 0, 64 * 1024, 1024)
>+		PARSE_SFDP },
>+
> };
> 
> const struct spi_nor_manufacturer spi_nor_xmc = {
>> Correct. If the flash is working with PARSE_SFDP, it has SFDP and
>> all the information of the flash_info table is pulled from the SFDP
>> tables, except for the part name. Therefore, you don't need any entry
>> at all. The flash should just work out of the box. Are you using the
>> latest kernel?
>> 
>> -michael
--
Hi Michael,

According to you, does this piece of my code still need to be modified?

Thanks,
Ssunk


--===============3523531453230226108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3523531453230226108==--
