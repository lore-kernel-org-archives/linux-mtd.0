Return-Path: <SRS0=ZMJ0=QO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD12C282C2
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 10:49:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABD8F21872
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 10:49:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CK3y2cEe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABD8F21872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DfMBt4eZR3flptxgdpopn1cvf4aFgC8NGbBdTy6gO7I=; b=CK3y2cEeB//YCv
	0EdNcJ/BaFtmoJZhhPouYwbSZfmXjzoWyn+6BJYQJ0Rrnn9LLY5bgKRPM1qbVr4W8wq7Df38y20Uw
	n+YuoFsVu3FB4L8nkgMIwZxBQJa8FHbECu38yzBJ8gi15AZCVdCvc3Pe1NaZg17a554puLs7VqUc7
	cbrpR86vLsvIap5Fa6/+lulhyR5WZkbf7P4Jcrsin9u4RTyl6dmgxqO1ElwAClSchDEvJ5fWJs9AA
	3qXEbKD3ft+/m0gLDAjzXJDeXOJgq0+W/ml+tL/3K2sMIcitinUVsoKWOsAJJLiS2nLZ82sbZgT+G
	I+Aul9iEIZjop/uJcwsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grhEq-00044u-EF; Thu, 07 Feb 2019 10:49:00 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grhEm-00044C-P5
 for linux-mtd@lists.infradead.org; Thu, 07 Feb 2019 10:48:58 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CAB9927E636;
 Thu,  7 Feb 2019 10:48:54 +0000 (GMT)
Date: Thu, 7 Feb 2019 11:48:50 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Add support for EN25Q80A
Message-ID: <20190207114843.01c431dd@kernel.org>
In-Reply-To: <5bdbd64f-bacd-8192-b7eb-6ec4c06baec0@microchip.com>
References: <20190123075538.12681-1-frieder.schrempf@kontron.de>
 <f0b2c97b-419a-1e3e-4624-52c60fe32065@microchip.com>
 <52338dfe-aca1-503d-6871-c4be09f1f3ac@kontron.de>
 <5bdbd64f-bacd-8192-b7eb-6ec4c06baec0@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_024856_950093_0E58FC5B 
X-CRM114-Status: GOOD (  15.21  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, linux-kernel@vger.kernel.org, frieder.schrempf@kontron.de,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 7 Feb 2019 10:16:05 +0000
<Tudor.Ambarus@microchip.com> wrote:

> Hi, Frieder,
> 
> On 02/07/2019 12:06 PM, Schrempf Frieder wrote:
> > Hi Tudor,
> > 
> > On 03.02.19 14:33, Tudor.Ambarus@microchip.com wrote:  
> >> Hi, Frieder,
> >>
> >> On 01/23/2019 09:56 AM, Schrempf Frieder wrote:  
> >>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>>
> >>> This adds support for the EON EN25Q80A, a 8Mb SPI NOR chip.  
> >> I would suggest to specify who is using this flash and how did you test it. This
> >> way we will not end up with support for flashes that are not actually used.  
> > Ok. The flash is used by a board that I plan to upstream. Maybe I should 
> > just resubmit this together with the actual board support patches?

No need to wait for the board patches, they'll be applied independently
anyway. Just mention the board you tested it on in the commit message
(even if it's not upstream yet) and we should be good.

Thanks,

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
