Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9353C46CCD
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Dec 2023 08:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWTZZJjHaqKwLG/OkwCQj1ezfnT2CTCKdp6rKSM+kZc=; b=y3ihjTLSxS5ld9
	ouuuS1ikOTbjTGUlsxNXxQUh37OkeVIkD1vMh8TDr4P++9MveVQEzxt47026McgzYd25ONh72a8lx
	qjg4bFKMJEnEBCVs7Hkk1jMZp2KOtWYUwOETUK3kG+lx/rz4BKHLni75njRBmTjWs6kg6SQtFGjGM
	3JfOgWXutz9ra6fxJh2SzVMfOwOabPe1lh/IlNfkmj6md8wjCEunyWuiVayOyFUWGN4yENyU91kn7
	1eLfA1FUiNoSaTbdbY4n18lkxVD2yQmOeyYZB4G1LxS1wgp/sEn3wbx+pO/4aUvMHaFl4iP3TGgRD
	EQNV43Wf+9BxTfwGjtRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsIl-00Ge9Z-2w;
	Wed, 20 Dec 2023 08:51:39 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsIj-00Ge90-0J
	for linux-mtd@lists.infradead.org;
	Wed, 20 Dec 2023 08:51:38 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-33671384e50so1622362f8f.0
        for <linux-mtd@lists.infradead.org>; Wed, 20 Dec 2023 00:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703062294; x=1703667094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jr9XBuw8sKZ2jIH0XS4tTZKuTEktn0TD32tUvDvV/mM=;
        b=UsLlp/IOktlIqrYq7ZIvN0mEZDfi01M/yTkE6Z4+MkHYNunp8FhphVaPtTp/AHgXnV
         MtEsj8bylB5R1nZD0mgJm7WOCFpO2llGHXQjlfI2KMrv/b7cIm5FNEEQvXqPo3r/25wq
         CgTL0NOkwmiy0YIpKJaSebX36ABpValqrbU55JtY2tHvgWcKjccHenB7crcfX/jweqR1
         GHnrtlHEe7lPgiouuYWgn0sjhARtdjmZ2XbI8+gbh+gckvIBpPsodc3OQQJWdQyfHypc
         z/fR3z/N+4r0sIDMAWPCsvQvdb80zxDsl356y1m/fsbKi0MdTTsFJaOzt6Px9QrfLAB0
         67uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703062294; x=1703667094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jr9XBuw8sKZ2jIH0XS4tTZKuTEktn0TD32tUvDvV/mM=;
        b=dTpqQJav/SnD25WhHwqm0ydOGD7IkdS+ju2edPdaybdUFwo9z00ioaQlWqdgEPsAWD
         MbPM3kAz3cfsj0HWJQhKv/Dxsce+J1sdXqiUmqwSpeAdDBhoQLYOk/5ml6mczpPcGIy6
         j1OJYqjPzNPkb/OqhDE4U3swhACtqcjX8K7hTDDyoY9ahDz/QpmYAtHEoVaN8TLU/xyb
         my5hHacvcWqWgaYMboAbGtpmlIdkIJ0d+EpjAX9CmYqH5wEBvIlz6oB/pnjohD6784pe
         +ZoDKH6ONaHRhcphlNZ1i+1QoHN/mlfk61I2/ewbiLYYdBGjb+hBAjOefHwuT+HwGpZ7
         LFAg==
X-Gm-Message-State: AOJu0YyvWDNqsTXrF1Ij8HJt/mQRMS6FVQH2Jkh3z2QmsHi0spmE3kpr
	qjCHlerVvwq6Fs5avr98NA1je8REvZL5I/oC558=
X-Google-Smtp-Source: AGHT+IHxMBHLnhADd2cDjg+WrA+QxirTopRMVwFwrigp5DotdbM1dsAxmEGkMQRSBMfcP/Gw+NN2AQ==
X-Received: by 2002:a05:6000:4f0:b0:336:2d0d:3003 with SMTP id cr16-20020a05600004f000b003362d0d3003mr7834987wrb.23.1703062294623;
        Wed, 20 Dec 2023 00:51:34 -0800 (PST)
Received: from 1.. ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id bl40-20020adfe268000000b003365fcc1846sm10866811wrb.52.2023.12.20.00.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 00:51:34 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: linux-mtd@lists.infradead.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	Jaime Liao <jaimeliao.tw@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: Re (subset): [PATCH v3] mtd: spi-nor: sfdp: Get the 1-1-8 and 1-8-8 protocol from SFDP
Date: Wed, 20 Dec 2023 10:51:29 +0200
Message-Id: <170306224470.10641.1245511435688404691.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231219102103.92738-2-jaimeliao.tw@gmail.com>
References: <20231219102103.92738-1-jaimeliao.tw@gmail.com> <20231219102103.92738-2-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=753; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=mWrk/DPCF7073P9Nwk4FSaMsmQpCWDcwO8EaEWQCvMQ=; b=owGbwMvMwMXoHervvrRX5CXjabUkhtSm1QLK+SVTzZ99drpRLdQSlpDgtiOmNU+CNfzlTt00o +jdvv86GY1ZGBi5GGTFFFlknbROnec7kRsn++8+zCBWJpApDFycAjCRglPs//TTdy/t1I+yvbhG ahfP/z1pnJMuJr1Xkr1d6sszzaIi7cG15rjC0BwLM6Yc9o6wNxc0vi36XLMt/QsTm9uOxGcvt94 7/6qnoNRbb6lDpqHRJtMfl19o/fm7TTlqZq5m7HW7DPapM3+qRj9zrnlq3JqktzSga/8H1WlXOm rnKp1tuVJoJFvdZtT052uxXMTz1V8qu/IrbHgMk3f+6u942Pkzjvl6/Ek+F9dLN5TndczXPaKyO kNZoJyjjtkh4MqfdK9dKT2RT68FPF+3VcXmxY3tf5jTPH9dv55x/vmSNBf3sog3XccPC9e427ze c8DWb+rPqQ9fZV6prcjwEk+cJihinszunJ40Kdd/J7s3AA==
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_005137_141620_6A2E54BC 
X-CRM114-Status: UNSURE (   7.91  )
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

On Tue, 19 Dec 2023 18:21:03 +0800, Jaime Liao wrote:
> BFPT 17th DWORD contains the information about 1-1-8
> and 1-8-8, parse BFPT 17 DWORD instruction to determine
> whether flash support 1-1-8 and 1-8-8, and set its dummy
> cycles accordingly.
> 
> Protocols 1-1-8 and 1-8-8 support are not determined by a
> single bit, so that use 8 bits instruction to determine
> whether the protocol support or not.
> 
> [...]

Made some changes, see commit mesage.
Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/1] mtd: spi-nor: sfdp: Get the 1-1-8 and 1-8-8 protocol from SFDP
      https://git.kernel.org/mtd/c/af2792abd455

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
