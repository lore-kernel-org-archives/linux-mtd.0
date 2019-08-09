Return-Path: <SRS0=Etow=WF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D549DC433FF
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Aug 2019 12:16:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A79C7208C3
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Aug 2019 12:16:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IQr1Uxtw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A79C7208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FeHVyvZswyWZ0T5+rI0QcPJkVEo5JsJZojTdOW6AIg4=; b=IQr1Uxtwr/6JN7
	HGlP6L+Aiz/ukOWebn4fhLmdUJ94O8ZNoSlL8cBgfyJ+lup83hIQ2uD2AM0XmBIycGbWOaq7oANPq
	wzStHxGrp6BQoEs/k+Cqlb05zxS1FmiCkk6mLGreWQ1CRQnlAG3R1xuE976gneKsFSN0wFa7JoNUV
	1nnn77u5dY9VV4iIvx3hre2NkDxOZybWJ8zZENH86x7KUw/Bi3Ro1nd3vzD6bd1imTrIr746oRTfN
	xAtvVAXD9P3tKoBw2qzTt6m/fAGCS8V4Nv6biBUxFU/X+KRfQSwVGc9ls9RcP0j2BpRdSqdYKWHBM
	R7XCxe0aaOqzmwvIz3sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hw3oH-0002cd-9a; Fri, 09 Aug 2019 12:15:53 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw3oD-0002cK-Kx
 for linux-mtd@lists.infradead.org; Fri, 09 Aug 2019 12:15:51 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E653428CE21;
 Fri,  9 Aug 2019 13:15:47 +0100 (BST)
Date: Fri, 9 Aug 2019 14:15:44 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Enrico Mioso <mrkiko.rs@gmail.com>
Subject: Re: [mtdblock] reading regions where %512 != 0
Message-ID: <20190809141544.2eb99774@collabora.com>
In-Reply-To: <alpine.LNX.2.21.99999.352.1908071924030.11090@localhost.localdomain>
References: <alpine.LNX.2.21.99999.352.1908071924030.11090@localhost.localdomain>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190809_051549_822220_A073D172 
X-CRM114-Status: GOOD (  13.28  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Enrico,

On Wed, 7 Aug 2019 19:27:49 +0200 (CEST)
Enrico Mioso <mrkiko.rs@gmail.com> wrote:

> Hello guys!
> 
> first of all - thank you for your great work!
> 
> I've been experimenting an issue with OpenWRt on a TP-Link Archer C60 V2 device, where an mtd region has been defined so that it's not 512-bytes aligned:
> 
> mac: partition@1fb00 {
>   	label = "mac";
>   	reg = <0x01fb00 0x000500>;
>   	read-only;
> };
> 
> So the region is 1280 bytes long; still reading from the exported mtdblock device will results in a 1024 bytes read.
> This prevents users from making proper backups of flash regions. I don't know how many instances of this exist in the OpenWRt tree right now, but it's not clear wether we should fix this issue in the mtdblock or defining regions differently, changing their sizes.
> Any help, suggestions or ideas very welcome and apreciated.

Is this a NOR or a NAND? Have tried reading from the mtd device instead
of mtdblock? I guess block devices have to be aligned on 512B...

> 
> Thank you very much,
> Enrico
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
