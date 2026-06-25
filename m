Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222B2CDE00B
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jun 2026 22:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2X2SqT6DXgeXGQ6QNrEMuGv+kmO3NkFmjVM5DhW91FU=; b=IvlhuwqzUfSGoL
	jUU8ZNKZDPZiFnMZDMbx3g++hBHeRQUVUVoyp1dEJPvqD93zdNVTZXsM1zS7V05GcYkMsH2jcj7i7
	NZHi/Agd4zyvVNNwQm5RXbYnbegzIoo84lrhFrt9+tQ83cNQuQOXfA1iPb/Eg5VVH3q0hY0UntwUZ
	xcltN5thw5KIgzrTMHWpSHuwUoF7sOodHLVFyHIdRz010ogCDt+WwIiG0Bfct6aQkC5+/9pkUaTVE
	IfXUim87URGEygIh2imz1u49ejwm6J+41gWXs6ewobiFA5ibwmSIP+uLljmqTHYDcDZrQcpQqgiem
	nqSV9xCXQ/f4NCvywvDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcsMS-00000009v5X-3GlG;
	Thu, 25 Jun 2026 22:15:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcsMR-00000009v58-1STz
	for linux-mtd@lists.infradead.org;
	Thu, 25 Jun 2026 22:15:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C440540888;
	Thu, 25 Jun 2026 22:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25AFF1F000E9;
	Thu, 25 Jun 2026 22:15:47 +0000 (UTC)
Message-ID: <5dd8cf26-533f-4a32-8885-3eaad7c57ed6@linux-m68k.org>
Date: Fri, 26 Jun 2026 08:15:42 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mtd: maps: remove uclinux map driver
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>
References: <20260526103227.3152003-1-arnd@kernel.org>
 <20260526103227.3152003-2-arnd@kernel.org>
 <b55ac37f-4523-46d0-8e77-3a17d7235ffe@westnet.com.au>
 <f3e984cd-0614-48d1-b03f-e0670b87e282@app.fastmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <f3e984cd-0614-48d1-b03f-e0670b87e282@app.fastmail.com>
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

Hi Arnd,

On 26/6/26 00:10, Arnd Bergmann wrote:
> On Thu, Jun 25, 2026, at 14:07, Greg Ungerer wrote:
>> On 26/5/26 20:32, Arnd Bergmann wrote:
>>
>> It is used on some ColdFire platforms, and was working all the way up
>> to being removed in the current merge window.
>>
>> The ColdFire platform startup code (arch/m68k/coldfire/head.S) has a
>> somewhat unusual setup that can copy an attached filesystem blob to
>> _bss_stop, and this is one of the places the uclinux.c map driver can
>> use as the filesystem memory address. From uclinux.c
>>
>>       static int __init uclinux_mtd_init(void)
>>       {
>>           struct mtd_info *mtd;
>>           struct map_info *mapp;
>>
>>           mapp = &uclinux_ram_map;
>>
>>           if (physaddr == -1)
>>                   mapp->phys = (resource_size_t)__bss_stop;
>>           else
>>                   mapp->phys = physaddr;
>>
>> No out of tree code is required. Most of the ColdFire defconfigs have
>> CONFIG_MTD_UCLINUX enabled, since it is commonly used.
> 
> I see, this is surprising from reading the source and
> git history, but I can see exactly how it got there.

The early, and probably more interesting history, predates git.
It has always "just worked" on ColdFire platforms, so it really hasn't
needed alot of change over the years for this use case.


> So this is not actually a device but rather a replacement
> for CONFIG_BLK_DEV_INITRD that does can work with CONFIG_BLOCK=y,
> right?

Yes, that is true. Typical use means adding "root=/dev/mtdblock0" to
kernel boot arguments.


>> Can we get this reverted?
> 
> Yes, of course. Miquel/Richard/Vignesh, should I send a revert or
> can you just apply one with Greg's explanation and my Ack?

Thanks
Greg


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
