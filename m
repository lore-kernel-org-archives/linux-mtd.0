Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE97CC7EE23
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jun 2023 15:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bvctoYZ644zuBqHLztSNRNxZZgjBmQKAFPvDiVETK1w=; b=lJcfbkLt3idE3D
	w0P8847U/5w7qfbiyxiMfn3tgfHPGMulhvUsA23FRV+81Qa8BErXHSd74TakUsguk5zN/q3snisDn
	JOnDhVyANCXQrCsoedjdVTAppqClR8KMPhcDfaDsTaKe779EE0UYElB//Kl54Edmuo41oZgLR/XTG
	xK2IfXroDWq6VtBA9waCJx8Kc563uffOBvCbxKAXW9MpEFjX74dCCVNyRYS0Cmz08OpkhMBCO3RzW
	4CC+7tenH/ayAfwv3zhrVHBJCYOWodENZE1TgMY4xnyt1pqgVMNIrFCyn+2MLxtTCCdCtkY8MyU5J
	nZXmiZEkZz7M9ov7osEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CP9-00G1wR-1B;
	Mon, 05 Jun 2023 15:45:59 +0000
Received: from mx0b-003b2802.pphosted.com ([205.220.180.83])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CP7-00G1u2-1E
	for linux-mtd@lists.infradead.org;
	Mon, 05 Jun 2023 15:45:58 +0000
Received: from pps.filterd (m0278973.ppops.net [127.0.0.1])
	by mx0a-003b2802.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 355ErRbP008735;
	Mon, 5 Jun 2023 15:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=k6VfGeKKefzFAps/GmUS18PJbGGCgOd7efYzJztAXYU=;
 b=BQEUeE3YaqbH/Q+Ze8Su6y9zcm0nXs/J1xJDSmSAmTrZirYDjlI1kBBte0faUG6i4rQy
 iPTYAf3os6bSrCDeRK9V1BqtuI4M7U0CBOBaupwnQYFGX+7/SknLBtwfQgcnj/tFr0yB
 eAcDrOgmDK0uAfA/LGjNlmXDBT1lMWZqXnYQ0un+b5yWcSCK2u5N2WPUpbWvhCriS/Fc
 n6gCOpfXK0rCgt6wcLj+LdnKofbU75VeaxJ9xtEoU78onkQgs6aM6qXmqKayCG+lndSX
 OBDaDMplvNaeNjP3mDTiYaBj/+7Mk8wqKmGiDQOVJfLxyLw6j8TK9aNg7mfuakD0FP9c sQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-003b2802.pphosted.com (PPS) with ESMTPS id 3qyxc3up5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 15:45:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WplvFGhv8gmfHFphWGRsVgcksMoQNctcnB7h9NTdjkP7B7m4jdlgVI+IJr6nk9AwqJYabpYhwWs1gW10qLdjKqk+jqhZiPivvLaAyjvDcNNfnfjKnx4A3w8dz07niCstEtMS2e4OV4XuHi3Xg0UulwlSfUuTNkowjEHTJBVHSAvJosczoAy4jtI2cSenCHTzXuzOxP2vJ0tIafQpqyzj/ftm2AJJGZ5R8qSo1V1cS097VlKNtpQ45oEhA9YkIFPxRvV5a33eaFHHFqhXfGNF2MHRlxwDp0BHumUhW8M9W6AWhIY0LOGDi6LR6wJEZjdU0R9Jo7u4FZpuKI9dbgLYyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6VfGeKKefzFAps/GmUS18PJbGGCgOd7efYzJztAXYU=;
 b=jifcVrgamrAgXRMkPPSs8MgU+prSnubJgIwZBcFmYEIZ9iSRaIQYMqkblVdOD9jmT/CheBbyPhNeDg1ocEHqXYcNSsg+D/+s777rS6FK4x1BvlhteEUZuAil+PAeqaCZeNYQ7zCn/rEJTbQgmCGDC2G7i4+NaUyvfouxPY+rS2cPIYSG0LO0lbVrknaLHSm32LhiS+zh+OuCiCZmjgIBn/v4snlFzNmj9NLaAUq5bGSJqg8Vp+nuLRIxGwN4CJv29J81xD4tHIc7sX5PkNFupwPBvlGZfsSk6rh76LOUPDSVhEwV4RZGrwD/El+wtfI9Ae9HRAhUMJpYPL6zClxogw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6VfGeKKefzFAps/GmUS18PJbGGCgOd7efYzJztAXYU=;
 b=mL2JZoA9MKNBJD69S7/FEvn+/C4vbsz8zPIW33RdR9qPdxcRdJGh6Ro0LDljX21/mYlp7I3aL/1uKPZdBqoX77bE3Vp9Y1MzS7gaXAeIcc8+sI67y2+EtC8OP58y1Oai77IQ0lwggVI1eV1HZoZDgg/nn522qsL1JcJVl+dvDMx7vuJ1whNdHEAkIRRYbNXQ2JicxLiFBLsxeUGzIdw4O62tapxGBZImaugzh0zebCYF0RaDSFsacgBBIzSUrRRP7PzQO8C8Z1wW2AIdf/NwM8I+w/GwCGqD5FS/F9nA185/Xuouz0wL1K218SqvWJrWU26wfqUvNimqepOAE5RrVQ==
Received: from PH0PR08MB7889.namprd08.prod.outlook.com (2603:10b6:510:114::11)
 by DS0PR08MB8678.namprd08.prod.outlook.com (2603:10b6:8:15d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 15:45:39 +0000
Received: from PH0PR08MB7889.namprd08.prod.outlook.com
 ([fe80::838a:faaa:a6c:ce8b]) by PH0PR08MB7889.namprd08.prod.outlook.com
 ([fe80::838a:faaa:a6c:ce8b%4]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 15:45:39 +0000
From: Bean Huo <beanhuo@micron.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Alexander Shiyan
	<eagle.alexander923@gmail.com>
CC: JaimeLiao <jaimeliao.tw@gmail.com>,
        "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: RE: [EXT] Re: Boot failed after patch "mtd: rawnand: Support for
 sequential cache reads"
Thread-Topic: [EXT] Re: Boot failed after patch "mtd: rawnand: Support for
 sequential cache reads"
Thread-Index: AQHZkiMzb3ovCmHk00i8y+AILspS+q9y4RPggAE3zgCAAXq0AIAAlvEAgAEg/QCABKLDgIAAdZjw
Date: Mon, 5 Jun 2023 15:45:39 +0000
Message-ID: <PH0PR08MB7889A36C14C2229C3DA3CDB0DB4DA@PH0PR08MB7889.namprd08.prod.outlook.com>
References: <CAP1tNvS=NVAm-vfvYWbc3k9Cx9YxMc2uZZkmXk8h1NhGX877Zg@mail.gmail.com>
	<20230526201420.231092a0@xps-13>
	<CAP1tNvQsmYKMHZ662f1yiLv2JmZZrnQsJr2Lf5xiafxJSkZfBQ@mail.gmail.com>
	<20230529101240.53065e04@xps-13>
	<CAP1tNvRTRkXMztGL=nxrd-Cv5xO58-R=A_M2r65d6cyidoVz0g@mail.gmail.com>
	<20230529134619.255d0b07@xps-13>
	<PH0PR08MB788936E00C0DD958BFB9B3F6DB4B9@PH0PR08MB7889.namprd08.prod.outlook.com>
	<CAP1tNvQg+3O6LOaAnAMXionvLUy2FkF7yWtjXUma-ZLL3EE7nQ@mail.gmail.com>
	<20230601093734.3c752d2f@xps-13>
	<PH0PR08MB7889C9577C6AD5BA2221B74DDB499@PH0PR08MB7889.namprd08.prod.outlook.com>
	<CAP1tNvTS=kW_pPM5Vn4COmCXR7L6wj+CXtKs_Tnf=UQk2i7=Bg@mail.gmail.com>
 <20230605103943.064d142e@xps-13>
In-Reply-To: <20230605103943.064d142e@xps-13>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_ActionId=ac8213de-f050-4a7e-999e-4db9edc695b7;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_ContentBits=0;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_Enabled=true;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_Method=Privileged;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_Name=Public;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_SetDate=2023-06-05T15:40:53Z;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_SiteId=f38a5ecd-2813-4862-b11b-ac1d563c806f;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR08MB7889:EE_|DS0PR08MB8678:EE_
x-ms-office365-filtering-correlation-id: 768e14a9-5ecd-4e91-5f52-08db65dbe9ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l7gJl88nyDLwcjFk3aDoQqEWTpczeq6WW9iGakfi13xeoVDYTdMzM6Vg5hcfl5TraHVQuGwR5npgYXgxJOJ+kshqa9J1d/OaNj4VbSBg9x1AjxtBPE9qpn6sqnLyUqp15DrjZEF3+unjveb3C80jdexyKaci8uLwM6UyYJvqpkepDwlntAAQUpSlHjhzGuyZd1B/JcIkJ90g5YF0NTGdoMJm3KmpmEwXoYnIWoINfkg7pfr6Xvu6KvE+2noNnK6OsGSCrCax1AxwljrjUxsE4Lg1YD6J5lRFPD7jU22zZM2h1VwavTnHQDCkiA3Us8vw+wlIxXV2hbztdGl3kt4QlStSULgm6v1B2FQa7bgGq6BwDoApLrTRx19FAhCfBYDT/Y9MJE6hmibGG2KdYhZ/trZi6yTRpPHrR4nYQq+Pwk/Qgu5KMrXVLJM+nYKQ8NCyX8a6I57hsG24y5MNbF9rDU5LobVFviZebItJeYFo4tV5Z+vDDHE9mdxpA7kTrUfLOCQz4vc5dspBoYXDtFdnHqCYYFzPXGoFB40EGiDWWnA63xb1GE/7+0NXvglYLQOVG1/tPChSxxZRXL/PU6RBA7zwpdtVph5DrZnml0h9gMquwFD+61I5mdtkzxU4cu3S
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR08MB7889.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(451199021)(122000001)(83380400001)(52536014)(54906003)(110136005)(66574015)(4326008)(64756008)(38100700002)(66446008)(66556008)(76116006)(66946007)(66476007)(71200400001)(7696005)(478600001)(186003)(2906002)(38070700005)(8936002)(8676002)(41300700001)(316002)(55016003)(33656002)(5660300002)(86362001)(53546011)(26005)(9686003)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDAyQnVaNkJoR3ZpUzJSNE5hTmRkdkVuczAwOW5oYVBzYjFncnJUbFJIdlpy?=
 =?utf-8?B?SDZYUlhQa2lzSStaV0tPMm51TVBwc3grQlJzeXBwMnRxa2VqbjFyK3hqZFor?=
 =?utf-8?B?a2NQQ0JpKzQ3b21rL2RrNUdZK2NwUDhJTENJOUpQNmFtRkh1WWJ3QW5NN3N4?=
 =?utf-8?B?aGlWNmV1ZExWWEpIRUFMOUwxRi9qbk5UZWQ1QjhyVm45K0RsZlJRb2kwMk93?=
 =?utf-8?B?bXNsRmZvWnAvN2xUMUkySXJhd2x3czFQb2VEdjkxb1RpeWpWaExVbWFRenFD?=
 =?utf-8?B?S0lTT2w1T2RXa3huSXF4R2lzVlM0cHhJVW5RNUMwQTVkU2g3YnVVK0lRUTdn?=
 =?utf-8?B?SHFpODFPYnlmbTFoK2pGbEhIMG1WaEs2b0xtalJOOGNOOHRnMGxMMlh1UlY2?=
 =?utf-8?B?L3phdzNwdlN5VzNYYklFclFqYVZHWXpYV0ZTdU5ZWWprQzAxd0tHVVp4Yzd4?=
 =?utf-8?B?ZTM5aE54N2NoRmwvK2w0OUYvQTNRSDFZQThjQm9SbURXWGdEdnJXU29QTGlR?=
 =?utf-8?B?Uk9tSUlTdmZ2SjhMU2MvOWsxUVJGdG5pNVdmUnJaMlZEUERWVFBNcjRJNTlv?=
 =?utf-8?B?VG5JRXJDWUJnVFdCVTE4MWlkSnE0eG9hZGdOVW03Ym81b2lGT1dOZUk2REM2?=
 =?utf-8?B?OG1SbzIwT2FSWGsvMDVjQXJzc0NaU0x4RW1uL3p5Y3NkaWlFamp3Z3RKaGRY?=
 =?utf-8?B?VnBhdG02MTBXZmZIUmxkeTRUZTAvNVlRU3FQaW54anE0cEVtNmlaTkM2cTBW?=
 =?utf-8?B?YUloOVRsTkxET0pmOFY0QmtnREhsYzNUMEZPVitwSTk3Y2FWOUtKQ1lyNFdx?=
 =?utf-8?B?RExack1SbEFMQTlwOW9leE9kRnVzU0hVOGxsVjIzckI1SFJkcUtTS3B2d2pG?=
 =?utf-8?B?ZllTRHoyQ1VDY1hPeDFqNFpxMXNRc2tqb3MxMnlibGp4OEh4REIza1RjWDBU?=
 =?utf-8?B?VVFvYmpjcXp5YmlGUVAyZjBnUHFjTlJ1TVU5azNVeGZUK0cwQ2N0aUJKOFJP?=
 =?utf-8?B?RTdKM0VQQmhldmlHcnA2TFFyMStsQ0oyNlFWSk1LbzJHTldtWkNKd1Z5K3U2?=
 =?utf-8?B?YVd6bEkyeVoxMDRBQmtJWUJoOWZWQ1FDbTh4U3FrbEV3SU9Db2NZYWpBSFAy?=
 =?utf-8?B?MFIyeFl4NUljVC9lRnk3clk5UVFYYjF0elhDbVpiTEFnMTZwbE5qVmNySEZU?=
 =?utf-8?B?aEJ5di9oVHBVcHIrTzJ3U1RMQSswV3Q1RHBreWFZSVpqU2ZnZEliUUFDOFJC?=
 =?utf-8?B?VEI5eW9LTnczVjBWcTh0cTlkM0Z4UzZocGpudHpQblZyb0VDeHZXTTlCdXlB?=
 =?utf-8?B?WUw2cU8yeVpIeFRMbStUYXlLTWZWZk9GODJoWFI0eDNaOVduTUVrNE41WUsr?=
 =?utf-8?B?dUFhN1p1NDRVRzVNMGV6b2ZZUHYrZlZPdW1BWmNTKzBpZk9tR2tWZUt1dWc0?=
 =?utf-8?B?Q2MxUkY4RlkydHUvK1VmZ0dVbmUvK29PSnpIeFZGUnNOQ2JsL1Rkb2FrUnQx?=
 =?utf-8?B?UVg2TGVmSDhwczE0VUJocjZvcVExUUNEQlVzTTJzNG9vbzBRNXRTM1daTmo2?=
 =?utf-8?B?L3hQbHEzM2JSblZxc1BvRWtpekwyNEFMOVM5YWM4My8vdXE5bFd1Q2c1RTZ5?=
 =?utf-8?B?azlIYnlseS9YOUpkN2s2cnB2SVNJMDhlK1ZFZG4vdDJaV3FBc3A0NnVwZk5T?=
 =?utf-8?B?bFBlUmdIVHJaUFZjTUZFR3R3MlYrSmZQTGN3VzcrUysra1plUUpEL1hHK1dl?=
 =?utf-8?B?VjU0YmllbzVrTGhaV0dvVm8rb0QwOFZESURzOC9lSkx6bUlyTWxOWXJMbmlF?=
 =?utf-8?B?bkdFTHM1aUptLzVzOERscFZ6dlB0dXI0WWFFY1ZpRzQ3YzE5YlU3VTNVRG9V?=
 =?utf-8?B?QXJJRWNVTi93WXE1aXBKbTlkZ3Z2d01ibmpSVkozbC9jSDFaaWVMTkhzMUFB?=
 =?utf-8?B?ZTZuZFhoSnhreDBCcU1IQTE2TXRSVU5LaWk4ekEraG9RYnlORldwc01TZUEz?=
 =?utf-8?B?eVRQK1ZvQjBYdnZoUnd4SUpGTjlzUWI4S1BFQlRoLzNaSmVxMUdOQmUwT3VE?=
 =?utf-8?B?VkVEV29jMkgxZDI1Tm1mSnRGTHI3MVdJVVpjQTV1aVFGblNqdERHN2VwQ0ZN?=
 =?utf-8?Q?XM094c8u5XHW9Gu2Qf2d6rAwI?=
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR08MB7889.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 768e14a9-5ecd-4e91-5f52-08db65dbe9ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 15:45:39.4889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ySza2YGWP/g3kE2uP0JzJDFaUuwS5H2DMDToZxGgqQTwHkKrv/M9q3wdlOpsuDnjcX6NByAS/Y8rooGaEWK95A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR08MB8678
X-Proofpoint-GUID: 58Jg8E_SjWjMuGnEp3KH5bBsPmyUUNiH
X-Proofpoint-ORIG-GUID: 58Jg8E_SjWjMuGnEp3KH5bBsPmyUUNiH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_084557_623569_D94B1FD3 
X-CRM114-Status: GOOD (  25.99  )
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

SGkgTWlxdWVsDQoNCkkgb25seSBjYW4gc2F5LCB3ZSBoYXZlIG5vdCBleHBlcmllbmNlZCB0aGlz
IGtpbmQgaXNzdWUgeWV0LiAgTXkgc3VnZ2VzdGlvbiBhcyB5b3VycywgcGxlYXNlIGZpcnN0bHkN
CkxldCBBbGV4IGFkZCBkZWJ1ZyBwcmludCBpbiBtdGQsIGVzcGVjaWFsbHkgaW4gTkFORCBkcml2
ZXIuIFRvIGNoZWNrIHdoYXQgZXhhY3RseSBlcnJvciBjYXVzZXMgdGhpcw0KU3F1YXNoRlMgY29t
cGxhaW4sIGlzIGl0IElPIGVycm9yLCAgb3IgQ1JDLCAgb3IgRUNDIGVycm9yLCBvciBOQU5EIGRl
dmljZSBubyByZXNwb25zZSBhbmQgdGltZW91dD8NCg0KS2luZCByZWdhcmRzLA0KQmVhbg0KDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pcXVlbCBSYXluYWwgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSnVuZSA1LCAyMDIzIDEwOjQw
IEFNDQo+IFRvOiBBbGV4YW5kZXIgU2hpeWFuIDxlYWdsZS5hbGV4YW5kZXI5MjNAZ21haWwuY29t
Pg0KPiBDYzogQmVhbiBIdW8gPGJlYW5odW9AbWljcm9uLmNvbT47IEphaW1lTGlhbyA8amFpbWVs
aWFvLnR3QGdtYWlsLmNvbT47DQo+IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+IFN1
YmplY3Q6IFJlOiBbRVhUXSBSZTogQm9vdCBmYWlsZWQgYWZ0ZXIgcGF0Y2ggIm10ZDogcmF3bmFu
ZDogU3VwcG9ydCBmb3Igc2VxdWVudGlhbA0KPiBjYWNoZSByZWFkcyINCj4gDQo+IENBVVRJT046
IEVYVEVSTkFMIEVNQUlMLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1
bmxlc3MgeW91DQo+IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZCB3ZXJlIGV4cGVjdGluZyB0aGlz
IG1lc3NhZ2UuDQo+IA0KPiANCj4gSGkgQWxleGFuZGVyLA0KPiANCj4gZWFnbGUuYWxleGFuZGVy
OTIzQGdtYWlsLmNvbSB3cm90ZSBvbiBGcmksIDIgSnVuIDIwMjMgMTI6NTI6MDggKzAzMDA6DQo+
IA0KPiA+IEhlbGxvLg0KPiA+DQo+ID4gPiBBcyB5b3UgbWVudGlvbmVkIG5vIEVDQyBlcnJvci4g
IEFuZCBTcXVhc2hGUyBjb21wbGFpbnM6IFVuYWJsZSB0byByZWFkIGRhdGENCj4gY2FjaGUuDQo+
ID4gPiBXZSB3YW50IHRvIHNlZSBJL094LCBSRSMsIFdFIyBhbmQgUi9CIywgdG8gY2hlY2sgaWYg
Y29tbWFuZCBpbnB1dCBhbmQgZGF0YQ0KPiBvdXRwdXQgcHJvcGVybHkuDQo+ID4gPiBJdCBpcyBi
ZXR0ZXIgdG8gY2FwdHVyZSB0aGUgY29tbWFuZCAzMWgsIGFuZCBpdHMgZm9sbG93aW5nIGRhdGEu
DQo+ID4NCj4gPiBJIG9ubHkgaGF2ZSBhIHR3by1jaGFubmVsIG9zY2lsbG9zY29wZSA6KSBJbiBh
bnkgY2FzZSwgaW4gb3JkZXIgdG8NCj4gPiBjYXB0dXJlIHRoZSByaWdodCBtb21lbnQsIEkgbmVl
ZCB0byBzb21laG93IGxvb3AgY29tbWFuZCAweDMxIHdoZW4gYW4NCj4gPiBlcnJvciBvY2N1cnMg
aW4gb3JkZXIgdG8gdGFrZSBhIHBpY3R1cmUuIFJpZ2h0Pw0KPiA+DQo+ID4gUGxlYXNlLCB0ZWxs
IG1lIHdoZXJlIEkgY2FuIHBhdGNoIHRoZSBuYW5kX2Jhc2UgdG8gZ2V0IHN1Y2ggYW4NCj4gPiBp
bmZpbml0eSBsb29wIG9uIGVycm9yPw0KPiANCj4gQW55d2hlcmUgaW4gdGhlIGNvcmUgeW91IGNv
dWxkIGp1c3QgbWFrZSB5b3VyIG93biBleGVjX29wIHNlcXVlbmNlIGFuZCBjYWxsIGl0IGluDQo+
IGEgbG9vcCBJIGd1ZXNzPw0KPiANCj4gQmVhbiwgd2hhdCBhcmUgeW91IHRyeWluZyB0byBwaWN0
dXJlIHByZWNpc2VseT8gSGF2ZSB5b3UgZXZlciBoYWQgYW55IGlzc3VlcyB3aXRoDQo+IHRoZXNl
IGNvbW1hbmRzPyBDYW4gQWxleGFuZGVyIHRyeSB0byBhZGQgYSBzdXJnaWNhbCBkZWxheSBzb21l
d2hlcmU/DQo+IA0KPiBUaGFua3MsDQo+IE1pcXXDqGwNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
