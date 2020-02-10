Return-Path: <SRS0=fEDX=36=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A8BC352A3
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 12:15:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C475B20838
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 12:15:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZC7LQuIE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="pRd1D/4H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C475B20838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QoXJVF5nOVMFsli+u8bncnkzevZZaSZ4QLrWWx4fl/Y=; b=ZC7LQuIExEyeiltpnrX5/4aE2
	v+O3encN6QCOSp0nkoxQyLhSrzsWrSeksyI4hfRK+LRXbGec22Yo99wyr8JVS3YWI3RTThspFNY9l
	qa26dSO8x9JCHf286d+m9/NlfL+c4QzZAb3pfsY26rCIA+2D4sFmTDtcCwA7qcq/uKaSQPs2jQuYk
	e7sDfMOJX718O9GSWzGG0l5SRuZ5lbwVwKtwJRmUA3Xl0t+/h4NnsswdIT5W8U+/jEeRJrl+nCR1d
	qBBjQ9wnQZsD8CjcDP9VPq5bdfHpAu8kPlNQM6XW2aBAMHZ+FpqijgQs4nt1TNq6cD+6yCGyzxD2Z
	/1Sp7dHaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j17xo-0002ZB-3G; Mon, 10 Feb 2020 12:14:56 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j17xj-0002YX-SZ
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2020 12:14:54 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 9AA9123EAD;
 Mon, 10 Feb 2020 13:14:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1581336889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ttW70dAUBSAcfS+rUu/nUaIUAHjNCjpINkd3UqZx3lo=;
 b=pRd1D/4HYOI+yOvqAlEXX/k5BxTjwo0iEnKy7gM89O19WwHOjuj2xAuc2O4WuMl/MmB9lL
 0a8bhfbEBUSlAj01vC6IGI4UC4LHsXaJWg+sXlgN2FwWoPIB6MqgUQfEWpUZTjKBYIoNdw
 f3dutgTOibFlyyJKs4yr3kLSubFMvzg=
MIME-Version: 1.0
Date: Mon, 10 Feb 2020 13:14:48 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
In-Reply-To: <4425106.vomQgZVa01@localhost.localdomain>
References: <20200113055907.9029-2-js07.lee@samsung.com>
 <2959960.PApuY8DcOC@localhost.localdomain>
 <d7311f0ea1d0142a9523548bb3562f1a@walle.cc>
 <4425106.vomQgZVa01@localhost.localdomain>
Message-ID: <3eb14c9f46fde4d232ed5d1c6295ca91@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.10
X-Spamd-Bar: +
X-Rspamd-Server: web
X-Rspamd-Queue-Id: 9AA9123EAD
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
X-CRM114-CacheID: sfid-20200210_041452_081296_11C3F32F 
X-CRM114-Status: GOOD (  12.50  )
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

Am 2020-02-10 12:27, schrieb Tudor.Ambarus@microchip.com:
> On Monday, February 10, 2020 12:40:59 PM EET Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the
>> content is safe
>> Am 2020-02-10 10:59, schrieb Tudor.Ambarus@microchip.com:
>> > On Monday, February 10, 2020 11:47:23 AM EET Tudor Ambarus wrote:
>> >> > btw. we should catch the two special cases:
>> >> > - lock none -> 0 (that was already the case)
>> >> > - lock all -> all BP bits
>> >> >
>> >> > The latter is important if "bp_slots_needed < bp_slots_available"
>> >> > because there
>> >> > are multiple settings for protect all. Most flashes will define any
>> >> > remaining
>> >> > setting for "protect all", but I've also seen flashes where the
>> >> > in-between ones
>> >> > were undefined (not mentioned) and only the "all bit set" was protect
>> >> > all.
>> >
>> > I re-read this. Do you have such an example of flash? Aren't the BP
>> > bits in
>> > this case marked with "X", i.e. don't care? If not, probably we can
>> > mask out
>> > those undefined slots.
>> 
>> There was definetly some datasheet where the remaining ones wasn't
>> described
>> _and_ there was no X (don't care) bits. Unfortunately, I don't find it
>> right
>> now. That datasheed made me wonder what the other "undefinded" cases
>> would be.
>> Probably it will also be "protect all"; I just mentioned it because it
>> would
>> be an easy special case to handle. I don't think we should mask out
>> anything,
>> either use the slot in between (ie the one which the formula gives us)
>> to
>> protect all or use the largest setting (ie [TB3 |] TB2 | TB1 | TB0). 
>> And
>> given the reasons above, I'd prefer the latter.
> 
> I'm fine with using the largest setting, but we'll need the proof 
> before going
> this way.

have a look at 7.1.11:
   https://www.winbond.com/resource-files/w25q80dv_revg_07212015.pdf

BP[2:0]=0b101 and 0b110 is not defined.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
