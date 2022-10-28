Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8C5C38A02
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Oct 2022 18:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yobhezt88GTE3T5+NdhBea6OO98DqEFuYjzfMFxADGo=; b=F79hy5OLZrbkf/
	xJqW1cSsWEDeHSKUwcKP+j5csbxRaGrhV05Kgr7saTy1VcJ6O3xtWZQaYHD3dt45GzwVTJeeA1TP3
	Y9PILQ+8bCHPWc/HxLP/Tl/peImlbDHHuvEN1q/2hya5NZGHndwM7TkhRt6NNYrKRV7TUB3MF2YcL
	JhLOmROlJoJx0K6/yxKde+V9Hz9xEPfO/WwXx78YTbukNA4CzD3+IISYFlakcvDFiRekJ8YymhtYb
	wj0dtqH6RiEw/oFb5k3NW2adB7w9ufzSaMrNoijramcbr4/BpEMZH3sLgADmEmWGGeC6zjoIX5nvb
	KEWU1y6SdHPr/PwaZrNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooTeS-001YAs-LG; Fri, 28 Oct 2022 18:00:16 +0000
Received: from mail-tycjpn01on2112.outbound.protection.outlook.com ([40.107.114.112] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooTeO-001Y8S-P3
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2022 18:00:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFCHBr4AWSTLXs8X0cuImlmYEZxv6O31wlri5Tvsy6bo+3to05rA7zqs1WBGyMfuOpJTmQ2LVhwgp+kO7oKFZPu9pvoobNbzdLew7pHqtDdln1dpTYpQIgUqsLZEzcHpztbOMFNAKP/SKSg27IREc7+gvz16EKFUQYLu671qjoDCGXtqYW87EJZAwgiMjfNUO7Bhg97dYUY3xxNBv2Xl6H7DPDyFPM64c/W96U2tDdxkHWxUEO1E8umehxhbN16ON6U8Jprmlvgox8WgcNKBboLB9hjN4LhglLIpPSiAx3sZQBDKWhVWa2FYaqJMVgd8Ro5JtqgMVEmDMK1SRq3sFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGi+0Yel/dEYol6TsrpVjt84A6nzQjKNZC2XANrUDDc=;
 b=fyWTn5J767okWq/S+mBgyfiMJuFV9BiD/Wq5YGFwqyGzr0iJDlN6/hKdvD0L2ddAogUr9aAjMDbO/Bgm88+mu6uY8PdLsdmvUs9nVQ2IL2Gn3YRf73/bOuEz+lySo30/3hwMAcVBO4SjJuHaT2UahjBODp4rv6EY5RaeLAVyjfosEgAUdMXpCOYQFk0b2GVg+5zypvqHW5HKoXCjw1+Slhg6T8R2dR8oWdUwBfNnjZjdiJPs2ZVOpWz4VeEmi1nIsIQrpog4U/gr+0I9CPx732qTJTXa0m4yWg7YO0tDu/3MzwH81RiELzcishGBI7Z5je8Dc/ZeuVWRg2axiSS7qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGi+0Yel/dEYol6TsrpVjt84A6nzQjKNZC2XANrUDDc=;
 b=qbASIjQcLqRM+thpZV8FeiB92fQ1s2fiG6PXeixpdvzgVYxAJmkJYR21VvnSMHyoJFp1o6YCzFT3im5Tly1CjkV0nJWPhVkDjdOL5Aofh6hwiJXPyZHvdRKmH0w7Lz5i8hZC/qt+CZfZ+val8zhmgPm87p01/u9b4EjSn533wrU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8755.jpnprd01.prod.outlook.com (2603:1096:400:17d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 18:00:06 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2%3]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 18:00:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Walle <michael@walle.cc>, "tudor.ambarus@microchip.com"
	<tudor.ambarus@microchip.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "p.yadav@ti.com"
	<p.yadav@ti.com>, "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com"
	<vigneshr@ti.com>
Subject: RE: [PATCH 5/6] mtd: spi-nor: add generic flash driver
Thread-Topic: [PATCH 5/6] mtd: spi-nor: add generic flash driver
Thread-Index: AQHYnOb6STy+XODYIEqdWdLkpni6C62IlFOggJwexDA=
Date: Fri, 28 Oct 2022 18:00:05 +0000
Message-ID:  <OS0PR01MB59224F74DF4E981D536271A886329@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220513133520.3945820-6-michael@walle.cc>
 <202205132220.uRTFaqNA-lkp@intel.com> (raw)
 <e6b22ad3b427770625aa56a4fe700e5c@walle.cc>
 <OS0PR01MB5922F173C180E49273BEECB186919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To:  <OS0PR01MB5922F173C180E49273BEECB186919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB8755:EE_
x-ms-office365-filtering-correlation-id: 26594562-f476-44f3-73f6-08dab90e3e93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  kvN8/DHuEEcadzgXP4IaVtvQtz1OW4fRdxaZYcNML55Al9nUuOWfn9o6zE/QGVSzpluC9Rg8xsdW4Ou6GwXKXypnKvjSm6Ex407eFVRA6oSbmf67PXGiCa+MaO4Vf4sfR9lRGAn6NSzX7TDFuDQqMrj0VLoc3kpsfdA0bspdZ+4AslskEz96kv3wL1LJ1kbnI1ECgY4KOBk0OM9F5lw/l5wcaICvlhi7XeOgJktjMu2IbfJEfPYhxKmGKQUILrHs01r/xZQFeSYihcd88CGGK+f6meAibWi+45JF3ej8DS/wY21amnKKa1Kul+UNCgH1UzmhnL7OuZArBaujgIfLUfiPnRcpvAGr6hArf9qkgg86mPes6zb7Ge9sNz9kPui+09BZ62pz0gS9gj+/ZlguuMl0D6B2Y27ebItFmC5pYeRkSmdyR7UiVw3ZmYdi4XnuO/shQoaCZ3y7LX6lgRBR0juGxPmuLMBYZviCSUoDHZW4JFHl5zE6b42bAV2EG7rpkzox5IE7i7ZqUHnrSgydQ3wTvXl+tDVwCUE4CeRISSYN2OseLOwnanmF9ZBIMGSresufjcFlAAfL5vAocURlbGgbZIozXiCVK73ALQNnEnrLCJL+krXnVU7hoOCQC2GWx3ji1gvrscWlmb9pm7cAPAFvDJ0wFFFgxGEKGWjU1OI2l3uYEFjRs3mLFffpzjO5R4L9c/8/Ws6GFW3mLYJPGAfny5BwzE/Vo8wKL1t80a2cNA1wITY9XrWylqKZIq8SVjOXxgQgGUiWZihqHJc+0m3G+tIOhUIZoJ+eiUoivuJC95YP5m3g6Ybb2V8RhNb5zrvXwtY6pPuvss3tsBCsnSkz/Oxd0gNtLSWmliNa2EA=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199015)(2906002)(66946007)(52536014)(4326008)(5660300002)(76116006)(8676002)(26005)(9686003)(966005)(66446008)(64756008)(122000001)(66556008)(38100700002)(66476007)(7696005)(86362001)(6506007)(55016003)(71200400001)(54906003)(316002)(110136005)(38070700005)(33656002)(41300700001)(8936002)(186003)(478600001)(83380400001)(41533002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?9NU7/q47b7LLfVOx8adLJ8c8mno2KmTGT0U2EKyeoYQgbWfplwMD9cM52ley?=
 =?us-ascii?Q?dzkfQ5nKkyDfEZeCCrVdtqmOeXo2RUrMxhbeEt6beoapN4zQEojcsGvmpO6Y?=
 =?us-ascii?Q?ZBCfrDXv/tqcmN5zhbUDEx+IatH+MuHJtANDcoNxe5MI8/0CvTD8Ga3LMcjM?=
 =?us-ascii?Q?ARK0zWZOsVr9gkOiL0KOJbI9tLwi5u8nin4umzn5J5ckaX2RBGZsIXqCseWa?=
 =?us-ascii?Q?PpBJoOQAv5kqb/8MDqbpLKh7Tj/Ily7WVuGK89fAb860nGc3KBu7fggIvkKH?=
 =?us-ascii?Q?tXM1ZYfa+K9LR/nC4cLCyhdAFlyoSpJtR5pXlfYhgrl5ocT6dJ+PXV0YxeyE?=
 =?us-ascii?Q?tMJw48ls7kzAAVM829S+HpW+sBrbKEgF/57Efv0ilz1qap7qyG8nyH2zQ9q7?=
 =?us-ascii?Q?8z15+t/jv/8BjpmC4jQFj/LC98FofgJ8MaMtHei99tW1SMfDQrgZ8D3wNmTy?=
 =?us-ascii?Q?5GljSmtzeyHP11qk56LGcTpnkCnEIP4PvWf/I+CG9Ajg/bO7/HLKUhS4IJom?=
 =?us-ascii?Q?Q4LVD2VrsdTzdO2YfAnPGL0MYnN8lAzrPkhFb47UKXH22loCWp2nraIyDLPf?=
 =?us-ascii?Q?66HQ1SL6/lwGhEOFeZGiVeWbx/f5LOjTXD+OMgFlq+UhaKHNPaeTo83/9TeO?=
 =?us-ascii?Q?q3yKy0HilMX2LLkAmtn1794gRNrTnjpVPywAnTwV0aUPn1wz2IsnmdFQibMg?=
 =?us-ascii?Q?MGogf5vml9hLbax9qdYv2XCEjdxd7yXwsGgCVxIdfo9tfF1QdgDW9S6dXYTI?=
 =?us-ascii?Q?NwzuTXIaNTPaF77ypedo71iVwcdzv2n9a9tUDEDJG62nxBq9mUzyKsVxuE1J?=
 =?us-ascii?Q?T71E/dEwKCOGvBkmzr6ArxDgl69f7LFuQ+Nqs2UiJho85NwcIa9AJbqxn5qA?=
 =?us-ascii?Q?Z8XyfUeqs55ghYStyfsvDmBz2ti4VTWp4i5oMMUuwJzxxa5my8w4XGYSqboM?=
 =?us-ascii?Q?8Wqx/oBSNstOWhuk8Kk9+T93ED/6n9AtkKn1D0GJMgQt3zRcyCM7T8CKk/s2?=
 =?us-ascii?Q?+CSF8hQYqIhMXqlRlbG9Bjm24HxYGa9Mb4/YKwyTJ5xka87ksUF0rUfeoaHx?=
 =?us-ascii?Q?eLAV3Z6xPEixFQH8+u+82iyqrEFaGZQ2TfEZLAfpt7zPUva9l3UDWq36wbTc?=
 =?us-ascii?Q?qulzIU/99sYwp5US6tYz1HfJW7JZMZgVuM9KqAzDFl8GZGoNuis7X+UsCTpc?=
 =?us-ascii?Q?2LsmZJt6sJF2eZ1SC4Y+UeZdQOpadsUWT6nRmVig1rCgW8X30+nLEmUZuCNN?=
 =?us-ascii?Q?unTkYJt8N3HJaGzqgKAe5oKMhRrXXAXYiW6h9Ca33S2IoUm4AlvPvLY9HAWm?=
 =?us-ascii?Q?ORZNnv1hsP6/dQO5as6FjQiHz5bsArlj9ihGhkyAlEC+yvH8jdR5igprbONg?=
 =?us-ascii?Q?a3Sf7PbxsBuybYWp9KcU3fNiX9n4kOfLDYmeDNBdxjvFqYkP78ZEsGnMbBVx?=
 =?us-ascii?Q?BYDHXK6gX/oLm8AR3wpQSGHpFe0BMOcPmmsIX0c6z9sFjjT/n2C99JzuR8C1?=
 =?us-ascii?Q?OuJ3kWt6EzF+0+PXXIo2r1nVUtwR8yLCMGXHNo+HPXSDJCu9FoBWJ9/bGsy3?=
 =?us-ascii?Q?fXLrzJbIpGjrCfex64NveDb4Rchu9jLYpgpRYTLfyXnVbes+4N1DOSFOJCI7?=
 =?us-ascii?Q?AQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26594562-f476-44f3-73f6-08dab90e3e93
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2022 18:00:05.6409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t0VCvP4MEosF1O4TVZeqQeUgiCr460DeOO4eOGjnHEKWTON3tNLuCy6tqwnAj21V+/dZ93rtwALQkxjfIT+wOiZPE3wtfbXmZNlShYT417w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8755
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_110013_418602_2FF2F056 
X-CRM114-Status: GOOD (  20.21  )
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

Hi All,

Any update on [1]?. As per [2], we need to use generic flash driver as our flash chip
supports sfdp. Anything to be improved on [1]?? Please let us know.

[1] https://lore.kernel.org/lkml/20220810220654.1297699-1-michael@walle.cc/T/#m3ce890b65360f9fbe17b813d692f848b5c6d78e7
[2] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220715105716.2415068-3-biju.das.jz@bp.renesas.com/

Cheers,
Biju

> Subject: RE: [PATCH 5/6] mtd: spi-nor: add generic flash driver
> 
> Hi Michael Walle,
> 
> > Subject: Re: [PATCH 5/6] mtd: spi-nor: add generic flash driver
> >
> > Hi,
> >
> > >> +
> > >> +	/* Fallback to a generic flash described only by its SFDP
> data. */
> > >> +	if (!info) {
> > >> +		ret = spi_nor_check_sfdp_signature(nor);
> > >> +		if (!ret)
> > >> +			info = &spi_nor_generic_flash;
> > >> +	}
> > >
> > > May be this can be combined as
> > >
> > >  	if (!info && (!spi_nor_check_sfdp_signature(nor)))
> > > 		info = &spi_nor_generic_flash;
> >
> > While this is the behavior, I don't like (1) calling functions in
> the
> > condition and (2) rely on the && and || semantics, i.e.
> > to just call the second part if the first is true/false.
> 
> OK fine. I recently got a review comment from mainline for optimizing
> the number of lines. That is the reason for suggestion.
> 
> Cheers,
> biju

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
