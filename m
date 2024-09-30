Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11F1CF6491
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 07:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9q26i5IxUOWLupC0/mAV9YzM4k2RXBM/uw2Rzpd1THY=; b=XvUM6yyvPbSXhn
	eCZUT5W/U0ApGPBP3J+h+bjoqmvPK6CGxsP7fNoagu19eoJj8IBjIvG1PFm3yh42FzP9whFRDrjRW
	5XRx8JB6UbvFeAFOC704X5vooSWc2Qi4ceHJCHFoCFuWmNoD/zG2p7GNEpc1DS2J9ksTnM8YVWWqi
	l08zSdb4WIh9eRsB2awReYTUT4UawUsBamQwpiKq/G44ZMAZBeC2NDiada/J6IQ3HkI5EwuCaGhG2
	OM0viDrwsgDf3AKJtTE8mKzqjNSZA4rq3vdI4/qUzbxiiA/Qi4JIxEEs7s9KyQ1x26v9UjUKGH1Bd
	MmPnU251zE6k+bUDfeZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svAg1-0000000G9Oe-1trx;
	Mon, 30 Sep 2024 07:18:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svAW7-0000000G8Eh-3d36;
	Mon, 30 Sep 2024 07:08:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727680101;
	bh=D25fOXeJbLoKGgr27NS29CleC8T4/PtWnoBorQk9jHE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=m8VXD7yaNlqpy+yBCJaX/rnIFHb9Ff0X59herYW2wRQiDBZuComAQE7Nd08D9KWUj
	 X1qfkL3m9FkjmZVWqCwtiHoxN1EEQlLInQMBmSA7fPiFTT/ptnmdKcexqWShW4YI4q
	 fGPU7OYFNlPr/wFURAl9W0Qk5Q8NN2XVivnir6afdseodqtp4EG0Au4MlY1ZXNoy07
	 dT3AnDK2i4SPXSFitEpiOqmQyDlRosqu4INj/bK0isX0MWlvJjkxNP7Wvr3pe4Xfcf
	 KD4PGqyXiNJWGq8Pl8MFb6juYPHYBieu887Fgdt4YO9vnXf8ZhUsVKYXXesW7WAOpa
	 NuJb2nsfRVvww==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3035D17E1003;
	Mon, 30 Sep 2024 09:08:21 +0200 (CEST)
Date: Mon, 30 Sep 2024 09:08:17 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: nicolas.ferre@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: of atmel_pmecc_destroy_user
Message-ID: <20240930090817.0a86e538@collabora.com>
In-Reply-To: <ZvmIvRJCf6VhHvpo@gallifrey>
References: <ZvmIvRJCf6VhHvpo@gallifrey>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_000824_105332_919275C4 
X-CRM114-Status: GOOD (  16.32  )
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

Hi David,

On Sun, 29 Sep 2024 17:05:01 +0000
"Dr. David Alan Gilbert" <linux@treblig.org> wrote:

> Hi Boris and co,
>   One of my scripts noticed that 'atmel_pmecc_destroy_user'
> isn't called anywhere; I was going to delete it, but hmm, I wonder
> if it's actually a missing call and leaking (in the unlikely case
> the device was ever removed).
> 
> It was added by your:
>   commit f88fc122cc34c2545dec9562eaab121494e401ef
>   Author: Boris Brezillon <bbrezillon@kernel.org>
>   Date:   Thu Mar 16 09:02:40 2017 +0100
> 
>     mtd: nand: Cleanup/rework the atmel_nand driver
> 
> and I see the allocation in:
>      user = kzalloc(size, GFP_KERNEL);
>        in
>      nand->pmecc = atmel_pmecc_create_user(nc->pmecc, &req);
>        called in atmel_nand_pmecc_init
>          from atmel_nand_ecc_init
>            from atmel_hsmc_nand_ecc_init
>  
> But I don't see any freeing.
> 
> (I don't knowingly have hardware to test a fix, although I guess
> there's probably one somewhere....)
> 
> Suggestions?

There's definitely a leak. I haven't looked at NAND stuff for a while
though, so I'll let Miquel advise you on where
atmel_pmecc_destroy_user() should be called.

Regards,

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
