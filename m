Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2793CCF58FE
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Nov 2025 21:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2utd0r3wFXMQHTFn/oD2DZ3TTNy5uZLlYzz0dVwJ+9A=; b=HU3CScKnbEIHJ9LpzdIagXbaux
	djCQO8x6AD1UFITjluU1SvkCINw91Dt2aVLF8fO//hFw+pQSNYJMjFPECJ1iq7WKq1EapxJAuxIhv
	BFjQpeoUn06y/u1wUGi98oNB2A6vkwHIA1W+n2UUwXMGdqb1IKX+HOrYMu+CvrwQ80eZ0iKy4zgeA
	1dQkfiWc6d1cGrEjS20sDziO5xRzVAWGhZ8smoP6xLUvjQum/J7cuoqmR5VoDs6hBrD2e2h8DtwgH
	zzwV0zmwHYcEyQ+5OVSBabrjH/54RZ/kmTCbnV3DVZH9uqAaWudBKL/kpQ2Hxj7cSf9EUrDLjR6Yn
	Ad+ZbwKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLpr1-00000005lUU-0QGL;
	Wed, 19 Nov 2025 21:36:43 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLpqx-00000005lTz-3Voq
	for linux-mtd@lists.infradead.org;
	Wed, 19 Nov 2025 21:36:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0ACAC4443D;
	Wed, 19 Nov 2025 21:36:31 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 19 Nov 2025 22:36:31 +0100
From: Artur Rojek <contact@artur-rojek.eu>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Florian Fuchs
 <fuchsfl@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rich Felker <dalias@libc.org>, Paul Cercueil
 <paul@crapouillou.net>
Subject: Re: [PATCH 0/3] mtd: maps: vmu-flash: Fix build and runtime errors
In-Reply-To: <6e2e9edcd9247c216bfe1ba637629a9a838f9fed.camel@physik.fu-berlin.de>
References: <20251117224408.498449-1-fuchsfl@gmail.com>
 <6e2e9edcd9247c216bfe1ba637629a9a838f9fed.camel@physik.fu-berlin.de>
Message-ID: <5a4f8f1d543ef90aae3299b0f8803fb3@artur-rojek.eu>
X-Sender: contact@artur-rojek.eu
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvvdehvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhfkgigtgfesthejjhdttddtvdenucfhrhhomheptehrthhurhcutfhojhgvkhcuoegtohhnthgrtghtsegrrhhtuhhrqdhrohhjvghkrdgvuheqnecuggftrfgrthhtvghrnheptdejuedtgefgtdfhgfdugefgffffteetteffuddtgfefheekgedvtdekvddvtdeknecukfhppedutddrvddttddrvddtuddrudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtrddvtddtrddvtddurdduledphhgvlhhopeifvggsmhgrihhlrdhgrghnughirdhnvghtpdhmrghilhhfrhhomheptghonhhtrggtthesrghrthhurhdqrhhojhgvkhdrvghupdhnsggprhgtphhtthhopedutddprhgtphhtthhopehglhgruhgsihhtiiesphhhhihsihhkrdhfuhdqsggvrhhlihhnrdguvgdprhgtphhtthhopehfuhgthhhsfhhlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhin
 hhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhshhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: contact@artur-rojek.eu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_133640_027102_6BBE7334 
X-CRM114-Status: GOOD (  16.36  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2025-11-18 08:31, John Paul Adrian Glaubitz wrote:
> Hi Florian,
> 
> On Mon, 2025-11-17 at 23:44 +0100, Florian Fuchs wrote:
>> This small series fixes build and runtime errors in the vmu-flash 
>> driver
>> (enabled by CONFIG_MTD_VMU) and the included maple.h. These changes 
>> were
>> verified on real Dreamcast hardware with a physical VMU. The VMU can 
>> now
>> be successfully probed, read and written with MTD tools like mtd_info 
>> and
>> mtd_debug. Previously, the driver failed to build or crashed during
>> probing.
>> 
>> 	bash-5.3# mtdinfo /dev/mtd0
>> 	mtd0
>> 	Name:                           vmu2.1.0
>> 	Type:                           mlc-nand
>> 	Eraseblock size:                512 bytes
>> 	Amount of eraseblocks:          256 (131072 bytes, 128.0 KiB)
>> 	Minimum input/output unit size: 512 bytes
>> 	Sub-page size:                  512 bytes
>> 	Character device major/minor:   90:0
>> 	Bad blocks are allowed:         true
>> 	Device is writable:             true
> 
> Thanks again for this series. Before this can be picked up, I would 
> like again
> Artur Rojek to test it on his Dreamcast, so let's loop him in.
> 
> If he confirms the functionality, I'll pick it up. I'll try to get it 
> reviewed
> later this week.
> 
> Adrian

Hi Florian,
thanks for this series!

Without the maple port fix, this works as intended only when all
four maple ports are populated. I am able to read from multiple VMUs in
various slots.

However, with even one port not populated, it causes a panic:
> Maple (null): detected Dreamcast Controller: function 0x1: at (0, 0)
> Maple (null): no driver found
> Maple (null): detected Dreamcast Controller: function 0x1: at (1, 0)
> Maple (null): no driver found
> Maple (null): detected Visual Memory: function 0xE: at (0, 1)
> Maple (null): no driver found
> BUG: unable to handle kernel paging request at 00400000
> PC: [<8c2aecee>] maple_send.part.0+0x102/0x1c8
> Pgd = (ptrval)
> [00400000] *pgd=00000000
> Oops: 0000 [#1]
> Modules linked in:
> 
> CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted 
> 6.18.0-rc5-next-20251114-00003-gb6bcd2e803f3 #25 PREEMPT
> Workqueue: even maple_dma_handler (events)
> PC is at maple_send.part.0+0x102/0x1c8
> PR is at maple_send.part.0+0x5c/0x1c8
> PC  : 8c2aecee SP  : 8c85bef8 SR  : 40008000 TEA : 00400000
> R0  : 0000002c R1  : 003fffc4 R2  : 00400004 R3  : 8c4e3d18
> R4  : 8c92c024 R5  : 8c4e3d18 R6  : 0000002b R7  : 8c92c030
> R8  : 00000000 R9  : 8c4e3d18 R10 : 00000016 R11 : 8c6aacdc
> R12 : 00000007 R13 : 8c914c20 R14 : 8c92c030
> MACH: 00000001 MACL: 000006cc GBR : 8c000000 PR  : 8c2aec48
> 
> Call trace:
>  [<8c030c50>] process_one_work+0x114/0x290
>  [<8c00b6a0>] arch_local_irq_restore+0x0/0x24
>  [<8c3dac3a>] schedule+0x22/0x108
>  [<8c03144a>] worker_thread+0x27e/0x3bc
>  [<8c030b3c>] process_one_work+0x0/0x290
>  [<8c0379c2>] kthread+0xde/0x1c0
>  [<8c0311cc>] worker_thread+0x0/0x3bc
>  [<8c0374fc>] to_kthread+0x0/0x1c
>  [<8c00b6a0>] arch_local_irq_restore+0x0/0x24
>  [<8c00f200>] ret_from_kernel_thread+0xc/0x14
>  [<8c00b698>] arch_local_save_flags+0x0/0x8
>  [<8c0418b0>] schedule_tail+0x0/0x78
>  [<8c0378e4>] kthread+0x0/0x1c0
> 
> Process: kworker/0:1 (pid: 11, stack limit = (ptrval))
> Stack: (0x8c85bef8 to 0x8c85c000)
> Bee0:                                                       8c030c50 
> 8c00b6a0
> Bf00: 8c80817c 8c808105 8c8462c0 8c808100 8c4e3d38 8c846280 00000000 
> 48f0d9a1
> Bf20: 8c3dac3a 8c85bf40 8c846280 00000000 8c03144a 8c8462c0 8c846280 
> 8c4ca36c
> Bf40: 8c8462a8 8c4da400 8c4ca388 8c030b3c 8c857ebc 8c80797c 8c0379c2 
> 8c846280
> Bf60: 8c0311cc 8c0374fc 8c857ebc 8c00b6a0 8c807960 8c805b40 00000000 
> 8c85bf98
> Bf80: 48f0d9a1 8c00f200 8c839f08 8c4dbbd8 8c493688 8c82c77c 8c00b698 
> 00000000
> Bfa0: 8c0418b0 00000000 00000000 00000000 00000000 8c805b40 8c0378e4 
> 00000000
> Bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
> 00000000
> Bfe0: 00000000 00000000 00000000 40008000 00000000 00000000 00000000 
> 00000000
> ---[ end trace 0000000000000000 ]---

This means we can't apply this series without the maple fix, and as such
I'll recommend that this waits until hotplug is fixed.

PS. I don't know if it's down to the same issue, but once I remove and
re-attach a VMU, it cannot be read from anymore:
> Dreamcast_visual_memory 0:01.E: VMU at (0, 1) is busy

PS. Adding Paul in the CC, he might be interested to test in the future.

Cheers,
Artur

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
