Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72BB4C388F7
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 01:00:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2BA620782
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 01:00:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Axy3Ud5B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNpnrV7M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2BA620782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BfdKVXXmPXuJH37T/zRH4iUXzIYhY6K0GlkCqvnZavI=; b=Axy3Ud5Br+xOzcqzHcSLhx4b0
	G5ex/A/KgeRWweZwz7aVX7WdbzvS6Xe3UA+5po05ETrwuS0f8NLqWP9Ctfxa1ns15nG59af8eCfMq
	rN51zk+DSHx6A7k0IvOKfNzdiybyiU8HTAd2qcmTbPQqF2EOTx6eOpi+WqJCd9FiZtvAi/bLK1OFe
	HSSs5ICK/fHJhdJdFP65OYk532pa8In1fvVUrXFd0TI8FambQ6/ypn0trnRIFIcErrPjspGOhcIuM
	lPxu3ZynDq9dDfs75TJDxgoapR9jmzlhLEq1SsH3j54QFHM9TsKhGDv2x/pWVW1owJj2YDMjyOU0K
	rO6gf0x7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaq64-00057K-3S; Fri, 06 Nov 2020 00:59:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaq61-00056d-Ey
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 00:59:18 +0000
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8459D20885
 for <linux-mtd@lists.infradead.org>; Fri,  6 Nov 2020 00:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604624355;
 bh=7ZEnEByVc0R517QJnXpcoY8tP3coLZ3Q0yNiPZUgtgg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LNpnrV7M/iN+V4ujDAzN/T3tay3OStPr/YwN3bQLZEZRpTgr0YhvNN4iBgBUJLUf3
 Eyu6tRaITH92HSP28KFJe9mve+CEskk+7qXQLpjeDebpDpVOQUSpkbvXaaONO39bxV
 IJUM6BAFBL4N5Ww5w31SVrYbaTEzjrMQ+XrSEDIA=
Received: by mail-lj1-f180.google.com with SMTP id m16so3548693ljo.6
 for <linux-mtd@lists.infradead.org>; Thu, 05 Nov 2020 16:59:15 -0800 (PST)
X-Gm-Message-State: AOAM533KYHr38TuJlYxT7vY2tWPAvdkX9PtkuWPHUQbyB/zfrL7dYbxa
 MQ+QgUo6dXVjMZ2Qd3RCWmLCVw8PYZIA4dwkl8I=
X-Google-Smtp-Source: ABdhPJyXOcSc3bNtfvoEDL2fsq2W1tQrSuxExDjK8UvdpyheAJjMXI2e+jMAtLr0Lt7iM9E9hRacrnZUBqM91DJOAeg=
X-Received: by 2002:a2e:50d:: with SMTP id 13mr1899629ljf.41.1604624353730;
 Thu, 05 Nov 2020 16:59:13 -0800 (PST)
MIME-Version: 1.0
References: <20201103100018.683694-1-hch@lst.de>
 <20201103100018.683694-6-hch@lst.de>
In-Reply-To: <20201103100018.683694-6-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Thu, 5 Nov 2020 16:59:02 -0800
X-Gmail-Original-Message-ID: <CAPhsuW65Au-wJJo96KF0J3drdriCqHZ9Oa3=bfjfspV3tKByrg@mail.gmail.com>
Message-ID: <CAPhsuW65Au-wJJo96KF0J3drdriCqHZ9Oa3=bfjfspV3tKByrg@mail.gmail.com>
Subject: Re: [PATCH 05/10] md: implement ->set_read_only to hook into BLKROSET
 processing
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_195917_581829_600DEE08 
X-CRM114-Status: GOOD (  12.03  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid <linux-raid@vger.kernel.org>,
 Jan Hoeppner <hoeppner@linux.ibm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-s390@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, Stefan Haberland <sth@linux.ibm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ilya Dryomov <idryomov@gmail.com>,
 ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 3, 2020 at 2:13 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Implement the ->set_read_only method instead of parsing the actual
> ioctl command.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

LGTM!

Acked-by: Song Liu <song@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
