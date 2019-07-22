Return-Path: <SRS0=6YPz=VT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB16C76188
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2019 08:41:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45FB621E6B
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2019 08:41:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SRa6gOz6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45FB621E6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f6iz719voD8AhVM291KyEw+fAWFd4LyCgbjjrpHadB4=; b=SRa6gOz6CBkDZD
	3MfGJM/HiTcBma9Zc6YAtSoRS9oji9ONMasDG/vg2llYegAf9F2Qq/fBm/VK9BlSvc1PGHP9CHEBO
	4BS2PgeL9SnnWO6Z+qktgnB3kNpBvMo8bScN8HdaPjuYPuecoe9A5sX/WMMkHGW6hGgqMaXp1HuLW
	ssSck/TEXQdXwl0QQv/npE72eNhCXCYWQ0ldrPFa/Uo1EoTttNEronBQHySG8EVhk/pAm9USdJLu0
	rtFuEHXFM8//wZAwG28eEeB1r/XA4R9O0p0Cc8bYMS9UD67moTgYoStv5NQqiX4iYXXdC/QcFpSTW
	+b0oY9vZubo7O6nU3ZGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpTsf-0000w6-N1; Mon, 22 Jul 2019 08:41:13 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hpTrx-0000Gw-2a
 for linux-mtd@lists.infradead.org; Mon, 22 Jul 2019 08:40:30 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1hpTrq-0002K3-B8; Mon, 22 Jul 2019 10:40:22 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1hpTro-00006E-AB; Mon, 22 Jul 2019 10:40:20 +0200
Date: Mon, 22 Jul 2019 10:40:20 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Subject: Re: ubiupdatevol breaks ubi?
Message-ID: <20190722084020.36rzdcg5o2qxf3xv@pengutronix.de>
References: <20190718141351.ya7bnhhwgnc2qz56@pengutronix.de>
 <1088672879.45101.1563739430883.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1088672879.45101.1563739430883.JavaMail.zimbra@nod.at>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190722_014029_130264_77507828 
X-CRM114-Status: GOOD (  20.19  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>, kernel@pengutronix.de,
 Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Richard,

On Sun, Jul 21, 2019 at 10:03:50PM +0200, Richard Weinberger wrote:
> ----- Urspr=FCngliche Mail -----
> >	[   57.807978] UBIFS error (ubi0:0 pid 262): ubifs_assert_failed: UBIFS=
 assert
> >	failed: c->lhead_lnum !=3D c->ltail_lnum, in fs/ubifs/log.c:412
> =

> It took me a while to understand what is going on and why you are facing =
this.
> The assert seems to trigger only if you mount a filesystem where both log=
 heads
> point to UBIFS_LOG_LNUM, hence empty log area in initial state, and you c=
hange
> more filesystem contents than the log can hold at once.
> =

> After reviewing UBIFS log code I found something odd.
> UBIFS does not initialize c->min_log_bytes, it is by default 0.
> =

> c->min_log_bytes can have two values:
> - 0: commit in progress, remaining log area may be used
> - leb_size: no commit in progress, keep leb_size bytes reserved
>   for a future commit.
> =

> So having it 0 after a mount seems wrong to me because after mounting
> UBIFS there is no commit in progress.
> =

> Can you please give this change a try?
> With this applied I can no longer trigger the assert.

Same for me, with that change my machine boots fine without hitting an
assert.

> I'm still not entirely sure whether the assert is correct at all,
> review in progress... :-) =


I assume you will be able to work that out.

Thanks for your time looking into my report,
Uwe

> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 6cfc494050be..b4984da44251 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -607,6 +607,9 @@ static int init_constants_early(struct ubifs_info *c)
>  	c->max_bu_buf_len =3D UBIFS_MAX_BULK_READ * UBIFS_MAX_DATA_NODE_SZ;
>  	if (c->max_bu_buf_len > c->leb_size)
>  		c->max_bu_buf_len =3D c->leb_size;
> +
> +	c->min_log_bytes =3D c->leb_size;
> +
>  	return 0;
>  }
> =

> Thanks,
> //richard
> =


-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
