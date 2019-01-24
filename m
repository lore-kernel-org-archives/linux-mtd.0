Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 203A0C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 08:34:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E38AE2184C
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 08:34:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FakgQ25r";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zqCu83NI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E38AE2184C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nRf9widvzLF9B04fRi+nk/bD/F64e0dcI+1vCbv8BeM=; b=FakgQ25raoNolb
	TtYJp68y3AFuaxRDWs/AD/nC0AtW/DrfvW47sqvCHmW1zYuFYrFXvV656DGvwsOSFadLQfSnVUz1V
	ya4pajhIC4D/V0yeciyx7Ook53yYvtXI0ndAYOqmmLn6hJ1n5ZuvWnUhSDovKsqfm3oeBjaxYbCNW
	Xcb2iUqnt+gtlgRDSfP9G9DXDILtKeCDrqzAFEjjxU4+k4iBYaPaxO0nUunWj60ex1M2HNeKxdqZ+
	p8ovVDRTU0ewYAN5cwsTkPtZP6SNbmibReJhP1/8wi5qlgda7zNzN1LRqArfwoA3HM1yfWDLafNwz
	vV0oJd8nXbblxdkyUe5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmaT0-00014e-P5; Thu, 24 Jan 2019 08:34:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmaSw-00014D-J6
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 08:34:28 +0000
Received: from bbrezillon (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D9AAE2184C;
 Thu, 24 Jan 2019 08:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548318866;
 bh=oXYxc0K6gjoiGXPcjL6m/abshMkIhUUklqbSREdhSag=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=zqCu83NIu+6Ul525OOHzLgOU8o3veAI+QXX60HqLeGCtoWNuRyQ7Nyex8Ls0hGzgu
 gkji03yYuFWUmn1Kq9YSxkY/WHE5fiGMysVJkU/ovtWgoEs5/702TfWvMbryElw7H/
 8tOyF5/L8st1J4v+xTOgCZNkahifDzxlMwFD7c40=
Date: Thu, 24 Jan 2019 09:34:15 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UC
Message-ID: <20190124093415.4c287400@bbrezillon>
In-Reply-To: <39d6edd9-14ad-8110-b618-6454f6840b28@denx.de>
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
 <20190124085018.2ad33dab@bbrezillon>
 <39d6edd9-14ad-8110-b618-6454f6840b28@denx.de>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_003426_667776_AA1A70F5 
X-CRM114-Status: GOOD (  17.92  )
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

On Thu, 24 Jan 2019 09:00:43 +0100
Stefan Roese <sr@denx.de> wrote:

> On 24.01.19 08:50, Boris Brezillon wrote:
> > On Thu, 24 Jan 2019 08:35:32 +0100
> > Stefan Roese <sr@denx.de> wrote:
> >   
> >> On 23.01.19 13:57, Boris Brezillon wrote:  
> >>> On Wed, 23 Jan 2019 13:40:50 +0100
> >>> Boris Brezillon <bbrezillon@kernel.org> wrote:
> >>>      
> >>>>> This definitely does look better. I assume that we are we on the
> >>>>> right track now?  
> >>>>
> >>>> Yep, and it confirms the ECC caps => 8bits/512bytes. Will send a proper
> >>>> commit for the fix I did and Cc you so you can add your
> >>>> Tested-by/Reviewed-by.  
> >>>
> >>> Oh, looks like a side-effect of migrating to the dirmap approach
> >>> (merged in nand/next [1]) is that this bug does not exist. Can you test
> >>> the nand/next branch and let me know if it still works?
> >>>
> >>> [1]http://git.infradead.org/linux-mtd.git/shortlog/refs/heads/nand/next  
> >>
> >> Unfortunately this does not seem to work. I was unable to boot my
> >> platform from this branch directly so I rebased all MTD/NAND related
> >> patches on top of the latest kernel.org tree for this.  
> > 
> > You mean linux-next?  
> 
> No. I can try linux-next as well if necessary.
>   
> >> Here a log
> >> with this version (new error this time):
> >>
> >> root@mt7688:~# ./nandbiterrs /dev/mtd5 -i
> >> incremental biterrors test
> >> libmtd: error!: cannot write 2048 bytes to mtd5 (eraseblock 0, offset 0)
> >>           error 5 (Input/output error)
> >> Failed to write page 0 in block 0
> >>
> >> Here a log with nandwrite errors:
> >>
> >> root@mt7688:~# flash_erase /dev/mtd5 0 1
> >> Erasing 128 Kibyte @ 0 -- 100 % complete
> >> root@mt7688:~# nandwrite --input-size=2048 /dev/mtd5 /dev/urandom
> >> Writing data to block 0 at offset 0x0
> >> libmtd: error!: cannot write 2048 bytes to mtd5 (eraseblock 0, offset 0)
> >>           error 5 (Input/output error)
> >> Erasing failed write from 00000000 to 0x01ffff  
> > 
> > Weird, I wasn't expecting ERASE to fail (nothing changed in the erase
> > path).
> >   
> >> Writing data to block 1 at offset 0x20000
> >> libmtd: error!: cannot write 2048 bytes to mtd5 (eraseblock 1, offset 0)
> >>           error 5 (Input/output error)
> >> Erasing failed write from 0x020000 to 0x03ffff
> >> Writing data to block 2 at offset 0x40000
> >> libmtd: error!: cannot write 2048 bytes to mtd5 (eraseblock 2, offset 0)
> >>           error 5 (Input/output error)

Can you find out which layer (spinand, spi-mem or the spi driver) is
returning this -EIO?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
