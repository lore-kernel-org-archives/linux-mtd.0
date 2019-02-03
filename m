Return-Path: <SRS0=velq=QK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CCDC169C4
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 13:02:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3295720815
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 13:02:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rp0dUeHs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="MmNBsQqj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3295720815
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PoCKmwm2KNEgwdnEWyoqJpNeayAhSXzsOuk07OxLvBs=; b=Rp0dUeHsw4Pa9X1O+wmPcAbJP
	TQTB0O+yZzW9J9JOVDSQJJ8OYHIlpLtQ8Yn2bE67ywnvGKewjb2m0kP7cVRWakrx8lxa/9tpBvbV4
	KJr/PURtKoShVfhFM/gzCv33iAmkDFb7/Ksh3Cczxy/fLljnJU8oUT+fyZWNvX1D0qBBvcpqLJ6rj
	YZKjPojU4EUvlm3AnzNOfa2n364n4bhPsxbsTYqW5fZFT1zowktbXEWJYiiyKQQjA7JrwU/8SV6tT
	Zjs/FdSXS1QZXbK0UbxhCH5Mil48JCHu5VQDGatJyaNePCKmWKOxvGB4IKLb3iP6SdUvTSlzRKbQo
	4uU7UJdBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqHPN-0002gT-6w; Sun, 03 Feb 2019 13:02:01 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqHPK-0002g6-3J
 for linux-mtd@lists.infradead.org; Sun, 03 Feb 2019 13:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1549198912; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1c/x43u0PHQlx7pSLMIxE9PJPbA0qB96gKkni0aDsOk=;
 b=MmNBsQqj5Yll2H7Je34TCUQxDgkHIBVjpUOIMKm1zClrIpuuOmi0aeuqSCRoNHaKEw3NkK
 k0pWxN13SiLd7ZMNgFBR07i0fj5kBCKwKKhRv/UvTNSkFjQixGLGUq5eStE1luxBQnER1I
 ThvUcWeOKA7yMtD3Lraz7T+vjxfLVso=
Date: Sun, 03 Feb 2019 10:01:36 -0300
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 0/9] Ingenic JZ4780 NAND patchset v2
To: Boris Brezillon <bbrezillon@kernel.org>
Message-Id: <1549198896.1950.0@crapouillou.net>
In-Reply-To: <20190203082032.6e37c523@bbrezillon>
References: <20190202231926.2444-1-paul@crapouillou.net>
 <20190203082032.6e37c523@bbrezillon>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190203_050158_482439_7D1D208B 
X-CRM114-Status: GOOD (  11.62  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Mathieu Malaterre <malat@debian.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Le dim. 3 f=E9vr. 2019 =E0 4:20, Boris Brezillon <bbrezillon@kernel.org> =

a =E9crit :
> On Sat,  2 Feb 2019 20:19:17 -0300
> Paul Cercueil <paul@crapouillou.net> wrote:
> =

>>  Hi,
>> =

>>  As requested by Boris, I added a patch to move all the Ingenic NAND
>>  drivers to their own directory.
>> =

>>  In this V2 I added support for the JZ4740 SoC. The combo of the
>>  jz4780-nemc, jz4780-nand and jz4740-bch now obsolete the old and =

>> dusty
>>  jz4740-nand driver.
> =

> Any plan to get the old driver removed? I guess you want to migrate =

> the
> boards to DT first.

Yes, that's the plan - migrate the qi_lb60 board first then drop the old
driver.

>> =

>>  To support the only upstream JZ4740-based board we have, the Ben
>>  Nanonote, I added an option to specify the OOB layout of that device
>>  from a device property string.
>> =

>>  Finally, I dropped the last two patches that moved the platform NAND
>>  code to devicetree; I will upstream them as part of a different
>>  patchset.
>> =

>>  Cheers,
>>  -Paul
>> =

> =



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
