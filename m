Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BA5C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Feb 2022 18:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h270oUG0aPjY3O+xZM2A6+HtFThoT04DT6GZzwt1a+Q=; b=Sk5QY5UT9MK0L6
	E96DEQmTtCyDIXVcf++rsOh47nZX7o/ZrKsJOOhjeXfIF7AK4/P0pZzGS1Fe368Kz1UzjvsofrB3C
	A+JVree88Ah/ibwZ175gMgFpbY0VXZ54TZ92aBVaiXSFNfejqcGuuwsTCFpJzwrN5I9knzkeN2jiP
	7uvrGmEGMKeTRfyUM4buo8YDEjkgHPsVzq5UkLiecU2fdmcNbOwLMPXyCHNK8W5Sr5G4LMVwZAdUh
	5OzivUT9YUCxW7oT2gbbJVUD4WRZXU5yYEnPaOPJeFH2JRRfojjaKlkBcxVnpv0qwjQLB5h1DKvKK
	3MiaGYNUb2AIiUjYTzNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK2an-0045VR-SH; Tue, 15 Feb 2022 18:30:25 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK2ak-0045UL-QS
 for linux-mtd@lists.infradead.org; Tue, 15 Feb 2022 18:30:25 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21FIUIGq041865;
 Tue, 15 Feb 2022 12:30:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1644949818;
 bh=JmNVigm7qG+XT7gKGzT5DW5mWlOdTYKmqEtmGE+kCvY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=XBVG9MEELjXJb6CvwCHX7GkHUCXdwkljoU01oshnn5v39HWVsy/FToLRNMnBx0GHm
 6wmQrY8nO7D4bqRCmcPohxNlevDrMakh5J4HVHLjtFbrv3jET9HXpBlI5uMnzdIsBW
 42R08Q6VP4pJtWlGVRgkfP92TnUvqoohAZwFHAY8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21FIUIWm067471
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Feb 2022 12:30:18 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 15
 Feb 2022 12:30:17 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 15 Feb 2022 12:30:17 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21FIUHCi084824;
 Tue, 15 Feb 2022 12:30:17 -0600
Date: Wed, 16 Feb 2022 00:00:16 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [PATCH v1 01/14] mtd: spi-nor: export more function to be used
 in vendor modules
Message-ID: <20220215183016.akjzyf6laq6v3hsd@ti.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-2-michael@walle.cc>
 <6551933c-9283-8fba-c918-fa9acc4660bc@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6551933c-9283-8fba-c918-fa9acc4660bc@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_103023_779175_AE040C8F 
X-CRM114-Status: GOOD (  10.58  )
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

On 10/02/22 03:13AM, Tudor.Ambarus@microchip.com wrote:
> On 2/2/22 16:58, Michael Walle wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > We will move vendor specific code into the vendor modules and thus we
> > will have to export these functions so they can be called.
> > 
> > Signed-off-by: Michael Walle <michael@walle.cc>
> 
> please move this patch closer to where the vendors actually use the methods.
> With that:
> 
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
