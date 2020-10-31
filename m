Return-Path: <SRS0=Ys1R=EG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D932C388F9
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 23:12:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4FB82087E
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 23:12:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tXeYUju3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4FB82087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=youngman.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PX5LMAXiIkyIpuqPBG+SF04sSKE2lW1vq3+L1MlgxNI=; b=tXeYUju3CrEopV5CZQdHoe4nn
	Yj3592rCz9s7FubrnoSXcGhnX37UtxiwcXVxe8x0J/ASMaoM5/Ye6nAo7ZEOM5Bg1nEEgSG0SN6a5
	Cg36qjn2PAufZPNfr4A42cBUy+vQ4YcfhNKfJEkFEU2QHHiF9E8Lzx0KIWSHrJb0+Xnk7zYCLdY7S
	0Y86RgjFjChVg4FKbACvtPhaPU2BHU+D2HD/8yHwMreCNrrJGSWqC0kvJ6cFZObAX8wQP9ZEDOli8
	RvEp4lrywYqoXam4i+RPi79Dfsd5pnDIEqWyn01jSUuEDDYU6PvcwbQY040Jhajh1PxRI2MgnkT2B
	GwFimn1Ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZ01t-0002Kw-LT; Sat, 31 Oct 2020 23:11:25 +0000
Received: from smtp.hosts.co.uk ([85.233.160.19])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZ01r-0002KX-E3
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2020 23:11:24 +0000
Received: from host86-155-135-88.range86-155.btcentralplus.com
 ([86.155.135.88] helo=[192.168.1.65])
 by smtp.hosts.co.uk with esmtpa (Exim)
 (envelope-from <antlists@youngman.org.uk>)
 id 1kZ01k-000CBn-3t; Sat, 31 Oct 2020 23:11:16 +0000
Subject: Re: [PATCH 01/11] mtd_blkdevs: don't override BLKFLSBUF
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201031085810.450489-1-hch@lst.de>
 <20201031085810.450489-2-hch@lst.de>
From: antlists <antlists@youngman.org.uk>
Message-ID: <5170a536-09c1-28a7-c2fb-5381598194db@youngman.org.uk>
Date: Sat, 31 Oct 2020 23:11:14 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201031085810.450489-2-hch@lst.de>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201031_191123_512553_25EFE9AE 
X-CRM114-Status: UNSURE (   9.53  )
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
Cc: linux-raid@vger.kernel.org, Jan Hoeppner <hoeppner@linux.ibm.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-s390@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, Stefan Haberland <sth@linux.ibm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ilya Dryomov <idryomov@gmail.com>,
 ceph-devel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 31/10/2020 08:58, Christoph Hellwig wrote:
> BLKFLSBUF does not actually send a flush command to the device, but
> teard down buffer cache structures.  Remove the mtd_blkdevs
   ^^^^^  ?tears?

> implementation and just use the default semantics instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Cheers,
Wol

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
