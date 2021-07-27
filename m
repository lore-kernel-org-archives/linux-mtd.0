Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5CCEC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 10:46:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66FBA61108
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 10:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66FBA61108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+/FTAjdFNvqg9A6Olhnfdprbgf/r11+W4vEcCYGxjq4=; b=4jJrN8Y7pviFzD
	wya2UWMqM5XuSGFvXtVEoC+GCOaM/+BWIUDREm75RgKWNsQZ1V4baOLM0gZ4XbORkcoetF9wQ88Fs
	9NOVOXEwx7GvVlHTZBc9/dabMWdno9V0H27pKDfEAELqTFUNE/v90Sx2torQjmIp/kqcEanc0rXkD
	KOGp+YcHoZu4TCQvoo6Gi/uheUiIq4jlz97e+h8Rkz9t77eMPnDBh/gtWG2uD8WYDfdHtfTwpKxIF
	0YNlzrlCMUBCqfs6pj0qWiAOOmcIp+zmsZcvaRcwiaA5J4YfhJ1XJwaedh+fqitVM+tVfXndmeeFp
	1jHMho1D5PgT73n+FwGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Kao-00EUHN-Kk; Tue, 27 Jul 2021 10:45:46 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8Kak-00EUGF-LI
 for linux-mtd@lists.infradead.org; Tue, 27 Jul 2021 10:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1627382742; x=1658918742;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IBaHE26ecbFT2WR+ipD7OHCSKKDIkgeOggpQrOqRaGE=;
 b=pUWaMPvUtQ0Jq2xP8BUVTzLfTM+cFtAYDT0HM1M//kJsy8f3qNWcgLUu
 VU997seVSateKUYdFwzs0KZ7faW7rOaWIaRFLUuwrjrZB51e/FwdIkEOX
 U1qH3lE33azRlh2NDj91MoXy9iFIaKBsw5fTaRlEDWhPytOs9fG1/9n+k
 2xBQt4o1MDgZSIXCAbshDXQlwZpnXUYk4Mv2yb/jq4Olw663RajKajDf8
 kQtnKMGrsUuub5I68vwhG9YrIKHqeQupPmRdnQYrUrKqaS3CvO4PVClTU
 y3nRZcgHDu6exYi3HafALkWrqd6gvyJHbXZp1mLBiQPJLXBOnoDAhXDt+ Q==;
X-IronPort-AV: E=Sophos;i="5.84,273,1620684000"; d="scan'208";a="18662240"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 27 Jul 2021 12:45:37 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 27 Jul 2021 12:45:37 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 27 Jul 2021 12:45:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1627382737; x=1658918737;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IBaHE26ecbFT2WR+ipD7OHCSKKDIkgeOggpQrOqRaGE=;
 b=Ksng7V4lnewvS/L51Pywe8mO2/qneJgNf60gcDmpqUHokSyLIXHJVNpV
 RosnSnzwYPl2F2T4e27qgpa/wAf9aH51fstFvv2wk7IF0I5YvI8xQShhK
 yFggNOm0vDXwrxvcY8vYgDIDkaDRDPEtfTlxG3eKUM9Rrx+q2ztCOmTGG
 wMk/Zp10RlHyWQfELUxxzQxYxX1miHUug7dQI5OgHKBb+WLcAa4VrjOQc
 391diUQP0Z3rS95neFxh9MyIyjxDgEkvfE3YP8rtlUdl5/XlFp0DmJiMi
 wSPyS8Jb7vYN9GFbwxDIu/jsyOSZ0Qsg5orao7qjc4QEDxWzjunTN1N1C g==;
X-IronPort-AV: E=Sophos;i="5.84,273,1620684000"; d="scan'208";a="18662239"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 27 Jul 2021 12:45:37 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.121.48.12])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 16580280070;
 Tue, 27 Jul 2021 12:45:37 +0200 (CEST)
Message-ID: <42380415413178b18e940ae80298c22c51275b95.camel@ew.tq-group.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: micron-st: sync flags of mt25ql02g
 and mt25qu02g with other mt25q
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>,  Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 27 Jul 2021 12:45:34 +0200
In-Reply-To: <f3dbab898e9f1946129e5733095bdf3c@walle.cc>
References: <c7b6c666aef9a8a2195acabe9954a417f04b6582.1627039534.git.matthias.schiffer@ew.tq-group.com>
 <f3dbab898e9f1946129e5733095bdf3c@walle.cc>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_034543_096500_A489320A 
X-CRM114-Status: GOOD (  26.37  )
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

On Tue, 2021-07-27 at 09:09 +0200, Michael Walle wrote:
> Am 2021-07-23 13:27, schrieb Matthias Schiffer:
> > All mt25q variants have the same features.
> > 
> > Unlike the smaller variants, no n25q with 2G exists, so we don't need 
> > to
> > match on the extended ID to distinguish n25q and mt25q series for these
> > models.
> 
> But why shouldn't we? What if there will be another flash with
> the same first three id bytes?

That makes sense, I'll update my patch accordingly.

It looked to me like the current ID list only checks the extended ID
when necessary to distinguish two known flash models.


> 
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > ---
> >  drivers/mtd/spi-nor/micron-st.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/micron-st.c 
> > b/drivers/mtd/spi-nor/micron-st.c
> > index c224e59820a1..d5baa8762c8d 100644
> > --- a/drivers/mtd/spi-nor/micron-st.c
> > +++ b/drivers/mtd/spi-nor/micron-st.c
> > @@ -181,11 +181,11 @@ static const struct flash_info st_parts[] = {
> >  			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
> >  			      NO_CHIP_ERASE) },
> >  	{ "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096,
> > -			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
> > -			      NO_CHIP_ERASE) },
> 
> This bothers me. I'm not sure how this will work. I see that
> chip erase is command 0xc7, but both the new and the old flash
> just supports 0xc3 (DIE ERASE). Did you test these changes?

Thanks for catching this. I overlooked that the 1G and 2G variants
don't support the same erase commands as the smaller versions after
all... It is possible that I only tested this with partitioned MTD, so
I didn't hit the whole-chip erase case.

Which command should I use to test the chip erase? Will a `flash_erase
/dev/mtdX 0 0` trigger the correct operation?




> 
> > +			      SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
> > +			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> >  	{ "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096,
> >  			      SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
> > -			      SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
> > +			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> > 
> >  	{ "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
> >  	{ "m25p10",  INFO(0x202011,  0,  32 * 1024,   4, 0) },
> 
> -michael


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
