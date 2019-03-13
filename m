Return-Path: <SRS0=ZvR1=RQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA71C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 12:55:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D2AE2177E
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 12:55:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EdmztJE1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="l4ZtSWTO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D2AE2177E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JolKF2krZSXZHDQ8mkJUNz0KlCR6z1OnKhtKs8Lg0ss=; b=EdmztJE1AxzjMOUkAw4Rx9i4c
	H6/K5mUYhgcU3RKTB806FHvE9n/OlUdK1ml1m+AaX7n0CdSzGmZ7tVDOzG2oWiyt/1LRsMGvP0BoO
	jMyJXjaQz6VkaybrhZ4Xjt7GV8Itmn9eDqAArIAXm1xvwdpDb7eObCW8cXKyZCICDuIuveP24/Ihf
	euhqD5oMgU/mXRN0Qdb/AvQs2YSZrG45b/9NbNuivk7tIP8nxZgk6zz0zGPAGiBzhDOyoIWjEluhn
	cGfIyUxTDHmgSujBHkHpi1LfEuxTf0IOfPq15edYw2ahhbcYbDenZB0eyLvdHmM417ZOeQusHEwOz
	i2t2B/Uyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h43Q7-0006cZ-Im; Wed, 13 Mar 2019 12:55:43 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h43Q4-0006cB-JB
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2019 12:55:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1552481738; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zsSEVUC0BIaGQjpDQt5EuoDLXlWn4F5jnVW8wjVFbpA=;
 b=l4ZtSWTOnmjmPUi+jjyDj/euQBhcc31ykUc0PLkXlKETWxqkmeGyVRlrzKSqsTWkUBf19o
 Q9C4tL9B6L+K57Z4v678X2WQnDn2eBd8TI8xJMtXgvxpqfUlF2mXFcRxKT7e3eDW9yznG5
 EIcK4ajInr1WMT10r8XjXUmTKvd/it0=
Date: Wed, 13 Mar 2019 09:55:34 -0300
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 1/9] dt-bindings: mtd: ingenic: Add compatible strings
 for JZ4740 and JZ4725B
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-Id: <1552481734.2412.1@crapouillou.net>
In-Reply-To: <20190304195149.7cca9c64@xps13>
References: <20190209192305.4434-1-paul@crapouillou.net>
 <20190304104554.09be4cd4@xps13> <1551723742.4932.2@crapouillou.net>
 <20190304195149.7cca9c64@xps13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_055540_816795_663EAFE9 
X-CRM114-Status: GOOD (  12.63  )
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
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Le lun. 4 mars 2019 =E0 15:51, Miquel Raynal <miquel.raynal@bootlin.com> =

a =E9crit :
> Hi Paul,
> =

>>  >>  --- =

>> a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>>  >>  +++ =

>> b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>>  >>  @@ -6,7 +6,10 @@ memory-controllers/ingenic,jz4780-nemc.txt), =

>> and >> thus NAND device nodes must
>>  >>   be children of the NEMC node.
>>  >> >>   Required NAND controller device properties:
>>  >>  -- compatible: Should be set to "ingenic,jz4780-nand".
>>  >>  +- compatible: Should be one of:
>>  >>  +  * ingenic,jz4740-nand
>>  >>  +  * ingenic,jz4725b-nand
>>  >>  +  * ingenic,jz4780-nand
>>  >
>>  > Wouldn't "-nand-controller" suffix be better? Of course in the =

>> driver
>>  > you should still check for jz4780-nand.
>> =

>>  So I would be compatible with:
>>  * ingenic,jz4740-nand-controller
>>  * ingenic,jz4725b-nand-controller
>>  * ingenic,jz4780-nand
>>  ?
> =

> From a driver POV I would even prefer ingenic,jz4780-nand-controller. =

> I
> don't know what's best here. Maybe Boris or Rob can help?

The "ingenic,jz4780-nand" compatible string is already out there and =

used
in devicetree files, so I wouldn't change it just for the sake of it.

-Paul


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
