Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FEE9C433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 21:58:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A28B2071E
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 21:58:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UX5na0sE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A28B2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VIUaD4+o+ocLfZALkqH1wKl2R1P89KLVY8H+mKZvN7w=; b=UX5na0sEBU5i5kemTjU8NaouP
	J4PFHyD3B6EIIfGdbE7LAZirI6O5CHM/zKr8mpk+hbSSbUWKEqwmjL3x5a5kzbW1vrJi51fQsgU4q
	809oEURKs2Bt8l6xLAAZEeexM23eiIJ1vcP307gJvVXJlDy4xxKzTXXAzh+dskoDi6phdcXtjEXuk
	B3zEWeJlCtd0N99OKi9JrnHglbkfJ8uK6gd3P27C5mLl0FmU1GLwGLxVGR4zjfB3ygvA8gMr+e686
	68/UjxuS/4H63/05S2T3E+dmgVnEyte6DyHL5VGS5mdVqDG56rK1GzvVtImCSDSkV2Mlw75c/kxeq
	+bQ4qdVCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAgwW-0000E2-27; Tue, 25 Aug 2020 21:57:24 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAgwT-0000De-Dg
 for linux-mtd@lists.infradead.org; Tue, 25 Aug 2020 21:57:22 +0000
Received: by mail-il1-f196.google.com with SMTP id t13so68149ile.9
 for <linux-mtd@lists.infradead.org>; Tue, 25 Aug 2020 14:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GjO9kVR66d1g6PuKVDC5MRmQctTcbYaJo56NTkeAqjM=;
 b=UJMtj2jYfViWUdGuWZP5GrShIHdDxHuOvBqDUVtcdcxQlLpiCxIzJNbyYXnsK+rWcm
 m/5GyVTNuuMvm9mKoNVNNxI5TRmGjHN4hfGlymmANQ+L03NOg/ub8RGXnQil0RSQlFy4
 9eFZfpVq5oJaZC41F3R7OUcsrMOwkIXp2carzfsNfdLJKYWNEM+KXeoh2g4dp+mz9uwv
 An7+KJ3LzXMUrB6mxXDQqvu6VlDE5Y588QIi8FfWtvfh2WSX97i9xZ0XDAMykK196f03
 x9S/aU2giE0AhNXv3FblqVxwJ8sg755SsR4zfzPgVbBmAk2AZs3SH7L/Tk8ZWUwYMHex
 cgeA==
X-Gm-Message-State: AOAM533eZjxj4TsSRUOUxuq3fXWBZ76IDqWhcV0KYepRcSogw8kxcNvj
 4va56ARNCPkzQLFqnWt1/5E7jy91cpD2
X-Google-Smtp-Source: ABdhPJy82N7dzwGaEQHw3zZQSbxNrrPETtjhHR6HpfXF4h+fMyTLd9vaf2b94cWGuWBfG8iq+fOJHQ==
X-Received: by 2002:a92:aa94:: with SMTP id p20mr11099726ill.266.1598392640682; 
 Tue, 25 Aug 2020 14:57:20 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id t88sm203330ild.8.2020.08.25.14.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 14:57:20 -0700 (PDT)
Received: (nullmailer pid 1410297 invoked by uid 1000);
 Tue, 25 Aug 2020 21:57:19 -0000
Date: Tue, 25 Aug 2020 15:57:19 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: mtd: spi-nor: Sort list of support chip names
Message-ID: <20200825215719.GA1406172@bogus>
References: <20200819124004.19728-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819124004.19728-1-geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_175721_512332_00217F73 
X-CRM114-Status: GOOD (  13.76  )
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
Cc: Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Aug 19, 2020 at 02:40:04PM +0200, Geert Uytterhoeven wrote:
> Sort the list of supported chip names, using "sort -V", to take into
> account both names and numbers.
> 
> This makes it easier to read and maintain the list.

Can we just do this when converting to schema?

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/mtd/jedec,spi-nor.txt | 34 +++++++++----------
>  1 file changed, 17 insertions(+), 17 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
