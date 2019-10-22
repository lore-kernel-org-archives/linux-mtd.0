Return-Path: <SRS0=fgf0=YP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F93CA9EA0
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2019 09:48:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC0AD2089E
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2019 09:48:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MbV1lkG4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC0AD2089E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vnsg4iZOf/PzDVNU0UD+6PwiUn2kFm1VOQxLtdvG70c=; b=MbV1lkG4qeCnG1
	chZ55uejPy73vfJ02lCK1cvBDJlqxJAR6yow3kZwwu+r4P5M1200uABlqP24jXXkRwvuf0jC4f8ir
	1b7VNUjfx6vfkkS6NNZnrLk7cahCBRBsW0ae6nyXskjGREcYqDGfKtLXJlzpEmB2J91zfmybxGKlS
	X/flae5I6i7FIIqGenxYss2nCbg9bzLStJR217C7vLsG7qV6zu4qrfAcVL+uYCSmlnrV0Iw85O9JO
	kASKRlZKLmDRKZ6xagw5dIXQUl14qwWSA9OMt2EtK8l01QH7VrE6KhUFSDV+21YVsY+rpGl9nQN0M
	lw/UDn75KPJ/zM5b6i5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMqll-0006kj-72; Tue, 22 Oct 2019 09:48:01 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMqlW-0006V7-9f; Tue, 22 Oct 2019 09:47:47 +0000
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 295AD24000B;
 Tue, 22 Oct 2019 09:47:36 +0000 (UTC)
Date: Tue, 22 Oct 2019 11:47:35 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH] mtd: spear_smi: Fix nonalignment not handled in
 memcpy_toio
Message-ID: <20191022114735.0321864e@xps13>
In-Reply-To: <20191022092619.GQ25745@shell.armlinux.org.uk>
References: <20191018143643.29676-1-miquel.raynal@bootlin.com>
 <20191022082643.GO25745@shell.armlinux.org.uk>
 <20191022111707.4b117b99@xps13>
 <20191022092619.GQ25745@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_024746_473833_063E62FD 
X-CRM114-Status: GOOD (  18.35  )
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
 Richard Weinberger <richard@nod.at>, stable@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Russell,

Russell King - ARM Linux admin <linux@armlinux.org.uk> wrote on Tue, 22
Oct 2019 10:26:19 +0100:

> On Tue, Oct 22, 2019 at 11:17:07AM +0200, Miquel Raynal wrote:
> > Hi Russell,
> > 
> > Russell King - ARM Linux admin <linux@armlinux.org.uk> wrote on Tue, 22
> > Oct 2019 09:26:43 +0100:
> >   
> > > On Fri, Oct 18, 2019 at 04:36:43PM +0200, Miquel Raynal wrote:  
> > > > Any write with either dd or flashcp to a device driven by the
> > > > spear_smi.c driver will pass through the spear_smi_cpy_toio()
> > > > function. This function will get called for chunks of up to 256 bytes.
> > > > If the amount of data is smaller, we may have a problem if the data
> > > > length is not 4-byte aligned. In this situation, the kernel panics
> > > > during the memcpy:
> > > > 
> > > >     # dd if=/dev/urandom bs=1001 count=1 of=/dev/mtd6
> > > >     spear_smi_cpy_toio [620] dest c9070000, src c7be8800, len 256
> > > >     spear_smi_cpy_toio [620] dest c9070100, src c7be8900, len 256
> > > >     spear_smi_cpy_toio [620] dest c9070200, src c7be8a00, len 256
> > > >     spear_smi_cpy_toio [620] dest c9070300, src c7be8b00, len 233
> > > >     Unhandled fault: external abort on non-linefetch (0x808) at 0xc90703e8
> > > >     [...]
> > > >     PC is at memcpy+0xcc/0x330    
> > > 
> > > I need the full oops if you want me to comment on this.  
> > 
> > FYI, I ran the dd command within a for loop, incrementing the block size
> > (bs) by one byte, if failed with bs=6.
> > 
> > Disabling WB_MODE (burst mode) does not change anything.
> > 
> > Adding a wmb() right after the memcpy_toio() prevents the fault.  
> 
> Thanks.  Can you check what the result of the write buffer test earlier
> in the kernel boot is?
> 
> CPU: Testing write buffer coherency: ...
> 
> ?

CPU: Testing write buffer coherency: ok


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
