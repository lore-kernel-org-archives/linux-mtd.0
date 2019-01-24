Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E8FC282C6
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 08:15:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B312121855
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 08:15:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SQtohciw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="p8aczx/F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B312121855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2f0o8idpngUJN2fjz4PvMsgbpz7T86AG/dsCFWG9F8=; b=SQtohciwuX/O5I
	pRktVu0wxYjbVVTielA64mRfq8fRJi//HAow+oZvpQfjIyrD0a5dKBFdZIKNckIUPwa0tvYi7bK/N
	fGJ8UrbgIZEmAIIQ3hb2/0N9eCaWU2PHrrvhcEdiNMrKXArZJFEC2rzSFeh5bVajHJjWZLOBhfmTP
	koM+AJE4tU3bRDWh7YrLrKl0Js3So5w+yW+3JddYBz7ieYAU8wiL3LMCMfS5HWy01GbPSU+6rLs+9
	KavGbLcZgSWdCmkEGi0mDrxecaxQLyWOr/XfO/oa4eXeOFhpy8y2+oSFfVEOLHLv6Dhs90Xhs2La6
	MrdQAIOEbGZqHCUzTDiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmaAb-0001iQ-Hs; Thu, 24 Jan 2019 08:15:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmaAG-0000Ut-Mg
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 08:15:26 +0000
Received: from bbrezillon (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3241021855;
 Thu, 24 Jan 2019 08:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548317708;
 bh=tmWU9mdwuL50h5zgeTEOnaLYbLOCBWiOkL1Mrr1YKtw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=p8aczx/FPPxtUTNfrGpdDKReL9EG8s4EyAt7lKQqfRKyjjF3rdTfDS5N6iFtDBe7x
 V9m+i7TioQeBOXZxdUVOzEuTcJA3Ot7I3KIE9o9+MTJMj3gRYZIpVvKCS2w3O56cKR
 as9WgNmWxgfBsHq44GM3ip7AbtTZX2QrnwH96yaA=
Date: Thu, 24 Jan 2019 09:14:59 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UC
Message-ID: <20190124091459.11cb2912@bbrezillon>
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
X-CRM114-CacheID: sfid-20190124_001509_312399_0A6D7A87 
X-CRM114-Status: GOOD (  19.92  )
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

So which branch/tag is it based on?

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
> >> Erasing failed write from 0x040000 to 0x05ffff
> >> ...
> >>
> >> Any ideas on this?  
> > 
> > Try to revert b47b307ac23d ("mtd: spinand: Use the spi-mem dirmap API").  
> 
> Then I get this error again:
> 
> root@mt7688:~# ./nandbiterrs /dev/mtd5 -i
> incremental biterrors test
> Failed to recover 1 bitflips
> Read error after 0 bit errors per page
> 
> And with your patch from yesterday applied:
> 
> root@mt7688:~# ./nandbiterrs /dev/mtd5 -i
> incremental biterrors test
> Successfully corrected 0 bit errors per subpage
> Inserted biterror @ 1/7
> Read reported 4 corrected bit errors
> Successfully corrected 1 bit errors per subpage
> Inserted biterror @ 3/7
> Read reported 4 corrected bit errors
> Successfully corrected 2 bit errors per subpage
> Inserted biterror @ 5/7
> Read reported 4 corrected bit errors
> Successfully corrected 3 bit errors per subpage
> Inserted biterror @ 7/7
> Read reported 4 corrected bit errors
> Successfully corrected 4 bit errors per subpage
> Inserted biterror @ 8/7
> Read reported 5 corrected bit errors
> Successfully corrected 5 bit errors per subpage
> Inserted biterror @ 10/7
> Read reported 6 corrected bit errors
> Successfully corrected 6 bit errors per subpage
> Inserted biterror @ 12/7
> Read reported 7 corrected bit errors
> Successfully corrected 7 bit errors per subpage
> Inserted biterror @ 14/7
> Read reported 8 corrected bit errors
> Successfully corrected 8 bit errors per subpage
> Inserted biterror @ 17/7
> Failed to recover 1 bitflips
> Read error after 9 bit errors per page

Okay, that means we have a problem with the dirmap patch :-/.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
