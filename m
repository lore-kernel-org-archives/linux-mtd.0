Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E35EC4708D
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Jan 2023 12:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=eL9cMAJcWrzlsjVC7XjMLC96QF6521A+GomhB746P1I=; b=Ge+9qIwNRuI33AJpnPrALjHQcM
	iu1Z80BYUMiNNd+m9eR3e5eOhM0cg1Q1BSH6Bdfg3YJf9nqHK8lc2BmJXP6wzQzVbDVJBUoIxPDp6
	lni3WRRcUdUkt+UfLVP1TZEF9wEND8lIy2rFTV5FPN8A/SJmSsVDTUPrJJBhan/lGRhj47eyUZv9H
	mkuN1HDcSLnfm+hUlohLw1An4ca8yWHEIjqZ6HJHRR9tJUAUXWqJYt1T0cKS10viXVh5Q7C4s5c0C
	BtA4dIH5TpHVVzS7Yi9VaarKhXLvdZf97SF6pAWkvpuBfuKyLj+7EaNTvbpxDRRan2+ntSelKP4+m
	na7QoPIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDlg7-007zib-IC; Fri, 06 Jan 2023 12:18:31 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDlg2-007zc5-JQ
	for linux-mtd@lists.infradead.org; Fri, 06 Jan 2023 12:18:29 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1pDlfs-0004id-1I; Fri, 06 Jan 2023 13:18:16 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1pDlfr-00060i-Gv; Fri, 06 Jan 2023 13:18:15 +0100
Date: Fri, 6 Jan 2023 13:18:15 +0100
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ubifs: Handle LPT corruption better in
 ubifs_garbage_collect_leb()
Message-ID: <20230106121815.GA20604@pengutronix.de>
References: <20180704140230.5606-1-richard@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180704140230.5606-1-richard@nod.at>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
From: Sascha Hauer <sha@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_041826_689384_97750EFA 
X-CRM114-Status: GOOD (  25.46  )
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

Hi Richard,

On Wed, Jul 04, 2018 at 04:02:30PM +0200, Richard Weinberger wrote:
> If ubifs_garbage_collect_leb() notes a LPT problem, empty LEB, but
> LPT has it makred as used, an ubifs_assert() is not enough.
> We have to abort GC. Otherwise list_entry() returns an invalid
> scan object and the kernel crashes.
> 
> c: <stable@vger.kernel.org>
> Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  fs/ubifs/gc.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

What happened to this patch? It never made it anywhere. I just stumbled
over this issue and found this patch afterwards.

> 
> diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
> index a03a47cf880d..11c09ce3c795 100644
> --- a/fs/ubifs/gc.c
> +++ b/fs/ubifs/gc.c
> @@ -513,7 +513,13 @@ int ubifs_garbage_collect_leb(struct ubifs_info *c, struct ubifs_lprops *lp)
>  	if (IS_ERR(sleb))
>  		return PTR_ERR(sleb);
>  
> -	ubifs_assert(!list_empty(&sleb->nodes));
> +	if (list_empty(&sleb->nodes)) {
> +		ubifs_err(c, "Bad accouting information, LEB %i is marked as used but no nodes found!",
> +			  lnum);
> +		dump_stack();
> +		return -EUCLEAN;
> +	}

This changes the behaviour. With ubifs_assert() UBIFS goes readonly, but
with this change it stays rw. Is this intended?

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
