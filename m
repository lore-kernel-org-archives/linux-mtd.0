Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 584B2C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 07:52:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E4D5218A3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 07:52:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oiVuOXpo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xuSB/G2F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E4D5218A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0PSh3byNIq5hTBR0IlunrsIavkCi04w6xgUoirJj1MA=; b=oiVuOXpodt0d58
	S9xHqMwMRHapo9hHi4gCplErzRWCrg5DoiYdZjH6c1yxPWcBHFZOQ4cfAWMYwCMfAV2kc4nrK1GIC
	eBit5I+squLa4PKQCpJsYa5HyIxHZEh72AFv3kibe+/6P0QdI8vL1tw+Nzc5pIMm7Q++3cZfOte3l
	U0UZPvvHvvMqW7st7Bao1iBeTBae7K80fLwLnu8l0ccaVkWDfv64gdo5xgc8fUnkDM10QiMGTqXy4
	xznjLk6lmU9CW9591a/i0G3R0LbDyRS0xygBVIoBFihAZmmAING2ZZATTjPIR3d8gJpzMkBr/Gpiz
	pIyqj3t+YhBXzmrDUx+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmZol-0004QD-H0; Thu, 24 Jan 2019 07:52:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmZoX-0004Fc-81
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 07:52:48 +0000
Received: from bbrezillon (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4854C218A3;
 Thu, 24 Jan 2019 07:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548316360;
 bh=qGnW0jLAuiuJSL/ABckGgMOD8uJiJr8jDYefYNDz34U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=xuSB/G2FOs1ILwonpv3qbvybKt2zwzNeNecs3z8OAsBS2h0+QHoZTc2Ilntz4o6ft
 K2DalxMXwN9AF6QUyJBk22JeYCQKSr1T1Rh4kQ9n/nTvSeav8DJywvieE7E/ttgBRt
 Y3+khSbIFcPmH8PpRZAKo0hB67zOIYtuzhgtPHU8=
Date: Thu, 24 Jan 2019 08:52:31 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UC
Message-ID: <20190124085231.6f9ef74d@bbrezillon>
In-Reply-To: <0786ffac-ec46-f924-002a-5324c76bcb89@denx.de>
References: <20190122145632.17547-1-sr@denx.de>
 <20190122175346.602894e4@bbrezillon>
 <263cbd32-b7d4-e440-c92d-4f24f5af27a0@denx.de>
 <20190123085202.0db528ac@bbrezillon>
 <870af691-e8d3-cd91-5a55-6478ef885446@denx.de>
 <20190123095504.7857ca34@bbrezillon>
 <a350a884-f531-353d-31bc-d51be8f6eb83@denx.de>
 <20190123103512.722095cd@bbrezillon>
 <adedc307-dc10-3200-84fa-36313b858dbf@denx.de>
 <20190123122514.0db87887@bbrezillon>
 <4f630269-5562-b795-63ca-92989d6c5059@denx.de>
 <20190123132249.2e7f65a2@bbrezillon>
 <358c78d9-6507-3998-a065-ddd18809d02b@denx.de>
 <20190123134050.7efe59a6@bbrezillon>
 <20190123135735.358fc9a6@bbrezillon>
 <0786ffac-ec46-f924-002a-5324c76bcb89@denx.de>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_235241_509901_28214DDF 
X-CRM114-Status: GOOD (  18.08  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 24 Jan 2019 08:35:32 +0100
Stefan Roese <sr@denx.de> wrote:

> On 23.01.19 13:57, Boris Brezillon wrote:
> > On Wed, 23 Jan 2019 13:40:50 +0100
> > Boris Brezillon <bbrezillon@kernel.org> wrote:
> >   
> >>> This definitely does look better. I assume that we are we on the
> >>> right track now?  
> >>
> >> Yep, and it confirms the ECC caps => 8bits/512bytes. Will send a proper
> >> commit for the fix I did and Cc you so you can add your
> >> Tested-by/Reviewed-by.  
> > 
> > Oh, looks like a side-effect of migrating to the dirmap approach
> > (merged in nand/next [1]) is that this bug does not exist. Can you test
> > the nand/next branch and let me know if it still works?
> > 
> > [1]http://git.infradead.org/linux-mtd.git/shortlog/refs/heads/nand/next  
> 
> Unfortunately this does not seem to work. I was unable to boot my
> platform from this branch directly so I rebased all MTD/NAND related
> patches on top of the latest kernel.org tree for this. Here a log
> with this version (new error this time):
> 
> root@mt7688:~# ./nandbiterrs /dev/mtd5 -i
> incremental biterrors test
> libmtd: error!: cannot write 2048 bytes to mtd5 (eraseblock 0, offset 0)
>          error 5 (Input/output error)
> Failed to write page 0 in block 0
> 
> Here a log with nandwrite errors:
> 
> root@mt7688:~# flash_erase /dev/mtd5 0 1
> Erasing 128 Kibyte @ 0 -- 100 % complete
> root@mt7688:~# nandwrite --input-size=2048 /dev/mtd5 /dev/urandom
> Writing data to block 0 at offset 0x0
> libmtd: error!: cannot write 2048 bytes to mtd5 (eraseblock 0, offset 0)
>          error 5 (Input/output error)
> Erasing failed write from 00000000 to 0x01ffff
> Writing data to block 1 at offset 0x20000
> libmtd: error!: cannot write 2048 bytes to mtd5 (eraseblock 1, offset 0)
>          error 5 (Input/output error)
> Erasing failed write from 0x020000 to 0x03ffff
> Writing data to block 2 at offset 0x40000
> libmtd: error!: cannot write 2048 bytes to mtd5 (eraseblock 2, offset 0)
>          error 5 (Input/output error)
> Erasing failed write from 0x040000 to 0x05ffff
> ...
> 
> Any ideas on this?

BTW, what's the SPI controller connected to this chip?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
