Return-Path: <SRS0=VKOh=IP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B885EC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Mar 2021 17:52:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BC4464F07
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Mar 2021 17:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BC4464F07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oI3CVeNzGjLaBw7q/16dwRauQfDiyVP4lac3cPdlC1w=; b=FAJcuvclP2DVKdPNyug+ghWbS
	SlA+PQg3x/tnY804FKdwBehw0mBQngedKM+XGfX459u5/3dJvY4vwnTZGAxJhylT0dD2fN+v/o0Zy
	gyI0oDNawjTNzyZoZIHA2Cu2JJy0vV92fJCboaz8Uktl8UGZi8v/7hddzQzzlXMuOMUO/wAtJoBle
	0o8IXyW6KZ8jDCT/xtiyayRHeSK6JWgI0Pv+z3CGh/sjx3h4tMUvSWln5BxjsHeZ3aZTv43iWKXpy
	rzfFF3Q8NH3vcCmHkRGD3KLFpfRY9cQjWdNajVQOkKVQSYDZMOVN3+i0D/+Wg1qYQYIabzF7HPB2c
	yrjwbkHzA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMaJu-003h9s-Tf; Wed, 17 Mar 2021 17:50:58 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMaJo-003h9L-Sk
 for linux-mtd@lists.infradead.org; Wed, 17 Mar 2021 17:50:56 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id AB4A522238;
 Wed, 17 Mar 2021 18:50:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1616003449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0uX4a5pODJdDNUMqLG8CU+20HuPGvlsPYfESg66SL6o=;
 b=boqbQMVM7v9iaMAXLSnDxGpy19fhxBAn5JkBmLbxXeoSZY6iNJWg3Sc55OzTlyRlw09QeO
 kU2JSOGCzR+4+Qzxt3GKg2mcZmlm/IWWCsbnkjjkJ7qfWotAWK3EwhZ6uSn+v4kaGmMS6j
 y7tzS+epo3eZW0qFmPqJkRPxn1DgMIg=
MIME-Version: 1.0
Date: Wed, 17 Mar 2021 18:50:48 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: vigneshr@ti.com, p.yadav@ti.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, richard@nod.at, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] mtd: spi-nor: Move Software Write Protection logic
 out of the core
In-Reply-To: <fe28e8f9-a3a5-b445-e7fc-01c8743bacbe@microchip.com>
References: <20210306095002.22983-1-tudor.ambarus@microchip.com>
 <20210306095002.22983-5-tudor.ambarus@microchip.com>
 <963232a4-9100-ebca-927c-7f5a1e947fbe@ti.com>
 <9889bae0-8eba-7cbc-d9bb-04e038bd28c8@microchip.com>
 <6016b725-a779-1d2c-9884-099c58f53557@ti.com>
 <45d00a12-cb79-774e-f8e8-d65602629a90@microchip.com>
 <a9e1e18c034dfa185eeb5492acf2dff7@walle.cc>
 <fe28e8f9-a3a5-b445-e7fc-01c8743bacbe@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <c02857fe33611ba5794f233ef117c687@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_175053_022563_0E6E527F 
X-CRM114-Status: GOOD (  13.43  )
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

Am 2021-03-17 10:30, schrieb Tudor.Ambarus@microchip.com:
>>>>>> soft-wr-protect.c or software-write-protect.c ?
>>> 
>>> Having in mind that we have the SWP configs, I think I prefer swp.c.
>>> But let's see what majority thinks, we'll do as majority prefers.
>>> Michael, Pratyush?
>> 
>> It's just an internal name, thus as long as it remotely makes sense,
>> I'm fine. It's just a matter of taste, isn't it?
> 
> Sure, it's a matter of preference. What's yours?

if i have to choose, swp.c

>> But here's one technical reason that would bother me more: name
>> clashes between the core modules: core, sfdp, otp, swp and the
>> vendor names. It is very unlikely, but there is a non-zero chance ;)
>> 
> 
> We can move all manufacturers to a manufacturers/ folder. Each 
> manufacturer
> driver will have to #include "../core.h", about what I have some mixed
> feelings.

I don't think it makes sense as long as there is no clash; or until 
there
are many more core modules, so you can't keep them apart anymore.
It will just make it harder to follow the git history.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
