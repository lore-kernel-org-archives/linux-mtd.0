Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B6FC282C0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 09:07:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E772E21019
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 09:07:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HHe8JwHX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E772E21019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ksoAwD9OEjpCYOZofw5m1NR78VUfRMukkg9R6voS1PE=; b=HHe8JwHXUYyhy2Ys/HSC19Isl
	Z2H6dqeilCCF3ogvi4cnm2H1g9LNhWz8EXH3WAEadUJB3WPMDWROrIQfnvQvLP1sgDJMsb8GZsITp
	dkdPP6+c7mQKOlK5kOMV9QOyxrlXb/R7w1CX8WbTvWRNFut6W1PIOvKGqC7AqF0eft6f5KLsLE3Cd
	1XzXNfVUJtAF+/zRvxGAZeQlD4jvIhcN9UM0mH5HBuqbDPR3jqgNadTKHMHJn4p/PYUBPGvhIb1Gi
	1W8PujgUNKentN7ULvC+jiU4NURzeTaF9aNwcmIg/gkzqlGTPVWMJLI/yL8iqP6ovqvaHEQMfDdXz
	nnHvZcztA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmEV2-0008QG-4O; Wed, 23 Jan 2019 09:07:08 +0000
Received: from mx2.mailbox.org ([80.241.60.215])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmEUy-0008Pg-I4
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 09:07:06 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id E2BABA13F0;
 Wed, 23 Jan 2019 10:07:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
 [80.241.56.123]) (amavisd-new, port 10030)
 with ESMTP id IHcV9qMQ3UAs; Wed, 23 Jan 2019 10:07:00 +0100 (CET)
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UC
To: Boris Brezillon <bbrezillon@kernel.org>
References: <20190122145632.17547-1-sr@denx.de>
 <20190122175346.602894e4@bbrezillon>
 <263cbd32-b7d4-e440-c92d-4f24f5af27a0@denx.de>
 <20190123085202.0db528ac@bbrezillon>
 <870af691-e8d3-cd91-5a55-6478ef885446@denx.de>
 <20190123095504.7857ca34@bbrezillon>
From: Stefan Roese <sr@denx.de>
Message-ID: <a350a884-f531-353d-31bc-d51be8f6eb83@denx.de>
Date: Wed, 23 Jan 2019 10:06:59 +0100
MIME-Version: 1.0
In-Reply-To: <20190123095504.7857ca34@bbrezillon>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_010704_749024_9FD4232C 
X-CRM114-Status: GOOD (  12.07  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 23.01.19 09:55, Boris Brezillon wrote:
> On Wed, 23 Jan 2019 09:23:47 +0100
> Stefan Roese <sr@denx.de> wrote:
> 
>>> This one doesn't, incremental mode (-i) should.
>>
>> Here you go:
>>
>> # ./nandbiterrs /dev/mtd5 -k -i
>> incremental biterrors test
>> Failed to recover 1 bitflips
>> Read error after 0 bit errors per page
>>
>> I'm still unsure how this helps here.
> 
> It helps, it tells us the ECC doesn't work properly (fails to recover
> one bitflip), or maybe it's the raw accessors that don't don't work.
> 
>> Is there anything else I should test?
> 
> Add traces to the get_ecc_status() func and print the status value.

# ./nandbiterrs /dev/mtd5 -k -i
[   22.098436] gd5f1gq4u_ecc_get_status (124): status=0x00 status2=0x00
[   22.117184] gd5f1gq4u_ecc_get_status (124): status=0x00 status2=0x00

<snip many identical lines>

[   23.085412] gd5f1gq4u_ecc_get_status (124): status=0x00 status2=0x00
incremental biterrors test
[   23.102973] gd5f1gq4u_ecc_get_status (124): status=0x20 status2=0x00
Failed to recover 1 bitflips
Read error after 0 bit errors per page

Strange, this does not seem to match what the datasheet tells us. Any
further ideas what I should test?

Thanks,
Stefan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
