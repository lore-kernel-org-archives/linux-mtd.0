Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A6FCFD2F6
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Nov 2025 02:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K+tdkf2C8P7u+VQ09P49Pbtd4253OEUfUKPx7ETr5GU=; b=xvarFxRbVF5Zsw
	ZgHLHOckZNB0TCOKWk5WDyncc/PjKKmKmlE4alE7yIJtAR5+TIUJfDEbA2HP+Ak96oQDvSFk7GQKO
	fdAK741oIs5FOdyjzMbnuA8wtsyy0YrJa49xhSxo93Q+c3/uwNW/+cM31uZdZ6iwBnNeccU2eOG68
	YwWTEVv2/Yyf8/pbv3360FhDzGlmFAErFF7YM53wtLXppslQIHWzpJchWb4Rr/7EaJuqROoeNJ+98
	0jWj8sdYSfMncZLhOVpKKSwIvGvawQtars/briq3azh+xTYWqrP7rwwbeo5FaHMkka/MnAfpobE98
	MqFo+1v4isi+9E8q0BUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOo9t-0000000HSSd-45mU;
	Fri, 28 Nov 2025 02:24:29 +0000
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOo9p-0000000HSR3-2QbB
	for linux-mtd@lists.infradead.org;
	Fri, 28 Nov 2025 02:24:28 +0000
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS200lE1633674;
	Thu, 27 Nov 2025 18:24:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=CF2cWi5w7
	tNymxUX+iyqAkSmf2/wYG02fSD20JWfErM=; b=YYBJAv1NcDaYYabuj1CF2ep1E
	xYvDuU3XDZMWNKj3Hz7B6v9vt3APvLDqpfNv7grIizeOOrHhYY40OwxgnRkfV7nD
	KLd4qki/jmlF7RpHssp1/MpNFsFCNKAOjqDasr2k/5QXfQXtgaCk7a4TNk7qvqNT
	dDJJF1Lm3agheSIbEwapXUMbNseoIDCT1YIAr+bqdSWarH4UcSFX8oA2br2iNzU0
	Zj11QAitDIhfRvOYHD1UawSOM2qB0vNzQe+6f97uMFIe62BBpjdqZgjbJ4MRvSha
	YfiHkUYqcho6u6giFxcNI2bvcMsJNe09b6PJWG+aF46XrwvmB24M6ZRrBhGlA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011024.outbound.protection.outlook.com [40.107.208.24])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4akdjje3mn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Nov 2025 18:24:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJ3LHLpPB5TzSPdCIrRKEVRJAHzNuh/RMVh9glvbxvQN37MPLPO5UQdRlmHYGqbXsrpZYAOoKi4x8GxHugS2wsomIP4qocjKywP8lqE8pejeO4pQMSC3PNeCZgqKgImanHsFZxqBE0TB71mC5mKG+Im6qh0WwYrxrXIX6GlzAL+Gk6iksaQxBVTtQgDC7f6fMO9wvddp51XFv8GrzDuQuOWv3fVbX6ndURPhBZf9G2qZWYfZd2n9OWMYEUnGkuW5Q7GNmOAnPd4/BnFmam0DM7mCVIb1CtICjYfzc1YVkactqZ0N+LRaM+sdKKoNv4j15Q0/7qMon3q0gVuP8xJw3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CF2cWi5w7tNymxUX+iyqAkSmf2/wYG02fSD20JWfErM=;
 b=e+yQruYpPVMgzNCs2HEiJkpTjNwZ0Vth/wB0PXB1MztXDbCB694yIiqUczWBl4lvYmBav0HQzMzLz7uxOpHX1J9a8S0rGHFziU6K6w/SJsMwS7IzuLN7hs4sE81j8SjzIni4GVo4dCGHxT03XE/hKbkOASW+pL9T8CSGKmedXZUdFp/lB59d00I0u4JHPzpT5daQysiuqc5yaZ8lf/ZMhXGcuYh5irLZSuupSBxdXJHmxTroAcEe3CAu58vGG+h6XZ1+e0nYP/TdCJ0Kxaxy8MoIctzkPhv7BR/v7PVosEvd4C/KNMEuN0EkSKFjWSpQKM150kGnR0BJc0bjo1sdMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by CH3PR11MB8589.namprd11.prod.outlook.com (2603:10b6:610:1ad::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 02:24:12 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6%2]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 02:24:12 +0000
From: "He, Guocai (CN)" <Guocai.He.CN@windriver.com>
To: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
        "richard@nod.at"
	<richard@nod.at>,
        "vigneshr@ti.com" <vigneshr@ti.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [BUG] MTD: refcount underflow/use-after-free during rapid SPI NOR
 unbind/bind cycles
Thread-Topic: [BUG] MTD: refcount underflow/use-after-free during rapid SPI
 NOR unbind/bind cycles
Thread-Index: AQHcYAo7WMRG+ACdGEuvkywC/Sj/Ag==
Date: Fri, 28 Nov 2025 02:24:11 +0000
Message-ID: <CO6PR11MB5586C35409D4E416C4AE79DFCDDCA@CO6PR11MB5586.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-11-28T02:24:11.578Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5586:EE_|CH3PR11MB8589:EE_
x-ms-office365-filtering-correlation-id: a9910c1d-7a39-4284-156a-08de2e2537ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?gBdWH6EqDgccEc26rTcPLveLWoEuvZ4T0EcT+DVUe53bg27qOOPkcyUQTA?=
 =?iso-8859-1?Q?i4w1eeCStEeto9nJV7DLGWH6g3ExLqJJyj5doo/wfnSfKCiOkmItH2aajt?=
 =?iso-8859-1?Q?IahPtbfb4USYQXXoay6pJrNR9PS9kJUHUsZMA8RbbhMHPGvY4kV5ZUoiWp?=
 =?iso-8859-1?Q?uUcfWGNHnOjUDLQ0KCl0o4XqRTMM7yLTLqbPbbjGPMdcsR/q8no3ZA8/66?=
 =?iso-8859-1?Q?iQXrkIjiRPVHPxvHYSPF3t6h6yHrUeUkY7p7NvWB/yB2XVw1gPYYY9yadm?=
 =?iso-8859-1?Q?2xEjd3+5ZEm/w8Krmb0qpXWrFkmTKJNz3uTF32b8pubTJyBOvxE3YGmskg?=
 =?iso-8859-1?Q?fjQonOFDYIIdY5eoHv2AIquBPYKZOaWRSt/Ob2KQTuMEDfSKknkAEHEzUN?=
 =?iso-8859-1?Q?NTkVYmcELt4H/Ob9Rkad3BHQy8II+FM1A/CxZUhi9eVTGjRE7N7Ycz9Dpx?=
 =?iso-8859-1?Q?NNzpBCHYHSnkFTP4xrElUSQaJSWj4T3FhWWfCV2VcWYjS6GtSd5CAInP4o?=
 =?iso-8859-1?Q?4BTPliHd8KkFKfEd8+AxrINufxBpIW8rnENkGLKftjOxq+hKQa1UBlzMdF?=
 =?iso-8859-1?Q?B1kcNV90gsacaYrHvysX61UhLV6ctHCrh+PxToCyNL5GBj3lWAUCo5QcPd?=
 =?iso-8859-1?Q?77XR/EU+srRVUL+6b2xUvaxYUWPFz1/+r/rhT9vH0dGs+tlwHpSq0uX6J6?=
 =?iso-8859-1?Q?XDcZv8Rk64cLlzO47P5bkDKQiDVGCS/QPrEDydOmPdKNjbbgU1HkVeyI4D?=
 =?iso-8859-1?Q?6zeUfHC+NtgYNLZQpcmG9QqLUTg+1Ic6bzdFzyuxh9Uhfd+izPt4hTf/AO?=
 =?iso-8859-1?Q?jajDutObd9KW0CpUMhnHU+M/ycnO5qFCCVhlFuAw7f6e3LvMgd6VCd7EJk?=
 =?iso-8859-1?Q?PQk+zH8eV/IXT87SGww8lNPBMGo3mfWmtG/HQ09YNE3+DWBHNBugeked7W?=
 =?iso-8859-1?Q?JYYe5T0GinQoyu6duFACmJwi13Rai5EWNu3RKTW16tBFAw1EG3zJYK8Tfd?=
 =?iso-8859-1?Q?Rxai8lfYvNfG3/xLtqMiDlhKUKDsk6TisYsFvqQYlGfYKdmEyVABSRZov4?=
 =?iso-8859-1?Q?8XJ4S/B15GRYZGgh9XtzkPgJXB/mOrkVHDyFEjnvCeniLnpRnbqDZXBSgB?=
 =?iso-8859-1?Q?G5bYGjcEcChvkBuHEghvFX38PKxloXBrLEa+eOMLTUgqY9qHZTm9z+1qhJ?=
 =?iso-8859-1?Q?RA1aS4IHlxPr79ySoKhWlirbKNXMdALmUD9aOgQVYPZ1jAbNxikuuOYt8t?=
 =?iso-8859-1?Q?kfvXahodXCmLv5feUufQeE80EuYYkSFTYmlTcvVKmz03AUTvyMPWeDKBuI?=
 =?iso-8859-1?Q?y7HXC4SX3rQbnT7ZNYEVZFs2hyPqg0Skws5TbhjcT9+53+QoV6tURDe+on?=
 =?iso-8859-1?Q?68cP8dIPiqbgLwI/Edq14OnY9NC4pBco99EESiS3dXfMaBT5xMBIMZY6ne?=
 =?iso-8859-1?Q?jwFrNHFgiBruyN5Uym4davx/iTPe5/Q4JWW9LqMcOUNp73pHioKk75PX1q?=
 =?iso-8859-1?Q?VdS2XsQ76jHIDyVq29V4yIJxq39ofSwuRAJ01z45nR2FeB9sx+y5ulZ4SY?=
 =?iso-8859-1?Q?GpgwkFdPgKdXQJr/0i2a2dVYsqGO?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tzylDv0KP39ZMhYl8UBOlQiyQXA0cNtjoI4G3cL0jxBkdpCyEeHUTSKKS0?=
 =?iso-8859-1?Q?2R7uzeHw1zBBBNo3iO5doIUraRCRoRgO9hinyGJRzoQYR9l/N6IvjyQHBV?=
 =?iso-8859-1?Q?zGmaxt/3qSSW6jvMCzycXhNs6fuwvA23BlwRKRanEd+u5b1hivL0t87QQ7?=
 =?iso-8859-1?Q?Ho0AMJK21N/XXYboacaQvL/I6ytSFZjYjC8I0n56mTjGB1dncmJ7nY7eXN?=
 =?iso-8859-1?Q?hSSDprvcqJ0X6mGeUc4rf25Q743S7o/azD4AV/pUJHFgKnaIh3YnGfq9bf?=
 =?iso-8859-1?Q?LTs7ulNpaEP+jjvGavj/2chmZzaOQ6vG3sCU71RW/VaOGkF7ePvm/EzOA+?=
 =?iso-8859-1?Q?enBhtOEkaxYnxkMl+Wv9Y/0LAd3NWDfr/RWx4oZ+gMcpBRd+8RCZhxGhdh?=
 =?iso-8859-1?Q?Q3hGHeX4Yv2gIN4Hydoen3cj92yjzfky1AGgDGab+exT9InGYJgEhMXVzC?=
 =?iso-8859-1?Q?Q8Jbz4J1USuufxEmEkW/+Yt1gSqvg18hjmdi5+ImLlCjlEOYly64QExsgv?=
 =?iso-8859-1?Q?+X0hoA32ARFQJQvfnbbQ5X5yeMnZHRrbbHCHw1MCegSpt+xWlEL6QFtB9e?=
 =?iso-8859-1?Q?darRilZhLsgA3pD1yk39pexG/u3ZTYqMAGz0ExYbyEuKvX4OAaVgUUFqzX?=
 =?iso-8859-1?Q?cNHJEdAU2/Ik1otHv4FNHKrERxhV0UKiqvo9dWkm0V/SvJu+NYlQ+HwW3R?=
 =?iso-8859-1?Q?Ynext+aOXWlWtxp027/BIbjcHCOPFBq1ocU+zk6ScvHR7U7zDt2Z8O9+7d?=
 =?iso-8859-1?Q?LuU/f7Z9iFNtXNRuij5D+661yqfetPAlHG14S7KT7f5ii7pmDUtuwu5onZ?=
 =?iso-8859-1?Q?/ONKmmH8mV/kBuhsQQezTA/8NjNJZc9V/EGfWHaWT0hXnqnrhFk0xWRbYp?=
 =?iso-8859-1?Q?Tn7tD4QRtErWqmffSSiOf14dT5UU56aJM0K3iAZsv0q4j/6MGkfu75OXOC?=
 =?iso-8859-1?Q?Jtc1rDl4HjTcVVc61SLXh0r+lUPPXvb0WoNeUx8uclFe9cKBY4LUswc7nO?=
 =?iso-8859-1?Q?57jPZulMnPT26lHnxKOMd0UjX+SY7RcnKHvwnLg2FLqtWOc6No9cK80oHC?=
 =?iso-8859-1?Q?cIouPuK+B626ek/hZzu8kPGdZwAB7ZK4CGAyiR9tM4KeuXwAaLJfOgL4OR?=
 =?iso-8859-1?Q?INpxoHczktqqtol0JXQKOnTXMXOvQ7cbc00HclkZLiUBMJIxqdFnjUwzcU?=
 =?iso-8859-1?Q?UeRr/K5zlC2vHM0CRAeqTL3qVwJXYJ9LnSag4ggYIZSALXEePnM7/SkAaZ?=
 =?iso-8859-1?Q?wqRQgQ1GT1nKem7hyGkUJ6BRRjknmzkHSK8fuWY5pANfRxeXo5QPOJX1Bx?=
 =?iso-8859-1?Q?4pIGHItx2kWuqwMq/nSCbS9VH7eE7fz87CFlTTNWoAKkB5jiTegDtpPmwd?=
 =?iso-8859-1?Q?WV/N/mZ47pb6cmcNSsz1hOuLBBhJ/dzchrDSb9JFOGIs1hxKGOrAdrjdkI?=
 =?iso-8859-1?Q?037LMx4z02DEvo7OAnViCUPPmRvtlVQSgVM7+RcLX16gcSmT+S5TyXWjQo?=
 =?iso-8859-1?Q?H5Qq2zNnfdlxy386itGao4OVnRX6+lFZC/98w7fQW/r64O2YBBlo0gvt/4?=
 =?iso-8859-1?Q?hRPDQ6MtqU3hglwhSw8Qt7AGUzrBa8OM5KoZtFxxeyRZcxz2iJTk2jxJpZ?=
 =?iso-8859-1?Q?R8pIkCwfYP9K6LR+R5Vpm1/CTyw7C4lxfRjZTS14pERNngnyVBQMSv9w?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9910c1d-7a39-4284-156a-08de2e2537ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2025 02:24:11.9595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eV5jBuxU9qMmnss+baEZtsQpmpSH3vDHXBanD/+atpvKBwRlnORg09Wf3eT8J4yG9zTYWNfSIJqlsJDf0VqUP0xOvPJxy9nBytIZYZVGijc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8589
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAxNiBTYWx0ZWRfXy9Kn8RVecj19
 TVsgN/EWL2Rx0I4XzaxYL4MX4wOatpCdSonrtZvsrRWkAtZ1Bgz2nsQWPl2eBvPN+rv+GaQADeI
 Eu0lws4l/k7urVkBYBYdQqPG9YSI60n6WkR47I+61JTqpi094ADjxFv3lki3Ij0kZGsbQJ8JN6k
 MXSqltrHVuyIH5n9CS8UghMWI1XeKKiZXEs4dlbE/XB8LMV1uD1qbDFPfnAw7l8xmNFUZJN2nc0
 UJxLAU7MsNFdPBPIfl6pJqyU+UK5JRS0gSLMJ/3KQqGJZsRQG9QmAmIixDBzzKdDLVsKv3Cx+/q
 HCqBNRq0KyGdAob6jTsSSRQk+/Art3Vfv8TBNx5mdNSUyub5+b+H2Rj/HRmp90Jb8snynha5vpi
 b84FGFRMlERLYTJW7ZHx+3KBEpLywA==
X-Proofpoint-ORIG-GUID: A9p3JNK3bhUSI7Z_TDxCzbQO0nWDVM2M
X-Authority-Analysis: v=2.4 cv=Wq8m8Nfv c=1 sm=1 tr=0 ts=692907cf cx=c_pps
 a=DvLgf67dpzRpeCMgcWG2JQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiI-8pY_HvcR-Zhtw8kA:9
 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: A9p3JNK3bhUSI7Z_TDxCzbQO0nWDVM2M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511280016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_182427_398692_D403A009 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
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

Hi MTD maintainers,

I'm reporting a kernel bug in the MTD subsystem that causes a refcount underflow and use-after-free warning during rapid SPI NOR driver unbind/bind operations.

## Environment
- Kernel version: 6.6.116-yocto-standard #1  (6.12 have the same issue)
- Architecture: SoCFPGA Stratix 10 SoCDK (ARM64  have the same issue)
- Device: SPI NOR flash (mt25qu02g, 262144 Kbytes)
- SPI controller: ff8d2000.spi.0

## Reproduction Steps
1. In one SSH session, run continuous unbind/bind:
   ```bash
   while :; do
       echo spi0.0 >/sys/bus/spi/devices/spi0.0/driver/unbind
       echo spi0.0 >/sys/bus/spi/drivers/spi-nor/bind
   done
   ```

2. In another SSH session, continuously read MTD info:
   ```bash
   while :; do cat /proc/mtd; done
   ```

3. After running for some time, the following call trace appears:

## Call Trace
```
Deleting MTD partitions on "ff8d2000.spi.0":
Deleting u-boot MTD partition
------------[ cut here ]------------
refcount_t: underflow; use-after-free.
WARNING: CPU: 2 PID: 921 at /lib/refcount.c:28 refcount_warn_saturate+0xf4/0x148
Modules linked in: sch_fq_codel openvswitch nsh nf_conncount nf_nat fuse nfnetlink
CPU: 2 PID: 921 Comm: sh Not tainted 6.6.116-yocto-standard #1
Hardware name: SoCFPGA Stratix 10 SoCDK (DT)
pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : refcount_warn_saturate+0xf4/0x148
lr : refcount_warn_saturate+0xf4/0x148
sp : ffff8000829abaf0

Call trace:
 refcount_warn_saturate+0xf4/0x148
 del_mtd_device+0x118/0x140
 __del_mtd_partitions+0x94/0xf8
 del_mtd_partitions+0x50/0x80
 mtd_device_unregister+0x50/0x90
 spi_nor_remove+0x2c/0x48
 spi_mem_remove+0x28/0x40
 spi_remove+0x38/0x60
 device_remove+0x54/0x90
 device_release_driver_internal+0x1d4/0x238
 device_driver_detach+0x20/0x38
 unbind_store+0xbc/0xc8
 drv_attr_store+0x2c/0x48
 sysfs_kf_write+0x4c/0x68
 kernfs_fop_write_iter+0x138/0x1f0
 vfs_write+0x1b8/0x2e0
 ksys_write+0x7c/0x120
 __arm64_sys_write+0x24/0x38
 invoke_syscall+0x5c/0x138
 el0_svc_common.constprop.0+0x48/0xf0
 do_el0_svc+0x24/0x38
do_el0_svc+0x24/0x38
 el0_svc+0x38/0x108
 el0t_64_sync_handler+0x120/0x130
 el0t_64_sync+0x190/0x198
```

## Analysis
This appears to be a race condition? :
1. The unbind operation triggers MTD partition deletion via del_mtd_device()
2. Simultaneously, another process reading /proc/mtd holds references to the MTD device
3. The reference count goes negative, indicating the device was freed while still being accessed

## Additional Information
- The issue is reproducible with the above test case

Please let me know if you need any additional information or testing.

Best regards,
Guocai He
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
