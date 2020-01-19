Return-Path: <SRS0=Efe6=3I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5117BC33CAF
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Jan 2020 22:24:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2417E206D7
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Jan 2020 22:24:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P6DRebCD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="g9+ksF0A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2417E206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0dh4EJH1brBrteAo4c5xthTlxhIQ+HmgbARPl22jJys=; b=P6DRebCDSi5IjXeRGgrO2mtPw
	8tkgSDs74+8ThYFH/iF4FRDoG6wraRKvExLVbQ/XQ/mBmmSebSZjldI3uT6VYU61d4gS3WR56mh+A
	Z+lT3hbdm8LysLrRC9kdzmazISVpF1xlI4UYpxCWZqRVfpW84hBFXP4P2UPgNfzR1UvkwLDYU0/dO
	WjYvBsvCQOV7bK1IoVCjaC1MdyV0PQqPahBst+K55PNGL0cn8vN8Xovu5/48yHFJR6RhgOsidbwGn
	zs+uYuahV34a7c3/TGoFXtxgVH13NfQ4oRmraf97/PaAc70Gt3IaMO4LjcFiSVBVQ4avUjDnaAWvh
	CVJ3BptZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itIzo-0000go-RS; Sun, 19 Jan 2020 22:24:40 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itIzl-0000fA-Q5
 for linux-mtd@lists.infradead.org; Sun, 19 Jan 2020 22:24:39 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id F06CD22FB3;
 Sun, 19 Jan 2020 23:24:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1579472668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SZYItGOiBU5eiIIozCyMNJmuK4OQSk0zR+3B7khf2K4=;
 b=g9+ksF0Ae3GDSzoAxmLuiVvJAe5Iw2epbLMc9Lx1xSPEc7sOzFhDNQHR/at2jnVCrl1h6q
 AEt8swBBEZ/lrKdSWaAeFH3Prxpp3YWkv3etkwW2ZFOKNj1Z8ERdIw6/TBVo2v6WZbcLY6
 9aOjZJefd6rYy8lRgpKqo7JKLR8a+NU=
MIME-Version: 1.0
Date: Sun, 19 Jan 2020 23:24:25 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH] mtd: spi-nor: Add support for w25qNNjwim
In-Reply-To: <8021667.67K7kvUAe6@192.168.0.113>
References: <20200103223423.14025-1-michael@walle.cc>
 <2dffc658f21da502dff8c5721ec1b0a7@walle.cc>
 <8ce5f803c9a59a1ebd55ae287fa2e6a9@walle.cc>
 <8021667.67K7kvUAe6@192.168.0.113>
Message-ID: <66c1ad8e74fb20a061f35f8b23a925ab@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.8
X-Spamd-Bar: /
X-Rspamd-Server: web
X-Rspamd-Queue-Id: F06CD22FB3
X-Spamd-Result: default: False [-0.10 / 15.00]; ARC_NA(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; TO_DN_NONE(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; DKIM_SIGNED(0.00)[];
 NEURAL_HAM(-0.00)[-0.664]; RCVD_COUNT_ZERO(0.00)[0];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200119_142438_004476_C19CAC27 
X-CRM114-Status: GOOD (  24.30  )
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
Cc: richard@nod.at, miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, vigneshr@ti.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

>> Am 2020-01-13 11:07, schrieb Michael Walle:
>> >>> Btw. is renaming the flashes also considered a backwards incomaptible
>> >>> change?
>> >>
>> >> No, we can fix the names.
>> >>
>> >>> And can there be two flashes with the same name? Because IMHO it
>> >>> would
>> >>> be
>> >>
>> >> I would prefer that we don't. Why would you have two different
>> >> jedec-ids with
>> >> the same name?
>> >
>> > Because as pointed out in the Winbond example you cannot distiguish
>> > between
>> > W25Q32DW and W25Q32JWIQ; and in the Macronix example between MX25L8005
>> > and
>> > MX25L8006E. Thus my reasoning was to show only the common part, ie
>> > W25Q32
>> > or MX25L80 which should be the same for this particular ID. Like I
>> > said, I'd
>> > prefer showing an ambiguous name instead of a wrong one. But then you
>> > may
>> > have different IDs with the same ambiguous name.
>> 
>> Another solution would be to have the device tree provide a hint for 
>> the
>> actual flash chip. There would be multiple entries in the spi_nor_ids
>> with the
>> same flash id. By default the first one is used (keeping the current
>> behaviour). If there is for example
>> 
>>    compatible = "jedec,spi-nor", "w25q32jwq";
>> 
>> the flash_info for the w25q32jwq will be chosen.
> 
> This won't work for plug-able flashes. You will influence the name in 
> dt to be
> chosen as w25q32jwq, and if you change w25q32jwq with w25q32dw you will 
> end up
> with a wrong name for w25q32dw, thus the same problem.

No, because then the device tree is wrong and doesn't fit the hardware. 
You'd
have to some instance which could change the device tree node, like the
bootloader or some device tree overlay for plugable flashes. We should 
try to
solve the actual problem at hand first..

It is just not possible to autodetect the SPI flash, just because
the vendors reuse the same IDs for flashes with different features (and 
the
SFDP is likely not enough). Therefore, you need to have a hint in some 
place
to use the flash properly.

> If the flashes are identical but differ just in terms of name, we can 
> rename
> the flash to "w25q32jwq (w25q32dw)". I haven't studied the differences 
> between
> these flashes; if you want to fix them, send a patch and I'll try to 
> help.

It is not only the name, here are two examples which differ in 
functionality:
  (1) mx25l8005 doesn't support dual/quad mode. mx25l8006e supports 
dual/quad
      mode
  (2) mx25u3235f doesn't support TB bit, mx25u3232e has a TB bit.

well.. to repeat myself, the mx25l25635_post_bfpt_fixups is a third 
example.

-michael

> 
> Cheers,
> ta
> 
>> 
>> I know this will conflict with the new rule that there should only be
>> 
>>    compatible = "jedec,spi-nor";
>> 
>> without the actual flash chip. But it seems that it is not always
>> possible
>> to just use the jedec id to match the correct chip.
>> 
>> Also see for example mx25l25635_post_bfpt_fixups() which tries to 
>> figure
>> out different behaviour by looking at "some" SFDP data. In this case 
>> we
>> might have been lucky, but I fear that this won't work in all cases 
>> and
>> for older flashes it won't work at all.
>> 
>> BTW I do not suggest to add the strings to the the spi_nor_dev_ids[].
>> 
>> I guess that would be a less invasive way to fix different flashes 
>> with
>> same jedec ids.
>> 
>> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
