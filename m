Return-Path: <SRS0=fgf0=YP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2965BCA9EA0
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2019 09:26:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE07B21906
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2019 09:26:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u15KaSFH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="kGaNGEkG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE07B21906
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bVyVrNET+3Xoc84vxIRB3BsBdeKN/LQ23povdR/dK7g=; b=u15KaSFHFWK4Jg
	vHx8Sf9ko9PvffB75Q9JQ++zKXoj5lv2i4oMOwZW0O7hiIr1V+n/LSB+lbY7ikAr/iI3gEepjNhCN
	TY/HUw6AZY0To6jUvI0dT2H5+nXalF04BACdM6QyFMS6RAff+4RbQbICm23VIuMh3SzQW9fnumbYK
	OQ/pLvqvwWcSWnru90FSDgzWYc2HqfYWk225XOqYeEz1lpdrQw8YjXBAHOy4khKzQg7mt4zZOrSKI
	QWBVzFrF+ThIv2zUgyBtS1QNjNVZMNqVRVZcQ8vCdLcgm2IR2kIyU2SYkvO6rcxUmY0lyXRvVgvLD
	tOLKKhcH9NYyl38X/Pyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMqR6-0005XS-0s; Tue, 22 Oct 2019 09:26:40 +0000
Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMqR3-0005SZ-Ai; Tue, 22 Oct 2019 09:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TmHpYQq+1YByS74nVQpkYRgXw+YYJL9xlQu7xl3PVL8=; b=kGaNGEkGUIEjYOH8hF9k59Ymt
 6wXz18tm9d79zRTmA5SM2IBIigAfi9rB45LZzWOk2a1tqSLib4ZVhza6RXpKqlzKvRFP/jIZkTsIS
 lLjPRtqv0KJBxDpJ6yHkbOdLky+U7dBrVODiTEjCKKxzBHMpz4UsvHNAnGAEX0e0XxFp7HeTDGsgs
 iv/5tHcL7GuQjJM4GdjCivABlirDMkjVbhduF2uQHhXSUoXrskLvSEFTeM2rYKHdXl2UYjRFWjk3G
 URk5ob7IMeqxCdPiepeudeJoHcXsJf5+hMJeboNZKpn9/eV7oxM3jdQzMTOwIZzP3sBa3fee6uw33
 co42HPg1w==;
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:45900)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iMqQn-0006GQ-9o; Tue, 22 Oct 2019 10:26:21 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iMqQl-0004RU-83; Tue, 22 Oct 2019 10:26:19 +0100
Date: Tue, 22 Oct 2019 10:26:19 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: spear_smi: Fix nonalignment not handled in
 memcpy_toio
Message-ID: <20191022092619.GQ25745@shell.armlinux.org.uk>
References: <20191018143643.29676-1-miquel.raynal@bootlin.com>
 <20191022082643.GO25745@shell.armlinux.org.uk>
 <20191022111707.4b117b99@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022111707.4b117b99@xps13>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_022637_376448_CFD576E2 
X-CRM114-Status: GOOD (  21.54  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Oct 22, 2019 at 11:17:07AM +0200, Miquel Raynal wrote:
> Hi Russell,
> =

> Russell King - ARM Linux admin <linux@armlinux.org.uk> wrote on Tue, 22
> Oct 2019 09:26:43 +0100:
> =

> > On Fri, Oct 18, 2019 at 04:36:43PM +0200, Miquel Raynal wrote:
> > > Any write with either dd or flashcp to a device driven by the
> > > spear_smi.c driver will pass through the spear_smi_cpy_toio()
> > > function. This function will get called for chunks of up to 256 bytes.
> > > If the amount of data is smaller, we may have a problem if the data
> > > length is not 4-byte aligned. In this situation, the kernel panics
> > > during the memcpy:
> > > =

> > >     # dd if=3D/dev/urandom bs=3D1001 count=3D1 of=3D/dev/mtd6
> > >     spear_smi_cpy_toio [620] dest c9070000, src c7be8800, len 256
> > >     spear_smi_cpy_toio [620] dest c9070100, src c7be8900, len 256
> > >     spear_smi_cpy_toio [620] dest c9070200, src c7be8a00, len 256
> > >     spear_smi_cpy_toio [620] dest c9070300, src c7be8b00, len 233
> > >     Unhandled fault: external abort on non-linefetch (0x808) at 0xc90=
703e8
> > >     [...]
> > >     PC is at memcpy+0xcc/0x330  =

> > =

> > I need the full oops if you want me to comment on this.
> =

> FYI, I ran the dd command within a for loop, incrementing the block size
> (bs) by one byte, if failed with bs=3D6.
> =

> Disabling WB_MODE (burst mode) does not change anything.
> =

> Adding a wmb() right after the memcpy_toio() prevents the fault.

Thanks.  Can you check what the result of the write buffer test earlier
in the kernel boot is?

CPU: Testing write buffer coherency: ...

?

Thanks.

> =

> Here is the full trace when writing 1001 bytes:
> =

> # dd if=3D/dev/urandom bs=3D1001 count=3D1 of=3D/dev/mtd6
> Unhandled fault: external abort on non-linefetch (0x808) at 0xc90703e8
> pgd =3D c7be8000
> [c90703e8] *pgd=3Df8000452(bad)
> Internal error: : 808 [#1] ARM
> Modules linked in:
> CPU: 0 PID: 660 Comm: dd Not tainted 4.14.0-00045-gf5d08192704f-dirty #6
> Hardware name: ST SPEAr600 (Flattened Device Tree)
> task: c7a05080 task.stack: c7bd2000
> PC is at memcpy+0xcc/0x330
> LR is at 0x13f0ec28
> pc : [<c044344c>]    lr : [<13f0ec28>]    psr: 80000013
> sp : c7bd3e44  ip : 00000018  fp : 000003e9
> r10: 00000000  r9 : c7a9959c  r8 : c7bd3eac
> r7 : c7a99590  r6 : c7afb438  r5 : 00000300  r4 : 5171436c
> r3 : 00000058  r2 : 80000000  r1 : c7be4be9  r0 : c90703e8
> Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> Control: 0005317f  Table: 07be8000  DAC: 00000051
> Process dd (pid: 660, stack limit =3D 0xc7bd2190)
> Stack: (0xc7bd3e44 to 0xc7bd4000)
> 3e40:          c9070300 000000e9 c0290d14 c9070300 c7be4b00 0001046f c907=
0000
> 3e60: c7afb418 00000000 c7bd3e98 000003e9 c7bd3f88 000003e9 00000000 000c=
0008
> 3e80: 00000051 c7bd2000 c7be4800 c028e57c 000003e9 c7bd3eac c7be4800 0000=
0000
> 3ea0: c7bf73c0 c7addc00 000003e9 00000300 00000000 00000000 00000000 0000=
0000
> 3ec0: 00000000 00000000 00000000 00000000 00000000 000003e9 c028e4bc c796=
2a80
> 3ee0: c7bd3f88 00000000 c7bd2000 00000000 000bf990 c00bdb0c 000bf990 c00b=
d878
> 3f00: 00000000 00000000 00000000 c7bd3f10 c7a688c0 c009eedc c7becb58 000c=
0000
> 3f20: 00000003 c7962460 c7962484 00000000 00000000 c045c2f8 00000003 c00d=
9e58
> 3f40: 000003e9 000c0008 c7962a80 c7bd3f88 00000000 c7bd2000 00000000 c00b=
ddb4
> 3f60: 000bf990 c00bda6c 00000000 c7962a80 c7962a80 000c0008 000003e9 c000=
a804
> 3f80: c7bd2000 c00bdfa4 00000000 00000000 00000000 000bfd94 00000001 000c=
0008
> 3fa0: 00000004 c000a640 000bfd94 00000001 00000001 000c0008 000003e9 be8e=
8f53
> 3fc0: 000bfd94 00000001 000c0008 00000004 000c0008 000c0008 000003e9 000b=
f990
> 3fe0: 00000000 be8e8ba4 0000ea3c b6eba7ec 60000010 00000001 00000000 0000=
0000
> [<c044344c>] (memcpy) from [<c0290d14>] (spear_mtd_write+0x240/0x294)
> [<c0290d14>] (spear_mtd_write) from [<c028e57c>] (mtdchar_write+0xc0/0x23=
0)
> [<c028e57c>] (mtdchar_write) from [<c00bdb0c>] (__vfs_write+0x1c/0x128)
> [<c00bdb0c>] (__vfs_write) from [<c00bddb4>] (vfs_write+0xa0/0x168)
> [<c00bddb4>] (vfs_write) from [<c00bdfa4>] (SyS_write+0x3c/0x90)
> [<c00bdfa4>] (SyS_write) from [<c000a640>] (ret_fast_syscall+0x0/0x44)
> Code: e1b02f82 14d13001 24d14001 24d1c001 (14c03001) =

> ---[ end trace f9a736cc2841cf14 ]---
> Segmentation fault
> =

> =

> Thanks,
> Miqu=E8l
> =


-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps =
up
According to speedtest.net: 11.9Mbps down 500kbps up

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
