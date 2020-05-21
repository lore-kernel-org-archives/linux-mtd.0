Return-Path: <SRS0=CeWw=7D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1507FC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 20:03:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC43520748
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 20:03:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iOp81579";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZqioNx7V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC43520748
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dByFCex/ZvoqEKw2RnhNnwxGAplNfEjHptEq9XmCJ0U=; b=iOp81579bCysP5
	o3ONQagCu4F4NEI4nXp8trNwBpZvGj9Vm248Syhw0P21hP77KyGHdS+pv+bCo26OrMOp3a0flGFT0
	kvm/aVR5ofPa8VZdL2uXL78fUl1WMtz7d0Jjq6Wu2Nox1+5TeN+azZAGvG0270o9grsWaMWE3XOJi
	eAS1CIGgwXCF5vTMWWMHh6gpsWnStZ/WZJTZoSw1MWz8b8Qatrin2cQIAoKsEmrfiQjW0LBUqQ/ff
	6PStC8gT/akr472Da0hU2rM0qvonwUmILwjVaQgRmXd1i0qUqxHn9BUs0P7Dz3EEuw/B/OxAsZRWn
	uyRuYwXQ2/SMmrDC9LMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbrPe-000829-Ce; Thu, 21 May 2020 20:03:30 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbrPa-00081L-Na; Thu, 21 May 2020 20:03:28 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04LK3Hd2084735;
 Thu, 21 May 2020 15:03:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1590091397;
 bh=KgACAFLoJRVyGtBb1FVqvHXti7scEZKPVWNBAC0Joe4=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ZqioNx7VbIEs/+pVdVa2H3QrOLpXgUwJwWiCrNv643SA99qm4R7rLR6RdTF0mdvQN
 +w5oFB/il5gzOZtFWMTjXfTMbWELYxBsuaKZ8cZeKdnKEEVCd2MQEoP8Xg2FSrRBdA
 vBba3Iq2+YZvQw9i6MWLr9P5FfXzsBYN0ISsDe3s=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04LK3HIC051566
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 21 May 2020 15:03:17 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 21
 May 2020 15:03:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 21 May 2020 15:03:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04LK3Gia014075;
 Thu, 21 May 2020 15:03:17 -0500
Date: Fri, 22 May 2020 01:33:15 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v6 04/19] spi: spi-mem: allow specifying a command's
 extension
Message-ID: <20200521200313.bnil6a4u3dhiizr4@ti.com>
References: <20200520163053.24357-1-p.yadav@ti.com>
 <20200520163053.24357-5-p.yadav@ti.com>
 <20200521202256.5816eb32@collabora.com>
 <20200521194129.3lqdormmcs4zadh2@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200521194129.3lqdormmcs4zadh2@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_130326_870331_5A95A20E 
X-CRM114-Status: GOOD (  25.05  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sekhar Nori <nsekhar@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 22/05/20 01:11AM, Pratyush Yadav wrote:
> On 21/05/20 08:22PM, Boris Brezillon wrote:
> > On Wed, 20 May 2020 22:00:38 +0530
> > Pratyush Yadav <p.yadav@ti.com> wrote:
> > 
> > > In xSPI mode, flashes expect 2-byte opcodes. The second byte is called
> > > the "command extension". There can be 3 types of extensions in xSPI:
> > > repeat, invert, and hex. When the extension type is "repeat", the same
> > > opcode is sent twice. When it is "invert", the second byte is the
> > > inverse of the opcode. When it is "hex" an additional opcode byte based
> > > is sent with the command whose value can be anything.
> > > 
> > > So, make opcode a 16-bit value and add a 'nbytes', similar to how
> > > multiple address widths are handled.
> > > 
> > > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > > ---
> > >  include/linux/spi/spi-mem.h | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> > > index e3dcb956bf61..731bb64c6ba6 100644
> > > --- a/include/linux/spi/spi-mem.h
> > > +++ b/include/linux/spi/spi-mem.h
> > > @@ -69,6 +69,8 @@ enum spi_mem_data_dir {
> > >  
> > >  /**
> > >   * struct spi_mem_op - describes a SPI memory operation
> > > + * @cmd.nbytes: number of opcode bytes (only 1 or 2 are valid). The opcode is
> > > + *		sent MSB-first.
> > >   * @cmd.buswidth: number of IO lines used to transmit the command
> > >   * @cmd.opcode: operation opcode
> > >   * @cmd.dtr: whether the command opcode should be sent in DTR mode or not
> > > @@ -94,9 +96,10 @@ enum spi_mem_data_dir {
> > >   */
> > >  struct spi_mem_op {
> > >  	struct {
> > > +		u8 nbytes;
> > >  		u8 buswidth;
> > >  		u8 dtr : 1;
> > > -		u8 opcode;
> > > +		u16 opcode;
> > >  	} cmd;
> > >  
> > >  	struct {
> > 
> > As mentioned in one of my previous review, you should patch the mxic
> > driver before extending the opcode field:
> 
> IIUC, this patchset doesn't break original functionality of the driver. 
> It will work like before with 1-byte opcodes. So I don't think it is the 
> responsibility of this patchset to enhance the driver. It didn't work 
> before with 2-byte opcodes, it won't work now. IMO this should be a 
> separate, independent change.

Scratch that. Big/little endian issue. If you'd drop your Signed-off-by, 
I'll write the commit message and patch it in.
  
> > --->8---
> > diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
> > index 69491f3a515d..c3f4136a7c1d 100644
> > --- a/drivers/spi/spi-mxic.c
> > +++ b/drivers/spi/spi-mxic.c
> > @@ -356,6 +356,7 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
> >         int nio = 1, i, ret;
> >         u32 ss_ctrl;
> >         u8 addr[8];
> > +       u8 cmd[2];
> >  
> >         ret = mxic_spi_set_freq(mxic, mem->spi->max_speed_hz);
> >         if (ret)
> > @@ -393,7 +394,10 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
> >         writel(readl(mxic->regs + HC_CFG) | HC_CFG_MAN_CS_ASSERT,
> >                mxic->regs + HC_CFG);
> >  
> > -       ret = mxic_spi_data_xfer(mxic, &op->cmd.opcode, NULL, 1);
> > +       for (i = 0; i < op->cmd.nbytes; i++)
> > +               cmd[i] = op->cmd.opcode >> (8 * (op->cmd.nbytes - i - 1));
> > +
> > +       ret = mxic_spi_data_xfer(mxic, cmd, NULL, op->cmd.nbytes);
> >         if (ret)
> >                 goto out;
> >  

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
