Return-Path: <SRS0=XIAy=2A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 750CAC43603
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Dec 2019 19:50:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47C2D20652
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Dec 2019 19:50:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dBTyeJc/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47C2D20652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rockwellcollins.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4crcf0sNU8+h1T5ucc4raAUb15y1twgL8wlFab8/4k=; b=dBTyeJc/eueN71
	gvgagBaYDvu7SCH4G/3GLITx4qFq73nLxw9el5ybkUhSTcyAfgP0VuufSo7fSB/FvfsV/7f3/ttor
	zTjxAXoEpKzfc86fY1MatNk81Jua+H2Zere265ip2LI6mKW8iBF0bcWfjRY8GXMGyWjlOE2lRI8vY
	zM9Ma6bFQ8/AFp2EoWPDZTBng2sjRa9/R/pm02kZZLMxf4w18VwdcWxrXeZAGbQ3jXkNeAOWrvVpL
	rsOnx9a0dNMLmpQyFN0L6T40RxDjcRpjTMX+LWNzat9m76MgXawmjcgZ04NYMNk4xq0J9rOsRSNvC
	+fPlGRNKu1yYipXcGLSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ielWQ-0005Is-7H; Tue, 10 Dec 2019 19:50:14 +0000
Received: from ch3vs05.rockwellcollins.com ([205.175.226.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ielWN-0004tS-61
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2019 19:50:12 +0000
IronPort-SDR: SJ+t82ixyYw4iwDiuHhs5HK9kj913mFrXRuRzruxEqSp9OpIzX+QjuWyoKtsxySkWAIXQJ9JwS
 /K1X6WKBISRfCPxoHK5FCwVb2B6DtmMSa/5hK+NxS0aj/rKztYBENOKRWSObComX7rYinL6142
 Fu3Kjkad56MtWLMZI+xqCkQitqOUdtrfLyQJrU/azxdjjW1JMMi6cXf8zrEz+V5vgDoMvPbX7h
 KyYREMSshR7X67JTB4jcxKprcwWs8c6S93xAgMY6Orj1llNzlXwEir++lgOF+XXoxDS5M50q23
 jpI=
X-RC-All-From: , 205.175.226.20, No hostname, joseph.kust@rockwellcollins.com, 
 Joseph Kust <joseph.kust@rockwellcollins.com>, , 
X-RC-Attachments: , ,
X-RC-RemoteIP: 205.175.226.20
X-RC-RemoteHost: No hostname
X-RC-IP-Hostname: ch3ip05.rockwellcollins.com
X-RC-IP-MID: 12618202
X-RC-IP-Group: GOOGLE_RELAYED
X-RC-IP-Policy: $GOOGLE_RELAYED
X-RC-IP-SBRS: None
Received: from unknown (HELO mail-vs1-f70.google.com) ([205.175.226.20])
 by ch3vs05.rockwellcollins.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2019 13:50:03 -0600
Received: by mail-vs1-f70.google.com with SMTP id y125so2759137vsb.21
 for <linux-mtd@lists.infradead.org>; Tue, 10 Dec 2019 11:50:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZBpnNWpU7OFKwXfLyOtfaa6SFM/dkOqZC0kMMliiOlw=;
 b=LHC/fr3HqNg5TKK4Prvj5njc5M03AZg0Y3hRZK2vKamqFbo4R+23j/XSFoJPE6+3pv
 vkzt+JNN0IEtDICzJt5Bcw7YMt5n1sk0t4ofgzVPUoGESB0r0IpAF4iy1LKxvCcJM+VB
 W0cjADoUcpbG7hZFLlYJbBerZn/AmQxxCOM+02wdn5x+IUDiJDeNX9ZlsoBnuPnwriO/
 Roqx6p663jhMOB4lO+KWnBolgxBuDyTiNCko8YYy00T//Ec3FI75ccaMj8SAsF+ObOQN
 3wXc9UfyM41QwcCghtgjLiuJhadcpqZn2xFy+wd6wTd3kTSDjTL9RHM61Il7WzOMX0Ny
 sJKw==
X-Gm-Message-State: APjAAAXwAVtvkiZ66mnKbaQUz38q85U0naMzWJHTsIz6ahvVa9hTeCxQ
 FtnW19HgC6IhfoHjRqWrULL7p6IiOhctVY2c19dPr5D/PMlvPYlyyrrdt9M3Km6UgUeQK5+Gi6+
 HfkdmCyhKoS8U+1kF8zIhtPJW9ZT8FM7Kh63ocb4X8arvu1B6d6geuf3Wk8N/
X-Received: by 2002:a67:e8c4:: with SMTP id y4mr26704801vsn.0.1576007403292;
 Tue, 10 Dec 2019 11:50:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqzZk7cBIUF3HI20/xOQvdxq2SsClnOaEV3qdoV4JFRHW43cAw4z93ei6N+CDIoiesGBqEL2JljR6AGPqM/zgcc=
X-Received: by 2002:a67:e8c4:: with SMTP id y4mr26704771vsn.0.1576007402960;
 Tue, 10 Dec 2019 11:50:02 -0800 (PST)
MIME-Version: 1.0
References: <20191117215547.163120-1-brandon.maier@rockwellcollins.com>
 <ca733470-b953-d805-110c-2696bb9576ee@microchip.com>
In-Reply-To: <ca733470-b953-d805-110c-2696bb9576ee@microchip.com>
From: Joseph Kust <joseph.kust@rockwellcollins.com>
Date: Tue, 10 Dec 2019 13:49:51 -0600
Message-ID: <CAJzBf2Y55hXOpKAFkVwXx2=cX+36t8EuucVniDyne+_yp8eJpg@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Add support for sst26vf016b
To: Tudor.Ambarus@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_115011_328049_68D6B740 
X-CRM114-Status: GOOD (  16.29  )
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
Cc: marek.vasut@gmail.com, brandon.maier@rockwellcollins.com,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

On Tue, Dec 10, 2019 at 11:10 AM <Tudor.Ambarus@microchip.com> wrote:
>
> Hi, Brandon,
>
> On 11/17/19 11:55 PM, Brandon Maier wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > From: Joseph Kust <joseph.kust@rockwellcollins.com>
> >
> > Adds support for sst26vf016b, a smaller variant of the sst26vf064b.
>
> How was this tested, what controller did you use? Did you test the quad read?

This was tested on a sama5d3 SOC using the atmel,at91rm9200-spi
controller.  The quad read was not tested.
Kernel versions tested were branched from mainline 4.14.115 and 3.14.79

>
> Thanks,
> ta
>
> >
> > Signed-off-by: Joseph Kust <joseph.kust@rockwellcollins.com>
> > Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index f4afe123e9dc..500929903f61 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -2538,6 +2538,7 @@ static const struct flash_info spi_nor_ids[] = {
> >         { "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
> >         { "sst26wf016b", INFO(0xbf2651, 0, 64 * 1024, 32, SECT_4K |
> >                               SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> > +       { "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> >         { "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> >
> >         /* ST Microelectronics -- newer production may have feature updates */
> > --
> > 2.23.0
> >
> >

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
