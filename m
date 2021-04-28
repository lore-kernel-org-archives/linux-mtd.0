Return-Path: <SRS0=MQGH=JZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04FE9C433ED
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Apr 2021 15:52:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9300461222
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Apr 2021 15:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9300461222
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N9h4w8cO+AqE32XQ1iPj7GIVgz7oHoTss2on9yY/FpE=; b=FDcWlEdHw/hyeOPeY65EYW1+K
	Z7xhfGpbHQKhPZHtJRL+56muRg2mh1EkfCd0W2Fg05wsDlnlW7YhDBWhMm8+QaVntXZxhsOqL9od2
	N0QjmaxRdTWdyVXVGkRWFH7B1EhPre20PSTzuP8Jt60RyqqB0ZVrI2sJnQbA++/0q9OYh5yXsHrn0
	sUO+5v8J+njGoI8UK2JqLPyje/42i1qFDKAiW21cBhs/UA0h2E0Ys/OIKuYlDYM2oWjP/PxE18KXx
	a+Es97SOmfilAVxiBQkx0S16yrEcnuLyQC+ZXZpaGT2NwxUJpwYHT0LVU6wi2SmzHC1EMHUMtcYaM
	tq7PZxvOQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbmT3-003mmN-Gh; Wed, 28 Apr 2021 15:51:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbmT1-003mlq-Jw
 for linux-mtd@desiato.infradead.org; Wed, 28 Apr 2021 15:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=qFht+zx1PoLsNlmKgN724WfPJPYd2yT3Zx3URd+ONYM=; b=m9/cpNnePOX61R3caUYizzYJ05
 K3rhJfWn/BGpOwkcuk6xOoyn0lFNg+bFXv0MVGuih2jT6CckFGLtTLukJhC+DimTItrKfHSoTYX5M
 agVEv8cNoC1AGWMv1tMTCTeiw33HShVe+P3lEHkvpie+niNf3yRJRgWuhAxHgHPHUCzKXOrIj6ibp
 yjBVRbUUPslIhZH6wzn2GUA/RThfYU8VUOfuBbnahEfQ80lbLP1u7MqpiZj2bX1Uz83wjm9IYC8+R
 HMOT4G2ue3ZFF3DFAarbodGKH0sOqsLM9HyNMaQQJv1Ue7GTejvYIxssR7GNybiAPJ7tMyCH4vfOV
 hiWKoW0g==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbmSy-00Hacc-FH
 for linux-mtd@lists.infradead.org; Wed, 28 Apr 2021 15:51:10 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 4E49D22264;
 Wed, 28 Apr 2021 17:51:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1619625061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qFht+zx1PoLsNlmKgN724WfPJPYd2yT3Zx3URd+ONYM=;
 b=SeUi5wsG92TXP2NouVl0Atl7uAMfUU+gj2VUnkxbF/WQcSHJQBZ228wjWK6NZtZA7BY18h
 jRmv6NE3buEKWBUfp4Sm288Vy4EPWvUMz1dTR604TkUzj/uIincAggnbiwSsPrydwNY76B
 gMA+3+4snX2+jHMIqv2GyDVIfAyoErA=
MIME-Version: 1.0
Date: Wed, 28 Apr 2021 17:51:01 +0200
From: Michael Walle <michael@walle.cc>
To: Alexander Williams <awill@google.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mtd: spi-nor: Export SFDP access to sysfs
In-Reply-To: <CACqsJN-Vernbp5kJc+qZ6nUW50xPWz_9DznLDjtTu=btSra09Q@mail.gmail.com>
References: <20210428052725.530939-1-awill@google.com>
 <dd33cf8d3a78d60eebbb6f1be90cb7d3@walle.cc>
 <CACqsJN-Vernbp5kJc+qZ6nUW50xPWz_9DznLDjtTu=btSra09Q@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <5e23722b1c7d6716c404667a3c5bfbff@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_085108_691788_6A17CFE6 
X-CRM114-Status: GOOD (  17.09  )
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

Am 2021-04-28 17:37, schrieb Alexander Williams:
> On Wed, Apr 28, 2021 at 12:58 AM Michael Walle <michael@walle.cc> 
> wrote:
>> 
>> Hi Alexander,
>> 
>> Am 2021-04-28 07:27, schrieb Alexander Williams:
>> > Add the ability to specify a technology-specific attribute_group, and
>> > expose the SFDP through spi-nor's private group. This enables user
>> > space
>> > to have full access to the contents of the SFDP, so all information is
>> > available without regard for whether the kernel supports parsing it.
>> 
>> Please see:
>> https://lore.kernel.org/linux-mtd/20210318092406.5340-1-michael@walle.cc/
> 
> Thanks for the pointer! Sorry I didn't see that patch series already: 
> My search
> skills need some work... In any case, there's no good reason for me to 
> duplicate
> work.
> 
> I should probably comment on that series directly, but I'll note that 
> one thing
> I tried to do with the sysfs attributes here was avoid racing with user 
> space.
> The uevent is suppressed until all the related files are created in 
> sysfs. See
> http://kroah.com/log/blog/2013/06/26/how-to-create-a-sysfs-file-correctly/ 
> for
> Greg's explanation of a scenario.

Sure, reviews and remarks are always welcome. Btw. what is patch 2/3 and 
3/3?
I couldn't find it on the LKML.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
