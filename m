Return-Path: <SRS0=+Ogn=6P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0ADCC4724C
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 09:37:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A06732076D
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 09:37:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UR73NRp6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A06732076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xFus5FzaZcUazDP2jeEGtUWn4IMWhLm8Wm0UrOkWe6E=; b=UR73NRp6W6FZpG
	uJ5laiEVFfKRWEYig53DU84MHUTysBf1Yz5GR5vaZiG4tO0tYfMH+tSD66T7z3ZVjS/3oyQCnksWE
	lX8c3ZPYbY2OHEmGGEEkR7G+YHSIPqCm6Z805Gkqwk/gYhLqEHnHAbw/pEU/OzJF1FM1P6bI97au7
	sBJlZbjx8zI0xS2GnaHgV4I+8c4W1O2JN6Xu+gyB8gWcaKK2L9+4qRbhS+ZlJiArqPzpwZjp+Deug
	bS9bSYHC8FNaQWrnLV1BKTC95GM1HaZKjlDB7bgGbQB6b/v08QNqu7lTWz3Jn/fxl2b403PjP+CbU
	DdQ5fv6AM+gWr3xV8Vjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUS6I-0004X8-CU; Fri, 01 May 2020 09:36:54 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUS6F-0004Wa-B5
 for linux-mtd@lists.infradead.org; Fri, 01 May 2020 09:36:52 +0000
Received: by mail-oi1-f194.google.com with SMTP id c124so2198016oib.13
 for <linux-mtd@lists.infradead.org>; Fri, 01 May 2020 02:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QNmi3J1oG0BHibSA3NPDSx73IEYskXDbHrY+NDqOrXs=;
 b=pTdapfRWlqxtSxO0+FxPG8tij2YFoFK6S5pu6j1F7wMNxeGjVXdfUsDJ48sg9Bj/P0
 7CpqGG+fhxWZ5do3ghJJmDXeNyywoW69zsE/yrG9Kq6nvTdzRU+PD+lb9uUEZDFUu+cE
 dJX9k5Yuf246nH3F2gLqdFiGY8QLxEMu2/6nI+rRQDpkRt/Xoa3kxJIMhZ94O/jLJb4h
 pRRImkVBmsb/Aq7Ywje5sSlhZm5U95Fi7x0bxmkREdN5UDvGQO56JlbhWsFqmJ5j3bso
 wLHxl0XRFxTbYULD+rfEiVXLuERyjbOtHporgZvGVmnca7ZmGON6huqI2kkjkUvYpRBN
 wiKQ==
X-Gm-Message-State: AGi0PubdH3Rcc/bjWFoagB0c5KlqMmrlI1WAA/k/YhtcBqc5KMFqlAz9
 XV8KL3zJ9wKn0ZMJ+Eu5koddW1fpiU7hNZzm6p8=
X-Google-Smtp-Source: APiQypIxuQX0hYIBKT5wCQqTw8uzBxU4StAmBh2v/MqxavCTiCkalP8HD2pDbGBi6s2kyN5W4y2cYwdW/AXBft42Weo=
X-Received: by 2002:aca:d50f:: with SMTP id m15mr2464791oig.54.1588325810218; 
 Fri, 01 May 2020 02:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <812e6e58-d13f-3f44-5f55-22266b690c57@cogentembedded.com>
In-Reply-To: <812e6e58-d13f-3f44-5f55-22266b690c57@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 May 2020 11:36:38 +0200
Message-ID: <CAMuHMdU5zcmBuWKVxEhF1G1uYHS0iVKUtuWURX68meppMKWHeA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add Renesas RPC-IF support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_023651_381521_7AC14923 
X-CRM114-Status: UNSURE (   9.94  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-spi <linux-spi@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Mason Yang <masonccyang@mxic.com.tw>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CC marex, linux-renesas-soc

On Thu, Apr 30, 2020 at 10:45 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Here's a set of 2 patches against Linus' repo. Renesas Reduced Pin Count
> Interface (RPC-IF) allows a SPI flash or HyperFlash connected to the SoC
> to be accessed via the external address space read mode or the manual mode.
> The memory controller driver for RPC-IF registers either SPI or HyperFLash
> subdevice, depending on the contents of the device tree subnode; it also
> provides the abstract "back end" API that can be used by the "front end"
> SPI/MTD drivers to talk to the real hardware...
>
> Based on the original patch by Mason Yang <masonccyang@mxic.com.tw>.
>
> [1/2] dt-bindings: memory: document Renesas RPC-IF bindings
> [2/2] memory: add Renesas RPC-IF driver
>
> MBR, Sergei
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
