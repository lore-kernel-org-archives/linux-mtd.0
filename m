Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F013C282C4
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 08:33:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C00320879
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 08:33:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lr0oTo9I";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SN6uOnX8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C00320879
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tq82s56N2m/3gB7C5ZPVBI+8EBEVpHED2NMVtVgtcoM=; b=lr0oTo9Isd2NpB
	CJ3qcuwTPXtACdKi8lMMmjknbzrObM0ThgAFh6TNRRrt8lhOuL8PLhbO4/mfe4sZPEXAr9eJL7bCE
	8qxDfNposZWSk5mX8sNDOA5Z8fNJjYAcyFrlijXyv4NBWHduYI41VfrXwjlolIPBSnC++5G1wHl0s
	1/2Qboe6jxjBr7K3DGogaAfSjT4N55O1ECnjU8cZlmNQF5UMlM5MRI9f47Wkdor5ofwkwJ+DP8VBe
	bIVknXBalygaXBbrSht3fSnuNBWHpWGqxxntgBVLm+aoLLXB8abggow2ECpAR39b8K+ImE4pDDKSC
	E/sssaSGpQJG4Jd5oUCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glrUv-0000nf-39; Tue, 22 Jan 2019 08:33:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glrUs-0000nL-9J
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 08:33:27 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4B39920854;
 Tue, 22 Jan 2019 08:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548146005;
 bh=oskaqloGxzpVlEB9EoI/Hzkqp8YIG8E7IGPgpL/k7Qc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SN6uOnX8QcU7tNGU9shqUyIV1FcOmx2EDwewPXEUA3j1HSQ1E2IRndoza8MPxJC6c
 fkBhLVgEvC7v1lP/src3CD9wEldzKuVx1B2M3jjQaQpC+qwCvnYdW+qrA7vJUtuKn2
 7LQCt/AbXQjWhAPSGjDbdtPd190CEKmkxTGV4H84=
Date: Tue, 22 Jan 2019 09:33:13 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: use unnamed union in struct
 nand_op_parser_pattern_elem
Message-ID: <20190122093313.67375948@bbrezillon>
In-Reply-To: <20190122090830.118eb6be@xps13>
References: <1548142975-14219-1-git-send-email-yamada.masahiro@socionext.com>
 <1548142975-14219-3-git-send-email-yamada.masahiro@socionext.com>
 <20190122084944.420fcd4a@xps13>
 <CAK7LNAQvD03By1PQJ8KZG-UqX+NVQcL6JU-5a-2ZVVovdgBpEQ@mail.gmail.com>
 <20190122090830.118eb6be@xps13>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_003326_358017_268F6DA5 
X-CRM114-Status: GOOD (  26.63  )
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
Cc: Lucas Stach <dev@lynxeye.de>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Linus Walleij <linus.walleij@linaro.org>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stefan Agner <stefan@agner.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, linux-tegra@vger.kernel.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 22 Jan 2019 09:08:30 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Masahiro,
> 
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Tue, 22 Jan
> 2019 17:00:54 +0900:
> 
> > On Tue, Jan 22, 2019 at 4:50 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:  
> > >
> > > Hi Masahiro,
> > >
> > > Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Tue, 22 Jan
> > > 2019 16:42:55 +0900:
> > >    
> > > > Although drivers do not directly get access to the private data of
> > > > instruction patterns, let's use unnamed union field to be consistent
> > > > with nand_op_instr.
> > > >    
> > >
> > > Actually this is how we wrote it the first time. Then we got robots
> > > reporting that anonymous unions where not allowed with older (still
> > > supported) GCC versions and I had to do this:
> > >
> > >
> > > commit c1a72e2dbb4abb90bd408480d7c48ba40cb799ce
> > > Author: Miquel Raynal <miquel.raynal@free-electrons.com>
> > > Date:   Fri Jan 19 19:11:27 2018 +0100
> > >
> > >     mtd: nand: Fix build issues due to an anonymous union
> > >
> > >     GCC-4.4.4 raises errors when assigning a parameter in an anonymous
> > >     union, leading to this kind of failure:
> > >
> > >     drivers/mtd/nand/marvell_nand.c:1936:
> > >         warning: missing braces around initializer
> > >         warning: (near initialization for '(anonymous)[1].<anonymous>')
> > >         error: unknown field 'data' specified in initializer
> > >         error: unknown field 'addr' specified in initializer
> > >
> > >     Work around the situation by naming these unions.
> > >
> > >     Fixes: 8878b126df76 ("mtd: nand: add ->exec_op() implementation")
> > >     Reported-by: Andrew Morton <akpm@linux-foundation.org>
> > >     Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> > >     Tested-by: Andrew Morton <akpm@linux-foundation.org>
> > >     Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > >    
> > 
> > 
> > Hmm, how come Andrew's compiler was fine with the following?
> > 
> > struct nand_flash_dev {
> >         char *name;
> >         union {
> >                 struct {
> >                         uint8_t mfr_id;
> >                         uint8_t dev_id;
> >                 };
> >                 uint8_t id[NAND_MAX_ID_LEN];
> >         };
> >         unsigned int pagesize;
> >         ...
> > };
> >   
> 
> It is probably not :)

It was compile fine. I don't know all the subtleties, but maybe it's
because ->id[] is a base type and not a struct.

> 
> > 
> > 
> > The current minimum version is GCC 4.6
> > (commit cafa0010cd51fb7)
> > but I am not sure if this restriction is remaining.
> >   
> 
> That's right, can you please test if this limitation is still
> ongoing wit GCC 4.6?

I have a more important question: why should we go bad back to unnamed
unions? Why is that a problem to have a named union? Sure, we initially
started with an unnamed ones because it made lines shorter, but now that
we switched to named unions I don't see the point of going back and
patching all drivers again (at the risk of seeing this problem appear
again when compiled with an old compiler version).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
