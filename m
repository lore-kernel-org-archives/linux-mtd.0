Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9A5CF58FE
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Nov 2025 21:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4oDq/0Ur7BJxMKbs1VcPXNyJ7sMQ8O6SRwnF7BnJ1Vg=; b=K677vWZ7WOAwym
	o0zq7TKZaA+1uiGbMlOcZGr8GM89nGdSHCGKppHd2TwZHgcNcmROZYc+E4Chyjs9njtfOLJm7mKEr
	FCTXPqYR9Ca0daY30BbI81FfPSdeqzCSfCQXqQhKL8xPzrze8pkQB04KQ+bL8oUuiiUBQBcJQoONH
	GlHXm/vATr50Ar6UjeyC54oApPUNfZhalwXAyqAhhCF+1ybGAC1fsnu2b4seNGRX0vsepX63cCRE0
	8z3zjAhbQGWhSXQMZprpPtLRadKi8DYbmKQWOXbU1SteJyY9IMo2pkZpLIxE5CH2wBjq/GJVS3bmq
	JKYEO6e7qEOpbWoIApjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLpyM-00000005lhb-0S3e;
	Wed, 19 Nov 2025 21:44:18 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLpyK-00000005lh9-0DbE
	for linux-mtd@lists.infradead.org;
	Wed, 19 Nov 2025 21:44:17 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b73669bdcd2so39836966b.2
        for <linux-mtd@lists.infradead.org>; Wed, 19 Nov 2025 13:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763588654; x=1764193454; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U95iNDsSv/ghWmzAcmjpejAYSRfTfC67TH6196g4c74=;
        b=lAb9NdxeV7sQRYRUwpgoZf5wUJa0PN2NExtav2hSclNraPuU3QnCXNi1vlPsmycFsq
         JewM2Z9dY2WrAXngyO+SHXqmzfVWyDIgQvg24P5G4a8HCmQPEM94jzW2ko8Pdd36cHmS
         uA+wE1eKwryx5QQEN6mC62NhaJv1mlnTsYpqKrWYHhSK6ZFPbd/P2TjICgMJirhYR7Gn
         uq1ZMjyUDR+Zp3garj9lblt9TBZwUAJMsVrx7jlgWNHZgQQiPN4XCqpmcx0z7sn/pEp0
         b4F12BsK5Yls4h1fij6Jb7TAxrTy/Qtpq301n5UYbxBRtFP48pU93GdQMtA24Y2K/Z7C
         iZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763588654; x=1764193454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U95iNDsSv/ghWmzAcmjpejAYSRfTfC67TH6196g4c74=;
        b=ttWKyq/fni3Lair0FM+XHinI/PylugLKvQnkn9/N5z2oCGEZ8g4oG6k0qT8Vb0dd8Z
         pghm1cuHwF5mcZsvG+frFXsojoY0C7BZaZo0ehF6m3C/mzKAkDy2NAaQbE9kvSIbiYLF
         V7k3hN/R6D5sSN43++DweVI3dOtJ0ZiqqLPBMOdLHXKaJWkq7sH3hcGxAcFFJn+r4ypP
         kqwvh2PCGNEqulo7KEBxCnMk8QCfGv1Rn16jSXpNHm88+w/1fklt///vsbDVeyAL9yqJ
         NgC6keYavnxNJl7Lkdvk5ccxpgNCGuHGHyxypUT7upR8qrxmxtrP9SZuK63BsA1J+Zsd
         CT6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYYeFfRRIdlxUB/eyyIJFFfZEbJjDHYL5RpbjBrLZ48s96AjfAGvAogijVJI4ZS8reOJlQop578y8=@lists.infradead.org
X-Gm-Message-State: AOJu0YydCcYnl2r4AnpAJ9YfE1MYs0Z5ICIlbZC4jp1NFuhKHFEzPnRP
	eqPZl02cGtF/9D4UYmVWjXRgzPYCqcaNqNpbNYNVEAV8DZtHgl0eHXM=
X-Gm-Gg: ASbGncuWVQQpbBH3TazHUa0qZPicBZbHKxfuoInqAJEvtHLVECSqXJCcnBkwB1L6exL
	IbniW7myuBDYT4tnx8H3tp4WO+BBUVXQEgNQJn1sDFU8X5MSCpUcwGBxGcAAmEbPjgzp23+UcVf
	ayl3zswA78ug7m3/msOE9IpGo3zVVFuQAEzZ7InuXpXxuAwMVb+WcIEN3yAWajDQ3FC870GUOYh
	ZX/A3XSFmXhReBJ5hsTrhcl8IUf0/mTPV1onlaIRpZ5Z12D8gfp3IDHB+TgDNIQk3l1pgGWL2Oo
	09f8jNohe6YgRXLkKRKQufmJLr8IugPg+dTpyCpw3ElxT5IkwiFucv2LX4HHTMTOtpuB1keGa+O
	R3FcGS4sTTW76l+HQU37SJYODDBGoI6qvdftZvJEOuf65vkd9qvdSqxh7+mBmxngtWnyr8945WF
	SlMSREuY6LDy3HcNXAbEoNInjvYo2nVwtQSdZ1N05/sIx8O5+qEVIvXYJqrHzItoxVvRHCvDcvM
	EM=
X-Google-Smtp-Source: AGHT+IE2xXkv86N4UkOLtXCMQLWikSMyXY2JViiO06NZWnCSJi1e1dTJwXeebwOqChhJXWU2lYCUvQ==
X-Received: by 2002:a17:907:3e88:b0:b72:5e2c:9e97 with SMTP id a640c23a62f3a-b7654eb7855mr69113966b.36.1763588653565;
        Wed, 19 Nov 2025 13:44:13 -0800 (PST)
Received: from lithos ([2a02:810d:4a94:b300:9776:7754:ce4b:5663])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7655050927sm36445966b.71.2025.11.19.13.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 13:44:13 -0800 (PST)
Date: Wed, 19 Nov 2025 22:44:11 +0100
From: Florian Fuchs <fuchsfl@gmail.com>
To: Artur Rojek <contact@artur-rojek.eu>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org, Rich Felker <dalias@libc.org>,
	Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 0/3] mtd: maps: vmu-flash: Fix build and runtime errors
Message-ID: <aR46Kw5n4hIAZCcn@lithos>
References: <20251117224408.498449-1-fuchsfl@gmail.com>
 <6e2e9edcd9247c216bfe1ba637629a9a838f9fed.camel@physik.fu-berlin.de>
 <5a4f8f1d543ef90aae3299b0f8803fb3@artur-rojek.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5a4f8f1d543ef90aae3299b0f8803fb3@artur-rojek.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_134416_136847_884942B3 
X-CRM114-Status: GOOD (  31.03  )
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

On 19 Nov 22:36, Artur Rojek wrote:
> On 2025-11-18 08:31, John Paul Adrian Glaubitz wrote:
> > Hi Florian,
> > 
> > On Mon, 2025-11-17 at 23:44 +0100, Florian Fuchs wrote:
> > > This small series fixes build and runtime errors in the vmu-flash
> > > driver
> > > (enabled by CONFIG_MTD_VMU) and the included maple.h. These changes
> > > were
> > > verified on real Dreamcast hardware with a physical VMU. The VMU can
> > > now
> > > be successfully probed, read and written with MTD tools like
> > > mtd_info and
> > > mtd_debug. Previously, the driver failed to build or crashed during
> > > probing.
> > > 
> > > 	bash-5.3# mtdinfo /dev/mtd0
> > > 	mtd0
> > > 	Name:                           vmu2.1.0
> > > 	Type:                           mlc-nand
> > > 	Eraseblock size:                512 bytes
> > > 	Amount of eraseblocks:          256 (131072 bytes, 128.0 KiB)
> > > 	Minimum input/output unit size: 512 bytes
> > > 	Sub-page size:                  512 bytes
> > > 	Character device major/minor:   90:0
> > > 	Bad blocks are allowed:         true
> > > 	Device is writable:             true
> > 
> > Thanks again for this series. Before this can be picked up, I would like
> > again
> > Artur Rojek to test it on his Dreamcast, so let's loop him in.
> > 
> > If he confirms the functionality, I'll pick it up. I'll try to get it
> > reviewed
> > later this week.
> > 
> > Adrian
> 
> Hi Florian,
> thanks for this series!
> 
> Without the maple port fix, this works as intended only when all
> four maple ports are populated. I am able to read from multiple VMUs in
> various slots.
> 
> However, with even one port not populated, it causes a panic:
> > Maple (null): detected Dreamcast Controller: function 0x1: at (0, 0)
> > Maple (null): no driver found
> > Maple (null): detected Dreamcast Controller: function 0x1: at (1, 0)
> > Maple (null): no driver found
> > Maple (null): detected Visual Memory: function 0xE: at (0, 1)
> > Maple (null): no driver found
> > BUG: unable to handle kernel paging request at 00400000
> > PC: [<8c2aecee>] maple_send.part.0+0x102/0x1c8
> > Pgd = (ptrval)
> > [00400000] *pgd=00000000
> > Oops: 0000 [#1]
> > Modules linked in:
> > 
> > CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted
> > 6.18.0-rc5-next-20251114-00003-gb6bcd2e803f3 #25 PREEMPT
> > Workqueue: even maple_dma_handler (events)
> > PC is at maple_send.part.0+0x102/0x1c8
> > PR is at maple_send.part.0+0x5c/0x1c8
> > PC  : 8c2aecee SP  : 8c85bef8 SR  : 40008000 TEA : 00400000
> > R0  : 0000002c R1  : 003fffc4 R2  : 00400004 R3  : 8c4e3d18
> > R4  : 8c92c024 R5  : 8c4e3d18 R6  : 0000002b R7  : 8c92c030
> > R8  : 00000000 R9  : 8c4e3d18 R10 : 00000016 R11 : 8c6aacdc
> > R12 : 00000007 R13 : 8c914c20 R14 : 8c92c030
> > MACH: 00000001 MACL: 000006cc GBR : 8c000000 PR  : 8c2aec48
> > 
> > Call trace:
> >  [<8c030c50>] process_one_work+0x114/0x290
> >  [<8c00b6a0>] arch_local_irq_restore+0x0/0x24
> >  [<8c3dac3a>] schedule+0x22/0x108
> >  [<8c03144a>] worker_thread+0x27e/0x3bc
> >  [<8c030b3c>] process_one_work+0x0/0x290
> >  [<8c0379c2>] kthread+0xde/0x1c0
> >  [<8c0311cc>] worker_thread+0x0/0x3bc
> >  [<8c0374fc>] to_kthread+0x0/0x1c
> >  [<8c00b6a0>] arch_local_irq_restore+0x0/0x24
> >  [<8c00f200>] ret_from_kernel_thread+0xc/0x14
> >  [<8c00b698>] arch_local_save_flags+0x0/0x8
> >  [<8c0418b0>] schedule_tail+0x0/0x78
> >  [<8c0378e4>] kthread+0x0/0x1c0
> > 
> > Process: kworker/0:1 (pid: 11, stack limit = (ptrval))
> > Stack: (0x8c85bef8 to 0x8c85c000)
> > Bee0:                                                       8c030c50
> > 8c00b6a0
> > Bf00: 8c80817c 8c808105 8c8462c0 8c808100 8c4e3d38 8c846280 00000000
> > 48f0d9a1
> > Bf20: 8c3dac3a 8c85bf40 8c846280 00000000 8c03144a 8c8462c0 8c846280
> > 8c4ca36c
> > Bf40: 8c8462a8 8c4da400 8c4ca388 8c030b3c 8c857ebc 8c80797c 8c0379c2
> > 8c846280
> > Bf60: 8c0311cc 8c0374fc 8c857ebc 8c00b6a0 8c807960 8c805b40 00000000
> > 8c85bf98
> > Bf80: 48f0d9a1 8c00f200 8c839f08 8c4dbbd8 8c493688 8c82c77c 8c00b698
> > 00000000
> > Bfa0: 8c0418b0 00000000 00000000 00000000 00000000 8c805b40 8c0378e4
> > 00000000
> > Bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > 00000000
> > Bfe0: 00000000 00000000 00000000 40008000 00000000 00000000 00000000
> > 00000000
> > ---[ end trace 0000000000000000 ]---
> 
> This means we can't apply this series without the maple fix, and as such
> I'll recommend that this waits until hotplug is fixed.
> 
> PS. I don't know if it's down to the same issue, but once I remove and
> re-attach a VMU, it cannot be read from anymore:
> > Dreamcast_visual_memory 0:01.E: VMU at (0, 1) is busy
> 
> PS. Adding Paul in the CC, he might be interested to test in the future.

Hi Artur, thanks for testing!

I am not sure if the errors you see are related to the changes. The
fixes only make the VMU code compile at all. Without that, the build
fails and it crashes instantly.

So I would say, it is an improvement to the status quo.

Regards,
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
