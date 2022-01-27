Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480A2C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jan 2022 16:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Cc:To
	:Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBcY22qXzjJ//lBCGTSgKb3v86AHZsFDD6RFoRZSoOw=; b=cYWXbMxv+mGY8oEl/lV32an/it
	S2mxGIujZrIjZAuFcZJ4j4TJ4eSQBJmn8QmLt8N6Augf/qnw/LXUxB9tZUWv59bgtiUN4CK7lxNwl
	71gXcPZa9OtV67jDdZ+RR7ETVZ1J6OYyGFtVsZzJHOFhT88hiFbJGWGGl69BkrZOAqaa+PIX8fWxG
	W0epP+3T6ybpqRGsIGKwdyxrep5YHUbpOtfGZKAIsus2IdK35z0tv18Q6bIa4t+hMuoTpYXqO+5hY
	D/foX4jV/ayuqkg8++PJenraNYjxKGKMSPWDgWNurQs2ZkanityG8/Ly90g02bdJUH9oPzxYuKXFv
	Oah3jESw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD7g7-00GWmE-Nn; Thu, 27 Jan 2022 16:31:19 +0000
Received: from aposti.net ([89.234.176.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD7fl-00GWXz-8r
 for linux-mtd@lists.infradead.org; Thu, 27 Jan 2022 16:30:58 +0000
Date: Thu, 27 Jan 2022 16:30:38 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] mtd: Fix misuses of of_match_ptr()
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael Walle
 <michael@walle.cc>, linux-mtd@lists.infradead.org, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Uwe Kleine-Konig
 <u.kleine-koenig@pengutronix.de>, kernel test robot <lkp@intel.com>
Message-Id: <27ND6R.YH1CCXQUE2NI2@crapouillou.net>
In-Reply-To: <20220127164425.755fe5cd@xps13>
References: <20220127110631.1064705-1-miquel.raynal@bootlin.com>
 <RQ8D6R.EBO0P9DUGF812@crapouillou.net> <YfKCtYR7ZrPu+waQ@piout.net>
 <SI9D6R.T149KFA13SNK2@crapouillou.net> <20220127164425.755fe5cd@xps13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_083057_501567_91D9E575 
X-CRM114-Status: GOOD (  22.42  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

Le jeu., janv. 27 2022 at 16:44:25 +0100, Miquel Raynal =

<miquel.raynal@bootlin.com> a =E9crit :
> Hi Paul,
> =

> paul@crapouillou.net wrote on Thu, 27 Jan 2022 11:35:16 +0000:
> =

>>  Le jeu., janv. 27 2022 at 12:32:05 +0100, Alexandre Belloni =

>> <alexandre.belloni@bootlin.com> a =E9crit :
>>  > On 27/01/2022 11:18:27+0000, Paul Cercueil wrote:
>>  >>  Hi Miquel,
>>  >> >>  Le jeu., janv. 27 2022 at 12:06:31 +0100, Miquel Raynal
>>  >>  <miquel.raynal@bootlin.com> a =E9crit :
>>  >>  > of_match_ptr() either expands to NULL if !CONFIG_OF, or is >> =

>> transparent
>>  >>  > otherwise. There are several drivers using this macro which =

>> keep >> their
>>  >>  > of_device_id array enclosed within an #ifdef CONFIG_OF check, =

>> >> these are
>>  >>  > considered fine. However, When misused, the of_device_id =

>> array >> pointed
>>  >>  > by this macro will produce a warning because it is finally =

>> unused >> when
>>  >>  > compiled without OF support.
>>  >>  >
>>  >>  > A number of fixes are possible:
>>  >>  > - Always depend on CONFIG_OF, but this will not always work =

>> and >> may
>>  >>  >   break boards.
>>  >>  > - Enclose the compatible array by #ifdef's, this may save a =

>> bit of
>>  >>  >   memory but will reduce build coverage.
>>  >>  > - Tell the compiler the array may be unused, if this can be =

>> >> avoided,
>>  >>  >   let's not do this.
>>  >>  > - Just drop the macro, setting the of_device_id array for a =

>> non OF
>>  >>  >   enabled platform is not an issue, it will just be unused.
>>  >>  >
>>  >>  > The latter solution seems the more appropriate, so let's use =

>> it.
>>  >> >>  I disagree. The proper solution would be to not have =

>> of_match_ptr()
>>  >>  conditionally defined.
>>  >> > > I disagree...
>>  >
>>  >>  Right now it's defined basically like this:
>>  >>  #ifdef CONFIG_OF
>>  >>  #define of_match_ptr(_ptr) (_ptr)
>>  >>  #else
>>  >>  #define of_match_ptr(_ptr) NULL
>>  >>  #endif
>>  >> >>  This is bad, because in the !CONFIG_OF case, the pointer is =

>> never
>>  >>  referenced, and the compiler complains about it, as you can =

>> notice.
>>  >> >>  Instead, it should be defined like this:
>>  >>  #define of_match_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_OF), (_ptr))
>>  >> >>  Then in the !CONFIG_OF case the compiler will see the array =

>> as >> effectively
>>  >>  unused, and drop it as needed.
>>  >> >>  We are doing the exact same work with the PM callbacks, with =

>> the new
>>  >>  pm_ptr() macro.
>>  >> >>  Note that I don't know the behaviour of =

>> MODULE_DEVICE_TABLE(of, >> ...), it
>>  >>  might be a good idea to make it a NOP if !CONFIG_OF so that the =

>> >> array is
>>  >>  removed by the compiler as dead code (if it's not the case =

>> already).
>>  >> > > ... because ACPI platforms can use the OF table to probe =

>> drivers even
>>  > when they don't have OF support.
>> =

>>  Fair enough. I didn't think about this use-case.
> =

> So shall I drop it entirely in the end? Or do it like in several other
> drivers: enclose the of_device_id array in a #ifdef?

No, your patch is fine. It's not like wrapping them would save much =

space anyway.

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
