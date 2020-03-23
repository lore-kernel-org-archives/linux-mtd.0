Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B6CC4332E
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 19:54:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 747CD2070A
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 19:54:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QUJDD18Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="puOwNKkc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 747CD2070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZicXbdxJ/xIIBJUqBQkgw75hKxag3qDGnj0O7OcBQAI=; b=QUJDD18QSfAfhFS0dP0fsw/cd
	b65dlKSK9RL9aruskj970ZyPaxOtgXEEi3hOv/FU7hofm0z9BIPNbChYgsarxZ0liPbzwZkm7JBjg
	J03jIEz30prB4CawROp5qWPuFwvr2H98gSz1igwKYYSkTiimgmNfImLPD4cmDq9gj5idWGMO7wC9k
	R94e3urD7bNdm85WPYjeiAwgk+x51NzofkuW4tPEfXdAyQldVU1VUeyu/JWpnuCo5G8OuGajcngA1
	FZPpSSbg2R3JcL3iVLkt+JYMKIgYGUoDQns8M9Od2EwPN6BK3HuBamHHZV/B8/QtQbgCsXMbCnmCU
	mnNK6rp9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGT9t-0001b6-I3; Mon, 23 Mar 2020 19:54:49 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGT9p-0001aH-Hx
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 19:54:47 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id F005F23D18;
 Mon, 23 Mar 2020 20:54:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1584993279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1MdvXhIFhaOXYjcBtGrHpty4AM1K77VCGEKsjzAKrMA=;
 b=puOwNKkcMGj9BfiKoulpA87nlQa/N59nE0hvJ1Rvmq1VVTsykB9DQl5qMapAaKL3aHqqkt
 VmchyOlgV3dSIqvmiadmLd3TVDc3jdx5jKpZwtppXCQp3Wd57YUj+f3GYF/q6znxHpy/XN
 Fn8sXlFot028oVm95aa+QxRv+Ryg/QI=
MIME-Version: 1.0
Date: Mon, 23 Mar 2020 20:54:38 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v3 1/5] mtd: spi-nor: Fix gap in SR block protection
 locking
In-Reply-To: <5899969.zVFlrMANan@192.168.0.120>
References: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
 <20200323092430.1466234-2-tudor.ambarus@microchip.com>
 <b9a6d699790e48723489ecbbf1322dfe@walle.cc>
 <5899969.zVFlrMANan@192.168.0.120>
Message-ID: <b2c8166871eda0ad5f8ed97cb6f69911@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.10
X-Spamd-Bar: /
X-Rspamd-Server: web
X-Rspamd-Queue-Id: F005F23D18
X-Spamd-Result: default: False [-0.10 / 15.00]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; TO_DN_NONE(0.00)[];
 DKIM_SIGNED(0.00)[]; NEURAL_HAM(-0.00)[-0.772];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_125445_752392_29789ED4 
X-CRM114-Status: GOOD (  21.29  )
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

Am 2020-03-23 20:20, schrieb Tudor.Ambarus@microchip.com:
> On Monday, March 23, 2020 8:27:13 PM EET Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the
>> content is safe
>> 
>> Hi,
>> 
>> Am 2020-03-23 10:24, schrieb Tudor.Ambarus@microchip.com:
>> > From: Tudor Ambarus <tudor.ambarus@microchip.com>
>> >
>> > Fix the gap for the SR block protection, the BP bits were set with
>> > a +1 value than actually needed. This patch does not change the
>> > behavior of the locking operations, just fixes the protected areas.
>> 
>> So instead of rounding up, it does round down now?
> 
> No. Why do you say that it rounds up? The behavior is not changed, the 
> patch
> merely fix the protected area, which was wrong before. The round down 
> is
> present before this patch.

TBH I don't understand what this patch should do. Could you give an 
example?

>> 
>> > On a 16Mbit flash with 64KByte erase sector, the following changed
>> > for the lock operation:

16MBit is a bad example, because it is broken anyway, isn't it? We use a
32Mbit flash where 2MB are locked and the second 2MB are unlocked. Eg. a
50/50 split. I haven't seen any issued. Shouldn't it be then completely
locked according this the following example?

>> >
>> > Number of blocks | BP2:0 before | BP2:0 now |
>> >
>> >                1 | 010b         | 001b      |
>> >                2 | 110b         | 010b      |
>> >                3 | 110b         | 010b      |
>> >                4 | 100b         | 011b      |
>> >                5 | 100b         | 011b      |
>> >                6 | 100b         | 011b      |
>> >                7 | 100b         | 011b      |
>> >                8 | 101b         | 100b      |
>> >                9 | 101b         | 100b      |
>> >
>> >              ... | ...          | ...       |
>> >
>> > For the lock operation, if one requests to lock an area that is not
>> > matching the upper boundary of a BP protected area, we round down
>> > the total length and lock less than the user requested, in order to
>> > not lock more than the user actually requested.
>> 
>> I don't know if that is really what a user really want. Because you'd
>> end up with regions which the user believes are locked but are not.
> 
> True. I'm thinking of how we can improve this, but it's not in the 
> scope of
> this patch set, because the behavior is not changed.

ok, agreed,

> 
>> IMHO if you'd have to make a choice I'd prefer to have the remainder
>> locked. Not the other way around. Esp. since the user explicitly
>> express to have a region locked.
>> 
> 
> We can still talk about this. Please notice that the formula that we 
> want to
> introduce does the same thing as described in this commit message: for
> unaligned locks, it round down the length, and for unaligned unlocks it 
> rounds
> up the length.

ok

-michael

> 
> I'm waiting for a reply.
> ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
