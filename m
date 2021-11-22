Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1F6C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNA6DVoAvN7pHIqWVuDVeHsMns3fXEb4id4JCErjdGE=; b=QWZ4QujBP+73nBRjZjC/D8btYZ
	0Yc+DM/3sLmSyu8lOfJHwoOW0jfclKZO5TLSWPOCjAnvFJyVhXpgEvHTpGfJN4ENMy9E/4Vi/WGSN
	uhB+f3Rx8OeAJEbuG+MLTqDQOOnSj7pIdVbVmruO8ToVJctncT8L9L/EdUa9l3Z8SAKCxFLdpuZbH
	5YgLmLAxUmip2tv2F4GNTI42GviEmAsOVDYLrNGcG3vyXz483l0k+X0A7sJ41eKmmtBZQp7uuFvOz
	xzXngk/X3H0d4ljqtLPkNn2ZFBDhLFnqs+BSy/KmLF+G2agFCtH+tAXA9ldlHjMCaNZmVb4j9alw4
	D/CgkWmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpAtT-00GySc-9S; Mon, 22 Nov 2021 15:06:07 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpAtO-00GyOe-8d
 for linux-mtd@lists.infradead.org; Mon, 22 Nov 2021 15:06:05 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6704022246;
 Mon, 22 Nov 2021 16:05:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1637593556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cHiQOXU/aaxS9krTCFcOchW4k+7sx4xple/mjsKPuG4=;
 b=cDZlkdYECjc/jCUTBbKKXzC0njWN/2G/jPn/3QA1OojmKEuLqVJPW5hxNgSWzdF5YhE6FD
 CbxW4r9VnAmdVs384m6ys3e0h8HAEUJs9Arbt+cmTIVBLPDw2fWvfaPyggdPeDjevMHdZk
 ITgemGzAjLMGEG1CuhswHtrR4h+hbTU=
MIME-Version: 1.0
Date: Mon, 22 Nov 2021 16:05:56 +0100
From: Michael Walle <michael@walle.cc>
To: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: mt25qu: Ignore 6th ID byte
In-Reply-To: <1e133bc6-5edb-c4ce-ad44-3de77048acf2@nokia.com>
References: <20211119080402.20262-1-alexander.sverdlin@nokia.com>
 <9a158e2ef6635212c1e353590e3b773b@walle.cc>
 <1e133bc6-5edb-c4ce-ad44-3de77048acf2@nokia.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <e9589af968d7b9dafbce17325dbf8472@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_070602_520196_EF3303DF 
X-CRM114-Status: GOOD (  19.33  )
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

Hi,

Am 2021-11-22 08:06, schrieb Alexander Sverdlin:
> On 19/11/2021 22:19, Michael Walle wrote:
>>> Ignore 6th ID byte, secure version of mt25qu256a has 0x73 as 6th 
>>> byte.
>> 
>> What is the secure version? What is the difference? Do you have some
>> links to datasheets for both?
> 
> For instance:
> https://www.micron.com/products/nor-flash/serial-nor-flash/part-catalog/mt25qu256aba1ew7-0sit
> https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-a/mt25q_qljs_u_256_aba_0.pdf?rev=594079234c1b496496b062c21ce162d6
> 
> https://www.micron.com/products/nor-flash/serial-nor-flash/part-catalog/mt25qu256aba8e12-1sit
> https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-a/mt25q_qljs_u_256_aba_0.pdf?rev=594079234c1b496496b062c21ce162d6
> 
> But the differences are in "MT25Q Security Addendum":
> "The additional protection features available on the secure MT25Q
> device include a
> lock status register bit, top/bottom block address protection lock, 
> volatile
> configuration lock register at power up, protection management register 
> lock,
> and a nonvolatile configuration lock register."
> This is only available under NDA from Micron.

So I take a wild guess here. There are lock bits (either in OTP or
maybe until the next power cycle), to lock the corresponding
top/bottom, block protection bits, right?

> However as long as one doesn't use these security features, it appears
> compatible with
> non-secure version. That's why just ignoring the non-standard
> configuration allows
> to support it.

But if we ever support it, then we have to distiguish them. Thus,
I was asking.

>> Also please provide the SFDP data for this flash, see [1].
> 
> sfdp:
> 53464450060101ff00060110300000ff84000102800000ffffffffffffff
> ffffffffffffffffffffffffffffffffffffe520fbffffffff0f29eb276b
> 273b27bbffffffffffff27bbffff29eb0c2010d80f520000244a99008b8e
> 03d4ac0127387a757a75fbbdd55c4a0f82ff81bd3d36ffffffffffffffff
> ffffffffffffffffffe7ffff21dcffff
> 
> md5sum:
> 5ea738216f68c9f98987bb3725699a32
> 
> jedec_id:
> 20bb191044
> 
> partname:
> mt25qu256a
> 
> manufacturer:
> st
> 
> (But last 3 do not make sense to me, as they come from the table I 
> modify,
> not from the chip itself). Further, I don't have 512Mbit chip to 
> provide
> SFDP for it.

Thanks, so that's the SFDP data for the mt25qu256aba8e12-1sit part. and 
the
jedec id is 20bb19104473, correct?

You don't have the non-security part by chance?

Mh, I'm undecided whether we should just duplicate the entry or if we
should ignore the last byte ("Device configuration information", where 
00h
is standard). The commit which introduced the flash was 7f412111e276b.
Vingesh?

Can you elaborate on the 0x73? Is that a bitmask? If it was an 
enumeration,
I'd assumed it would be 01h (or some smaller value).

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
