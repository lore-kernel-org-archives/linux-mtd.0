Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A4FC0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T7pKgx4c1xKm11OU4Cs2VEkm+l/CS70c30jB5QNSCn4=; b=jVGcVULGQtMsE1
	JXzQqBTzn5ezdNy1q7D4iTF2zjdGdy/LKBoGihXN0Lz/01cfXE5HmZMLOuPCXeOSjuvNLGpU3hfF7
	HtcMPSGMzVcnek/Ih+2/6vTchut8alMbP/BDxuivkEnyQNbzODgTnR/cHbm9AI1Ct/M0vq88ENXKd
	BtTn9KJAEV+zZHXxO8uexAkaToJd2NZGcFRLs/uG3tdhgxSOIxgdKelgAVwCVFGKeMnY8L1Cg9eCW
	t36NmYu+7ogbX5rrueOvT1iprkHoWTQvHTAn+PuLXAKI4TgN+o96Ry6v/ZvdVJZ0EbsFVCxark6/4
	8LkxN6jkEaMQ+11PLVMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Sx-005csM-1W;
	Wed, 19 Jul 2023 06:15:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Sw-005cqx-00
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=d+k9BdcG6/wKA2WJ+Z1glGS1nq3dMoRFR2hTr195Q+U=; b=AN92MRT6jEIkHrJ/vOCMZAbz6X
	zXqKdQKR3ZUNS1q4NgXNdowd/q2ES6dWBJ6jxa+GCEfggHmDP4bsd8OrHWqLApEnlc61bg0dY2gb9
	HEY45fqCsYz92lt2jjSN/a+59a4q1i3XZDXyn96Uxw+c+i8OLxANmW6xEefLnv02KGgRPnlO8eEuk
	BnPLBf2Os4W82wVq4tnbsuBxksZOBgOKxX7rDH9G2u75FhV7S8iurma3QkeOVTPFM+Bx8q2X1MZTE
	iNd6/mGrKoNG02OIkrn0/xFZenOEYfUOcBAwka8fZzuL03zKxd+lAJbhxY6fWy5xddtUr9w7gWqgH
	WENPVKag==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLokE-00Bp1X-1I
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 17:44:20 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3158a5e64b6so5710865f8f.0
        for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2023 10:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689702194; x=1692294194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+k9BdcG6/wKA2WJ+Z1glGS1nq3dMoRFR2hTr195Q+U=;
        b=PLvVSjnMvyHl1OZDIGH9hu6A+tKXzQyznVfttIiff4Y8nw+DzE7Bp7lfFDNQXwJ9wf
         dUosAf+mXDdAIe2nv9JD97+sLC+Y1NG/7gTrwGfgXCWp2IyvwYZKDSIt2v3TZg+SbRxE
         +j4hCOL/wQvXB1MUn3hb104EIoQgO9ycMQvXKHQQBKy7eaxG08pqbDhQA0e2hr/NqJNp
         CZMMpN2zsbnO4w1zQ+mO5dxRVpy+HzN9Y6yahe+g002Z50dAiTOxNZvjnMbeKPmIg+0E
         V2BDrlirbymAPXdn8iYZo0qvTNingfTyMFD68W4lVbMcuPU8bDkc+B9zfd50kFY4GSF9
         kb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689702194; x=1692294194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+k9BdcG6/wKA2WJ+Z1glGS1nq3dMoRFR2hTr195Q+U=;
        b=fPqWxLqd4yJ5QbpfFSlKYYsX8jbPLhA59ThYiM9T1XskJLxdr/GUa7xQXqH3kMLGLv
         UHoUKXoSuRuldBo8wCNmlVdj2VhkT+/6eE18IMFXglC0OLsSUTftZvFGMxnMicst0d2c
         r0ulbqKOpNRQiw1vchLOdKO2Kfz4fTTIYs70SvDRg8u3CteuorcWQRu6Ug6MAAuoH18w
         mvi8upy+OwD/UiqmBTwsu3Qvu4rANHRHYgYF8MQGfYJCZaVM732ow2LuZpQyuZr2+qJh
         kjo4Yay+kmgIVwfLWpRPFeTLaTubXgFZicIHzsLDAXT8IzfFQUwyP6Tul5XSH3wsEPr4
         r+AA==
X-Gm-Message-State: ABy/qLa1GtTlcYEJ1cJq8lSgBzRXH/cDyGWOisHISQutFlX9etPpAApI
	dUiacqYB8XZnlq1wnWq2SvfuUg==
X-Google-Smtp-Source: APBJJlHpU5h377RzXJrLYNSB4ttt+B1dMQTiBr3QdTXBVoZ6aerI86g50rdX7YHhRnj/5zYkUn/hqw==
X-Received: by 2002:a5d:52c5:0:b0:314:545f:6e8e with SMTP id r5-20020a5d52c5000000b00314545f6e8emr11873879wrv.62.1689702194500;
        Tue, 18 Jul 2023 10:43:14 -0700 (PDT)
Received: from 1.. ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id b5-20020a5d6345000000b003143b14848dsm2951442wrw.102.2023.07.18.10.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 10:43:14 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com,
	takahiro.kuwano@infineon.com,
	michael@walle.cc,
	pratyush@kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at
Subject: Re: [PATCH] mtd: spi-nor: rename method for enabling or disabling octal DTR
Date: Tue, 18 Jul 2023 20:43:07 +0300
Message-Id: <168970217898.7924.7478939621103935495.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714150757.15372-1-tudor.ambarus@linaro.org>
References: <20230616050600.8793-1-Takahiro.Kuwano@infineon.com> <20230714150757.15372-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=784; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=O3mGwcG/uRgZe0IXPsDP8xQtTqGuZ1b7Ksp9CjPvyGc=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkts8ppPuVf7YB2psHt9WHAQSmjLszLMRGZT1zl pwrf0twS+aJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZLbPKQAKCRBLVU9HpY0U 6dmrCACTnsHqsHOTTnpDdSZQpw+DNOz3lEr1iMssZNduZkU7c2aW4JFjSJ8rec13FW2SeAPa5Rh HxSjlKpDowVp2rZWnam0ScHAwzKaK6G1C/A39u+/nrB12e7xgMxq9hqhz+0SAG9D076ih1Mfpnr XPIT8226yJqPHAC+Uqp0ACgt0auAndL3UQknxtZYEBMIuOodQPeyc/+tyMN+gYYFwqfSEOHaojv YZ2lH8xPOgpjLrUkmWAo0+0guGXBrb05bw65e5wjrH7ZO7utAEPg3Og9gM0cB9+Wbe8zeC5uQju X97+QoosIMsWFXevnwPprTUFPjMWDGFOZUMYQRqkMsYk/jUN
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_184418_521905_051D0614 
X-CRM114-Status: UNSURE (   9.54  )
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

On Fri, 14 Jul 2023 18:07:57 +0300, Tudor Ambarus wrote:
> Having an *_enable(..., bool enable) definition was misleading
> as the method is used both to enable and to disable the octal DTR
> mode. Splitting the method in the core in two, one to enable and
> another to disable the octal DTR mode does not make sense as the
> method is straight forward and we'd introduce code duplication.
> 
> Update the core to use:
> int (*set_octal_dtr)(struct spi_nor *nor, bool enable);
> 
> [...]

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/1] mtd: spi-nor: rename method for enabling or disabling octal DTR
      https://git.kernel.org/mtd/c/d4996700abc1

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
