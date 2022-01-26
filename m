Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55ECC28CF5
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 10:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cnBPyhACvgRhhR75AvebSGkv2/l5pIaQH1dZpYNE3Bo=; b=LM9G1Jf5QYXf6L
	I+pa54Rlnbc24+jaOLEMR2Ul0FZuG68dKYVK6GPyAk5VomM79ZRDl1pnYKmRnMA8BDoSDIkATz1d8
	Bthjdyux/VSgbFYNnGa/5O3U7PCXmg9vZvaByap/dHF6YgWpooMd0Y3uOJ8E4TWa5s+buXddRGExA
	pYCt4RzXLntq6BDuYwltK4HSEnNwUAeVvRslR3glNWKaIsNqC18K/9JgQfFw9nEtEGiZZKTgawP7a
	lKnEKSvlkYOlOKjdO22MLl9pTzUaR9TG4wUgZpD/KI22CDg+3RSyCfWb6F/0lf6raMnElKDC8xbLC
	ot/2bGXp9+yDVeKjxGgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCfcJ-00BGVc-TQ; Wed, 26 Jan 2022 10:33:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCfcF-00BGTW-0y
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 10:33:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 09E48B81978;
 Wed, 26 Jan 2022 10:33:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4450C340E3;
 Wed, 26 Jan 2022 10:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643193203;
 bh=GW9FAjNDweW7gvrSISPpSMwP4D6Zp0v9U2IcNkF/a98=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WSGWZwN3RgRguwe1RsQAA+ygJ9W8xUAECNarOlDFAkDIdTLn6Zyy+NdPo+v8oLCDL
 ldJSusLrsnKmtCRHli2QeGVdkgELF79xXeKO3g7wC+UPD8qvsHyYNI+8oUrtL0UYKj
 /lEMaOW8GZ5Nk8XP4zYcmThDONWmJne26YnZmu+t5ETC5wp8JIe2KoLEZGY0ft3bJ2
 rClIV9RqdI6UeL3E41BB99vdlxd4/gxKKSTHC/pEr+Qz/X8GM5DRS9BbhCDj725UB5
 FrL/TyBkGw5lExUkXBiUp6y+R+acg9N3GIULoSLfacsFklkrTSxZVQJUW8oHe+yOJf
 Rs+MuluXEcVZg==
Date: Wed, 26 Jan 2022 16:03:16 +0530
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
Message-ID: <20220126103316.GA212068@thinkpad>
References: <20220113184427.2259509-1-konrad.dybcio@somainline.org>
 <20220114082718.32a2fc83@xps13> <20220126111613.3ab0021e@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220126111613.3ab0021e@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_023327_272595_6CB9DBCB 
X-CRM114-Status: GOOD (  25.80  )
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

On Wed, Jan 26, 2022 at 11:16:13AM +0100, Miquel Raynal wrote:
> Hello,
> =

> miquel.raynal@bootlin.com wrote on Fri, 14 Jan 2022 08:27:18 +0100:
> =

> > Hi Konrad,
> > =

> > konrad.dybcio@somainline.org wrote on Thu, 13 Jan 2022 19:44:26 +0100:
> > =

> > > While I have absolutely 0 idea why and how, running clear_bam_transac=
tion
> > > when READID is issued makes the DMA totally clog up and refuse to fun=
ction
> > > at all on mdm9607. In fact, it is so bad that all the data gets garbl=
ed
> > > and after a short while in the nand probe flow, the CPU decides that
> > > sepuku is the only option.
> > > =

> > > Removing _READID from the if condition makes it work like a charm, I =
can
> > > read data and mount partitions without a problem.
> > > =

> > > Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> > > ---
> > > This is totally just an observation which took me an inhumane amount =
of
> > > debug prints to find.. perhaps there's a better reason behind this, b=
ut
> > > I can't seem to find any answers.. Therefore, this is a BIG RFC!  =

> > =

> > I'm adding two people from codeaurora who worked a lot on this driver.
> > Hopefully they will have an idea :)
> =

> Sadre, I've spent a significant amount of time reviewing your patches,
> now it's your turn to not take a month to answer to your peers
> proposals.
> =

> Please help reviewing this patch.
> =


Sorry. I was hoping that Qcom folks would chime in as I don't have any idea
about the mdm9607 platform. It could be that the mail server migration from
codeaurora to quicinc put a barrier here.

Let me ping them internally.

> BTW why is this driver still using cmdfund? It should have been
> migrated to ->exec_op() a long time ago.

I'll look into it.

Thanks,
Mani
> =

> Thanks,
> Miqu=E8l

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
