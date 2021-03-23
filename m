Return-Path: <SRS0=GnEg=IV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D9C1C433C1
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 09:38:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E9BF6192E
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 09:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E9BF6192E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3jfducll7C/6K9UTdykUquEtSbfv/JyiBvTNANTfTgg=; b=Fxc52iJACGz5VT8/pO0jLATFP
	+kPKnoyyn/4GphFkz4Ye24uaECcVxIwafEv1iF4to6lkbpYS+okUDp4VJoLZ8kb6YPXrgDj3TE4n/
	1L9ROxpkSaCLpTeIxXEXOYVoXW69HndcE8AbMOX7/lRpb6XOO1PnXTX3R/1z2GPEgzC2qH1cIreoS
	Nuqyj2SAFXWMa06f9hjQn73mmaUmOcsY+WdS8ObCN1+6tA3vW6feC3B2kSgkWzyJBQ6d3jdhtqwZ8
	TX8WAM8MqAxx1BjZqIOP23r/iY0VHIid7pK25jwUsTHoWu39p5sWQPFb8EA5rYkApUQ3axL7RhSoE
	7HgjsK7sQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOdUG-00ETrq-8f; Tue, 23 Mar 2021 09:38:08 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOdU6-00ETqZ-Jz
 for linux-mtd@lists.infradead.org; Tue, 23 Mar 2021 09:38:02 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12N9bp41110303;
 Tue, 23 Mar 2021 04:37:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1616492271;
 bh=lMMVKyFJzlJoeShELvMWIsSH9PNuNNEcc6pyxCzg6cQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Zc/gNEeUPwC04z7EYU6c0Oa8HjEWIrH6aVsu7yiwqoLDJkSjuGunJpyUGv/NVacFQ
 JWLGkJaATd8qYNK1ZxC5Y4ELm6Jzi71LkgjbP8YfRiTRBNgKAKrU9Q2guUlEJum/Dk
 tbjAy2T77ZtcnpdUUQFq9S6iNTaGTjgMr5PpdmMY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12N9bpkW044031
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 23 Mar 2021 04:37:51 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 23
 Mar 2021 04:37:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 23 Mar 2021 04:37:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12N9boZj002155;
 Tue, 23 Mar 2021 04:37:51 -0500
Date: Tue, 23 Mar 2021 15:07:49 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: sfdp: save a copy of the SFDP data
Message-ID: <20210323093747.snojk5kq7p6im4rq@ti.com>
References: <20210318092406.5340-1-michael@walle.cc>
 <20210318092406.5340-2-michael@walle.cc>
 <20210322142141.pd7ondg6l76idz7d@ti.com>
 <0efba47de8737059b4f3c593c26297bf@walle.cc>
 <20210322184214.ernzjfwfle6dfhpv@ti.com>
 <7e00a5fc05a186d5b34916e5a9f45a48@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e00a5fc05a186d5b34916e5a9f45a48@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_093759_309810_B4B53676 
X-CRM114-Status: GOOD (  34.61  )
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

On 22/03/21 11:31PM, Michael Walle wrote:
> Am 2021-03-22 19:42, schrieb Pratyush Yadav:
> > On 22/03/21 04:32PM, Michael Walle wrote:
> > > Am 2021-03-22 15:21, schrieb Pratyush Yadav:
> > > > On 18/03/21 10:24AM, Michael Walle wrote:
> > > > > +
> > > > > +	sfdp->num_dwords = DIV_ROUND_UP(sfdp_size, sizeof(*sfdp->dwords));
> > > >
> > > > The SFDP spec says that Parameter Table Pointer should be DWORD aligned
> > > > and Parameter Table length is specified in number of DWORDs. So,
> > > > sfdp_size should always be a multiple of 4. Any SFDP table where this is
> > > > not true is an invalid one.
> > > >
> > > > Also, the spec says "Device behavior when the Read SFDP command crosses
> > > > the SFDP structure boundary is not defined".
> > > >
> > > > So I think this should be a check for alignment instead of a round-up.
> > > 
> > > Well, that woundn't help for debugging. I.e. you also want the SFDP
> > > data
> > > in cases like this. IMHO we should try hard enough to actually get a
> > > reasonable dump.
> > > 
> > > OTOH we also rely on the header and the pointers in the header. Any
> > > other ideas, but just to chicken out?
> > 
> > Honestly, I don't think reading past the SFDP boundary would be too bad.
> > It probably will just be some garbage data. But if you want to avoid
> > that, you can always round down instead of up.
> 
> Like I said, while the storage will be rounded up to a multiple of
> DWORDs, only sfdp_size is transferred. Thus it case a pointer is not
> DWORD aligned, we end up with zeros at the end.
> 
> I'll add a comment.

Right.
 
> > This way you will only
> > miss the last DWORD at most. In either case, a warning should be printed
> > so this problem can be brought to the user's attention.
> 
> I was about to add a warning/debug message. But its the wrong place.
> It should really be checked in the for loop which iterates over the
> headers before parsing them. You could check sfdp_size but then two
> unaligned param pointers might cancel each other out.
> 
> This can be a seperate patch, besides adding a warning, should there
> be any other things to do, e.g. stop parsing and error out?

Just removing the bad table from the "tables to parse" list should be 
the most conservative option.

> 
> ..
> 
> > > > > +		goto exit;
> > > > > +	}
> > > > > +
> > > > > +	err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sfdp_size, sfdp->dwords);
> 
> Btw, this can be spi_nor_read_sfdp(). But I'm not sure, what this
> whole dma capable buffer should be. Is kmalloc(GFP_KERNEL)
> considered DMA safe?

I think spi_nor_read_sfdp_dma_unsafe() is meant for buffers that are 
allocated on stack. Both its current users pass in buffers on the stack. 
Also see bfa4133795e5 (mtd: spi-nor: fix DMA unsafe buffer issue in 
spi_nor_read_sfdp(), 2017-09-06).

sfdp->dwords is a DMA safe buffer, so you should directly use 
spi_nor_read_sfdp() here. All spi_nor_read_sfdp_dma_unsafe() does is 
allocate a buffer using kmalloc(GFP_KERNEL), pass it to 
spi_nor_read_sfdp() and copy the contents back.

> 
> The buffer ends in spi_nor_read_data(), which is also called from
> mtdcore:
> 
> spi_nor_read_sfdp()
>   spi_nor_read_raw()
>     spi_nor_read_data()
> 
> mtd_read()
>   mtd_read_oob()
>     mtd_read_oob_std()
>       spi_nor_read()
>         spi_nor_read_data()
> 
> Is the buffer passed from mtd_read() also DMA-safe? Doesn't the SPI
> drivers allocate DMA safe buffers if they need them?

SPI MEM at least requires the buffers to be DMA-safe. The comment for 
data.buf.in says "input buffer (must be DMA-able)".

Dunno if mtd_read() always passes a DMA-safe buffer though.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
