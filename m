Return-Path: <SRS0=fEDX=36=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F118BC352A3
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 10:30:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C61BB2080C
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 10:30:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nrW2sR4E";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="XvueJ+zj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C61BB2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ymwxi6TquqWMYC3JASAUCWL8t6lZ2tIi9MWoC8jULqY=; b=nrW2sR4Ekty2Lc+vvGvqV5v+6
	cfO4id5HIpO+rGlOSGmgaibxpes/p/cH9mpslcQAwiy2CnBOQ6Yx0CPxdwqXQg2wPqrYbh3iMZnDA
	d8YT3gXMqKWrlwWaun+Kdb/67iFmM+/mskH97dSHPfT1LjVBXncx2qDjpJ4iNnDAM8Nx1Gc7v93YK
	4z7AG9pfz1tmSeDIJkZQFar24S3CxaADOmfbtrtShe7baFaRPvTx7fYUdrXLdyMFGxifPWeVh/7WE
	p2nYD5nt1FiLOpAQjPuvB1j1lF5D8jGYWA5imLY5b4M7VK4W1SvLNQE0ZwFVer6B3EPXs7ixbUwVW
	jlhUm3Vxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j16K1-0007f1-SR; Mon, 10 Feb 2020 10:29:45 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j16Jy-0007eX-81
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2020 10:29:44 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 5893F23EB1;
 Mon, 10 Feb 2020 11:29:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1581330574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nM44qF97NCvxj6J7xLUNLHkG1vukXpLxDtcr9wK4E1c=;
 b=XvueJ+zj118gogxYuxoc+4qMMP4No76AbmSUsF5PRSUminR5h5hUix2rCS2LwkILEqYUzG
 mSLPw1oVZKjTTjWj+NxIBiIRKKmiaaGJR4pa1cJUGX669u2+lludC60Z0s9Cy76iiWxjTd
 3lkK+BvX17SYk3+keJNdc5bd4bQTbGs=
MIME-Version: 1.0
Date: Mon, 10 Feb 2020 11:29:34 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
In-Reply-To: <4000296.ZurDTCRVlM@localhost.localdomain>
References: <20200113055907.9029-2-js07.lee@samsung.com>
 <3576415.28M9a3X63c@localhost.localdomain>
 <56a82fb7956ef9004828569f0dbe8e8d@walle.cc>
 <4000296.ZurDTCRVlM@localhost.localdomain>
Message-ID: <23efafdb8c439838338eef421e341f4a@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.10
X-Spamd-Bar: +
X-Rspamd-Server: web
X-Rspamd-Queue-Id: 5893F23EB1
X-Spamd-Result: default: False [1.40 / 15.00]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; TO_DN_NONE(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; DKIM_SIGNED(0.00)[];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[ti.com,samsung.com,gmail.com,lists.infradead.org];
 MID_RHS_MATCH_FROM(0.00)[]; SUSPICIOUS_RECIPS(1.50)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_022942_602328_9C809487 
X-CRM114-Status: GOOD (  25.90  )
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
Cc: js07.lee@gmail.com, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 js07.lee@samsung.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

Am 2020-02-10 10:47, schrieb Tudor.Ambarus@microchip.com:
> Hi, Michael,
> 
> On Monday, February 10, 2020 10:33:41 AM EET Michael Walle wrote:
> 
> cut
> 
>> > On Monday, February 3, 2020 3:56:58 PM EET Vignesh Raghavendra wrote:
>> >> >>>>>>>>> /*
>> >> >>>>>>>>> * Need smallest pow such that:
>> >> >>>>>>>>> *
>> >> >>>>>>>>> @@ -1908,7 +1972,17 @@ static int stm_lock(struct
>> >> >>>>>>>>> spi_nor
>> >> >>>>>>>>> *nor,
>> >> >>>>>>>>> loff_t ofs, uint64_t len)
>> >> >>>>>>>>> *   pow = ceil(log2(size / len)) = log2(size)
>> >> >>>>>>>>> -
>> >> >>>>>>>>> floor(log2(len))
>> >> >>>>>>>>> */
>> >> >>>>>>>>> pow = ilog2(mtd->size) - ilog2(lock_len);
>> >> >>>>>>>>> -     val = mask - (pow << SR_BP_SHIFT);
>> >> >>>>>>>>> +
>> >> >>>>>>>>> +     if (nor->flags & SNOR_F_HAS_SR_BP3) {
>> >> >>>>>>>>> +             val = ilog2(nor->n_sectors) + 1 - pow;
>> >> >>>>>>>>
>> >> >>>>>>>> Why do you use a new calculation here? As far as I can
>> >> >>>>>>>> see,
>> >> >>>>>>>> the
>> >> >>>>>>>> method is
>> >> >>>>>>>> the same except that is has one bit more. That also
>> >> >>>>>>>> raises
>> >> >>>>>>>> the
>> >> >>>>>>>> question why
>> >> >>>>>>>> n_sectors is now needed?
>> >>
>> >> Flash devices have variable sector size, 64KB, 128KB or 256KB... While
>> >> mapping of number of sectors locked to BP bits is dependent on rules 1
>> >> to 3 you mentioned below, the size or area of flash protected depends
>> >> on
>> >> sector size.
>> >>
>> >> So, the current formula in spi-nor.c (ignoring TB and other
>> >> boilerplate):
>> >>
>> >> pow = ilog2(mtd->size) - ilog2(lock_len);
>> >> val = mask - (pow << shift);
>> >>
>> >> This works only for devices with 64KB sector size as 8MB flash with
>> >> 64KB
>> >> sector size would have 128 sectors (BP0-2 => 0b111 => 2^7).
>> >>
>> >> A more generic formula would be:
>> >>
>> >> Find n where 2^(n - 1) = len/sector-size
>> >> OR 2^ (n - 1) = len * n_sectors / mtd->size
>> >>
>> >> Which solves to:
>> >>
>> >> pow = ilog2(mtd->size) - ilog2(lock_len);
>> >> val = ilog2(nor->n_sectors) + 1 - pow;
>> >
>> > The current mainline locking support is limited. Michael spotted a good
>> > improvement, but I think there are still others that we should
>> > consider.
>> 
>> Sure, as I said my patch was just to show, that there is an underlying
>> problem
>> and that we should not take the 4th BP bit to differentiate between 
>> the
>> two
>> different formulas.
> 
> Right, this is the goal.
> 
> Let me try to extend the description of the proposal.
> 
>> 
>> > We should use a single formula, for all the BP cases. How about the
>> > following:
>> >
>> > bp_slots_available = (bp_mask >> shift) + 1 - 2;
> 
> This formula is derived from Michael's patch.
> 
> A slot (to me) is a horizontal line in the Memory protection table. 
> Maybe we
> can find a better/standardized name for this.
> 
> So for BP0-2, bp_slots_available = 6, and for BP0-3, bp_slots_available 
> = 14.
> Notice that I stripped the two special cases: lock none and lock all.
> 
>> > bp_slots_needed = ilog2(nor->info->n_sectors);
> 
> With bp_slots_needed I tried to describe how many slots are needed if 
> the
> protected density for the first slot is at minimum (sector size).
> 
>> >
>> > if (bp_slots_needed > bp_slots_available) {
>> >
>> >       bp_slot_count = bp_slots_available;
>> >       bp_min_slot_size = nor->info->n_sectors <<
>> >
>> >               (bp_slots_needed - bp_slots_available);
>> 
>> mhh, what is the unit of bp_min_slot_size? bytes or sectors? I guess 
>> it
>> should
> 
> It's bytes. Take a look at W25Q128JV. The sector size for this flash is
> 64KByte. The flash has 256 sectors. For this specific case:
> 	bp_slots_available = 6;
> 	bp_slots_needed = 8;
> 
> The if condition is true, so
> 	bp_slot_count = 6;
> 	bp_min_slot_size = 64k << (8 - 6); //256k

But nor->info->n_sectors is not 64k, its 256. Do you mean sector_size 
(like in
my example below? Then we are on the same page ;)


> which is exactly the protected density for the first slot. The 
> protected
> densities of the other slots can be computed by multiplying with powers 
> of 2.
> 
>> be bytes, eg for a 8MiB flash it would be 128kiB and for a 16MiB flash
>> it would
>> be 256kiB (if there are 3 BP bits).
>> 
>> > } else {
>> >
>> >       bp_slot_count = bp_slots_needed;
>> >       bp_min_slot_size = mtd->size >> bp_block_count;
> 
> typo: s/bp_block_count/bp_slot_count
>> 
>> this is a complicated way of saying its the size of one sector, isn't
>> it?
>> can't we use nor->info->sector_size here? Eg.
>> 
>> if (bp_slots_needed > bp_slots_available) {
>>         bp_slot_count = bp_slots_available;
>>         bp_min_slot_size = nor->info->sector_size <<
>>                 (bp_slots_needed - bp_slots_available);
>> } else {
>>         bp_slot_count = bp_slots_needed;
>>         bp_min_slot_size = nor->info->sector_size;
>> }
> 
> you're right, we're in the else case, where the assumption that the 
> minimum
> protected density is sector size is true, we can use directly 
> nor->info-
>> sector_size.
> 
>> 
>> > }
>> >
>> > When both can_be_bottom and can_be_top are true, we prefer the top
>> > protection,
>> > which is incorrect/buggy/sub-optimal. If the received offset is not
>> > aligned to
>> > one of the start addresses of the bp slots, then we should up/down
>> > align the
>> > offset to the closest bp slot, depending on TB and which (top or
>> > bottom) fits
>> > better. Based on the updated offset and length we can compute the lock
>> > range,
>> > and after that:
>> >
>> > n = ilog2(bp_lock_range/bp_min_slot_size) + 1;
>> > val = mask - (n << shift);
>> 
>> btw. we should catch the two special cases:
>>   - lock none -> 0 (that was already the case)
>>   - lock all -> all BP bits
>> 
>> The latter is important if "bp_slots_needed < bp_slots_available"
>> because there
>> are multiple settings for protect all. Most flashes will define any
>> remaining
>> setting for "protect all", but I've also seen flashes where the
>> in-between ones
>> were undefined (not mentioned) and only the "all bit set" was protect
>> all.
> 
> This case is addressed by using bp_slot_count and bp_slots_available. 
> We're in
> the else case from above. From bp_slot_count up to the 
> bp_slots_available,
> those slots are "protect all".

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
