Return-Path: <SRS0=9lEF=QI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A060C282D8
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Feb 2019 08:51:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0FAF2184A
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Feb 2019 08:51:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mqj9Lt0a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="18H7hYNP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0FAF2184A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WC+pFYX/Wq6lsbi0S8x1prllFML3PJcnadr0O8nv9T8=; b=mqj9Lt0aRB0+k7
	MBGVejHh/RY4AE3Bj8NQam1kFZFpPyxouraXj3I21E4d+1WKbWX/kDmTeLsZVreVDo7e1ZBcbBEMT
	OldJ3WvOzXfgLHNaS/BWLUG8bZ62xYTEdmaSc7n/f/QqEZH5A6PmUQ/fcL+xYjPdflQnfRDf93h49
	9K4XXK6qn6hFoe4Hu8wUn0390boQZmwh5J+aLg7s2kn+9yoYcjoM1K7XWnI7zgxtjqYbsrbQ4VPLq
	gDA207iPELgzkJKQT8iw+55qheT1Jw1nd2bo16GG6R/ovN2/bJhwyT2kfsRFZ4FagTNr8HI+TjiCl
	jovXnWl5Q9sQRzzqx4QA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpUXX-0004BE-MJ; Fri, 01 Feb 2019 08:51:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpUWc-0002bQ-95
 for linux-mtd@lists.infradead.org; Fri, 01 Feb 2019 08:50:19 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C4702218EA;
 Fri,  1 Feb 2019 08:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549011013;
 bh=NeJWQWONBMuDFW/HK7LLIu58sHiBGSOM6qGQyS2B37M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=18H7hYNPByd6qaFz3l81RHATzFZaoaPEATWEJIjp1fq2XFLR7AJeeZ7GOp60Ul2HM
 ADrKDD3aqlBR0dpfRkXoM+jU95NHaPp8Ph+UG0AdtvhOyIRfFf/WavlhLH5NiLbpgD
 3FlGt+9raMqGuYCcG0A/GgU4gKBRLHthK/esLpi0=
Date: Fri, 1 Feb 2019 09:50:04 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] mtd: Check add_mtd_device() ret code
Message-ID: <20190201095004.65763e0c@bbrezillon>
In-Reply-To: <CAMuHMdWsYnLZP7=rO=xaDE4TbPr=XTphad6vaaRi=WrdOMSn8A@mail.gmail.com>
References: <20190102143654.24362-1-bbrezillon@kernel.org>
 <20190102143654.24362-2-bbrezillon@kernel.org>
 <CAMuHMdV-=_0htu9w1xK25RVWgnRaXVR-R-oXc7f-Y_cC9SR25A@mail.gmail.com>
 <20190122133159.2033844c@bbrezillon>
 <20190129120337.08754bac@bbrezillon>
 <CAMuHMdXVszyR_fkjmy5RpEDW3L-Ewr_tOK3o07OEm2uh4_aSRA@mail.gmail.com>
 <20190130095237.1a6a598f@bbrezillon>
 <CAMuHMdUgcgayOo=bhEZsuWMcRavjsweFPo1=KmcGa=PYxEoRNQ@mail.gmail.com>
 <20190130101036.0e63fec6@bbrezillon>
 <CAMuHMdWsYnLZP7=rO=xaDE4TbPr=XTphad6vaaRi=WrdOMSn8A@mail.gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_005014_725384_D7933A16 
X-CRM114-Status: GOOD (  13.24  )
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
 Boris Brezillon <boris.brezillon@bootlin.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Geert,

On Wed, 30 Jan 2019 10:16:33 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> 
> A tree based on last week's l2-mtd/master, i.e. lacking commit f7fd818cca0cea3d
> ("mtd: Remove empty lines at end of sysfs related functions").
> 
> This is the one triggering:
> 
>         if (WARN_ON((!mtd->erasesize || !mtd->_erase) &&
>                     !(mtd->flags & MTD_NO_ERASE)))
>                 return -EINVAL;

Do you think you'll have time to test [1]? I'd like to make that patch
part of my fixes PR if possible. If you can't, that's fine, just let me
know.

Thanks,

Boris

[1]http://patchwork.ozlabs.org/patch/1033458/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
