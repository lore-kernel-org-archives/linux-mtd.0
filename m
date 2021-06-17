Return-Path: <SRS0=jwHe=LL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E096C2B9F4
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 14:20:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D6E9613A9
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 14:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D6E9613A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zf1bbUoUMGBuDXZQ4u0jbxz/O0cwE1XHDYp82z+wkZ8=; b=xsFn6jFNYOzxdKQHnBPD9NWSOt
	NPN5nfvnuOXApOd/pA5vCzXkE7EJFIfTcMVHLRFvC2GCyvSAhZxwO8gmIv3GjxuFL2Zj8k8a8D6+n
	ao3jB4IV5CwUOHIRUc1bee5gBvYWPdJ6IekkE/ZggM+Oo4bKq8vlTbWD3l8ZN+rBqDFSO5TkxgRQe
	lNu26hHpDDud5iuGG1ypRvm6xkAM3Z/M7w+gimG3iVFfm85+3/YZL89EOoeMaLX0I8S6AFfI4zxea
	urqH6STzjPflftbunrCnA0oBf2qrSUcbYT/w9UjGQlLw91VtnphsqYJrs0o05sUUrVFMGU9jRx9YS
	LEyUzEmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltsrt-00AfHA-SB; Thu, 17 Jun 2021 14:19:41 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltsrq-00AfFu-Mm
 for linux-mtd@lists.infradead.org; Thu, 17 Jun 2021 14:19:40 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 8DC832224E;
 Thu, 17 Jun 2021 16:19:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1623939575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wx+5UmqijqNtHgfTJre4bvhnb/XrYaC5F0NIuouRxPA=;
 b=ruMVyV0pGjEPRIiNTFIPi+0xBD9roaxS82PV/lSpcpOTRkajEF8TP2+3ITi4iXHkr6sdsN
 JEucsOTX8Usb/LrUyMTvVogfgUybEEuJWrtK7woK0aHhx+ielp+LTj9lzPpTkQQirxDVYH
 IvAEBLcTtow3txnywow2rDCdw3KPRVA=
MIME-Version: 1.0
Date: Thu, 17 Jun 2021 16:19:34 +0200
From: Michael Walle <michael@walle.cc>
To: Reto Schneider <code@reto-schneider.ch>
Cc: linux-mtd@lists.infradead.org, Stefan Roese <sr@denx.de>, Reto Schneider
 <reto.schneider@husqvarnagroup.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>, Richard
 Weinberger <richard@nod.at>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mtd: spi-nor: Add support for XM25QH64C
In-Reply-To: <f022abf3-a6fe-d060-9868-985303c4e8a0@reto-schneider.ch>
References: <20210613121248.1529292-1-code@reto-schneider.ch>
 <1ba367f93650cb65122acd32fb4a4159@walle.cc>
 <f022abf3-a6fe-d060-9868-985303c4e8a0@reto-schneider.ch>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <3bb5ae427dc01b82be4434dff39e6c8e@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_071938_953467_0CD7BE50 
X-CRM114-Status: UNSURE (   7.93  )
X-CRM114-Notice: Please train this message.
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

Hi Reto,

Am 2021-06-17 13:59, schrieb Reto Schneider:
>> NB. XMC ignores the continuation codes and this particular device will
>> collide with M25PE64/M45PE64. Although I couldn't find any datasheet,
>> so I don't know if these devices actually exist.
> 
> M25PE64 yields quite some hits on Google. Is supporting this (all?)
> XMC device in upstream a good idea nevertheless? Does "first come,
> first served" apply here?

That is up to the maintainers, but sooner or later we will have to face
the problem regarding the duplicate IDs.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
