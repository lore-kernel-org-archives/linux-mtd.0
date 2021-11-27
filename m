Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188D7C433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 27 Nov 2021 13:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YFwdPIgnYOyXVzEGSVfo0p8G8EccaqAwjahwlTCzEAg=; b=P63wOHX43nyYwgyY6ZTwzBAR8d
	zzf6pQodylNnxPwaEWz9ek8YSOrm4tmEJzXX1N3+oh9NxPf0uF/wXI5HkzPxFIouHJFI1mBvg1LHi
	FkQ1+LcMhJ1Hrqn50DJycaN4Fnn4DqmOJ3ABlGZ+gB3jfUzxzGGvJQFZc1IdiTJbV6zgJ4Omapdo1
	BJK2X3tsO0YfV1zjDohmK4yi0emisG2pkAYAUvft8oUOG+e4mn5DA4oopyX2wBMz3Dqfu/WRmvWEE
	EHn8/vWInKWVAKVO//nM5wPjXZ25mPYlKrRwe4qbhWLhjLnfEay/3BqHPz5MXvq1d1WKPm3aAqNFy
	usiEjaBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqxwu-00DjCi-47; Sat, 27 Nov 2021 13:41:04 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqxwo-00DjCM-VB
 for linux-mtd@lists.infradead.org; Sat, 27 Nov 2021 13:41:00 +0000
Received: by mail-io1-xd2c.google.com with SMTP id m9so15055647iop.0
 for <linux-mtd@lists.infradead.org>; Sat, 27 Nov 2021 05:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+C1eCBisUZmPf4XwFZefJXfNuaIvZbpstQOMoYzueNI=;
 b=45LlVGpAa8ZJjwB+km986MoMsAsnUJcUqiqjUEWT0aM29S5ToBEi6XxhmYa5ZejUtX
 qaBOnXSkbku2NutcT2Xjb1O0Qss+sUqAMCs8tzgEkTjOpJGlEgr3+gxLvSCpz7LM/YyA
 ahmPWm9IR+GjUEwNuujbdFUR9s21wbDOVcTOYIKG6Gkslc3nRv4GvAviUqoa1aq0Pt43
 uoGsgp+0V6KZ85RaY7NdXoF85GCfIRmEH+2UeZ2SUZX1sYPpiaBUC/PqN0ObC/kbnj1F
 tOzkUrJB9ab7Ph7krGxN2SDedltJ8jkKgvY00sXTrkAjpJ2vqE9xFkOUR1pGQCCcZ03C
 J5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+C1eCBisUZmPf4XwFZefJXfNuaIvZbpstQOMoYzueNI=;
 b=ZOKtxZBcUgoa0qgDF+MJmhN+QvqhvH4SWx7KkXvc0E7FBIcX8S+RwH+Ai24gQA0YqO
 n0RyXxdKO1s/i2oOL1yDy0Fn7B23oJ0TY+H22b87a4neSPZpHQTOAMq8VFYojtC2XVWA
 l7nz3Ojy7Q83ARNMrUUzlncKYmSGWtcu55fYEbgnkmeR8RraxuTy2Mpaj5SOc9Q5Yi8y
 7xXkfoKj2BFvAsxy9lDM51msNRKBP2XTOovFXLBCU4NS0oKGr2iUiJhd4wsNbgAU104G
 PutaZk5z/iSnLxx6zFtBDascDMZA3Nx3NNyhlrpu26pkhSPZxlhPrgquugW5xHXLgUsQ
 Rnag==
X-Gm-Message-State: AOAM530EbxD/Rm39JZsklYj2d2lH05FT75/LIGrv9jvGT2UoxyFihoQP
 pigIAEsmNvl3uuUrft66TR8UpA==
X-Google-Smtp-Source: ABdhPJzLny7SclSJ9Z+WRYPXp3qdAuXW2pq8fNtaLFr9DrbDz5Q/e3rkFakNK9qDd2AZQF9VQB1f1w==
X-Received: by 2002:a05:6602:1513:: with SMTP id
 g19mr43361702iow.31.1638020457843; 
 Sat, 27 Nov 2021 05:40:57 -0800 (PST)
Received: from [192.168.1.116] ([66.219.217.159])
 by smtp.gmail.com with ESMTPSA id y8sm4690925iox.32.2021.11.27.05.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Nov 2021 05:40:57 -0800 (PST)
Subject: Re: remove ->rq_disk v2
To: Christoph Hellwig <hch@lst.de>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-block@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-scsi@vger.kernel.org
References: <20211126121802.2090656-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <ba3ceb5f-009f-c679-91a5-7d70b0588d02@kernel.dk>
Date: Sat, 27 Nov 2021 06:40:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20211126121802.2090656-1-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211127_054059_083849_70C552A3 
X-CRM114-Status: GOOD (  12.18  )
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

On 11/26/21 5:17 AM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series removes the rq_disk field in struct request, which isn't
> needed now that we can get the disk from the request_queue.

Can we get an ack/review on the SCSI change? Would like to pull
this in.

-- 
Jens Axboe


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
