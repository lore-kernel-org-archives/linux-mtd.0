Return-Path: <SRS0=Ic5j=4I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 547B5C11D0C
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Feb 2020 19:09:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 193682465D
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Feb 2020 19:09:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XIQXai5b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="L6yadnXx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 193682465D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5ilxBahmzgaGNg7obAFKN3g682BMcsmBYtjjFa1QIy8=; b=XIQXai5bNgZ+iGN+8I7HufaYq
	mbAsGStvVDPl1h/fIXgVqKvNnehz7wfADw3FKl6N7A6AxHwK0EEdPqldt0uFVnrJ0MUfC9jkqFaaS
	FBmdezAEPDIcnKd1scLnHLS1s6GsIel9P0qIMDad6nKmICInM3vqAqpkQl+MSwxyTjX9UJdH+rtol
	2vFlQ/BAoWl3CabPqGcmTc/xnJuU4VeW/Ip+eXBSqOP6XjkzelsLLYM06fu93Bg3e4BdVQuPWfglJ
	ZKFOO4vDuGEHg+HjlwGaeoQ4TFM7XFBjMauOy3m/OeWuLIICKm7NlPFFLaPU8nr/iEHGPT+Nyy5+m
	LC2WDaSWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4rCB-0005dj-91; Thu, 20 Feb 2020 19:09:11 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4rC7-0005cv-3J
 for linux-mtd@lists.infradead.org; Thu, 20 Feb 2020 19:09:08 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id ABACF23D22;
 Thu, 20 Feb 2020 20:09:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1582225744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x/XfMB6oBwmvjeYvWad8g3lgIV8k5aP5j8qLuB6xuko=;
 b=L6yadnXxoqi/+hn4n3vISKlnB6LCDJon0IGUQ3t4trJNaLQ24q8g9N9mdhCAjkhqvL4tic
 /6mVmYOs7tcsuhlutIGKVlaHEVTDpnLXOtYvb6nUupyOFdfciN8l3QqX8DWxpKlJ8yNxe4
 08pA6X0Sjeejw4/mJeJHp9oJ6PCWAHk=
MIME-Version: 1.0
Date: Thu, 20 Feb 2020 20:09:03 +0100
From: Michael Walle <michael@walle.cc>
To: Jungseung Lee <js07.lee@samsung.com>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
In-Reply-To: <ed9ae10ab3be4da90779cb6f8d6c6cf1e9fbc968.camel@samsung.com>
References: <20200113055907.9029-2-js07.lee@samsung.com>
 <4000296.ZurDTCRVlM@localhost.localdomain>
 <23efafdb8c439838338eef421e341f4a@walle.cc>
 <CGME20200210112615epcas1p1c838e38a519a3f3e390bfc51d4db1d3b@epcas1p1.samsung.com>
 <132665276.5Rxbr4LpEM@localhost.localdomain>
 <ed9ae10ab3be4da90779cb6f8d6c6cf1e9fbc968.camel@samsung.com>
Message-ID: <9aaabe654603679dffdbf4c57bcfe0ff@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.10
X-Spamd-Bar: +
X-Rspamd-Server: web
X-Rspamd-Queue-Id: ABACF23D22
X-Spamd-Result: default: False [1.40 / 15.00]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_FIVE(0.00)[5];
 DKIM_SIGNED(0.00)[]; NEURAL_HAM(-0.00)[-0.852];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[microchip.com,ti.com,gmail.com,lists.infradead.org];
 MID_RHS_MATCH_FROM(0.00)[]; SUSPICIOUS_RECIPS(1.50)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_110907_441899_889D356A 
X-CRM114-Status: GOOD (  20.15  )
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
 Tudor.Ambarus@microchip.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2020-02-19 11:50, schrieb Jungseung Lee:
> Hi, Tudor and all
> 
> 2020-02-10 (Mon), 11:26 +0000, Tudor.Ambarus@microchip.com:
>> On Monday, February 10, 2020 12:29:34 PM EET Michael Walle wrote:
>> > > It's bytes. Take a look at W25Q128JV. The sector size for this
>> > > flash is
>> > > 64KByte. The flash has 256 sectors. For this specific case:
>> > > bp_slots_available = 6;
>> > > bp_slots_needed = 8;
>> > >
>> > > The if condition is true, so
>> > > bp_slot_count = 6;
>> > > bp_min_slot_size = 64k << (8 - 6); //256k
>> >
>> > But nor->info->n_sectors is not 64k, its 256. Do you mean
>> > sector_size
>> > (like in
>> > my example below? Then we are on the same page
>> 
>> Indeed, there is a typo in the pseudo code; I'm happy that the
>> example is
>> correct at least. I meant sector_size, not sectors. Now we should
>> exercise the
>> logic to all the known (corner) cases. Maybe Jungseung will tell us
>> if he
>> spots a flaw in the overall logic.
>> 
> 
> I didn't find any flaw in this logic. But IMHO for the pseudo code.
> 
> bp_slots_available = (bp_mask >> shift) + 1 - 2;
> bp_slots_needed = ilog2(nor->info->n_sectors);
> 
> if (bp_slots_needed > bp_slots_available) {
>     bp_slot_count = bp_slots_available;
>     bp_min_slot_size = nor->info->sector_size <<
>         (bp_slots_needed - bp_slots_available);
> } else {
>     bp_slot_count = bp_slots_needed;
>     bp_min_slot_size = mtd->size >> bp_slot_count;
> }
> 
> Probably we can use directly nor->info->sector_size for bp_min_slot_
> size.
> 
> sector_size x n_sectors = mtd->size
> mtd->size / n_sectors = mtd->size >>
> ilog2(n_sectors) = sector_size
> 
> bp_slot_count is equal to log2(n_sectors) now so if we can trust the
> value, we can also trust sector_size.
> 
> After change it,
> 
> if (bp_slots_needed > bp_slots_available)
>     bp_min_slot_size = nor->info->sector_size <<
>         (bp_slots_needed - bp_slots_available);
> else
>     bp_min_slot_size = nor->info->sector_size

Yes, thats what I pointed out in my previous mail, too. So I guess we
agree on that.

> This is a comment from my previous mail.
>> > The exact fact is that locks operate in two different ways
>> > according to flash model.
>> >
>> > (1) the smallest protected portion is fixed.
>> >     for BP0-2 : 1/64
>> >     for BP0-1 : 1/4
>> > (2) the smallest protected portion is inversely propotional with
>> > number of sectors.

Again. please don't consider the ratio of the protected area to the 
flash size.
This is only the result of applying the sector size and IMHO really bad 
for
understanding. Use the number of protected sectors. Thus your (2) is 
actually
always one sector (as you've already pointed out above).

> (1) - if the slot is insufficient.
> (2) - if the slot is sufficient.
> 
> From the fact, that could be rewritten like below. I think it's more
> intuitive one.
> 
> if (bp_slots_needed > bp_slots_available)    // (1)
>     bp_min_slot_size = mtd->size >> bp_slots_available;

Given the reasoning above, I'd prefer having the number of sectors and 
thus
the sector_size. Eg. keep the following

     bp_min_slot_size = nor->info->sector_size <<
          (bp_slots_needed - bp_slots_available);


> else                                         // (2)
>     bp_min_slot_size = nor->info->sector_size;
> 
> We could also find a few flashes that does not following the overall
> logic. For example, "en25qh256" and "en25qh16" which was manufactured
> by EON. They are always following way (2) no matter what the number of
> slot is. It seems that it could be handled like below with custom hook
> later.
> 
> if (bp_slots_needed < bp_slots_available || force)

For the en25qh16 the "bp_slots_needed < bp_slots_available" is already
true, isn't it?
But good catch for the en25qh256. IMHO the rework of the BP bits should 
already
add a flag (together with a reference to this flash) so this information
is not lost. what about sth like MIN_LOCK_SIZE_IS_ONE_SECTOR.

-michael

>     bp_min_slot_size = nor->info->sector_size;
> else
>     bp_min_slot_size = mtd->size >> bp_slots_available;
> 
>> Cheers,
>> ta
>> 
> 
> Thanks,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
