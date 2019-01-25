Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9379BC282C0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 08:24:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B3D521919
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 08:24:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PyQND4YD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="zFjTP6Vx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B3D521919
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OdMwcWSHbFJe8hlo4ntpMl1W0hbQjJEZ4yBWYTypf1M=; b=PyQND4YDWK6si7
	N7o4xLxkpQ8Gbz0Mj5ZVTp1A5vQbXFyvvt2yPawLJoJoHClpVmrVfYBGFKnk5aDK7yh4YKD1Kxlo/
	+WGE4brP3dKZhQHMEHQYSbt5+XkJE5nnNw/EY0kz1qw7MVaeBx+pRh31vQc8NbeHL0q4fN+7XBlBR
	aHrVUIoZTS2bAxgfZ3Kr3qyvzvwvPwQINUVku1NPIDTBE3nWFAsT0JoMOs1e4CmZ9ctAG7x9wJqHs
	vFa7UFJKyIq4c9M+dO4Su6CWXSfDXwEWSZipQk0vIgqVCpksW66Qunnglqb5zh8fu15QTalzVxiYl
	RHPoJF+OhddTzR1UefsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmwmu-0000qd-Kt; Fri, 25 Jan 2019 08:24:32 +0000
Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmwmr-0000qJ-JG
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 08:24:31 +0000
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id x0P8O4UX026456
 for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2019 17:24:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x0P8O4UX026456
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1548404645;
 bh=VsS5j21TuA6ddPWQJl/MEpiADuqrGvl/ZqDIwINZXcQ=;
 h=From:Date:Subject:To:Cc:From;
 b=zFjTP6VxBD3Vy2JBdUd3IwiwCsYHmQA9K9JxpZ8KglqmsYPY/mlhz1RlWPMIkFYei
 Ne/vUq7jl9h7Cjka+jyzgQdcbAbzu64PrNl9PRT64gcDX0JAqTkOh3tlOoJ29/Jk0O
 RBK7Qmy7ujQPK149AOgMOYPgyBvhM34+ITUMRgsUwoTXJWeeTBiQKfDL9DQO1RmwNL
 GK3CE0S3LBi1UdAKN9vFKU77w2tZua07fu84miNjCjC3o+GO4TPn8X8hzDCopNFGBQ
 pTyBHtLrqTEt9d1ibLBbf0TCxSq22bbrhX/N1zJB43bNoYu2MXkQlR3ko+6LioakNu
 OHH+/cYhZ1D0w==
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id t17so5195520vsc.8
 for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2019 00:24:05 -0800 (PST)
X-Gm-Message-State: AJcUukfi/U5Uag7Hq3qOE2tv6bLqMMtyQy3A11/uERqyvi71eQNfDvHZ
 ITY8btFpeCQNb31H5QhN2jhTY/X1r+g2rakxJmY=
X-Google-Smtp-Source: ALg8bN7c5SplTNRnCLyzmSUBZFzNsf0HFv2NFewV5i4MJYyUATMTttZNe+Cb+vTc8J9bFxNcKclFFhTZqNskzlYEmT8=
X-Received: by 2002:a67:7f43:: with SMTP id a64mr4019049vsd.155.1548404644163; 
 Fri, 25 Jan 2019 00:24:04 -0800 (PST)
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 25 Jan 2019 17:23:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAStZip5agGJZg8o_-k2re9zHuh0xHx8XiZVz3ixUmgXMg@mail.gmail.com>
Message-ID: <CAK7LNAStZip5agGJZg8o_-k2re9zHuh0xHx8XiZVz3ixUmgXMg@mail.gmail.com>
Subject: [Question] should {read,write}_page hooks moved to
 nand_controller_ops ?
To: linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_002430_011008_41A94DC4 
X-CRM114-Status: UNSURE (   3.99  )
X-CRM114-Notice: Please train this message.
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
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello.


Many hooks in nand_ecc_ctrl, such as read_page, write_page, etc.
look controller-specific instead of per-chip.

Will they be moved to nand_controller_op or somewhere
in the future?

Boris and Miquel are doing a great job
for the NAND framework improvement.
So, maybe it is already in their TODO list.

It is what just popped in my mind.


Thanks.

-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
