Return-Path: <SRS0=eGw4=FM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA25C4361B
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 01:20:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABFFF205ED
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 01:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABFFF205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6qqEMmoNXi0DSGdXmmstfkv50d6Y4moiXnBfn/A1NLc=; b=LqDsUXeBctT/mSRMpdgf9yCYk
	KrXOX+dcM5JFM+MxUv35/IB7nBrXprXwGN70ypkwvw3k5CHG38bBB96HSLFKPLTHT5TILVxI14Ldb
	ITrS5RyJYFsxJJWNv5tS9PWMEY8EpQUAv3pxl/hXC/2Xi2n22MOoYvhIdxAxo1eZLwAmuvdwVeyCg
	uvBuVXVNaHV+02dQIOrC7Ifpj549yQifuWNRi1MFwr06lSVFgPfbz4CLcvu84IIp89Eoh5ohSDf6q
	RtjbdUU77NW9To9TVNCQF7WJ+g/NSXrgQqkr8rwcdLNXDhUEWrJCWtD8UiWLDOVgR7nGXPGj/HNFM
	j1RqhOSPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmRfP-0003Pe-Ud; Tue, 08 Dec 2020 01:19:48 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmRfN-0003P7-4L
 for linux-mtd@lists.infradead.org; Tue, 08 Dec 2020 01:19:46 +0000
Received: by mail-pl1-x642.google.com with SMTP id u4so424846plr.12
 for <linux-mtd@lists.infradead.org>; Mon, 07 Dec 2020 17:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lFbuQKLeAhpAAfgYiFKXrW7VWl8h2CMcWnPvP0ViZ/4=;
 b=uxUBtVmrMtQ5jQorGj0gobnzg71+HD0mvLX7WlgSaDnuvVEeLunog/VsCzRw2GLLuC
 RAyAYHLdpm/w/csWMtw19quePNvzc4rDWkjjgNtxqBIeR7EUde2mFAV9GYDJo8Dl12PI
 CPVQFapQV7PVZQrahrPmfUu3vtUhd2ypQ+BZXbsrdMBz4AYN8zH9GLW97c5ghobIpJBO
 VexuUo5wWJ8vtOVq4TY2X7qsH0mR9vJp7KpN/16f3NXaezsUiNDj7S2UBP+mbm0wRE2j
 zpVMJln0m4vuiW3JzmgxWsSvBWYYGrkuiSLAfdNwDHBINaFzWBZ0P83Z3gd2L4BBiE8j
 x9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lFbuQKLeAhpAAfgYiFKXrW7VWl8h2CMcWnPvP0ViZ/4=;
 b=t0WtyqDqdwnmIZXA/kQ3Erlkz8tLdYhicczxQFXE5XUy5NfGT8V1wAof5RWHX4qcah
 jtP4+YDmaEwtVGGOWpFmMp2cOTaetfVJlxu5HWyC2BdjvA+tjsiXlWLBBbknf8zF5uyN
 +oj2awnyLtgg7tHPmyMir1ctKtplqHU+2sjZ63U/bz7696VHS2Qo6rZ5QiC8nbZnAOFH
 3WRA6SdfT6dEdLo1VHeK+33azfc2ctLAKYJHwAtvqj2vrjOH0KiCI3zZ34+nZjM9DIJD
 QHjoVlyu+p+9iIluJSy7rgxYVXH0fYDx5QkciiAYWFCB5Fzl6xNZNhyOocExOd2Kk+SU
 5xcw==
X-Gm-Message-State: AOAM533vVKbAl6mBgl5CB70nUvR+pJX0flWfn9t3LhSeHrRGUqHbGB19
 sjUrXeVnrptWze/KwTjWf8m1PxRz4CAc4rsN/1I=
X-Google-Smtp-Source: ABdhPJzKGVZDeflu26vkS5pCHroCNG0RjvHZTgh+6J2ah4TzDpxmXD1Dvm32CJnGbybS1z20Xbw14g==
X-Received: by 2002:a17:902:ac90:b029:da:fd0c:53ba with SMTP id
 h16-20020a170902ac90b02900dafd0c53bamr6110596plr.23.1607390382566; 
 Mon, 07 Dec 2020 17:19:42 -0800 (PST)
Received: from DESKTOP-8REGVGF.localdomain ([124.13.157.5])
 by smtp.gmail.com with ESMTPSA id mj5sm472656pjb.20.2020.12.07.17.19.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 07 Dec 2020 17:19:42 -0800 (PST)
Date: Tue, 8 Dec 2020 09:19:38 +0800
From: Sieng Piaw Liew <liew.s.piaw@gmail.com>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH] mtd: spi-nor: macronix: enable 4-bit BP support for
 MX25L6405D
Message-ID: <20201208011938.GB12175@DESKTOP-8REGVGF.localdomain>
References: <20201207024612.1318-1-liew.s.piaw@gmail.com>
 <cc1a8c52-6319-2d37-8df8-f6205bdbfb37@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cc1a8c52-6319-2d37-8df8-f6205bdbfb37@microchip.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_201945_239723_6784CAA9 
X-CRM114-Status: GOOD (  20.89  )
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

On Mon, Dec 07, 2020 at 05:53:20PM +0000, Tudor.Ambarus@microchip.com wrote:
> Hi, Sieng,
> 
> On 12/7/20 4:46 AM, Sieng Piaw Liew wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Enable 4-bit Block Protect support for MX256405D and its variants using
> > the same ID.
> > 
> > Tested on Innacom W3400V6 router with MX25L6406E chip.
> 
> :) What kind of tests did you exactly make?

OpenWrt cannot write into spi-nor after first boot.
After hacking 4-bit BP support into OpenWrt's kernel v5.4, writing works.

> 
> > https://github.com/openwrt/openwrt/pull/3501
> > 
> > Signed-off-by: Sieng Piaw Liew <liew.s.piaw@gmail.com>
> > ---
> >  drivers/mtd/spi-nor/macronix.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> > index 9203abaac229..7aa8b1ee9daa 100644
> > --- a/drivers/mtd/spi-nor/macronix.c
> > +++ b/drivers/mtd/spi-nor/macronix.c
> > @@ -42,7 +42,8 @@ static const struct flash_info macronix_parts[] = {
> >         { "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
> >         { "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
> >         { "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
> > -       { "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
> > +       { "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128,
> > +                             SECT_4K | SPI_NOR_4BIT_BP) },
> 
> I assume this won't work because it misses the SPI_NOR_HAS_LOCK flag.
> 
> Cheers,
> ta

Yes, I'll have v2 patch sent shortly.

> 
> >         { "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
> >         { "mx25u3235f",  INFO(0xc22536, 0, 64 * 1024,  64,
> >                               SECT_4K | SPI_NOR_DUAL_READ |
> > --
> > 2.17.1
> > 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
