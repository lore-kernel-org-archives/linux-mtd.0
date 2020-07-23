Return-Path: <SRS0=DvMR=BC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A818C433EB
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2020 11:19:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19E1D206F4
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2020 11:19:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z1ncQCfF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQmYhHIq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19E1D206F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=soJ6N2VJIOVdSGKKKfRr7uSRecZTZHA+iCHAuBg75Bo=; b=Z1ncQCfFFR8t5cKRgMNr08KHI
	pK7FyYBt7sAY5H6jIg8IwW2pMx8rGkIsu8NrV7yLjsS5bTVMmsH5m+vgqWzQtDDaRAcZDhRmm+UtT
	PwWs3VgvUMdcdKxy+UBDSJwAXd2QIdKeOHeyjjarEWE9RYQbeOsxogvYsJV+tDpQ4hCv+9Un/NgPl
	MNpmWBoXhJMO+3caVeWSpq7lnbuNy5dy7tRTbbK5vjZ3ubAMxf+xXrKnI1wiDSpjmKUfOyzkMWuld
	3qKeKYafF/82BBOCsX4bNsAJ44A9TbmJXXehQdHTilbbb/bdcUeDabAQe8dcnQ4kqNPjM0zHIb9dm
	SKxvNJG+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyZF5-0007fx-9n; Thu, 23 Jul 2020 11:18:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyZF2-0007fR-VK
 for linux-mtd@lists.infradead.org; Thu, 23 Jul 2020 11:18:25 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C18C4206F4;
 Thu, 23 Jul 2020 11:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595503103;
 bh=7yYsCXQZddIcngHN79CYvQZyJ/SNajKQiZIuQXTYH1Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZQmYhHIqSL58pJgKhwa5wstW04qTgqgJtyLDnFIVGFQ1uqTP6sYe4eOKu32wm7drq
 siQxhNZni9V6jqNnBXBOom01DACzlDbehFZHfXBN4RPkt8lTAIDi1qU/u5gOqeEqOp
 /XIMgEkqsT+7EdbyVEZjv8meITwAiwf0o7KNgpBk=
Date: Thu, 23 Jul 2020 13:18:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: properly check all write ioctls for permissions
Message-ID: <20200723111827.GA1963557@kroah.com>
References: <20200716115346.GA1667288@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716115346.GA1667288@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_071825_178114_A2AB92E7 
X-CRM114-Status: GOOD (  11.16  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jul 16, 2020 at 01:53:46PM +0200, Greg Kroah-Hartman wrote:
> When doing a "write" ioctl call, properly check that we have permissions
> to do so before copying anything from userspace or anything else so we
> can "fail fast".  This includes also covering the MEMWRITE ioctl which
> previously missed checking for this.
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: stable <stable@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/mtd/mtdchar.c | 54 +++++++++++++++++++++++++++++++++++--------
>  1 file changed, 45 insertions(+), 9 deletions(-)

Any objection to this patch getting into 5.8-final?

I can take this through one of my trees if you all give me an ack :)

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
