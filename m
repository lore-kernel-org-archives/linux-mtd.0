Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE92FC83003
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 08:37:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1FA520731
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 08:37:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p8JG8vZi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1FA520731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/sngD0prn5Cuv/qCnHO9jogjZimmDSbyPFKVFG1RkwQ=; b=p8JG8vZilOS6XX
	HVefZ5g+8IMUbE43YE/X16hd8G/SpgThMLLvkRFocKHihb7K4jclzHzcgrt5rWlIdO5TjZTjvR7rT
	tlDbU3Ni8okEux5vTqbKztB4k1PlNC9yby0/4VlrhA3zoPWT6Z/Y61+xolUkVREVPqAMU3sh1sJq1
	dswEi89hJT2KDXvmi1oBSyygcS6HSOV0DoxjC0wP2eluHhdeDGbAvO3wHEWfOD99OIg8adJ2JVzGj
	TdOR6dwBvzsVfGk+/uHVl2JLVll+7t6kaDdMILniyGssiymFEkHpRJ15Yg5iRJwuwj8lz0tRo+bzK
	EOvM7BaV2XNYxmXUFieQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTiDo-0004F9-QQ; Wed, 29 Apr 2020 08:37:36 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTiDl-0004EQ-Mm
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 08:37:35 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 862B52A205F;
 Wed, 29 Apr 2020 09:37:31 +0100 (BST)
Date: Wed, 29 Apr 2020 10:37:27 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v2 0/5] mtd: spi-nor: Add support for Octal 8D-8D-8D mode
Message-ID: <20200429103727.20835000@collabora.com>
In-Reply-To: <OF04289CE2.B346916F-ON48258559.002280BD-48258559.00295800@mxic.com.tw>
References: <1587451187-6889-1-git-send-email-masonccyang@mxic.com.tw>
 <20200421092328.129308f6@collabora.com>
 <20200427175536.2mmei2fy6f7bg6jm@yadavpratyush.com>
 <OF18214CA5.6A9B2B30-ON48258558.001D894C-48258558.002249E0@mxic.com.tw>
 <20200428085401.574wmo6qddmumd7q@yadavpratyush.com>
 <OF04289CE2.B346916F-ON48258559.002280BD-48258559.00295800@mxic.com.tw>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_013734_010044_B3909A98 
X-CRM114-Status: GOOD (  31.64  )
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
 richard@nod.at, Pratyush Yadav <me@yadavpratyush.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 29 Apr 2020 15:31:35 +0800
masonccyang@mxic.com.tw wrote:

> Hi Pratyush,
> 
>  
> > > > > On Tue, 21 Apr 2020 14:39:42 +0800
> > > > > Mason Yang <masonccyang@mxic.com.tw> wrote:
> > > > >   
> > > > > > Hello,
> > > > > > 
> > > > > > This is repost of patchset from Boris Brezillon's
> > > > > > [RFC,00/18] mtd: spi-nor: Proposal for 8-8-8 mode support [1].  
> > > > > 
> > > > > I only quickly went through the patches you sent and saying it's a
> > > > > repost of the RFC is a bit of a lie. You completely ignored the   
> state
> > > > > tracking I was trying to do to avoid leaving the flash in 8D mode   
> when
> > > > > suspending/resetting the board, and I think that part is crucial.   
> If I
> > > > > remember correctly, we already had this discussion so I must say   
> I'm a
> > > > > bit disappointed.
> > > > > 
> > > > > Can you sync with Pratyush? I think his series [1] is better in   
> that 
> > > it  
> > > > > tries to restore the flash in single-SPI mode before suspend (it's
> > > > > missing the shutdown case, but that can be easily added I think).   
> Of
> > > > > course that'd be even better to have proper state tracking at the   
> SPI
> > > > > NOR level.  
> > > > 
> > > > Hi Mason,
> > > > 
> > > > I posted a re-roll of my series here [0]. Could you please base your   
> 
> > > > changes on top of it? Let me know if the series is missing something   
> you 
> > >   
> > > > need.
> > > > 
> > > > [0]   
> > >   
> https://lore.kernel.org/linux-mtd/20200424184410.8578-1-p.yadav@ti.com/
> > > 
> > > 
> > > Our mx25uw51245g supports BFPT DWORD-18,19 and 20 data and xSPI   
> profile 
> > > 1.0,
> > > and it comply with BFPT DWORD-19, octal mode enable sequences by write   
> CFG 
> > > Reg2 
> > > with instruction 0x72. Therefore, I can't apply your patches.  
> > 
> > I didn't mean apply my patches directly. I meant more along the lines of   
> 
> > edit your patches to work on top of my series. It should be as easy as 
> > adding your flash's fixup hooks and its octal DTR enable hook, but if my   
> 
> > series is missing something you need (like complete Profile 1.0 parsing,   
> 
> > which I left out because I wanted to be conservative and didn't see any 
> > immediate use-case for us), let me know, and we can work together to 
> > address it.  
> 
> yes,sure!
> let's work together to upstream the Octal 8D-8D-8D driver to mainline.
> 
> The main concern is where and how to enable xSPI octal mode?
> 
> Vignesh don't agree to enable it in fixup hooks and that's why I patched
> it to spi_nor_late_init_params() and confirmed the device support xSPI 
> Octal mode after BFPT DWORD-19 and xSPI pf 1.0 have been parsed.
> 
> I can't apply your patches to enable xSPI Octal mode for mx25uw51245g 
> because your patches set up Octal protocol first and then using Octal 
> protocol to write Configuration Register 2(CFG Reg2). I think driver
> should write CFG Reg2 in SPI 1-1-1 mode (power on state) and make sure
> write CFG Reg 2 is success and then setup Octa protocol in the last.
> 
> As JESD216F description on BFPT DOWRD 19th, only two way to enable 
> xSPI Octal mode;
> one is by two instruction: issue instruction 06h(WREN) and then E8h.
> the other is issue instruction 06h, then issue instruction 72h (Write
> CFG Reg2), address 0h and data 02h (8D-8D-8D).
> 
> Let our patches comply with this. you may refer to my patches
> [v2,3/5] mtd: spi-nor: Parse BFPT DWORD-18, 19 and 20 for Octal 8D-8D-8D 
> mode
> 
>                  /* Octal mode enable sequences. */
>                  switch (bfpt.dwords[BFPT_DWORD(19)] & 
> BFPT_DWORD19_OCTAL_SEQ_MASK) {
>                  case BFPT_DWORD19_TWO_INST:
> +       ----> to patch here.
>                                  break;
>                  case BFPT_DWORD19_CFG_REG2:
>                                  params->xspi_enable = 
> spi_nor_cfg_reg2_octal_enable;
>                                  break;
>                  default:
>                                  break;
>                  }
> 
> 
> >   
> > > I quickly went through your patches but can't reply them in each your 
> > > patches.
> > > 
> > > i.e,.
> > > 1) [v4,03/16] spi: spi-mem: allow specifying a command's extension
> > > 
> > > -                                u8 opcode;
> > > +                                u16 opcode;
> > > 
> > > big/little Endian issue, right? 
> > > why not just u8 ext_opcode;
> > > No any impact for exist code and actually only xSPI device use   
> extension 
> > > command.  
> > 
> > Boris already explained the reasoning behind it.  
> 
> yup, I got his point and please make sure CPU data access.
> 
> i.e,.
> Fix endianness of the BFPT DWORDs and xSPI in sfdp.c
> 
> and your patch,
> +                                ext = spi_nor_get_cmd_ext(nor, op);
> +                                op->cmd.opcode = (op->cmd.opcode << 8) | 
> ext;
> +                                op->cmd.nbytes = 2;
> 
> I think maybe using u8 opcode[2] could avoid endianness.
> 

Again, if there's an endianness issue it's in your SPI driver, not
here, and I suspect you'd have the same issue with the address cycles.
SPI mem protocols has been using big endian for everything, and I think
that should be applied to dual-byte opcodes too.

> Moreover, Vignesh think it's fine to use u8 ext_opcode in my v1 patches.
> please check his comments on
> https://patchwork.ozlabs.org/project/linux-mtd/patch/1573808288-19365-3-git-send-email-masonccyang@mxic.com.tw/ 
> 
> 
> 
> Let's open this discussion and maybe Vighesh and Tudor could have some 
> comments on it.

Changing for opcode[2] would mean patching all spi-mem drivers. That's
doable, but given we already have the address field encoded in a u64, I
don't see a good reason to not apply that rule to the opcode.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
