Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D71C83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 08:54:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 073B5206C0
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 08:54:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NcbG4La9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 073B5206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yadavpratyush.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Ly07Eyord3/5SEFe2FKhLaQIV+eeIRS0/2YPT7qmYo=; b=NcbG4La9DQGKYu
	PJhIr0QQ6kPzQ0oE9j2zT+RMcGCDjE2Wjq60f/TqYceaCrE0VqiqGmP28HZVPPRxHwy4yKP/OEZZ1
	7+x2GGYQSW6Q4yeeXHfjeXAdCZZ0fTuxOvgqH1kAiZ1lHDBYAKGchnab+mzuQZFR24mOe5XW+Awp3
	CicrioG97eXIsshq0Wi3zNORWBa7CyNb6dYaXSeQ9BUhqBWSO17/YFky7vrsfi6UHrq3SsqM8pq6U
	nUEwL58KU1dbulQO2egqYkdpAm8Q5oF9iJaZ6d5/9lPXvKce9WfHDZfmEmsMj18j+VfZMZ56Df3Oy
	P+mx9Ebj05jAVriYvOCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTM0a-0003ve-2L; Tue, 28 Apr 2020 08:54:28 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTM0U-0003qg-W6
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 08:54:24 +0000
X-Originating-IP: 42.109.192.12
Received: from localhost (unknown [42.109.192.12])
 (Authenticated sender: me@yadavpratyush.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id C66A41C002A;
 Tue, 28 Apr 2020 08:54:15 +0000 (UTC)
Date: Tue, 28 Apr 2020 14:24:01 +0530
From: Pratyush Yadav <me@yadavpratyush.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v2 0/5] mtd: spi-nor: Add support for Octal 8D-8D-8D mode
Message-ID: <20200428085401.574wmo6qddmumd7q@yadavpratyush.com>
References: <1587451187-6889-1-git-send-email-masonccyang@mxic.com.tw>
 <20200421092328.129308f6@collabora.com>
 <20200427175536.2mmei2fy6f7bg6jm@yadavpratyush.com>
 <OF18214CA5.6A9B2B30-ON48258558.001D894C-48258558.002249E0@mxic.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF18214CA5.6A9B2B30-ON48258558.001D894C-48258558.002249E0@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_015423_307932_894317B6 
X-CRM114-Status: GOOD (  26.17  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, juliensu@mxic.com.tw,
 richard@nod.at, miquel.raynal@bootlin.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, broonie@kernel.org, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Mason,

On 28/04/20 02:14PM, masonccyang@mxic.com.tw wrote:
> 
> Hi Pratyush,
> 
> > > On Tue, 21 Apr 2020 14:39:42 +0800
> > > Mason Yang <masonccyang@mxic.com.tw> wrote:
> > > 
> > > > Hello,
> > > > 
> > > > This is repost of patchset from Boris Brezillon's
> > > > [RFC,00/18] mtd: spi-nor: Proposal for 8-8-8 mode support [1].
> > > 
> > > I only quickly went through the patches you sent and saying it's a
> > > repost of the RFC is a bit of a lie. You completely ignored the state
> > > tracking I was trying to do to avoid leaving the flash in 8D mode when
> > > suspending/resetting the board, and I think that part is crucial. If I
> > > remember correctly, we already had this discussion so I must say I'm a
> > > bit disappointed.
> > > 
> > > Can you sync with Pratyush? I think his series [1] is better in that 
> it
> > > tries to restore the flash in single-SPI mode before suspend (it's
> > > missing the shutdown case, but that can be easily added I think). Of
> > > course that'd be even better to have proper state tracking at the SPI
> > > NOR level.
> > 
> > Hi Mason,
> > 
> > I posted a re-roll of my series here [0]. Could you please base your 
> > changes on top of it? Let me know if the series is missing something you 
> 
> > need.
> > 
> > [0]  
> https://lore.kernel.org/linux-mtd/20200424184410.8578-1-p.yadav@ti.com/
> 
> 
> Our mx25uw51245g supports BFPT DWORD-18,19 and 20 data and xSPI profile 
> 1.0,
> and it comply with BFPT DWORD-19, octal mode enable sequences by write CFG 
> Reg2 
> with instruction 0x72. Therefore, I can't apply your patches.

I didn't mean apply my patches directly. I meant more along the lines of 
edit your patches to work on top of my series. It should be as easy as 
adding your flash's fixup hooks and its octal DTR enable hook, but if my 
series is missing something you need (like complete Profile 1.0 parsing, 
which I left out because I wanted to be conservative and didn't see any 
immediate use-case for us), let me know, and we can work together to 
address it.
 
> I quickly went through your patches but can't reply them in each your 
> patches.
> 
> i.e,.
> 1) [v4,03/16] spi: spi-mem: allow specifying a command's extension
> 
> -                                u8 opcode;
> +                                u16 opcode;
> 
> big/little Endian issue, right? 
> why not just u8 ext_opcode;
> No any impact for exist code and actually only xSPI device use extension 
> command.

Boris already explained the reasoning behind it.
 
> 2) [v4,08/16] mtd: spi-nor: parse xSPI Profile 1.0 table
> 
> need extract more data from xSPI profile 1.0 table and no other specific 
> setting. 

Not sure what you mean by "no other specific setting".
 
> 3) [v4,11/16] mtd: spi-nor: enable octal DTR mode when possible
> 
> +static int spi_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
> +{
> +                int ret;
> +
> +                if (!nor->params->octal_dtr_enable)
> +                                return 0;
> +
> +                if (!(spi_nor_get_protocol_width(nor->read_proto) == 8 ||
> +                      spi_nor_get_protocol_width(nor->write_proto) == 8))
> +                                return 0;
> +
> +                ret = nor->params->octal_dtr_enable(nor, enable);
> +                if (ret)
> +                                return ret;
> +
> +                if (enable)
> +                                nor->reg_proto = SNOR_PROTO_8_8_8_DTR;
> +                else
> +                                nor->reg_proto = SNOR_PROTO_1_1_1;
> +
> +                return 0;
> +}
> +
> 
> it seems you enable device in Octal mode after SPI-NOR Framework is 
> already
> in Octal protocol.
> Driver should set device by SPI 1-1-1 mode to enter Octal mode and then 
> setup
> Read/PP command and protocol by spi_nor_set_read/pp_setting() for Octal 
> mode,
> right ?

No. We need to setup Read and PP settings first. The overall flow is 
that we first run spi_nor_setup(). This will perform a "negotiation" 
between the controller and the flash to find out a common protocol they 
both support, and then change to that protocol in spi_nor_init(). Even 
if the flash supports octal DTR protocol, we can't use if if the 
controller doesn't. That is why we want to first select the protocol in 
the framework, and only then change the flash to that protocol.

In case the controller doesn't support 8D-8D-8D protocol, we would want 
to use 1S-1S-1S protocol so the flash is at least usable. Changing to 8D 
mode before finding this out would make the flash unusable.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
