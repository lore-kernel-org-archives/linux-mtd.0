Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE14C169C4
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 09:34:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BA252080F
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 09:34:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ow1J/Kqf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="Kfqg8l0B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BA252080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J3hnOqLEOms6XDzoXtnGfjoCv6idPjGRrsStUx8Lohw=; b=ow1J/KqfT85sJG
	WOZM8fzGSUCupu2VclolL7G5eN7Wdfq7LdNNU9XR/EBvBzifYiEYKUZuJ1oHpPAc8lc1N+FuWyHtj
	757CGn9D0qy/N0hHPMQjyNU0FaLhG54BDGcOwvqMB8W7f6BQQ8RaQw0/jBg+ahIa2cl6CWr6cyhH9
	bWgZHj6RwX3vuEWZYojsTHlMPdq6ePAlQKXcPItFaJu9yRmNUieq6FWcefg7Gz5QIgkTlXLxxLRXG
	TtxgOoZ48Ad2b44wKENZ5DNoOG0Blv2L4bbj8hrWVPf2SUbMpu6qbNUdCFKERgCIqYre8o1GXUSYW
	iA0b01jaejYIbyr5pkIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs2YL-0000vJ-O2; Fri, 08 Feb 2019 09:34:33 +0000
Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs2YI-0000uy-70
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 09:34:32 +0000
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id x189YAXE026644
 for <linux-mtd@lists.infradead.org>; Fri, 8 Feb 2019 18:34:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x189YAXE026644
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1549618451;
 bh=lt3wPoP+t27ffzMBv85cWeV71nOytCWkJfmB03BwrdI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Kfqg8l0Bs9Z2dEcs4DTj/fCg1t7QSlB78qgEZY7Q8FEZSIK9MkJSuXpfFaiY9FZGR
 dQYbxUuMGQZfBQx9CKQe6da5A91BtVOkfsJ1zLix/MxDsW7+5PP0GOB+1ix2l7Idty
 Fbwih19hGZ/o7K/oSZ6Rtf/MCJBbTzKqEsWNg5731Gd5aZCI2jci6dwOI/D2B0wDEU
 uyhIE2ssMsE2yjFsicX/N1Euv2HrgZYQV+KV8SCocT22IH22zRR34nq3EopVnIY1fy
 7DrMecBXgiXARLhH3siqEhBCfoMRZdt8aHwcG6gb2IUG+SJtntuxrj4VTwrvI2wV7O
 cPyWtd85nOsDw==
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id x1so1697251vsc.10
 for <linux-mtd@lists.infradead.org>; Fri, 08 Feb 2019 01:34:10 -0800 (PST)
X-Gm-Message-State: AHQUAua7OngCjNTVvr1fZgWaBfkMnNxBR02VCcLnCIxNHN7em2AQHI7q
 Nu6lK/JMngHluQqA3aliT720odz+M+4JlVJN+oY=
X-Google-Smtp-Source: AHgI3Iaiw10ysv9Vo1vkQwNPbWBJBsErM9llboqiAR1sPdFHEwF4zOs92KsA19OXB9ixTrvrD7J0mZtYlmFAZCEVfV8=
X-Received: by 2002:a67:f759:: with SMTP id w25mr2811450vso.215.1549618449330; 
 Fri, 08 Feb 2019 01:34:09 -0800 (PST)
MIME-Version: 1.0
References: <1549613335-30319-1-git-send-email-yamada.masahiro@socionext.com>
 <1549613335-30319-8-git-send-email-yamada.masahiro@socionext.com>
 <7e1121479b38e98949b44c9fba91dee3adf97b99.camel@perches.com>
In-Reply-To: <7e1121479b38e98949b44c9fba91dee3adf97b99.camel@perches.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 8 Feb 2019 18:33:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNATbHBmu4a62rcBKmBR8eD=-pgUOW3mWh3PZtqOMPEpWJg@mail.gmail.com>
Message-ID: <CAK7LNATbHBmu4a62rcBKmBR8eD=-pgUOW3mWh3PZtqOMPEpWJg@mail.gmail.com>
Subject: Re: [PATCH 07/11] mtd: rawnand: denali: use bool type instead of int
 where appropriate
To: Joe Perches <joe@perches.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_013430_575420_CA769F5F 
X-CRM114-Status: GOOD (  15.54  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Feb 8, 2019 at 6:24 PM Joe Perches <joe@perches.com> wrote:
>
> On Fri, 2019-02-08 at 17:08 +0900, Masahiro Yamada wrote:
> > Use 'bool' type for some function arguments.
> >
> >  - write (write or read?)
> >  - raw (the raw access mode or not?)
> >
> > It is true that denali_nand_info::dma_avail is also boolean, but
> > I am keeping it as 'int' because 'scripts/checkpatch --strict' would
> > report the following:
> >
> > CHECK: Avoid using bool structure members because of possible alignment issues
> >   - see: https://lkml.org/lkml/2017/11/21/384
> >
> > I do not think it is a matter here, but I am sticking to the suggestion.
>
> just fyi: that suggestion has been removed by:
>
> commit 7967656ffbfa493f5546c0f18bf8a28f702c4baa
> Author: Jason Gunthorpe <jgg@ziepe.ca>
> Date:   Fri Jan 18 15:50:47 2019 -0700
>
>     coding-style: Clarify the expectations around bool
>
>     There has been some confusion since checkpatch started warning about bool
>     use in structures, and people have been avoiding using it.
>
>     Many people feel there is still a legitimate place for bool in structures,
>     so provide some guidance on bool usage derived from the entire thread that
>     spawned the checkpatch warning.
>
>     Link: https://lkml.kernel.org/r/CA+55aFwVZk1OfB9T2v014PTAKFhtVan_Zj2dOjnCy3x


Thanks, this is good to know.


I will use 'bool' for denali_nand_info::dma_avail in v2.

I will wait for other comments until then.





-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
