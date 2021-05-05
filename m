Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C3AC433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 02:27:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCB3A613C0
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 02:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCB3A613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=suTzjFgH1bR8ftds5xSdX3Hs7KrOXS12WQHZWcWFaqc=; b=mYqrhvsdWrrT15rsDGiufmxWz
	1O/emG6Di6lED69yMToZqE3nOnFDa6Oia6WjyzXYvtL0GuINDoIdaSIjFaNIfrl4iPJeaJCE0cFVO
	1fSMQgpq5d5PDsVyMjEmDqsIuarnU6yF2MISarbGVosls2HPgFuF/4j3cSOkQd27HoSGkpJC+PYKV
	ykgIcHjpyBHLy9CG/b3aqeymbZgK+R3cR0zlXxdgvVd/lv8WY2Q/0ZrCTwJ6sXvRc79Uo7P9E1Ble
	/pVmu8P3z5Y8/J+0zPPzTIzVaEVtQv33fZ36tXm9UuusN0DtpAk7XyHhu1JQhB5vrme0h36yDfn/h
	qFr7jQoMQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1le7Ef-0002Cr-It; Wed, 05 May 2021 02:26:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le7Ec-0002C9-Ld
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 02:25:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jzwVum2+/9juPK5LM5DJ/Lk/hrj/V65BKpPJ1t47cqY=; b=fP+Vmbt/lvEapnJfaYsh7r9lX/
 ybXPHpV5/jJBN/ckx8Kz5LkitvXRBaVJL/Z/TntScIgr86hGTIDqwsUBgVbl3bsgW5KprBa66vr0y
 8u7AiOaMkmHxfjpUekIklL8Z2hc92yr9wKHal3H0SUcTbs4F+/v3TgKbgRMtYrJXNLzj8k7QI8BcD
 Y6gtPleytSOHXngRWlofwVPFyRi81XKgk2SdAC+oXwlwQF5XtcnN0Xr5W7ZLqs2bemm8sHV4zmFOF
 QPXMuw6JuKo2XlCCT7a3vWY3Q1DwY8g6Q6U3oL82g7BAuySHRM86jVNK1d2CBMZVrRF+s5h/TE8/U
 t7Kpi04w==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le7EZ-004PLU-Qv
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 02:25:57 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 gq14-20020a17090b104eb029015be008ab0fso23881pjb.1
 for <linux-mtd@lists.infradead.org>; Tue, 04 May 2021 19:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jzwVum2+/9juPK5LM5DJ/Lk/hrj/V65BKpPJ1t47cqY=;
 b=KEtmLm6j4radLcl9cDQktu0853z5NTK+aBIV7VuOSXqztdgJxAKTq2iMScRNkwvUMw
 koleQVyoRp+TUOvac6CpcWgw80LMK0e/CXJ+E37uRMP52dEMsgbn4ZjnugpgexVSu5eb
 eWgIWH3bjjn1QGhuf3CaMg1ElzPRDWzyBDvydm9yGslkqbAopg8EXat3rzOyCHH9bW6r
 YXpqfLLUyAMqBOb8zbUhZ448HYv89hMOQp/UBcHOwdQqLUiS2GsrtUWDvUvvi4KPO3nG
 +fyt/HqwfiHWgJSsvomIKw3F36gHxEhHyHurzZ/SwIYW+AM6q7uJavibPvKxw2frET6F
 YS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jzwVum2+/9juPK5LM5DJ/Lk/hrj/V65BKpPJ1t47cqY=;
 b=aFIM/ZN+YvBB9myvzB5YNEySS5OqeQIBcGWcPWbvFvptxwqFa46TiejcOv5RClWHL5
 31/+95+krEvoh9eIOpOH5RHlCrJen5EtZGP76DDtvVVhugv23z5NLq5J3D9h5HV5IDFX
 a1r8LfPaMS/79SiNdAYLJEZsgCcEnXNAGrtgleqwI1JqLt3NMw01cvHmiM/SGNEu6fAf
 nzqQmpBc6RPhbSLjfGH2X+nHQhyIbxfRRKHZCIhl2L31Ykhqg7/gUGSO7lPtUIW+rm7Y
 V8OF8pwG/IOOoXTBS5H8R78svW6muMo+wwVH9yHI/QEFZA+5JTVNRZGA/T5lRlD2CNA+
 Eoow==
X-Gm-Message-State: AOAM533pCbKYipYbIr2sDmMhN7MDdDONpprQBdS/Hej0GfZNg8LO+6Gh
 Ws2QaxXKmUARZtCB8jW07a0=
X-Google-Smtp-Source: ABdhPJx+7ncyxYzF+D9Ut7Vd8gc/agAQVPgvASA+kekBcxcw0+6UcXcYs8hp0S+QU6Xmp/sxOst4sg==
X-Received: by 2002:a17:90b:1b03:: with SMTP id
 nu3mr8781948pjb.62.1620181554276; 
 Tue, 04 May 2021 19:25:54 -0700 (PDT)
Received: from an990131127 (42-72-125-162.emome-ip.hinet.net. [42.72.125.162])
 by smtp.gmail.com with ESMTPSA id
 p126sm5004920pga.86.2021.05.04.19.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 19:25:53 -0700 (PDT)
Date: Wed, 5 May 2021 10:25:50 +0800
From: Shuhao Mai <shuhao.mai.1990@gmail.com>
To: David Bauer <mail@david-bauer.net>
Cc: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH] mtd: spi-nor: add support for Winbond W25Q512JV
Message-ID: <20210505022549.GA11@an990131127.quanta.corp>
References: <20210213151047.11700-1-mail@david-bauer.net>
 <00fdc79c-2a7f-c02f-3398-8102e5a68a53@microchip.com>
 <e9626369-dc44-8f64-606b-88098157bc7a@david-bauer.net>
 <8833cce1-a843-9b56-53ed-e9a2fd42d990@microchip.com>
 <20210310074120.GA63@an990131127.quanta.corp>
 <9150b806-17bb-cdfe-277b-0ca473a41e21@david-bauer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9150b806-17bb-cdfe-277b-0ca473a41e21@david-bauer.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_192555_915498_B4D79B2A 
X-CRM114-Status: GOOD (  31.94  )
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

On Fri, Apr 16, 2021 at 09:24:39PM +0200, David Bauer wrote:
> Hi Shuhao,
> 
> Sorry for coming back late to this.
> 
> On 3/10/21 8:41 AM, Shuhao Mai wrote:
> > On Tue, Mar 09, 2021 at 07:53:59AM +0000, Tudor.Ambarus@microchip.com wrote:
> >> On 3/8/21 8:03 PM, David Bauer wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>
> >>> Hi Tudor,
> >>>
> >>> On 3/8/21 6:50 AM, Tudor.Ambarus@microchip.com wrote:
> >>>> On 2/13/21 5:10 PM, David Bauer wrote:
> >>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>>>
> >>>>> The Winbond W25Q512JV is a 512mb SPI-NOR chip. It supports 4K
> >>>>> sectors as well as block protection and Dual-/Quad-read.
> >>>>>
> >>>>> Tested on: Ubiquiti UniFi 6 LR
> >>>>>
> >>>>> Signed-off-by: David Bauer <mail@david-bauer.net>
> >>>>
> >>>> David, I'll take Shuhao's patch because he sent it first:
> >>>> https://patchwork.ozlabs.org/project/linux-mtd/patch/20210208075303.4200-1-shuhao.mai.1990@gmail.com/
> >>>
> >>> Fine with me, I have not found this patch :)
> >>>
> >>>>
> >>>> Would you make an incremental patch on top op Shuhao's, to add the
> >>>> locking support?
> >>>
> >>> Sure, It's necessary for the board (UniFi 6 LR), as the bootloader locks the flash on boot.
> >>
> >> Is it necessary to unlock the flash at boot time?
> >> You can unlock the flash from user-space, using mtd-utils.
> >>
> >> Have you tried to lock/unlock portions of the flash using mtd-utils,
> >> and check if what was locked corresponds to what the datasheet indicates?
> >>
> >>>
> >>> I'll send a new patch for the lock support.
> >>>
> >> Great, thanks!
> >> ta
> > 
> > Hi Tudor and David,
> > 
> > 
> > I made a quick test on flash_lock with kernel 5.8.18 and mtd-utils
> > v2.1.2. It returns "could not lock device: /dev/mtd0" and "error 22
> > (Invalid argument)".
> > 
> > Could be the error caused by my test environment, if it's functional on
> > UniFi 6 LR.
> Were these partitions starting with the first / ending with the last block on the flash chip?
> Locking / unlocking mtd partitions not aligned at the beginning / end of the chip sound will
> return invalid argument.
> 
> For the UniFi 6 LR, these flags are required, as otherwise the lower half of the flash
> remains write protected (the bootloader actively enables this protection for whatever reason).
> 
> I'll send a rebased patch adding the required flags shortly.
> 
> Best wishes
> David
>

Hi David,

Thanks for advise, but the invalid argument is not caused by partition
alignment. I traced the flow of flash_lock, and it does relate to my
choice of platform.

In the function 'spi_nor_write_16bit_sr_and_check()', it will try to
read SR2 before writing to SR1. However, there's no handler for reading
SR2 in 'spi-nor/controllers/intel-spi.c'. It will return Invalid argument
if we try to do any operation to SR2 on Intel's platform currently.


Best Regards,
Shuhao

> > 
> > 
> > Sincerely
> > Shuhao
> > 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
