Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE5BC4345F
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2024 14:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=80HjrfIoWmtW/+75bpDbPPfInDIGpwsk01/iVLYe0HI=; b=qJx9S+HH5hyj4h
	db7JEVGrs51N3zbKqVoQfKOh+5uB/kB53Yav7rB6nrgr3kx1+zD4vicBHiMe3dwKzU37WLHzlFNR5
	HYkUoXXXHubCM4eA8QhJLag40+SIc0zgqUcBnMiWor39mbOahfXZudzFHGzcuoe/ndxlpnr4SzfyU
	CZAcmP37qzPShjWW4SbET32ybyh3XHJNgR17XG79AOa82QehBw6Oao0GCgDLDCywam+MziDyONL+l
	wVdWTYn0jPU5Mgfog6EfIYwUFDNFShJmDvtut3M69kZgA6i2QBVYdUvdbK7dVTfcN3iEJSI4jIBeG
	krZDWF78rSGUL9URzDig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHTh-0000000HSjl-0F5P;
	Fri, 12 Apr 2024 14:02:05 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHTW-0000000HScQ-3OH4
	for linux-mtd@lists.infradead.org;
	Fri, 12 Apr 2024 14:02:03 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4340:6430:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 5E5505D4;
	Fri, 12 Apr 2024 16:01:43 +0200 (CEST)
Mime-Version: 1.0
Date: Fri, 12 Apr 2024 16:01:43 +0200
Message-Id: <D0I76PPKBWF9.X2XFZAO5OE7S@kernel.org>
Subject: Re: [PATCH v1 1/6] mtd: spi-nor: Remove support for Xilinx S3AN
 flashes
Cc: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
X-Mailer: aerc 0.16.0
References: <20240412134405.381832-1-mwalle@kernel.org>
 <20240412134405.381832-2-mwalle@kernel.org>
 <7b2fc5cb-d1ab-4e9d-b955-b88698322057@linaro.org>
In-Reply-To: <7b2fc5cb-d1ab-4e9d-b955-b88698322057@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_070155_006591_23E8476F 
X-CRM114-Status: GOOD (  10.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri Apr 12, 2024 at 3:53 PM CEST, Tudor Ambarus wrote:
>
>
> On 4/12/24 14:44, Michael Walle wrote:
> > These flashes are kind of an oddball for the very old Xilinx Spartan 3
> > FPGAs to store their bitstream. More importantly, they reuse the Atmel
> > JEDEC manufacturer ID and in fact the at45db081d already blocks the use
> > of the 3S700AN flash chip. It's time to sunset support for these
> > flashes.
> > 
> > Signed-off-by: Michael Walle <mwalle@kernel.org>
>
> Good, I'll let Pratyush review the details:
>
> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>
> Please resend once you get enough feedback and include in To: all the
> contributors to this driver.


For my future reference: This seem so be the only interesting
commit:

commit e99ca98f1d7190c16601b00d0c96212d7c00577d
Author: Ricardo Ribalda <ribalda@kernel.org>
Date:   Fri Dec 2 12:31:44 2016 +0100

    mtd: spi-nor: Add support for S3AN spi-nor devices

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
