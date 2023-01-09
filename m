Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA58C5479D
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Jan 2023 14:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=89cQUwkPiCtMX6GJTWQWThm06pBFsVjLvRfeyQLeTko=; b=yRDWwu1pajhw0i
	36cOsrGFduPTur+cvtAoNftqR+wNJ36I/GR65TDkZBd/agUHb6Fxy4/rPv+l3HNi9mBSNftbG/aSx
	gqnDBNYsKJO5zDnZEsZLUd2Fa+VOFLh6CQcY4k4JpllEY31z4I4LOD1IFtsnUSoPM2QLHvX8NMqK0
	i0i+o+YA28V2PcJ0/arYW0SEM/QZjUSLy/TYulrReoSHtArkYte8z2s2HvRjKBFe7bV16w50nydfz
	qpONodT8+zErMDlI5I9QgHchccKpcPJPBXIYtJIr5Zcwl8nvkNbb+6eD/WIBo2UzSkTWa5GK5IwPB
	9Hpm8LQLNJm/Hb3V8hjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEt1D-001ubS-0W; Mon, 09 Jan 2023 14:20:56 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEspq-001pb3-3T
	for linux-mtd@lists.infradead.org; Mon, 09 Jan 2023 14:09:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673273350; x=1704809350;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DPDBUftutL+2C/bPFczxTKsSNwdT3ituCTDuhFDv+Nk=;
  b=oE7s2ZEnesRZOYQISphJo8lJgVtNNS74D775Ugk6soLYw8WW4NC4dqLw
   cU7069GfaiL3hz8K+24hKD+KZ4zimFTuP6GuuOP/jdxYunrWMh4Jd1Vm/
   viZ7twaUM9SqkWXxvv/hTMQ55Ynspgt67v7VNP0fK5pvlhqLh8Xv1KkmB
   EQ5G19CY1FfIghFxCqTFn3QLbPAJ24ppiW154sWJG9BCyLYzKQjKGSRxi
   4uDHOiAe7d3OFPki/rqCOcHhKDxFeWKNCZbrVo6sQ+YrEclIgvFbNW6Wa
   406lszYb91uwTif+uPDRpoNrZH+M8KvyN66OtbGUhQX1EAyODoC95DZrc
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="324885139"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="324885139"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 06:09:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="650017767"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="650017767"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga007.jf.intel.com with ESMTP; 09 Jan 2023 06:09:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 9 Jan 2023 06:09:07 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 9 Jan 2023 06:09:07 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 9 Jan 2023 06:09:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPRhmYnzu0TRBvCHt5aihMCqtZso69iCwduSYkDpic/Cw8Bq8IHf234KKCpbHHvoehkY2kXFWI8HLlqlmOB/fTGhphQNuMOWs06J7zsvEBXkWYvzfHxtBSxq1MD+0K0EDLYS+aMcA+XRDGt7yqIUMAs86Yh4g47SDTD1rAyAQ1cT7SbDc1Etk8yT+O/wUl6ZbgAtWMPK+hHmJi0PTYqcIuVM1eCvhmPklu1uWlqJ+hqlEgbQUl1k5dp2iTaEstc0B3WNIHCtjuutwh0+SdIzXaK3/F7wCxKnS7j9/apMnB+0nlbCB/x4aTcnKLfy92c2PUP3FOtOJ2DvTxRso98oyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nl6T5EPWQ+BqeAxHtxmK5JQfoTIoeIXIIe5XVmGmwvA=;
 b=YiLjyztCrGI53Lsk34n+ehiEANaSWWTe5L7WqNOrpLkB4tJe4Cll9qZKpnxh+M0z71fk8g3DH4hPrDhCMPviifNQM805TNa2r7ZxDU6fFCsz7wZpJzRShSG2RGwUtMbmBFwuKDO4/q8aNix9AIXgfZYm/aZyZ/kf76NUVl23N+ZmzuUdJ6HZ7TfpcK7nS+HSoXocF+8wXK+XVRooLAXPIu6wUPih6aThjkj1TRsVZyzJ1KdQXJ+3iTeuciduo8Niff/lRafIMfbNzNRpzLy6YNvTziIbmgqMUtUVz9XsK5dHwrJPY5H2clo34eUoaRmZJu/j2QVOAa86MaX3wOJSwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SN7PR11MB7706.namprd11.prod.outlook.com (2603:10b6:806:32c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 14:09:03 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::7b39:df5f:fe4e:f158]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::7b39:df5f:fe4e:f158%2]) with mapi id 15.20.5944.019; Mon, 9 Jan 2023
 14:09:03 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Michael Walle <michael@walle.cc>, "Winkler, Tomas"
	<tomas.winkler@intel.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
	<pratyush@kernel.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] mtd: spi-nor: macronix: add support for mx77l51250f
Thread-Topic: [PATCH v2] mtd: spi-nor: macronix: add support for mx77l51250f
Thread-Index: AQHZIuEvkp/AelVvj02xUgjj1TvLia6VyKwAgABYi4A=
Date: Mon, 9 Jan 2023 14:09:03 +0000
Message-ID: <CY5PR11MB636696A89B94C4C659738290EDFE9@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20230107214345.2524851-1-tomas.winkler@intel.com>
 <5076cc829fb5a9c5959687a401b120ca@walle.cc>
In-Reply-To: <5076cc829fb5a9c5959687a401b120ca@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SN7PR11MB7706:EE_
x-ms-office365-filtering-correlation-id: ac2c89bf-3f7b-417b-3feb-08daf24b101f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I/RYBLBj10qgcKU7u18oRsbzw1H/7f1E7pQUkEpIrjVOhdoZ10MkkHoSuTZHe61VndWFJJ72vLZcZcfwYOYkieP1GNk7A+vpVA8UB1pY7D5mHXM9D4lcwWBD38KK9b1UiN3QXM68YQd8wuh6Mr9iOIokBHe42wDxvcV0xIWKcIDojJHSeoPFdCKt4K244LsakMdzPP/9Z+84axZ+B+PPQMM0+cOwaAgoaGspN9bgqeVsZZEG9KgEy0o6Ngn5g6Vi8vPY/U1RRtvaT5uAtnDuFPWqvJst5Qba2GM68xasBZyGBFkY25F+U45higY6j9QRthF+QRfDAykrzubnjmO1JVcNaK3PAL41lMP5i6J0PU0zm94CcTQTn7PmBUAMv39t+4hL/XrTBUOvwLfUpUFKSxO2h2VGKHfhD8wMlHzcy3vjyZWMkbRNCsR/UAVbp4u/x9My0pc3iv2+1Fojj9y53Z709SP628jSZiK36d/cc9vZERGxe/D6LsIWYKfeaVd/JQTFW+hVrQUcbRVxP7oPgq4hPj6Czza/09/c+9JHh9r1xsEO8piKksAH173ijErSOtwK5YQcxPmO1UZLT93voso6yNGjogWpXXINRD5O+pZWVAUwh+wRrhchd+aGlv7tq9gin4cpEx3RfMLFDo0dpd7dChJCixEvgO8Q5/E7tJoua14tuTwIWMJAe6TEBWx66/Q1OOKbeMVIjui4cnzbCf6IURMeuubEnCt8goPltbfb5YU35LXIAeOsZMcemRoRaZk073gLyOkiMphlzH4Bcw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(376002)(366004)(396003)(136003)(451199015)(6506007)(38100700002)(82960400001)(122000001)(2906002)(478600001)(966005)(4744005)(33656002)(7696005)(26005)(186003)(9686003)(316002)(5660300002)(71200400001)(83380400001)(8936002)(52536014)(55016003)(38070700005)(86362001)(41300700001)(8676002)(110136005)(6636002)(66946007)(76116006)(66476007)(66556008)(64756008)(54906003)(66446008)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JthYAXZ+ri8Dd3AlQHIa2rYsndxVQz1D7kO5/JCVMwqaMI5/7H/0UGUrY/JY?=
 =?us-ascii?Q?ob+oo1dGzfc0lMXByub5L1wagppiFFN+qNpKsbPWrtdieq2ZdQGnZc3zz4Rb?=
 =?us-ascii?Q?/Jhpq4JvbeUPzfNQ+xhjMN6sP8YzjNxLoH+VeBHJ6UBMpCyImNdmV5WWS5B8?=
 =?us-ascii?Q?8S8RxrtJozSQnsLiRZaCB1H6g5U/q5945IrO7hY7y6JHcpliVNkMWeTY9ExK?=
 =?us-ascii?Q?D/wm+/Iwl8dfOVUSqdbHJ5ayllaoc4q02gZBQyqeSJGnW9pRT/SUNCq8BOlu?=
 =?us-ascii?Q?dxcIq3mBX2TOXPKZFurnU8xes1xwqVpYxvxa9tBN+004+EjoAUyVY+npbpZA?=
 =?us-ascii?Q?2/wbHabhIYdF1xTf7a70WJsA5Mjh5lt7hD+pVZekMQ5HVKmhOR0Cvuc7WK9x?=
 =?us-ascii?Q?LXSG3j4IlG/3NDCR/UaWOXagwtlSUH4MgQthDcTaNsIdC9MnKmUsD+C5JdUv?=
 =?us-ascii?Q?NOrHjsxQrM8WKzmrJZ2qE6XG4STyS5V1zEqDAmTDK7CBF9JVTkvChgz2kUgL?=
 =?us-ascii?Q?TiiKmBNbZdYsrHRoLP5ImNI9d+1TrxIKpcGvvc1Bz8JOpJCwfa0MBK5JHsDx?=
 =?us-ascii?Q?Vf+NJC5Wz67zlqKosiVnm9xDu+vNphR9tyA1GjK9w91vZB/LOeIWeN9zABVZ?=
 =?us-ascii?Q?mjSFKLZASenDDt0wAo0ZgpaeN62z4iWFP18qqeiAIA+zP+irJe4oshZjYvGq?=
 =?us-ascii?Q?6l00Q8NRjyDhcNl/tN6+kfUSBjw4pz8dkxyTm28z6PQFrWpUOR5gReL5AGQD?=
 =?us-ascii?Q?ktRNzrva43DfFLwmbcjzXrHK8EC/mBhamUHcOW/VGZWa1BpsHU1MykcVk7Xi?=
 =?us-ascii?Q?ghH5/rWU9Q5CU+DX9t2uHPHb3fEm2CO2wdkqbsdUFtnM/0U/mCsZQvoRZgR6?=
 =?us-ascii?Q?8/UwMNHsAvAp1TkbgC2kCkHQMmLK/DWCwEbB1XdQRcuGqJ3Ybi2uh4t99j+c?=
 =?us-ascii?Q?oXrAZxn8nF4CCzAlZlREvNAN+cu3AX9PgKnJ4S7woMR0qQYME6c8rfaO2qMm?=
 =?us-ascii?Q?9GV0Kxl/fSFMu8Eq2pjENSc3y/18KAfXZkWpGhr2lxMmaZ+5QKzLSoABXFs0?=
 =?us-ascii?Q?b1thKymi0SC6l1+vAWgO812ngoRKVIKOj/x6qnC//NkQGRteHFRBLPRGEHSS?=
 =?us-ascii?Q?DR4UCEe2Uaxo+lis3gx49YcWY+f7zxq6fxl/sZ6cinjyi0yGiAQaBNTzrNRT?=
 =?us-ascii?Q?nmy0AnsBcwh9EOMQJRFLFV9a/iYlqCkXlReWGhwykzIoG4SpeNC0dL3a1WFz?=
 =?us-ascii?Q?O7z1iQL5lqRGuS/Ue2axkOwR3i4P/GZNemnLeHeJD2tu1jCN8RJ9Vx8hZiGl?=
 =?us-ascii?Q?dUC7XwcwGmRcj62I1UwxhrQcMHWB/m0oxoGrW8eLgEqmWlvTRRDBJDs6u3tX?=
 =?us-ascii?Q?M9jJW80Ex9FZDkLjbygxQlEpCLtHOxRP8YOB5YGkX+2xHGGIoATrbfhaL2I4?=
 =?us-ascii?Q?eLLRj4kzVGSraDEk4VZOMwJ44xFgzxdx7GdEft/+KgsZPsr06lZezdDiKoDd?=
 =?us-ascii?Q?EqjfnZ9SzQ82WY8+PexVt5DReJbt92N/ysoPyLOQ2ezO3XM7TRf1dTTuOsFF?=
 =?us-ascii?Q?iVVmmDY0WbBIBlEihX4TSpFws9QRGERq0xa59ADiPuNljqgpAw/f8lcF4WOU?=
 =?us-ascii?Q?uQ=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2c89bf-3f7b-417b-3feb-08daf24b101f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 14:09:03.2829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N/dlayqR4WqrzU7L3wytkhr0fVVFBjrCki0V2RxZ6Bw/4rKwj/Hh1aA1FFHhpTCcO++DQhsvqbUXXFCISi3UuDrGVz8uC41z3250wzXgQaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7706
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_060910_271220_5720BF48 
X-CRM114-Status: GOOD (  12.86  )
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

 
> > --- a/drivers/mtd/spi-nor/macronix.c
> > +++ b/drivers/mtd/spi-nor/macronix.c
> > @@ -100,6 +100,8 @@ static const struct flash_info macronix_nor_parts[]
> > = {
> >  	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
> >  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> SPI_NOR_QUAD_READ)
> >  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> > +	{ "mx77l51250f", INFO(0xc2751a, 0, 64 * 1024, 4096)
> > +		PARSE_SFDP },
> 
> With the newest generic spi nor driver [1] this patch shouldn't
> be needed at all anymore. Could you verify, that your flash will work
> without it?
> 
> -michael
> 
> [1]
> https://elixir.bootlin.com/linux/v6.2-rc3/source/drivers/mtd/spi-
> nor/core.c#L1637

Tested now, the v6.2-rc3 recognizes the chip.
Does this mean that all SFDP-supporting chips will be recognized automatically?

Tomas, we can abandon upstreaming effort, I'll save the patch if it will needed by older kernel versions.

-- 
Thanks,
Sasha



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
