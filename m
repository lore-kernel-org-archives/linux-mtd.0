Return-Path: <SRS0=mmHb=FY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3370CC4361B
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Dec 2020 08:53:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3FC322D01
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Dec 2020 08:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3FC322D01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RovFTurn1H9Be2DtcZG4jDl0qfUcf9LpR5l9niTCfMU=; b=jOF7uUQRgarZFkGkh0beFnr5P
	JL/imaDBRP4bpGyvcC1d+b6DwdjOXQMQv3dgVhSnm+M3waarvBa9wI0Te2UZJjbr89M8aiMJu84VN
	SAEfDPeYv5LoI+fxkiMZnYcv9cQi4kokUEk1AB035kiQTICiPSpRf18lwCDTYGhOLxpkjLl2oqyJ3
	+F3trDTMvSySnTvl5uZ0JgGG3ZatVm526whVptB/NLsW0wSwREzxTVqAY4T6cqbbsWRMB1PzVMcHG
	YW3jntv5XwBM1uCK9Aah+4LXybzph1xQg00+TPqQVFf1bUluf41kzq3IyB+wRwZo7dpTNg/NN0YbB
	gcZ7K/viw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kquRn-0007kQ-I8; Sun, 20 Dec 2020 08:52:11 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kquRj-0007k4-PE
 for linux-mtd@lists.infradead.org; Sun, 20 Dec 2020 08:52:09 +0000
Received: by mail-io1-xd2b.google.com with SMTP id p187so6162850iod.4
 for <linux-mtd@lists.infradead.org>; Sun, 20 Dec 2020 00:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w8c/XeH3OhekJ65ae7Kgx4wvrNHsagFJtU/k//HI1M4=;
 b=YMSjafd6Z2zq89rEKkoTKZ/rpuUTS1q+QTc+UUitpCCne530mDPOFiDIDjTEUsMdRT
 +0ZxCmIIHD4BXPs6Duvj2OyajmAOWdhkz5yewC3D17VU00IQygHx3l3c/Sm0OKtIISiW
 w7MePh8WRnqBwZzH6Pr/kqcKxqcWi1sLHlcqCOeouZTZz6TaaCNH+LKbDieQmNn6s/Nf
 3WwSHTZLHIMB8R7CsIT7xFjFXST6tQybxx2Xi32/j1xV3kmi6ylsEoLWQodyLLvm46W1
 n6T8tlojb4LAOAlVvhAdf6NEW/NOdcgkDHqmSg9dxjUc5txkeitFzDgRjgzppKf5d5lv
 cR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w8c/XeH3OhekJ65ae7Kgx4wvrNHsagFJtU/k//HI1M4=;
 b=YwAY+TTQY3QaqHhXcurhe1o3+FWz8HU45aAMVVhpy2Lf1yGoOPuj4NDc4RLthy/V69
 IxGmYnwWVXGiZK6BICFBnMoRJLKKLNIF0SOVHcvE3kd4PtUgy2zVw8/P+yC9s88JNaxB
 Zx620gCyaFTYt3S/U86rfWo+Ei/hJcqPRUDHf68ptHo/rpGxbl24nNK6v3nK5mky/uXr
 lMA02mIIKTk6reYeLG4ZIKCc+ZzhPEF5/qV3ZbCx0P+MHOGbwgryDiuaFea8TowOrH5i
 hfbfTgAOOwWMo/leT3tE9jnQfGovIsbiwoObtXy87R5XfgDX8AJZi1xX7TYczmCTNfki
 3g8g==
X-Gm-Message-State: AOAM531JftIMDbREpJEbUg0cXrMoFfWHnUrA7DuwtLVjVR/uNVZCPO+s
 C+PcXJdyvQy8YxitLyXgO3ccTE7sMSQiB5ZxoSN+LMJlDZh/mA==
X-Google-Smtp-Source: ABdhPJyWtwahbrOCWKkgpwYXpuTw8UpnmhIQaW9Fm/mqd2Z3fZt7HE8h20HLeiDj5YSCQnmoh7qchbUaccnruZFbmSM=
X-Received: by 2002:a05:6602:1cb:: with SMTP id
 w11mr10320647iot.45.1608454321761; 
 Sun, 20 Dec 2020 00:52:01 -0800 (PST)
MIME-Version: 1.0
References: <20201215214656.649896-1-bert@biot.com>
 <410ca5c2-96a0-ffd0-e1c0-316fe37ff4d5@microchip.com>
 <faaa83e9-e702-abfc-e298-fda1fa224b69@biot.com>
In-Reply-To: <faaa83e9-e702-abfc-e298-fda1fa224b69@biot.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sun, 20 Dec 2020 16:51:50 +0800
Message-ID: <CAJsYDVLEggVBAm2zXe1V7jeAAwXACHrEj6UgiL9Wc-cNq=Zuww@mail.gmail.com>
Subject: Re: [PATCH] Add spi-nor driver for Realtek RTL838x/RTL839x switch SoCs
To: Bert Vermeulen <bert@biot.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_035208_064505_8E491867 
X-CRM114-Status: GOOD (  12.49  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, john.garry@huawei.com,
 open list <linux-kernel@vger.kernel.org>,
 vadivel.muruganx.ramuthevar@linux.intel.com, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

On Sun, Dec 20, 2020 at 7:01 AM Bert Vermeulen <bert@biot.com> wrote:
>
> On 12/16/20 9:30 AM, Tudor.Ambarus@microchip.com wrote:
> > On 12/15/20 11:46 PM, Bert Vermeulen wrote:
> >> This driver supports the spiflash core in all RTL838x/RTL839x SoCs,
> >> and likely some older models as well (RTL8196C).
> >>
> > Can we use SPIMEM and move this under drivers/spi/ instead?
>
> I wasn't aware spimem was the thing to use for new drivers. I will rewrite
> the driver to that API.

Are there any limitations preventing this from being implemented as a
generic SPI controller?
spi-nor and spi-mem are designed for controllers which can only perform
spi-mem/spi-nor specific transfers. I can't find such limitations from
your current driver code.

BTW I found a SPI controller driver for RTL8196C here: [0]
It seems pretty similar to the controller you are working on.

[0]: https://github.com/hackpascal/lede-rtl8196c/blob/realtek/target/linux/realtek/files/drivers/spi/spi-realtek.c

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
