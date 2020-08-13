Return-Path: <SRS0=wA1i=BX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9781EC433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2020 11:48:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60FCD20885
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2020 11:48:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XkBEzEAE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CP/ObbMc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60FCD20885
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gYsqwq36nvBN0t3mnjkBD8RQvFgsCjnLogCMYppoUMg=; b=XkBEzEAEkd2WTsWyqpLgsUnxW
	fh8vfeelGWsQgh6vEM2pAVyyg12k7hzSebTIZ5BxC7xm0yb/mTr72WqFVfLz9qJygR/mKRrtxpx0J
	I+fbW47u/59LkQJSfenOMmwxfWgs5jIWPH/FFBd4mZZHxKppUg41u/zvKYQrlLAI1ydSuB1SIRxvh
	AAu0pUwWXxMcJZvQYrkxR6pshvhomonmOhRnao0CUK0ayyo4I6EsWv+dJSVSBkbfmC6RhDJQujXxM
	kZsH/LD5dX3rqetAtwS3gfiAfwNafmCjTGK3ydEF8wB/tLsFPzZAyXIc+GUjQaybRs2ChtLKo66Wb
	r8O1CAgHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6BhZ-0005u1-8D; Thu, 13 Aug 2020 11:47:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6BhX-0005ta-3V
 for linux-mtd@lists.infradead.org; Thu, 13 Aug 2020 11:47:20 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B452120866;
 Thu, 13 Aug 2020 11:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597319237;
 bh=st+ZZPEZNLMRcB4dWVw2s7KfAWhEwQAt4jahZwwVrZ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CP/ObbMctMPM3r9rVqSbqkqy4LHRQVBbqKV1BxOr9spCYysSMcmVJrxLzyjkFNWvA
 P/ccRpJBmfKeZuLE+Wwle5uIOAZrPcmzMeigqVgnTh3ZUtJ8ocVgr8mIWRbhwW7Wkc
 Py30Ty4Z3yBW1lvJJZ2VKdfgUdPyPCEP+ioOchtc=
Date: Thu, 13 Aug 2020 13:47:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Gutson <daniel@eclypsium.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Do not try to make the SPI
 flash chip writable
Message-ID: <20200813114726.GA3852402@kroah.com>
References: <20200804135817.5495-1-daniel.gutson@eclypsium.com>
 <CAK8P3a0_fJ0BfD5Qvxdo0s7CbjPWaGA8QTgYhbXR=omafOHH4Q@mail.gmail.com>
 <CAFmMkTHEm8k+5GZkVJbDZMEhMwpsqVKRb-hGskSpBstdLRuFyA@mail.gmail.com>
 <CAK8P3a27bTYyn3N+tX=i_6f4KrQkOmkUA1zUQfvCW7qw6smSkQ@mail.gmail.com>
 <CAFmMkTF9eVm0tpOKEy2rzdX=Scr3RwqHDFy_i24R3F5ok-4=eA@mail.gmail.com>
 <CAK8P3a3mf8_Y4DWe3WuBO-Xo0N4Jj=-rrtFzD6w0TriGZPu1_g@mail.gmail.com>
 <CAFmMkTFzmC=aY0gR6urLu-8Oq8aeHBUWi-TodG8XhXKCcC057A@mail.gmail.com>
 <CAFmMkTE+2Qxo43bZkwCszEYbXFV22YdpLJD40gB6LgvnPbvdSA@mail.gmail.com>
 <20200813090105.GC3452881@kroah.com>
 <CAFmMkTFgjW+9gNfx=2SU7B0foww=SLiiyVi+P-hZpEFDbMTf2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFmMkTFgjW+9gNfx=2SU7B0foww=SLiiyVi+P-hZpEFDbMTf2Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_074719_267173_3E3D06E1 
X-CRM114-Status: GOOD (  14.35  )
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
Cc: Richard Hughes <hughsient@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Arnd Bergmann <arnd@arndb.de>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Aug 13, 2020 at 08:42:57AM -0300, Daniel Gutson wrote:
> El jue., 13 ago. 2020 6:00 a. m., Greg Kroah-Hartman <
> gregkh@linuxfoundation.org> escribi=F3:
> =

> > On Wed, Aug 12, 2020 at 12:41:35PM -0300, Daniel Gutson wrote:
> > > ping
> >
> > What does that mean here?
> >
> =

> I didn't get an answer from Arnd Bergman who expressed concerns. I want to
> know if my answer was enough or there are more potential changes I have to
> do.

No need to wait for anyone, it's not our job to always respond :)

Take what you feel is correct, fix up your patch along those lines, and
resubmit, that's all you can do.

good luck!

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
