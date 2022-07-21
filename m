Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CC9C43334
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jul 2022 09:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GJf2Ym2BKvMybZH5jJTTnyqwRwOimee+HOsDoxDO0xg=; b=ym4uNFJTtm/lQi
	UJIFlEfXqrf5AGVQws/Bajofl84IqhIa2Hgw+m6YRY+kifOQMH+nblVo7fWQMW0dXIdc3AjvCnSO1
	dwVdHKMOB5GSSUyvDFKGaUUT5goD6kVlVBm6dmD91oxzOZtvCcd1OHyvtvbugMy7bqliR9YVC2enr
	ig9CfyCfZKeEeBLMgd+o17Xu9wlGqXGV+J/flALpZQ5EmFmQYM2rw34GR6RYc8uM5W5x4+Wuc+aJX
	/r9nI3VJLciDheR6XFqxTl2cLqN1gmUnN9Beps4sfgRNVXtm8z/8T/jrZrBKHw+qK15mLF1HGv1GS
	/ByvIQwXTt86mFd16Tpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oESrb-003WqX-0A; Thu, 21 Jul 2022 09:52:59 +0000
Received: from mail-tycjpn01on2126.outbound.protection.outlook.com ([40.107.114.126] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oESrX-003Wnb-NE
	for linux-mtd@lists.infradead.org; Thu, 21 Jul 2022 09:52:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUA6lY11bcUZKGD46oJUr1tmBovxEoeQwZaaedVel7jtSsBZejNdSfjKLb7+VcKohYgxNZwSQEJUvizJkElVUjgeAayB/+9jbffFIeGCrUBVtj+jHHM0VhI7Hj4rMWSGQ/5WY3ZDaP40tk5H5XaphHexTCGAmU8FLbr1fnh0+WlRyxJ0W71mgh7DevKyf3yaoNCPT/7SPn2LgfC/G+gFsTEjfmR0FSBn2e0Ip82sobyah8ZdYOaEHPW8IV9DleWRi6cJgl+tdnK5KNtVB49VrkhuyAErZgAJnkKSbtF+3LWLWvOuN4Gmro60HikZqrfctWGWwxF28QfHGIYuaix3ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHbAM3sOiOJOiPY+rl3WIr/TIS26Q/1IC2Yoiiefspw=;
 b=iu10lXnTLVy3zuq330tAhLWkJbBPtl44j0AukuCVKXlFdlRJrHkh8NXOgzmL0efZQ3kWzZqYu4JIlvSipJF/vfOzG+u+f3jU70ectdz0zbGrtQaf9cfME5fr8599C70BgKIwFOj+pUueXN+Z3tPrdv32wefwa+iEijKMSdeVDoIuAx9x49HDdGw7THyieuLqQmS/k69MRlBocOkhbsVHRKuUv/tfxQQja5gMfncL1h4fEE6kAVMT6tLo9yH14fDyrp6txuECYJRpZa6YpLs0/XY3QZSolem3L8ngJs3rMjTUy0CyRhsdYbQoZIsNrG3cufRLcpCNP8DyXMGis4TkFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHbAM3sOiOJOiPY+rl3WIr/TIS26Q/1IC2Yoiiefspw=;
 b=ku2fysWz7NWNqD/QmHT05ZQ8/UeMZQxwNn9PGNM7oHCaYLbba4KoaZSc3Yq/2rBi4irgnlIeswKZoLyj4SgHsS3kHanlTOQMbDUCW9aIY4qLmU4lIydQ6zQaGfb19Cd7vR3Y2rIJVAGFCG3BUnfixxT7k3tDLv5i1PixHqD+PRA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB8164.jpnprd01.prod.outlook.com (2603:1096:604:176::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Thu, 21 Jul
 2022 09:52:48 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5%4]) with mapi id 15.20.5438.025; Thu, 21 Jul 2022
 09:52:48 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Walle <michael@walle.cc>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "p.yadav@ti.com"
	<p.yadav@ti.com>, "richard@nod.at" <richard@nod.at>,
	"tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
	"vigneshr@ti.com" <vigneshr@ti.com>
Subject: RE: [PATCH 5/6] mtd: spi-nor: add generic flash driver
Thread-Topic: [PATCH 5/6] mtd: spi-nor: add generic flash driver
Thread-Index: AQHYnOb6STy+XODYIEqdWdLkpni6C62IlFOg
Date: Thu, 21 Jul 2022 09:52:48 +0000
Message-ID:  <OS0PR01MB5922F173C180E49273BEECB186919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220513133520.3945820-6-michael@walle.cc>
 <202205132220.uRTFaqNA-lkp@intel.com> (raw)
 <e6b22ad3b427770625aa56a4fe700e5c@walle.cc>
In-Reply-To: <e6b22ad3b427770625aa56a4fe700e5c@walle.cc>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2fd559c8-dd84-48f2-55a8-08da6afec50a
x-ms-traffictypediagnostic: OS3PR01MB8164:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  VJ/c9ml5F7RrzOq1jXo1BWIrAcyTU4lp107mYSwcuuctWcNf1YctHi8sHGzhmXOmOfvY4B4eFqgClFzw+kxf+0jeYyrSAxxCjDgwfrWzD4x9vb8wuciV1jWFBTHuarHj6JkY4jZ7LiXllvSbc+z/U7csVbmiWfcwS+SQAXny6h4nmjkn0rtbtAVFXOTIBBlI9XKvZMIEaC3P0DpuwJAd9PeLorOQtq/9o2Vf7Nt7YgNWjQOwbdCIVHNIl4Fp4oFBuHRbIVqvvFHDtQzVFKb/p1a17yIHMZdyP8GuLsEz+LSUFnv+vyy54u8vS98gDqifKPUvtLMMjovbVrfa/v6vK0ex2yC0Ce74GkIS94iWBypqHXOTx42mw7vgJtDAJ91YScjr59hhdjdimC8HqohdC2W95QYrKPE/Ipmoj0rFtdjiPhaCjSQmcA2i0gi3+HDhEJxSZmPawkTIwy2rZ1epUhaQYkDzpLv826AWQRqWTRKRob503dZUB0hdy6dIPlKAP3jfdn8GMDu8gniWYQxLkzM608pWwrAvZfLtXc1Eimxco9+RmiwqjaW8Z1uj7OLQwB5C3goot2PSRwuqhbtHK2vAscTOxjX0ZHeBUEjTX/R086NE9rfUlJ97RC1SUhxcncyVmfcQhE1mJc+X/JQBDWIfAAsEGj0omz/XaTLuCbaQ6/zU3CWUYltDbKzdIBlNsG6hv5LfLBybSiCrIDmfinAUSrCavHeWxJ/BEgIlc7hicWvwBGeuMpn68S0UsQGuAa1wmhd6ZSEkbNXRS5X2WEx/1a8YjQPzDv5LpHC1J+jxO8VM1mfVwgT8wCs1UUx5QIwoheLXdDGK+Ha5bBAvYg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(122000001)(478600001)(41300700001)(38070700005)(71200400001)(6506007)(9686003)(26005)(7696005)(38100700002)(186003)(83380400001)(316002)(66446008)(33656002)(2906002)(8936002)(8676002)(4744005)(5660300002)(52536014)(6916009)(86362001)(55016003)(4326008)(64756008)(66556008)(66476007)(66946007)(54906003)(76116006)(41533002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?AMqAJwnmXyMgdUMtHKXaaCU/BeUHwjwgK+yoApOoGyj0IyJl/SB3fiRTvpJ/?=
 =?us-ascii?Q?KH3Dsg2Q/YViMdjOJHNxHId5mL4XufuVlIe7zKlO7eyuEFtBalpBFYi104oE?=
 =?us-ascii?Q?jsQtENnRpS0XMZdejgxiqquaObGAqtbZdaptuOiCi1ZwE97DPcScC6+FCG7a?=
 =?us-ascii?Q?sSL37pl1F49oLfKyUGLHHX9dsltAHVERSXSLaofjY/0Ca78hrWQBeMOjwuh1?=
 =?us-ascii?Q?298pkj4TizT3S7AYBG6He8xkCr4Q31jXnZ5jGiCPxVaVzfMrhpzNVU6/rES6?=
 =?us-ascii?Q?aBuPp+PSALKfkAtc2wHyR0i23gMN0gSu0rn7rm7CTHDuDx3q8rtca8ib2Z05?=
 =?us-ascii?Q?duTLPUyLoK5iGejF6xYgesDUnRbX2hJxWMr3FADgfSd5PoSMK2hsA1s0m8ow?=
 =?us-ascii?Q?lSe4V/DI0xzHRHyvyE02GaydZvDa15jz96winFchSYZQmEJzUh68QekJacjN?=
 =?us-ascii?Q?0g8VO2WxuQbf6II5KwRZd08lUTRGofDL9kh76qSIIwAkZnVv/xttR95ZSH2r?=
 =?us-ascii?Q?Y+uSWU01DovHsol8RVqjOzZ+Ke7dRjtee7aZNajj1xgAYpSEzXeDaaWXAfuT?=
 =?us-ascii?Q?pL58YEkoJmgrbuWEJ2qVFOD0Zmftv4mGHDj6bXtao9wR0/R24oGkeQq93dE1?=
 =?us-ascii?Q?6wlqCl6S046cYfDcqFTc1uTZOTCNEGTvy63oqibqxh3JkLeuk1oWRxji/r7g?=
 =?us-ascii?Q?R8TU8ZT7N35gyKw/FzGki0m3Ql9HgVg9E2Bx+bPaG/CHvZHI9Xuk36127yuV?=
 =?us-ascii?Q?AvlCJAInANMohuJTKb0l+pLgnrTt+TC8t/oHsZhgkzDp+3yySFH3iVhiubHr?=
 =?us-ascii?Q?6vEIVIXCzcW64fEwjvs0T2gy2ySA3gP8e5V25BAf6bRVlQD5mYMxbfyMv4Sq?=
 =?us-ascii?Q?eT+kWNS6f/e3eXvtzGElPu1iD2QTsxPlOD4Nfcjr4N6wLZPqfNmOAykpOmKY?=
 =?us-ascii?Q?1aTs2R09beerQzBHopB7dgfHyL9fE/5ovXBn1gt45FyHcrbbF9vRIkZsIKJf?=
 =?us-ascii?Q?NYqkbdG/hNBzBNVxwVmhgitybvJue5enl6sD55CrTCVEZ0dllv+5q7k6IZNc?=
 =?us-ascii?Q?ksNrOaFou/Yo1Gzwa/RCpbd5opc5192qTnNJujQZZDMfo0pfW0SWbE14A7CG?=
 =?us-ascii?Q?OhAFgTK5tdOmFij0oDh+aEFSrNR4wJh9NlhPCsCaZRfhstsGPXkiGryAoowB?=
 =?us-ascii?Q?kTXFqASjl1BLTSCmo195PtVqxkjA2oSJVA7MTz70Vl9Cds9JPVumyL7ZRaUM?=
 =?us-ascii?Q?bCA52VWDc/KIjYLQaNc2WP1QsmdusxLVNbidY7G+lPgFe+/6vZuqyeQdc8Ee?=
 =?us-ascii?Q?DriS10i3JEqolO0M0/5b9wfR9/6HjP0xFAZ8U31sYZGYjUbhXyG9CAOn3U1w?=
 =?us-ascii?Q?LeG8U32+d6u6CYpQvCDQZGzEV/OEwtt6oBA5Zp/dVn4cL+vfnHmR/Rd0asFU?=
 =?us-ascii?Q?/5SQjoMYl/cO8wB/hORBz8YaoIa5MKqT8OUATGL1sDfkbvpKl+3LWpre5j2m?=
 =?us-ascii?Q?YUt+EcFALRfInBtK/5LJe1Zo2ALHHWkb75qJ70HFQJt0fKcolKmxnoC0VgzC?=
 =?us-ascii?Q?/NRR7IKuNfy1cyR4N+emtMrKyrwWIkbk50HqPDRczqn7dT3/ZrswhDOP9iJr?=
 =?us-ascii?Q?jA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd559c8-dd84-48f2-55a8-08da6afec50a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 09:52:48.5748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qEedAuCyjVh26YeGRplGCnaJRgMeTClveSpXvKnmQMX5WS9H9CLy3k5obIMP5lUvnLdGc0nTlGMwRrUrWavF6/lkvnFz8Pe+daJE7UU4Ib0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_025256_317471_1460C19A 
X-CRM114-Status: GOOD (  17.65  )
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

Hi Michael Walle,

> Subject: Re: [PATCH 5/6] mtd: spi-nor: add generic flash driver
> 
> Hi,
> 
> >> +
> >> +	/* Fallback to a generic flash described only by its SFDP data. */
> >> +	if (!info) {
> >> +		ret = spi_nor_check_sfdp_signature(nor);
> >> +		if (!ret)
> >> +			info = &spi_nor_generic_flash;
> >> +	}
> >
> > May be this can be combined as
> >
> >  	if (!info && (!spi_nor_check_sfdp_signature(nor)))
> > 		info = &spi_nor_generic_flash;
> 
> While this is the behavior, I don't like (1) calling functions in the
> condition and (2) rely on the && and || semantics, i.e.
> to just call the second part if the first is true/false.

OK fine. I recently got a review comment from mainline for optimizing the number
of lines. That is the reason for suggestion.

Cheers,
biju

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
