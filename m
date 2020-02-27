Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1927C11D3D
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 16:59:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 833982469F
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 16:59:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hMxP/b/Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 833982469F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xuZn6gRZn4Wzzl28junRZDjCSnedmIGvriS931RoLzw=; b=hMxP/b/ZNPV9xg
	gDPCvIy9jhu24rgG+RiWHsHVlTd//FYkzv5WOaxx5cTs6nkeOM/rTbXG/aw6I2un2JoqIbAeOC599
	rk0igi6+UKguI5LgeWjpR8k4TlOM65c7T+eaZq/wyQRfk+zC/Wb+gNXzpwR3m17+NebdfMl3HO3wo
	h/aT3tKwMTBm3HG05YFAAuYxt3Eir8FGgOVuXyTBqkhWElhUa8gK6RSZ27RIntqpf8vpID/9j4pqN
	7PEGnIaRirO/Byg95cHvznj2K4hEXhwU0BmE6xWp8V2Uc7b7CKg+3YdFQg1gWt5JEZW2uvcoHbEkz
	gFc7fzS7Fz2huOoKQrOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7MUs-0004eH-C6; Thu, 27 Feb 2020 16:58:50 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7MUn-0004Yk-N2
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 16:58:47 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 01505296437;
 Thu, 27 Feb 2020 16:58:43 +0000 (GMT)
Date: Thu, 27 Feb 2020 17:58:41 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v2 06/11] mtd: spi-nor: add support for DTR protocol
Message-ID: <20200227175841.51435e3f@collabora.com>
In-Reply-To: <20200226093703.19765-7-p.yadav@ti.com>
References: <20200226093703.19765-1-p.yadav@ti.com>
 <20200226093703.19765-7-p.yadav@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_085845_944781_FAD34330 
X-CRM114-Status: GOOD (  12.17  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sekhar Nori <nsekhar@ti.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 26 Feb 2020 15:06:58 +0530
Pratyush Yadav <p.yadav@ti.com> wrote:

> Double Transfer Rate (DTR) is SPI protocol in which data is transferred
> on each clock edge as opposed to on each clock cycle. Make
> framework-level changes to allow supporting flashes in DTR mode.
> 
> Right now, mixed DTR modes are not supported. So, for example a mode
> like 4S-4D-4D will not work. All phases need to be either DTR or STR.

Didn't go deep into the patch but at first glance you don't seem to
extend the framework to support stateful modes as I tried to do here
[1]. That's really something we should address before considering
supporting xD-xD-xD modes, unless the SPI-NOR only supports one
stateful mode. If we don't do that first, we might face all sort of
unpleasant issues:

* kexec not working correctly because the previous kernel left the NOR
  in an unknown state
* suspend/resume not working properly
* linux not booting properly because the bootloader left the device in
  its non-default mode
* ...

[1]https://patchwork.kernel.org/cover/10638055/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
