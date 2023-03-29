Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B378C74A5B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Mar 2023 10:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJmykD2ZavyHzVa3ClkCmIeltBEEz49dm/+HLC2/W0Y=; b=N8X7Plj4l8ANEB
	fvQZYkQI9mt2odJkZ/5Ig/cvDy1/GIxGzhoITXoYsIkG/FxcpPXJRkdqc9wz/Pz6CEMY+JbI0cAjl
	LYu6KDD2/Fc0lcEucOp46M76gk9ms8K1ZFPvvS99vS7fhA+mLfHZ5MxaO/s3IqLgvSbHjsdvLqzgc
	GtVPbmyo1xiiE9mSRX2MqZ8tLEYaTUDcWn0RZkH8ljnAG1FtwwujjJ2RnoUgG3AEh36InQI59Ic12
	YFHZMi0UYvao2HHLPNiJmSt79EEPM871zDZ3QnCgVcFkv1HquMGx4esH8EnaSO6ZTKWHvBoUCzDrX
	skhpc2G9IH7SXGaaGkWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phTN3-00HW2A-2y;
	Wed, 29 Mar 2023 10:49:37 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phTN0-00HW0Y-0l
	for linux-mtd@lists.infradead.org;
	Wed, 29 Mar 2023 10:49:35 +0000
Received: by mail-wr1-x436.google.com with SMTP id i9so15186177wrp.3
        for <linux-mtd@lists.infradead.org>; Wed, 29 Mar 2023 03:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680086971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRIYGBGCK5ouxKp/poNlol9lnqqFZ6bq6ta+YeOuMAY=;
        b=N4v/gFMg0ovg2F2UJaaH2K7N1W3rviJphtgx2uwrTuo/rSZCL0ZHhQ1ps6XQhsYEwa
         y2WZPYrkDU859WzrJGxqkotzWioU0Joujr25avuJfL7yOjx/ZdLkikAa5dFKtsyByBr6
         NAcqTVmNal/+G1ncJOqgKa5NWoE91N6vUkxx4CAgBmaxPB5G++3TWDUqN8zSzBk7WuuI
         cWJmu7kMYsUf7O69m5aAkpbZYTXyxDBbojy8IytiVNhZyB4BUpjp+V1q/q3rj1wvqGWy
         d8TvcGnmhoJTc++eSms3mnBNTGfWwPKOU19GvDrXyH14KeYcYaZuzkidVYy1rPVgG/VK
         CbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680086971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRIYGBGCK5ouxKp/poNlol9lnqqFZ6bq6ta+YeOuMAY=;
        b=hTruMK7sscaYbdjGoqM7qO+wEtohagjvr64HGfSKzbqOYD5E/37lc26oB9K11GwDr/
         RlLWwA4BKJGr3tEY+DwoIiJm8KjrN5CXC2jedbXlO/mvb1hnZaE+cJbLuCuXrxCTnZFv
         PZDzAATWW/EWXxvEv1EVQb3I8mpqaXeG9BKTfD8SemkKW44ictZZzSJzlROTDUW2ir/1
         X+pvG1Cp6lFJ5BLbrsuGZbmR1QN59DtQuqyHjy25Rn91ckb8wYxB0Bw69jO0OaLsH1LW
         L/YV6EY7KQouwadEA/fvG4ZUPpMDOHmCTrsfUxZvRwT/8yQqDVdi4M1kdgdLqNYIWnHQ
         v3qA==
X-Gm-Message-State: AAQBX9fUSblrAXI95uY2Q78cQza/XDFfCcmxIOQXaPItP5EVCbE/8R/3
	jZqQrTPmhBNtTIDUvVUgo3zxCA==
X-Google-Smtp-Source: AKy350Z1svqNKZHdGL21fk/YAGteTkuk3Ro4dRnWK7P9YoNo+hTR6wQ/f2yMmmq1zF/edEoYObCOoA==
X-Received: by 2002:adf:ec87:0:b0:2d1:46eb:3f98 with SMTP id z7-20020adfec87000000b002d146eb3f98mr15907478wrn.36.1680086971397;
        Wed, 29 Mar 2023 03:49:31 -0700 (PDT)
Received: from 1.. ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id e8-20020adffc48000000b002c8476dde7asm29843879wrs.114.2023.03.29.03.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 03:49:31 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Michal Simek <monstr@monstr.eu>,
	linux-arm-kernel@lists.infradead.org
Subject: Re (subset): [PATCH v5 0/8] mtd: spi-nor: read while write support
Date: Wed, 29 Mar 2023 13:49:27 +0300
Message-Id: <168008689435.20989.12807482773906497688.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328154105.448540-1-miquel.raynal@bootlin.com>
References: <20230328154105.448540-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1323; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=etmitbUH8Lr5xXMjIMhVvyuleCZ1QFQbsFX+TXDCpLE=; b=owGbwMvMwMXoHervvrRX5CXjabUkhhQV8W3LbRe1FvF0TL7EorNTWFF06vfExs+HuKz8BUL3s ebFRah1MhqzMDByMciKKbLIOmmdOs93IjdO9t99mEGsTCBTGLg4BWAiM7zY/0cqSppz/XF9Vr2P b0LArF3SNi5VXy9p3pJnYWblvyXXOL8ifME2/xcncn+f7ddcV5X3c0q2QlH8EamU9DateddyEq7 YBSTN+ZOnnGdyd+25R5X3fGPEpOZWqXRyHUox9RdlvGMulRC8JqO8a5tyRMPqj/FMDqxdu61uPr areqGT+pfD+Yyah7x73IuWTv+5nVZLHK7Wn41Vywj7nrorzihU+Eb9fv2nblwifku+rtiWsXfez OIrB75WsH2dEL3hrcGXZzMPxuiVWfp427FF/bvIc+xjt9iliXvTxJp/qvd3/Jl+n2mRR+LSmqbH wge29b2bujZmivy8bEfDw1M8Zu1afau6s1nljlfUba07AA==
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_034934_272541_D433F087 
X-CRM114-Status: GOOD (  13.17  )
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

On Tue, 28 Mar 2023 17:40:57 +0200, Miquel Raynal wrote:
> Here is a new version of this series trying to bring a little bit of
> parallelism to support SPI-NOR Read While Write feature on parts
> supporting it and featuring several banks.
> 
> I have received some hardware to make it work, so since the RFC, the
> series has been updated to fix my mistakes, but the overall idea is the
> same.
> 
> [...]

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/8] mtd: spi-nor: Introduce the concept of bank
      https://git.kernel.org/mtd/c/9d6c5d64f028
[2/8] mtd: spi-nor: Add a macro to define more banks
      https://git.kernel.org/mtd/c/ccff2cfa1ac3
[3/8] mtd: spi-nor: Reorder the preparation vs. locking steps
      https://git.kernel.org/mtd/c/320463477235
[4/8] mtd: spi-nor: Separate preparation and locking
      https://git.kernel.org/mtd/c/c154dbd28003
[5/8] mtd: spi-nor: Prepare the introduction of a new locking mechanism
      https://git.kernel.org/mtd/c/e96d4605b024
[6/8] mtd: spi-nor: Add a RWW flag
      https://git.kernel.org/mtd/c/4eddee70140b
[7/8] mtd: spi-nor: Enhance locking to support reads while writes
      https://git.kernel.org/mtd/c/74df43b3f626

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
