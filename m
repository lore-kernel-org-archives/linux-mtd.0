Return-Path: <SRS0=RLHh=GQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DB7C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Jan 2021 10:41:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 749B12339F
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Jan 2021 10:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 749B12339F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RxambUnJSwB4vXvBSzbn8MRg4dxfqxtIcT7Qot7l1nA=; b=uFNln0B6VewsRALaBalIgKQUD
	OeLqW3/XoQS9T8OUgVXbZ1JX6ekrhBL/Ut4EJTyxad0gOvg3w96a4lJhesdqI8UkGDBkcVgwFgJSW
	BleTKIfrxUakP4krMWe6DsvJTzLWHYBQ5Rk88fRX5uad1b3hw5sUTg4+MFJhiAWXVrG43vGE3I1j3
	Hrott77M6eS96qic1mfRsu/VcjShW/yoftQDAn/Iu9Ya6rnNZs5xl14GTMMX6XCNJ4RgQHZdOFe2F
	nEDmvQ1WEdKpVs1KtiJeuYolXaq3CTpxaIUoAOXccaxo8qPdm7jFV7GW8jvHvIpPWgzl6Tv8otJs6
	HcJzxZ8/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzdaD-0001XI-Iw; Wed, 13 Jan 2021 10:40:57 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzda9-0001WU-VK
 for linux-mtd@lists.infradead.org; Wed, 13 Jan 2021 10:40:54 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id g4so1683932ybo.11
 for <linux-mtd@lists.infradead.org>; Wed, 13 Jan 2021 02:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M4GfE42kBtvCWi2ob5yS+LHJ+0FeSDKJaF01TmLR5ac=;
 b=nAvLpvEMNuNOZr4+QhajAIas+1f9eC3ZI/pAJRq51nHl+QK/HZtuRYm1W/CVS+KXfV
 +9E0CNlyP61d9O6cApQYt7wvB7iAULJjPU79Q4qeyvOHZ+zOz4GHuU7dBrEKJjalqiWY
 ydp5p0QUFSEChQf+Vpvy/nOrx03WbOc/chqGBMAcCFGOz4F5BAlUtMKVwm+DB0s6llKV
 iCw/eCnAoX4JSNE0Gubp+rIne+3quHIXagWtV20OLaDCXp2ekd72LVYiaIMlJr4sz2F+
 XTunnP66+XXtQJoIqqhPSM+gE7ZJlfvL4h6Lyy1qCX62CmLD83w49EEzruyJ7lSy+NLu
 8xoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M4GfE42kBtvCWi2ob5yS+LHJ+0FeSDKJaF01TmLR5ac=;
 b=iiWsmRQ/VkNio5aAFScezR7SQrEtDjOU++8ZOrpOiydefpt2LAoDCBSY02IPYcNpvU
 9G47chdMx7tN7/f5EzxkAIDEpb4IGplAywIeohjw7+bvHxc4KL7gMi0d5w4E63fAQEoz
 fKDTaplkuT1slnNW8ilCygSDbWUvgNeHo8UefH3NwHokH9A5G4GxU++Dqrq/0df6VwGI
 6Fty1jbADPOYjYk54Oqzkq1pWm+no2xpOSr3MGgzQ3yyo8yIoDU2aCAr0Pvtx6TdIRoK
 lDHxrXtpDqqK6cEwcGgIMEUoLKpjcU5/GdsZ11ANDgg9E3ba8fAiU/SA4TEg3wwpkQoo
 zyAg==
X-Gm-Message-State: AOAM531oWjTUhSiWxqr5uLmoD/RAyRfCqXYJ0o29PdDc/h8bkz8/bGmw
 4WZzoZBTFpiMbrXCkEkK5ePGLv7UNJ/WI1HWXGM=
X-Google-Smtp-Source: ABdhPJwhhyuHqAslX1NsvSR90DcrNZ+JX6Sfw5mdEXppYf+VxyWeRkbV6ryKC7sx4TBU+iG4XJBXelqUROXzGLUkPwE=
X-Received: by 2002:a25:4d7:: with SMTP id 206mr2436247ybe.306.1610534451933; 
 Wed, 13 Jan 2021 02:40:51 -0800 (PST)
MIME-Version: 1.0
References: <CAEUhbmUXiwiuPXHkAcfFQeNkp9xZk3gfCi+oVKSr2MF+5C44Zg@mail.gmail.com>
 <6396018a-485f-6eb4-7742-bdb5c4335ed4@microchip.com>
In-Reply-To: <6396018a-485f-6eb4-7742-bdb5c4335ed4@microchip.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 13 Jan 2021 18:40:40 +0800
Message-ID: <CAEUhbmVKa69FWG-+NbG2aV1ZkpQjnEEsghS803V5f_GUAYkkBg@mail.gmail.com>
Subject: Re: spi-nor dummy bytes for fast read command
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_054054_075385_F5847A54 
X-CRM114-Status: GOOD (  23.92  )
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
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Vignesh R <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jan 13, 2021 at 6:04 PM <Tudor.Ambarus@microchip.com> wrote:
>
> On 1/13/21 4:06 AM, Bin Meng wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Hi,
>
> Hi,
>
> >
> > It seems both U-Boot and Linux kernel spi-nor drivers have the same
> > assumption on dummy cycles required in a fast read command.
> >
> > In U-Boot spi_nor_read_data(), there is a logic to calculate the dummy
> > bytes needed for fast read command:
> >
> >     /* convert the dummy cycles to the number of bytes */
> >     op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
> >
> > This logic assumes the (nor->read_dummy * op.dummy.buswidth) is a
> > multiple of 8, otherwise this won't work.
> >
> > In Linux, the same logic exists in spi_nor_spimem_read_data().
> >
> > Note on most flashes this is not a problem, however on some flashes
> > the dummy cycles for the fast read command is configurable. If the
> > dummy cycle is configured to some odd value which makes this
> > assumption false, then we get a non-working driver.
> >
>
> Right. We should use dummy cycles directly and get rid of the
> dummy bytes logic. I have this in my todo queue for linux.

Thanks! Good to know this will be improved.

I got another dummy cycle question during testing N25Q512 flash with
the Xilinx ZynqMP Generic QSPI controller.
The N25Q512 flash datasheet is at [1].

It seems both U-Boot and Linux spi-nor drivers assume that the dummy
cycle bus width is equal to the address bus width. See codes:

spi_nor_read_data() in u-boot/drivers/mtd/spi/spi-nor-core.c:

op.dummy.buswidth = op.addr.buswidth;

spi_nor_spimem_setup_op() in linux/drivers/mtd/spi-nor/core.c:

        if (op->dummy.nbytes)
                op->dummy.buswidth = spi_nor_get_protocol_addr_nbits(proto);

However the following Xilinx U-Boot driver:
https://github.com/Xilinx/u-boot-xlnx/blob/master/drivers/spi/zynqmp_gqspi.c#L611

programs the controller's dummy cycle bus width to 4 (QSPI) when
issuing the Fast Read Quad Output (6Bh). I changed the codes to
program dummy cycle bus width to 1 (SPI) but the command did not read
the flash contents at all.

The board has a N25Q512 flash, and the datasheet does not state
crystal clearly how many lines are used for 6Bh. Only figure 19
showing the command sequence could be interpreted that dummy cycles
need to be on 4 lines for 6Bh. But still it is not clear.

Do you, or anyone happen to know whether this is indeed the case for
N25Q512 flash? If yes, I think we will need some fix-ups in U-Boot and
Linux spi-nor drivers for the Numonyx/Micron flashes?

[1] https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/n25q/n25q_512mb_1ce_3v_65nm.pdf

Regards,
Bin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
