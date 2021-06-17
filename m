Return-Path: <SRS0=jwHe=LL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F146DC2B9F4
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 12:00:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DFEB61411
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 12:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DFEB61411
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=reto-schneider.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3EnBrMuk3o4+1tK6RwIdsvFfc9lCDusOyGjw1ZAfjg=; b=gnfdpn2PCinCZ3MUTYUmcV7aY+
	e8rwqOHp9iTpGsnCXODpe/71/aYgFzj+zucWVB5dPnpnDwYseyni4YGGG6cOvRBn0c4fHUUtKgX6d
	L/NLC/sK5HhnQnrIvngrhPcEWgWWsGyvFZtt6rJE8hWacIqaU7Eq6N3tzx+I+ErnU2t7uD5+Gh5mf
	FyMbYT0USLYoCGJ5y0OsXQm4vt/Hmm/c18VeCvdUFCZzvIS9lBmIIOnH6TSiIO+5vxQYPy3+nJW6r
	Yfq9QNpBxK1uEPHD91RsheJs0FFuOt60CqFmLYNCFCIDmOWX9rOrYaHVoOlRE17noZR/Vd313uCpr
	Nv2A/Juw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltqgQ-00ABrs-54; Thu, 17 Jun 2021 11:59:42 +0000
Received: from mxout017.mail.hostpoint.ch ([2a00:d70:0:e::317])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltqgN-00ABpS-C0
 for linux-mtd@lists.infradead.org; Thu, 17 Jun 2021 11:59:41 +0000
Received: from [10.0.2.44] (helo=asmtp014.mail.hostpoint.ch)
 by mxout017.mail.hostpoint.ch with esmtp (Exim 4.94.2 (FreeBSD))
 (envelope-from <code@reto-schneider.ch>)
 id 1ltqg3-000CfJ-TB; Thu, 17 Jun 2021 13:59:19 +0200
Received: from [2a02:168:6182:1:d64b:e086:4fb7:9a87]
 by asmtp014.mail.hostpoint.ch with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2 (FreeBSD)) (envelope-from <code@reto-schneider.ch>)
 id 1ltqg3-0008sS-PS; Thu, 17 Jun 2021 13:59:19 +0200
X-Authenticated-Sender-Id: reto-schneider@reto-schneider.ch
Subject: Re: [PATCH v1] mtd: spi-nor: Add support for XM25QH64C
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, Stefan Roese <sr@denx.de>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
References: <20210613121248.1529292-1-code@reto-schneider.ch>
 <1ba367f93650cb65122acd32fb4a4159@walle.cc>
From: Reto Schneider <code@reto-schneider.ch>
Message-ID: <f022abf3-a6fe-d060-9868-985303c4e8a0@reto-schneider.ch>
Date: Thu, 17 Jun 2021 13:59:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1ba367f93650cb65122acd32fb4a4159@walle.cc>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_045939_474506_FED0F041 
X-CRM114-Status: GOOD (  16.80  )
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

Hi Michael,

Thanks for your feedback.

On 14.06.21 08:56, Michael Walle wrote:
> Could you add that as a "Datasheet:" tag before your Sob tag?

Will do for v2.

>> This chip has been (briefly) tested on the MediaTek MT7688 based GARDENA
>> smart gateway.
> 
> Could you also apply my SFDP patch [1] and send the dump? Unfortunately,
> I can't think of a good way to do that along with the patch and if this
> in some way regarded as copyrighted material. So feel free to send it to
> me privately. I'm starting to build a database.

Will do. If interested, I could also include the predecessor (XM25QH64A).

> NB. XMC ignores the continuation codes and this particular device will
> collide with M25PE64/M45PE64. Although I couldn't find any datasheet,
> so I don't know if these devices actually exist.

M25PE64 yields quite some hits on Google. Is supporting this (all?) XMC 
device in upstream a good idea nevertheless? Does "first come, first 
served" apply here?

Kind regards,
Reto

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
