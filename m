Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2197CF856E
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Nov 2025 09:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qQLE2NNd1YG/eLbK7WxlIYERA4vVAalTQC7UtIRGsoA=; b=MqutSiY8luX5Rm
	xTRrtOpea9c/QgyAy4iflXnFJaQjNRNptdqKszb2NmT0WBRx1/6eCDCSNCJ2q00Rg9JvDC0Z4Ilah
	YzV17tHNR2mmEV9c008qVSwZrfl7hhJQP0WDY1heLrZ9zclQIgJXGrsato3kYQFxDEyT+bwoak4uh
	kiEBFfLf6BGStjPVVqgtCRydST7h0h6w8GoFJ8bHLcCjn2u1wGQRmes48u4FJRnr9JmR9FJ9qyTQH
	0yN+Hw/FHRg/i/wctrcnx6l5weCrk6IN+128Is5OlqRqscUwov0OEHrcB6bewbc0iJwOMmHaW0/Gp
	O61Oay4vrcTXDmtlUbsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM0fl-00000006OmN-0R2T;
	Thu, 20 Nov 2025 09:09:49 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM0fi-00000006OkG-0fta
	for linux-mtd@lists.infradead.org;
	Thu, 20 Nov 2025 09:09:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=MIkMyymAp0Jp7wym9tGsnnLHss4tCJVvVVCKNCnFAKM=; t=1763629786;
	x=1764234586; b=f7hppZ7/YNHCZ95o8FOZGYOACUn8S2MfCItr5Tz8TibU5hPATUT6zPU+yfN8L
	GaakcWtUdnfTP3ryn/sWA5lh3LATbmJ0y4EO94Gdi65Kn0ZpDh2jPMizpk70NzbKhWljODjlSwPip
	y6nO9EH0dVxEmFeREAmOuj+xBenkyrjDPBAzOknOpjef7gyaBGO7OkaZ35I5AQQDQ7EFzltFppA6s
	yA2z0G4xzO8DIyBz666s+BdjuL1jU/SHhHEgP5N9Bcgevq7YLmsyy+DS8EalAPEQvz4s6jiJ/Hebe
	VFez4FP70kC6dUNengOc+ZMBSH0Tx0Mk6JqwuLUuKGf42CbiKw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vM0fZ-00000000lIM-2RK3; Thu, 20 Nov 2025 10:09:37 +0100
Received: from p5b13aa34.dip0.t-ipconnect.de ([91.19.170.52] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vM0fZ-00000001mug-1Jxq; Thu, 20 Nov 2025 10:09:37 +0100
Message-ID: <1c738766a6a7de25276b5d249398d4b891380655.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 0/3] mtd: maps: vmu-flash: Fix build and runtime errors
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Florian Fuchs <fuchsfl@gmail.com>, Artur Rojek <contact@artur-rojek.eu>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd@lists.infradead.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rich Felker <dalias@libc.org>, Paul Cercueil
	 <paul@crapouillou.net>
Date: Thu, 20 Nov 2025 10:09:36 +0100
In-Reply-To: <aR7Wvxzy0aiosDYK@lithos>
References: <20251117224408.498449-1-fuchsfl@gmail.com>
	 <6e2e9edcd9247c216bfe1ba637629a9a838f9fed.camel@physik.fu-berlin.de>
	 <5a4f8f1d543ef90aae3299b0f8803fb3@artur-rojek.eu> <aR46Kw5n4hIAZCcn@lithos>
	 <b5aa220dee9d7dcecea398ec0e33b4cf@artur-rojek.eu> <aR7Wvxzy0aiosDYK@lithos>
User-Agent: Evolution 3.58.1 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.170.52
X-ZEDAT-Hint: PO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_010946_349499_DC098580 
X-CRM114-Status: GOOD (  14.29  )
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

Hi Florian,

On Thu, 2025-11-20 at 09:52 +0100, Florian Fuchs wrote:
> I mean, I guess it's ok, as the code is like this for a long time, so it
> should be alright, when it keeps like this for a few weeks now, until an
> extensive fix. I just sent it now for a gradual improvement, in my
> opinion, as I need to invest a bit more debugging for the maple
> misbehaviour than for the obvious build breakage.

Thank you for your patience. I hope that you don't read Artur's recommendation
as a general dismissal of your work because it's not meant that way.

It's highly appreciated that you are stepping up to work on the Dreamcast code
and I will absolutely be happy to pick up your patches once the runtime checks
are positive and Artur is satisfied as well.

It's perfectly normal that some patch series can take several rounds until
everyone is happy. But it's usually worth the effort and you will also be
able to learn from others.

> Thank you for your kind words, I don't take them for granted!
> And I will certainly hang around in #linux-sh as I have a few other
> things there to debug were I really need some additional input.

Really looking forward to this! A warm welcome to the SH community ;-).

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
