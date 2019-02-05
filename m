Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C187C282CC
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 12:58:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 165B020818
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 12:58:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qF+aQfAY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 165B020818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yTnv+zKe37TMYbpq6HEkhMdb/Ei/uPs9uDeZstT9nBQ=; b=qF+aQfAYrIkRxw
	2TY8OwH77UqRARBhkdl+DO90TB7XtFi7Rb1m1eclUNvGecOwb4Tq5q8HhJolrOSo90a5q34IUjI96
	XpDxicr9eETPQdXnceKuyQaRvjQXWB5On1W7YM4+tEZNTSHhJ/L20VbXo1RHXkrwF0HqbMrepQAUy
	a0uIBFzdPCGxsaPDIgNyOGiuZEQsyQavQmPMk0BycgHSA8pJ8ed6DQ/HsNhHu/3KFW75/gaq4KWRv
	fUtDj6e4UDclkXtaMItLecTS2tu5dzJ/byPINMIXHMKVVo9wwbPvEpKDDyEqwqYOiJXQS/vhYcQQN
	+WpKlVtd6awmLrGxQGTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr0Is-0002zy-Ja; Tue, 05 Feb 2019 12:58:18 +0000
Received: from mail-vs1-f65.google.com ([209.85.217.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr0Ip-0002zd-1r
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 12:58:16 +0000
Received: by mail-vs1-f65.google.com with SMTP id n10so2023565vso.13
 for <linux-mtd@lists.infradead.org>; Tue, 05 Feb 2019 04:58:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FWfvD1Vrxk/cmuFedqjklPkFZJWTQ5vjIDKtGx41uTk=;
 b=t6iGgUkfT31XS28dskwaBWEJYmQbyLxky7jM4/C2W1iXAsnnwthDr8pJIdlz6XxHMq
 Qd8mzsa7xTF9JnaccvErkrAW5ZsG1/Pz63/STXrxj0Df9xK3WlrNcb6xHELdteVM77hW
 HcbAd/rNvZZqo6PnM6s2Tn2DgltmZIE7+8bhR39u6i5xadKbMql1nClYqMC9PnUPpsmF
 9RMXDgxFuJqn0DoVd1BHURjwJLumNJF462H4TMriexcEkk4rhqi+n7YhzUr9pAuDmXHy
 orbSf4+tWanov1vvUunsCGRWuHVYw3LlQFGxah3gypBh0chUpOM6JVlL48jI7sqKyppH
 qKgA==
X-Gm-Message-State: AHQUAuYwpIvqL1uIhryq0jVQiRUN5qQtM1OJ7UrQtxbfww0zz4k2NZFm
 CPGDEtRBk1hAooNpBhbypeLoWL1/C7mqg1nSuhA=
X-Google-Smtp-Source: AHgI3IbhfKAnC2pJjnZw9ORcaLDXn8FGAUYu3jOGc6DVXSZkcI+s//zUr8BLzN9if5Xl+BPAwfOuT2DShvKIyYGm78s=
X-Received: by 2002:a67:c202:: with SMTP id i2mr1981933vsj.11.1549371493742;
 Tue, 05 Feb 2019 04:58:13 -0800 (PST)
MIME-Version: 1.0
References: <20190130115552.9610-1-bbrezillon@kernel.org>
In-Reply-To: <20190130115552.9610-1-bbrezillon@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Feb 2019 13:58:00 +0100
Message-ID: <CAMuHMdWpaWpRhe4Z=sg2sLcrp5_BSrdvfX2FXovZ1+XpMUGc7g@mail.gmail.com>
Subject: Re: [PATCH] mtd: Make sure mtd->erasesize is valid even if the
 partition is of size 0
To: Boris Brezillon <bbrezillon@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_045815_088856_9C219746 
X-CRM114-Status: GOOD (  14.16  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, stable <stable@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

On Wed, Jan 30, 2019 at 12:56 PM Boris Brezillon <bbrezillon@kernel.org> wrote:
> Commit 33f45c44d68b ("mtd: Do not allow MTD devices with inconsistent
> erase properties") introduced a check to make sure ->erasesize and
> ->_erase values are consistent with the MTD_NO_ERASE flag.
> This patch did not take the 0 bytes partition case into account which
> can happen when the defined partition is outside the flash device memory
> range. Fix that by setting the partition erasesize to the parent
> erasesize.
>
> Fixes: 33f45c44d68b ("mtd: Do not allow MTD devices with inconsistent erase properties")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: <stable@vger.kernel.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>

Thanks, that made the warning disappear.
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
