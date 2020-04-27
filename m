Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A319C54FCB
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 17:26:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B6AF2076A
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 17:26:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u4K0j5NX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B6AF2076A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yadavpratyush.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FvaNimnglw8NBfRBwsjpMyYV/vCsJkObvVIBUWn7fV4=; b=u4K0j5NXBkQv6s
	030PRieZgb1ptAbtgN8TG8szlQzCgktaFocfEJn/+1KfuXkw+790vcx4UQc8ZaQ6U70A4PXmvixDT
	nZOlAwySNTgzzT4L0eI13f2qgsGkMElLDXaPthbOaZ0BF3hiY+UOnMi8i6ds/AgPVhNANkv533iyF
	SaixYU/ppk7e/ggsCfTEXnfbpZoRT3vEiVEBtpEcAntXhZBwlPaBqXiAon5Uouw56G+RRWX6beqHU
	GPZz+0y0XDRACelY3jCAJiz1oz17Vr7m54gYz1x6u1PKv+GyGKsMzl0BBSj5apJtR7q46yuOA+IyE
	U6Bwa85tJdsSq/cfVmyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT7Wp-0006BN-9i; Mon, 27 Apr 2020 17:26:47 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT7WY-0005sg-6z; Mon, 27 Apr 2020 17:26:32 +0000
Received: from localhost (unknown [42.111.30.142])
 (Authenticated sender: me@yadavpratyush.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 984AF240006;
 Mon, 27 Apr 2020 17:26:18 +0000 (UTC)
Date: Mon, 27 Apr 2020 22:53:36 +0530
From: Pratyush Yadav <me@yadavpratyush.com>
To: Yicong Yang <yangyicong@hisilicon.com>
Subject: Re: [PATCH v4 05/16] mtd: spi-nor: default to address width of 3 for
 configurable widths
Message-ID: <20200427172336.ihezwq3wn75m7k3l@yadavpratyush.com>
References: <20200424184410.8578-1-p.yadav@ti.com>
 <20200424184410.8578-6-p.yadav@ti.com>
 <6b6384ad-d37a-eea6-af29-322e83924912@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6b6384ad-d37a-eea6-af29-322e83924912@hisilicon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_102630_405963_D3AB5752 
X-CRM114-Status: GOOD (  21.40  )
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
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sekhar Nori <nsekhar@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-spi@vger.kernel.org,
 Pratyush Yadav <p.yadav@ti.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Yicong,

On 26/04/20 11:53AM, Yicong Yang wrote:
> On 2020/4/25 2:43, Pratyush Yadav wrote:
> > JESD216D.01 says that when the address width can be 3 or 4, it defaults
> > to 3 and enters 4-byte mode when given the appropriate command. So, when
> > we see a configurable width, default to 3 and let flash that default to
> > 4 change it in a post-bfpt fixup.
> >
> > This fixes SMPT parsing for flashes with configurable address width. If
> > the SMPT descriptor advertises variable address width, we use
> > nor->addr_width as the address width. But since it was not set to any
> > value from the SFDP table, the read command uses an address width of 0,
> > resulting in an incorrect read being issued.
> >
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > ---
> >  drivers/mtd/spi-nor/sfdp.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> > index f917631c8110..5cecc4ba2141 100644
> > --- a/drivers/mtd/spi-nor/sfdp.c
> > +++ b/drivers/mtd/spi-nor/sfdp.c
> > @@ -460,6 +460,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
> >  	/* Number of address bytes. */
> >  	switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) {
> >  	case BFPT_DWORD1_ADDRESS_BYTES_3_ONLY:
> > +	case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4:
> >  		nor->addr_width = 3;
> >  		break;
> 
> Should we also assign address width to 3 in default condition. At least we should not
> leave it uninitialized here.

The default condition would be taken when this field is 3. The value 3 
is reserved, and so no current device should use this value. That said, 
I don't see any downsides of doing so. If the value 3 means something 
else in later revisions of the standard, this code would need to change 
anyway. If not, we would use a relatively sane default for devices with 
a faulty BFPT.

I haven't received any comments on my series so far. If end up having to
re-roll it, I will add this change. Otherwise, I'm not sure if it is a 
good idea to re-roll a 16-patch series for a one liner that isn't fixing 
some major bug. In that case, maybe you can send an independent patch 
that does this after mine is merged?

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
