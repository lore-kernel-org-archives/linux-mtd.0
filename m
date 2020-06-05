Return-Path: <SRS0=qxWv=7S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7625C433DF
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jun 2020 07:47:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86DCB2074B
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jun 2020 07:47:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="epTp+nLw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86DCB2074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yadavpratyush.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vv0xmt5K/Em7asN9ns8WU9yyRRcoGxQvmI9IaeUamTc=; b=epTp+nLw6EjJgu
	+LFFSRv9w23ouH6zInqoCU4zUXLRu+KbyMJwWV6p1y7yjp7o+l5OwHKi42uKwkWn+kwZYjpuo9vVK
	8LmRS9WQJiygb9hrmEpE8vMTI88OxG97GAX0X4J+0K7zuYewzrPfz+6qz4V/oDzmbdGcwPa3fr6l1
	n+Ulko0O4RHsgHi7/s3WZ3CP2MrC++SbIxob9zhVlj250Yc6WC9sqAfeAGLBpQd0klsD2IPqvFI1Y
	44hjEiTCGlH5psK2hdLmRzRTtghd9vy0Mf2dun1O64R4ow3UiqAYld3MaiMp8hN4zd/AtYhS95L8Z
	nzcKhXMpukcStzELlDdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jh74b-0007pz-18; Fri, 05 Jun 2020 07:47:29 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jh74X-0007nv-RV
 for linux-mtd@lists.infradead.org; Fri, 05 Jun 2020 07:47:27 +0000
X-Originating-IP: 157.36.131.136
Received: from localhost (unknown [157.36.131.136])
 (Authenticated sender: me@yadavpratyush.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 54D2E1C0002;
 Fri,  5 Jun 2020 07:47:15 +0000 (UTC)
Date: Fri, 5 Jun 2020 13:17:11 +0530
From: Pratyush Yadav <me@yadavpratyush.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v4 7/7] mtd: spi-nor: macronix: Add Octal 8D-8D-8D
 supports for Macronix mx25uw51245g
Message-ID: <20200605074711.zxxajsfgzopnjecw@yadavpratyush.com>
References: <1590737775-4798-1-git-send-email-masonccyang@mxic.com.tw>
 <1590737775-4798-8-git-send-email-masonccyang@mxic.com.tw>
 <20200529094202.7vjs7clhykncivux@yadavpratyush.com>
 <OF577383DB.7BF12AA3-ON4825857B.002468AB-4825857B.00250F16@mxic.com.tw>
 <20200603055359.y35dwznglc7tlewq@yadavpratyush.com>
 <OF72696CF7.123ABE04-ON4825857E.000F9054-4825857E.000FEC12@mxic.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF72696CF7.123ABE04-ON4825857E.000F9054-4825857E.000FEC12@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200605_004726_023925_74B39E89 
X-CRM114-Status: GOOD (  14.39  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, juliensu@mxic.com.tw,
 richard@nod.at, miquel.raynal@bootlin.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, broonie@kernel.org, linux-mtd@lists.infradead.org,
 boris.brezillon@collabora.com, matthias.bgg@gmail.com, p.yadav@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 05/06/20 10:53AM, masonccyang@mxic.com.tw wrote:
> 
> > > > > 
> > > > > +#define MXIC_CR2_DUMMY_SET_ADDR 0x300
> > > > > +
> > > > > +/* Fixup the dummy cycles to device and setup octa_dtr_enable() 
> */
> > > > > +static void mx25uw51245g_post_sfdp_fixups(struct spi_nor *nor)
> > > > > +{
> > > > > +   struct spi_nor_flash_parameter *params = nor->params;
> > > > > +   int ret;
> > > > > +   u8 rdc, wdc;
> > > > > +
> > > > > +   ret = spi_nor_read_cr2(nor, MXIC_CR2_DUMMY_SET_ADDR, &rdc);
> > > > > +   if (ret)
> > > > > +      return;
> > > > > +
> > > > > +   /* Refer to dummy cycle and frequency table(MHz) */
> > > > > +   switch (params->dummy_cycles) {
> > > > > +   case 10:   /* 10 dummy cycles for 104 MHz */
> > > > > +      wdc = 5;
> > > > > +      break;
> > > > > +   case 12:   /* 12 dummy cycles for 133 MHz */
> > > > > +      wdc = 4;
> > > > > +      break;
> > > > > +   case 16:   /* 16 dummy cycles for 166 MHz */
> > > > > +      wdc = 2;
> > > > > +      break;
> > > > > +   case 18:   /* 18 dummy cycles for 173 MHz */
> > > > > +      wdc = 1;
> > > > > +      break;
> > > > > +   case 20:   /* 20 dummy cycles for 200 MHz */
> > > > > +   default:
> > > > > +      wdc = 0;
> > > > > +   }
> > > > 
> > > > I don't get the point of this. You already know the fastest the 
> > > > mx25uw51245g flash can run at. Why not just use the maximum dummy 
> > > > cycles? SPI NOR doesn't know the speed the controller is running at 
> so 
> > > > the best it can do is use the maximum dummy cycles possible so it 
> never 
> > > > falls short. Sure, it will be _slightly_ less performance, but we 
> will 
> > > > be sure to read the correct data, which is much much more important.
> > > 
> > > In general, 200MHz needs 20 dummy cycles but some powerful device may 
> only 
> > > 
> > > needs 18 dummy cycles or less.
> > 
> > Yes, but do different mx25uw51245g chips have different dummy cycle 
> > requirements? Shouldn't all the chips with the same ID have same 
> > performance?
> > 
> 
> Same chip ID but different grade,
> i.e., commercial or industrial grade. 

Ok. In that case it makes sense.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
