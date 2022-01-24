Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF65C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jan 2022 14:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJJmHaeAoj4DacERh9wFVSLNeHKPZB6Ca4h3FK1sm14=; b=qIhP7OwxzcVl0j
	pc705hqMqX8c8FtseeIq1MOFgkVnugWae8iX8+gN+aMhlo1etCTDA4ahLGHzieTcAtLvfxy7D1LCW
	FXXnjRdud4XJmfowTg/GXsL0kZ2bd8jkRemDDUQS/ctNrlf0CYKUspCaj8qWH2UEs/F+9Zhm0a2cz
	Lt2ZOAGnuei2sKduPKG40o/qcXLnnBko7vlpxvuV/L8+/Boo82Eslf/MSeAvYi1g32d8r5b10RdCj
	e41FAI2w2uBYThuwNS9TsMWCgusWjSm+cBqqnAxl6VHluh9z7n0qBzx02/WGKn8SwKstTOWKJqdDM
	n2OdieoeE1DEx70Iye6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nC0ML-003bqb-VY; Mon, 24 Jan 2022 14:30:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nC0LX-003bYn-15
 for linux-mtd@lists.infradead.org; Mon, 24 Jan 2022 14:29:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 41866B81057;
 Mon, 24 Jan 2022 14:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FCA7C340E1;
 Mon, 24 Jan 2022 14:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643034562;
 bh=wM6dq5JYKAC/xsOtX29ndceFMgecyE5AD5Ktxf69ZVo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zc8vphqew11LXKyNPYzGUD+3ajt5GlBKNKr2lV4BStUSnILil08sDD1f2ruPHQ1h4
 FNyL+8QllqINAvxkNz2MNF8PxttYuCYyMstYFDXzu48nlovDDqciJ/XByZ4uyNkisM
 8XMo72tbWAuomPw3aIOt3yYpUA2iqCFtzbtH+ebg=
Date: Mon, 24 Jan 2022 15:29:19 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, sashal@kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 vigneshr@ti.com, miquel.raynal@bootlin.com,
 Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>, richard@nod.at,
 Stoll Eberhard <Eberhard.Stoll@kontron.de>
Subject: Re: [PATCH v2 1/2] Fix corner case in bad block table handling.
Message-ID: <Ye63v1ypd0H7FYyD@kroah.com>
References: <cover.1616635406.git.ytc-mb-yfuruyama7@kioxia.com>
 <774a92693f311e7de01e5935e720a179fb1b2468.1616635406.git.ytc-mb-yfuruyama7@kioxia.com>
 <9af5a4ae-e919-a545-809d-451217cf40f5@kontron.de>
 <ccc99c80-6771-4f04-11d9-752b7b13a5a4@kontron.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ccc99c80-6771-4f04-11d9-752b7b13a5a4@kontron.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_062927_258981_47F61D8D 
X-CRM114-Status: GOOD (  16.65  )
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

On Mon, Jan 24, 2022 at 03:11:14PM +0100, Frieder Schrempf wrote:
> Hi Greg, Sasha,
> 
> just a gentle ping for the backport request below.
> 
> Thanks!
> 
> Am 11.01.22 um 16:33 schrieb Frieder Schrempf:
> > Hi stable maintainers,
> > 
> > On 06.04.21 03:47, Yoshio Furuyama wrote:
> >> From: "Doyle, Patrick" <pdoyle@irobot.com>
> >>
> >> In the unlikely event that both blocks 10 and 11 are marked as bad (on a
> >> 32 bit machine), then the process of marking block 10 as bad stomps on
> >> cached entry for block 11.  There are (of course) other examples.
> >>
> >> Signed-off-by: Patrick Doyle <pdoyle@irobot.com>
> >> Reviewed-by: Richard Weinberger <richard@nod.at>
> > 
> > We have systems on which this patch fixes real failures. Could you
> > please add the upstream patch fd0d8d85f723 ("mtd: nand: bbt: Fix corner
> > case in bad block table handling") to the stable queues for 4.19, 5.4, 5.10?
> > 
> > Thanks!
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 9c3736a3de21 ("mtd: nand: Add core infrastructure to deal with
> > NAND devices")

Odd, I did not see this anywhere in my inbox.

Now queued up, thanks.

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
