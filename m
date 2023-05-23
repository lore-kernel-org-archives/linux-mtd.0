Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34716C7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 16:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rskLa+YHiPF5Rl6vZdaWbfIyh+tmomwtmHXkGywbwM=; b=jwV86c0Xe/bFIr
	5B4Og0moxcEF0MoDoMWKAr6/YcgUIRnruQecjaHTi9C51cX+AS886IO8g9SG4J4kZvqgEETw9e3tn
	pVolqpxoRMFoc4DXJMrVsO6nl5QuUxwH6dBOXA6GGYr4MUJqHCazM32wmNmsempsXjBbg8Yy2QLYH
	XUbJPGSAh/oDqBnjfuOK0gELkKt/zLOy4bIX6nK5btpuNUPmxriPIf3KatNzJMhSLKBVkgGy9XehY
	EVZ2xTr71ngX8jLto3BZzeRVusYu2KTRs3a0QNU+9fA310M+YzmfM6PhvtzxKaHuX0l8VU0HEB87k
	GZ6EQ3wmzgToCSbA8Qmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1VKE-00AsYi-2o;
	Tue, 23 May 2023 16:57:30 +0000
Received: from mail-qt1-f174.google.com ([209.85.160.174])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1VKC-00AsXV-0t
	for linux-mtd@lists.infradead.org;
	Tue, 23 May 2023 16:57:29 +0000
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-3f6b20ad49dso11349681cf.2
        for <linux-mtd@lists.infradead.org>; Tue, 23 May 2023 09:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684861046; x=1687453046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cIpc2hkpfcX9ytnNlNra4xHWCIbNM5n2UygyBIAgU8=;
        b=Tbjbn7IeMLVL8GJFZlU4c0X3RTrBXlzSuuTWYsnPQHhWY86cG+IH+h+yJWIOVSSolR
         zeTXNCPhuX6h1DwXrqthddqCiPRuk9tabTEKnAe3tSP34Wui7PjnPruQ4Wx9dPJwo/G4
         O735/mzFJZ/OGmXoxDvEny6u9CeGJ6a3J9jsXKA6KHVTziDsz/9PTJHVYWTUazGXcH8m
         /l+2Llj0oGA3ehN2cw1cdvD08VOnOG6tE8SlEJWrbABRsjCwDAcqAeG8//3jKWkVpzBx
         N7kynM99xuyj1rHgaMCwGa8RyDS03itcUYHmPIuafkEF2oW9+Hn0nFuf/K7s4h/mFkkE
         Jizw==
X-Gm-Message-State: AC+VfDzVg4bBrTscPvHZiWqclKmo9byv+W7MKIlBesJCDDaW55TzyGMr
	RrPCwh6OYMHaumQEPOwIqrxG
X-Google-Smtp-Source: ACHHUZ6FTUIWRZ17w4sgstUiGYRBur4Ios77FwtNmNA/oETp74y448b9irsL1KV98Bhgct8ETOyo4g==
X-Received: by 2002:a05:622a:112:b0:3f5:3a79:f863 with SMTP id u18-20020a05622a011200b003f53a79f863mr23323837qtw.25.1684861046295;
        Tue, 23 May 2023 09:57:26 -0700 (PDT)
Received: from localhost (pool-68-160-166-30.bstnma.fios.verizon.net. [68.160.166.30])
        by smtp.gmail.com with ESMTPSA id y14-20020a0ceace000000b0062120b054ebsm2930934qvp.19.2023.05.23.09.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 09:57:25 -0700 (PDT)
Date: Tue, 23 May 2023 12:57:24 -0400
From: Mike Snitzer <snitzer@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Pavel Machek <pavel@ucw.cz>,
	dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 18/24] dm: open code dm_get_dev_t in dm_init_init
Message-ID: <ZGzwdLQz5IJUURCH@redhat.com>
References: <20230523074535.249802-1-hch@lst.de>
 <20230523074535.249802-19-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230523074535.249802-19-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_095728_309735_1446E82A 
X-CRM114-Status: GOOD (  11.47  )
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

On Tue, May 23 2023 at  3:45P -0400,
Christoph Hellwig <hch@lst.de> wrote:

> dm_init_init is called from early boot code, and thus lookup_bdev
> will never succeed.  Just open code that call to early_lookup_bdev
> instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Mike Snitzer <snitzer@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
