Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C211C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 16:22:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDB0B206E9
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 16:22:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wLzs1PZo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDB0B206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yadavpratyush.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QBzJ/PEmKhk/29CMLA1pJUAPsihWOofOBeDuYAs1OWI=; b=wLzs1PZoi9fLwigQZencCn1gP
	XIXVa0jzI3a7crwIWqOET4BHbJPWmGleappECDMDnj4bTcqD2ajBbMwGB5vzXr+pVkn/RPFLJz67q
	RmkydeD24JwH9cmi5xzgJTRH0S177x4eWYxNMZjQFDPvBvSEtjv2t2K/+f00Co6rA/40zq7GTvvlp
	194ojs7hzBS03tKvFcoVshb32RSKqbZkg3o8+ISkdmP4lLjE11qtpd3E3lTLRVgGBaJjfONJypEjY
	f6b7QtyhPorN/tWNhZ2Nvlx08wW6u7zH4ddd+IaVXAoa5+OOrF94HDGn3cuoiVbnKxmcnRcgeVbOH
	BHEPLxwUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxYXu-0002f8-Sw; Mon, 20 Jul 2020 16:21:42 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxYXq-0002e0-Cn; Mon, 20 Jul 2020 16:21:39 +0000
Received: from localhost (unknown [42.109.212.217])
 (Authenticated sender: me@yadavpratyush.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 05B42100006;
 Mon, 20 Jul 2020 16:21:32 +0000 (UTC)
Date: Mon, 20 Jul 2020 21:51:30 +0530
From: Pratyush Yadav <me@yadavpratyush.com>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v10 12/17] mtd: spi-nor: sfdp: detect Soft Reset sequence
 support from BFPT
Message-ID: <20200720162130.hknyyclgndjokqly@yadavpratyush.com>
References: <20200623183030.26591-1-p.yadav@ti.com>
 <20200623183030.26591-13-p.yadav@ti.com>
 <5f9a93d0-833c-8976-c6d3-2043e65b1b66@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f9a93d0-833c-8976-c6d3-2043e65b1b66@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_122138_623895_9C38E633 
X-CRM114-Status: GOOD (  20.94  )
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
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com, richard@nod.at,
 nsekhar@ti.com, Nicolas.Ferre@microchip.com, boris.brezillon@collabora.com,
 michal.simek@xilinx.com, Ludovic.Desroches@microchip.com, broonie@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 miquel.raynal@bootlin.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org, p.yadav@ti.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

On 08/07/20 04:08PM, Tudor.Ambarus@microchip.com wrote:
> On 6/23/20 9:30 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > A Soft Reset sequence will return the flash to Power-on-Reset (POR)
> > state. It consists of two commands: Soft Reset Enable and Soft Reset.
> > Find out if the sequence is supported from BFPT DWORD 16.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > ---
> >  drivers/mtd/spi-nor/core.h | 1 +
> >  drivers/mtd/spi-nor/sfdp.c | 4 ++++
> >  drivers/mtd/spi-nor/sfdp.h | 2 ++
> >  3 files changed, 7 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> > index 6338d32a0d77..79ce952c0539 100644
> > --- a/drivers/mtd/spi-nor/core.h
> > +++ b/drivers/mtd/spi-nor/core.h
> > @@ -26,6 +26,7 @@ enum spi_nor_option_flags {
> >         SNOR_F_HAS_SR_TB_BIT6   = BIT(11),
> >         SNOR_F_HAS_4BIT_BP      = BIT(12),
> >         SNOR_F_HAS_SR_BP3_BIT6  = BIT(13),
> > +       SNOR_F_SOFT_RESET       = BIT(14),
> >  };
> > 
> >  struct spi_nor_read_command {
> > diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> > index 7983ff431346..8e0741d8bfd3 100644
> > --- a/drivers/mtd/spi-nor/sfdp.c
> > +++ b/drivers/mtd/spi-nor/sfdp.c
> > @@ -616,6 +616,10 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
> >                 break;
> >         }
> > 
> > +       /* Soft Reset support. */
> > +       if (bfpt.dwords[BFPT_DWORD(16)] & BFPT_DWORD16_SOFT_RST)
> 
> this can be improved. There are multiple reset methods described and you're
> addressing just one of them.

Yes, it can be. But xSPI only cares about the 0x66 and 0x99 reset 
sequence and that is what I implemented. Others can be added if they are 
needed in the future. In addition, I don't have hardware that supports 
these resets so I can't test them. IMO if someone needs other reset 
modes, they should send a separate patch for it.

If you are worried about future work needed to support multiple soft 
reset modes, I can introduce a nor->soft_reset() hook that can be 
populated when parsing BFPT. But I think that is a bit premature. The 
work needed to do that is not a lot so I think we should hold off until 
the need really comes up.
 
> > +               nor->flags |= SNOR_F_SOFT_RESET;
> > +
> >         /* Stop here if not JESD216 rev C or later. */
> >         if (bfpt_header->length == BFPT_DWORD_MAX_JESD216B)
> >                 return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt,
> > diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
> > index 6d7243067252..8ae55e98084e 100644
> > --- a/drivers/mtd/spi-nor/sfdp.h
> > +++ b/drivers/mtd/spi-nor/sfdp.h
> > @@ -90,6 +90,8 @@ struct sfdp_bfpt {
> >  #define BFPT_DWORD15_QER_SR2_BIT1_NO_RD                (0x4UL << 20)
> >  #define BFPT_DWORD15_QER_SR2_BIT1              (0x5UL << 20) /* Spansion */
> > 
> > +#define BFPT_DWORD16_SOFT_RST                  BIT(12)
> > +
> >  #define BFPT_DWORD18_CMD_EXT_MASK              GENMASK(30, 29)
> >  #define BFPT_DWORD18_CMD_EXT_REP               (0x0UL << 29) /* Repeat */
> >  #define BFPT_DWORD18_CMD_EXT_INV               (0x1UL << 29) /* Invert */

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
