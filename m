Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C9BC678DC
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 09:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FeZ+9uMmb3E0nwJ0VbHnsG2eA73ewpp/9QG5R1lZk5w=; b=nudFWaf+v1kkby
	JnCSzophWII+rouucBZourdsyfVXCpxH00nn++OCT5bq1WEfdoK79UBHmqRXr+6f29bnXMghotEgn
	ixpX9BvJLlVPyaCu23i8aPRTZq1TB4Ry+Wq6gWfzBCmXOTFfpZ1cxSwJB3nYahrRskEignqetBg/5
	yVu0ig+ZPnjyV0wKTRqq9SLa7eFE3ttI099OY+PJmR5RZHwv7mNVWnEfZZe2K1fSZttS1y60o/rr9
	9HNIn5zrhl7etCQ/tgxcMbLiBeozTcAfybMPbirFMkvnYHZYzwv2mP8rNI5jD6Px1JuwAl5EhoCHJ
	TaeTP8P4Aw/3GDphVa2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWwGU-008AKO-0I;
	Fri, 18 Aug 2023 09:59:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWwGS-008AJf-10
	for linux-mtd@bombadil.infradead.org;
	Fri, 18 Aug 2023 09:59:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qWfiFERj7vA+UlXnQZ40sFn2d+5FoEugxlHGm1w4MYw=; b=oTbqwvGuhaUSKGLfB0cG6T/IdI
	dIiZ8gyoFHL24p6ozVYP3XRkUo+OUPT3E1xeim9V5s7l+r+o+6gYEK9wVEzcvKMzzBZJ8oyhyO9T0
	elAk6X8GgGhvoSId7rtEFfvANlge9lu6rJXmF20PZvqH36KCjPsG9rzlj9FSnx63R0ImhhzHdqIy+
	yDZfAFLzwid6+N2AbJEYOkrCEKbO4UBsHOe9fn0Ek2OZ2v8nmXfF+lQP60nTv9hpcZ0U0p5Uy9CjE
	+lKqHNWAqVCPKxEIlGVRRRbxfDtzFOponAbJXl6G63x/jhmALrYSL2i6W+lS8CVYPOpTDNl53xecx
	nGZ04UZQ==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWwGN-00FPKz-18
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 09:59:30 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fe2fb9b4d7so7096475e9.1
        for <linux-mtd@lists.infradead.org>; Fri, 18 Aug 2023 02:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692352763; x=1692957563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWfiFERj7vA+UlXnQZ40sFn2d+5FoEugxlHGm1w4MYw=;
        b=ThJVQY0VaZ94PdRIvlv8EPgOaqlv7cMrFuoVZRClsAnzZhzQgCk6YPzr+Kqsd1qzRG
         ZFEEfOOpHACFeLNKBdEtKqLO5OIC+q1n5vz7Dz/2qnlQQbMKEesSEvDqSevdrB+tEGis
         vL3L9AOFlc4pjYLvVFkJU1l/ikWD1R0UgR6q2/yFzq8vVyn85VA7aMNrZTGbYrQwb+EL
         AZsZpvEpslZLXo+hJDayz+vaIXPf9o4Wa0DEqBoiNE/Bu3drWEt3xQxK7ZHWsf/5TwpQ
         amkN1LNl36qSrl0nVmkQyejOYMTZxNML0v/H39+x5jWslp31R9tYwItNR0YUhkHGlOWg
         qrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692352763; x=1692957563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWfiFERj7vA+UlXnQZ40sFn2d+5FoEugxlHGm1w4MYw=;
        b=d2SjMaL+qvBhbEXfo4/T47o+7Y9yB7RxJkqBiX1xHTxO17IzlGZ461eoGwnEVTxwJb
         xRuRk0wNOhKmqRpzfuKzq3B8sZDhYSLOAXzZJsMUHHmmDcQjGqdsT+/6uP8NRLuXFJoJ
         6sxCUOKGZTWHI+QochPAK5NfyTnm81PHPluXHlEtWf+hDUYaoo4BY09WBsD8UST686J7
         fcXprIBlY9n89AlzSeKoV3VJUWcEhQkSBT31WiJihwLkpznqRtVurlRpsRIbu4lUVMx4
         GDjTn2lPybTLDIhuB2guhPiBliJ/cfHa7nSl1OvKVVSCGe7055HJ0mbf2VvgNRuw8KkA
         R7qw==
X-Gm-Message-State: AOJu0Yz96fpYniV7JDLp1VOAWeE6pC1u1m05zt9OPFlGHJV6l3xOb8Hs
	ZyzEreT03LcynfQXP7wgDpIkEQ==
X-Google-Smtp-Source: AGHT+IEV4UxFRczlomY7J0SXwmRZxQGovHsQZc+ztEb2Xaj80IKNOT1KUR+YRWbtEG5+RhMeopKkTQ==
X-Received: by 2002:a1c:f701:0:b0:3fe:18d8:a61b with SMTP id v1-20020a1cf701000000b003fe18d8a61bmr1836801wmh.29.1692352763059;
        Fri, 18 Aug 2023 02:59:23 -0700 (PDT)
Received: from 1.. ([79.115.63.195])
        by smtp.gmail.com with ESMTPSA id 5-20020a05600c028500b003fe505319ffsm5726678wmk.18.2023.08.18.02.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 02:59:22 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Michael Walle <michael@walle.cc>,
	Pratyush Yadav <pratyush@kernel.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mtd: spi-nor: Check bus width while setting QE bit
Date: Fri, 18 Aug 2023 12:59:15 +0300
Message-Id: <169235271779.45114.300580580063413210.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818064524.1229100-2-hsinyi@chromium.org>
References: <20230818064524.1229100-2-hsinyi@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=470; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=Bp+PiKv4ARstIAO0GX552wPxr5uZN46GdvFLMgvexoY=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBk30DxGYnKe9ioTDD7Y7yNbB9VC6LNKpbY76dwb H85tP7GY3mJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZN9A8QAKCRBLVU9HpY0U 6W1DB/wOtv2/Bk7wUnRiHYqw90fL01w0nKXvNpbcKPucUKDK6GknxLXsistATCCDMgLxOuLj2GP RDHUcIAOCpyVRArh+Y4obwrsRvt9j30tZKxfrL2OQ0j7a2X8UVzzo9itS16KSnDwkMA/LyH8GaS zh4arLgE3SnMq9sTtOwr7oizcYbSdnlBIJTi7HKwmNY9ScAYdjV6XwjwZJAnp8+PXc+5fTr6QX+ gNbEWAJVTFT/PuzoM2t/iKffAGAHdFRccTv2p5HutZoKnVNNjKjAY0hX2GQTl90XFCR3q2QvP03 A97G5ljoNN8xbn7JeeYsPyl8q1HR3wt9hEWq7vmUz7TM2a0V
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_105927_496058_45A7A7AB 
X-CRM114-Status: UNSURE (   7.10  )
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

On Fri, 18 Aug 2023 14:42:23 +0800, Hsin-Yi Wang wrote:
> spi_nor_write_16bit_sr_and_check() should also check if bus width is
> 4 before setting QE bit.
> 
> 

Updated comment in the code and
applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/1] mtd: spi-nor: Check bus width while setting QE bit
      https://git.kernel.org/mtd/c/f01d8155a92e

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
