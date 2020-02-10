Return-Path: <SRS0=fEDX=36=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A6BC352A4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 08:34:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76F3E21739
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 08:34:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m1FJJrcL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="WJF8UHJ4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76F3E21739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aPTgyz30sMnWxtHNyx3nOzNVLTR31wTHU55Diev/mgs=; b=m1FJJrcLCrVr6rsVB2/tNe7aD
	kj0hqR5SLo0RNarxC7CBimDtQQAl1puV7DzA+I/Jt3rG1Jma1Fy3AlL+ghJy5gpd4ILavEKc3ZwYm
	MRZGyPpoJA6Oy/jGot0je4mxbR12O+yRmSi13ESgkqzohnVCZgNwnjsQSFPK14npswKLIKIQwJ37d
	Pk6q8dAFcCjFHgeShbVmZ5hnKV/cR1tVT1iVPm/TsYUKJfyTGRBAHaQu7yXF2T76+26lYxdul5bEq
	zXh95t7SsIp3gdI7g92H0gaG8+bluBAUM7pdSRrHXNCDqvuBkiESyWd9QC52sTvsHDHCIo11OUvAn
	DC1VCdnzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j14W1-0008JG-4f; Mon, 10 Feb 2020 08:34:01 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j14Vy-0008Ij-1R
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2020 08:33:59 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id DF48323EAF;
 Mon, 10 Feb 2020 09:33:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1581323627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q/kcABwNWfonw3oZ0Q0WLxGOqs2cwtw/cTFEwBLi1q4=;
 b=WJF8UHJ4lB9ewBcB9Prv8SepvijgXvVD1gWkHWTmUmownc9PK5qlWCK5yAs5kmxofinZw4
 DrFrBrMZ/ChxeJhV80OaJ4FzU0MkKtM1v1lQYgeE8BSyk+IT7vvDCWmXs3lFgkV2/mRWX2
 5+0zdcvL5O+s6qbSS//8I/UqH/Q92Kw=
MIME-Version: 1.0
Date: Mon, 10 Feb 2020 09:33:41 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
In-Reply-To: <3576415.28M9a3X63c@localhost.localdomain>
References: <20200113055907.9029-2-js07.lee@samsung.com>
 <141fe5bf27542420292864bf2d574a8c94dc6867.camel@samsung.com>
 <687e49cb-96d0-464f-0bc2-4537780e9731@ti.com>
 <3576415.28M9a3X63c@localhost.localdomain>
Message-ID: <56a82fb7956ef9004828569f0dbe8e8d@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.10
X-Spamd-Bar: +
X-Rspamd-Server: web
X-Rspamd-Queue-Id: DF48323EAF
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
X-CRM114-CacheID: sfid-20200210_003358_538398_BDF96490 
X-CRM114-Status: GOOD (  17.71  )
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


Hi Tudor and all,

Am 2020-02-07 13:17, schrieb Tudor.Ambarus@microchip.com:
> Hi,
> 
> On Monday, February 3, 2020 3:56:58 PM EET Vignesh Raghavendra wrote:
>> >>>>>>>>> /*
>> >>>>>>>>> * Need smallest pow such that:
>> >>>>>>>>> *
>> >>>>>>>>> @@ -1908,7 +1972,17 @@ static int stm_lock(struct
>> >>>>>>>>> spi_nor
>> >>>>>>>>> *nor,
>> >>>>>>>>> loff_t ofs, uint64_t len)
>> >>>>>>>>> *   pow = ceil(log2(size / len)) = log2(size)
>> >>>>>>>>> -
>> >>>>>>>>> floor(log2(len))
>> >>>>>>>>> */
>> >>>>>>>>> pow = ilog2(mtd->size) - ilog2(lock_len);
>> >>>>>>>>> -     val = mask - (pow << SR_BP_SHIFT);
>> >>>>>>>>> +
>> >>>>>>>>> +     if (nor->flags & SNOR_F_HAS_SR_BP3) {
>> >>>>>>>>> +             val = ilog2(nor->n_sectors) + 1 - pow;
>> >>>>>>>>
>> >>>>>>>> Why do you use a new calculation here? As far as I can
>> >>>>>>>> see,
>> >>>>>>>> the
>> >>>>>>>> method is
>> >>>>>>>> the same except that is has one bit more. That also
>> >>>>>>>> raises
>> >>>>>>>> the
>> >>>>>>>> question why
>> >>>>>>>> n_sectors is now needed?
>> 
>> Flash devices have variable sector size, 64KB, 128KB or 256KB... While
>> mapping of number of sectors locked to BP bits is dependent on rules 1
>> to 3 you mentioned below, the size or area of flash protected depends 
>> on
>> sector size.
>> 
>> So, the current formula in spi-nor.c (ignoring TB and other 
>> boilerplate):
>> 
>> pow = ilog2(mtd->size) - ilog2(lock_len);
>> val = mask - (pow << shift);
>> 
>> This works only for devices with 64KB sector size as 8MB flash with 
>> 64KB
>> sector size would have 128 sectors (BP0-2 => 0b111 => 2^7).
>> 
>> A more generic formula would be:
>> 
>> Find n where 2^(n - 1) = len/sector-size
>> OR 2^ (n - 1) = len * n_sectors / mtd->size
>> 
>> Which solves to:
>> 
>> pow = ilog2(mtd->size) - ilog2(lock_len);
>> val = ilog2(nor->n_sectors) + 1 - pow;
> 
> The current mainline locking support is limited. Michael spotted a good
> improvement, but I think there are still others that we should 
> consider.

Sure, as I said my patch was just to show, that there is an underlying 
problem
and that we should not take the 4th BP bit to differentiate between the 
two
different formulas.

> We should use a single formula, for all the BP cases. How about the 
> following:
> 
> bp_slots_available = (bp_mask >> shift) + 1 - 2;
> bp_slots_needed = ilog2(nor->info->n_sectors);
> 
> if (bp_slots_needed > bp_slots_available) {
> 	bp_slot_count = bp_slots_available;
> 	bp_min_slot_size = nor->info->n_sectors <<
> 		(bp_slots_needed - bp_slots_available);

mhh, what is the unit of bp_min_slot_size? bytes or sectors? I guess it 
should
be bytes, eg for a 8MiB flash it would be 128kiB and for a 16MiB flash 
it would
be 256kiB (if there are 3 BP bits).


> } else {
> 	bp_slot_count = bp_slots_needed;
> 	bp_min_slot_size = mtd->size >> bp_block_count;

this is a complicated way of saying its the size of one sector, isn't 
it?
can't we use nor->info->sector_size here? Eg.

if (bp_slots_needed > bp_slots_available) {
	bp_slot_count = bp_slots_available;
	bp_min_slot_size = nor->info->sector_size <<
		(bp_slots_needed - bp_slots_available);
} else {
	bp_slot_count = bp_slots_needed;
  	bp_min_slot_size = nor->info->sector_size;
}



> }
> 
> When both can_be_bottom and can_be_top are true, we prefer the top 
> protection,
> which is incorrect/buggy/sub-optimal. If the received offset is not 
> aligned to
> one of the start addresses of the bp slots, then we should up/down 
> align the
> offset to the closest bp slot, depending on TB and which (top or 
> bottom) fits
> better. Based on the updated offset and length we can compute the lock 
> range,
> and after that:
> 
> n = ilog2(bp_lock_range/bp_min_slot_size) + 1;
> val = mask - (n << shift);

btw. we should catch the two special cases:
  - lock none -> 0 (that was already the case)
  - lock all -> all BP bits

The latter is important if "bp_slots_needed < bp_slots_available" 
because there
are multiple settings for protect all. Most flashes will define any 
remaining
setting for "protect all", but I've also seen flashes where the 
in-between ones
were undefined (not mentioned) and only the "all bit set" was protect 
all.


-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
