Return-Path: <SRS0=uqc5=GK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A146C433DB
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Jan 2021 11:36:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D64923333
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Jan 2021 11:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D64923333
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XOn3o2mGDlSNqIohpMkLzAdOoRXxQ39sFyv39RHfNhg=; b=cl+g5P0ICWobVpOVfvGaNapKo
	AhkIIqGbDpGYgMHCdCf1mr8s6037l3x/0ALrP8iSouqF9wxexRpdJtYVmbuobxC8IPPMnRF1hAemV
	747prNCh3ltKHSAOAzFN+Fy+M7fPx2lu5AtsOS5RjnlXp3vxjvbhsbClBJIQTZmo2FQma/SX/6ERB
	wAiHvDVIvquaPYkf8qAeWhDoQOxr/EvDaJ34ceAiJBnX7DXv2DqXW80VzsadkeJA66k+8HvU66OXN
	xT9+WqU2B7oQvtAyvpFlkwIB2nuqwguORFoDZhpyvNawvXWZ1SFW+Zw6ueM2pC2vQbDyDfGQ0JHmy
	rf078Ux1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxTa9-0005B7-GS; Thu, 07 Jan 2021 11:35:57 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxTa7-00059r-3B
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2021 11:35:56 +0000
Received: by mail-pg1-x52a.google.com with SMTP id c22so4612295pgg.13
 for <linux-mtd@lists.infradead.org>; Thu, 07 Jan 2021 03:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nHeSNyL9PFfXjN2EbRqgvs+RdYchOryhErSWYV/YCU0=;
 b=sDNmudVQqaFyjK8PohJB2Qe/brRqLo3J/SlqCJLqZfcRPnclX1Tw4JGnNiIozMA9Zq
 vxUdGBOUk2qZkmJRc/XA5L912Fu66C2LvjIFg3D0Y7BMwjepexgrHCmvhioU2SBV1Li5
 XEuvxLZ7sTjOsVvp1uX2fwWeBIeU5RIiCZ9heOybTe9QL6dP7yP9UwnLqtqvugk0vO9t
 drRSF7KPSrsej7XmXqTqdkqCMUWJ9hhmIj5Q9LbnIhkRE6IIihzJ4fkz1trosv/Vizf1
 mI+thtCto4Q+jQugPk69GL44THnfa/CvXnh2XApr6hn3sIEnr9XlejjL4Or4q/qlMoxi
 JxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nHeSNyL9PFfXjN2EbRqgvs+RdYchOryhErSWYV/YCU0=;
 b=aRlhh/GfFMBvbtPGS6Q2ZxZw4XHmpRS4CdHG0WAqXed4S4SID+OK/WARnv7qUz1azm
 RDsQ0tf4nW3wARVZrLGCOJESfPNy5GmOMxgZRYi0XyaByvVBIT5KXGMe4f7Obcc+SGQi
 WFR41FuXcbhx4b0Bt8pWrELFN7gmMX2RWAAjZJPRN2JlEARYmeAJZYExY9KwkECNZlmn
 lGbmmvBaa6/3tNm48M7UXHdfpu1sSlRH77Ck9RGnRVpETavyYqHtsshVy/x/QqcFMyaC
 hwQjmfqeosGbhdpH/FQy/sWsTMG3rd6lRyJX0cM/wRi6NsWezwWwSa6enO9A1NLokjkf
 /gcw==
X-Gm-Message-State: AOAM530Z6YlkbxuSltGzw2GKI7wXgc6hg5zBJNc9Jo+aiR/LqK8cZ0/g
 0nqwDcBDg5+K4pcpy6RLIFc=
X-Google-Smtp-Source: ABdhPJxmWOSDNM4oJ4spXe64GFG/Her6VxCDRus1USqpecSIltBmwcvoo15VlJA9tRbq+/tfA9tqsQ==
X-Received: by 2002:a65:6381:: with SMTP id h1mr1433423pgv.301.1610019349512; 
 Thu, 07 Jan 2021 03:35:49 -0800 (PST)
Received: from an990131127 (42-73-236-79.emome-ip.hinet.net. [42.73.236.79])
 by smtp.gmail.com with ESMTPSA id p4sm1878722pjl.30.2021.01.07.03.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 03:35:49 -0800 (PST)
Date: Thu, 7 Jan 2021 19:35:49 +0800
From: Shuhao Mai <shuhao.mai.1990@gmail.com>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH] mtd: spi-nor: winbond: Add support for w25q512jv
Message-ID: <20210107113547.GA2108@an990131127.quanta.corp>
References: <20201111014556.6579-1-shuhao.mai.1990@gmail.com>
 <6e59d200-f4a6-459e-8cba-86782413ae8b@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6e59d200-f4a6-459e-8cba-86782413ae8b@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_063555_169138_63B97655 
X-CRM114-Status: GOOD (  25.49  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jan 04, 2021 at 08:58:26AM +0000, Tudor.Ambarus@microchip.com wrote:
> Hi, Shuhao,
> 
> On 11/11/20 3:45 AM, Shuhao Mai wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Add support for w25q512jv. This is of the same series chip with
> > w25q256jv, which is already supported, but with size doubled and
> > different JEDEC ID.
> 
> Where and how was this tested? Please add this info in the commit
> message.
>

Will add it in next version.

> > 
> > Signed-off-by: Shuhao Mai <shuhao.mai.1990@gmail.com>
> > ---
> >  drivers/mtd/spi-nor/winbond.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> > index e5dfa786f190..beaa6389e2dc 100644
> > --- a/drivers/mtd/spi-nor/winbond.c
> > +++ b/drivers/mtd/spi-nor/winbond.c
> > @@ -97,6 +97,8 @@ static const struct flash_info winbond_parts[] = {
> >                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> >         { "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
> >                             SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
> > +       { "w25q512jv", INFO(0xef4020, 0, 64 * 1024, 1024,
> 
> We should name it "w25q512jvq" in order to differentiate it to the
> "M" version: https://www.winbond.com/resource-files/W25Q512JV%20DTR%20RevD%2006292020%20133.pdf
> 
> The flash supports BP locking and we can enable it if you can test 
> the locking with mtd-utils. Not mandatory though.
> 
> Cheers,
> ta

I tried flash lock on my test enviorment, but it doesn't work. I think I'll
only update the flash name in next version, and submit a new patch when I
have answer to it.

Best,
Shuhao

> > +                           SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
> >  };
> > 
> >  /**
> > --
> > 2.20.1
> > 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
