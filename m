Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB871073CBD
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Apr 2026 13:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q0oYvOPjgsJzwbTy2zAPR1I8afyOYfJikF9SUiEo2Kc=; b=lsJA747gSc4MyV
	W1U8kgbNeYNm44w2lEwbJg/ygCte7U/c3Tgc+7Ah5RoytGRtGlg6Reuf7HDHQOdm3labqgV9H0HVO
	ZHuARvEXmhjJQgtlYXuzr9QHZz+4O+F2uGp5oxhzYCYHAJgriCzI76n0w10sbMd8S+mdELqtAeyKq
	btVpc3PgIMhsgWPkn8j//O7br+vM5kIgURpBYVZgR0LPU4nCzanIVWFTmSp3WMgmA7zgYGfeZXU95
	6XOCtPn6zUs+i6X15gPFZAVCb3anSK52+IKKii2HXnzY3r08ilhTyAJbMiBUshooaTR1SkkwQPzJQ
	VisR8sat6TwLPLvTZemA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAT94-00000008vkX-2oTA;
	Wed, 08 Apr 2026 13:40:38 +0000
Received: from mailout3.hostsharing.net ([144.76.133.104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAT91-00000008vjb-1kCs
	for linux-mtd@lists.infradead.org;
	Wed, 08 Apr 2026 13:40:37 +0000
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id D88A4C1D;
	Wed, 08 Apr 2026 15:40:30 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id ACABE60E3C71; Wed,  8 Apr 2026 15:40:30 +0200 (CEST)
Date: Wed, 8 Apr 2026 15:40:30 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
Message-ID: <adZazsIA5D-gJ1OS@wunner.de>
References: <20260204012630.2211832-1-andriy.shevchenko@linux.intel.com>
 <adX3SHYgazijahbG@wunner.de>
 <adY7r_YNFjGk9EKZ@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <adY7r_YNFjGk9EKZ@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_064035_598666_D7EFABCD 
X-CRM114-Status: GOOD (  19.49  )
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

On Wed, Apr 08, 2026 at 02:27:43PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 08, 2026 at 08:35:52AM +0200, Lukas Wunner wrote:
> > On Wed, Feb 04, 2026 at 02:25:27AM +0100, Andy Shevchenko wrote:
> > > Compiler is not happy about used stack frame:
> > > 
> > > drivers/mtd/chips/cfi_cmdset_0001.c: In function 'do_write_buffer':
> > > drivers/mtd/chips/cfi_cmdset_0001.c:1887:1: error: the frame size of 1296 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
> > > 
> > > Fix this by factoring out do_write_buffer_locked().
> > 
> > FWIW, the issue only occurs with CONFIG_KASAN_STACK=y, so an alternative
> > to refactoring the function is to disable KASAN for this particular file:
> 
> I would like to avoid such big hammers.
> 
> Somehow I lost the track of this patch, I need to find it locally and check
> the status, I will come up with updated one once I found the latest version.

I just wanted to highlight that it's a KASAN-specific issue that doesn't
show up unless CONFIG_KASAN_STACK=y.  I think it's worth mentioning that
in the commit message.

I'm not saying disabling KASAN is the right approach here, but it's one
*possible* approach.  Ideally the number of variables on the stack should
be reduced.  Perhaps alocating them on the heap would be more appropriate
than refactoring the code, I don't know.

Thanks,

Lukas

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
