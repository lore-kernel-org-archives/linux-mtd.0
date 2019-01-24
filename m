Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA30C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 16:25:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C411218AE
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 16:25:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WxRSrUF8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="z850vZ7Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C411218AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=quCnQi8tcJEE6/weLvW3kTrLElEn4pnPTBLcqR3Tc/s=; b=WxRSrUF87XRQJB
	67Ut+DdwTEdxdsSxhr+UBTg4g5Oage7S1ESNrYWAZ7H60qwu9UwiPRUWnXWIjmdeVOKnmvgYebigm
	4wnNGlYAy1fTZHQXimX1jT3iaw2hIGzfXO+Dp/2XKjIsdqHE652Re4GapN+8+04iLs3nAgebO2LDb
	4RY0BMoIaqFzKvc6ldlBdTbdU1q7BarDHNWnGxFd2Pxj+9gQ5oRbkJ3va8uMnodwPnqsVDbSYT59F
	gTG2kTbaXyjlTGjPUme6eQk2nXU8B0feIVO9opup1arwDalBe+JF0LW28fOn4eAJs3Dy8zwCsqpED
	m+z/hRyUlHlwRxrkoG9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmhoZ-0002Ga-FF; Thu, 24 Jan 2019 16:25:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmhoW-0002G7-K5
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 16:25:14 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C94D5218A2;
 Thu, 24 Jan 2019 16:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548347111;
 bh=w6OzX/cMrhs2RWqOY1ENqAcQD5CYeAG/JNnP9AMfnyU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=z850vZ7Zw+TkPDs3JPyMEO0t7g4BhauaJw0mdP07clWlaEMx5I4Pmz8xYc+Zguk2Y
 xp6bscL1kSxJu8pMsNLqVvbcIY5Us1OCofrUJjq3uTkckQU9HunuNoAE1mPTYn6Nql
 fD2m1oaOVQE8UqvZsolUd0M7gdUQHjCRC4HpaUlg=
Date: Thu, 24 Jan 2019 17:25:00 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Subject: Re: [EXT] Re: [RESEND PATCH V2 1/2] mtd: core: add erase
 preparation hook function pointer
Message-ID: <20190124172500.0cab6ce4@bbrezillon>
In-Reply-To: <BYASPR01MB003118C655FAC3F9A85D81DDDB9A0@BYASPR01MB0031.namprd08.prod.outlook.com>
References: <BYAPR08MB453384AEAB702223F460039EDB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20190118234236.0d296130@bbrezillon>
 <BYAPR08MB453351FB4AF6F99B24865822DB9F0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20190121103218.67a6600c@bbrezillon>
 <BYASPR01MB003118C655FAC3F9A85D81DDDB9A0@BYASPR01MB0031.namprd08.prod.outlook.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_082512_686762_63D314DB 
X-CRM114-Status: GOOD (  14.80  )
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
Cc: "richard@nod.at" <richard@nod.at>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "Zoltan Szubbocsev \(zszubbocsev\)" <zszubbocsev@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 24 Jan 2019 15:52:03 +0000
"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:

> Hi, Boris
> 
> >> >>  struct nand_manufacturer_ops {
> >> >>  	void (*detect)(struct nand_chip *chip); @@ -49,6 +50,7 @@ struct
> >> >> nand_manufacturer_ops {
> >> >>  	void (*cleanup)(struct nand_chip *chip);
> >> >>  	void (*fixup_onfi_param_page)(struct nand_chip *chip,
> >> >>  				      struct nand_onfi_params *p);
> >> >> +	int (*erase_pre)(struct nand_chip *chip, int page);  
> >> >
> >> >Let's move this hook to nand_chip and name it ->pre_erase() or  
> >> >->erase_preparation().  
> >> >  
> >>
> >> Can you tell us more reasons why moves this hook to nand_chip?  
> >
> >Because it's supposed to be a per-chip thing. I mean, not all of your chips have
> >this bug (at least I hope), so we want to only have a  
> >->pre_erase() implementation when it's really needed. The manufacturer  
> >specific ->init() hook will decide when it's appropriate to populate this -  
> >>pre_erase pointer based on the NAND chip id (or the NAND chip model).  
> >  
> 
> >> In my opinion, it is better to add this hook in nand_manufacturer_ops,
> >> since nand_manufacturer_ops Already exists in nand_chip, also this function is  
> >related to specific NAND manufacturer.  
> I still think, keep this hook in nand_manufacturer_ops is better, otherwise, just add one
> Function hook pointer in nand_chip, it is very weird.
> 

And I tell you it's not. What's the point of adding a hook at the
nand_manufacturer_ops level (which is the same for all NAND chips
produced by a manufacturer) if you then have to check whether a
specific chip has anything to do inside the hook itself. When we added
nand_manufacturer and the associated ops it was created to address
chip detection and initialization, nothing more. Anything that is
needed at runtime and is manufacturer specific should have a hook/flag
in nand_chip.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
