Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2722ECD5BC8
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 16:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iGR7DG9O93/ulIVwLIxF6XKu0FZ7gRM8bxxdUbITYo0=; b=3ssCx+DwRWMH+C
	2Cd7lr7p9A3Z9pV2itmhOStguycXocRo4BCcU+9NLIHNsfHLq3XkBekLUtU3xdhEPGRrLRTgy442r
	l23sSKYL/S4mj+s5LxGflLkJNVtHwJoQ3VxFjXWCwtJKE+brsAWV1UwMnZea6wClL0d8Ye3VpZ6qa
	SEYU2ZzfM6cUyOvNZnMQXd8Vm0C0VkxoSMZ2GrotmcfFv47JeRN/t3TAi+eXY4b2Z/fSfpPqrh26O
	iDJ3lJ3hydVcGwQrSt/Hkt8A+WFXRlp7l7lFtXZdwClIYBOesnkTY+yNI2MIQahYKWiFbZwmQqQa/
	qMQY0Zxqvnbz/SKuMZKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRumX-00000002WxO-1A9d;
	Tue, 26 May 2026 16:37:29 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRumU-00000002Wvz-14o1
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 16:37:28 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-43587e63a8eso6808618fac.0
        for <linux-mtd@lists.infradead.org>; Tue, 26 May 2026 09:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1779813445; x=1780418245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbEyVDKYB6brZVOZVveRW94ChbWHXbhuaSGALUdMmOo=;
        b=HEL4T936s/nS5h0Z96ZhVfw+APwy1p0C5+kKXnev5S8aQkzRpqp/oasBn0WwiMOLGb
         rL/KYbvRtvHe+hmn1b5jgHs9Zn8nEmJ011we0Dd/dRYwCb3IxU/q2+vPIOw03wxS9XHO
         pvnIe3hGcX5sE5rtT0mV6MStCv9kpBS4bUDJGPCd5tKX7aISOIf3bSyFm9BqHu9q4LO1
         p+73BHAa50MIyRTU4e7xBlk3ldGLN5kaqvFmhHoEMMaTPxWb8ZFVIeG6MlBcjwkRIofy
         V8MS0OofcLSDfWoSme6tXEScxOJ9gTgMeDmf28Pwa5KqueXnQHzdLNqW5CN5NjCTHll7
         Ibiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779813445; x=1780418245;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CbEyVDKYB6brZVOZVveRW94ChbWHXbhuaSGALUdMmOo=;
        b=oy+l1w6i6ZXzanzmWS77i/uQxRVNR1PoTO9ncGFknM6huKyKtlojt5tROnG2D+y5y5
         2GKuTncf51Ez0q4vJeFFeqhEluCOFgz/D/yjEeEJTySqZ7QSjuLNUQDP83laY8F3PxpC
         jDKGzlDgdzE6VNd8AJlQBDP0ht3qXisB7XilHB/XelySe01fPLxZHmuE77R37qlJnLow
         wSxcuN4U0DMUSDJtNGyw0oZM9Sr+nmbYsQ2+gw4pYwl7V5F2/Maqw2bfFtbsEmZU3Es8
         zswCLKv+ME26bcN51mscDoLJKddoKO2+LI7GJLkkpJLEMK/ob7KXdOVWo//9IAWOpdz6
         Ru1w==
X-Forwarded-Encrypted: i=1; AFNElJ/tU7i5oe2MCK/qQXmh/qUMay1MW2vQJKV9YbsGwW6/gLEZCSt4sgXOFpEnjZdiChCupDuFtkhIQ+A=@lists.infradead.org
X-Gm-Message-State: AOJu0YxjeNlJNii8UKPw9X45f6KYVjYDBh6KZNYvfTUvVJ7237PoHwF/
	m3s8j/HX1/tV3YozpMDOUba036sKiaPDlBkivf5d32OGhvkCTxOikKNfXu+spkGSRt0=
X-Gm-Gg: Acq92OGqHzUG1+xL4DUKQI7QXNOfyUjgdaefp7CdROG5aVe5cRWSETz73Eggzlh+D5b
	7E2i6ntgVZkYO1W085YeAf3tEyMK8gabzHu4z0vcxWUT6n8MQmG80JKM9olsLovf5MDCMtry2rB
	l7b97xUXbcRj/huqkVhn/xjjhI2ASkOr8l+mNO2YJRCfZSz2eSFAWf12rct3ZsfoZ9wwil77rJ4
	AsMtTPazpPy88hsu4GK38sKva3u/Zjh0tdw/CvfSWqozhVDxYTRJe5FR2sXTXwED1ZriDA6Ck7O
	6pAnOnlt26Oxa3zBpSQtQUw5fPFZGwxBvqPibSV9HElQXG7C+ab2pGXx1AQAySz6kK2Cm9gcLXX
	uj3UpIR+299qOOdczuoU0LrAhPtX8olhLu81TmOFlUHW1ZRFFYgMJr+bnSlRMBJf2X1RaspDF3O
	WEPko5IIe+Nc1JgNcIsJeAq6JEcz9KIBYQXLrmofeKHu2eKWHJGZncZtpIWigp5v2pF8or4KUbh
	atC2k+eZ1KDhH0/K4kFNe4w
X-Received: by 2002:a05:6871:289a:b0:43a:5cd0:db00 with SMTP id 586e51a60fabf-43b5adb7a25mr12258063fac.23.1779813444777;
        Tue, 26 May 2026 09:37:24 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43b639fd7adsm13561265fac.14.2026.05.26.09.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 09:37:22 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>
Cc: Caleb Sander Mateos <csander@purestorage.com>, 
 Sung-woo Kim <iam@sung-woo.kim>, Josef Bacik <josef@toxicpanda.com>, 
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, 
 Benjamin Marzinski <bmarzins@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Justin Tee <justin.tee@broadcom.com>, 
 Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, 
 Paul Ely <paul.ely@broadcom.com>, Chaitanya Kulkarni <kch@nvidia.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Thomas Fourier <fourier.thomas@gmail.com>, 
 Al Viro <viro@zeniv.linux.org.uk>, Luke Wang <ziniu.wang_1@nxp.com>, 
 Kees Cook <kees@kernel.org>, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nbd@other.debian.org, 
 dm-devel@lists.linux.dev, linux-mmc@vger.kernel.org, 
 linux-mtd@lists.infradead.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-nvme@lists.infradead.org, 
 linux-scsi@vger.kernel.org
In-Reply-To: <20260523125210.272274-1-mateusz.nowicki@posteo.net>
References: <20260523125210.272274-1-mateusz.nowicki@posteo.net>
Subject: Re: [PATCH v1] block: switch numa_node to int in blk_mq_hw_ctx and
 init_request
Message-Id: <177981344077.464267.4670805396521914701.b4-ty@b4>
Date: Tue, 26 May 2026 10:37:20 -0600
MIME-Version: 1.0
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_093726_297435_E5409AB8 
X-CRM114-Status: GOOD (  10.08  )
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


On Sat, 23 May 2026 12:52:35 +0000, Mateusz Nowicki wrote:
> numa_node in blk_mq_hw_ctx and the matching argument of
> blk_mq_ops::init_request can be NUMA_NO_NODE (-1).  Declared as
> unsigned int, NUMA_NO_NODE becomes UINT_MAX and walks off
> nvme_dev::descriptor_pools[] on CONFIG_NUMA=n [1].
> 
> Switch the field and the callback prototype to int and update all
> in-tree init_request implementations.  No functional change:
> cpu_to_node(), kmalloc_node() and blk_alloc_flush_queue() already
> take int.
> 
> [...]

Applied, thanks!

[1/1] block: switch numa_node to int in blk_mq_hw_ctx and init_request
      commit: 65e1c8f96ad1a1f3b72e8a91d1341d570f91d985

Best regards,
-- 
Jens Axboe




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
