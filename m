Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFC7CD4F52
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2026 09:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=csY8Hawdl7wPtdhoQ8OeFs9/c81qbAhwzUx2bKeRhoM=; b=l2aJtq4z3v5T1T
	kcDpvpY+0btwKur6l34c0tE5+MzOMcwgGv4ncTw445vyfaPKB6kXhtKUpHZSwVBngXlbEOGKjAmtC
	v8TZ5w8y03rrX6MPqRtXpv+ha9PJhnwVarg0Q+Xf/jL12h4aIew07r6m5imOWaVGKK5FXX8tu8vuA
	nPjxDdEQNT5yxm9HBokWsh38ziRdiOCUh0bH0usw/jt2gbuLLwYS43nBs4TFJc3kLvsQclMKpXoQr
	MNjcJoicEBnxdeLXXWQFE2rJDkpdC1FASigFc02TwxVUgVfDtLsGLAFf9rKboLwIIlP7hyvopCmWy
	RU+bOGgrFXa9JMWt5CKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOu6W-0000000EyvP-3srG;
	Mon, 18 May 2026 09:17:40 +0000
Received: from gw2.atmark-techno.com ([35.74.137.57])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOu6U-0000000EyuR-08WV
	for linux-mtd@lists.infradead.org;
	Mon, 18 May 2026 09:17:39 +0000
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=KeV0kr1+;
	dkim-atps=neutral
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 2AEB892B
	for <linux-mtd@lists.infradead.org>; Mon, 18 May 2026 18:17:32 +0900 (JST)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba3245a43dso23045965ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 18 May 2026 02:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1779095851; x=1779700651; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HKyTQAT8/Sx5fGttgW9Ug9zOmvKI1EAsxBVpCRJbbE4=;
        b=KeV0kr1+IuBKJUOfoweAmlKTRzrXjidWvAsJT4/HIjoPsGV68EjUNCZBFWQE18uChz
         4nKrJqAhVEJZkEKhZexueEAMNAZDw1C3vQXB999nSoaBerZ1uKhue66/CawIv8ea1NFB
         TWHMeJuT4f/VsMK9uw+vpuVCIF/vx4IjxFG/FkFf4+SSJSTUGiCSwdxzQC4d4x1n49hI
         Dc4EcUFn7mKI4nbLzb0Otg86foE41MxkxXKQ4NAGdaMaGIi+XhAlyjocYaxOLd9bm8Js
         gH26ySHJorfIm3G0mohAXNnpo0EMDuqsLTNAuUJ6QVQquRnFXofTSjiwV93+Uue/DiP7
         3mxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779095851; x=1779700651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKyTQAT8/Sx5fGttgW9Ug9zOmvKI1EAsxBVpCRJbbE4=;
        b=O+7tyLacjPKttTmkcYytoWNTjWM0W4itBfW3BUF8goVu+5AgCpcTCnmyjRcpCujb+T
         Fe3k8TLbEo8bi8xAebXcQRpHyuR8glkr2/TEZ5MuiRJe/yUVHpWgq0kIOQsR3I3gPBKz
         IBO1eGP+izdCnt7ByobLYNkXRHuEaGiK2CJb5x9sry4oWJZqs4tSg5apPmGGJwoXkrAh
         3YFC4tWgoyCnNGi7nZLMf5991RPA+p0g39LtckYnFIawjTnRpWzT/RazLyWBMwjbEt0J
         yqa3Wtn1mKtIBOKesroeL6fju//xEhUl4vOt5ST4OM/gem/rGQgyiydHmLxQ0Xcfir9S
         DsCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+n+ZZUIN9S8jkarztYHLOZrIuN3Ysblw/WeAJjQOdm7dymnv26Goc2qey7/S9z/G1ctf/CpXGPHWA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4HIHAT7IXp2zFWhKaPfeJ1gm/Ur4+YP1jWQLJzleuaIXBP4FV
	weHDcrT3FSpCbMITcYaRVW7SWu+hFRtsro184lBKOhUFGymO84w7I+3B16du7uJhhvj357Q1lGM
	gBzMtOwquzu0XoVZ46KekqoNYI3YLXEoKJ6vMJfmrPmXkThxUiHJF63csbsNxphJBJtDG
X-Gm-Gg: Acq92OESZcGFj/twBtQymOkvpo06rB5DoneKWQ4s+hKH3G+lAe33AFq7YacABlJWvuG
	1I0S9T7zKB64JglUIYFM1oJdOX+Y8kPBA19Ry1YrAdmzcohdSCsWWxjJL5dQ7+YK+eHNs5g+Y9x
	shA762Qj/s6D8F+no7V5QzcQNAiKYXC5MUHXrf81eA9NdRU9iIwAU4d1kLurMbdd73IkvNGgoVb
	0I+Fh6ZROl2gWe/sH4beN5xOOBs/MwL6+bcyLDhshFIIiVOExaFdB2H/nO6uuU0IMHbC0bs1TYx
	+z9uOqaorwPPd4+Jwkkwu2q1r2i43/JvPu3qP/1OHYKAg9WdIaw3QAWRv0Bqqo1o03vJbRrSiVf
	/L4P5ZOmrdkR9lZfDMqfQHk6motvzJ/GbrfNYtPWr/uv1xPGZEaPCP+gRWFf9gnzrXWF3nA==
X-Received: by 2002:a17:902:f084:b0:2b2:57df:264d with SMTP id d9443c01a7336-2bd7e8cbce3mr100795595ad.33.1779095851178;
        Mon, 18 May 2026 02:17:31 -0700 (PDT)
X-Received: by 2002:a17:902:f084:b0:2b2:57df:264d with SMTP id d9443c01a7336-2bd7e8cbce3mr100795405ad.33.1779095850768;
        Mon, 18 May 2026 02:17:30 -0700 (PDT)
Received: from localhost (sodcd-04p2-40.ppp11.odn.ad.jp. [203.139.65.40])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2bd5c05f5d2sm142539055ad.23.2026.05.18.02.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:17:30 -0700 (PDT)
Date: Mon, 18 May 2026 18:17:18 +0900
From: Dominique MARTINET <dominique.martinet@atmark-techno.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
	Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sridharan S N <quic_sridsn@quicinc.com>
Subject: Re: [PATCH 4/4] mtd: spi-nand: winbond: Sort the devices
Message-ID: <agrZHsyrm1jyFMj6@atmark-techno.com>
References: <20241009125002.191109-1-miquel.raynal@bootlin.com>
 <20241009125002.191109-5-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241009125002.191109-5-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_021738_239315_54F36B11 
X-CRM114-Status: GOOD (  13.29  )
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

Miquel Raynal wrote on Wed, Oct 09, 2024 at 02:50:02PM +0200:
> Use alphabetical order, not because it's pretty, but because it makes
> sense. This way the devices are listed by density, and then by hardware
> feature set. Add comments to make the list more understandable.
> 
> There is no intended functional change.

Probably won't matter for most people, but FWIW this commit added
W25N04KW, and thus was not only a re-order (I assume sorting made you
notice it was missing, but forgot to split it out)

This has the side-effect that this particular nand won't work on stable
trees (device additions are usually backported to recent kernels), but
I'm not sure it's worth the effort to send a stable patch just for that,
I just wanted to point it out in case someone else searchs for this string
or 6.12 kernels or older:
spi-nand spi0.0: unknown raw ID efba230000


$ git show 25f643a3d73ff9f559339dba6ac35bedd8f8e4f6 | rg '^[+-][ \t]*SPINAND_INFO\(' | sort
-	SPINAND_INFO("W25M02GV",
+	SPINAND_INFO("W25M02GV", /* 2x1G-bit 3.3V */
-	SPINAND_INFO("W25N01GV",
+	SPINAND_INFO("W25N01GV", /* 3.3V */
-	SPINAND_INFO("W25N01GW",
+	SPINAND_INFO("W25N01GW", /* 1.8V */
-	SPINAND_INFO("W25N01JW",
+	SPINAND_INFO("W25N01JW", /* high-speed 1.8V */
-	SPINAND_INFO("W25N01KV",
+	SPINAND_INFO("W25N01KV", /* 3.3V */
-	SPINAND_INFO("W25N02JW",
+	SPINAND_INFO("W25N02JW", /* high-speed 1.8V */
-	SPINAND_INFO("W25N02KV",
+	SPINAND_INFO("W25N02KV", /* 3.3V */
-	SPINAND_INFO("W25N02KW",
+	SPINAND_INFO("W25N02KW", /* 1.8V */
-	SPINAND_INFO("W25N04KV",
+	SPINAND_INFO("W25N04KV", /* 3.3V */
+	SPINAND_INFO("W25N04KW", /* 1.8V */
-	SPINAND_INFO("W25N512GW",
+	SPINAND_INFO("W25N512GW", /* 1.8V */

That aside, backporting this spinand info appears to work.

Thanks,
-- 
Dominique

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
