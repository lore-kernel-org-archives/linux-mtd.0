Return-Path: <SRS0=1Z3h=PU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8F3C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Nov 2021 04:02:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC9E0600D4
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Nov 2021 04:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC9E0600D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XwoTCAtjo0z83Xlhi4FiERHMJykInyDaa09SGa+UL/Q=; b=opCsq+40z8q8Sn
	Fddug4sayzncE7voVdqTO7o3NhBzmoTqGQIJ/kjuiaUcihfiYsP49bgv66l3NY4pKCjBXFSDamMwd
	zxXDo4Ba3tLurqxG/w/u/dL2AWly30ymhfK6aa4bn0G83rJ8TX6+coTCjn/hPW6vQ8KPIoPbry+Hg
	/UmX0/3Gy2VEmSMg4MGeoheDo1+xyRNguNVMOX/M6hgQ9xVc6PnwJ1CTVNEZX3KZMgPG2piYULagm
	OQHRTiWEImnR0XbUFo382zJy1uDCkOLGRjAhHjur9Zb4/9rYlYOQ9xon/LrqJMcl27hqL9htyNsa9
	ckd8Oo8bE+WmqxK00Mvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhOVf-00FDQR-L3; Mon, 01 Nov 2021 04:01:23 +0000
Received: from mail-eopbgr00040.outbound.protection.outlook.com ([40.107.0.40]
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhOVc-00FDP0-Dz
 for linux-mtd@lists.infradead.org; Mon, 01 Nov 2021 04:01:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/0x0/ET9ZSxTzyNvtmplymgh8Hm534t0ISBdZ+EcdEPN8VzI/wWjH0h64nenU9ySvI91Hyj/mbm356SSG1v+d+DEsZizMahw8NrIUg/KSSawuN9pqGKwkKWQr++hhgoI85ngAprsW9qVLaU/yrKK0GxZn7PTgVNX+wqMqh+ohdmVAnrJlnkkM0xQTYKAErZukl4RrW8MVpSFQo9Eaxa3YT7xqOX28gmhEEm5NNv0Q0E5XiNgWDDoAMLJjArsWRmlJPZoHrMBFXZL22qyChOb8H+IAL2y/fFUlCGOKaSL2/GprqU/KziQrhytFM/eHENEIiby+wbCr8/MZlP9F1KsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqhStSDj/sYl73M4PjIffxqx7DvNmbpPtrdQ7hJ9GgM=;
 b=fl7DdBisIdShD/WR3WNpU02I3Il+EjbGFDSid1OizURdkqtR26vdAuc/LX8SG9oxg4Aqr8bAptfptWWpm4fNiknuzdoGdPv5xotm2cWC2EJkm73eX1hk95VKnq4+leN3cMt+SplpsZ7xTAzAyK6ryNXFKE3qBTrw9COxPNmiUS9FofSUKhfR9BMzstabqUOSQ4aV2y1VVJ9JqY5AnUmtVQq+BognQDrEx5MBmXg1oLJ2B3zjztHI7C+dEzN256ROjI7FYwOe2hf+VHDHVxlxB5raPA+tzP214ezKHLYG6qghsiJctDTw/4AU0SIDv8g3muUBfgM3WMEOviqxm+LrPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqhStSDj/sYl73M4PjIffxqx7DvNmbpPtrdQ7hJ9GgM=;
 b=gNsKrJfAeHQ+/Y4ccbJwpenQTM324XRqmrjJ0/gqptXxy//eIovatD3DnAw5/4cGbmwFPVyIvFYQ3TtqwTCm5b7L0wDRcyKig+UJzo9WrYGmXK2maPX4QSMEJlze25FP12MjKmnTxfV7bUcCXcKM1iiUlIRHYbPFg80qGNschZs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by DU2PR04MB8757.eurprd04.prod.outlook.com (2603:10a6:10:2e0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Mon, 1 Nov
 2021 04:01:15 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::f96e:198:8fae:c59]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::f96e:198:8fae:c59%9]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 04:01:15 +0000
Date: Sun, 31 Oct 2021 23:01:09 -0500
From: "han.xu@nxp.com" <han.xu@nxp.com>
To: Stefan =?iso-8859-1?Q?Riedm=FCller?= <S.Riedmueller@phytec.de>
Cc: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "michael@amarulasolutions.com" <michael@amarulasolutions.com>,
 "ceggers@arri.de" <ceggers@arri.de>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 Christian Hemp <C.Hemp@phytec.de>, "gerg@kernel.org" <gerg@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [RFC PATCH 2/2] gpmi-nand: Add ERR007117 protection for
 nfc_apply_timings
Message-ID: <20211101040109.glroscaybeso4alo@umbrella>
References: <20211011084607.27a840e0@xps13>
 <20211012090224.4101984-1-s.riedmueller@phytec.de>
 <20211012090224.4101984-2-s.riedmueller@phytec.de>
 <20211013050148.2w373kpbfaeuxbwm@umbrella>
 <92d463460324d4501523f8a1da1f07c12fd6490f.camel@phytec.de>
 <20211022143514.lplk6jaxklq3rxry@umbrella>
 <3c7415036ad62278e144da43198490c3c57d5721.camel@phytec.de>
Content-Disposition: inline
In-Reply-To: <3c7415036ad62278e144da43198490c3c57d5721.camel@phytec.de>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: SN4PR0501CA0024.namprd05.prod.outlook.com
 (2603:10b6:803:40::37) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
Received: from localhost (70.112.23.252) by
 SN4PR0501CA0024.namprd05.prod.outlook.com (2603:10b6:803:40::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.9 via Frontend
 Transport; Mon, 1 Nov 2021 04:01:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f15a48d4-d99e-4803-e792-08d99cec4015
X-MS-TrafficTypeDiagnostic: DU2PR04MB8757:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <DU2PR04MB8757801E2E6274014D42E117978A9@DU2PR04MB8757.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O9GbD1Xd0pB0y7ww3PU9t5diTCUs7rEtqeAOz+xTW8+OH1pUMAysN2cn5CDR2IHI59xNAMODsf2j+qjbbjEV7DGgfzhd+bCLlJ9HpjiUabdAALFgnwbrpj5xj9aNznv6MbTdhtySVYajyg6q5yPvbdzkJjFr1Ifcsco1KEDBW07gncbMj9x/BWRMLxhf+SyiminETSMsq4qdYVL19SM3ThMB/DdfZ1ooQoH6HQ6XU6//w7SDSbqhkF3/3JsEbW6c5D/66aRv0XlkuJI4v2GKXt3haOg7rQDCze7KvhpImtQFDK/7bqcGlmPv6N37ho8j9B8nNdUkrnvXgMs/fNiX44LIkQfwGCZ6TU988Au/BCuzPKHNAidOUxHU9IWHHwEWibYNnFkSXPAZRbOIEhNVdgBp+jdvjLFfDdthUWbjLRKQRiArn/na5vGOBTbhL4eryad+OxA6Hwf9ovggGuCF82/CAbhLu5yXAwOtCiRamurAe1VIm2a/80v+m1M8pSgA79F6v9ZOJDb6wzq2J3g8B2AeNQAz2uymr+3VifL+cCrmY0j36Ce5eW1I7VS7vbG/CyZBGhlPJrWnLW58CLA2G94vUY6pk6CzxGh0Wp2om0CnfJMDvT96TITgenfJefgvwa0Guw4ZVCQ21YVds6kXbf+ULOL+NXiccKr1hySNYcKC50ax/AGzu/SsHfDXqa/bJ9+Wj5J424tdYRcw8HGCFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(366004)(6666004)(52116002)(6486002)(66556008)(186003)(1076003)(66574015)(66476007)(54906003)(6496006)(6916009)(33716001)(8936002)(26005)(956004)(4001150100001)(83380400001)(5660300002)(38100700002)(86362001)(66946007)(38350700002)(4326008)(2906002)(9686003)(508600001)(316002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vfyOw3hfV2dMmJ4ASB+Fex54goUPMEzGxo/6rl9rU5AakWsx/JCOBhBC77?=
 =?iso-8859-1?Q?wt9IeCvRXe8k2yo14xrBZYSv8Wvh7VMD/XOhI/KWT7Z0XuSNIlutBy3rY7?=
 =?iso-8859-1?Q?4DBaDXtzhYrT7PF+nFoUZS8wE3Fb8QUIGJhExiBtzvX3goe0F7sOw6yA+6?=
 =?iso-8859-1?Q?rbz4/nYmBTq4K3pesas9RDXDjeIKG3zqFwwXUywvZ+w5avmmLJp72u+4Z+?=
 =?iso-8859-1?Q?rDL5QABGD0d++uKKzgvdZxGXFcBlLbe0yEMzOYrmoM3etwdThAz/thIrAE?=
 =?iso-8859-1?Q?FtyXYqw3s5s89T2DEY1E5FbILXsNaV1k2Xnzx4RLao8mXs5Nhi5/dsjVQJ?=
 =?iso-8859-1?Q?DEk1YObGfJBSx+gcptipoMry7+yJgthp+A1xrHAf3QjEzclupkKB1iPyGp?=
 =?iso-8859-1?Q?OLhDs2KuUb+4+sIJMrGQg7Q9SLWc1QnfiYTx1hiW3emJ1WskW96pplLZgK?=
 =?iso-8859-1?Q?AR4DaRyzirBPMzkn0gYjjrE/jQl5ownABK8rLFxDaQs4lQtUo5RyJjOTBL?=
 =?iso-8859-1?Q?jMK+L2EVFyYf9nhozC/WQZMpiFC7wYLFWFzC2+6UFPz94DJFiXP7E7gmvZ?=
 =?iso-8859-1?Q?5mh7r+lshfd1n9jnnuUqbaP59ETjFk3qarR6NwE43Oawbf6tb++TzFLXSA?=
 =?iso-8859-1?Q?qTMhP/esi6vrK7xueuJ8ke71WtrOXKtpZbbXz2KhUCwESPr943uzEg4rZd?=
 =?iso-8859-1?Q?B5cuWnlZe/XNvp5DI+RGuegptCg7oqs+4tqQ4/ZlCtWLuoL0JGqlsxZx/O?=
 =?iso-8859-1?Q?nPvN4dI8O/jZoE3DbqWatPJF/axhHGQjinat64JgUGSwqJDl2XUNFaHLHT?=
 =?iso-8859-1?Q?TrJmcGjaN7CV8L9mBT35ftaDpVSap5WfW83UJfkRiixJ1IM2jBLGWwzYg7?=
 =?iso-8859-1?Q?R1q7xiP0DZc/jJYpxfD6wAOoYgS4lIiL3UwKfRjx2AKcFzzMAGXUy0Q+1d?=
 =?iso-8859-1?Q?cySX2XsgBHaxi53Syza3VN4zJpocXXjk1hFZ5dMThvoqs2/EhwGz28vrQz?=
 =?iso-8859-1?Q?eRvASYbhlm53YX1vrk8oJr8ASiACjMxnSSrpoJUmuD2eNYiSujfBnyRZEr?=
 =?iso-8859-1?Q?qRpl5GA5W8pTyzPB3IfwHcDzAQuGM3ep87n21M8oXccf34YKmNyzH/d9ho?=
 =?iso-8859-1?Q?zpvU1H2UtJdHK3tl4HiuycK5nJ3SnGlpUJFqmEckxM3K5CnJk6cl4SfrFb?=
 =?iso-8859-1?Q?8pefwMP76y48h0Er4PSjVVgSgaxcJ2kG4BbIQuQ/nRFKDZSJVCS9HZzqo2?=
 =?iso-8859-1?Q?aS2BCw+MJj0U3fkVAKVVxWNhL9xVxhEjgMsMyMaDLHUAmfvTTaaTVmWyQD?=
 =?iso-8859-1?Q?sYUe8Bj1N1duSjCGyjVqGrOnVXOqNxV0sHMcp2MPXtNeLVbmszfvhHcH5Z?=
 =?iso-8859-1?Q?hm5m2yxVqPabLff1UPJtD/YQJyPlBdLNja3RFE/b+lFD4gQ11WaewoU/8A?=
 =?iso-8859-1?Q?cGCdX4CUnsiqfBfJTJH3MvVZJTNUxBo/m+m3hcaOXh5Ecaxapd/Vqy9ntu?=
 =?iso-8859-1?Q?au2HdP55f4jR6HdFnxtveBZXNPrCZSg+AFqfXQKQzpRbghfxxy48qcAgP2?=
 =?iso-8859-1?Q?2B+no3e4N7zZLgREYBjR0afoZGWVZ2iwT15Xk22yyM9eOJ2mFEdI8xJ9aH?=
 =?iso-8859-1?Q?OqTo+nmILbH+c=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f15a48d4-d99e-4803-e792-08d99cec4015
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 04:01:15.4054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wWdlVLVxuYmrCP9Dkw9OJoN59IBB9F6BWkyebuklC86omDK5vTg6bnU2slhOEsl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8757
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211031_210120_531068_46D728E4 
X-CRM114-Status: GOOD (  38.95  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 21/10/28 09:28AM, Stefan Riedm=FCller wrote:
> Hi Han,
> =

> On Fri, 2021-10-22 at 09:35 -0500, han.xu@nxp.com wrote:
> > On 21/10/22 08:45AM, Stefan Riedm=FCller wrote:
> > > Hi Han,
> > > =

> > > sorry it took me some time to get back to you.
> > > =

> > > On Wed, 2021-10-13 at 00:01 -0500, Han Xu wrote:
> > > > On 21/10/12 11:02AM, Stefan Riedmueller wrote:
> > > > > According to i.MX 6 erratum ERR007117 gpmi clocks need to be gate=
d off
> > > > > when doing a gpmi_io clk rate change. So gate the clocks off befo=
re
> > > > > the rate change in nfc_apply_timings and ungate them again after =
the
> > > > > change.
> > > > > =

> > > > > Otherwise this rate change can lead to an unresponsive GPMI core =
which
> > > > > results in DMA timeouts and failed driver probe:
> > > > > =

> > > > > [    4.072318] gpmi-nand 112000.gpmi-nand: DMA timeout, last DMA
> > > > > ...
> > > > > [    4.370355] gpmi-nand 112000.gpmi-nand: Chip: 0, Error -110
> > > > > ...
> > > > > [    4.375988] gpmi-nand 112000.gpmi-nand: Chip: 0, Error -22
> > > > > [    4.381524] gpmi-nand 112000.gpmi-nand: Error in ECC-based rea=
d:
> > > > > -22
> > > > > [    4.387988] gpmi-nand 112000.gpmi-nand: Chip: 0, Error -22
> > > > > [    4.393535] gpmi-nand 112000.gpmi-nand: Chip: 0, Error -22
> > > > > ...
> > > > > =

> > > > > Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> > > > > ---
> > > > > Hi,
> > > > > =

> > > > > I'm not sure about the error handling here, if it is actually
> > > > > neccessary.
> > > > > So some feedback would be nice here.
> > > > > =

> > > > > Thanks,
> > > > > Stefan
> > > > > ---
> > > > >  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 21 ++++++++++++++++=
+++--
> > > > >  1 file changed, 19 insertions(+), 2 deletions(-)
> > > > > =

> > > > > diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > > > b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > > > index a1f7000f033e..326c8a895f1f 100644
> > > > > --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > > > +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > > > @@ -713,15 +713,28 @@ static void gpmi_nfc_compute_timings(struct
> > > > > gpmi_nand_data *this,
> > > > >  			      (use_half_period ?
> > > > > BM_GPMI_CTRL1_HALF_PERIOD :
> > > > > 0);
> > > > >  }
> > > > >  =

> > > > > -static void gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
> > > > > +static int gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
> > > > >  {
> > > > >  	struct gpmi_nfc_hardware_timing *hw =3D &this->hw;
> > > > >  	struct resources *r =3D &this->resources;
> > > > >  	void __iomem *gpmi_regs =3D r->gpmi_regs;
> > > > >  	unsigned int dll_wait_time_us;
> > > > > +	int ret;
> > > > > +
> > > > > +	if (GPMI_IS_MX6Q(this)) {
> > > > =

> > > > Not only for 6Q but for GPMI_IS_MX6
> > > =

> > > Can you confirm that i.MX 6SX and i.MX 7 are affected by the ERR007117
> > > erratum
> > > as well? Because the i.MX 6UL/ULL are included by the GPMI_IS_MX6Q
> > > already.
> > =

> > i.MX6SX has the glitch issue for sure, but I can double check if it's d=
ue to
> > the
> > same errata. I will also go check if the errata will affect i.MX7
> =

> Any updates yet?
> =

> Thanks,
> Stefan

Sorry Stefan, I didn't get useful info so I involved more people for this
question. Hopefully can get an answer soon.

Or you can just add 6Q and 6UL/ULL first.

> =

> > =

> > > Or do we need another macro for i.MX 6UL/ULL as Christian has suggest=
ed
> > > earlier?
> > > =

> > > Thanks,
> > > Stefan
> > > =

> > > > > +		ret =3D __gpmi_enable_clk(this, false);
> > > > > +		if (ret)
> > > > > +			return ret;
> > > > > +	}
> > > > >  =

> > > > >  	clk_set_rate(r->clock[0], hw->clk_rate);
> > > > >  =

> > > > > +	if (GPMI_IS_MX6Q(this)) {
> > > > > +		ret =3D __gpmi_enable_clk(this, true);
> > > > > +		if (ret)
> > > > > +			return ret;
> > > > > +	}
> > > > > +
> > > > >  	writel(hw->timing0, gpmi_regs + HW_GPMI_TIMING0);
> > > > >  	writel(hw->timing1, gpmi_regs + HW_GPMI_TIMING1);
> > > > >  =

> > > > > @@ -739,6 +752,8 @@ static void gpmi_nfc_apply_timings(struct
> > > > > gpmi_nand_data *this)
> > > > >  =

> > > > >  	/* Wait for the DLL to settle. */
> > > > >  	udelay(dll_wait_time_us);
> > > > > +
> > > > > +	return 0;
> > > > >  }
> > > > >  =

> > > > >  static int gpmi_setup_interface(struct nand_chip *chip, int chip=
nr,
> > > > > @@ -2271,7 +2286,9 @@ static int gpmi_nfc_exec_op(struct nand_chip
> > > > > *chip,
> > > > >  	 */
> > > > >  	if (this->hw.must_apply_timings) {
> > > > >  		this->hw.must_apply_timings =3D false;
> > > > > -		gpmi_nfc_apply_timings(this);
> > > > > +		ret =3D gpmi_nfc_apply_timings(this);
> > > > > +		if (ret)
> > > > > +			return ret;
> > > > >  	}
> > > > >  =

> > > > >  	dev_dbg(this->dev, "%s: %d instructions\n", __func__, op-
> > > > > >ninstrs);
> > > > > -- =

> > > > > 2.25.1
> > > > > =


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
