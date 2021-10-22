Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A36DC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 14:36:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FA2B60EBD
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 14:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2FA2B60EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zEc/gN0+VknyDTB+eU4L+ry/H/Zai/bO0gXoYXIpwfc=; b=M82ZpZRQU5I98r
	g1SAiXwjlysa40oDo/f+9Yp8PPduNdgVCgpBf/8j+QvwPN6fn1AY7AuaTZbLgaX7vxoCTQPFhXOJG
	0JwG1XD0tuGAGmv30/rzmOiHtSQCvRy52BA+yHicQmYrhKcuqw7x2HYnHR4MZaVwq3jNOsHjr3ssu
	jdGN2msedthwsZcYwAqz2YJgugqLmnTQRIelFMTv9PpRcKmyZpjZfxBPg98JUryc1QVgdC3LobZjw
	GblK0UJhKj10N4Lv//eI7Podl8mzKSUBl4ewE6pFlle6zWRGU/Irv4elsvHK7BHEEQuuijXf3Qg1A
	pnbxZ2pI515qMLYTJklQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdvdr-00BIEH-Qw; Fri, 22 Oct 2021 14:35:31 +0000
Received: from mail-am6eur05on2081.outbound.protection.outlook.com
 ([40.107.22.81] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdvdo-00BIDg-D5
 for linux-mtd@lists.infradead.org; Fri, 22 Oct 2021 14:35:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4JR3vdIpgsV2wm6tB2ateVGh1R2fMIZCsSOxFvRsafYO+rxEDyMyGnCF/mKgumrC2tH57T+lZZ1Ba33Yq2sJfXBngOd7scnlzCdYcd1vKDntaoUasUcbbI9a+0H5OMSThACIdmghS1dpOvu7d0/sR+wM6Lj6C4yBHfn40EO/RNPFukJ7ENj7fawPC3Dcr0H2efoA1sGT9G7VIdOg0fPVvaISf4Ku/4bsZqjHPLxAgRdapGh2ucwTxJlji+pTOdKGgy2ui0KT1AjGumkOpOCXwZHnyOfu/RXl1x5sqbnNhrDvlSyrPK92TTZsj32zSrLkqSWpNGK2iyX4yritpJeaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naE9qEWIpt22LZySiJKDW6iIulS2tb1k8eFn80P7efo=;
 b=drjeKGeOyJSNuYXOjQSzfkrHuWdhUfqtNmG0yaAH4ptlB7Y01xlBvFy+ZDRQweqJuz2URY7IE3nP/FRWI3fh38y2EfSctMf4cs9oq3MY5yq05H5tyZ1M4wPJ+PobkILcS8OQPKgA7WGwDHWFS6Xpdn0svxbo9HN9Hk7RPxpn8I5RQNUQVhDEcJjUN0+uFcmnyHFJrJJZuPt1vvDXvT0WhEgkPXpmh/PZm516a0Bj2ilqIA53xP30sOntErJDEuTUcac+PbJJKdy2I+IMoejrLWeSVU0RN5MCJstmbCvfTXEp7jFaFbHLG+X8lIzcjpV+00j/vhamgR8glqoPO8RGMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naE9qEWIpt22LZySiJKDW6iIulS2tb1k8eFn80P7efo=;
 b=iKEzBpKbKv3FBBed1p8032KaX6UBURc1L14hx0DzF90nipNOBXrZCnOCzV1vCSGJavryIdSGQ5RKwyX4S9+tirgSLjYUzHUu55452v16oEH1R3pDQw/6j82uJKSRrkT95eHGffI80HFWvznmZYCU3NQoeW8OnQBV3WIgfjfuNAc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by DU2PR04MB8551.eurprd04.prod.outlook.com (2603:10a6:10:2d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 14:35:22 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::f96e:198:8fae:c59]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::f96e:198:8fae:c59%9]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 14:35:22 +0000
Date: Fri, 22 Oct 2021 09:35:14 -0500
From: "han.xu@nxp.com" <han.xu@nxp.com>
To: Stefan =?iso-8859-1?Q?Riedm=FCller?= <S.Riedmueller@phytec.de>
Cc: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "michael@amarulasolutions.com" <michael@amarulasolutions.com>,
 "ceggers@arri.de" <ceggers@arri.de>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "gerg@kernel.org" <gerg@kernel.org>, Christian Hemp <C.Hemp@phytec.de>
Subject: Re: [RFC PATCH 2/2] gpmi-nand: Add ERR007117 protection for
 nfc_apply_timings
Message-ID: <20211022143514.lplk6jaxklq3rxry@umbrella>
References: <20211011084607.27a840e0@xps13>
 <20211012090224.4101984-1-s.riedmueller@phytec.de>
 <20211012090224.4101984-2-s.riedmueller@phytec.de>
 <20211013050148.2w373kpbfaeuxbwm@umbrella>
 <92d463460324d4501523f8a1da1f07c12fd6490f.camel@phytec.de>
Content-Disposition: inline
In-Reply-To: <92d463460324d4501523f8a1da1f07c12fd6490f.camel@phytec.de>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: SJ0PR05CA0083.namprd05.prod.outlook.com
 (2603:10b6:a03:332::28) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
Received: from localhost (70.112.23.252) by
 SJ0PR05CA0083.namprd05.prod.outlook.com (2603:10b6:a03:332::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.11 via Frontend
 Transport; Fri, 22 Oct 2021 14:35:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a0033e7-ec75-4e1d-cb5e-08d995692df9
X-MS-TrafficTypeDiagnostic: DU2PR04MB8551:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <DU2PR04MB85512796B9542D4E9BE6922597809@DU2PR04MB8551.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZxC5Jg0I3nE6/T39yU62O9+74g5iOlRYQe1LvyCb9U68OztU0LLelGYWkBQuVudN8rxTu1imBUkA/LOTEu+Nm5ql18QvwIcOKxX4qNhxY6UCQj9M0zphCZyUY3JCR3agHvZ/4hU+nLgpepXFhx9Twla06LYo3KWDy/bMz4L0Bn1EiX9V5zfsXHqbVtmFnsYQSjvoSAB/Fa+VvcIHBY1gTSzdn7zI05qDEAcwnoC7ipQObWvWT3Y36g+w6GdSkTQqlUGXiYQZMM6PlN4oyox6AJNETv/g8dF2jFir2yKzsxoNUCIoROYN0Xo53rc5+9wVFBgwgQwpfAhrYHlDP9RNZ/D5oTVYHAI6L8/eBWNQzZKrSD6KlbhL5no+6Jj2qi1VHM2Yr6I13L7J6L6ayaOjwt0IBI+LsK4drr1TUH5XtihSvMQ6tCzc1v8baLIeE3CfGBbstwpU0mFr8oF48A2q8KOsZ2GHYKgkWfeHJkf8JLu0f6qQ2sDvOVhOStyt7UmGgA8tbq3fJiJrilhJUKL+WQfigdplXXVW5B51Ieh8VBoWtQHzR+xsSpoEvKDfCoeVlJKsZbM5CtvrS3CLE67t9CgyNWju3LMBTBBRWfM9QiWU8VZLt/XDGVMpnkz9xZyqkSGqQ1WDO0Rhwsm2ljgHQjnVh+FhebPPA62I+xhe3WqMNNg3b/7a4WqL6vZuolHBy9MOZ5U12rQCU891oBERkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(366004)(1076003)(86362001)(33716001)(38350700002)(38100700002)(26005)(186003)(6666004)(8676002)(508600001)(6916009)(4326008)(956004)(4001150100001)(316002)(8936002)(66476007)(52116002)(6496006)(66574015)(6486002)(9686003)(66556008)(5660300002)(54906003)(66946007)(2906002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?P89f24Ca0TfJx1+wKVzjoiuda2wTbWVblWn8ValBYRU1oDb5/KbN1/sebD?=
 =?iso-8859-1?Q?BJmq7fOXpjJyEf7Ft6glXWoQkQNpjhswugxBWbDqHlWR9Sn9j/RlZcwJcz?=
 =?iso-8859-1?Q?sgrcPxRzGCgItu4SZOSyhjUAsMnICL0XNXWgVOrogS5HiJEw2uLg0SqrIk?=
 =?iso-8859-1?Q?papaY7BHePVtN/XgSmzNEESZ22XZzZxvk+VclwqTLiJYYhLBbUOgG8B0tF?=
 =?iso-8859-1?Q?/EmBlgw0WeQOxxF+9e91POstKroRDVzpoYUwwQVMgsQL5hlyGTFNxn1OOa?=
 =?iso-8859-1?Q?HguhDskrsOuGLM/ycHBLRz9AbpM5ukfTqAp/EfT6dTBPLqNc8WV8INAPUm?=
 =?iso-8859-1?Q?QfTOTe3Q9Owb9NlnQgm8QBqK6Hy9noXLzK6u0oyMnlgVm0LvQtjb9M5hAI?=
 =?iso-8859-1?Q?kGU/sYKqfstp7XlB3JxZ5POCEHPjmpzYQ3+C5UI32x9kdW2bS2hxWxehLY?=
 =?iso-8859-1?Q?FoN3eVxOhkmkpXpyjW1IVfbbkOblTAGiy+4CB7Nu5DsnYligEmX3VMsc+G?=
 =?iso-8859-1?Q?du5n30j60Z37iR7n474MD7Ks4JQoTzGByZgpV91tnC9DgTBoLc+kPa+zaV?=
 =?iso-8859-1?Q?W7r5XzJERCNoVOGexIiDeC8gqx+Ux9rO2E67Kg2Xr83dpsw8XjGj03vIYr?=
 =?iso-8859-1?Q?u7bKmojpQnH3EB+y1wdojDHT95kVboC5YEhgIaHTFjJOEASV8qw8bqC5zk?=
 =?iso-8859-1?Q?w5d6EonTUuxfclrPFAauj8eOPXtCU2DrE+lyagbA9Fk2EWz6sAu3v2vE1y?=
 =?iso-8859-1?Q?o0s3hCbv4Q4x0IYSXQOHHu4gCXSBAApjfWFzTSJXcRk1A6gb57F+ad1WbP?=
 =?iso-8859-1?Q?6+pYba7RXjtbOdwrtxtVHFCIETX8U4mDWiIWKU3H6Tg7knJMcuV8ru30BZ?=
 =?iso-8859-1?Q?AxFBJCr/NxKlwh5DinSlJ2gNCv18cX5/0Ix/es4GaULuPxVsrw52IvGdQU?=
 =?iso-8859-1?Q?TEiVdnIHoB5kmS3O3EXKGRg0tfsv3AUAxCsiMCTj9673MDKm2UuUVqUVO6?=
 =?iso-8859-1?Q?gupZcJfH/5vQmDDhp0Up99XLooOexgFUcFI0E6l2Yhm11TfETv1wpNLNuC?=
 =?iso-8859-1?Q?+SVttrJ8mZaAzyK2UmzmFNlncDiZYg3iqRbrPU5ZaoXw64119TTPlvlOd9?=
 =?iso-8859-1?Q?bxz9EyZfR1DsA2AV/gQQmHWr3iN6nRCIbDViWgGDuUsG6QGYuiDk8leTsE?=
 =?iso-8859-1?Q?ndZIrcsuYTeI210/n7yA03reHZ48aw/8LvWl+iQNDeVCGVJXt3xBiSgC7O?=
 =?iso-8859-1?Q?635lQMWOxZE7FmdhYd7yxyVwCjZSf/w7wOd+imEgOxAe0RIVAtPvddCAr/?=
 =?iso-8859-1?Q?F5s/9gNf/oDXAW+jIYNdxb7CwOjyVErHl44oXo4ae8R6sHSaIJyNroke9o?=
 =?iso-8859-1?Q?Ec+A0lwz6FbuuFcrOAcOX34lbj+5swvmZ5kuCrKG1Xxq2RiQTc3T1fQ1hv?=
 =?iso-8859-1?Q?hgUZomL+4guEBhf9OBXEemosDW+0U1xcNOPeS+YpBda6C79jWe2j6vyM7o?=
 =?iso-8859-1?Q?4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0033e7-ec75-4e1d-cb5e-08d995692df9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 14:35:22.7246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: han.xu@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8551
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_073528_501150_6DB1A3D7 
X-CRM114-Status: GOOD (  34.66  )
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

On 21/10/22 08:45AM, Stefan Riedm=FCller wrote:
> Hi Han,
> =

> sorry it took me some time to get back to you.
> =

> On Wed, 2021-10-13 at 00:01 -0500, Han Xu wrote:
> > On 21/10/12 11:02AM, Stefan Riedmueller wrote:
> > > According to i.MX 6 erratum ERR007117 gpmi clocks need to be gated off
> > > when doing a gpmi_io clk rate change. So gate the clocks off before
> > > the rate change in nfc_apply_timings and ungate them again after the
> > > change.
> > > =

> > > Otherwise this rate change can lead to an unresponsive GPMI core which
> > > results in DMA timeouts and failed driver probe:
> > > =

> > > [    4.072318] gpmi-nand 112000.gpmi-nand: DMA timeout, last DMA
> > > ...
> > > [    4.370355] gpmi-nand 112000.gpmi-nand: Chip: 0, Error -110
> > > ...
> > > [    4.375988] gpmi-nand 112000.gpmi-nand: Chip: 0, Error -22
> > > [    4.381524] gpmi-nand 112000.gpmi-nand: Error in ECC-based read: -=
22
> > > [    4.387988] gpmi-nand 112000.gpmi-nand: Chip: 0, Error -22
> > > [    4.393535] gpmi-nand 112000.gpmi-nand: Chip: 0, Error -22
> > > ...
> > > =

> > > Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> > > ---
> > > Hi,
> > > =

> > > I'm not sure about the error handling here, if it is actually neccess=
ary.
> > > So some feedback would be nice here.
> > > =

> > > Thanks,
> > > Stefan
> > > ---
> > >  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 21 +++++++++++++++++++--
> > >  1 file changed, 19 insertions(+), 2 deletions(-)
> > > =

> > > diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > index a1f7000f033e..326c8a895f1f 100644
> > > --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > @@ -713,15 +713,28 @@ static void gpmi_nfc_compute_timings(struct
> > > gpmi_nand_data *this,
> > >  			      (use_half_period ? BM_GPMI_CTRL1_HALF_PERIOD :
> > > 0);
> > >  }
> > >  =

> > > -static void gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
> > > +static int gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
> > >  {
> > >  	struct gpmi_nfc_hardware_timing *hw =3D &this->hw;
> > >  	struct resources *r =3D &this->resources;
> > >  	void __iomem *gpmi_regs =3D r->gpmi_regs;
> > >  	unsigned int dll_wait_time_us;
> > > +	int ret;
> > > +
> > > +	if (GPMI_IS_MX6Q(this)) {
> > =

> > Not only for 6Q but for GPMI_IS_MX6
> =

> Can you confirm that i.MX 6SX and i.MX 7 are affected by the ERR007117 er=
ratum
> as well? Because the i.MX 6UL/ULL are included by the GPMI_IS_MX6Q alread=
y.

i.MX6SX has the glitch issue for sure, but I can double check if it's due t=
o the
same errata. I will also go check if the errata will affect i.MX7

> =

> Or do we need another macro for i.MX 6UL/ULL as Christian has suggested
> earlier?
> =

> Thanks,
> Stefan
> =

> > =

> > > +		ret =3D __gpmi_enable_clk(this, false);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > >  =

> > >  	clk_set_rate(r->clock[0], hw->clk_rate);
> > >  =

> > > +	if (GPMI_IS_MX6Q(this)) {
> > > +		ret =3D __gpmi_enable_clk(this, true);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > >  	writel(hw->timing0, gpmi_regs + HW_GPMI_TIMING0);
> > >  	writel(hw->timing1, gpmi_regs + HW_GPMI_TIMING1);
> > >  =

> > > @@ -739,6 +752,8 @@ static void gpmi_nfc_apply_timings(struct
> > > gpmi_nand_data *this)
> > >  =

> > >  	/* Wait for the DLL to settle. */
> > >  	udelay(dll_wait_time_us);
> > > +
> > > +	return 0;
> > >  }
> > >  =

> > >  static int gpmi_setup_interface(struct nand_chip *chip, int chipnr,
> > > @@ -2271,7 +2286,9 @@ static int gpmi_nfc_exec_op(struct nand_chip *c=
hip,
> > >  	 */
> > >  	if (this->hw.must_apply_timings) {
> > >  		this->hw.must_apply_timings =3D false;
> > > -		gpmi_nfc_apply_timings(this);
> > > +		ret =3D gpmi_nfc_apply_timings(this);
> > > +		if (ret)
> > > +			return ret;
> > >  	}
> > >  =

> > >  	dev_dbg(this->dev, "%s: %d instructions\n", __func__, op->ninstrs);
> > > -- =

> > > 2.25.1
> > > =


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
