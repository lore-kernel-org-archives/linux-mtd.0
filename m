Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEB5C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jan 2022 10:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nIglH2UhB/OkMoRFIk9UAC09drFRv/1mg+6uDMu+P/w=; b=TWAAfIOJCG6A1D
	75eeeqmTAo64cTz75BVXuPRHeIAQptaiIxmVw1cIVeRPRXyaxaYgeTSgQjJ7Xmw2cBt2/pY2ScJKE
	dVhLngNABJIuvtruhUu63Da5Y9uHbiHJ3aK9FAEDpRKujQjI+Y/LaZtH1t14VGf5LcTCGp7o108/P
	O1NbRIWOPM0qtNRE1zKdNnXcNZylmrgmTct+czWHerZMN2R60bhpWjwyV/l0K2Zg0H2wEyzZjpwZ6
	JjV/g7P251U2nlylJ+xUBEVtHq1NSPXesQgt+364HV+UWTveZBLCgpf8ZM2i3+4BfZPBj5TWeC37I
	RCJY2nGSR7+u8ivBym8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8Jfp-008fyy-PN; Fri, 14 Jan 2022 10:19:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8Jfm-008fxF-5L
 for linux-mtd@lists.infradead.org; Fri, 14 Jan 2022 10:19:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B132F61EBA;
 Fri, 14 Jan 2022 10:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A8B3C36AE5;
 Fri, 14 Jan 2022 10:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1642155545;
 bh=ywTra5QTmRO6NirMTkZ9bdysfIiAFf7WRL5XaV6RSPQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UKcm4rp0JCZ8uWVJIXYz/wHc5QdMaLxMaPm4iNSciRXxtTwGLY+giTlWAFmGY7Ta1
 BCaXoK5eYaCB00GCJYuk+qgsS2EOQaY2PFXsYJDr8w3m8i0i+enhYt6YLedXrRAGsf
 opnZN3h868dNKBzRiTJFLkIzxYVtNKeMDbJSG0EQ=
Date: Fri, 14 Jan 2022 11:19:00 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Walle <michael@walle.cc>
Cc: linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Stefan Schaeckeler <schaecsn@gmx.net>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] ubifs: use default_groups in kobj_type
Message-ID: <YeFOFJ7W+bCq+A6o@kroah.com>
References: <20220113180857.2158974-1-gregkh@linuxfoundation.org>
 <bafc94269e6fa7632bc6ea458320b238@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bafc94269e6fa7632bc6ea458320b238@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_021906_288312_632881D6 
X-CRM114-Status: GOOD (  11.73  )
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

On Fri, Jan 14, 2022 at 11:08:03AM +0100, Michael Walle wrote:
> Hi,
> 
> Am 2022-01-13 19:08, schrieb Greg Kroah-Hartman:
> > There are currently 2 ways to create a set of sysfs files for a
> > kobj_type, through the default_attrs field, and the default_groups
> > field.  Move the AMD mce sysfs code to use default_groups field which
> 
> copy & paste mistake?

Ugh, yes, sorry, will go fix this up, thanks...

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
