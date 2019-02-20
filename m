Return-Path: <SRS0=2MvH=Q3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2EB8C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 07:59:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E2E92183F
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 07:59:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Znym5kI7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WGsrIPwm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E2E92183F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wdu2b9QmJb/D18RoPDQMBsZs8SQ0t67vjpayNKliHp0=; b=Znym5kI71kJLkJ
	ei35jq/cuDkKT0dFd6OyPv/ttiN1VCf/nou7A5DXeVplCSsbtKt9Oz9E5aDiMzdVeOscOXqTcXugu
	lyhuiTaK2BoVX6Bfg5Ee6pzQWoig6swiYuUFRa6GmnbdxJ7GseJa4wCt0ssiq+9viPsWBN0P2GXL+
	F9tdJFSwRy2itDeIVyajUFm7GicmPrxq8xMKHljVhicRuVKQqC+yLv3ndsDvhBHIFYhuSqA4+b0uM
	VIRmxOHqvBPeTV0bkBxx7E+q8AC29YMA647/A1tILGBbXoPHnDGoO9DgA9rKO4RZF9/azmwuGDM/X
	ufL6oGY3OWv1Dbsb0xmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwMmy-00031E-Q1; Wed, 20 Feb 2019 07:59:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwMmv-00030n-O2
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2019 07:59:31 +0000
Received: from localhost (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 483C32146E;
 Wed, 20 Feb 2019 07:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550649569;
 bh=JjUibeYrJqCEUY6EimShmcs88eZezdQWlxzvJXkedE4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WGsrIPwmNVRgENXOiVVToYdmY9qb/hXCegaS9t04Zt99PzhhAjLtmxd6Ln072/K69
 c6djoNUbUEtMpw//K4bU5iFMr4Q91vwflzsaANdwX8ePXqmJdcSRt4C+fi6+ZEbm48
 cBN/XIdkephvJ5rsab9GQxK2mR+Xx6hx6VrjR1CU=
Date: Wed, 20 Feb 2019 08:59:17 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Emil Lenngren <emil.lenngren@gmail.com>
Subject: Re: [PATCH] mtd: spinand: Wait after erase in spinand_markbad
Message-ID: <20190220085917.04f0f47b@kernel.org>
In-Reply-To: <CAO1O6scHuaGJsS1wXtEpxi930K57yDBUZggb1Sik9XoZMJA+8A@mail.gmail.com>
References: <20181221115831.9595-1-emil.lenngren@gmail.com>
 <20190105145845.7a28d8f8@bbrezillon>
 <CAO1O6se_1oPv6SogDkkMaF1K9N7XxtTzeHAruibB8fph+mam=A@mail.gmail.com>
 <20190106091049.01e2e3d9@bbrezillon>
 <CAO1O6scHuaGJsS1wXtEpxi930K57yDBUZggb1Sik9XoZMJA+8A@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190219_235929_800262_0A3D9A7F 
X-CRM114-Status: GOOD (  16.23  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 18 Feb 2019 12:27:25 +0100
Emil Lenngren <emil.lenngren@gmail.com> wrote:
  
> > > At the same time, it's generally disallowed to write the
> > > same page twice...  
> >
> > That's only if you care about the data you write to the page. Marking a
> > block bad is just about setting the BBM to 0x0, which should always work
> > even if the page you're writing to has already been written, simply
> > because a 1 -> 0 cell transition does not require an erase (only a 0 ->
> > 1 transition does).  
> 
> Should the BBM be written with or without ECC? Now it uses whatever
> mode was used in the last operation. Also for reading, I see the
> "spinand_isbad" function sets .mode to MTD_OPS_RAW but that field
> doesn't seem to be inspected, again using the same ECC mode as in the
> last operation.
> Isn't it best to use the non-ECC mode for both reading and writing the
> BBM?

We should definitely disable the ECC engine when reading/writing the
BBM.

> If we would use ECC mode and overwrite the page when writing the
> BBM marker, I guess the controller needs to store a second error
> correction code (overwriting the previous one), which will probably
> lead to ECC failure if later read in ECC-mode (and who knows if it
> will "correct" the zero bits to ones...).

Well, you could just ignore the ECC result, but that's better to simply
read the BBM in raw mode.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
