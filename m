Return-Path: <SRS0=gyp4=UW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97E5C43613
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jun 2019 19:57:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F77420656
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jun 2019 19:57:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TguMGqPL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Rz2q9KhQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F77420656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b+GNGEkJg0rt+R/9n0dcaDmcqQEm4IUld7ry9VdXVCk=; b=TguMGqPLY5jJC6
	UVSgff71REvv7u2Q1VaA0UuxgN92y8161sXal+oEhgYNfaBlrZSUm9t8XdTZ8xuD1vFM5ApTNSBfr
	fhoZHr3aiZFQjU1c54SAGpnYCWTsSOJMU5E9ujtv1zrMNOOPrnph/pz/LQ6BTUwhSTH6jY3Nmvmxc
	9127LcL54jx76sq9gROgl9iRqYw+gpWHWB9QfsYiT56lhyFPN/ZQPt+8XbzFfbNSbp1qCcFVCboyp
	JtYPKZx56x9oZuM7EPy6rdyZlJWLQalKqYDOA5RysLZKS+ZoRBQQhnNE6uT15QTziRHelkqcXCEDT
	+7zLeumEbl1XdmCOqVdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hf8cP-0000lK-Fm; Sun, 23 Jun 2019 19:57:41 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hf8cN-0000ka-NK
 for linux-mtd@lists.infradead.org; Sun, 23 Jun 2019 19:57:40 +0000
Received: by mail-lf1-x12e.google.com with SMTP id j29so8443881lfk.10
 for <linux-mtd@lists.infradead.org>; Sun, 23 Jun 2019 12:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kKmVFzqBXK+GaVdzbiSELgS3ojJ2NVFMbz+vkTWfHRs=;
 b=Rz2q9KhQAaU4wQAaAyBRxr1GtIDmt5ywnJ1OzWnNslbc/PqtxyCMZ7TxnmAG67xBak
 Bvho/gIPfGuu+t0WNUDbhb1+FSL0rptTM3lApbL41cfKeMtok8SA2ERB6kUM73JJ6OLH
 4xLEmJ2rY8O0GokEa6QkfJtJxRyj63IlbIeuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kKmVFzqBXK+GaVdzbiSELgS3ojJ2NVFMbz+vkTWfHRs=;
 b=Y2BFslNMHiaVWEp/VPntkNkE5tyV3YS+5F/iN3AgAh1/zf/6F6i58DOyyDWIrt6+lU
 eEj5Rff66DeFCsKnd14zlWbhPAJiyFHtr4qcoJRRuwwoLewt7V5+mdy34muS1QO106rx
 3qC7o0I2fCaMhHT2UOHEvdn1O3WQrPRI93dUA4TFQozIrvhD1UtaHdaV4W1Lk8AowKSW
 wlSkbJ7h1H5OAYKSGnkB9tRbLOCugX0yNQmKzoQvZxrKt0/SSDUoi6D5rkZ1toSWqr7A
 ovq/gUBxD11BFhqNCghZ4Or0TTNx98RMFV3HqtSlpP4g3Vv79N/4WAWHFh/ELjYQLoCr
 cDqA==
X-Gm-Message-State: APjAAAWvc5Gr9DbB/Ao6yyFS+sJJLWjqV0RN7PzwRx1mKTj8hwkzCKZ4
 vF5wTGneC9qnioeLSv1KVijNeLhPZ+M=
X-Google-Smtp-Source: APXvYqyGyqqXzgSfpkNPzRiMC1cgZno7OdeTUfw43/gkqD3ZfZivRW2XJc6XkonxcuXyxNz88zMfPA==
X-Received: by 2002:ac2:4891:: with SMTP id x17mr23857350lfc.60.1561319855517; 
 Sun, 23 Jun 2019 12:57:35 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id o11sm1259260lfl.15.2019.06.23.12.57.34
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Sun, 23 Jun 2019 12:57:34 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 136so8457608lfa.8
 for <linux-mtd@lists.infradead.org>; Sun, 23 Jun 2019 12:57:34 -0700 (PDT)
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr19768827lfm.61.1561319853859; 
 Sun, 23 Jun 2019 12:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190623211004.6743a8dc@xps13>
In-Reply-To: <20190623211004.6743a8dc@xps13>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 23 Jun 2019 12:57:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgfDU+o1vycUdE7Xp40o=eoFkSkQ9DBHR986iwT-5LDXw@mail.gmail.com>
Message-ID: <CAHk-=wgfDU+o1vycUdE7Xp40o=eoFkSkQ9DBHR986iwT-5LDXw@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: Fixes for 5.2-rc7
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190623_125739_766117_D308C666 
X-CRM114-Status: GOOD (  10.76  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Jun 23, 2019 at 12:10 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
>
> Hello Linus,
>
> Here are two MTD fixes for the next -rc.

Hi Miquel,
 I don't think I've pulled from you before - which is not a problem
per se, but generally when I start pulling from new sources I do want
to first see an acknowdledgement of that from the people I used to
pull from.

Yes, you're in the MAINTAINER file, but this is more about me just
wanting to make sure there isn't some political or personal thing
brewing - and if there is, I just want to know about it.

And it's possible that Boris or Richard already sent an email with a
heads-up and I just missed it.

                 Linus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
