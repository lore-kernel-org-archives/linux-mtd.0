Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8630BC31680
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 18:54:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56DF720861
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 18:54:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r9C3d5wv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qpIyXnjt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56DF720861
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=clvoZ5C6/45L/rISTThSSjcSCgUN/xzviZ2d7RYzXIs=; b=r9C3d5wvExshTr
	qV4Jxmgj+d2MnQ/Ug3jD5YNu0uadC8t+iy7OkXdL8Unbw6vSlhJXBDAx2zEPdmxAyqY/NpqEVeFMD
	m24scoDOfC0ufLWw5DJeW5qAjRrIsC9yE5P4aJrxtRWQEso9UaavU8pK1lU8aJk+BHFDaIRojPTw7
	v3kELYUElB+VJHLO0yYmuocmrPvO4nsTZFxsObECst6Ta/eAwGfCwMaT9uoMLP2rmVZsPORlFJwb4
	DeCrEGNyYIEYoRP+7Cj36KpbRh5/G8RWPGm3JRAorrzIxWne/wpjwKlk9Zab5zIcK0G5zESMkJEt5
	rxyohw0KtioSCUxl4LCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glei7-0001i4-Fj; Mon, 21 Jan 2019 18:54:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glehy-0001XK-3b
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 18:54:10 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3117C20861;
 Mon, 21 Jan 2019 18:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548096845;
 bh=hq+FdVIPwR3zOZB3uDNDr9SstA4vB1P6EsPzIIFlyPE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qpIyXnjtokVHLfibtrZIn4JYHUK+5nJ3SncSX+DtnA92E6HIUP+7pwaxeZNagpz+b
 APZVWwkNufJywCcbKgRkcfbeTWJatblH7dVtU4znfOdcGQH+EaDH/smYLB7WrPSP/w
 PFjkNHRmXOl8PXicW5whoRqsxI/ZWoP+ErGzqcYg=
Date: Mon, 21 Jan 2019 19:53:54 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] mtd: rawnand: check return code of nand_reset() and
 nand_readid_op()
Message-ID: <20190121195354.788199f5@bbrezillon>
In-Reply-To: <CAK7LNATUpyfnicBiSdL49dsFnvo+M=N9X-wY-J0efnRc-1_0gA@mail.gmail.com>
References: <1548075934-19963-1-git-send-email-yamada.masahiro@socionext.com>
 <20190121141403.20f6107b@bbrezillon>
 <CAK7LNATUpyfnicBiSdL49dsFnvo+M=N9X-wY-J0efnRc-1_0gA@mail.gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_105406_609305_A80DF8B3 
X-CRM114-Status: GOOD (  18.49  )
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
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 22 Jan 2019 00:57:43 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> 
> Maybe, is the following better?

Sounds good, even if the original commit message was fine too. I was
just pointing out that nand_scan() should, when possible, be passed
the real number of CS lines connected to the chip instead of the max
number of CS lines supported by the controller.

> 
> 
> ------------------>8-----------------------  
> nand_scan_ident() iterates over maxchips to find as many homogeneous
> chips as possible.
> 
> Since commit 2d472aba15ff ("mtd: nand: document the NAND controller/NAND
> chip DT representation"), new drivers should pass in the exact number of
> CS lines instead of possible max, but old platforms may still rely on
> nand_scan_ident() to detect the actual number of connected CS lines.
> 
> In that case, this loop bails out when manufacturer or device ID
> unmatches. The reason of unmatch is most likely no chip is connected
> to that CS line. If so, nand_reset() should already have failed,
> and the following nand_readid_op() is pointless.
> 
> Before ->exec_op hook was introduced, drivers had no way to tell
> the failure of NAND_CMD_RESET to the framework because the legacy
> ->cmdfunc() has void return type. Now drivers implementing ->exec_op  
> hook can return the error code. You can save nand_readid_op() by
> checking the return value of nand_reset(). The return value of
> nand_readid_op() should be checked as well. If it fails, probably
> id[0] and id[1] are undefined values.
> 
> Just for consistency, it should be sensible to check the return
> code in nand_do_write_oob() as well.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
