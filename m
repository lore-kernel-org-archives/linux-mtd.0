Return-Path: <SRS0=9lEF=QI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9522AC282D8
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Feb 2019 15:53:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6632A2086C
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Feb 2019 15:53:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uBb4ytVX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="q+RJeNpI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6632A2086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Y6Y0pckOWXbkcrp+t5hLUjE/ZRL5mO3bAGKDrwy0SI=; b=uBb4ytVXldXBb2
	TBjLlzYCVv/3kD3NQYE2uLWunAxMfKi4TpJICXwEuqQAp4hqZFL8aG/xv7Cxo7Pc/z6Vaar3FwKnz
	SdtV66mxlRMSQ6ID+woddSSWzimtLj5p+gggkY80fEn133ZD/GneUyF0u4W2ofzuxvNGw1MVVNemW
	B7kIOA8SzXTVQV9KWyuuuTV2qoFMjrgzbwdoXlYtwtWYep078SGJ0wuCODe/GSKA9yv957WWwfNN4
	f6uyCcQ4xb+1WQeltkw3kBc1TGjCzrXOW9scN18c+ia2MrKu5C3OsxGBR2fM8zEw9IvGOgI28y/Pp
	+Dx/4BOYzBkj/+o/m4rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpb8A-00055m-Kb; Fri, 01 Feb 2019 15:53:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpb87-00055Q-E4
 for linux-mtd@lists.infradead.org; Fri, 01 Feb 2019 15:53:24 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E97A22086C;
 Fri,  1 Feb 2019 15:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549036403;
 bh=J05/pA4Tw3IyG/X7lPNXAUT0bLf1MB9DtIwPQW/iEvc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q+RJeNpI6tMS+cNBQgXFGRoY9jxzot3W4hbwqRh3gYrEaGNWcltzXn/2GMhxxsHL6
 1mAl3kONo1YykXQ7LeHJENSHm3oAMruNv4xQFRBNIUtNFWrwyBMv2rp55cVP6uDD2h
 jrP7K5tIq1tZljgCPIesJhWZcQqDgM3TF89MRQxM=
Date: Fri, 1 Feb 2019 16:53:13 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [Question] setup_data_interface() hook when switching to a
 different type of NAND chip
Message-ID: <20190201165218.22a0ac21@bbrezillon>
In-Reply-To: <CAK7LNAQLzvW-zDaR8qkDaxEXxmiCj7XQDK-G57sPhvZu1_eBdA@mail.gmail.com>
References: <CAK7LNAQLzvW-zDaR8qkDaxEXxmiCj7XQDK-G57sPhvZu1_eBdA@mail.gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_075323_501871_4CE1685D 
X-CRM114-Status: GOOD (  22.83  )
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

Hi Masahiro,

On Fri, 1 Feb 2019 19:27:46 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi.
> 
> 
> When I was looking into the NAND controller/chips separation,
> this question popped up in my mind.
> 
> 
> Commit 2d472aba15ff169 provides us a more flexibility
> about the controller/chips connection.
> The connected NAND chips do not need to be homogeneous
> any more.
> 
> 
> My question is about the ->setup_data_interface() hook
> when switching between NAND chips with different speed (timing mode).
> 
> 
> Think about the case below:
> 
> {
>         compatible = "foo-nand-controller";
>         reg = <...>;
>         #address-cells = <1>;
>         #size-cells = <0>;
> 
>         nand@0 {
>                   reg = <0>;
>                   /* Slow NAND chip */
>         }
> 
>         nand@1 {
>                   reg = <1>;
>                   /* Fast NAND chip */
>         }
> 
> }
> 
> 
> 
> In this case, two devices /dev/mtdblock0 and /dev/mtdblock1
> will appear.
> 
> If a user gets access to those two devices in turns,
> I think ->setup_data_interface() should be invoked somehow
> in order to update the timing registers on the controller side.
> 
> Currently, ->setup_data_interface() is invoked in nand_scan_tail()
> and that's it.
> 
> So, both nand@0 and nand@1 are accessed by the timing mode of nand@1
> (assuming nand@0 and nand@1 are initialized in this order)
> 
> 
> Of course, it depends on the controller.
> 
> If a controller has a register set for every chip select,
> the hardware will be able to change the access speed automatically.
> 
> 
> I think most of controllers just have a single set of timing registers.
> So, when switching between different types of chips,
> the driver must update the timing registers.
> 
> 
> If this is a worthwhile usecase,
> should it be taken care of by the NAND framework,
> or by drivers ?
> 
> 
> I just thought we could do something in
> nand_get_device() / nand_release_device().
> 
> 
> If this should be done per driver,
> drivers can update registers in select_target or select_chip.
> 
> 
> Thought?

It should be done by the driver in its select_target() handler.
Actually, it's already done like that in several drivers (marvell,
sunxi, ...).
->setup_data_interface() is not required to apply timings right away.
What it should do is convert the NAND timings into controller timings.
Of course, if the controller has one set of timing regs per CS, the
driver can apply timings right away, but when that's not the case,
controller timings should be stored in the private nand data and
applied when the chip is selected.

Feel free to enhance the ->setup_data_interface() doc if you think it's
not clear enough.

Regards,

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
