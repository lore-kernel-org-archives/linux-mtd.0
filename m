Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4FCC27C65
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jun 2024 16:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cm964lyQ3RXbz7yIZpF/bpFPsTsm4R6yX3D9Wz4DFyw=; b=tQSt1O4x6IyXa4
	BxzmfpODkJCKwaZN0vTj4ftHlnlWCGO6d+XDwxbyDy+JATYCogNXUTRcPE66zaaa+dBlTvnXrJyx3
	cMZQrOULrX0p9NDHtjI+WJPn/5xoWzrTjK8vAsU7fXfmJSnZlVSPtuEBsEZxZjAc2Yq+tUDIuSZPd
	6SIPHnY01Oz1vsGGTNKNdUAWPhaxX0TqmtGUt634hDe2GeNnJijOVWoEYEpHOF6uipgZsYyitqhZu
	clGeHeNG/LhXJtGfS/+wSgojo4Lrg2tR1+NhmFlRh1wbfRJ8+FXvYbtmtjJ3KCeR7fV8jS5j+0F4j
	5j7QLCY5hsT/ggweuFWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH4i7-00000009Yz4-2niT;
	Tue, 11 Jun 2024 16:51:03 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH4i2-00000009Yw5-0X5i
	for linux-mtd@lists.infradead.org;
	Tue, 11 Jun 2024 16:51:02 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-dfde5ae0aaeso302305276.1
        for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2024 09:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1718124657; x=1718729457; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k7qH/Egkqtc5OmSCKcG8suDn1pwScsKWRQ+gioBgKgY=;
        b=nfUswMfi4SUV1LjvJjOXWH2ch5kJBi9zUgkufgiAOl8bKs+UiBaRE0c5edzcYTMOr3
         ZLl5Bi3nSq2ZanGhbzvB3NWhklgkrVS9mUNjyXvgUYlx6s/zmK0Sd6yMmlDqoHxBtKQH
         TfcTxJIs/b2ut+MYXsSPYQHfoGFhfd4SyROBR16JjeJR5OgsQ/rxd/9YGM/mokXSbiMa
         1KUBTDgaNQEmrt7BpNuxbqTI2L3wmU18iqnZBKgWafyPWp3lswviex92t4wedp/z+GcT
         QAy+mhOFs/rTY/VRcnf2EDKX38lFgUp2x299OtR95TS3YRO4jB13Nb+1pQPYHCtl9lMd
         E7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718124657; x=1718729457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7qH/Egkqtc5OmSCKcG8suDn1pwScsKWRQ+gioBgKgY=;
        b=Yqt+ioKOc01YDSPNSzIPkxTkMFg/IQJnwhIvf9yMC1vTk//Fn/Luj+oHAFghGevXyu
         ejk2kxRPt2ckP74a/bJr9CwwGOCzwh5PviJc8vl4Pr3gIaF7FjONEWstPP+Lc4yKzO8u
         I0THHMR5VgAd/Dnfw1zyuQgKaK9AIkix10a1p4RAIutC6S4VNwFTvB7AYzAC29VploYV
         TQGI4yHC5wo8/h6w3FxrydE+x+C9a77ug5mtySHpVvy3T5fs9E9JJCMSGt64hjt7B8YG
         lMgaJ5havlcVYPMjDOdBPFAU84/d8ZkJ8mfP0N48F1QwL3SS5GN80wzSkO/r4HIa0TKk
         H+VA==
X-Forwarded-Encrypted: i=1; AJvYcCVuSjgVO7viPQDwMC9VjwPFOJ0Gm9XJHPCAlEuJChJMI2castcCQaYxaXmAkNJOR1w6oHDthHzAyFJ4CaKeiDwgl35AIZb2ifU/ORTRYQ==
X-Gm-Message-State: AOJu0Yw4tgVW/gVRYz6wyACqCoIx5B3f3WIPQJvr0SjcnQw4bT2HkNfC
	VRGOmcBOhMsT8XHV3FGTrbHfZeiGx0antHcd+4cWZn/acwYHvB/dIu57cjGW4AE=
X-Google-Smtp-Source: AGHT+IFLbNcRGoXteJvsvQz9ePKtTqtffGprFSIVvQoC+S7q0aJ0DFFhhqHjAFy+KyUVXYjD8ktBew==
X-Received: by 2002:a0d:d851:0:b0:618:95a3:70b9 with SMTP id 00721157ae682-62cd565129cmr130634777b3.36.1718124656832;
        Tue, 11 Jun 2024 09:50:56 -0700 (PDT)
Received: from localhost (syn-076-182-020-124.res.spectrum.com. [76.182.20.124])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62ccaef2825sm20935207b3.139.2024.06.11.09.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 09:50:56 -0700 (PDT)
Date: Tue, 11 Jun 2024 12:50:55 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Ming Lei <ming.lei@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
Subject: Re: [PATCH 09/26] nbd: move setting the cache control flags to
 __nbd_set_size
Message-ID: <20240611165055.GD247672@perftesting>
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-10-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240611051929.513387-10-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_095058_193642_E264E77B 
X-CRM114-Status: GOOD (  10.59  )
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

On Tue, Jun 11, 2024 at 07:19:09AM +0200, Christoph Hellwig wrote:
> Move setting the cache control flags in nbd in preparation for moving
> these flags into the queue_limits structure.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
