Return-Path: <SRS0=8K5C=DL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9653EC4363C
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2020 21:13:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFB9D206DD
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2020 21:13:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Moe+QJ4V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFB9D206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=biot.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qtDJcVcORYmALuG3FVqj6iVZYJqomCLn1h3BPpTWGzg=; b=Moe+QJ4VTlRNrHMq6EBqm9hK6
	TLWn39/MgdccOG+hXuS315q12ewAKgWskMoJVK+2UV3EnKcQpcMZIHUECf00y5UBJBdMsIly4j2aw
	g6sBHSkpRzbHE9guv6ghvgraDjc9Tau/3IwM0IUP/ecKj/DikhunWFXfGD3ArX94Z08Yn65VmGek8
	TuLAjmBuj7bDvReR/S9yQnfOUIF7bsIQEmOqQN6BwwHYuWpUFrthYrlQBBgfGR8wOaG2sScnXVIoT
	OImIxMc/ouI7imDenUp/AsnH3IUz2zvEaEgskjqkAx8IuoRf94OHNQ4Jee7Fe6q24RIJ+HYRcUWrA
	cgdW8lSYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPBJ8-0001Ka-0J; Sun, 04 Oct 2020 21:12:38 +0000
Received: from yawp.biot.com ([2a01:4f8:10a:8e::fce2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPBJ5-0001Jb-9N
 for linux-mtd@lists.infradead.org; Sun, 04 Oct 2020 21:12:36 +0000
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
 (envelope-from <bert@biot.com>) id 1kPBJ1-00EA84-Gf
 for linux-mtd@lists.infradead.org; Sun, 04 Oct 2020 23:12:31 +0200
Received: from [2a02:578:460c:1:5de2:b8c9:f460:9716]
 by yawp.biot.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <bert@biot.com>)
 id 1kPBIx-00EA7r-8V; Sun, 04 Oct 2020 23:12:27 +0200
Subject: Re: [PATCH] mtd: spi-nor: Fix 3-or-4 address byte mode logic
To: David Laight <David.Laight@ACULAB.COM>, Pratyush Yadav <p.yadav@ti.com>
References: <20200930235611.6355-1-bert@biot.com>
 <20201001063421.qcjdikj2tje3jn6k@ti.com>
 <801445c9-4f59-5300-3a03-b48a3d631efe@biot.com>
 <1c4ee46115854ce28b17935504f2fc78@AcuMS.aculab.com>
From: Bert Vermeulen <bert@biot.com>
Message-ID: <2c7b03eb-58fa-73af-93d7-669bad2e57ef@biot.com>
Date: Sun, 4 Oct 2020 23:12:26 +0200
MIME-Version: 1.0
In-Reply-To: <1c4ee46115854ce28b17935504f2fc78@AcuMS.aculab.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201004_171235_338705_C413D0A7 
X-CRM114-Status: GOOD (  12.26  )
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
Cc: "vigneshr@ti.com" <vigneshr@ti.com>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/2/20 9:50 AM, David Laight wrote:
> From: Bert Vermeulen
>> The SoCs I'm dealing with have an SPI_ADDR_SEL pin, indicating whether it
>> should be in 3 or 4-byte mode. The vendor's hacked-up U-Boot sets the mode
>> accordingly, as does their BSP. It seems to me like a misfeature, and I want
>> to just ignore it and do reasonable JEDEC things, but I have the problem
>> that the flash chip can be in 4-byte mode by the time it gets to my spi-nor
>> driver.
> 
> If these are the devices I think they are, can't you read the
> non-volatile config word (bit 0) to find out whether the device
> expects a 3 or 4 byte address and how many 'idle' clocks there
> are before the read data?

I'm working with Realtek RTL838x/RTL839x SoCs. Reading it out is a
pretty convoluted procedure involving different I/O registers depending
on the SoC model.


-- 
Bert Vermeulen
bert@biot.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
