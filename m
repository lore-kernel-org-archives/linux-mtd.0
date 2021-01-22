Return-Path: <SRS0=x7NS=GZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CE9C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 17:19:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 762DA23A79
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 17:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 762DA23A79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ok8WovWiPSDZ3jyAEOB5mLw4zgn5OQsvC3850JJuHHM=; b=2D6P0Dw+FwBrhoeCPBi+FMJLX
	ps1FuIlvoPM3nzj15OJRTu7rGVHJKQg62P80+Yaqmx513Mj8tVW+N0yXH0pb4s+CMqz/0DweDblIV
	wNyG3OturWqp1KVsC4N3Q+FRIZWV/fcXZ+7HnkYsOhwCtbH6M9NqqiHmCtPDhI5bbjN8VbH+8BQg2
	AQyI+IouTFCzDKNHMxTWDB25P5we9yDZmefM9zSK5l0AA40MmnWiyOOlgm3Kj5HqqnGI5ndNy1duk
	khV+tDThsC8w87jTXi5rRQP1949vt97yXcQ1EvV8LZDUew8gEmgexdLg0vI+gLTj/Fbu8WSVavMyf
	raNASIauA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l305G-0002ZU-3M; Fri, 22 Jan 2021 17:18:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l305E-0002ZI-3N
 for linux-mtd@merlin.infradead.org; Fri, 22 Jan 2021 17:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fixooYTMZDDPhjwrPhetGmMcASfSzGrU62XEmkBdlKU=; b=fG910HWrmClFzdbwaNl1ijhw0l
 QB9nfn13Yy4nncxWe+BhVV80d+rr2PVBcTJ5sEZgE3Eon4fx7vofuoGHga+V4l9xn5FKP8SPUqfL/
 sNMWiWgQLoumLNLJVaRi3U9x/GRzljs246AaHklLRpvE1pmWI7bV8Ndz91ytD+jgATA1gsgGj395j
 0AKlrU7Mjd5Dt+bJ808m0cFIe3Pz1tzG+jxTSAXGcdoXguEXqeyszjP1bqzgBP+4AWwiuVDfcq/u3
 e0hCUldI8d85APolx5y6WWma8t1dIwTV14syHAjxwJIRfVCDLUV09N5YYvCONIExglIKGvfFN+TYs
 hTUu8UFw==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l3052-0010Nj-5a; Fri, 22 Jan 2021 17:18:42 +0000
Date: Fri, 22 Jan 2021 17:18:40 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 3/8] ubifs: Add support for FS_IOC_FS[SG]ETXATTR ioctls
Message-ID: <20210122171840.GB237653@infradead.org>
References: <20210122151536.7982-1-s.hauer@pengutronix.de>
 <20210122151536.7982-4-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210122151536.7982-4-s.hauer@pengutronix.de>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-fsdevel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jan 22, 2021 at 04:15:31PM +0100, Sascha Hauer wrote:
> +	if (xflags & FS_XFLAG_APPEND)
> +		iflags |= UBIFS_APPEND_FL;
> +
> +        return iflags;

This uses spaces for indentation

> +	if (flags & UBIFS_SYNC_FL)
> +		xflags |= FS_XFLAG_SYNC;
> +	if (flags & UBIFS_IMMUTABLE_FL)
> +		xflags |= FS_XFLAG_IMMUTABLE;
> +	if (flags & UBIFS_APPEND_FL)
> +		xflags |= FS_XFLAG_APPEND;
> +
> +        return xflags;

Same here.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
