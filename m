Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31FFEB64D7
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jun 2023 09:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Detz3aW850OWkL11mwK3xk/YZcZ+byEIhEF2WdFqNFI=; b=yNaUdReza160Bn
	Ix2sxQYL4iDpuZl7G4bZlVSNbBCMQOmrDL4hRTNrSeWve1k5gOfl/XQqoBFEygUGa9Ms336ozPt3X
	tO0oM57sjmAQudWI/AoEh7ZH5bjKiv6s+9dxTtlgUVgeAOsjZh+9pDtE6Vk6fAvR+5p9yRVApMJkm
	K2epYAKN/AWZz9BMue9a0b0my4OgX+4e44gIQ9g5+UeEVLEBWadWbzpX0I33sLlMN6zqusU32irhO
	tn7DlUdLJ/llkqUhe5OXL8t7+a/UVPrHH/k5rvt7obbprlN4rexjtv/dY3Y7zIRInbL8qIQLQLYyY
	zOLuopcsgffacfsG8YCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDilM-009lAT-0v;
	Mon, 26 Jun 2023 09:44:00 +0000
Received: from mx0b-003b2802.pphosted.com ([205.220.180.83])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDilH-009l96-0B
	for linux-mtd@lists.infradead.org;
	Mon, 26 Jun 2023 09:43:59 +0000
Received: from pps.filterd (m0278973.ppops.net [127.0.0.1])
	by mx0a-003b2802.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35Q481M5028420;
	Mon, 26 Jun 2023 09:43:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=XifcXgxC+zEnNVJpCR6+eG6TP1ovFSv7zVSPook9WsQ=;
 b=NzRYgTtZ7tU9H2iPZboras9ER47+wLwAtynwo4DIxjifloP9leS+ARnHE/OQLek5sYDy
 PE/bwCMYSGiVemxNNYwST9YIb9D6hhfnxrhnPCowxIHYGFzps2YSKHIZh7IHqtvB8KWC
 Io8TDns0WeGA0oDa5f80/FxVRSmsTUR2gTmjJDES7oiHdovks52emORYgjmgfbtq1/j6
 Wj3VcyT342NsOecQVsJ5ag9vqpjW//G9l519Jybg46diqdS9ZhGaNzC+s/tSWOtLEfmU
 gvA2EmAdbR5VSiU4VDvbtFxElsQ7zO/xkXnTAEn8V9p/jMBmyXTxlcaH6kq5v2tcjB0w 8A== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-003b2802.pphosted.com (PPS) with ESMTPS id 3rdr093cx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jun 2023 09:43:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCQqYe5mmN+ox6IoSRVONQhLqBxg4ixdA6cSjV+jJmio0cSDK9bkdBo0v1BHQR2ay6QhksF9uNpMdxdo+p+YlSXk+v5xZfMOaDD1QP/8+IUMZuMhm0jIVmaqyEZu1xBsIktWvHa/xZGBUQ9ajbu+nOVDAdmyjRVh0Aeoyfw0ORCZJF7o9v8PES18swEWjVRGEYpgeb090oLxGiVQ+osrGcNu4w08bE4kROV/NjRgCCapciO2f/ywg7qBNm9hc9Ebw/XYbvawWa9yVVwi48CRdbZ8potdkTrCAeo9rpH4jbXmEpY4rJGTIKcXWP93L/jCHCDf8kfVSbGSZtv2shgB+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XifcXgxC+zEnNVJpCR6+eG6TP1ovFSv7zVSPook9WsQ=;
 b=O63O7lW+ZUDQx2VcUlVntD5gJq4ulnr1A90U4hAoO8N0/OL38kH4j6R+wpeCQk/WkXTTApD+14qUHEQKvii0WcLD9YqwNs/CptxsRnbUNxpj8ZVgSpz+lczoL6Xt6AUO9lSoM1N88ZPCMR/ExYFcWO+lgkPP31ci69K6WQsnp63tbY7ro2b01SqATaliE/MZjeuAQEs5wjwSyhDS47hrZHabGYEE/6Zi7Ax/dEAnDbEXxT4RPcu9rIq7kegiiqpL4z03uG6qVQPVz70d9spvAEmZ5OYo6r95C9abnnLk7v1WFXGAEW6+8QncKNV4BWFXWWjqc/UFhEBS/413xMlo2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XifcXgxC+zEnNVJpCR6+eG6TP1ovFSv7zVSPook9WsQ=;
 b=LrXwL1uT6aV8jSNdvh6cmhTWQAz/mnkHkB1k1MRqlJYZ7IY8+ccb5ATF/hKoiaiUYhYY73nBWhgjPrSc3VA/If9GYtsGNWfWkhIxN6ytgyfG8tMjKAPPf16+9+JmQOnz2RGA86wCzwMiG0P+NFUrWOhZt9+NjBGQKFuaXTP40LIt1RTngZuTipbUyouF0bMvqT+2U0eARwUCrihBQ4329Pw1iZJbuAijuSDgTj36TkSYuTi7QGrpJiUc04k5+xuDreHQ77HkPKk1itSUJMdqfkw4oBJcbkFu9e2zFaHFumub0a5sFotWjraEeZfOcl5o7K4NBmD8M9XNjPt72IhKRA==
Received: from PH0PR08MB7889.namprd08.prod.outlook.com (2603:10b6:510:114::11)
 by PH0PR08MB6600.namprd08.prod.outlook.com (2603:10b6:510:3a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 09:43:35 +0000
Received: from PH0PR08MB7889.namprd08.prod.outlook.com
 ([fe80::838a:faaa:a6c:ce8b]) by PH0PR08MB7889.namprd08.prod.outlook.com
 ([fe80::838a:faaa:a6c:ce8b%4]) with mapi id 15.20.6455.030; Mon, 26 Jun 2023
 09:43:35 +0000
From: Bean Huo <beanhuo@micron.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        =?utf-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>
CC: Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush
 Yadav <pratyush@kernel.org>,
        Michael Walle <michael@walle.cc>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        Julien Su
	<juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
        Alvin Zhou
	<alvinzhou@mxic.com.tw>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        JaimeLiao <jaimeliao.tw@gmail.com>
Subject: RE: [EXT] Re: [PATCH v2 3/3] mtd: rawnand: Support for sequential
 cache reads
Thread-Topic: [EXT] Re: [PATCH v2 3/3] mtd: rawnand: Support for sequential
 cache reads
Thread-Index: AQHZpdwYHc8Zy/LAuU6ubG821CQprq+c18wQ
Date: Mon, 26 Jun 2023 09:43:35 +0000
Message-ID: <PH0PR08MB7889F1FE19F18690AD2C6E85DB26A@PH0PR08MB7889.namprd08.prod.outlook.com>
References: <20230112093637.987838-1-miquel.raynal@bootlin.com>
	<20230112093637.987838-4-miquel.raynal@bootlin.com>
	<yw1xfs6j4k6q.fsf@mansr.com>	<20230622231202.42646e4c@xps-13>
	<yw1xbkh64dvp.fsf@mansr.com> <20230623160736.6507fe13@xps-13>
In-Reply-To: <20230623160736.6507fe13@xps-13>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_ActionId=02beecb7-96e4-4276-bde8-8854b7e87d72;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_ContentBits=0;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_Enabled=true;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_Method=Privileged;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_Name=Public;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_SetDate=2023-06-26T09:38:43Z;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_SiteId=f38a5ecd-2813-4862-b11b-ac1d563c806f;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR08MB7889:EE_|PH0PR08MB6600:EE_
x-ms-office365-filtering-correlation-id: 87743914-4480-4555-5a3e-08db7629cf99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2+5YlpU/ftkW8Uq1AGo3LzVvvLT9u59i0ZdAd+ZOG+B+fmkkOlxwKfDkTxKl4nI29E0D1Wrd3/6hufnSe5tkNGya+x2uHEqMHjkplTRJmJ1dqbTpg2eD99h40wJs0eUd4nxLeccQ14urki4L0JE75r7id69aRld8IYIO89IJZYtRAzPCWZik7ZkB128EIfkAuX8w8SEX6yuoe8zW7mzHX492qHqxjLgEUjwt77My40A4UTamAzUXIkXbaz8ceFU5oDbWmpS+XNmXS8/99CMPJw5d8Z520NoSMnaW11yhVyCcTpH7T7i6leYFhXPzTcXaLknEezMGsItCtO4zU2OS2HGvIJTcA712YPZhpU93RoIgfvYW6IW3RAxK5tNARATKRe1RbkVf9zMg07birVUh+Q5Lwv8YFfZuoknymBPP6dA39L2rL9z86lAs+ajVMZBz4PCJU6hdtmixJX+hbEdj7Wvdkhwv7XKkFu920LsMzNIxBZm1vIkXZQyI8p4klJunuz5dXwE5LNafKcOxw/j0vaVsqy1f1YfJq/bkxQlOdeFUjvMBa1r2+Ka4Fk2i38h8WADxCtW+0YfwkTUcSNUcN4bDXifiIABUzglUEOCCLR0Li4o8ASrWZ13yofE0zT1O
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR08MB7889.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(451199021)(2906002)(7696005)(71200400001)(38100700002)(122000001)(83380400001)(66574015)(6506007)(186003)(9686003)(53546011)(26005)(55016003)(41300700001)(86362001)(110136005)(54906003)(38070700005)(478600001)(316002)(76116006)(66946007)(66556008)(66476007)(66446008)(33656002)(64756008)(4326008)(8936002)(7416002)(8676002)(52536014)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkJEZFE3anp6OHJTNG43ZWNmblVsNjZsRFhGRkJmM0JxRE9oMkVZa0I3cjVZ?=
 =?utf-8?B?dG4wdCtFZVlZN0h3RlR5Tzg2N0I2QmRZYkZPd3daM09ZSUg2bDFuSzlmVWtp?=
 =?utf-8?B?UWR6eHprN3lTMmsyK05ZVHhoWFQ0T2k1QzlrZzMwSFNGSnR1YmFjY3BjdllB?=
 =?utf-8?B?aXhkM0xXNlREK1V5WEZQV2Q1dFJ3RVdsdnNCYzNPNHV0UXlEdGs1NmR2ZnY5?=
 =?utf-8?B?UVZod05QOTQ3amhXckY1QVhkR1crSllNNktwMEJ3cFZNVDVYazltSTZrc0g4?=
 =?utf-8?B?ODZudVNhb1pDeG1COVRXLy9HUjhKNXczSUN1YkdpM2YreEp6cFp0eW41S2dq?=
 =?utf-8?B?dG1pNTdlNFV3L1VGeTRtajUxaUxSdkhYNXVJY0NFc0FLRUM0bXBLUEJiQWM1?=
 =?utf-8?B?dUJOTU1GMERrcEFuSVUwaWE5ck42eFpSekxMNjN3MWE3OHJYQitmeDAwczZo?=
 =?utf-8?B?OUpxYXZQc1dLenBIc2NhNU5HOXU2ZzhEUmlURzBvMXpiZGR5dVFKWUhzYUFD?=
 =?utf-8?B?bUs3RS9sNmdTeTFsQWxpWVIxVXpKbkR4cjUzdE9lQ0ZhMWQvK3hLMkRDQ2xn?=
 =?utf-8?B?NDl5UVg3MzFMbHdHQTdJTE41RzZIZDNIRUxBQStRRkI1ZHlxYVNGL3FjQUhF?=
 =?utf-8?B?YnBDSjRENzN6Z0NKSGhueTdXVEtPRmcrV3RiU0pnREdKRjgraXRmaXN6NEhQ?=
 =?utf-8?B?dnFlelhhdytZbWpXSzVBNk9zeVJReWhnbWoydzQ2VlFYM0EzSzE5NTVpditz?=
 =?utf-8?B?VWVtK3N1MGY3S3J2N2Vqc29TbVRMR01vRUUrS1NLdnlGM0x5L1liM0JUYmEv?=
 =?utf-8?B?L0xLeHIzSWpWNjRyaGVaQ0xPNTdzelBvRFdDaTlUb3dVaUN3YVJyS0xVRm4v?=
 =?utf-8?B?VW45Y0VmcG9mZEsxVUdDUFNSRHJETnNRNlF1TkYvZEZiejFZbTFkWkRYdisz?=
 =?utf-8?B?OXNzYkwrUHdmNU9UdTgxeXhyYytkQjRXUHJuQm56TGwxOTJDS3ZKNGE3TXZH?=
 =?utf-8?B?RytiWFVTM3N4L2dKdFFtYUpVSkJYeUdDUmFLWTR6OXlOdFNyMXNqditPQVVF?=
 =?utf-8?B?aFlJQjZIVCtDbThOdStuMVBaWVpteDBSUzMzcHhFTTNRejNjUnR2cEZlMjBM?=
 =?utf-8?B?QUFGUTVYTzdENk5iVENCYnRvKytuQ1FQV1F3S09IckhacmNNRC9WcS93WEZh?=
 =?utf-8?B?MjF5MXdtU3FEUW5WbTBjOUFrZTN4U25ha1paN1hVMFp2NE1lMmpnd0dHMTJx?=
 =?utf-8?B?aE96RW8yVW9ZS2J5K0JkMWZBd1BDSTNNUkdzQllSNVhwaVdjZ0phU01mSnBj?=
 =?utf-8?B?TXZSNmRjbWtkZWZpbFh5SWJZQnRSS2N3blZPaWlobFNWTGg0eUNKK3V4R1E4?=
 =?utf-8?B?OHBJdUVZSVdkQ1I0S2ZwaHM5emdXSGZmYzhLdmNrL3ArdldnK3JNUjJpeFZv?=
 =?utf-8?B?QUFHQkJ0RlNEUTVhVTE1VWtqeXd6MHR4R1AxRkREcW5EQXYwYzNoTjY2d0Nh?=
 =?utf-8?B?c3pPdW1aTktTdzA1QUVJWXREWU9lVXNER25YTWJFZStVNGY1MXhadHJkemtp?=
 =?utf-8?B?WU5wSDkzeWJETWo3N2Z5OGVqV1pKdVNJRWNwTzR6dExJV1ZEQVg5Mk9UYlo2?=
 =?utf-8?B?NjU4TFgwTytQemQ4a1pzdlJGOGVNRDNBdFE0UUtzMmhjM0MwU0dJa3RDT2or?=
 =?utf-8?B?VGV5b0JKYXV3SnRpWWZ6cHFXSHZTM2k1V3BUQVRraHUrZ3JJRlVmM0M4MTds?=
 =?utf-8?B?d1JWNUtBbG1vekdJZ1NjMXBnaldwRzVhdE9sK3pUWEtYV25GYVpXYmNNUW5l?=
 =?utf-8?B?WW9HdE9hR285SjBLOHRjbWdmVkdscGFwUnpPQTl1QVRWK3o4K1VuTHI1ckFo?=
 =?utf-8?B?d0xVTWEwM0IxNzY2OUd6VlZGZjRhME5CQXFUNFh4cXNoYUNscER6b0pac3dj?=
 =?utf-8?B?c3FzOU8renBla2pvZHp2cnR4WVdFdUpzT3ZpclkyNVQ3ZG9lT0dYRnFmdVAy?=
 =?utf-8?B?ekowNlEzUXAycG9aUFF0cXpDSFUxakdXSWhQeE9MSW5vNGYxTXVLS2RXeVZH?=
 =?utf-8?B?ZzlkNWNpUUhRbUR3RGdMNndjaUViUUhCaFBvNlFlNzlqYzV5ODFENTJiRkpw?=
 =?utf-8?Q?cExqISlW89CeVXFbXpc0LvHkp?=
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR08MB7889.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87743914-4480-4555-5a3e-08db7629cf99
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2023 09:43:35.1564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q+6DjdskmoeEq/tZvuAPXhDkuj8B33P78Hjzd/MtXY8tQxOwIVdjXUQoFcj5z4Oep4Uvys8blIqAaKY8DHMJsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB6600
X-Proofpoint-GUID: 8muePatYORpjHFkGnmSyHR4wu9gVf8oP
X-Proofpoint-ORIG-GUID: 8muePatYORpjHFkGnmSyHR4wu9gVf8oP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_024355_225778_0BA38AD1 
X-CRM114-Status: GOOD (  31.07  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SSBzYXcgdGhlIE5BTkQgcmVsYXRlZCB0byB0aGUgaXNzdWUgd2l0aCB0aGUgTkFORCBJRCByZXBv
cnRlZCBieSBjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbQ0KDQo+IElEPSIweGVjLDB4YTEsMHgwMCww
eDE1IiAjIDEyOE0gMTI4S0IgMktCDQoNClRoaXMncyBhIFNhbXN1bmcgTkFORCBmbGFzaCBtYW51
ZmFjdHVyZXIgSUQuDQoNCg0KSGksIEppYWltZWxpYW8NCllvdSBzYWlkIHlvdSB0ZXN0ZWQgdGhp
cyBwYXRjaCwgd291bGQgeW91IHNoYXJlIHdoYXQgTkFORCBhbmQgd2hhdCBTT0MgYXJlIHlvdSB1
c2luZz8NCg0KS2luZCByZWdhcmRzLA0KQmVhbg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+DQo+
IFNlbnQ6IEZyaWRheSwgSnVuZSAyMywgMjAyMyA0OjA4IFBNDQo+IFRvOiBNw6VucyBSdWxsZ8Ol
cmQgPG1hbnNAbWFuc3IuY29tPg0KPiBDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5v
ZC5hdD47IFZpZ25lc2ggUmFnaGF2ZW5kcmENCj4gPHZpZ25lc2hyQHRpLmNvbT47IFR1ZG9yIEFt
YmFydXMgPFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbT47IFByYXR5dXNoDQo+IFlhZGF2IDxw
cmF0eXVzaEBrZXJuZWwub3JnPjsgTWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxsZS5jYz47IGxp
bnV4LQ0KPiBtdGRAbGlzdHMuaW5mcmFkZWFkLm9yZzsgSnVsaWVuIFN1IDxqdWxpZW5zdUBteGlj
LmNvbS50dz47IEphaW1lIExpYW8NCj4gPGphaW1lbGlhb0BteGljLmNvbS50dz47IEFsdmluIFpo
b3UgPGFsdmluemhvdUBteGljLmNvbS50dz47IFRob21hcw0KPiBQZXRhenpvbmkgPHRob21hcy5w
ZXRhenpvbmlAYm9vdGxpbi5jb20+OyBKYWltZUxpYW8gPGphaW1lbGlhby50d0BnbWFpbC5jb20+
Ow0KPiBCZWFuIEh1byA8YmVhbmh1b0BtaWNyb24uY29tPg0KPiBTdWJqZWN0OiBbRVhUXSBSZTog
W1BBVENIIHYyIDMvM10gbXRkOiByYXduYW5kOiBTdXBwb3J0IGZvciBzZXF1ZW50aWFsIGNhY2hl
IHJlYWRzDQo+IA0KPiBDQVVUSU9OOiBFWFRFUk5BTCBFTUFJTC4gRG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdQ0KPiByZWNvZ25pemUgdGhlIHNlbmRlciBh
bmQgd2VyZSBleHBlY3RpbmcgdGhpcyBtZXNzYWdlLg0KPiANCj4gDQo+IEhpIEJlYW4sDQo+IA0K
PiBtYW5zQG1hbnNyLmNvbSB3cm90ZSBvbiBGcmksIDIzIEp1biAyMDIzIDEyOjI3OjU0ICswMTAw
Og0KPiANCj4gPiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cml0
ZXM6DQo+ID4NCj4gPiA+IEhpIE3DpW5zLA0KPiA+ID4NCj4gPiA+IG1hbnNAbWFuc3IuY29tIHdy
b3RlIG9uIFRodSwgMjIgSnVuIDIwMjMgMTU6NTk6MjUgKzAxMDA6DQo+ID4gPg0KPiA+ID4+IE1p
cXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyaXRlczoNCj4gPiA+Pg0K
PiA+ID4+ID4gRnJvbTogSmFpbWVMaWFvIDxqYWltZWxpYW8udHdAZ21haWwuY29tPg0KPiA+ID4+
ID4NCj4gPiA+PiA+IEFkZCBzdXBwb3J0IGZvciBzZXF1ZW50aWFsIGNhY2hlIHJlYWRzIGZvciBj
b250cm9sbGVycyB1c2luZyB0aGUNCj4gPiA+PiA+IGdlbmVyaWMgY29yZSBoZWxwZXJzIGZvciB0
aGVpciBmYXN0IHJlYWQvd3JpdGUgaGVscGVycy4NCj4gPiA+PiA+DQo+ID4gPj4gPiBTZXF1ZW50
aWFsIHJlYWRzIG1heSByZWR1Y2UgdGhlIG92ZXJoZWFkIHdoZW4gYWNjZXNzaW5nDQo+ID4gPj4g
PiBwaHlzaWNhbGx5IGNvbnRpbnVvdXMgZGF0YSBieSBsb2FkaW5nIGluIGNhY2hlIHRoZSBuZXh0
IHBhZ2UNCj4gPiA+PiA+IHdoaWxlIHRoZSBwcmV2aW91cyBwYWdlIGdldHMgc2VudCBvdXQgb24g
dGhlIE5BTkQgYnVzLg0KPiA+ID4+ID4NCj4gPiA+PiA+IFRoZSBPTkZJIHNwZWNpZmljYXRpb24g
cHJvdmlkZXMgdGhlIGZvbGxvd2luZyBhZGRpdGlvbmFsIGNvbW1hbmRzDQo+ID4gPj4gPiB0byBo
YW5kbGUgc2VxdWVudGlhbCBjYWNoZWQgcmVhZHM6DQo+ID4gPj4gPg0KPiA+ID4+ID4gKiAweDMx
IC0gUkVBRCBDQUNIRSBTRVFVRU5USUFMOg0KPiA+ID4+ID4gICBSZXF1aXJlcyB0aGUgTkFORCBj
aGlwIHRvIGxvYWQgdGhlIG5leHQgcGFnZSBpbnRvIGNhY2hlIHdoaWxlIGtlZXBpbmcNCj4gPiA+
PiA+ICAgdGhlIGN1cnJlbnQgY2FjaGUgYXZhaWxhYmxlIGZvciBob3N0IHJlYWRzLg0KPiA+ID4+
ID4gKiAweDNGIC0gUkVBRCBDQUNIRSBFTkQ6DQo+ID4gPj4gPiAgIFRlbGxzIHRoZSBOQU5EIGNo
aXAgdGhpcyBpcyB0aGUgZW5kIG9mIHRoZSBzZXF1ZW50aWFsIGNhY2hlIHJlYWQsIHRoZQ0KPiA+
ID4+ID4gICBjdXJyZW50IGNhY2hlIHNoYWxsIHJlbWFpbiBhY2Nlc3NpYmxlIGZvciB0aGUgaG9z
dCBidXQgbm8gbW9yZQ0KPiA+ID4+ID4gICBpbnRlcm5hbCBjYWNoZSBsb2FkaW5nIG9wZXJhdGlv
biBpcyByZXF1aXJlZC4NCj4gPiA+PiA+DQo+ID4gPj4gPiBPbiB0aGUgYnVzLCBhIG11bHRpIHBh
Z2UgcmVhZCBvcGVyYXRpb24gaXMgY3VycmVudGx5IGhhbmRsZWQgbGlrZSB0aGlzOg0KPiA+ID4+
ID4NCj4gPiA+PiA+ICAwMCAtLSBBRERSMSAtLSAzMCAtLSBXQUlUX1JEWSAodFIrdFJSKSAtLSBE
QVRBMV9JTg0KPiA+ID4+ID4gIDAwIC0tIEFERFIyIC0tIDMwIC0tIFdBSVRfUkRZICh0Uit0UlIp
IC0tIERBVEEyX0lODQo+ID4gPj4gPiAgMDAgLS0gQUREUjMgLS0gMzAgLS0gV0FJVF9SRFkgKHRS
K3RSUikgLS0gREFUQTNfSU4NCj4gPiA+PiA+DQo+ID4gPj4gPiBTZXF1ZW50aWFsIGNhY2hlZCBy
ZWFkcyBtYXkgaW5zdGVhZCBiZSBhY2hpZXZlZCB3aXRoOg0KPiA+ID4+ID4NCj4gPiA+PiA+ICAw
MCAtLSBBRERSMSAtLSAzMCAtLSBXQUlUX1JEWSAodFIpIC0tIFwNCj4gPiA+PiA+ICAgICAgICAg
ICAgICAgICAzMSAtLSBXQUlUX1JEWSAodFJDQlNZK3RSUikgLS0gREFUQTFfSU4gXA0KPiA+ID4+
ID4gICAgICAgICAgICAgICAgIDMxIC0tIFdBSVRfUkRZICh0UkNCU1krdFJSKSAtLSBEQVRBMl9J
TiBcDQo+ID4gPj4gPiAgICAgICAgICAgICAgICAgM0YgLS0gV0FJVF9SRFkgKHRSQ0JTWSt0UlIp
IC0tIERBVEEzX0lODQo+ID4gPj4gPg0KPiA+ID4+ID4gQmVsb3cgYXJlIHRoZSByZWFkIHNwZWVk
IHRlc3QgcmVzdWx0cyB3aXRoIHJlZ3VsYXIgcmVhZHMgYW5kDQo+ID4gPj4gPiBzZXF1ZW50aWFs
IGNhY2hlZCByZWFkcywgb24gTlhQIGkuTVg2IFZBUi1TT00tU09MTyBpbiBtYXBwaW5nDQo+ID4g
Pj4gPiBtb2RlIHdpdGggYSBOQU5EIGNoaXAgY2hhcmFjdGVyaXplZCB3aXRoIHRoZSBmb2xsb3dp
bmcgdGltaW5nczoNCj4gPiA+PiA+ICogdFI6IDIwIMK1cw0KPiA+ID4+ID4gKiB0UkNCU1k6IDUg
wrVzDQo+ID4gPj4gPiAqIHRSUjogMjAgbnMNCj4gPiA+PiA+IGFuZCB0aGUgZm9sbG93aW5nIGdl
b21ldHJ5Og0KPiA+ID4+ID4gKiBkZXZpY2Ugc2l6ZTogMiBNaUINCj4gPiA+PiA+ICogZXJhc2Vi
bG9jayBzaXplOiAxMjgga2lCDQo+ID4gPj4gPiAqIHBhZ2Ugc2l6ZTogMiBraUINCj4gPiA+PiA+
DQo+ID4gPj4gPiA9PT09PT09PT09PT09IE5vcm1hbCByZWFkIEAgMzNNSHogPT09PT09PT09PT09
PT09PT0NCj4gPiA+PiA+IG10ZF9zcGVlZHRlc3Q6IGVyYXNlYmxvY2sgcmVhZCBzcGVlZCBpcyAx
NTYzMyBLaUIvcw0KPiA+ID4+ID4gbXRkX3NwZWVkdGVzdDogcGFnZSByZWFkIHNwZWVkIGlzIDE1
NTE1IEtpQi9zDQo+ID4gPj4gPiBtdGRfc3BlZWR0ZXN0OiAyIHBhZ2UgcmVhZCBzcGVlZCBpcyAx
NTM5OCBLaUIvcw0KPiA+ID4+ID4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09DQo+ID4gPj4gPg0KPiA+ID4+ID4gPT09PT09PT09IFNlcXVlbnRpYWwg
Y2FjaGUgcmVhZCBAIDMzTUh6ID09PT09PT09PT09DQo+ID4gPj4gPiBtdGRfc3BlZWR0ZXN0OiBl
cmFzZWJsb2NrIHJlYWQgc3BlZWQgaXMgMTgyODUgS2lCL3MNCj4gPiA+PiA+IG10ZF9zcGVlZHRl
c3Q6IHBhZ2UgcmVhZCBzcGVlZCBpcyAxNTg3NSBLaUIvcw0KPiA+ID4+ID4gbXRkX3NwZWVkdGVz
dDogMiBwYWdlIHJlYWQgc3BlZWQgaXMgMTYyNTMgS2lCL3MNCj4gPiA+PiA+ID09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+ID4+ID4NCj4gPiA+
PiA+IFdlIG9ic2VydmUgYW4gb3ZlcmFsbCBzcGVlZCBpbXByb3ZlbWVudCBvZiBhYm91dCA1JSB3
aGVuIHJlYWRpbmcNCj4gPiA+PiA+IDIgcGFnZXMsIHVwIHRvIDE1JSB3aGVuIHJlYWRpbmcgYW4g
ZW50aXJlIGJsb2NrLiBUaGlzIGlzIGR1ZSB0bw0KPiA+ID4+ID4gdGhlIH4xNHVzIGdhaW4gb24g
ZWFjaCBhZGRpdGlvbmFsIHBhZ2UgcmVhZCAodFIgLSAodFJDQlNZICsgdFJSKSkuDQo+ID4gPj4g
Pg0KPiA+ID4+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPg0KPiA+ID4+ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4NCj4gPiA+PiA+IFNpZ25lZC1vZmYtYnk6IEphaW1lTGlh
byA8amFpbWVsaWFvLnR3QGdtYWlsLmNvbT4NCj4gPiA+PiA+IC0tLQ0KPiA+ID4+ID4gIGRyaXZl
cnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jIHwgMTE5DQo+ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0NCj4gPiA+PiA+ICBpbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmggICAgICB8
ICAgOSArKysNCj4gPiA+PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEyNCBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQ0KPiA+ID4+DQo+ID4gPj4gVGhpcyBjaGFuZ2UgYnJva2Ugc29tZXRoaW5n
IG9uIGEgVEkgQU0zNTE3IGJhc2VkIHN5c3RlbS4gIFdoYXQgSSdtDQo+ID4gPj4gbm90aWNpbmcg
aXMgdGhhdCB0aGUgdS1ib290IGZ3X3NldGVudiB0b29sIGlzIGZhaWxpbmcgZHVlIHRvIHRoZQ0K
PiA+ID4+IE1FTUdFVEJBREJMT0NLIGlvY3RsIHJlcG9ydGluZyBzb21lIGJsb2NrcyBhcyBiYWQg
d2hlbiB0aGV5IGFyZSBub3QuDQo+ID4gPj4gRXZlcnl0aGluZyBlbHNlIGlzLCBzb21laG93LCB3
b3JraW5nIGZpbmUuICBSZXZlcnRpbmcgdGhpcyBjb21taXQNCj4gPiA+PiBmaXhlcyBpdCwgdGhv
dWdoIEkgZG9uJ3Qga25vdyB3aHkuICBJJ20gc2VlaW5nIHRoZSBzYW1lIGJlaGF2aW91cg0KPiA+
ID4+IG9uIG11bHRpcGxlIGRldmljZXMsIHNvIEkgZG91YnQgdGhlcmUgaXMgYSBwcm9ibGVtIHdp
dGggdGhlIGZsYXNoIG1lbW9yeS4NCj4gPiA+Pg0KPiA+ID4+IElzIHRoZXJlIGFueXRoaW5nIEkg
Y2FuIHRlc3QgdG8gZ2V0IG1vcmUgaW5mb3JtYXRpb24/DQo+ID4gPj4NCj4gPiA+DQo+ID4gPiBN
YXkgSSBrbm93IHdoYXQgTkFORCBjaGlwIHlvdSBhcmUgdXNpbmc/DQo+ID4NCj4gPiBJdCdzIGEg
TWljcm9uIE1UMjlGNEcxNkFCQkRBSDQtSVQ6RC4gIEZyb20gdGhlIGtlcm5lbCBsb2dzOg0KPiA+
DQo+ID4gbmFuZDogZGV2aWNlIGZvdW5kLCBNYW51ZmFjdHVyZXIgSUQ6IDB4MmMsIENoaXAgSUQ6
IDB4YmMNCj4gPiBuYW5kOiBNaWNyb24gTVQyOUY0RzE2QUJCREFINA0KPiA+IG5hbmQ6IDUxMiBN
aUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtpQiwgcGFnZSBzaXplOiAyMDQ4LCBPT0Igc2l6ZTog
NjQNCj4gDQo+IFRoZXJlIGlzIGRlZmluaXRlbHkgc29tZXRoaW5nIHdyb25nIHdpdGggTWljcm9u
J3MgaGFuZGxpbmcgb2YgdGhlIHNlcXVlbnRpYWwgcmVhZHMuDQo+IENhbiB5b3UgbWFrZSBhIHNl
dHVwIG9uIHlvdXIgc2lkZSB3aXRoIG9uZSBvZiB0aGVzZSBjaGlwcyBhbmQgdHJ5IHRvIHJlcHJv
ZHVjZT8NCj4gDQo+IEkgd2lsbCBoYXZlIHRvIGRpc2NhcmQgTWljcm9uJ3MgY2hpcHMgaWYgd2Ug
ZG9uJ3QgZmluZCBhIHNvbHV0aW9uIHZlcnkgc29vbiwgdG9vIGJhZCwgaXQNCj4gaXMgYSBuaWNl
IHBlcmZvcm1hbmNlIGltcHJvdmVtZW50IC13aGVuIGl0IHdvcmtzLS4NCj4gDQo+IFRoYW5rcywN
Cj4gTWlxdcOobA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
