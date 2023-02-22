Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CCBC61DA4
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Feb 2023 15:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y1FmcXEva6qfEHpwK4cOZT6/AEc6WkfUVD/pDm2Lk8Y=; b=E9aVsl4lTL0I02
	uj6i9r/mqCv7A9ahCt5JXQHtZy/A0F8RmTEhkeQ8tZqxyFaFD8YHrnO4ncV37QQyfwheKndEciFQx
	hU2r3uSKJOpyUvcqHwiGh/G6Mtq1bvez+LfqCbEIAMQvUnAzd+D1F2OaQyVPWluB6xmzyyKsvUCfI
	VDzjmdVmGqkVjZymk6rt7C+f+gn8exPHVs6Vxzs2ILEnWnZ0117GMz/8NCuzBfxA6pLZlaQ9qSH/q
	51KdBhm41FpBgPk1Z3rUTeicxPRfKDcVhaU+hwjgdnEQK8rSlKtOvC8ksj/ecNajXDASnLhGAlkBW
	8MqGr20ngAiv3StRTeew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUrBU-00CtVg-Cf; Wed, 22 Feb 2023 15:37:32 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUrBR-00CtU1-Mg
	for linux-mtd@lists.infradead.org; Wed, 22 Feb 2023 15:37:31 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 78ED33F57F
	for <linux-mtd@lists.infradead.org>; Wed, 22 Feb 2023 15:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1677080242;
	bh=8JWkkKuY/mBsg2CPf/80E/i9Tneo0oqJt3Gz/3GLDP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=W6JsaxrrKqSy2vwHXxTliRjOCidyVFfMr9JkWWaizxLNWk5hq5nWa8hwhdX+hL8qQ
	 MpssmPbmaHUe/I8Fj8ik/ue37VEnDEOooTh70dxVnNjrmIgVpkqjbjI/o503qP9JX2
	 oetHfD0s5VtLv7eS5CNgVeDP5cm9ZMxGPiw3iNB2SvURSxmECPMz+vE8SgJSlKkve9
	 yMl98aLj+k5cdKVQzBRPIx56kP7mkRbuLnD2IQSccc1HMp1TdGUc+b4fNsV/E3a58C
	 DEXIOjohCtMjtpmCaJ524KXd8BY+oKd0ErFfYjdNrb9m8pnSfegtt/p+4je8wZhxFB
	 46c6fBaTZx/Ew==
Received: by mail-ed1-f70.google.com with SMTP id ec13-20020a0564020d4d00b004a621e993a8so11101117edb.13
        for <linux-mtd@lists.infradead.org>; Wed, 22 Feb 2023 07:37:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JWkkKuY/mBsg2CPf/80E/i9Tneo0oqJt3Gz/3GLDP0=;
        b=TLSEDyHMMqzi4MXVsaLEiy7zrjlm1lg6KCJoJYXlRzMmvwAwhJVRKq2oeQRAt3RonD
         a3pKRBhLOKbHcSbRT9FwMlJuh/A8ct7adDkyLPaU9iZ6CFaUWsZjQJonuqTmx8WA+i5l
         XkLmpO7RsIuK3iJ83HmzV5lkc4A6DL4F7VS8Je7iKiDEaub9O0YPiNUcS75Bw2D6PDZb
         Y66CZaISVnFSH6VooakhLpDOX91njly2nfn8WEuX8WwqAlX96fR3hiyHRvAYwcbw/8/5
         jWjOPipmqi+FaAg4HM8kiwWCNcsFEsTqfykti7hWVRTS2v88ZKDu+kPVet1dzRVmrqiQ
         YAwg==
X-Gm-Message-State: AO0yUKW7G6Gia2MVnknKRqzm/9CGA5Lm4cGPFZ24oyQk/xFNbHbAAXRJ
	U6E2tyDSEArK1Od2WtOUGieSXZfFDKGDa/Wu96Yk62/ZsYROy2F6HJZXCRtVa4NGTYckR5sncvI
	P2IdRb6GrWULSJS9UukkzKXZ+PeyxOq9GDMVpOw94vrM=
X-Received: by 2002:aa7:d88f:0:b0:4ac:cb71:42c with SMTP id u15-20020aa7d88f000000b004accb71042cmr9373008edq.37.1677080241838;
        Wed, 22 Feb 2023 07:37:21 -0800 (PST)
X-Google-Smtp-Source: AK7set8nplrbIbgKrRBuUUF6Neaqb+KCYt+AJHeHCvX+8WacNd7VJXttTkv6+JQA5aVbfqHpGQxCeA==
X-Received: by 2002:aa7:d88f:0:b0:4ac:cb71:42c with SMTP id u15-20020aa7d88f000000b004accb71042cmr9372978edq.37.1677080241536;
        Wed, 22 Feb 2023 07:37:21 -0800 (PST)
Received: from localhost (host-79-44-179-55.retail.telecomitalia.it. [79.44.179.55])
        by smtp.gmail.com with ESMTPSA id co10-20020a0564020c0a00b004aab66d34c7sm4286713edb.7.2023.02.22.07.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 07:37:21 -0800 (PST)
Date: Wed, 22 Feb 2023 16:37:20 +0100
From: Andrea Righi <andrea.righi@canonical.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Cristian Birsan <cristian.birsan@microchip.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: fix shift-out-of-bounds in
 spi_nor_set_erase_type()
Message-ID: <Y/Y2sEZ5Ojos9fpg@righiandr-XPS-13-7390>
References: <20230221111346.34268-1-andrea.righi@canonical.com>
 <d87efbd8-5290-b462-beb3-c2d3be267ade@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d87efbd8-5290-b462-beb3-c2d3be267ade@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_073730_140305_E255B783 
X-CRM114-Status: GOOD (  29.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Feb 22, 2023 at 02:50:42PM +0000, Tudor Ambarus wrote:
> Hi!
> 
> This should be fixed by:
> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/commit/?h=spi-nor/next&id=f0f0cfdc3a024e21161714f2e05f0df3b84d42ad

Ah yes, this should definitely fix it.

It'd still like to do a check like is_power_of_2(size) in
spi_nor_set_erase_type(), to make sure we don't silently set size to
something non-standard, but I can send another patch for that, so for
now you can ignore this patch.

> 
> Which base did you use?

I used the latest git from Linus' repository that doesn't have this
commit yet.

Thanks,
-Andrea

> 
> Cheers,
> ta
> 
> On 2/21/23 11:13, Andrea Righi wrote:
> > It seems that according to JEDEC JESD216B Standard erase size needs to
> > be a power of 2, but sometimes we set the size to 0 (e.g., in
> > spi_nor_parse_4bait()) causing UBSAN warnings like the following:
> > 
> >    UBSAN: shift-out-of-bounds in drivers/mtd/spi-nor/core.c:2026:24
> >    shift exponent 4294967295 is too large for 32-bit type 'int'
> >    Hardware name: Dell Inc. XPS 13 9300/077Y9N, BIOS 1.11.0 03/22/2022
> >    Call Trace:
> >     <TASK>
> >     show_stack+0x4e/0x61
> >     dump_stack_lvl+0x4a/0x6f
> >     dump_stack+0x10/0x18
> >     ubsan_epilogue+0x9/0x3a
> >     __ubsan_handle_shift_out_of_bounds.cold+0x61/0xef
> >     spi_nor_set_erase_type.cold+0x16/0x1e [spi_nor]
> >     spi_nor_parse_4bait+0x270/0x380 [spi_nor]
> >     spi_nor_parse_sfdp+0x47f/0x610 [spi_nor]
> > 
> > Fix by checking if size is a power when setting struct
> > spi_nor_erase_type, otherwise consider size, mask and shift as invalid.
> > 
> > Fixes: 5390a8df769e ("mtd: spi-nor: add support to non-uniform SFDP SPI NOR flash memories")
> > Reported-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
> > ---
> >   drivers/mtd/spi-nor/core.c | 12 +++++++++---
> >   1 file changed, 9 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index d67c926bca8b..3c5b5bf9cbd1 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -2019,11 +2019,17 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
> >   void spi_nor_set_erase_type(struct spi_nor_erase_type *erase, u32 size,
> >   			    u8 opcode)
> >   {
> > -	erase->size = size;
> >   	erase->opcode = opcode;
> >   	/* JEDEC JESD216B Standard imposes erase sizes to be power of 2. */
> > -	erase->size_shift = ffs(erase->size) - 1;
> > -	erase->size_mask = (1 << erase->size_shift) - 1;
> > +	if (likely(is_power_of_2(size))) {
> > +		erase->size = size;
> > +		erase->size_shift = ffs(erase->size) - 1;
> > +		erase->size_mask = (1 << erase->size_shift) - 1;
> > +	} else {
> > +		erase->size = 0u;
> > +		erase->size_shift = ~0u;
> > +		erase->size_mask = ~0u;
> > +	}
> >   }
> >   /**

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
