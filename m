Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8E1C4332B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 22:35:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A8722073E
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 22:35:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KtrnYIEL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="i1zPl9dS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A8722073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uKbSgrytQoIqeZX04ATpwPFlYSDJ1z4mpZboZ5Uxv/A=; b=KtrnYIELUOwleydAVfcQkC930
	guxyU4slRL7MOH5IqC5xLAWO3YCB5ISg7fki/n/9k7/QY+pXXqFIoQDoq0jw4bJ31leSR4wP82axv
	Liq9IVKxJ/PA1QLHiWNI+phFvo++tr/oi/pPwCIvFTOsY4EOmVD5n3Qk52e+e4TbeCCoFdkYYs5iw
	CA2xpIZ1JzMcz76SM+n7YYL5ktTcZkr1cFBEY9sh1XZ0E8B9CNRxnwtIyMdI2txUwS7wB5yVP74sJ
	Uc2bxq62gkZJik/oGASZCpUBD2iZVKo+wza3m+/zoxJdv4bwC9/QxZd9AR71D/xMEzFlwkXzd0EWm
	QrmyjOsEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGVfX-0004oU-I7; Mon, 23 Mar 2020 22:35:39 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGVfT-0004nf-Jn
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 22:35:38 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 711ED2327F;
 Mon, 23 Mar 2020 23:35:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1585002930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xAKZwdC5MBZPuNPczEha7HeU8fg9rY1BGqM2vuwHuxw=;
 b=i1zPl9dSdfl8ZRy3EMG664/uRV/95794E5ydPp/0Eo/i+RgC675lZPzyJwBXrZCWfffvgD
 INL06CtLu5jvYDuUW07tnGw47VGOdDpJvOzlLrTMeXgiCjxsHzi81keUyqWB7LKRcRC7PE
 QHehetbnEb0wY2P6qN32E8p4SdFoL1g=
MIME-Version: 1.0
Date: Mon, 23 Mar 2020 23:35:30 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v3 1/5] mtd: spi-nor: Fix gap in SR block protection
 locking
In-Reply-To: <3123463.3oovMYBsBI@192.168.0.120>
References: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
 <4551629.Jkd3TAmcGf@192.168.0.120>
 <401ca7a54a8d327a0397880db6a9a475@walle.cc>
 <3123463.3oovMYBsBI@192.168.0.120>
Message-ID: <c107f1c352fc975519531ffb54849e35@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.10
X-Spamd-Bar: /
X-Rspamd-Server: web
X-Rspamd-Queue-Id: 711ED2327F
X-Spamd-Result: default: False [-0.10 / 15.00]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; TO_DN_NONE(0.00)[];
 DKIM_SIGNED(0.00)[]; NEURAL_HAM(-0.00)[-0.781];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_153535_977822_B5849CC3 
X-CRM114-Status: GOOD (  27.54  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com, js07.lee@samsung.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2020-03-23 22:30, schrieb Tudor.Ambarus@microchip.com:
> On Monday, March 23, 2020 11:14:05 PM EET Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the
>> content is safe
>> Am 2020-03-23 21:26, schrieb Tudor.Ambarus@microchip.com:
>> > On Monday, March 23, 2020 9:54:38 PM EET Michael Walle wrote:
>> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>> >> the
>> >> content is safe
>> >>
>> >> Am 2020-03-23 20:20, schrieb Tudor.Ambarus@microchip.com:
>> >> > On Monday, March 23, 2020 8:27:13 PM EET Michael Walle wrote:
>> >> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>> >> >> the
>> >> >> content is safe
>> >> >>
>> >> >> Hi,
>> >> >>
>> >> >> Am 2020-03-23 10:24, schrieb Tudor.Ambarus@microchip.com:
>> >> >> > From: Tudor Ambarus <tudor.ambarus@microchip.com>
>> >> >> >
>> >> >> > Fix the gap for the SR block protection, the BP bits were set with
>> >> >> > a +1 value than actually needed. This patch does not change the
>> >> >> > behavior of the locking operations, just fixes the protected areas.
>> >> >>
>> >> >> So instead of rounding up, it does round down now?
>> >> >
>> >> > No. Why do you say that it rounds up? The behavior is not changed, the
>> >> > patch
>> >> > merely fix the protected area, which was wrong before. The round down
>> >> > is
>> >> > present before this patch.
>> >>
>> >> TBH I don't understand what this patch should do. Could you give an
>> >> example?
>> >
>> > sure, let me try to be more explicit.
>> >
>> >> >> > On a 16Mbit flash with 64KByte erase sector, the following changed
>> >>
>> >> >> > for the lock operation:
>> >> 16MBit is a bad example, because it is broken anyway, isn't it? We use
>> >> a
>> >
>> > it's not.
>> 
>> If I'm not mistaken this falls into the same category like the new 
>> 4bits
>> BP
>> flashes, because there are more slots free than needed. Ie. the last 
>> one
>> "protect all" is either 110b or 111b and thus don't work with the old
>> formula. This was actually my reason why there is no new formula for 
>> the
>> 4 bits BP flashes; but the current one is not working with flashes
>> <32Mbit.
>> See the old long thread.
>> 
>> >> 32Mbit flash where 2MB are locked and the second 2MB are unlocked. Eg.
>> >> a
>> >> 50/50 split. I haven't seen any issued. Shouldn't it be then
>> >> completely
>> >> locked according this the following example?
>> >
>> > I don't follow.
>> 
>> We've successfully used the "flash_lock 0 0x200" (with 4k sectors) on
>> our
>> boards to lock the first half of our 4MiB flash.
>> 
>> > The table from below was generated for the S25FL116K 16 Mbit flash.
>> > BTW, one
>> > has to disable CONFIG_MTD_SPI_NOR_USE_4K_SECTORS in order to test the
>> > locking.
>> > When you have a 4k sector erase, the locking is simply wrong, but this
>> > is
>> > another topic.
>> 
>> it should work with that too if you convert the number to the smaller
>> sectors,
>> ie multiply by 16; But yeah the cli tool has a broken interface. It
>> should
>> accept both offset and length in bytes; not one one in bytes and one 
>> in
>> sectors,
>> where the latter also changes with CONFIG_MTD_SPI_NOR_USE_4K_SECTORS.
>> 
>> >> >> > Number of blocks | BP2:0 before | BP2:0 now |
>> >> >> >
>> >> >> >                1 | 010b         | 001b      |
>> >
>> > - number of blocks is how many blocks you want to lock. One would do
>> > for one
>> >
>> > block:
>> >     flash_lock /dev/mtd 0 1
>> >
>> > i.e. lock a single erase block starting from offset 0.
>> >
>> > - "BP0:2 before" is the result of the operation "flash_lock /dev/mtd 0
>> > 1"
>> > before this patch
>> 
>> Without your patch applied it works like expected:
>> 
>> [    1.914329] spi-nor spi0.0: w25q32dw (4096 Kbytes)
>> # flash_lock -l /dev/mtd1 0 1
>> # cat
>> /sys/devices/platform/soc/20c0000.spi/spi_master/spi0/spi0.0/status_reg
>> a4
>> 
>> A4 is 1010_0100, ie BP[2:0] = 001b and TB=1
>> 
> 
> what happens if you request flash_lock -l /dev/mtd1 0 3?

with your patch applied:

# flash_lock -u /dev/mtd1 0 64
# cat 
/sys/devices/platform/soc/20c0000.spi/spi_master/spi0/spi0.0/status_reg
00
# flash_lock -l /dev/mtd1 0 3
# cat 
/sys/devices/platform/soc/20c0000.spi/spi_master/spi0/spi0.0/status_reg
a4


without it:

# flash_lock -u /dev/mtd1 0 64
# cat 
/sys/devices/platform/soc/20c0000.spi/spi_master/spi0/spi0.0/status_reg
00
# flash_lock -l /dev/mtd1 0 3
# cat 
/sys/devices/platform/soc/20c0000.spi/spi_master/spi0/spi0.0/status_reg
a8


>> # flash_lock -u /dev/mtd1 0 64
>> # flash_lock -l /dev/mtd1 0 32
>> # cat
>> /sys/devices/platform/soc/20c0000.spi/spi_master/spi0/spi0.0/status_reg
>> b8
>> 
>> 
>> With this patch applied:
>> 
>> # flash_lock -u /dev/mtd1 0 64
>> # cat
>> /sys/devices/platform/soc/20c0000.spi/spi_master/spi0/spi0.0/status_reg
>> 00
>> # flash_lock -l /dev/mtd1 0 1
>> flash_lock: error!: could not lock device: /dev/mtd1
>> 
>>              error 22 (Invalid argument)
> 
> I'm wondering what was the reason for the -EINVAL.
> 
>> # flash_lock -l /dev/mtd1 0 2
>> # cat
>> /sys/devices/platform/soc/20c0000.spi/spi_master/spi0/spi0.0/status_reg
>> a4
>> 
>> which is wrong, isn't it?
>> 
> Looks so. You should have obtained, 0xa8, right?

correct, BP should be 010b for the first two sectors.

> Will recheck tomorrow
> morning.
> 
> Thanks for testing this! I don't have a 32Mbit flash ...

You should be able to reproduce it with every flash >=32Mbit which has
3 BP bits.

-michael

> 
> Cheers,
> ta
>> 
>> > - "BP0:2 now" is the result of the operation "flash_lock /dev/mtd 0 1"
>> > using
>> > this patch
>> >
>> > So before this patch, the lock operation was bad, because it locked 2
>> > blocks
>> > instead of one.
>> >
>> >> >> >                2 | 110b         | 010b      |
>> >
>> > - lock 2 erase blocks starting from offset 0. Results before this
>> > patch, and
>> > after this patch. Continue the logic on the following lines.
>> >
>> > oops there's a typo in column 2, sorry. The value in column 2 should
>> > have been
>> > 011b.
>> >
>> > So before this patch, when one requested to lock 2 block starting from
>> > offset
>> > 0, we would obtain 4 blocks locked, and he should have obtained just 2.
>> >
>> > The scope of this patch is to first fix the locking ops, so that we can
>> > introduce a more generic formula that gives the same results as before
>> > introducing it. Without this patch, the new formula will silently fix
>> > the bug
>> > that is described here.
>> >
>> >> >> >                3 | 110b         | 010b      |
>> >
>> >               ^ typo s/110b/011b
>> >
>> > rest of the examples are good.
>> >
>> > Cheers,
>> > ta
>> >
>> >> >> >                4 | 100b         | 011b      |
>> >> >> >                5 | 100b         | 011b      |
>> >> >> >                6 | 100b         | 011b      |
>> >> >> >                7 | 100b         | 011b      |
>> >> >> >                8 | 101b         | 100b      |
>> >> >> >                9 | 101b         | 100b      |
>> >> >> >
>> >> >> >              ... | ...          | ...       |
>> >> >> >
>> >> >> > For the lock operation, if one requests to lock an area that is not
>> >> >> > matching the upper boundary of a BP protected area, we round down
>> >> >> > the total length and lock less than the user requested, in order to
>> >> >> > not lock more than the user actually requested.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
