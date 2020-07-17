Return-Path: <SRS0=C/uX=A4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A622C433E3
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2020 18:01:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 559402067D
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2020 18:01:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="shOOZSew";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pensando.io header.i=@pensando.io header.b="sfyOi+iq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 559402067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pensando.io
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=miTLm/O31iC8gkIrXkdPrkv7KsNvVrxOE7PcHIiGfUM=; b=shOOZSew73rRY4qKz452bAXdk
	HjGcQ8T/ZuUKJA3aTOOTFhf183Mwdu/7uyzcgwqoAJmY5AUgKvSONaCvHVs/Ig4WXZyh8zd6X8RlR
	Zw06XLuxTBkrqRizfN7ltEkTY53vS5kqfrdhR0o9yNqGy9zO7+zZt6c9LZRwdpdd68jFzTeGJLrFj
	cACMO4ha6j9OhCj6is0xaQZ+KSaKBVNDv2qfhXqkBPD7D7SWHEZVpZ5HIPqe9KplZ9XG2ZCDaRxWH
	rPniy6FNIskyGfddUwIXRLXzWXFxwGygdxfcVPFuf/gbXyTd3HY9CeVzos7AfAlMDPX/6w5DaSXQs
	Ze9FOhuoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwUeq-00015m-Li; Fri, 17 Jul 2020 18:00:28 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwUen-00014m-4n
 for linux-mtd@lists.infradead.org; Fri, 17 Jul 2020 18:00:26 +0000
Received: by mail-wr1-x444.google.com with SMTP id f2so12038350wrp.7
 for <linux-mtd@lists.infradead.org>; Fri, 17 Jul 2020 11:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pensando.io; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+4JIU8XGS69uByS0k2FjIeZPG2crFWEaCrGxqaFWIpo=;
 b=sfyOi+iq8OSWUNLkOIUXX1MywktMpZWuoSYzq9/gxcqz9g5HyIRQGwafAZj06cp3G4
 DM1HlFvrJukV4KPbahLoGtytUqSIHsi/ade19xvNBlWM7V3g5bf43kehW2COVmBF4HkB
 770dA5DwFJCtmmzuLOLfnvW6d+qpPUm3c/5r6IWcq7q8N5jRuU8Qp3ETHLztyO54eMyF
 bovuxaZp8qnFGkISJ7hTAisnnAnuu54PTd6HGpDFBHlXrMFQuUTtf4W9o0uBansFNUKn
 Rt91Y29hj75h1SiouIXGO92NbrI5D/NhGxVoywG2D9reyNYosItUp6gxj4LCvcPZ1NBi
 osDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+4JIU8XGS69uByS0k2FjIeZPG2crFWEaCrGxqaFWIpo=;
 b=Jk4+YHZNpVZMPx94c0SQ/CxnZz2nuCmWutO/IS0Ndw8yOKoNJHmGDv6iEPkg1up1aI
 /nXQc5vA60n14Ft51H8t6nf/jdwL0ih4I6lQ1VtwhtsA1ZXMZ3V/372OEYKqCh6rh5ZD
 cAYLXhQKkgNoT531gUmDQarepa5yAV1aBWGbouD/VvjfY3F5meATglm2ai1mE5DZrGNO
 GlT9zP65KEVymG8H+skHhn61M31KBcCU8iaoRQcbig1aMxRi5gX9owNcMm5f8eaM0Y4z
 VJtmnlrTmFkF3mS31ApBHjUQh2Ly8mS9cJqOJXNaEHfulCwh5VxTF7IsJ+Cs6pQqkrWI
 yDsA==
X-Gm-Message-State: AOAM531Btb3RiqMHJg2UPl1j+/GI7sXWyhpNpSstJlxgL3VhyiEHLucC
 yuPiE/ggb4sZrtgVoVHWG1c4BjXrWGwiEQRuSTlftAZ7
X-Google-Smtp-Source: ABdhPJyIKfx0f1QqXpKHZFPzjWyl9MVNKIXkv0Y3C+MMxKNMWtHMpE08SYzRCmJpfIc4m/+avJqCbrCFKT7EXzDCSO0=
X-Received: by 2002:a5d:4649:: with SMTP id j9mr10945003wrs.270.1595008823994; 
 Fri, 17 Jul 2020 11:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200716211631.38949-1-dac2@pensando.io>
 <20200716211631.38949-3-dac2@pensando.io>
 <1724beec-aceb-b6e9-1288-da340d3fd43c@microchip.com>
In-Reply-To: <1724beec-aceb-b6e9-1288-da340d3fd43c@microchip.com>
From: David Clear <dac2@pensando.io>
Date: Fri, 17 Jul 2020 11:00:12 -0700
Message-ID: <CA+nMikFFaxZxNP_d24+YGWfWG1yAV41FRyxQn=gweY0-T3aV_A@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Support SPI_NOR_DUAL_READ on Micron
 mt25qu02g.
To: Tudor.Ambarus@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_140025_479494_7AAED5A9 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
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
Cc: Shannon Nelson <snelson@pensando.io>, linux-mtd@lists.infradead.org,
 vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jul 17, 2020 at 3:33 AM <Tudor.Ambarus@microchip.com> wrote:
> On 7/17/20 12:16 AM, David Clear wrote:
> > The Micron mt25qu02g supports both x2 and x4 transactions.  Add the
> > SPI_NOR_DUAL_READ to its spi_nor_ids[] table entry.
>
> In spi_nor_select_read() we select the fastest read. Since this flash
> supports Quad Read, the Dual Read will never get selected. As of now,
> there is no benefit in adding SPI_NOR_DUAL_READ when SPI_NOR_QUAD_READ
> is specified.

Ok, I've got this now:  I went back and did some more testing with different
spi-rx-bus-width properties and I see it's redundant to specify both DUAL and
QUAD in the flash description.  Thanks for pointing out my error. I learned
something new.

I withdraw this patch and will work on getting the Macronix patch cleaned up and
tests documented.

Regards,
David.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
