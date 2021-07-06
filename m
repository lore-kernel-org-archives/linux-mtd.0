Return-Path: <SRS0=yrYE=L6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FORGED_HOTMAIL_RCVD2,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6250C07E96
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 17:50:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7093961C25
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 17:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7093961C25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5EboMx27zQDe603dJ3LCTkBwdRifFT9pPqRaXlpZp7I=; b=TI051Z48ECj27a
	G3cgzCLo7dC55y/RLaesxG61rHh7TAruwbWosvCvfqY8bB8ILWqrTIOs9lCvM2J9ZBt+ss7NQbqMq
	xnHFLZaqM9xWXOQN3kEYhSb3z9WOLiFGb96Dwoa8+L/+LSlMygBskxHIIQrLbJ0oIZR/0Hve+8gwL
	vZcORiVRs53mbG7jAmey8+EmVNezn9SPmyBKAApqJw9Xt8lmLimoLZG+RcRWH3988zlgdZNjSTfts
	TExXej9EunfIYNd9GmfF4i9DKk/o9RVPfceo1x99e2sVwmbMX4+Xu567TTowxu4+U4kWdqUtqJN3x
	EAxBCM+hKgDwHyoJ9tLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0pCG-00CVjM-LS; Tue, 06 Jul 2021 17:49:24 +0000
Received: from mail-dm6nam10olkn2097.outbound.protection.outlook.com
 ([40.92.41.97] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0pCD-00CViE-NI
 for linux-mtd@lists.infradead.org; Tue, 06 Jul 2021 17:49:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hcdd6rnTgXkERGzzrEX9zB3fF36LgqG6LKtZtt5W69CBgBNJLWSfDuux3/2pyczY1IWwdKa6euHOc/8ukJoY7TsmCyWIuTh0UbxKdX9lSdNT8CfKI83VToeux2qp223tFYx52iiq9lqmORiKpsEs88qVli9KULz+nD/VeUEofJ9eVRQTerKXcgdbxLrcMErCTnVjHyUsNSXohDPtvhlNa43WRGqE8aOeex5wAgdGvt41RjtXUYhzjlRkNYdQN0NfbUsLC2/QM/ypn9qQ5APpDHMcpUZtwTHy+DeTM5G4FdC9bEJlAdc9uLlu2KzMDdlWFjiuW+oqMX/ykohRno8J9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIdyn9MEcbOOXzBv9IQvzDDjbFcxCSb896MdH+w+tyo=;
 b=CcQEz/9go1nZkMrz/uAkq84LeC3+NBpwYw8guEfkzzY+v0WFgUozKHOKSxAMGAktDvpRx4y6IPxSiDd9CSuPe269jnwKe8r6QsKHeATg6HQoU0aClvpnmafmwz4tqbw1aoK7YJW3520CnieYhMQw844pWNMiYWJC6gztjqdxHqH4ziF4UMe/L7f41eAuBPrGuuRYuK8qtKDVkcDq4CH4vCwTx+zPO45fWIR1lpKWYJJ5/7fn82Crc2koMCA6XwOL7ie3f6RICIZgyiSpTOLRQwz82S+ebHisRsmaN+deVs+Yisv+wkCzTPr5PgP3fIcd4VaCmvLwFpbSvTGcQf3fMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIdyn9MEcbOOXzBv9IQvzDDjbFcxCSb896MdH+w+tyo=;
 b=Ekfqng9vVmHVjKzKJEwknP04+o237enXmKgy8S5VrNdCA7RTs67O2jkAbnCiUu+j9mNKl4hkv/8mNQ5Fqbp4NiUoZyLHT4tNRzaUM3Hgezk43aJGiKuMuz2QBWrYVoxVdJR33NJxxTamchRBxHoH0KLlvjCEx3wYckpYLJCkAvv4JN5lGmCcndlDtl8lu+obkB57xjIy0lpeBE6T8l2qSENNEPkw4CSFQ2R8vRY0ApXlLjrj2bDVnrS5zGzoc8YBByZ2Cn3tjJEI1XymGlOTKMWz5XjUJba4laOjF17dtWutJ7nNLuWlEwwtFiJKsVfd2MRDNTprwAuMJBA+IJVbKg==
Received: from BN7NAM10FT011.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e8f::51) by
 BN7NAM10HT191.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e8f::371)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 17:49:17 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:7e8f::48) by BN7NAM10FT011.mail.protection.outlook.com
 (2a01:111:e400:7e8f::250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Tue, 6 Jul 2021 17:49:17 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:68DF5D6D335EE013AC63DDCB897A15383E2896BFE275F78ACE901A536BDCED16;
 UpperCasedChecksum:67EE47CF33A629A3880A4962D9A71869166C045A78300E97AFD5373DD849E7DE;
 SizeAsReceived:7911; Count:46
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::e1f4:5eb1:d552:af43]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::e1f4:5eb1:d552:af43%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 17:49:12 +0000
Date: Tue, 6 Jul 2021 12:49:10 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Tudor.Ambarus@microchip.com
Cc: p.yadav@ti.com, michael@walle.cc, vigneshr@ti.com, figgyc@figgyc.uk,
 mail@david-bauer.net, linux@rasmusvillemoes.dk, esben@geanix.com,
 knaerzche@gmail.com, code@reto-schneider.ch, zhengxunli@mxic.com.tw,
 jaimeliao@mxic.com.tw, heiko.thiery@gmail.com, sr@denx.de,
 miquel.raynal@bootlin.com, richard@nod.at, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 6/7] mtd: spi-nor: manuf-id-collisions: Add support for
 xt25f128b
Message-ID: <SN6PR06MB5342F5011D28DBC7A66152F1A51B9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
 <20210702144110.250481-7-tudor.ambarus@microchip.com>
 <20210706062806.m63v2kaqkckmwgwx@ti.com>
 <56f48714-b7c5-40c5-d95f-4cbc4c51953f@microchip.com>
Content-Disposition: inline
In-Reply-To: <56f48714-b7c5-40c5-d95f-4cbc4c51953f@microchip.com>
X-TMN: [A0vCZ92uZTLJ1lp/gMk+M6P2MBQHgIkV]
X-ClientProxiedBy: SN4PR0801CA0016.namprd08.prod.outlook.com
 (2603:10b6:803:29::26) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210706174910.GA14537@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN4PR0801CA0016.namprd08.prod.outlook.com (2603:10b6:803:29::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend
 Transport; Tue, 6 Jul 2021 17:49:11 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 46
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: cdb428d3-0b8a-424c-f3be-08d940a65d2e
X-MS-TrafficTypeDiagnostic: BN7NAM10HT191:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /xJU/eDDuKIbag6wEcXxg2pnUwZpY3K9agZmcjzpaYUUXcNQCdKYRvxYexiSnVH9E/ahaWlk/FusYK/ug2Kn9R2B1hQ7w1nFBD1zTd3F3CWySb2lNZj4pH4iTfycHIvpa9kQxZDUsirRLpxo2GFJIkBUQCha9wxQDgKVFA3sluEqqMELUKNurJXMUudhBCaYdc2sIM/yUEAawZAJXrl+8JRhS6OMh+eHroXne5ka/QXri5+AHDh16ov4IM7r9Ibc/EbFs62UxlLND8jG0yYEa5YUomo54xttlfhlAgSWIkgDMiDRd5fhF3vcfL+51m7hFCT2BJJlqs0F86JbVsEUPj+WCa2oVEOestFsXL0UcYizBA6kPKZAdbTCaSBhjZcWfP5zO4bLZor/Yw/dco2PtR7JL0Oa+Jy22cJ1AG5cbysiZBrgb29rVR7oBs/sWo4BhutD1nqc3/71Wr/Me9WnthaYchGRaGa9cZIqxJA2IkI=
X-MS-Exchange-AntiSpam-MessageData: dmXaooaYoEJPzewOSjwLuixV0HPa9S1kH/W+XZDlvYiX4TaAUzUVqZkd0KMZLGCvvPUV3ywGCsMtnfiRJbGqYHyUa7iVQJJzgzGL2SLClAXBhHpUDsXCZjmEO7obhIQNKAEq6eow0XRGIfBtyQJgqQ==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb428d3-0b8a-424c-f3be-08d940a65d2e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 17:49:12.7339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: BN7NAM10FT011.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7NAM10HT191
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_104922_022310_D52A1328 
X-CRM114-Status: GOOD (  20.02  )
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

On Tue, Jul 06, 2021 at 06:39:09AM +0000, Tudor.Ambarus@microchip.com wrote:
> On 7/6/21 9:28 AM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 02/07/21 05:41PM, Tudor Ambarus wrote:
> >> Flash does not support continuation codes and may collide with a flash
> >> of other manufacturer, Intersil being an example .
> >>
> >> This flash addition is just for demonstration purposes. As I don't
> >> have the flash, I assumed that it supports SFDP.
> > 
> > I found a datasheet for this flash via Google [0]. It does indeed
> > support SFDP (section 6.36). The data in the SFDP table is not listed so
> > we can't say if it is completely correct though.
> > 
> > I am not sure if we should add support for an untested flash. We ask
> > people to only add tested flashes and I think it is a good principle to
> > stick to.
> > 
> 
> We won't apply it if not tested and without the SFDP tables dump. This applies
> for all the flashes. Chris Morgan (in Cc) proposed to introduce support for this
> flash a while ago. If we get support from Chris, we'll consider applying it, if not,
> not.

I've tested the xt25f128b driver here, it works.  Note though that I
think the flags of SPI_NOR_HAS_LOCK and SPI_NOR_HAS_TB may not be
needed, as I believe on a cursory glance they correspond to different
bits than the datasheet has defined.

Also note that I have previously dumped the SFDC table here, if you need a more
recent dump please let me know:

http://lists.infradead.org/pipermail/linux-mtd/2021-April/085976.html

0000000 4653 5044 0100 ff01 0000 0901 0030 ff00
0000010 000b 0301 0060 ff00 ffff ffff ffff ffff
0000020 ffff ffff ffff ffff ffff ffff ffff ffff
0000030 20e5 fff1 ffff 07ff eb44 6b08 3b08 bb42
0000040 ffee ffff ffff ff00 ffff ff00 200c 520f
0000050 d810 ff00 ffff ffff ffff ffff ffff ffff
0000060 3600 2700 f99f 6477 e8d9 ffff

Thank you.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
