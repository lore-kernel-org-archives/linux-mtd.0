Return-Path: <SRS0=cYNo=AK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB63C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 13:30:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A79BD23D99
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 13:30:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YEpSf1gx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="LPesvD1r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A79BD23D99
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oxBBHdzGYUpKcVZULkDlkEgduXoLGDnj1HD79TdplVM=; b=YEpSf1gxSkKFcyDwZZudJqmxS
	4vko+l5tcsuQ2kA2SF9GY4wfd7DCxFOSjrO+nHezXi5s9KEPoPRVialQa6oaRsr5MyDes2ddanHJN
	2JzcQ7znuDiWwBjRuq1kW0HjGT9tyIUET0iW1pZJK5g6tbMUlFt+8SBBYwGjS3nS4huFPHoWHelyA
	NZH33IeFENC9a+kE07JarARrDgGTVi2hOHmWiERQA+WiLyCl9tcrZdQ6+aHqLQ0cnQXjovaSUDhX+
	gDb6HPCklYz+7aVQkVE8BtZ74A6r1do8k0RicQC5LFRmq7+Gr7EHPirnqKPUkT8ATP9rqsoTXoHm9
	uTX5/6uwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jptqh-0000SY-GQ; Mon, 29 Jun 2020 13:29:27 +0000
Received: from mx1.tq-group.com ([62.157.118.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jptqe-0000SK-EM
 for linux-mtd@lists.infradead.org; Mon, 29 Jun 2020 13:29:25 +0000
IronPort-SDR: 1FbhWjwLcEdn1Q0su9oP38NdY2BKY6oXeFifTV9dO+033aukPIh430pBrmZ1g0n3zOXxH9lRL1
 7tf8AxYnlIkNxvdhh0LbyXMkotSJTW8gUyW3NZsJ0wOlfc0d9Naew0Jg9b03KycF9Ex7VzXslI
 4VaHJGdgzY+qPGevaqx8fU3JG896QEFyxxnKKDtT6rJ2Sud/pb3e+8Ja+GDSK+c39aPDUwiuBR
 mK4m0EjeNNa+jzwZF5DDAztyxBAlCTv9SootrYyj8pd0RL4xVtto9Rr9WCmF7u5eEXl5OU6LRG
 Wlk=
X-IronPort-AV: E=Sophos;i="5.75,294,1589234400"; d="scan'208";a="12880961"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 29 Jun 2020 15:22:03 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 29 Jun 2020 15:22:03 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 29 Jun 2020 15:22:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1593436923; x=1624972923;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d765UglviXAqW+GAijNHXP9xNKKGdAwIhk+fTvwY8VY=;
 b=LPesvD1rXXYhkRpxl1FfikAZIZD/im6ie8wuU/x98l56AY+NiRGXLDhL
 a9dLbgeIweQlEIZfGaGtaXY2LmOn6EGIE2EHvYxDC/UrWTWpkmkbQkNjs
 MxSrafFu4JnXnF9BI5WYt8KXgErmM7Teyj+b/kncNubiJZgXrqlGNjL/5
 J7ScWseQmjRtHCtTtVT55ZPAYmUib2dJfoUeSgEFnDc3071pK78GHkQGW
 jlBHlEFex9vaWIaj8Rw2TyC3Xf4+Lcs0P3JMMLGac8h0H2Htj+k0HlIEh
 UVRl6hex7UG0qRY5DltPSiRRnGFvCCA9Pibg9qdpdsBH1LJGqw8kycPi3 A==;
IronPort-SDR: e+L1oTFDLOrjFOUDjEXWydcdezL20EffWxOmHbukB/o/vXOiCuLRGv7XJ+HsiX4z+tLAaf163B
 CtfaaEHOxpUCdWGOb7oZU2r2oEv7hh9bwOvHBE+i0KynHNXnNpLQpYiF0p8oslv8qv8GnoARSe
 OpC+3mLqTwFr41W0W2JFQ5LJlzNaF4JwE1gJMsoY4Z3Us09XtGKRf+fdsKWGTY5+1d7lHxQWEC
 a2Qpd8AaZqIpCd9tfPMS/i488P/znhWF+nnRpWKGpZLKI88JanWcXQvS3WllWlLjjDvIdBA+eF
 QkE=
X-IronPort-AV: E=Sophos;i="5.75,294,1589234400"; d="scan'208";a="12880960"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 29 Jun 2020 15:22:03 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.117.49.26])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 5DB1F280065;
 Mon, 29 Jun 2020 15:22:03 +0200 (CEST)
Message-ID: <570474bcc4055527d85ca8cf84b653f56bef3e23.camel@ew.tq-group.com>
Subject: Re: (EXT) Re: [PATCH] mtd: spi-nor: micron-st: enable 4-byte
 opcodes for n25q512a
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Tudor.Ambarus@microchip.com
Date: Mon, 29 Jun 2020 15:22:01 +0200
In-Reply-To: <e94d42be-5e40-e2bb-4683-cc7af59e801a@microchip.com>
References: <20200610091616.29555-1-matthias.schiffer@ew.tq-group.com>
 <e94d42be-5e40-e2bb-4683-cc7af59e801a@microchip.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
Cc: vigneshr@ti.com, michael.krummsdorf@tq-group.com, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2020-06-29 at 13:02 +0000, Tudor.Ambarus@microchip.com wrote:
> Hi, Matthias,
> 
> On 6/10/20 12:16 PM, Matthias Schiffer wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you
> > know the content is safe
> > 
> > From: Michael Krummsdorf <michael.krummsdorf@tq-group.com>
> > 
> > Set SPI_NOR_4B_OPCODES, as the flash supports 4-byte opcodes.
> 
> I remember that we stripped SPI_NOR_4B_OPCODES intentionally for the
> n25q
> flashes, check  https://lkml.org/lkml/2019/12/5/50.
> 
> Cheers,
> ta

Ah, thank you for the pointer. Looking at a boot log of a more recent
kernel again, the SPI-NOR flash on our hardware is actually detected as
mt25qu512a and not n25q512a now, so everything should work as expected
without this patch.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
