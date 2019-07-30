Return-Path: <SRS0=td2l=V3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E91A7C433FF
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 18:04:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF27F206A2
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 18:04:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kCt96XXi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF27F206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Koze28mQtJbm7JMIq4YG6d8FkaeZw4WS0if7bDVCn8A=; b=kCt96XXixg5blB
	ayGWpKjD4jpR+uWjnO477N343gbjLcfzN9dd+dclIX/BeWUD2GoIVKHgHfdZPU/qySEqPRdSj4BUS
	blvWxbIjCAO3SMSKYpmbDYYPL7yMeZuqg2+5E0vviQgEQAMRjV2S63cHYfItgjpU+0ANHUxihbM2i
	la3IqWK5gfq8i3cXycocpAEmxLWbcbA/iu8fZYvSIAbBMm9VW0WDUiP6abvQLBbSZtQsUCew7aeaF
	BNUTX+qe5Oc3ath1PVqZifSK8MCFGLQXW2jPL/rQylzTtqpfsrUklDtYz2sQgTVfA+GaXYY0sjaxz
	DUVsoirZY4BjPTyV9jLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsWU0-0004yC-Kp; Tue, 30 Jul 2019 18:04:20 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsWTx-0004xF-JC
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2019 18:04:19 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 42CCA28B8F9;
 Tue, 30 Jul 2019 19:04:14 +0100 (BST)
Date: Tue, 30 Jul 2019 20:04:10 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [RFC v1 0/3] *spi-mem: adding setup and callback function
Message-ID: <20190730200410.72b2f7d3@collabora.com>
In-Reply-To: <d8adef3f-e901-2e25-6183-35cb1e53bcda@ti.com>
References: <20190729142504.188336-1-tmaimon77@gmail.com>
 <20190729172859.4374a2ad@collabora.com>
 <CAP6Zq1iPXDX_Gtz6ZWYm3JoHgHjdapotVLGw-Lq4tc2X-6eAug@mail.gmail.com>
 <20190730085438.6fe0480b@collabora.com>
 <d8adef3f-e901-2e25-6183-35cb1e53bcda@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_110417_895775_FFA61FEB 
X-CRM114-Status: GOOD (  20.62  )
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
Cc: Tomer Maimon <tmaimon77@gmail.com>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, bbrezillon@kernel.org,
 richard@nod.at, tudor.ambarus@microchip.com,
 Schrempf Frieder <frieder.schrempf@kontron.de>, linux-spi@vger.kernel.org,
 broonie@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 30 Jul 2019 23:18:25 +0530
Vignesh Raghavendra <vigneshr@ti.com> wrote:

> On 30-Jul-19 12:24 PM, Boris Brezillon wrote:
> > Trimmed the recipient list a bit and used Frieder's new address.
> > +Sergey
> > 
> > On Mon, 29 Jul 2019 23:55:05 +0300
> > Tomer Maimon <tmaimon77@gmail.com> wrote:
> >   
> >> Hi Boris,
> >>
> >> Thanks for the prompt reply,
> >>
> >>
> >>
> >> On Mon, 29 Jul 2019 at 18:29, Boris Brezillon <boris.brezillon@collabora.com>
> >> wrote:
> >>  
> >>> Hi Tomer,
> >>>
> >>> On Mon, 29 Jul 2019 17:25:01 +0300
> >>> Tomer Maimon <tmaimon77@gmail.com> wrote:
> >>>    
> >>>> Lately we have working on Flash interface unit (FIU) SPI driver that
> >>>> using spi-mem interface, Our FIU HW module support direct Flash Rd//Wr.
> >>>>
> >>>> In our SOC (32 bit dual core ARM) we have 3 FIU's that using memory    
> >>> mapping as follow:    
> >>>>
> >>>> FIU0 - have 2 chip select and each one have 128MB memory mapping (total    
> >>> 256MB memory mapping)    
> >>>> FIU1 - have 4 chip select and each one have 128MB memory mapping (total    
> >>> 512MB memory mapping)    
> >>>> FIU2 - have 4 chip select and each one have 16MB memory mapping (total    
> >>> 32MB memory mapping)    
> >>>>
> >>>> Totally 800MB memory mapping.
> >>>>
> >>>> When the FIU driver probe it don't know the size of each Flash that
> >>>> connected to the FIU, so the entire memory mapping is allocated for each    
> >>> FIU    
> >>>> according the FIU device tree memory map parameters.    
> >>>
> >>> Do you need those mappings to be active to support simple reg accesses?
> >>>    
> >>>> It means, if we enable all three FIU's the drivers will try to allocate    
> >>> totally 800MB.    
> >>>>
> >>>> In 32bit system it is problematic because the kernel have only 1GB
> >>>> of memory allocation so the vmalloc cannot take 800MB.
> >>>>
> >>>> When implementing the FIU driver in the mtd/spi-nor we allocating memory    
> >>> address only    
> >>>> for detected Flash with exact size (usually we are not using 128MB    
> >>> Flash), and in that case usually we allocating much less memory.    
> >>>>
> >>>> To solve this issue we needed to overcome two things:
> >>>>
> >>>> 1.    Get argument from the upper layer (spi-mem layer)
> >>>> 2.    Calling the get argument function after SPI_NOR_SCAN function.    
> >>> (the MTD Flash size filled in  SPI_NOR_SCAN function)
> >>>
> >>> That's clearly breaking the layering we've tried to restore with the
> >>> spi-nor/spi-mem split, and I don't see why this is needed since we now
> >>> have a way to create direct mappings dynamically (with the dirmap API).
> >>> Have you tried implementing the dirmap hooks in your driver?    
> >>
> >>
> >>  Sorry but I wasn't familiar with the direct mapping in the spi-mem, it
> >> seems it needed to implemented in the m25p80 driver as well, am I correct?  
> > 
> > There's this patch [1] floating around. IIRC, Sergey was waiting for
> > the m25p80 -> spi-nor merge to send a v5. Vignesh, any updates on that
> > one? If you don't have time to work on that, maybe Sergey could send a
> > v5.
> >   
> 
> I did send an updated series of merging m25p80 to spi-nor last week and
> have received few comments. Will respin one more version this week
> (mostly by tomorrow).

Okay, great!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
