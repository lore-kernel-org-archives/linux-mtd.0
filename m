Return-Path: <SRS0=6QP0=LQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A819CC2B9F4
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 09:27:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62EBA6044F
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 09:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62EBA6044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fMdc3H7+MyzVqevLws62VnJUP2i8qSZV73ccfL5C0j0=; b=qCVRfmHBKCZlDG
	r/VheJunbXWtYisFrxP6BcJPqOc6kCggh9X3UwzXEw44VV/Pj3q6FK0Prl71oJeqZnBv6F1Z3nMzN
	z6YlcXATTpXk0xoIQrcB3RCRVMkTJD+u93N8hmutkkUT+hLlaAnC4fTr+p+TcRhcgku2sFoBxRVvl
	cV7/oQe8y+IWG6rmQSaNFGnvcF1lloHz1Egx//QDR/7kUE3w4zCU2flznQ9i4thnS0zxU1k66VWRO
	5NDyfYp3BNdnzJkuQLUrHta9qvOKHq0BcFmyaEJVkLQC/0nnufEwwNVnrQ0b0v52VqtyO4SsFJq9p
	JoXDLJzwZOZf6b1bDvTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvcgU-006Ohs-39; Tue, 22 Jun 2021 09:27:06 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvcgP-006Ofa-Od
 for linux-mtd@lists.infradead.org; Tue, 22 Jun 2021 09:27:03 +0000
Received: from localhost (80-62-117-165-mobile.dk.customer.tdc.net
 [80.62.117.165])
 by first.geanix.com (Postfix) with ESMTPSA id A441B4C2DC9;
 Tue, 22 Jun 2021 09:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1624354016; bh=CI/UIeqUzxTnGGW8cnJKPUsCdom4VckZy8Qh8chQnF8=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To;
 b=ONk7l8oSYZdBJtfZcOBaGgh8J2uvn8SoApvaFm6j6/VrjaU9Y1FAYct/7iq+ouc2V
 fMxHVpPXcwm0IScSLwbe0uKPdQswxYmE3MLb8m0lj3xUqPZSDR4WMrIOk/4hrfU0at
 Qj6Z1mH3vHdq9VJ8U47lZH05zhjVXk/ppbOBQ9m3lT7BhGA/3goUkEZsRpYXzQr3/b
 VDZz97Og0dFJUEjwbwzUWVF31bg2fILe2NK6RuDURCc240FcQ2IZJJGUZmtTJmQljH
 6D2AZnJqYn5xKGqadie3w4V1QjFq5h4UbEorDvjMxrBdTORzqAdRhdVE5U3AEQtaq8
 15pExHBguy8xg==
From: Esben Haabendal <esben@geanix.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-mtd@lists.infradead.org,  Frieder Schrempf
 <frieder.schrempf@kontron.de>,  Boris Brezillon <bbrezillon@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,  Michael Walle
 <michael@walle.cc>,  Pratyush Yadav <p.yadav@ti.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC 0/3] mtd: spi-nor: dealing with reused JEDEC id c22016
References: <20210621152320.3811194-1-linux@rasmusvillemoes.dk>
Date: Tue, 22 Jun 2021 11:26:55 +0200
In-Reply-To: <20210621152320.3811194-1-linux@rasmusvillemoes.dk> (Rasmus
 Villemoes's message of "Mon, 21 Jun 2021 17:23:17 +0200")
Message-ID: <8735taxna8.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_022702_518380_88539D99 
X-CRM114-Status: GOOD (  22.98  )
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

Rasmus Villemoes <linux@rasmusvillemoes.dk> writes:

> We use the Macronix chip mx25l3233f in a number of
> products.
>
> Unfortunately, it has the same JEDEC id as another chip which is
> already listed in macronix_parts[]. Since that other one does not
> support SFDP, and its data sheet warns against issuing commands not
> explicitly listed, we can't just do RDSFDP anyway and decide that it's
> an mx25l3205d when the chip returns garbage.
>
> For lack of better alternative, start allowing multiple entries with
> the same JEDEC id in the parts tables. That allows a correctly written
> device tree to specify the right chip, without being overruled by the
> "JEDEC knows better" heuristic, while being backwards-compatible (as
> long as new chips with recycled ids get added after the existing
> ones).
>
> While a step forward, this isn't quite a complete solution for our case:
>
> Some of our platforms are based on LS1021A, thus using the
> spi-fsl-qspi driver. Back in the 4.19 kernel, when the driver was
> fsl-quadspi, we couldn't get the flash recognized unless we
> monkey-patch-replaced the mx25l3205d entry with the mx25l3233f one
> (i.e. added the SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ bits) - we'd
> fail in spi_nor_select_read() because
> shared_hwcaps&SNOR_HWCAPS_READ_MASK would be empty. In contrast, with
> current master, the chip works with or without the third patch in this
> series, i.e. whether it is detected as a mx25l3205d or mx25l3233f. But
> the read performance is ~3 times worse than in our patched 4.19 - I
> haven't quite figured out why quad read doesn't seem to be used or
> work.
>
>
> Rasmus Villemoes (3):
>   mtd: spi-nor: core: create helper to compare JEDEC id to struct
>     flash_info
>   mtd: spi-nor: core: compare JEDEC bytes to already found flash_info
>   mtd: spi-nor: macronix: add entry for mx25l3233f
>
>  drivers/mtd/spi-nor/core.c     | 18 +++++++++++++-----
>  drivers/mtd/spi-nor/macronix.c |  3 +++
>  2 files changed, 16 insertions(+), 5 deletions(-)

For whole series:

Acked-by: Esben Haabendal <esben@geanix.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
