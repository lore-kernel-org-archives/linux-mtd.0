Return-Path: <SRS0=zrsi=EJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61FBDC00A89
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 00:20:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 086E722268
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 00:20:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OabIdmnU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 086E722268
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3IH6Dlh0JmQnUKAwaGAxqW74z7JoSzYb6nCnOSBrRks=; b=OabIdmnUzuE2R8f68CfTBEDGg
	0iu5TNT183L5ukTSikD1YwqT/z8SoF3L0qcR+xfQ//DGcR9kQ8fM18T/hTI9YBWaMh4n4NTMvQsLW
	0T6prlxKwZKnQ8QVzcUlbTxUNTD+x3cCfXwJCvI+DUxlQaSO1eCcXuUfRJum6kHk/YjowejOAvs2G
	s7wXYL343iBZ9oPZAU48lZMAMD/gxHdUsVGxdA41m2uAh/l0ZMetbNMr7cG2l16tz8w5eKMYfwtNn
	wbV/HeVc54dE5Yg3absAP8Mnu8aCNAzoymGLNsxVd7+GdZcY1r3dddUy/fvHPIuu1B1FkWcEpvVxj
	HJdTnUteQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZk3E-00007B-Gn; Tue, 03 Nov 2020 00:19:52 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZk3A-00006H-Nm
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2020 00:19:49 +0000
Received: from 1.is.james.uk.vpn ([10.172.254.24] helo=malefic)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <james.troup@canonical.com>)
 id 1kZk2y-0003dl-1M; Tue, 03 Nov 2020 00:19:36 +0000
Received: from james by malefic with local (Exim 4.94 #2 (Debian))
 id 1kZk2w-000Zd6-Vj; Tue, 03 Nov 2020 00:19:34 +0000
From: James Troup <james.troup@canonical.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 06/11] md: implement ->set_read_only to hook into BLKROSET
 processing
References: <20201031085810.450489-1-hch@lst.de>
 <20201031085810.450489-7-hch@lst.de>
Mail-Copies-To: never
Date: Tue, 03 Nov 2020 00:19:34 +0000
In-Reply-To: <20201031085810.450489-7-hch@lst.de> (Christoph Hellwig's message
 of "Sat, 31 Oct 2020 09:58:05 +0100")
Message-ID: <87y2jjpa09.fsf@canonical.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_191948_902003_249FC11B 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 Jan Hoeppner <hoeppner@linux.ibm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-s390@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-block@vger.kernel.org, Song Liu <song@kernel.org>,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 Stefan Haberland <sth@linux.ibm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ilya Dryomov <idryomov@gmail.com>,
 ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Christoph Hellwig <hch@lst.de> writes:

> @@ -7809,6 +7778,36 @@ static int md_compat_ioctl(struct block_device *bdev, fmode_t mode,

[...]

> +	 * Transitioning to readauto need only happen for arrays that call
> +	 * md_write_start and which are not ready for writes yet.

I realise you're just moving the comment around but perhaps you could
s/readauto/readonly/ while you're doing so?

-- 
James

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
