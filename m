Return-Path: <SRS0=y1SG=VW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E268DC76190
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 21:04:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B269E218D4
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 21:04:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g+VQtF2f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B269E218D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=isucEYLARopcRF9N8DLj7ym3b1EaIySNnV4igPkGXzI=; b=g+VQtF2fVNT+Kw
	cGgfIE4UZqA04lHzm9FVe69zJQhAelxugU3sTBDD74CTY5WnRb36BK9VueKTXJNKN39jjZx9+KwiV
	lXAy4kNaMMfUW0aPnNucE5tm7pboQ8yfsokwgoBZlz8wqgq4qXIRn7UUTHxCybSQKsqT8z5xibLrg
	qAHgtQNnYqaT8W9GLmDfhkqgYXSdR3/XNB+WEMXt+MfSv5TVo2YAEvBKrFv/YzuC9n8YT67o1sll6
	H7VSc2KL93oX/xCkdtW1VJNgJcUe4cvmsXALgNb+rlqXr3u7oNc7yNNHc09Haq4/J+d1VAVkN9OP5
	aVSFsVjWOQWsYHIzttqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqkuj-0000nW-1s; Thu, 25 Jul 2019 21:04:37 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqkuf-0000mO-Eo
 for linux-mtd@lists.infradead.org; Thu, 25 Jul 2019 21:04:35 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1hqkub-0007zK-Ke; Thu, 25 Jul 2019 23:04:29 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1hqkub-0007e1-CJ; Thu, 25 Jul 2019 23:04:29 +0200
Date: Thu, 25 Jul 2019 23:04:29 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] ubifs: Correctly initialize c->min_log_bytes
Message-ID: <20190725210429.2aumbkpcfh4kzp2e@pengutronix.de>
References: <20190725205627.31313-1-richard@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725205627.31313-1-richard@nod.at>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_140433_495747_7ECCCB98 
X-CRM114-Status: GOOD (  12.00  )
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
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Richard,

On Thu, Jul 25, 2019 at 10:56:27PM +0200, Richard Weinberger wrote:
> Currently on a freshly mounted UBIFS, c->min_log_bytes is 0.
> This can lead to a log overrun and make commits fail.
> =

> Recent kernels will report the following assert:
> UBIFS assert failed: c->lhead_lnum !=3D c->ltail_lnum, in fs/ubifs/log.c:=
412
> =

> c->min_log_bytes can have two states, 0 and c->leb_size.
> It controls how much bytes of the log area are reserved for non-bud
> nodes such as commit nodes.
> =

> After a commit it has to be set to c->leb_size such that we have always
> enought space for a commit. While a commit runs it can be 0 to make the

s/enought/enough/

> remaining bytes of the log available to writers.
> =

> Having it set to 0 right after mount is wrong since no space for commits
> is reserved.
> =

> Reported-and-tested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.d=
e>
> Signed-off-by: Richard Weinberger <richard@nod.at>

Thanks for your support
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
