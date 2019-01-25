Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C442BC282C0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 13:46:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F6F0218D0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 13:46:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CnutONmc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="D2cZfLDo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F6F0218D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CcHxZrcImTtPacpevsXLhHv+qBbPI6cIsfWXhDOno88=; b=CnutONmcH94OZw
	6ZVzFzeGxJZuSfK+ZcBx5IotHLAVN4opGStsxXHrX6X4/UFxItkoKgcRatsQaTZCFksqrd7ImRyUD
	v94BVzyTdSla6QnvC/eNtUOh9zLJtpYIv1N4n+tWjCoe9kk/Ud/iekQpg6ue+ltez5bkFZC1N/t8i
	lrjCyF+p7EOZFdjsS0Vf7X5gnMA9aaaacjxzt6OkePuTvQlKEYjyIV9oe2Ae7RcJ47DJvTrb7NZdT
	6OugCPSqdWuvT332LOLdA8iPgx3KviVwXPDyhpMT+Z4HTBIE04sT5HPjdHo58MbZDScHryqjgsm2O
	YWW2pnafaFuwiUEWK09g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gn1oa-0000dt-4P; Fri, 25 Jan 2019 13:46:36 +0000
Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn1oR-0000Sf-Ub
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 13:46:33 +0000
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id x0PDkA3u019673
 for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2019 22:46:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x0PDkA3u019673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1548423971;
 bh=28y1xHDZ812MgF9qGjLwuvA/dQwH55xCdXUau/VoMPk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=D2cZfLDoAfKnq8CF3KKaQqeQue1Nap8E/jZ8g0ujE45SsGKDfi0jYB1ndIzTg6vX7
 AqxHJUgnIjCUAMfbvlnqXLXeoMKkyLjBXvHEWViZiNjoUBeLOdI3mE37FGO6W037Ev
 MzYS03VdOPfuOVCvLSqBlK/9bdQ5sUjBr3wVfBhLnNiuYL0oDfKHiCRlMFd1p4Ib5v
 J/8d6jq3bBhQSPEGZKlaIlOn9wycWav8rXEqMkPkBus1jxdfHwkBGNLIqx1qTZ4tr+
 HgQ4YmN1Tu5W11H2783ucNDS2fNjaJtS+tF01NN0uhVc+mdFE4LASHWCMwTj5pUr04
 N/4LJ/tb6dcWA==
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id n10so5661010vso.13
 for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2019 05:46:11 -0800 (PST)
X-Gm-Message-State: AJcUukcOljsM4ftGbSim9H0/KAAwFEeOmF4Q0UCM+0zCdbQ+m1ROIeXa
 ri5IRPj3Gkvbx8fZ5Qhoe2YVjV16X8/k3a8Hb54=
X-Google-Smtp-Source: ALg8bN5rs+o4WmlkAb6Q1s0vDKTVNRriu4M9Yz2OSU99DUFw8PwiPsscx3yY9UG+mxwvXxSnDXCmp9DC+Qy+gvgr+IY=
X-Received: by 2002:a67:7f43:: with SMTP id a64mr4433291vsd.155.1548423970060; 
 Fri, 25 Jan 2019 05:46:10 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNAStZip5agGJZg8o_-k2re9zHuh0xHx8XiZVz3ixUmgXMg@mail.gmail.com>
 <20190125101508.57f39514@bbrezillon>
In-Reply-To: <20190125101508.57f39514@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 25 Jan 2019 22:45:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNATF-ByyQWjfoudke59_1RoRz-jU269g-RN-rvhoRu7Gow@mail.gmail.com>
Message-ID: <CAK7LNATF-ByyQWjfoudke59_1RoRz-jU269g-RN-rvhoRu7Gow@mail.gmail.com>
Subject: Re: [Question] should {read,write}_page hooks moved to
 nand_controller_ops ?
To: Boris Brezillon <bbrezillon@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_054628_877127_CA6E2589 
X-CRM114-Status: GOOD (  14.59  )
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
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

On Fri, Jan 25, 2019 at 6:15 PM Boris Brezillon <bbrezillon@kernel.org> wrote:
>
> Hi Masahiro,
>
> On Fri, 25 Jan 2019 17:23:28 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
> > Hello.
> >
> >
> > Many hooks in nand_ecc_ctrl, such as read_page, write_page, etc.
> > look controller-specific instead of per-chip.
> >
> > Will they be moved to nand_controller_op or somewhere
> > in the future?
>
> Not exactly :-). I don't know if I should say it, but Miquel is working
> on a generic NAND ECC engine framework which we'll try to re-use at the
> raw NAND layer. The idea is to dissociate the ECC engine concept from
> the NAND controller one. I imagine something like this:
>
>         ecc_engine->prepare_page_io_req(nand, ioreq);
>         nand_controller->do_page_io(nand, ioreq);
>         ecc_engine->finish_page_io_req(nand, ioreq);
>
> If we go for this approach, the nand controller should only have one
> hook: ->do_page_io(), and this hook would indeed be placed in
> nand_controller_ops. Once we have that in place, we can deprecate the
> ecc field in nand_chip (by moving it to nand_legacy).


Fascinating.

It is good to know you are planning a better HW modeling.

Thanks for explanation!




> Of course, this implies making the raw NAND framework use the generic
> NAND layer (which I started to work on here [1]).
>
> >
> > Boris and Miquel are doing a great job
> > for the NAND framework improvement.
>
> Thanks.
>
> > So, maybe it is already in their TODO list.
>
> It is, but, given the amount of work needed, it's unlikely to pop up in
> a near future.
>
> Regards,
>
> Boris
>
> [1]https://github.com/bbrezillon/linux/commits/nand/cleanup
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
