Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEC7C28CF5
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 11:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YZj4FmDWSQIOf33up8yPpfFoUY6z/NBBBO8017wpJxs=; b=AZgQLUKGbEr6t2
	Owf/utp+seWByLGTpLhTWh0zrJ01EYIxbEUTwY+q/2dWU3lBVtDYC2N5pdZZWl5nzNknGmAb+Fv2K
	ooninQ/MZxHgnVRoSZsAtZoYC8N7Ha0yKWKxUc7yaV1PVFJ31iecW1aygcw5IgTkEtt27Ylh/bs35
	M1hRCxT83bkmN7PMTgb9rCq5xCxvz2R+jK7x3P3JeQikXD0a1UHkHv1/sfpp8hSY2QegOE24JdEQk
	mkC6zyqjtuBm9Ml/lAR6tUCGydu2tOowcMiZPWkserwRPgJdk1q4I6erSwlqMmv4Z92wJ4X00FQiy
	EM1wUztUuI7uEMn7hX7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCgbH-00BVpE-Ma; Wed, 26 Jan 2022 11:36:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCgbD-00BVoM-2p
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 11:36:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9480961920;
 Wed, 26 Jan 2022 11:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8ACC340E3;
 Wed, 26 Jan 2022 11:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643196986;
 bh=GHeHlsvXCNKkFQP+IuCKOX43wwk37uoc7LzHlpZ8P2s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DxFgKLu9Ms4VLfvBqkUMjxJpdhebgHNZNqLKVZalbrrs9z4tg5ZpwQtq0Jbu0USu1
 bkLw3Xsaw/sTWCcyC+a+sNf4w71gpfLrTTu4tB+hXHiSPNgmjgpdCe+YiPJaQq2p/d
 Ysji4KTQgLYMFZqdnYXoHMJWGP4sKIoniX+F8drO9/Y6tu/tPL8A9sKMZpa+MZibI1
 2lQAZHghHi5CEeBM/gqslCBrXZA88FRYdS5FV/YmN5twT/VfTp2W0om01xEDYFt3PA
 XNOhCBOfI3+Mw8IYju+6hsh4EHcVCgyvT9vy8vA5RBm2q33J1tA4i+aspv+NtvtXMx
 RSiOpqMfM2vrw==
Date: Wed, 26 Jan 2022 17:06:18 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
 angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, jamipkettunen@somainline.org,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, mdalam@codeaurora.org,
 sricharan@codeaurora.org
Subject: Re: [PATCH] mtd: nand: raw: qcom_nandc: Don't clear_bam_transaction
 on READID
Message-ID: <20220126113618.GB212068@thinkpad>
References: <20220113184427.2259509-1-konrad.dybcio@somainline.org>
 <20220114082718.32a2fc83@xps13> <20220126111613.3ab0021e@xps13>
 <20220126103316.GA212068@thinkpad> <20220126114200.4cc3c21b@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220126114200.4cc3c21b@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_033627_244777_58B272A7 
X-CRM114-Status: GOOD (  33.28  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jan 26, 2022 at 11:42:00AM +0100, Miquel Raynal wrote:
> Hi Mani,
> =

> mani@kernel.org wrote on Wed, 26 Jan 2022 16:03:16 +0530:
> =

> > On Wed, Jan 26, 2022 at 11:16:13AM +0100, Miquel Raynal wrote:
> > > Hello,
> > > =

> > > miquel.raynal@bootlin.com wrote on Fri, 14 Jan 2022 08:27:18 +0100:
> > >   =

> > > > Hi Konrad,
> > > > =

> > > > konrad.dybcio@somainline.org wrote on Thu, 13 Jan 2022 19:44:26 +01=
00:
> > > >   =

> > > > > While I have absolutely 0 idea why and how, running clear_bam_tra=
nsaction
> > > > > when READID is issued makes the DMA totally clog up and refuse to=
 function
> > > > > at all on mdm9607. In fact, it is so bad that all the data gets g=
arbled
> > > > > and after a short while in the nand probe flow, the CPU decides t=
hat
> > > > > sepuku is the only option.
> > > > > =

> > > > > Removing _READID from the if condition makes it work like a charm=
, I can
> > > > > read data and mount partitions without a problem.
> > > > > =

> > > > > Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> > > > > ---
> > > > > This is totally just an observation which took me an inhumane amo=
unt of
> > > > > debug prints to find.. perhaps there's a better reason behind thi=
s, but
> > > > > I can't seem to find any answers.. Therefore, this is a BIG RFC! =
   =

> > > > =

> > > > I'm adding two people from codeaurora who worked a lot on this driv=
er.
> > > > Hopefully they will have an idea :)  =

> > > =

> > > Sadre, I've spent a significant amount of time reviewing your patches,
> > > now it's your turn to not take a month to answer to your peers
> > > proposals.
> > > =

> > > Please help reviewing this patch.
> > >   =

> > =

> > Sorry. I was hoping that Qcom folks would chime in as I don't have any =
idea
> > about the mdm9607 platform. It could be that the mail server migration =
from
> > codeaurora to quicinc put a barrier here.
> > =

> > Let me ping them internally.
> =

> Oh, ok, I didn't know. Thanks!
> =


Pinged them.

> > > BTW why is this driver still using cmdfund? It should have been
> > > migrated to ->exec_op() a long time ago.  =

> > =

> > I'll look into it.
> =

> That would be great, given the number of updates this driver has
> received, it would be nice to tackle the legacy bits there.
> =


Sure! I've added this to my to-do list for the coming weeks.

Thanks,
Mani

> Thanks,
> Miqu=E8l

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
