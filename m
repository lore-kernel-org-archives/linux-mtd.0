Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A671BC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 08:11:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76224207BC
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 08:11:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="odygbf5Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76224207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AEkWPO5HdIqibbajyCMXiaL4Azx9dmcZZNeYorf5nnI=; b=odygbf5QBFmgUc
	kNquqpZyniTDpbKS0xrse7eL3fTzauhRmsq7nJNJlnPa3BrchKQVgUPd2yfHRUtjFnC0QunSMa7xI
	vohmPXso3H5nJqxc2yQf8W95GcEHmLuXTh5NC8RLXMciktnHehb/BBxiV02GMPNhBK4K2SsTZXj1I
	nYgNDIn1prqi8I7YsOClfePbMhTzstc7PrH3k3UBsoXUvFSlZAMgRm5xEClnIVEqvNDpDDtm1bM/Z
	RQKIO/WKTO3z2jVTc3E/DFp5Gvatll93UqttSe4TQS6ohQWfIoVSVoX0bXM/pg9Kfr0UB1FjMimlq
	R+KZQ/PX0IdAeKqXiHpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jea6l-0008VV-J3; Fri, 29 May 2020 08:11:15 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jea6i-0008Uz-QG
 for linux-mtd@lists.infradead.org; Fri, 29 May 2020 08:11:14 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6AD3D26CDAA;
 Fri, 29 May 2020 09:11:11 +0100 (BST)
Date: Fri, 29 May 2020 10:11:07 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v6 17/30] mtd: rawnand: s/data_interface/interface_config/
Message-ID: <20200529101107.6dadcfd5@collabora.com>
In-Reply-To: <20200529094755.6b53f88a@collabora.com>
References: <20200528231612.8958-1-miquel.raynal@bootlin.com>
 <20200528231612.8958-18-miquel.raynal@bootlin.com>
 <20200529094755.6b53f88a@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_011112_978642_F67AA213 
X-CRM114-Status: GOOD (  14.40  )
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
Cc: Rickard Andersson <rickaran@axis.com>, Michal Simek <monstr@monstr.eu>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 29 May 2020 09:47:55 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Fri, 29 May 2020 01:15:59 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > 
> > The name/suffix data_interface is a bit misleading in that the field
> > or functions actually represent a configuration that can be applied by
> > the controller/chip. Let's rename all fields/functions/hooks that are
> > worth renaming.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>  
> 
> I know it's painful to move that one, but I think it should be at the
> beginning of the series so the functions/fields you introduce have the
> right name from the start.

Hm, maybe I'm wrong and you don't introduce any new interface-related
functions/fields before that one.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
