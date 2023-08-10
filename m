Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C8BC001DB
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Aug 2023 07:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NcxA3QBoHpsCicheavm5RafvGSOIAUtvi6Lr/Uy7h+s=; b=v7gH/cuZB8VoZqQlkIAlsDcEO+
	ib6sxtE3lllQSbbw3AVfAptgVNyNL+6/6v166lgbFGyfQ5bFUIaL9xqWGDzLI52MKK9dToRztwu6z
	1pE4FwCibQIxXFCL/mlM8wXQqMBNZlJiZXBxVKdKiItTIaeX9fgZddlZV4snndVzJWipRkT9xaClA
	GEeCHBbPJeF5M7GuVGPAy13kchoz0DX4liqdQF2JCB6juTfEyIWvxgzNfGoDpSdQmLx1fCYxAZd8w
	iu3zVFjcv9koWwP5kCACmm6qHa1ViUVl/HBgrci2Xys0N5YFMrzcpQ9U4kk6Ntzg+xbdth1EzxdJb
	mJqsq9dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU05D-006kc5-0G;
	Thu, 10 Aug 2023 07:27:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU05A-006kbL-31
	for linux-mtd@lists.infradead.org;
	Thu, 10 Aug 2023 07:27:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E7D476514D;
	Thu, 10 Aug 2023 07:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82BDC433C7;
	Thu, 10 Aug 2023 07:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691652463;
	bh=nOa3HgEefuDFhQEt7dD9tMAOntTNRM1PVAbRUt6sTUM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AtFBp86q5ZSMIknjxo3WpL4kCiIkdxozbU9C7M1P6IUsrCTixIUdZSKWMs2wTyqMS
	 iyPUGkCB0xnEEfdHir6mriUCjqLfLJ6xSPYRRNJJIXKe5htUDpCXUHjlaCuqCengKn
	 dp8hQnIsjkstpc6ZlDhkMJy9ZSJa7MpR7ZjRazU2qeIhRW5OVKobiQh1vEPoz3kQ2/
	 qesy2nmliA1nWZermrC/+eLcdu8BhFnPupeA2tzvLrOL8ktuGtu6uGqCDx8ZGmjQVd
	 pPyev6bK3uImGZrG1wHR6CLcMusB/90ypyeFKrJgKLJZi6TvgXn4EPhrmgu55NxTUn
	 0IfExfbJLzVJw==
MIME-Version: 1.0
Date: Thu, 10 Aug 2023 09:27:39 +0200
From: Michael Walle <mwalle@kernel.org>
To: liao jaime <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, JaimeLiao
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v3 2/5] mtd: spi-nor: core: Hook manufacture by checking
 first byte ID
In-Reply-To: <CAAQoYR=JQVd3iqfCYKjvkbFSGVWJRX1xFni6CsNht9prhuQ1EA@mail.gmail.com>
References: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
 <20230804095409.278419-3-jaimeliao.tw@gmail.com>
 <70e42ee5e4c5aba05ac896cb94956f25@kernel.org>
 <CAAQoYR=JQVd3iqfCYKjvkbFSGVWJRX1xFni6CsNht9prhuQ1EA@mail.gmail.com>
Message-ID: <92234e4c5aca657a966d7c4d9d5f219a@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_002745_034074_A5696D32 
X-CRM114-Status: GOOD (  15.51  )
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

>> This won't work beacuse the manufacturer id is not always
>> one byte long, think of continuation codes. In fact, as the
>> flash_info table is of now, we cannot even rely on the
>> continuation codes, but we have to always check for the
>> complete id_len, i.e. there is at least one hack where
>> the id is reversed and the manufacturer is the last byte,
>> iirc. some oddball cypress mram chip.
> According JEDEC standard, 1st byte is manufacture ID.
> I check id table, "cy15x104q" with multi manufacture ID in
> later bytes by RDID command(9F).

Yes the currently supported cy15x104q is broken.. but nevertheless
it's there. Also some spansion flashes uses winbond manufacturer
ids.

> Maybe some old flash didn't follow this but I think it isn't
> a high percentage.
> Most of all and new product are follow JEDEC.

Have a look at JEP106 (mine is JEP106BC) and you'll see all the
manufacturer IDs defined by JEDEC and you'll see that except
for the first 127, all others are multibyte vendor IDs starting
with continuation codes.

And it seems that the command RDID 9F is not covered in any
JEDEC standard. At least I haven't found anything. If you know
where that command is defined, please let me know.

>> If you want to get the correct manufacturer for spi-nor-generic,
>> you should extract it from the SFDP tables. It seems that the
>> BFPT don't include a manufacturer id, but if there are proprietary
>> tables, you *might* use that id. I say might, because it only works
>> with one byte manufacturer ids, no continuation codes... *sigh*
> 
> Unfortunately, Macronix didn't include proprietary tables in SFDP for
> octal flashes and as I understanding proprietary table is not a 
> stardard.
> So that content and address are not identical each vendor, it will need
> a manufacturer fixups for reading.

Yes thats by definition not a standard, *but* the header with the
manufacturer id *is* standard.

So better include some proprietary tables in your next NOR flashes ;)

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
