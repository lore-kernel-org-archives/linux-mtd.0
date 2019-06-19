Return-Path: <SRS0=hJJw=US=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A194C31E49
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 09:06:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 244862080C
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 09:06:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VRdN7gi5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 244862080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkcrSfoDJk/aMi8ZP8LuAcFSl88lWcq7Pw3qziz0qio=; b=VRdN7gi5T7eCAr
	5TBUpjDxdkFTw2W9HyeTTpv2pWD8tkqJRW2RP1zASok/5J3VBTL5o1AlMKi/eTM2vLqKo3JM60UcY
	DcZOOEA0+4fTqU58dAm1GfFsz98kZRAfDIK4PFKWolPCILvfU8oczklG8xlHPjAh8ofpmXVFjfCVX
	kKsRNblRz1P5Stip9vOw2JVWToddPJwS1vBjxEdKSvR+bkEhgw+rC82Jmhsh9+r5vRqWnCwWAihkg
	c5jYR1wBkP/B4oO8LIIAyCSlKu7OfdFHsTzeJeoJ04fHPe05OybDYWPwIpxVkuN3xnjPE4WqRp8eu
	Pi0hvcbJPiJKTICYTGSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdWYO-0003JV-Ta; Wed, 19 Jun 2019 09:06:52 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdWYL-0003Ip-43
 for linux-mtd@lists.infradead.org; Wed, 19 Jun 2019 09:06:50 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6B88D27741D;
 Wed, 19 Jun 2019 10:06:46 +0100 (BST)
Date: Wed, 19 Jun 2019 11:06:43 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v3 2/4] mtd: rawnand: Add Macronix MX25F0A NAND controller
Message-ID: <20190619110643.523c1f56@collabora.com>
In-Reply-To: <OF9EFE4BDE.3166D82B-ON4825841E.00307F51-4825841E.00310FB5@mxic.com.tw>
References: <1555320234-15802-1-git-send-email-masonccyang@mxic.com.tw>
 <1555320234-15802-3-git-send-email-masonccyang@mxic.com.tw>
 <20190512151820.4f2dd9da@xps13>
 <OF074A1F06.5C1A58BE-ON482583FD.0031CD95-482583FD.003437AD@mxic.com.tw>
 <20190520142333.390091d5@xps13>
 <OFADC47344.0F9941B2-ON48258403.002336E3-48258403.003141F0@mxic.com.tw>
 <20190527144250.71908bd9@xps13>
 <OFE923A8E5.50375C30-ON48258409.0009AE1B-48258409.00119767@mxic.com.tw>
 <20190617143510.4ded5728@xps13>
 <OF1C1397B4.241DC339-ON4825841D.000482A2-4825841D.0007B67E@mxic.com.tw>
 <20190618081436.5d488320@collabora.com>
 <20190618092901.3bdd9f61@collabora.com>
 <OF5EAF94EB.AE31CF59-ON4825841E.002A2C38-4825841E.002C60BF@mxic.com.tw>
 <20190619101519.391919ec@collabora.com>
 <OF9EFE4BDE.3166D82B-ON4825841E.00307F51-4825841E.00310FB5@mxic.com.tw>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_020649_429155_1C6980F3 
X-CRM114-Status: GOOD (  24.04  )
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
Cc: mark.rutland@arm.com, christophe.kerello@st.com,
 marcel.ziswiler@toradex.com, stefan@agner.ch, liang.yang@amlogic.com,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 lee.jones@linaro.org, richard@nod.at, marek.vasut@gmail.com,
 geert@linux-m68k.org, devicetree@vger.kernel.org, robh+dt@kernel.org,
 bbrezillon@kernel.org, juliensu@mxic.com.tw, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, paul.burton@mips.com, broonie@kernel.org,
 computersforpeace@gmail.com, dwmw2@infradead.org, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 19 Jun 2019 16:55:52 +0800
masonccyang@mxic.com.tw wrote:

> Hi Boris,
> 
> > > > 
> > > > Re: [PATCH v3 2/4] mtd: rawnand: Add Macronix MX25F0A NAND   
> controller
> > > > 
> > > > On Tue, 18 Jun 2019 08:14:36 +0200
> > > > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > > >   
> > > > > > > > > > 
> > > > > > > > > > How to make all #CS keep high for NAND to enter 
> > > > > > > > > > low-power standby mode if driver don't use   
> > > "legacy.select_chip()"   
> > > > > > ?   
> > > > > > > > > 
> > > > > > > > > See commit 02b4a52604a4 ("mtd: rawnand: Make   
> ->select_chip()   
> > > > > > optional   
> > > > > > > > > when ->exec_op() is implemented") which states:
> > > > > > > > > 
> > > > > > > > >         "When [->select_chip() is] not implemented, the   
> core 
> > > is   
> > > > > > assuming   
> > > > > > > > >    the CS line is automatically asserted/deasserted by the   
>  
> > > driver   
> > > > > > > > >    ->exec_op() implementation."   
> > > > > > > > > 
> > > > > > > > > Of course, the above is right only when the controller   
> driver 
> > >   
> > > > > > supports   
> > > > > > > > > the ->exec_op() interface.   
> > > > > > > > 
> > > > > > > > Currently, it seems that we will get the incorrect data and    
> 
> > > error  
> > > > > > > > operation due to CS in error toggling if CS line is   
> controlled 
> > > in   
> > > > > > > > ->exec_op().   
> > > > 
> > > > Oh, and please provide the modifications you added on top of this   
> patch.
> > > > Right now we're speculating on what you've done which is definitely   
> not
> > > > an efficient way to debug this sort of issues.   
> > > 
> > > The patch is to add in beginning of ->exec_op() to control CS# low and   
> 
> > > before return from ->exec_op() to control CS# High.
> > > i.e,.
> > > static in mxic_nand_exec_op( )
> > > {
> > >  cs_to_low();
> > > 
> > > 
> > > 
> > >  cs_to_high();
> > >  return;
> > > }
> > > 
> > > But for nand_onfi_detect(), 
> > > it calls nand_read_param_page_op() and then nand_read_data_op().
> > > mxic_nand_exec_op() be called twice for nand_onfi_detect() and
> > > driver will get incorrect ONFI parameter table data from 
> > > nand_read_data_op().  
> > 
> > And I think it's valid to release the CE pin between
> > read_param_page_op() (CMD(0xEC)+ADDR(0x0)) and read_data_op() (data
> > cycles) if your chip is CE-dont-care compliant. So, either you have a
> > problem with your controller driver (CS-related timings are incorrect)
> > or your chip is not CE-dont-care compliant.  
> 
> Understood, I will try to fix it on my NFC driver.

Before you do that, can you please try to understand where the problem
comes from and explain it to us? Hacking the NFC driver is only
meaningful if the problem is on the NFC side. If your NAND chip does
not support when the CS pin goes high between read_param_page_op() and
read_data_op() the problem should be fixed in the core.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
