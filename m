Return-Path: <SRS0=L3KX=EL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C45C55178
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2020 18:55:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BD952078E
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2020 18:55:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dckILUeF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gateworks-com.20150623.gappssmtp.com header.i=@gateworks-com.20150623.gappssmtp.com header.b="ktPCY7fi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BD952078E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gateworks.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/bEKBVoZJwHlb9pcGg6qWSlxTCd1N+Wk52PI89JRK9c=; b=dckILUeFtNJD48rcSjXIxqtPt
	PXK1yeJgDagkE2f25I7b5NgSFOvhJeK5h2PAfQ/gc2Eq3Fmaoiy3LEZSXYV6zdx75KwKn1upvt97D
	2uYca4ga9BAdJsUfJnLlk4gPcA/Hs9UM2MHzIZL8w6y0p97c2NwXPDyoBIwHON/4GjFVDqwhcHYCZ
	tX6MmHriKCOVFr5JBq0oZSNDGtWFAqWSfWXzSAOZyEGhPvzWiYL8FDtNjypS4cehR3QxF4ujAbW2V
	28SugAttObJTeSH2kSuQ3Qv+DXxyxN/s74tgJC/ZW0gj3LDNs2wI928rL15B169HaFMbMoLeEb6fe
	k1bipUPEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kakPO-0002yd-0T; Thu, 05 Nov 2020 18:54:54 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kakPL-0002y6-UJ
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2020 18:54:53 +0000
Received: by mail-ed1-x541.google.com with SMTP id a71so2629711edf.9
 for <linux-mtd@lists.infradead.org>; Thu, 05 Nov 2020 10:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WvOzii402GukaiSTb1zI6wa80/r3N1OzRYkyVOjZAew=;
 b=ktPCY7fiyb7gx4wr5S/l3sMM0vlO+J2uFhV0RDuFCcf5nW2MDBsH6cVHFC1nzDmhQM
 AyNvwHIZPRraGPzqDC+Is1T+3NhGne+HWadJTaMIcjzXFgTJzBamGpcLSkY2HFND+aHG
 LE+4z6cBo7S62sJ53MsIKPbzbmPX6AzGfEuSZbkvxeqhaPINQmwUutxrlPr5XTSRQmuw
 /+wz2vvgmt3l42hV27QhukutdfEcUwEC3ioCZz9nXSzjb6l6IGZhK/IvP8j9nQ5axOGn
 9j0Es/apkh5VjRoP96lx58FnWaMW5RzQVzTfxb6MgsZy7F/03Lo5JBBWzE4RSv9RG0/z
 30nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WvOzii402GukaiSTb1zI6wa80/r3N1OzRYkyVOjZAew=;
 b=hhafRfEY3lJ7QcHEwrRf3r3WBvcpwyIdwUexy6tTJy7ZEt2bJ5ArfyKC6bcA03F0nd
 QikJO5kH6YkxRc3GnkcrHBUxQh6Cy/l7pwC5xcylbMUJg1cwjtfgQXBVmEvzw9jZQ/2f
 9GHWdPPsxY+JQABXU6F62cGSAbI1VECRnVXz1btM5RYhLetjnhcYTA/eUIU34idY/UbY
 04tMAyuSPUizlvwslMbESYwhVgzdK8oT/NSn1W1Q5rUXmCWv5Kv2fCwBMpwjlPWgYdce
 vZfThEcT9U03qW+0Mzc0/ajtPxat5dwd7etKZ1yzahZZt146MVDDb0851vhADMHdenFW
 aEWQ==
X-Gm-Message-State: AOAM530JEnXXYYjus8wVZ+s1RIZuMAttTHF2/UPz3TnK0eRfprkHLhLP
 Cj9srfkrauNfBEKeLjefHGC+s8w9fyV1Q0gFv2r8tA==
X-Google-Smtp-Source: ABdhPJx+Xh5MIKFAHKjRN4hwGhMZSoFcUtY6DWECxEPSTJscB1KQ/3KTrtqzWldpOJ8PHU1dtgThkgn+mdZIHrOt0xw=
X-Received: by 2002:a50:fc95:: with SMTP id f21mr3980054edq.383.1604602489004; 
 Thu, 05 Nov 2020 10:54:49 -0800 (PST)
MIME-Version: 1.0
References: <20200424065626.8196-1-s.hauer@pengutronix.de>
 <13199742.Uhtxi0mpr9@192.168.0.120>
In-Reply-To: <13199742.Uhtxi0mpr9@192.168.0.120>
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 5 Nov 2020 10:54:37 -0800
Message-ID: <CAJ+vNU2SmCkUuq6K6MQ06G0tHi5ZxnM4G+yVRADMjLC3yQ2N4A@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: spi-nor: Add support for Cypress cy15x104q
To: Tudor.Ambarus@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_135452_133636_11C6F50B 
X-CRM114-Status: GOOD (  21.53  )
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
Cc: vigneshr@ti.com, Richard Weinberger <richard@nod.at>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, May 28, 2020 at 1:13 AM <Tudor.Ambarus@microchip.com> wrote:
>
> On Friday, April 24, 2020 9:56:26 AM EEST Sascha Hauer wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> > content is safe
> >
> > The Cypress cy15b104q and cy15v104q are 4Mbit serial SPI F-RAM devices.
> > Add support for them to the spi-nor driver.
> >
> > The actual Device ID of this chip is 7f 7f 7f 7f 7f 7f c2 2c 04. That is
> > six times the continuation code 7f followed by c2 for Ramtron.
> > Unfortunately the chip sends the Device ID in reversed order, so the
> > continuation code is not at the beginning, but instead at the end. Even
> > more unfortunate is that when reading further the chip sends more 7f
> > codes which means we are not even able to count the continuation codes.
> > We can only hope that this reversed Device ID will never match any other
> > devices ID.
> >
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>
> Collisions are improbable as of now, the solution from above is good
> enough. In case of future collisions one can introduce an INFO9 macro,
> with the downsize that struct flash_info would grow and we have lots of
> flashes. A more elegant solution would be to introduce dedicated
> flash ID tables for each bank in JESP106BA.
>
> Amended commit description with the above text and applied. Thanks.
>

Greetings,

I've got a board with a  CY15B104Q-LHXI on it and I found that it's id
reads as  7f 7f 7f 7f 7f 7f c2 26 08 so it fails the match added above
in a2644d5f36: mtd: spi-nor: Add support for Cypress cy15x104q

I also found a reference in
https://community.cypress.com/docs/DOC-14647 that states "that newer
1.8 V devices have the 9 device ID bytes coming out in the other order
which requires a minor change in the ID entry" which would explain the
situation you encountered.

Adding '{ "cy15x104q",  INFO(0x7f7f7f, 0, 512 * 1024, 1,
SPI_NOR_NO_ERASE) },' works for the part I have.

Would it be wrong to add additional parts with the same name and
different id's? It seems to me duplicate names would break
spi_nor_scan when passed a name but work fine for scanning by id. I
also think that '{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024,
1, SPI_NOR_NO_ERASE) },' is way too specific for 'cy15x104q' because
it is won't match any of the other identified parts:

CY15B104Q-PZXI     7F7F7F7F7F7FC22C03 51-85075 8-pin PDIP Industrial
CY15B104QN-50SXA   7F7F7F7F7F7FC22C40 001-85261 8-pin SOIC (EIAJ) Automotive
CY15V104QN-50SXI   7F7F7F7F7F7FC22C04 002-18131 8-pin GQFN Industrial
CY15B104QN-20LPXC  7F7F7F7F7F7FC22CA1 002-18131 8-pin GQFN Commercial
CY15B104QN-20LPXI  7F7F7F7F7F7FC22C01 002-18131 8-pin GQFN Industrial
CY15V104QN-20LPXC  7F7F7F7F7F7FC22CA5 002-18131 8-pin GQFN Commercial
CY15V104QN-20LPXI  7F7F7F7F7F7FC22C05 002-18131 8-pin GQFN Industrial
CY15B104QN-50LPXI  7F7F7F7F7F7FC22C00 002-18131 8-pin GQFN Industrial

Best Regards,

Tim

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
