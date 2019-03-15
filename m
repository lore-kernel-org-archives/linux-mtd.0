Return-Path: <SRS0=5Vwq=RS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60701C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2019 14:37:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30BE321871
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2019 14:37:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QzRg3wFm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="UqSqjLCH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30BE321871
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1+4+s/lkf6c0l6exi83LO0xQo44t+EVtx1aCw/cqNwY=; b=QzRg3wFmD+ZhVaVtxieAjoiFq
	R1RvjFYdeTOuClP24B5AFBkgm/iP8mAOiDhLWtWIjRgS5cJ5gTF439RF7HEnPxNck5EFofdLDLH6c
	rnYeKot9ylVKmtTc+41LeBqr2QwfaglMtAhEMLf7omFDB4aOh3UPjAL/AoSCfV2QudSrqhJJ9n/Yi
	hwVsbX8YXr4zK1GDuJbFM1iXJWPBDKpeovNLKt21vNYPVYeroM3kgVxezVm9LIQsRR4Ix0g1t+OZC
	EBvIY8dM/WUKKSZQCnek8q8Myh/4vT0MdYR2AH2XEHMU8S9o7hRxi9iufWcHF0kKGRoTj+wLbz0mU
	TU5Z/t81g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4ny4-0005E8-IJ; Fri, 15 Mar 2019 14:37:52 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4ny1-0005DD-9N
 for linux-mtd@lists.infradead.org; Fri, 15 Mar 2019 14:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1552660659; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K6kOoG2l+4ZryPRZR9ndkiXXIfexV8a+h0H/nuKIaCA=;
 b=UqSqjLCH3KFngrfrL7sxgCDgwqBGU4aCUf35U4asZHexA4sDjveEv1hi02SD80tJqSSOPn
 wuT4qP5iPeNL2g7B6gHRsdpurZ1W8U3Wo1QDa8xLH3ArPx/d+OkRxo6du4mKldiwvovzAo
 FWl2dzQSrh6pm5pMuZ1dJY+vXgb0M88=
Date: Fri, 15 Mar 2019 15:37:34 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 09/12] mtd: rawnand: ingenic: Make use of ecc-engine
 property
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-Id: <1552660654.1727.0@crapouillou.net>
In-Reply-To: <20190315094009.66b91ad5@xps13>
References: <20190313222259.28704-1-paul@crapouillou.net>
 <20190313222259.28704-9-paul@crapouillou.net>
 <20190315094009.66b91ad5@xps13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_073749_720208_75B1CA15 
X-CRM114-Status: GOOD (  21.76  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, od@zcrc.me,
 Boris Brezillon <bbrezillon@kernel.org>, Mathieu Malaterre <malat@debian.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Harvey Hunt <harveyhuntnexus@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Le ven. 15 mars 2019 =E0 9:40, Miquel Raynal <miquel.raynal@bootlin.com> =

a =E9crit :
> Hi Paul,
> =

> Paul Cercueil <paul@crapouillou.net> wrote on Wed, 13 Mar 2019 =

> 23:22:56
> +0100:
> =

>>  Use the 'ecc-engine' standard property instead of the custom
>>  'ingenic,bch-controller' custom property, which is now deprecated.
>> =

>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>> =

>>  Notes:
>>      v5: New patch
>> =

>>   drivers/mtd/nand/raw/ingenic/ingenic_ecc.c | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>> =

>>  diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c =

>> b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
>>  index d7f3a8c3abea..30436ca6628a 100644
>>  --- a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
>>  +++ b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
>>  @@ -82,9 +82,9 @@ static struct ingenic_ecc *ingenic_ecc_get(struct =

>> device_node *np)
>> =

>>   /**
>>    * of_ingenic_ecc_get() - get the ECC controller from a DT node
>>  - * @of_node: the node that contains a bch-controller property.
>>  + * @of_node: the node that contains a ecc-engine property.
> =

> Would "contains an ecc-engine property" be better English?
> =

> I am not sure what is the rule when it comes to plain English with
> variable names. However if you agree, no need to re-send the series, I
> can fix it when applying.

Yes, that's better.

> BTW, I added hw ECC engines support to my generic ECC engine
> implementation, but migrating the whole raw NAND subsystem (using I/O
> requests like in the SPI-NAND core, adding prepare/finish_io_req =

> hooks)
> is going to be much more invasive than initially expected, so I am not
> sure I will finish the migration any time soon.

Ok, I will follow the development then.

> Thanks,
> Miqu=E8l

One thing I notice with my patchset: it works perfectly on top of 4.20,
but on top of 5.0 I am unable to erase any eraseblock with flash_erase.
I get -EIO every time. I'm trying to debug it but didn't go very far,
it looks like nand_status_op() gives me a status of 0xff. Do you know
what could have changed between 4.20 and 5.0 that could trigger this =

bug?

Second thing, everytime I reboot it fails to find the BBT. That's =

because
the BBT marker is overwritten by the ECC data as they occupy the same =

area
in the OOB space. Is there a way to move the BBT marker? Or should I use
NAND_BBT_NO_OOB then? Since the eraseblocks where the BBTs are located
is used in my system partition, won't that conflict with the data?

Thanks,
-Paul


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
