Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D616DEB64DA
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jul 2023 08:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZI8ID54icdLi+pUrrZ5P5CN6qM5WkZtjuhKl5sQKgQ=; b=HW91P6s9Ontfrt
	iWJmzH8o0uy4dKrCsajcTcIKYjRrYxslw8uK38QfkEgcU5t14Cphxp5pMmOPqA7mlHU2WgxSyPNLH
	FAcApWYlrcRFMU/N9imBsHxhbaIftHbCEUYoI4Ux0gtm6E9PyGe0azoa8sVgdrdxdKJv8K/IuqcBP
	MjP+6FDXFU662XHpT8qybI6+OWtzd7Ua9i/nPf/DsxqkEYQPhgG2umeByRRl3MwQwu6o43po3Bxpu
	9GUJBqFdaWdzz3hDlPHTDcROxj0JKs3XokUFq+CcBCbBUDtlHEHzJsJErXmubxXKrS9vTPAIalHBb
	uZb3jmTBfCBVPLC2pnIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN7oc-00G7r3-0R;
	Sat, 22 Jul 2023 08:18:14 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN7oY-00G7qC-0g
	for linux-mtd@lists.infradead.org;
	Sat, 22 Jul 2023 08:18:11 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-98377c5d53eso420475866b.0
        for <linux-mtd@lists.infradead.org>; Sat, 22 Jul 2023 01:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690013887; x=1690618687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHld8RxMq9xm943lbU2ZzaFWfEVwytJ8KoZ5XtKL3Iw=;
        b=aRvXM8sXVo4W/lCoaOp0m/XXymlX+ela7hhKQ/5YNGo7+IJYnSsVfPNg61gp1mvNeK
         7t08xqYc7Vn+vPZ2VRyLKl8O8isZqloFtghTUItWZHdsR5vBBVIBNoVp+/HDChhaj/BE
         l4z8ZH3nh6DGL/IPS/xYEcjE89X40pG2MHoJQRCFZ3GoUhqyqm2+i4cpbAGcxI4ZiyJ3
         d6qtzckXoowxlWhVd/cMkSSIBD7y2SXNqhWZUkC467t8I+jdVclavI2hNxkpSO2EL/h0
         aWD45AvP00y47FOX8zI4KtawGmq/rUV14qKk+bVBgJQi8vT0yiHSre6Pn4LytFJiWD5z
         LzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690013887; x=1690618687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHld8RxMq9xm943lbU2ZzaFWfEVwytJ8KoZ5XtKL3Iw=;
        b=CgmOeyL9o0mzNcvWPIvptnsqME3lyF4gIacI80weq7LFq70GHmxkOKv1zApxhBxayp
         HLsICbRTxCGUcP+XcD91h0YJ5A7UNvJ8WEXgZ102D6Ur+8P8xAFqLBCFmYnXYcBNlLvy
         lkMjODFg8h6zFPbJLkDAHJIndfvWFgdsBCpx4EgrBAkkiX91JcigK00s8feNQu5EqT8p
         wOLHNCr/9H6+dcGXFOZhvp/yKnfiNl2JbN3pIWHiSzKXtTJRhi9FlL+//ilAkhwIgXt0
         eR1NcU1wPC6OEZZdIteyucnIZZWrb2cgcMnpv4uIaTkg5Lvkvg59yyKD7/FcIwwAwg+B
         757Q==
X-Gm-Message-State: ABy/qLY/yZPI/eyOEBsogUdip8LKA2gBKJHc25q0eSydhNjPiRBvdoMC
	xnFa14cqEX3wR5CIzn4Ta0HnPQScXNYDGmyVQpE=
X-Google-Smtp-Source: APBJJlEM+rDAw5x1Jwa1O1n029UVOgiKQxXWILjLFlJ3by9BG6vyHsGCm0fsngbdMMwXxGGO9tRocg==
X-Received: by 2002:a17:906:8476:b0:994:54af:e27d with SMTP id hx22-20020a170906847600b0099454afe27dmr3696747ejc.29.1690013887736;
        Sat, 22 Jul 2023 01:18:07 -0700 (PDT)
Received: from 1.. ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id o13-20020a1709061d4d00b00992f8110a2bsm3193355ejh.150.2023.07.22.01.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 01:18:07 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com,
	Takahiro.Kuwano@infineon.com,
	michael@walle.cc,
	pratyush@kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Bacem.Daassi@infineon.com,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at
Subject: Re: [PATCH] mtd: spi-nor: spansion: return method directly
Date: Sat, 22 Jul 2023 11:18:03 +0300
Message-Id: <169001387528.21291.1932911592748478548.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721170911.13502-1-tudor.ambarus@linaro.org>
References: <20230721170911.13502-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=424; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=Pi3434O//66gCsu8yDIpRyhYEI+3b0t/OJ+Xr1cgUX8=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBku5C4dqDZQdKXSf6LGt3KA2qMEricjDrHOOrbb 8jd0/bSUPGJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZLuQuAAKCRBLVU9HpY0U 6UmOB/49FYCJi9knnNT3WxPgF5Tu7TqlYwvrwV1wGHeKE9XM909Kw+KTeg/dBBp6DCi/TdUEuSj gv2YTC7ru3H437GFF9ULW7OR0iWclEW47YK5i286rJEfu+VWERn247hqXPAYSFYrVDujU34Z8ht y9qFPwXwiqcs4yn7ItEeClVM/mJXQtioIxB/cGHdKevd8WQtIYSynTQS1ybI4zomzQ0xkf29u30 9DO7UIjocsHrP6GFS6G8U/zhUFgn9OGDANJKBmIzfaV/v9iqWAwftFdwemTcsqv/zGVxy3egLPe EgRauT9hnmVsv65/vvXhFNM4BOY8d6Dyx8gVYYPQwwFOQVqY
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_011810_320090_743AE927 
X-CRM114-Status: UNSURE (   5.94  )
X-CRM114-Notice: Please train this message.
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

On Fri, 21 Jul 2023 20:09:11 +0300, Tudor Ambarus wrote:
> Remove unnecessary handling of method's return code and return the
> method directly.
> 
> 

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/1] mtd: spi-nor: spansion: return method directly
      https://git.kernel.org/mtd/c/abfac0f3a457

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
