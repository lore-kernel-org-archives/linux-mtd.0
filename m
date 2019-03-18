Return-Path: <SRS0=8m+b=RV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803A1C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Mar 2019 20:37:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CADD2085A
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Mar 2019 20:37:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pzh03Rbn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="SqpMUmIU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CADD2085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n5b4/EUlpZ9+ZyT5nzm/ncMuClQbBS7WeYhoSDxm4kc=; b=Pzh03Rbnc9Gn6HmAPhde5RfBM
	LBe25l/KZ1r3vYM9uRCat0XY6RHVXgOXzFEyiuXT6tf0ml+mtRT1s+YE6XLXOwp3b4I8sVkvtDRPh
	N2dvFM2b5txkLyri/5g7SG0qVbgtMy++7pLJMzogePILRnxBKNxqwPLetbUY3i0b5kJIw6JbInsvR
	Y0Rnr02pj58YR9RGyk/oIGnUUSJ0JGm3dYHS/PqCGCq69zvFV6R9QkR6lQqq8iF75TCgsGytL8Ic5
	Pn3pOQY/GlcEoOZilVLwKnynnNLQSECjORMJ0YZHRzSNUI9Mto/UGHXYyUC1tOGuLo+kecvrl6N1a
	uZHLbExZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5z0n-0004t4-KS; Mon, 18 Mar 2019 20:37:33 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5z0k-0004sG-O3
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2019 20:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1552941440; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gYjy5LKS0Law5aIlcxzHUTYXl4BsMI2KDc7KYiS67X4=;
 b=SqpMUmIUe+xT4JF2GK7EzRUJXkULFSLq8QYuoOCRRccQ7+rVun34LLJbJxFyBXx+xeJIIM
 paBca9Q/FxitEaGDlRv0UU1O32yqio0lCUPTGpCrT6Ty57c1haqQfe4u6pQv6hBQVnTFIv
 XPALu6JYPSayK3eWDAE/jtLtBj5zD3M=
Date: Mon, 18 Mar 2019 21:37:09 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 09/12] mtd: rawnand: ingenic: Make use of ecc-engine
 property
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-Id: <1552941429.1495.0@crapouillou.net>
In-Reply-To: <1552660654.1727.0@crapouillou.net>
References: <20190313222259.28704-1-paul@crapouillou.net>
 <20190313222259.28704-9-paul@crapouillou.net>
 <20190315094009.66b91ad5@xps13> <1552660654.1727.0@crapouillou.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_133731_165432_E80BFD84 
X-CRM114-Status: GOOD (  23.03  )
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

Le ven. 15 mars 2019 =E0 15:37, Paul Cercueil <paul@crapouillou.net> a =

=E9crit :
> Hi,
> =

> Le ven. 15 mars 2019 =E0 9:40, Miquel Raynal =

> <miquel.raynal@bootlin.com> a =E9crit :
>> Hi Paul,
>> =

>> Paul Cercueil <paul@crapouillou.net> wrote on Wed, 13 Mar 2019 =

>> =7F23:22:56
>> +0100:
>> =

>>>  Use the 'ecc-engine' standard property instead of the custom
>>>  'ingenic,bch-controller' custom property, which is now deprecated.
>>> =

>>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>>  ---
>>> =

>>>  Notes:
>>>      v5: New patch
>>> =

>>>   drivers/mtd/nand/raw/ingenic/ingenic_ecc.c | 13 ++++++++++---
>>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>> =

>>>  diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c =

>>> =7F=7Fb/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
>>>  index d7f3a8c3abea..30436ca6628a 100644
>>>  --- a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
>>>  +++ b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
>>>  @@ -82,9 +82,9 @@ static struct ingenic_ecc =

>>> *ingenic_ecc_get(struct =7F=7Fdevice_node *np)
>>> =

>>>   /**
>>>    * of_ingenic_ecc_get() - get the ECC controller from a DT node
>>>  - * @of_node: the node that contains a bch-controller property.
>>>  + * @of_node: the node that contains a ecc-engine property.
>> =

>> Would "contains an ecc-engine property" be better English?
>> =

>> I am not sure what is the rule when it comes to plain English with
>> variable names. However if you agree, no need to re-send the series, =

>> I
>> can fix it when applying.
> =

> Yes, that's better.
> =

>> BTW, I added hw ECC engines support to my generic ECC engine
>> implementation, but migrating the whole raw NAND subsystem (using I/O
>> requests like in the SPI-NAND core, adding prepare/finish_io_req =

>> =7Fhooks)
>> is going to be much more invasive than initially expected, so I am =

>> not
>> sure I will finish the migration any time soon.
> =

> Ok, I will follow the development then.
> =

>> Thanks,
>> Miqu=E8l
> =

> One thing I notice with my patchset: it works perfectly on top of =

> 4.20,
> but on top of 5.0 I am unable to erase any eraseblock with =

> flash_erase.
> I get -EIO every time. I'm trying to debug it but didn't go very far,
> it looks like nand_status_op() gives me a status of 0xff. Do you know
> what could have changed between 4.20 and 5.0 that could trigger this =

> bug?

Nevermind. It works now.

> Second thing, everytime I reboot it fails to find the BBT. That's =

> because
> the BBT marker is overwritten by the ECC data as they occupy the same =

> area
> in the OOB space. Is there a way to move the BBT marker? Or should I =

> use
> NAND_BBT_NO_OOB then? Since the eraseblocks where the BBTs are located
> is used in my system partition, won't that conflict with the data?

Response to myself: It's possible to move the BBT marker. But in my =

case I
have to deal with three possible layouts, so it's simpler to just use
NAND_BBT_NO_OOB then. The BBT pages are marked so that they're not used
for data in the partitions.

I'll send a V6 then.

Thanks,
-Paul


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
