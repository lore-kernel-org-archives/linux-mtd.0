Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFEDC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Dec 2021 16:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LECTge1ZnDk0BA7gWd6hjfdj9Q2kNaI56cOZDzQ3CLU=; b=aZrbKjM7EldDVh
	3ZibNfGU4xNTgl4oooEtVncBDPoa6nnqiG6SlTVNEsndS3JoNuZJUSg994hEoSWdmSuSpGIVrfODX
	03l8Wo0xN6ATUtLB+kuqsXMHZjoH9Ls/TrACt+CUQVGwQGro4PT946PiJEjCC+DLj1LmesukzG89x
	FwKJyWW8Tesy7yPEbcqyDjvPdopvGnK5lcRE7Owrh8+IQr7JtXahijPCYjk9/AQ1qQmsq9R8iR37E
	tVbcUrFdPKJJxowcpZPItzxoBzJfa2pNSIhsZUUUVT7NSUR+9x7cPus5DA9IbGDaSNSIPNvwAdyJq
	pN/xiBWR0vcSgsduE0og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muHA3-004qzl-Bv; Mon, 06 Dec 2021 16:48:19 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muH99-004qaT-RG
 for linux-mtd@lists.infradead.org; Mon, 06 Dec 2021 16:47:26 +0000
Received: by mail-io1-xd2e.google.com with SMTP id b187so13634264iof.11
 for <linux-mtd@lists.infradead.org>; Mon, 06 Dec 2021 08:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:in-reply-to:references:subject:message-id:date
 :mime-version:content-transfer-encoding;
 bh=/0SXgGX28/0RTN9QU/DsVtJokxlTQv3WbGSp7DGmXk4=;
 b=vFQjbp94JtKeOaM/W9yQ5MY4cFN7z0qA2qA2iJRdW07pfEvtmD/kzxr3XwN0QTkDhJ
 daZkRrl4YOK3MV6id76gF4QeaRUv8z35S5stpG/Wi0po2NMTBELs01zHvhs08no3ySY8
 YwywKRobhW1iRMqYsUsM0Ce+6+JM1tpQ4CK8s26d5eemYcpUQriAs+C86+FXdfWQMLc2
 mGDUtvyvBg1PQdVoE24+SCnizqVNYJJjRSz63HmtwVyEH5/3P2wnuqMxZGVD9XpCVDXl
 nnHfvuCiAqca3AA26dY6hJQbnZLjFYDadLZsKozq9CqnnQWYGMgDQtmDU14ndMXDqSsa
 prJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
 :message-id:date:mime-version:content-transfer-encoding;
 bh=/0SXgGX28/0RTN9QU/DsVtJokxlTQv3WbGSp7DGmXk4=;
 b=Y+UTI4dISAAhN5dCr5GpbOaLDp9BMwVB+8uoXntjOQKgFMwCt0t4O1TYp3vkozYlCH
 c29rpq7mVHR+f/4IfvPWVAdC9XY2lnXqelVCltH4XJ3Mw1EDVzbOWdpBwtzxjhxlVAKQ
 ZPRPMu15MQzMEQO5hLEtBIsQHAKcq28BGXYvPSNzbnyjksItOfYjKIt2w9qjdMqAw9uo
 ykPoiXS69nzQ2Y9TrHJ9UXFlLR2TiZuLvNXRBeGyBQBJ5JpRob9CLThycyVE1/kBsnOw
 R7an3Qu0IcnK6+6jRI1FOvJ4gDtpduRebUmSyYko4m5KaP3+6Ql4qRUUqjlw6cLvYoSu
 n27w==
X-Gm-Message-State: AOAM5329P4xJpwNm8LMwhFvbNmG2Keb7t00dCt9ysF75Z2j82+O4K3IV
 YA9KDEMS38BMvAA3iUv5WIb5uuofh5duy5Ik
X-Google-Smtp-Source: ABdhPJxPuaBBKCW2wE1RbRqHqrMZuoqdQw4DulT5czheg7CyIsvbAohHPYPb+2Y15IHcw3V3ctPJ/A==
X-Received: by 2002:a05:6602:2f11:: with SMTP id
 q17mr35828341iow.75.1638809242834; 
 Mon, 06 Dec 2021 08:47:22 -0800 (PST)
Received: from x1.localdomain ([207.135.234.126])
 by smtp.gmail.com with ESMTPSA id q12sm1289618ilo.60.2021.12.06.08.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 08:47:22 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: miquel.raynal@bootlin.com, Christoph Hellwig <hch@lst.de>, vigneshr@ti.com,
 richard@nod.at
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-block@vger.kernel.org,
 linux-mtd@lists.infradead.org
In-Reply-To: <20211206070409.2836165-1-hch@lst.de>
References: <20211206070409.2836165-1-hch@lst.de>
Subject: Re: [PATCH] mtd_blkdevs: don't scan partitions for plain mtdblock
Message-Id: <163880924220.67311.13119218479398937498.b4-ty@kernel.dk>
Date: Mon, 06 Dec 2021 09:47:22 -0700
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_084723_931580_EA15A4AD 
X-CRM114-Status: UNSURE (   6.06  )
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

On Mon, 6 Dec 2021 08:04:09 +0100, Christoph Hellwig wrote:
> mtdblock / mtdblock_ro set part_bits to 0 and thus nevever scanned
> partitions.  Restore that behavior by setting the GENHD_FL_NO_PART flag.
> 
> 

Applied, thanks!

[1/1] mtd_blkdevs: don't scan partitions for plain mtdblock
      commit: 776b54e97a7d993ba23696e032426d5dea5bbe70

Best regards,
-- 
Jens Axboe



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
