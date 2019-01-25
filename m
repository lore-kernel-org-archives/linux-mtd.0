Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F0CC282C0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 14:10:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 335BD218D0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 14:10:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UxCIAWeD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q7F6Ybej"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 335BD218D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3uAIHCxye3cXHpxQmXciagItiW37bGyIOx09pL0CEFE=; b=UxCIAWeDCd+uyW
	7HJ/cwK1dlot7RDQ1HraSm72l14hD1kTWl8y0AxS97x+uphqZhlwy67G+Cos8fnxZUcPmeF8W/JRd
	yIsHUOog9svbxMLVixxrOcA+aRqETCknmawxXXsKhFdRLD+oeT66XRkg+50scAiI/4vlsP5K9WtuP
	fQyNLe5IYcsPiYg0+4kHvTcbZWzh4WU3owGcTNB49SsYFsw4kxErHc51DipuqjO3ix49G4EmTsnvM
	T+ijvE4AJo7DnMF0vBN3V49cfL3AhZ5ckmNl07YZnPZoKJBlBhRmjscJuotymTn/2pCjZkVQ8PRB5
	w0+BAyS3PIyTJ3aawtqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gn2C3-0000xj-63; Fri, 25 Jan 2019 14:10:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn2C0-0000xP-K6
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 14:10:49 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF943218CD;
 Fri, 25 Jan 2019 14:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548425448;
 bh=UNLO2s3EewM4E5JjNCDksfiKbvgV32mItwnDNIQphzM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Q7F6Ybejo+MzzfISpq1ATobsjQHhGpFVJozguFsb7n1AxYgEha6v9l8WglSnisic7
 zViYZ1RkLWtdfZ1GT71h0ao6Jbh828OA91jgWWKD2/lQMH3xtTPiIl3Is/8WTB3rLj
 qFvkF1RR1BchA4bxO6jfpd2DQqzjOoFn0uBTurys=
Date: Fri, 25 Jan 2019 15:10:41 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Subject: Re: [EXT] Re: [RESEND PATCH V2 2/2] mtd: core: NAND filling block
Message-ID: <20190125151041.47928c62@bbrezillon>
In-Reply-To: <BYAPR08MB45339AB26F5CC0FC6378C4E3DB9B0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <BYAPR08MB4533401FB969CA9A8D254F34DB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20190118233943.5f003eef@bbrezillon>
 <BYAPR08MB4533ADDA97A62DF732E565B1DB9F0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20190121134423.6c1765a3@bbrezillon>
 <BYAPR08MB45339AB26F5CC0FC6378C4E3DB9B0@BYAPR08MB4533.namprd08.prod.outlook.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_061048_678369_7BFED147 
X-CRM114-Status: GOOD (  10.07  )
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

On Fri, 25 Jan 2019 13:39:13 +0000
"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:

> >> >  
> >> it is still 15 pages, page0~page14. But it is now odd pages, there
> >> will one less odd pages than even pages.  
> >
> >Why only odd pages? You did not reply to this question yet, and I really want to
> >understand why.
> >  
> 
> Programming only odd pages will be effective, while reducing the number of programmed pages.
> This is related to the proprietary device architecture and erase procedure. 
> 

I'm clearly not happy with this explanation, but it looks like I don't
have a choice here. Please add a comment explaining that this is Micron
black-magic and we have no choice but to trust you on that one because
it's *confidential*. I hope you're right in your analysis...

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
