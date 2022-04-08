Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F40C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Apr 2022 22:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KPrp2YD6wVQOWQa0HlJyoMItqzMjEQC5iB9GsWr8J14=; b=ll2MOutIvLCfJ+
	sclb5anVEHXpuYAM18DtSKUYooBMcygFdLqpAKZdjaDP+rAiMNWx50Zxo+DkPcHmd3WL8Y8tylFxh
	KwxlJEL5cNbNPX/lGtrL10e3qG5GPkdPGvSB5y2wmjryrKuznDYULf8O+rRGdu/ZkhKdJKW2L6fhw
	9MU4E7x5m6lM7B8IivaWnxcPG/ySryoddEW04NeiOHcLjhP6fNDv2lHH2tfhc1TeBJECagmPJaebe
	ybBc05tJm80b2IWWjwqm5tvpK3HUQJL6AKDF+qMjhhIc7J4pzgJqMcEpE65agwY+4uj340LKeJ9PP
	hBFhzjs9GXW/ZWLsS3EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncwk0-001Lpy-UL; Fri, 08 Apr 2022 22:06:05 +0000
Received: from mail-db3eur04on0603.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::603]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncwjx-001LpZ-Ba
 for linux-mtd@lists.infradead.org; Fri, 08 Apr 2022 22:06:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2ymx9VylR8fDL7NrGGjRampx3JID1ENdT9PhEIk6PmLz5snqs800C5nKta1c+tPvuM2BjylLGHuhgFo9NbnZ+fC1yxJXebG98InD9rfkWDh/hlznvAEP+5/UBv+/oF87xTuGwMvztS4lU2RIywWuRe2XXn7hVqg+rP62NDjEbveZ6U8Aw3i8ztiPXxYsrMFtSi4K1y1hifcRDxn7iF5GJFl3TAAbmejFl4kBaFA+fXGNsUMbVBGw1nzs2V3PMv3Pbf4qEy3xcRs90inRnQ1zsP2Q6rjS45s/Nc45D6Waupqa7K8w09dg2RWAPhXXgwvW1G0SEMZh1alhShc4ivBKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aY5hFL9gczruKLfKBgsPticprlmMce95seNl3okGsTk=;
 b=KJV0UgKKD3fIpriVRnQ02+ZwvnESFWxdPsZvjYsdiFKbCY9m4wOJPLXubrH3mHJSuCMbPEg21HHg1EB8+bqCed0xjY2b10BK/ySGZ37BKYxEzQnIGxVMQO1iPI6cEwLy552wjW2VlnHnh1eJyZcCx6Hppnl6g9DqW5t0cnbgEXhBzTSAM8Yco218nKheLG0+X+4RPyyRi2FmTdNLaAau2A8B5KvoEh3wsvf8UCXP+DjnGpmvNBz11iaFMIKbtuIBRBGEsHLM/0e0XAQQ7pcEV4LTBu1ttAV5wEMu515Kx9AUJcOqjOLYbmxOzW9HiZ7wSTgdwJK5rLPNyXj3WpWT0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aY5hFL9gczruKLfKBgsPticprlmMce95seNl3okGsTk=;
 b=mt0S9GIU5hs+PrN5pN9XTQWHaMjuNcw8Wmq/h4TnaoHRetfCQs6+F3Y/4/HSVStnxDGkT6W7D3o//25VCIWRPu6QGU/T1mYBXK3kr6M6//YclRDMHGYoE0YqWFTRRqHOxGsfRcKSJsDeQYWgs58L+Cipf8k5eCW2OijknpApLk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 22:05:51 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::b048:39cb:7748:ed56]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::b048:39cb:7748:ed56%8]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 22:05:51 +0000
Date: Fri, 8 Apr 2022 17:05:41 -0500
From: Han Xu <han.xu@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: sean@geanix.com, frieder.schrempf@kontron.de, festevam@gmail.com,
 ye.li@nxp.com, peng.fan@nxp.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 2/4] mtd: rawnand: gpmi: Add strict ecc strength check
Message-ID: <20220408220541.7sjtg6wysc4qzw3z@umbrella>
References: <20220404195427.8871-1-han.xu@nxp.com>
 <20220404195427.8871-2-han.xu@nxp.com>
 <20220405092826.1f70fb70@xps13>
Content-Disposition: inline
In-Reply-To: <20220405092826.1f70fb70@xps13>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: BY3PR10CA0026.namprd10.prod.outlook.com
 (2603:10b6:a03:255::31) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa12d4af-6734-4422-5866-08da19abf1a7
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_
X-Microsoft-Antispam-PRVS: <VE1PR04MB6382DCF9F045229A3774375297E99@VE1PR04MB6382.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9WSeB3Qnmcy0SVmGsvLLGDmlx7JnioNSSuRynjLGVqOmXxPPCWNH2lrVE/nNtI0vP6OSuhRQbqTe/aBzkgMT2KFqH/XePFXUjlT6Riq1C0/Xw0j2dP1fAXyoYZOonv+IvUy9nzl1Aeh6tOQG0Ui3rAK1k6zij3L9Ep3CRxQnBxITOCPG2EA411B9HGNJuF9Z2qN4kq8Nq+4AI5isxCY2ACIDE5oEKk21d3NkOFg7vXZtizPgFMgTL3tQI2tpSU30c+dLXLQBS0r+N0+VB5oqoMRZSrpfvD+aJ6rlsPvy844TCbn9L+5CkiJp1PrJkXF0U7sguO5k3ZzBrC4HZaQeBDOVYCUl3hZjR+cHrp6KL5G+b1c94IEsRvJZRZQfJOeTXOX13pGlYCYDOrynKgFYmL52tBHvU+cFBaG0sqiheyiX8cYngOaOD6FRHFh45Q2L2DdZTdpL65OHv78QEeSdoGY6IKVndyyuL4vyBGrIL42dnphDcfLYEZTR1Rr1/8T8SE2wsL7UzgUBXTA5HT/OU8bNazwvbl7onyxspVWZqQnX75lpVx0H/aGUjA56NkY7PL4A00hbtes0fOZunVfUgVIlUtr3csYFr5pswlbtNcEHcoNavi6zaQUJagiJ/dDPymnuqkAROJdqqh2C0SOQKOQmr/cdqJrPcuvWJ/kq93sQsBV96rBl2Nbo7GQgqJGhFi456ysBJZcD6GlpLxG4hw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(4636009)(366004)(83380400001)(1076003)(86362001)(186003)(5660300002)(6916009)(8936002)(8676002)(26005)(6486002)(4326008)(508600001)(66556008)(66946007)(66476007)(52116002)(2906002)(44832011)(33716001)(6666004)(316002)(6506007)(38100700002)(38350700002)(6512007)(9686003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pQmFzqMi+N73CkfpEwetNMCwbSpxdxiQGjAQQQ9pi0oHwbtzvaPxDRe9ea?=
 =?iso-8859-1?Q?5RG1HciMBrO2CtiW43w9stL6JShcSrtVcg22AIlEIU7oYTM4Y2PFfH0/pb?=
 =?iso-8859-1?Q?Eag34muggOjrdSU48we/oxdm9aZoKndfnmV0BlvhpBrJ0SY2yXShQuXj94?=
 =?iso-8859-1?Q?/wWlPuz5UFgPFuWfda+u5WdNVMyoNxOJFrluxCUsoVMR9JF9ryCHJOH15n?=
 =?iso-8859-1?Q?zYFDXFGWHprNfwv08HpZLX56ZRwZm4TbojojqCrmGYjNH1sC7Gec6jFnVq?=
 =?iso-8859-1?Q?7L4RwX3ChNisJiekfqiC8RIQiyyGNfQZWUr0+sj82D7G/q5Eox7jFOdFia?=
 =?iso-8859-1?Q?fTYMi2os3wV0co1AfoAkF3K7ofLPV2UUA/KChBe225wud+k7QskF9gszCt?=
 =?iso-8859-1?Q?VNrDHTykBc6P6ZW48SyOixsUHSwvObyaTghB0cT1OR7ps9bq6eU2aPEkMd?=
 =?iso-8859-1?Q?WvtZUGsrVNTSoSDwTe49lYIuvmQJuf8hUZNkguv9JRMNYAbQjoDe9yiLfn?=
 =?iso-8859-1?Q?sLBZXgDsYZmOfiHIMl2kKikvoJZCJjkUxElM9orm49rENWTN8gZLYZFy6l?=
 =?iso-8859-1?Q?VwzZVa/9Szaw+wujQq1U1Fsnlib9VF6QjLVdu8V0DJNAlTfzWPV18msGjm?=
 =?iso-8859-1?Q?7OLGt3gpwwATsXrd4pr1xwb4/kfnViCrEGiwePddOMH9VdvQ++UkdczgMY?=
 =?iso-8859-1?Q?XTeq5199TufRglQUdd5A/0aYacU5NfgdX0dbpwhyMOy41laq9UJk+fN+pH?=
 =?iso-8859-1?Q?0yafPK1lqbT+upg5W7jTEvbnrXaRC6YjKFFUj1AHwZ4OeBd4MV///d9i8O?=
 =?iso-8859-1?Q?Ix5sRCwiswMshlwCAKN82jsDK3FQWZKyFsG8XJjH7vRLcyAzkTXra/6+F7?=
 =?iso-8859-1?Q?AT8Y6yACpoSLVInQcTobU/zT7jsmbEnRkl9n5iHBquM5709CfuoIT3FC5o?=
 =?iso-8859-1?Q?QRzoBdMoc8DMHWVY07AH2ZrWZAM5Wdlt3b6dhyuH5OyGScbHBfqpbwr/vY?=
 =?iso-8859-1?Q?hndZN5mQNnQf+NOdvq7FePPoPhNpDvKQV+6mUQCqq5VUx0ZWgfrbcqyYVo?=
 =?iso-8859-1?Q?YtmIDuYi+Cyq8z6hcnYeX4VPNM+hIBN+AKtp+j1+R24sxjHaTpNbShFgWS?=
 =?iso-8859-1?Q?MN4pyt1zWkfcQAk3dtAMhedqWkIh9M+f0A5ZuUHN0kRyke9KfGafetEOKL?=
 =?iso-8859-1?Q?eTlnS6ZQoPFWGC655LQG3Bx41l6TXNoOgND/gCQr4stTAj6NNRAsx89P+J?=
 =?iso-8859-1?Q?cbXm/cqGwbiFk0ZLk6G89Kh4THmlwspjw2aent9lzpdER+2GvYXmzP3YCN?=
 =?iso-8859-1?Q?uugjj6KJefjPA7niL2t/91cUOvmbJKYg+/E3s/TrwQXhBoftxRw3Cqs07Q?=
 =?iso-8859-1?Q?wRryd2wbvJ4S0Stpa+0drlAS+a/muJIYrnr6KhnZ1KVoz0btXhl5DbyeHO?=
 =?iso-8859-1?Q?ixIlTb6VNbpHyM73V3/dXldMUs7qp2LUNnSQy8P3kaI7j9ksF6La+65Oxe?=
 =?iso-8859-1?Q?LAvoN2ZhVT2gy72TW6FzNs7mk3lp73aKZa/wdUPuH4lhPA9xxBVnc/V3Xr?=
 =?iso-8859-1?Q?ft27Z7MBbM3G0GH0fFHpdvQRkLL214ZHog0LWs9HSgIxoglVyOUrbQTSmM?=
 =?iso-8859-1?Q?0SD6ipwda3sgjiSItYoyO2qCm6MOUff+joKdAbIU4Dqc85fa+OgJ3BVtKs?=
 =?iso-8859-1?Q?92JB//t9EWTNKV6lCtxZYEJ4PLXt+v/iY1oKAnfHVZk+FrtN38Shuje842?=
 =?iso-8859-1?Q?Cymfvv8yOrYPp3rykDErAV5Gle6K+p/OhpTn/BUPt8kT70nPP/Ok33ybD1?=
 =?iso-8859-1?Q?yDYH19/UTw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa12d4af-6734-4422-5866-08da19abf1a7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 22:05:51.2911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5m2Qw5JlYO3Uu0USxpz7sei+dwx51UotTuRnMgytBgid99NGChjNQKkT9G8Y5Dj6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6382
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_150601_442402_E8C5119F 
X-CRM114-Status: GOOD (  27.30  )
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

On 22/04/05 09:28AM, Miquel Raynal wrote:
> Hi Han,
> =

> han.xu@nxp.com wrote on Mon,  4 Apr 2022 14:54:25 -0500:
> =

> > Add strict ecc strength check in gpmi_check_ecc() function, which is
> > same as nand_ecc_is_strong_enough() did. It will check both correct bits
> > and correct bits per byte to ensure it meets chip required ecc strength.
> > =

> > Signed-off-by: Han Xu <han.xu@nxp.com>
> > =

> > ---
> > Changes since v2:
> >  - split the ecc check to a single patch
> > ---
> > ---
> >  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 24 ++++++++++++++++++++--
> >  1 file changed, 22 insertions(+), 2 deletions(-)
> > =

> > diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/n=
and/raw/gpmi-nand/gpmi-nand.c
> > index 4144d5937103..9a37f8cc663e 100644
> > --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > @@ -238,9 +238,14 @@ static void gpmi_dump_info(struct gpmi_nand_data *=
this)
> >  		geo->block_mark_bit_offset);
> >  }
> >  =

> > -static inline bool gpmi_check_ecc(struct gpmi_nand_data *this)
> > +static bool gpmi_check_ecc(struct gpmi_nand_data *this)
> =

> This change should be in a separate commit.
> =

> >  {
> > +	struct nand_chip *chip =3D &this->nand;
> > +	struct mtd_info *mtd =3D nand_to_mtd(&this->nand);
> >  	struct bch_geometry *geo =3D &this->bch_geometry;
> > +	const struct nand_ecc_props *requirements =3D
> > +		nanddev_get_ecc_requirements(&chip->base);
> > +	int corr, ds_corr;
> >  =

> >  	/* Do the sanity check. */
> >  	if (GPMI_IS_MXS(this)) {
> > @@ -248,7 +253,22 @@ static inline bool gpmi_check_ecc(struct gpmi_nand=
_data *this)
> >  		if (geo->gf_len =3D=3D 14)
> >  			return false;
> >  	}
> > -	return geo->ecc_strength <=3D this->devdata->bch_max_ecc_strength;
> > +
> > +	if (geo->ecc_strength > this->devdata->bch_max_ecc_strength)
> > +		return false;
> > +
> > +	/* check ecc strength, same as nand_ecc_is_strong_enough() did */
> =

> Why not using nand_ecc_is_strong_enough() in this case?

Hi Miqu=E8l,

1. current nand_ecc_is_strong_enough() compared required ecc with conf ecc,=
 but
I only see conf was initialized in some spi-nand and sw ecc drivers. Not su=
re if
it's a issue or someting missed in the gpmi driver? On my side,
nand_ecc_is_strong_enough() just returned.

2. I remembered that nand_ecc_is_strong_enough() used to compare required e=
cc
with nand_ecc_ctrl ecc strength, but even in this case, I don't know if it'=
s a
good idea just directly call this function. Usually the driver looking for a
proper bch setting and get the ecc strength/step, at last set the nand_ecc_=
ctrl
. So at this moment, it's not ready to use nand_ecc_is_strong_enough().

> =

> > +	if (requirements->step_size) {
> > +		corr =3D mtd->writesize * geo->ecc_strength /
> > +		       geo->ecc_chunk_size;
> > +		ds_corr =3D mtd->writesize * requirements->strength /
> > +			  requirements->step_size;
> > +		if (corr < ds_corr ||
> > +		    geo->ecc_strength < requirements->strength)
> > +			return false;
> > +	}
> > +
> > +	return true;
> >  }
> >  =

> >  /*
> =

> =

> Thanks,
> Miqu=E8l

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
