Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDC6C282DE
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 13:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8hm0UHBxmy3/AgJ7xZWdrW9WmaGN6B1ank1ojS17lt0=; b=MNPh2MOnF8cPR7
	J1qqsiN3qv4tj20zq7G4cbl0USEt1ZwCmVl8Wy/AZiTbONvlGzqCE7Deni4Xj7lrsvglU9K3Kqdc2
	VOsLBLPil+OL0OS7s9NVZ7EHoCF0igr1IYSt8lEMUHvYpbsvvtOYufBlzsqfRV0hpqJFQygkO0GVV
	lewZ3s7pyMhNETy9P15JSeFsABvv0QKuYQ6J0D5xdmJZAlMl0kqKJcv3m64OgbuTSs7LRpABF4Iuu
	i3OE5pPscSqgHEouM9oB29TWL9qJeNefJiO2l8xHcB3iu3QUx3ZPPsxtl1hg0jawViQWVd8oLwCTP
	IsJcv1cXHXyF13o5Icdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiZU-0000000BNl1-2p8i;
	Thu, 13 Mar 2025 13:26:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiYI-0000000BNX4-0kxc
	for linux-mtd@bombadil.infradead.org;
	Thu, 13 Mar 2025 13:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5PLsvEgnbim2yotRJtm3RxSyGerYXasNwsqr+/KVpS4=; b=pnQwXjrdSemCrpI3BOL5VeIbDs
	ZyScexNe+MmkkbbGar8WGz3CbpAMtCcprzB2rRaKAZmz4LEU90RU0uGcZRWt1cgudHpDMby/XVN1a
	0+fQ5Y9zJaPIDxGWCKLJRqAkqYL9yGZKkV70xIosWbi3ztxqyZHSqL10d+2pEK128cID5GKdb70qs
	nfAPvx2U2RuMUSTMhIpTbnRExXHHjAfOb73itNSTehloNpShD5j6xrgdi0kDEqWsoetNvzb5fSGDZ
	BVjmD5dXRiU/OBEiSTh6FO4Mu8C79LAcBTLkPBOTEumubr2k2+INoy1itPAA84v9zOAXFBJTZHfWk
	E4HbXsJQ==;
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiYE-00000002dmc-3ymP
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 13:24:45 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-85ad83ba141so95368939f.2
        for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2025 06:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1741872280; x=1742477080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PLsvEgnbim2yotRJtm3RxSyGerYXasNwsqr+/KVpS4=;
        b=FHH3rBu+c66uuJfWnEdUur9/6DS4maRNYuMb2tphYFIMjMg68aB21Ml/uX1RjiNpPA
         GpTd44KCarD+aY32/KvY73M+5VgR0Bqx4CW4vR/ZVzHSsuXId1xp8SyrpNH4FwplUIX6
         bDVTfumxVSMqDafe+srQLfdl5zI69jfaXe/bm8K5ZrCS2zXzSAAntfJLxNyb/xFUTvH6
         vvpxFrh2z6h0RUS4/aiOGL+yC84weviFPytOfUMnWsEd7EZ+vPhH3T+iwhiZgyS63Rv+
         Rc208hMd7EW7wUe0zd+sOTQd9nhKZtzjVwvby/2s+l0IzxJoXj3Nvdm+CS4wYMyt9J4C
         K2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741872280; x=1742477080;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5PLsvEgnbim2yotRJtm3RxSyGerYXasNwsqr+/KVpS4=;
        b=OFZEbekR0aGnRoo2BVnpaUjhzi8DOEzEBRhojMD1xQ8jLtTB/WMtxlNihlCqCZylHW
         cdSuGEkVJ/MkXpQdqQG803IkJX7odvXVmZr8+hGXpPn46+DAA3jHXrrvaSgqab4aSJkO
         dm+PNsB/1a8nVy/FcbWOGmfRXiz/69NtRSbXh0AONTT4VGA2BuoZqcjka2znFMBF1Kl4
         jvPWB5YZCcy7IjdVaJmHrVRzcS1TwpbA6pjXLEwuW5YJHVoQ/brdzjwKNciiyzqEt1SM
         dfj1g+punBDHhG6MTMNDY2F5VOjLQzinsBsxNxl/kPA+f/UuEzDGM0lEsPxszaFhl91/
         DOvg==
X-Forwarded-Encrypted: i=1; AJvYcCVtfdsUIW0QGTqgtTpP9xpOYg//2+xwL3n0YGMTnb0tXFXkvolcGPvcjleOb5pb1yJzt8VovFDfHyE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzjIbv4KzplW90EJ72kHgMGsj3MjCb1tWPdPf87h8+FM06IkwUf
	/r42hV7Lkvw0iY/ffq08974jXCeRcUFIzbT0XmBucb+d2xz3qBZBew01gm/fMeR7ZJuAPcr5Epo
	F
X-Gm-Gg: ASbGncsI6ZfWGsxt9CTVqthr17nnA6u7PP3UIZe9exYfAwOF+Knn7NkFgXNzR+Gl3Xo
	oSSQ3MVAG8K+Mw0+j5LnEPtmvda3XZ5mwO+pEUSuMlbQytjTevcoReWiCrRuSTEhxbHGWEzX4Zz
	SVVw52j160G5PVnPOKFfolxAKKnWOd1Ihmon9iXRCwwuQv3oLYab1swiIIR7QxPR+Mj67eGN5bA
	QylwE9sBKb39clq7Nx2Djuh/44Dzxb2UVa+cpiJAe6VhXQBVKOBSjXpOnfDPCtjVWvqgDma6QEo
	V1Pl7EG6AAV0k6meLKrSS8MNF7BQ6l7h43w=
X-Google-Smtp-Source: AGHT+IEer637uehs/daevOydns9iUer0NF8/Lop3Ui7LDoPjH6cMpb131IF3qkXQqxQNFL57dNEHAg==
X-Received: by 2002:a05:6602:380d:b0:85b:5494:5519 with SMTP id ca18e2360f4ac-85b54946d71mr1891701439f.5.1741872279762;
        Thu, 13 Mar 2025 06:24:39 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85db879e512sm31580739f.28.2025.03.13.06.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 06:24:39 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: "Md. Haris Iqbal" <haris.iqbal@ionos.com>, 
 Jack Wang <jinpu.wang@ionos.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>, 
 Zhihao Cheng <chengzhihao1@huawei.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, 
 Chaitanya Kulkarni <kch@nvidia.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Anuj Gupta <anuj20.g@samsung.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org, 
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org
In-Reply-To: <20250313035322.243239-1-anuj20.g@samsung.com>
References: <CGME20250313040150epcas5p347f94dac34fd2946dea51049559ee1de@epcas5p3.samsung.com>
 <20250313035322.243239-1-anuj20.g@samsung.com>
Subject: Re: [PATCH] block: remove unused parameter
Message-Id: <174187227786.18244.14269218969550436496.b4-ty@kernel.dk>
Date: Thu, 13 Mar 2025 07:24:37 -0600
MIME-Version: 1.0
X-Mailer: b4 0.14.3-dev-7b9b9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_132443_376293_4977F2A1 
X-CRM114-Status: UNSURE (   7.94  )
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


On Thu, 13 Mar 2025 09:23:18 +0530, Anuj Gupta wrote:
> request_queue param is not used by blk_rq_map_sg and __blk_rq_map_sg.
> remove it.
> 
> 

Applied, thanks!

[1/1] block: remove unused parameter
      commit: 61667cb6644f6fb01eb8baa928e381c016b5ed7b

Best regards,
-- 
Jens Axboe




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
