Return-Path: <SRS0=fgf0=YP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1572CA9EA0
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2019 07:53:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 919E320B7C
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2019 07:53:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eSfQwOqM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 919E320B7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pDDyc/zh8RqDD2LtJwP24/IbuaJnKMoapjhiau8jjyI=; b=eSfQwOqMVWS5oh
	ucToV7kepizs8jdUb/dwjqvFf6jWzKe224DObPpBTvsIJ58tIM4BtwQPMb0ZJjPbTrFvJehFUbU7J
	kgyjYhOl5EzawqYezV2SG05Jm0ne+Ht/Tt7zNJHALwO8qOSa5bBKrzXdGcTdVfZYdRhroO52MhIqn
	dCkaVAgyruc6m562kyP3coFqBYBzNBl/1NnnHoHZE4i7FH6PuEMnkEM+97NKWkFeIt+UKZP4/8i5i
	8pSHuLa0Yd+s4fWN4OkdkcjvMN9B9cIbPGGPjNG4sRNuVg/edmT2T1Umb5ZIFjBJ91Sjknw7VFBGE
	akw0qA7arX/NJcYy752Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMoyQ-0007sq-Cd; Tue, 22 Oct 2019 07:52:58 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMoxa-000732-5V; Tue, 22 Oct 2019 07:52:09 +0000
Received: from windsurf (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211])
 (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 18CB020000F;
 Tue, 22 Oct 2019 07:52:00 +0000 (UTC)
Date: Tue, 22 Oct 2019 09:52:00 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: spear_smi: Fix nonalignment not handled in
 memcpy_toio
Message-ID: <20191022095200.54585032@windsurf>
In-Reply-To: <20191022094451.14d39206@xps13>
References: <20191018143643.29676-1-miquel.raynal@bootlin.com>
 <20191021100105.0f06b212@collabora.com>
 <20191022094451.14d39206@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4git49 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_005206_496831_9646B4EC 
X-CRM114-Status: GOOD (  16.40  )
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
 Richard Weinberger <richard@nod.at>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>, stable@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

+Russell in Cc.

On Tue, 22 Oct 2019 09:44:51 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Boris Brezillon <boris.brezillon@collabora.com> wrote on Mon, 21 Oct
> 2019 10:01:05 +0200:
> 
> > On Fri, 18 Oct 2019 16:36:43 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > Any write with either dd or flashcp to a device driven by the
> > > spear_smi.c driver will pass through the spear_smi_cpy_toio()
> > > function. This function will get called for chunks of up to 256 bytes.
> > > If the amount of data is smaller, we may have a problem if the data
> > > length is not 4-byte aligned. In this situation, the kernel panics
> > > during the memcpy:
> > > 
> > >     # dd if=/dev/urandom bs=1001 count=1 of=/dev/mtd6
> > >     spear_smi_cpy_toio [620] dest c9070000, src c7be8800, len 256
> > >     spear_smi_cpy_toio [620] dest c9070100, src c7be8900, len 256
> > >     spear_smi_cpy_toio [620] dest c9070200, src c7be8a00, len 256
> > >     spear_smi_cpy_toio [620] dest c9070300, src c7be8b00, len 233
> > >     Unhandled fault: external abort on non-linefetch (0x808) at 0xc90703e8
> > >     [...]
> > >     PC is at memcpy+0xcc/0x330    
> > 
> > Can you find out which instruction is at memcpy+0xcc/0x330? For the
> > record, the assembly is here [1].  
> 
> The full disassembled file is attached, here is the failing part:
> 
> 7:			ldmfd	sp!, {r5 - r8}
>   b8:	e8bd01e0 	pop	{r5, r6, r7, r8}
> 	UNWIND(		.fnend				) @ end of second stmfd block
> 
> 	UNWIND(		.fnstart			)
> 			usave	r4, lr			  @ still in first stmdb block
> 8:			movs	r2, r2, lsl #31
>   bc:	e1b02f82 	lsls	r2, r2, #31
> 			ldr1b	r1, r3, ne, abort=21f
>   c0:	14d13001 	ldrbne	r3, [r1], #1
> 			ldr1b	r1, r4, cs, abort=21f
>   c4:	24d14001 	ldrbcs	r4, [r1], #1
> 			ldr1b	r1, ip, cs, abort=21f
>   c8:	24d1c001 	ldrbcs	ip, [r1], #1
> 			str1b	r0, r3, ne, abort=21f
>   cc:	14c03001 	strbne	r3, [r0], #1
> 			str1b	r0, r4, cs, abort=21f
>   d0:	24c04001 	strbcs	r4, [r0], #1
> 			str1b	r0, ip, cs, abort=21f
>   d4:	24c0c001 	strbcs	ip, [r0], #1
> 
> 			exit	r4, pc
>   d8:	e8bd8011 	pop	{r0, r4, pc}
> 
> 
> So the fault is triggered on a strbne instruction.

What I find odd is:

 (1) Failing on a 1-byte store instruction, which means it should have
     no alignment constraints.

 (2) Failing on a 1-byte store instruction, while switching to
     _memcpy_toio(), which does *only* 1-byte stores, works around the
     problem.

_memcpy_toio() looks like this:

void _memcpy_toio(volatile void __iomem *to, const void *from, size_t count)
{
	const unsigned char *f = from;
	while (count) {
  6c:	e3520000 	cmp	r2, #0
  70:	012fff1e 	bxeq	lr
  74:	e0802002 	add	r2, r0, r2
		count--;
		writeb(*f, to);
  78:	e4d13001 	ldrb	r3, [r1], #1
	asm volatile("strb %1, %0"
  7c:	e5c03000 	strb	r3, [r0]
		f++;
		to++;
  80:	e2800001 	add	r0, r0, #1
	while (count) {
  84:	e1500002 	cmp	r0, r2
  88:	1afffffa 	bne	78 <_memcpy_toio+0xc>
  8c:	e12fff1e 	bx	lr

So it's also doing a strb, nothing different.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
