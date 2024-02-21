Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A53C48BF6
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Feb 2024 11:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d9eoKQ4m/MpuRfY1jBzkeYnSsHAwyidY9gkit5AxR+U=; b=jATwIfUN/6zmO4
	5OwUion7UmnvjaRrkOAwYtdfzyqOGYTIRiksPllEtZdSdzIqQnpFdXFheYno8w8CZ2wDP3vpW7nuC
	ureAiWOKO/K4XKCqmEUaB9dr4A/rzvxmVRGGWbuxcXglfF0kygH9v+pmk3FnErLiF/ArohQwrCPpR
	VlhznWKkQ1pRVYU/IBHe1h9i+nmrl0Yx/xB3NqYuWebtr+E5/Lhaxw+SSwfjnKg9QHlFJxyfD1Y/T
	BNdGqY6GMKJIsOKue42VOYAA336iRuizgnt0thNQKKcmPTaF0QnXCF0z9yCLqUAodqYlQEkaaVrVZ
	+xoGiMgji+LYoMCq3csg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rckLc-00000000bq0-2DKd;
	Wed, 21 Feb 2024 11:01:08 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rckLZ-00000000bnk-1xwO
	for linux-mtd@lists.infradead.org;
	Wed, 21 Feb 2024 11:01:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 13AB1CE1CFB;
	Wed, 21 Feb 2024 11:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A33C433C7;
	Wed, 21 Feb 2024 11:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708513260;
	bh=oJUXBVVY+vVx1UyN31Vre1Dkgow45biC3Dpaor0ifBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p8EGoMto2GGvZ3giIazo/7t0byjEUCrn9wkrxEXwjdooLYVSpG8MdEVgLtN+VbnMz
	 RFmRwAElSeYvhD2Rv/4MzakNoQUizTgHvxSmdZJkSJN6/wJz34Jhco1h8X1Oyzn2NO
	 jJkmgH9jW/2tJKUmdAyYv9Ie00rVRiFj9Rub9oPc=
Date: Wed, 21 Feb 2024 12:00:56 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: max.oss.09@gmail.com
Cc: stable@vger.kernel.org, patches@lists.linux.dev, s.hauer@pengutronix.de,
	han.xu@nxp.com, tomasz.mon@camlingroup.com, richard@nod.at,
	tharvey@gateworks.com, linux-mtd@lists.infradead.org,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [regression 5.4.y][RFC][PATCH 0/1]  mtd: rawnand: gpmi:
 busy_timeout_cycles
Message-ID: <2024022151-tinker-sprang-5fa2@gregkh>
References: <20240207174911.870822-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240207174911.870822-1-max.oss.09@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_030105_705150_A691BC28 
X-CRM114-Status: GOOD (  15.42  )
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

On Wed, Feb 07, 2024 at 06:49:10PM +0100, max.oss.09@gmail.com wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> Hello
> 
> With the backported commit e09ff743e30b ("mtd: rawnand: gpmi: Set
> WAIT_FOR_READY timeout based on program/erase times") in kernel 5.4.y
> I see corruption of the NAND content during kernel boot.
> Reverting said commit on top of current 5.4.y fixes the issue.
> 
> It seems that the commit relies on commit 71c76f56b97c ("mtd:
> rawnand: gpmi: Fix setting busy timeout setting"), but its
> backport got reverted.
> One should either backport both commits or none, having only one
> results in potential bugs.
> 
> I've seen it in 5.4.y, however in 5.10.y and 5.15.y there one of
> the two backports is also reverted and likely the same regression
> exists.
> 
> Any comments?
> 
> Max
> 
> Max Krummenacher (1):
>   Revert "Revert "mtd: rawnand: gpmi: Fix setting busy timeout setting""
> 
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> -- 
> 2.42.0
> 
> 

Now queeud up, thanks.

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
