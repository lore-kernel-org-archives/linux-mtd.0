Return-Path: <SRS0=jwHe=LL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3884C2B9F4
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 15:08:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46CC66120A
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 15:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46CC66120A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=reto-schneider.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnNrem/VznXap02vmIhhmq6ak5P7s/1V7gjCcn6b6Is=; b=GSzByBmSYfY2JAZAoat7hjVgiO
	d3raGXymOHMnOmiWv+OrLiDqWI/dbLnTWh/7R7OmlB+xetO89txUS82TtFM6XFp9tENeWpcQvd5c/
	BOZJBmonZVeEFYbZA8jMcDOgpfgTSiSkPd5ymyzZo5+DmUD1WOzKSvXadXE8AtDUGFkybRWMBiQ1E
	gkdOzdwwkBayTAbPqu3Q2n0khgTQ2OQ0YJsoNktOb1ZiP8l6/N2gIDpaVAUq3TV72OhoryXV4g0Sa
	1d/VWBcPIcRm14hj7v5DE/+TKPj0qykMeTucyA15J6tj9kUY/xg838sb3aElPM7MuSftyeXoWiscR
	pT4PqSPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lttbw-00AsFT-UJ; Thu, 17 Jun 2021 15:07:16 +0000
Received: from mxout014.mail.hostpoint.ch ([2a00:d70:0:e::314])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lttbq-00AsDd-U7
 for linux-mtd@lists.infradead.org; Thu, 17 Jun 2021 15:07:12 +0000
Received: from [10.0.2.46] (helo=asmtp013.mail.hostpoint.ch)
 by mxout014.mail.hostpoint.ch with esmtp (Exim 4.94.2 (FreeBSD))
 (envelope-from <code@reto-schneider.ch>)
 id 1lttbd-000Fys-JU; Thu, 17 Jun 2021 17:06:57 +0200
Received: from [2a02:168:6182:1:d64b:e086:4fb7:9a87]
 by asmtp013.mail.hostpoint.ch with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2 (FreeBSD)) (envelope-from <code@reto-schneider.ch>)
 id 1lttbd-000FSt-Gl; Thu, 17 Jun 2021 17:06:57 +0200
X-Authenticated-Sender-Id: reto-schneider@reto-schneider.ch
Subject: Re: [PATCH v1] mtd: spi-nor: Add support for XM25QH64C
To: linux-mtd@lists.infradead.org
Cc: Stefan Roese <sr@denx.de>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Michael Walle <michael@walle.cc>
References: <20210613121248.1529292-1-code@reto-schneider.ch>
 <1ba367f93650cb65122acd32fb4a4159@walle.cc>
 <f022abf3-a6fe-d060-9868-985303c4e8a0@reto-schneider.ch>
 <3bb5ae427dc01b82be4434dff39e6c8e@walle.cc>
From: Reto Schneider <code@reto-schneider.ch>
Message-ID: <d9ff3a7a-7c2e-80a2-7910-3cc1a530833e@reto-schneider.ch>
Date: Thu, 17 Jun 2021 17:06:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3bb5ae427dc01b82be4434dff39e6c8e@walle.cc>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_080711_024318_41DB4098 
X-CRM114-Status: GOOD (  10.22  )
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

Hi all,

On 17.06.21 16:19, Michael Walle wrote:
> That is up to the maintainers, but sooner or later we will have to face
> the problem regarding the duplicate IDs.

A strongly worded statement by the maintainer(s) ("the Linux crowd") 
against ignoring the continuation codes might help (me) to put pressure 
on non-compliant manufacturers.

Any chance something like this is already out there? Could not find 
anything.

Kind regards,
Reto

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
