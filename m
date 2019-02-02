Return-Path: <SRS0=Axir=QJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 986CCC282DB
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Feb 2019 07:44:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65FE020870
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Feb 2019 07:44:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LGf5hywF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="sgworIYa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65FE020870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qba0ETdTJZEdLN3tD6vuW7WhvJq5zvqEhYpGzZo3/iY=; b=LGf5hywFgeFHua
	TCxKKGMxtFBhOCLC12YMclC3X+//Y3EtZO1V4TVziicnoUiTXbs5Y3iPxqSNBrGOr1pSIaN43zjHW
	59Xl4rDxx76cQhQz/sbsuWA0CrZPYQSljdnYeBiNcH8UT8LmVwYEgmcww2UkX9/5btjwi+hFJZWQ1
	VLpzFke/8yZTwG0Zojf4ONDoFf36uYnqGz7BhaLc8HNp0Bic7vnT61RlD2VMlW+XSv5fp9/r0YSRp
	lV7VgELRS7dvpePS0ho1vrx7PLOOwd6PL7Yuvzo5t6nYOH4J5HfLXEIuMxOVQ5TgJ0KEHFzFfyUhw
	MQCgI8+b9GxNBzkiQR7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gppyG-0003qf-7W; Sat, 02 Feb 2019 07:44:12 +0000
Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gppyC-0003qK-2l
 for linux-mtd@lists.infradead.org; Sat, 02 Feb 2019 07:44:10 +0000
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id x127hpXb003382
 for <linux-mtd@lists.infradead.org>; Sat, 2 Feb 2019 16:43:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x127hpXb003382
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1549093432;
 bh=o5XJ2ECRk8BWbnRrI7uZM9xD7J7ipfeFnnDAdsZvXtA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sgworIYaKMS2mF9rN6HAgtBEuQANbjKOWspOJl5DhNKOHy0h8qFJ02ZBX9lW5XPxO
 8J3zitXjqZ2zct5b99hbWl6D5BqX+wql2ClpyIVGJBWND3Jnw/Fkp59o/GY8Cu9UVY
 PlMt3GacgOfpZGRKaIceEhf8UdhNz2GT5xJymU9Y36KMGdv73CJfOHWNd8Mb8zg5aK
 h2jV3m3e/No9h0t0ABHvz2651e+bkN8Ze/GpSpr138jQZLKbLiavoZN12uFr0rw1R5
 SH8nkhY5VuDIuSyG89oyPLqfBPqfEw6Ft1qrA9OIk+k412hiqYqwYLRNvpo0ExmxgD
 bM3NmdC0kxHmQ==
X-Nifty-SrcIP: [209.85.222.41]
Received: by mail-ua1-f41.google.com with SMTP id j3so2982889uap.3
 for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2019 23:43:51 -0800 (PST)
X-Gm-Message-State: AHQUAuYX3o84h7PYJ0gyPt9uo4StWiBAn0jbszXliKGNyLNesy6dP70+
 DEnEierJBRcKo0gYlZ7chtfa/HgQ6f4hKSmiloQ=
X-Google-Smtp-Source: AHgI3IZJVKcL3bkVIoxgje8UpdZuD4W8P8f6UW37jtlpAk/BKzEUl+yXH5wZ2iwf1du20xfEbj19oiRLbi9d7dWcovc=
X-Received: by 2002:a9f:3193:: with SMTP id v19mr13218135uad.55.1549093430648; 
 Fri, 01 Feb 2019 23:43:50 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNAQLzvW-zDaR8qkDaxEXxmiCj7XQDK-G57sPhvZu1_eBdA@mail.gmail.com>
 <20190201165218.22a0ac21@bbrezillon>
In-Reply-To: <20190201165218.22a0ac21@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 2 Feb 2019 16:43:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNASQrd_1qT8BQJBewBA65KeeETXdFpap00JuhhBV277Syw@mail.gmail.com>
Message-ID: <CAK7LNASQrd_1qT8BQJBewBA65KeeETXdFpap00JuhhBV277Syw@mail.gmail.com>
Subject: Re: [Question] setup_data_interface() hook when switching to a
 different type of NAND chip
To: Boris Brezillon <bbrezillon@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_234408_444845_E254E653 
X-CRM114-Status: GOOD (  25.58  )
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
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

On Sat, Feb 2, 2019 at 12:53 AM Boris Brezillon <bbrezillon@kernel.org> wrote:
>
> Hi Masahiro,
>
> On Fri, 1 Feb 2019 19:27:46 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
> > Hi.
> >
> >
> > When I was looking into the NAND controller/chips separation,
> > this question popped up in my mind.
> >
> >
> > Commit 2d472aba15ff169 provides us a more flexibility
> > about the controller/chips connection.
> > The connected NAND chips do not need to be homogeneous
> > any more.
> >
> >
> > My question is about the ->setup_data_interface() hook
> > when switching between NAND chips with different speed (timing mode).
> >
> >
> > Think about the case below:
> >
> > {
> >         compatible = "foo-nand-controller";
> >         reg = <...>;
> >         #address-cells = <1>;
> >         #size-cells = <0>;
> >
> >         nand@0 {
> >                   reg = <0>;
> >                   /* Slow NAND chip */
> >         }
> >
> >         nand@1 {
> >                   reg = <1>;
> >                   /* Fast NAND chip */
> >         }
> >
> > }
> >
> >
> >
> > In this case, two devices /dev/mtdblock0 and /dev/mtdblock1
> > will appear.
> >
> > If a user gets access to those two devices in turns,
> > I think ->setup_data_interface() should be invoked somehow
> > in order to update the timing registers on the controller side.
> >
> > Currently, ->setup_data_interface() is invoked in nand_scan_tail()
> > and that's it.
> >
> > So, both nand@0 and nand@1 are accessed by the timing mode of nand@1
> > (assuming nand@0 and nand@1 are initialized in this order)
> >
> >
> > Of course, it depends on the controller.
> >
> > If a controller has a register set for every chip select,
> > the hardware will be able to change the access speed automatically.
> >
> >
> > I think most of controllers just have a single set of timing registers.
> > So, when switching between different types of chips,
> > the driver must update the timing registers.
> >
> >
> > If this is a worthwhile usecase,
> > should it be taken care of by the NAND framework,
> > or by drivers ?
> >
> >
> > I just thought we could do something in
> > nand_get_device() / nand_release_device().
> >
> >
> > If this should be done per driver,
> > drivers can update registers in select_target or select_chip.
> >
> >
> > Thought?
>
> It should be done by the driver in its select_target() handler.
> Actually, it's already done like that in several drivers (marvell,
> sunxi, ...).
> ->setup_data_interface() is not required to apply timings right away.
> What it should do is convert the NAND timings into controller timings.
> Of course, if the controller has one set of timing regs per CS, the
> driver can apply timings right away, but when that's not the case,
> controller timings should be stored in the private nand data and
> applied when the chip is selected.


I see.

I will do so because the Denali controller
has just a single set of timing registers.

I will need some more time, but I am working on it.


Thanks for your advice!



> Feel free to enhance the ->setup_data_interface() doc if you think it's
> not clear enough.
>
> Regards,
>
> Boris
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


--
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
