Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFB8C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Apr 2022 15:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bN7+luRxxTZxI72a6mIiJg02wpkfLFXzBEvnQC6lCIM=; b=VrqrEx+ml+qmG/
	koNXSd1yG0iyh7R8VtMYf8Sj93m128GdQklY1PNSjUI/Z+mYgjTw4Mw6xiIn80ehttJaihAFiruO5
	y3W2viVXUTE6ogr1L2QDtlmiZHHcVhPEqEpgSTd168ORR8an4FW+sajbHPgC+B+0Lb+4rCJdrSm0e
	a90zDzrs0BUmb/yMf6CB7knhpgvchqKJ2v9+2HkB2oDWch/FUh+iFKg+iPMrlBol9rehXj9RElDOq
	yX7PRKOVsBl1wwtsEtrUDk546rV4ldRSDVtO2U1UpOnnZ6nL/hf6HfbDAbIr2AdfgDOAJXXekyFFg
	Z02o+Cg+svNT+6BdyDkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf1mn-006JQQ-UH; Thu, 14 Apr 2022 15:53:33 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf1mk-006JPq-Pc
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2022 15:53:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 23BB9B82A3F;
 Thu, 14 Apr 2022 15:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98755C385A1;
 Thu, 14 Apr 2022 15:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649951607;
 bh=vXueds4VuC74iLCMybsPZmL3wsTpJ6AYZXEWJtsFltc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gVlrHrq9iS0fvnwKbYeUOEnnL9wxjnCbN3bSgvsuN9aJYKMx77j/5W27OQZ9xYl/e
 g7yIjWea4TGP9Rs9l7bSoBH3mf0TcuEQeqTbKbbNZUnGAkGDoKKWuqE0jxNP8hJcRi
 u3viLk71BcM/9sstR79aHyKX8ng6N77guDgz/wLrVN+bY2+YzZdcsezJ+gatRX72r0
 kU6le2F7BlDoRbjf6580EeI8KyuaDXGJJn252kb62h5id5pzPy09f+ZIaxrhn5doAe
 zqcDtY6rEycMwDCi3UXSn7Dl9ApANob09OGNu4YZpqrC3dd6Brgft1X4QgNNw/pVAo
 6tvGAgnqoFg8A==
Date: Thu, 14 Apr 2022 21:23:19 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 konrad.dybcio@somainline.org, quic_srichara@quicinc.com
Subject: Re: [PATCH V2] mtd: rawnand: qcom: fix memory corruption that causes
 panic
Message-ID: <20220414155319.GB20493@thinkpad>
References: <1649950217-32272-1-git-send-email-quic_mdalam@quicinc.com>
 <20220414173642.56baedf5@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220414173642.56baedf5@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_085331_154978_5CAB0BEA 
X-CRM114-Status: GOOD (  21.96  )
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

On Thu, Apr 14, 2022 at 05:36:42PM +0200, Miquel Raynal wrote:
> Hi Md,
> =

> quic_mdalam@quicinc.com wrote on Thu, 14 Apr 2022 21:00:17 +0530:
> =

> > This patch fixes a memory corruption that occurred in the
> > nand_scan() path for Hynix nand device.
> > =

> > On boot, for Hynix nand device will panic at a weird place:
> > | Unable to handle kernel NULL pointer dereference at virtual
> >   address 00000070
> > | [00000070] *pgd=3D00000000
> > | Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> > | Modules linked in:
> > | CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.17.0-01473-g13ae1769cfb0
> >   #38
> > | Hardware name: Generic DT based system
> > | PC is at nandc_set_reg+0x8/0x1c
> > | LR is at qcom_nandc_command+0x20c/0x5d0
> > | pc : [<c088b74c>]    lr : [<c088d9c8>]    psr: 00000113
> > | sp : c14adc50  ip : c14ee208  fp : c0cc970c
> > | r10: 000000a3  r9 : 00000000  r8 : 00000040
> > | r7 : c16f6a00  r6 : 00000090  r5 : 00000004  r4 :c14ee040
> > | r3 : 00000000  r2 : 0000000b  r1 : 00000000  r0 :c14ee040
> > | Flags: nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM Segment none
> > | Control: 10c5387d  Table: 8020406a  DAC: 00000051
> > | Register r0 information: slab kmalloc-2k start c14ee000 pointer offset
> >   64 size 2048
> > | Process swapper/0 (pid: 1, stack limit =3D 0x(ptrval))
> > | nandc_set_reg from qcom_nandc_command+0x20c/0x5d0
> > | qcom_nandc_command from nand_readid_op+0x198/0x1e8
> > | nand_readid_op from hynix_nand_has_valid_jedecid+0x30/0x78
> > | hynix_nand_has_valid_jedecid from hynix_nand_init+0xb8/0x454
> > | hynix_nand_init from nand_scan_with_ids+0xa30/0x14a8
> > | nand_scan_with_ids from qcom_nandc_probe+0x648/0x7b0
> > | qcom_nandc_probe from platform_probe+0x58/0xac
> > =

> > The problem is that the nand_scan()'s qcom_nand_attach_chip callback
> > is updating the nandc->max_cwperpage from 1 to 4.This causes the
> > sg_init_table of clear_bam_transaction() in the driver's
> > qcom_nandc_command() to memset much more than what was initially
> > allocated by alloc_bam_transaction().
> > =

> > This patch will update nandc->max_cwperpage 1 to 4 after nand_scan()
> > returns, and remove updating nandc->max_cwperpage from
> > qcom_nand_attach_chip call back.
> =

> Please update also the commit log.
> =

> Fixes: ?
> Cc: stable ?

Also please add Reported-by to credit Konrad.

Thanks,
Mani

> =

> > Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> > Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> > ---
> > [V2]
> =

> Thanks,
> Miqu=E8l

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
