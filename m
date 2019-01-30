Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE6FC282D8
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 14:55:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5827020882
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 14:55:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SqbGrpcu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qYrh5hlh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5827020882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=je4OAxIkPX/O+NfbnfXRD0Yp6Oo0iFhji/bFbrlsTWI=; b=SqbGrpcuLuR8Z2
	ige8J01OuhVh/pUIG536B0l4cD/CkAydkdAdigwudh9fekOy+G6wLAdOT8e6lZ12aDJWpGoFdcOBZ
	/lKGYrwJHYw8ubZot2Nb8q090kI84WDZPNGxJgOvQ+hvmDwTcYXj+M4RMZKuvN5y9vDh4vUSAbzHQ
	kEBWSqPYkGjDuYFkf7ZhHZqWn0q3DXetmcmbze1iun6ztox0/4fZKKw3V3pnMsHi1U5SgD2uuWvi6
	5JSlx/xvX68t1bMXDOtcrzywyE9Gv0CPH/NlgmnspKk4ZUvTIgJC9MvdanGUJq1yRNI+uzk827IR9
	eIhw0Gl8rHqWLlZuwY/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gorHQ-0002CP-9h; Wed, 30 Jan 2019 14:55:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gorHN-0002C2-In
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 14:55:54 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 26E6720882;
 Wed, 30 Jan 2019 14:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548860153;
 bh=7G5T/KsM8XC2WiSdPDQavJovP2/zcBe1Um2PBAdj+3U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qYrh5hlh2iq0rXjNpgxGqwFfe9+n0Q19rZ5e+wKjmh5QIhPMaXcuVuFbSBk/3FuvK
 Fnvwybt9jQXos2z9hGma+lbCo+R52J7f1m/uVb3zORhES0EJtEUxNuLeQ2VnS9MZ90
 m57b0AF9SbonKN69LhTV7QsYGSpIO6amJ3+I6f48=
Date: Wed, 30 Jan 2019 15:55:43 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 0/2] eeprom: at25: SPI transfer improvements
Message-ID: <20190130155543.5ab749b5@bbrezillon>
In-Reply-To: <CAMuHMdVfVHUQnjwvFikqQJ8HBD+0A7DSCTcdDN4e7V4c=4Usug@mail.gmail.com>
References: <20190118140525.29189-1-geert+renesas@glider.be>
 <20190118230740.44239fcf@bbrezillon>
 <CAMuHMdVfVHUQnjwvFikqQJ8HBD+0A7DSCTcdDN4e7V4c=4Usug@mail.gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_065553_636825_C28E0055 
X-CRM114-Status: GOOD (  17.02  )
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Nguyen An Hoan <na-hoan@jinso.co.jp>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 29 Jan 2019 20:02:37 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Boris,
> 
> On Fri, Jan 18, 2019 at 11:07 PM Boris Brezillon <bbrezillon@kernel.org> wrote:
> > Did you consider converting this driver to spimem? Looks like the
> > protocol used to communicate with the memory resembles the one used on
> > SPI NANDs/NORs and fits pretty well in the spi_mem_op representation.
> >
> > By doing this conversion you'd allow people to connect an AT25 EEPROM
> > to an advanced SPI controller that does not support regular SPI
> > transfers and you wouldn't have to forge SPI messages manually.
> >
> > Here is a patch (only compile tested) doing that. The diffstat is not in
> > favor of this conversion, but I find the resulting code cleaner and more
> > future proof.  
> 
> Thanks, seems to work fine, with the 512-byte 25LC040 I have!
> 
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> I did notice that the first two-byte transfer (command+offset) of each
> message is now split in two one-byte transfers, though.

That's something we can optimize in drivers/spi/spi-mem.c if you think
it makes a difference.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
