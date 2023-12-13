Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0765C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Dec 2023 09:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHU83b1Ox4gMLJt6NYKuySRHLERk3+GGmChEci3Vn2A=; b=cXpJmKNCoP17feLybDKUq82nQs
	CWBH5Eg1xP4iIo4mub8jsI7ep2va+I4r/43kb/gzC488/gR1sXs4Yc6NdXE8mlTwkDz3myMy8qNLO
	Vbnk/uQPgCMJtymuO0VRJ4kgflML+wF3oCVSeTBY3i7l5a2ADxS1iboS/Kr3YfXHmzSoJKYJdt1ab
	diBGdd2jtLn4RyKxmSug+azQMCYkoodRCSYW2EjOfCymsv1J7Iy7AE/qyrd59/Y8kLm4YY60jzGwr
	arqpZqZMJwlH0FohqrH/ruUiIudHFe3GVIWFSB7cBzMId318eSws+vuaAX79AiEIxNWLb5UIp4nZH
	dMLyew/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDLGU-00E75D-2Q;
	Wed, 13 Dec 2023 09:10:50 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDLGR-00E74R-0L
	for linux-mtd@lists.infradead.org;
	Wed, 13 Dec 2023 09:10:48 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 286D43B9;
	Wed, 13 Dec 2023 10:10:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1702458645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kFekLYtexoEqV+4+bzjci/Wxy1Ii4yF28oA3pLPNoVY=;
	b=mfoa60eZPGEF8ldNEZ/OXFhH12wqAKc0H49ncaYfKQ2jclzttOfvB+NrqKBLQeVgCEkzfy
	WqylmVtoGlHpydY0+cmBU0Qku088aEguD8kkejwo+HQREPbQMe6VUbvKfXNRFq8ULIgGiB
	746KnhGuNNmLD1/9bIszOXDCwem68tDCxnNwaCAzUHikHAcj+OIEdiSiga8VJIughijFYl
	Y1/9RBw1gnfuBqenRvs6HSKQdQ7MO5qPt/9RswA7Ueh7eWLQQ4YHTjVvsMFcP0dksKyQKM
	Jb0PrzZvvdZSl1o45emFXv+MnCfD7gfGlzFO6IMNxfrVfDXOgj4lqsPFpGWydQ==
MIME-Version: 1.0
Date: Wed, 13 Dec 2023 10:10:45 +0100
From: Michael Walle <michael@walle.cc>
To: liao jaime <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH] mtd: spi-nor: core: Introduce spi_nor_abort_octal_dtr()
In-Reply-To: <CAAQoYRkR0Jgr96n0-h9_6HTjmSPBq-YKskFN5+e-m6HBSbCocQ@mail.gmail.com>
References: <20231207075147.21851-1-jaimeliao.tw@gmail.com>
 <f015ef75d6bb0a9f8edba37b40affb60@walle.cc>
 <CAAQoYR=8b7NR8h0SHz=bp9=XHzZebDQhPUOc20b0eAF6Vd1kAw@mail.gmail.com>
 <e08b45ea59a0ba96de99a42ddf7b6769@walle.cc>
 <CAAQoYRmYxmD8v20_Q=YShj_xv1vsV7fXnAGPYPBSP=XJmoG2-Q@mail.gmail.com>
 <eb0667ee62c304b041f7861788ca0c7d@walle.cc>
 <CAAQoYRkR0Jgr96n0-h9_6HTjmSPBq-YKskFN5+e-m6HBSbCocQ@mail.gmail.com>
Message-ID: <b3ce3771a751d85a76225d53cc565b70@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_011047_318028_CA3AC1B7 
X-CRM114-Status: GOOD (  17.71  )
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

>> >> To me it seems, that spi_nor_select_{read,pp,erase}() will select
>> >> the wrong commands/proto. So it should be fixed there. Probably
>> >> shared_mask is wrong.
>> > Features in shared_mask have include 2 parts as below.
>> > 1. Flash support the feature (by parse SFDP or ID table flags)
>> > 2. spi host controller support the feature (In
>> > spi_nor_spimem_adjust_hwcaps)
>> >
>> > But I think Octal DTR is a special case because, in addition to the 2
>> > points
>> > mentioned above, there are also other conditions that need to be met.
>> 
>> Correct. And btw we would have the same problem for quad_enable if we
>> wouldn't
>> have a default.
>> 
>> So in spi_nor_default_setup() I'd suggest to add something along
>> 
>> if (!nor->quad_enable)
>>    shared_mask &= ~SNOR_HWCAPS_4_4_4;
> I think this check is unnecessary for quad_enable.
> Because of "spi_nor_sr2_bit1_quad_enable" would be a default
> method for enabling quad mode in spi_nor_init_default_params().

Yes it is at the moment. But if a flash happen to have no
quad_enable we'll have a problem for whatever reason. so for the
sake of completeness we should mask that bit.

>> /* skip octal command mode if we don't have a .octal_enable callback 
>> */
>> if (!nor->octal_enable)
>>    shared_mask &= ~SNOR_HWCAPS_8_8_8;
> Sound great.
> 
> Could I follow the suggestion for preparing v2 patch?

sure.

> BTW, I think discard is better than abort.
> What do you think?

Where do you need that word? You shouln'd need any more
than the code above.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
