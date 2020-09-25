Return-Path: <SRS0=nuHD=DC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B68FEC4727E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 18:25:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 108E5206F7
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 18:25:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QjqOOWp0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYZyZw6q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 108E5206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hz5F7YgXxapo2VuDWkmwGTzAcsLAjhqJyFfi03UoZCk=; b=QjqOOWp00jBQkqXPcLTFjO5aL
	pE79g8xyKKme3lg8bsqbHTKsJ9Q/R1bx7alG5HhZzAy9yXy3BVBLjogkDAbP6J0dwEJYeN17Qu8K/
	Af61Szzsw3D4nScgk4tBlfsUA20Dp9o1fTRLczgjxxTWJ7RhcF65psx9Vj8Wd0OBwpAci2uBkyZuN
	wNLDFCDTrdc0VmIVOg83kQ0ilUn/XUB8mTbqRPMAVCg5/+he+HfL7p6dgBqefaU7mP0eGCNDm1+7a
	P24utQ5jTDdp43cUtARg94pfBtQxSiI/uW+wr11XcKjeNDB98BgjGWs/o0nxXm+yT8aJOge5SRqQ7
	C1KgUpbmw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLsOa-0004RG-AX; Fri, 25 Sep 2020 18:24:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLsOP-0004Ql-TB
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2020 18:24:26 +0000
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7F6A023718
 for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2020 18:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601058264;
 bh=3+UjR32phag7o0qtGDIn18Bhp3Te2gJhkXo8qfae49I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gYZyZw6q1BO+3QxLi6Yhxa52YdvWOGP6Bwynz1IgdeP4AoQ8O9LACjSjJq9kUdPAQ
 2A9gwH2FC9gAFJD9v+rsBafSLadQqFs4m/Wfn1Ng9uYeWn8xQWdC+TallzF6jFqiCs
 Engcd77zB1U31bxCR0JWjkmiWHv0KP9rxXqaifVg=
Received: by mail-ot1-f44.google.com with SMTP id m12so3225171otr.0
 for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2020 11:24:24 -0700 (PDT)
X-Gm-Message-State: AOAM533ISx3HktXBq8yus3Frfp4yxeNuTDfA3/V1w6ijkplAbGGH0vSX
 T2wOfd/rOyo4PmHqUhnNYz01xvQrQjL0IF69zA==
X-Google-Smtp-Source: ABdhPJzHcLMNb6xVVlodE5OyqgAY19wIaDZiXPKwHOA40n53jDTNUtNA3wjcwjLHWn8v5JC2xFhuQcSVkjaR6rPxT5I=
X-Received: by 2002:a9d:6b0d:: with SMTP id g13mr1190401otp.129.1601058263764; 
 Fri, 25 Sep 2020 11:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200920095724.8251-1-ansuelsmth@gmail.com>
 <20200920095724.8251-4-ansuelsmth@gmail.com>
In-Reply-To: <20200920095724.8251-4-ansuelsmth@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 25 Sep 2020 12:24:12 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKhyeh2=pJcpBKkh+s3FM__DY+VoYSYJLRUErrujTLn9A@mail.gmail.com>
Message-ID: <CAL_JsqKhyeh2=pJcpBKkh+s3FM__DY+VoYSYJLRUErrujTLn9A@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] of_net: add mac-address-increment support
To: Ansuel Smith <ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_142426_009358_ED04A57F 
X-CRM114-Status: GOOD (  16.00  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, netdev <netdev@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Sep 20, 2020 at 3:57 AM Ansuel Smith <ansuelsmth@gmail.com> wrote:
>
> Lots of embedded devices use the mac-address of other interface
> extracted from nvmem cells and increments it by one or two. Add two
> bindings to integrate this and directly use the right mac-address for
> the interface. Some example are some routers that use the gmac
> mac-address stored in the art partition and increments it by one for the
> wifi. mac-address-increment-byte bindings is used to tell what byte of
> the mac-address has to be increased (if not defined the last byte is
> increased) and mac-address-increment tells how much the byte decided
> early has to be increased.

I'm inclined to say if there's a platform specific way to transform
MAC addresses, then there should be platform specific code to do that
which then stuffs the DT using standard properties. Otherwise, we have
a never ending stream of 'generic' properties to try to handle
different platforms' cases.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
