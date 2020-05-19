Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E746DC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 15:10:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4254207FB
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 15:10:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nqv8TSQ+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="XnuHffaO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4254207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HK9MQulfenq9wdnFXJDaPr7MG/lK5dZXvEeZoXqIZt8=; b=Nqv8TSQ+WYa6DzlTLvIX23xbe
	UP9euxoVmLUnDxXOQA8aZcr3nPJIR0SRyk1+LaPfdYBB5SINL0EEHz6NLWF5cs+F6y5rzEuRpeXuF
	JunAeBQXxSNWmn7fd1N3Weyf/xd3snbw+oVW33h0IHyKNHQaBXFGyP7EDDtZkMxVLRJDd9Jd31CMc
	EWbE8JopqSke0S8kgPuuAr3qEeYF5bf+/i1ZCAH1Ixsdh8sR919yC8k8ij4AJtMN356+cdfXX6aBn
	NBspVcZxAIGyNj4lwFvsaRwYlCWMq0FzHmnOuV4JIbV4WHVP53rb9rfPp2Jm34qBNHxRjqjoxB9qu
	C0tbtcwyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb3t6-0008Dl-13; Tue, 19 May 2020 15:10:36 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb3sv-00082j-4p
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 15:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1589901023; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6OonQO4p8yRzIravjs70sh1gPTulh98Xxg35Fk9+NYE=;
 b=XnuHffaO7lgBPZkGuR6BHWqy+eSLbovqGJomL4JgQ1OwdpYFVzYrttgmz8cZT1oP/w3aDT
 TgG/ro5KKWaW+JXdEMGAB8qZsODZ0lDdhY12FQ6qpNcYatadHzHqMSDfzRs1zdYtmPTANl
 wOAwZuAgv24k2Jsi4jE5n1zAVlUYAko=
Date: Tue, 19 May 2020 17:10:12 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] mtd: rawnand: ingenic: Convert the driver to exec_op()
To: Boris Brezillon <boris.brezillon@collabora.com>
Message-Id: <0H3LAQ.G5DAMEP9GDQC2@crapouillou.net>
In-Reply-To: <20200519170130.77543c8e@collabora.com>
References: <20200518165640.312220-1-boris.brezillon@collabora.com>
 <G7GJAQ.0VIFSQUDMC9H2@crapouillou.net>
 <20200518212422.23316760@collabora.com>
 <FN2LAQ.2U7L7XR4D02L@crapouillou.net>
 <20200519170130.77543c8e@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_081025_362990_802D7D08 
X-CRM114-Status: GOOD (  11.36  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



Le mar. 19 mai 2020 =E0 17:01, Boris Brezillon =

<boris.brezillon@collabora.com> a =E9crit :
> On Tue, 19 May 2020 16:52:27 +0200
> Paul Cercueil <paul@crapouillou.net> wrote:
> =

>>  Hi Boris,
>> =

>>  Le lun. 18 mai 2020 =E0 21:24, Boris Brezillon
>>  <boris.brezillon@collabora.com> a =E9crit :
>>  > On Mon, 18 May 2020 19:50:04 +0200
>>  > Paul Cercueil <paul@crapouillou.net> wrote:
>>  >
>>  >>  Hi Boris,
>>  >>
>>  >>  Le lun. 18 mai 2020 =E0 18:56, Boris Brezillon
>>  >>  <boris.brezillon@collabora.com> a =E9crit :
>>  >>  > Let's convert the driver to exec_op() to have one less driver
>>  >> relying
>>  >>  > on the legacy interface.
>>  >>
>>  >>  Great work, thanks for that.
>>  >>
>>  >>  However it does not work :( nand_scan() returns error -145.
>>  >
>>  > Looks like the R/B signal is inverted. Can you try with the
>>  > following diff applied?
>> =

>>  Still doesn't work properly. I get -ENODEV in nand_detect(), at the
>>  "second ID read did not match..." pr_info().
>> =

>>  The R/B signal doesn't seem to be the primary cause, if I use
>>  nand_soft_waitrdy() it doesn't work any better.
> =

> Well, it does solve the ETIMEDOUT issue, so we're one step further =

> ;-).
> Can you print the returned ID?

It reads 00/00, so it doesn't seem to be able to read any data.

>> =

>>  One thing I noticed that jz4780_nemc_assert() is called with
>>  assert=3Dtrue unconditionally, while before it was called with (ctrl &
>>  NAND_NCE), whatever that is. Whether or not that's a problem, I =

>> have no
>>  idea.
> =

> Yes, we really want to assert the CE signal unconditionally here, but
> maybe we should add a delay after asserting it/before de-asserting it.

I added some udelay() here and there, unfortunately it didn't change =

anything.

-Paul



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
