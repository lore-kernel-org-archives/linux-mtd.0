Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A64C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Feb 2022 08:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+oQXojAc/iYUikcAMeXMsJbwk9XsSs/MGx+JXok1ypo=; b=gEy53SLjsuY4f4WuZneukLNef3
	AIaT1YczQdnrD84F49k2wsehhHJFYPyI85xhTpuVSRKSlh7VRBC5m7WDP/Y5kzg68RbQlfkJM8Mbj
	UAkDARBCR+nGyuSaB+5S/idjB06HqwYs9ZWXb9H6FJeQg/GaDrN3XNRwUQN6EvHswEHT1oYTjKGtZ
	bMR32C8Wm2ajL6boxOn+JKIcMk+/73JO2as0HxCxyX4TVfytWEjtwPv45CoQHKyveh5HrvECFLb/O
	jDtjVUhfGzv68UHi3MP62kMJP0gONljkkchmucSXeaapWxoqlQaRlDAZTf9keM7IVSiSV4BUPbvya
	/VSJuT0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI4dJ-0032e2-Ky; Thu, 10 Feb 2022 08:16:53 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI4dG-0032dM-VI
 for linux-mtd@lists.infradead.org; Thu, 10 Feb 2022 08:16:52 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id D700C2223A;
 Thu, 10 Feb 2022 09:16:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1644481009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7m8O9Deg7PEc5nH7BFt1L+WAoZvzxBi1x9zZ6x9/wyw=;
 b=HhmM1Milpq1OFgxp15YjBaVOuBV6HH1Htrgqa/j3DjI3kC3lNqp1rOBMy9yyj+z+CqxGXx
 PLGNgW3bUBicVoIyB5s5J/lRG0qR5G+D+KZnmfSk+beDBOIjtGUPW8cjjotR9prYvDQryw
 9x+ngHfiDFlkA2WYq8EcbyZ+XszdWLM=
MIME-Version: 1.0
Date: Thu, 10 Feb 2022 09:16:48 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH v1 11/14] mtd: spi-nor: spansion: slightly rework control
 flow in late_init()
In-Reply-To: <f004399f-36b0-2099-b2a0-8ab0ecd114b7@microchip.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-12-michael@walle.cc>
 <f004399f-36b0-2099-b2a0-8ab0ecd114b7@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <ced74caa2ad507615b9cf1645d10fa87@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_001651_209409_9AF21B51 
X-CRM114-Status: GOOD (  13.76  )
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

Am 2022-02-10 04:26, schrieb Tudor.Ambarus@microchip.com:
> On 2/2/22 16:58, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> Increase readability of the code. Instead of returning early if the
>> flash size is smaller or equal than 16MiB and then do the fixups for
>> larger flashes, do it within the condition.
>> 
> 
> mm, no, I'm not sure this improves readability, I see the two 
> equivalent.
> The original version has the benefit of no indentation. Pratyush?

This is a preparation patch for 12/14, where the current version isn't
working anyway. If that is not enough reason why this is bad IMHO, I'll
give you two more.

I'd agree with you if that function was called
spansion_late_init_smaller_flashes() or something like that. But it is
a generic function valid for all flashes. And if you read it you might
get the impression there are only flashes smaller or equal than 16MiB.
You have to look twice to notice it was the intention that the
assignment afterwards are just for the smaller flashes (and you will
need to notice that there aren't any assignments for all spansion
flashes). There is no direct connection between the assignment and
the condition. Whereas with
   if (condition) {
     some_action();
   }
It is clear that some_action() was intended to only execute if
condition is true.

Also - and that is worse IMHO - it might easily be missed as someone
just add stuff to the end of the function which might goes unnoticed
but it won't work for flashes >16MiB.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
