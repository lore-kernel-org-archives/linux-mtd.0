Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E42AC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jul 2022 07:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iBJW4BBGWSV8IkwgI0r1fToAO562C+wIHbLVnE3aJMM=; b=TPmQ+ijf6jpCQZ
	7mCp6/ELI5o80uEPiZbMPK75jYt3cOYbZGUDgEKeVTRk0l5+aBYq9/i8PQox1sZsrz7Rc253rJjYt
	Lfg0sHVDnmWuxr6dBgRYlwng1e9HD6Cwj5x+U/HR/TfKqvnH25SQk9A05whe4I5B+70SJSwAO/II6
	tJGYhJjCoC5+Pigi9zqErRO0jdwZxQ+oh8YEPI2fJgOIcERdI9RF8MJU9V/Qk7jgPmxFPIdUjMoTp
	SUEHhfI/VhBAE8fmOWXI6oBSEXuN2Kt0Ik0/sMPl9CcVP8uv4ZpI11080i9QmF22Lrg8Zc3RZCr3q
	bxmxqXTR4KwGPVVnfYNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEnLj-000jFm-NJ; Fri, 22 Jul 2022 07:45:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEnLg-000jET-On
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2022 07:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658475925; x=1690011925;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Tra83U/Z/uXuF1zo+Kq6wuCti6FnHbrV72o/fDdWE+Q=;
  b=thAyE27iFDY6L94pNlg0eKX/fNLtbPbuONSTxy38y1DYuLP2V1LGeBgt
   2SR/ZQNp75GmO2Yigl/dm4TPbBSh3H5hGnhuGXpz6NjNK5pIdsfMh40LC
   61NWdOKpICnZW9QqERVVeiXtG35FPDCHZUUBZIjAXUjro/Qx3UufIAOcg
   evlZXtLUAHmBnaHd2BhSqV1yxB9mN8Q6QnjoJeC2jZcF3xok/qNrdk4G0
   c18pbXQ5hdZMcyvgsyLO7m2UTcUiuk53JFiU4VPKYo5/qXvHfBS9h5r1p
   Kp0yRXZTMMBYgxgs/GH8W2bf4BNwvpOFVjO8vf2v3rDJ6ghH5ze8KMx8z
   w==;
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; 
   d="scan'208";a="165927780"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Jul 2022 00:45:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 22 Jul 2022 00:45:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 22 Jul 2022 00:45:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJuQxfOaxJyAQRS6HczwsIJ7iAoKBR4BXY8/zBtNW7jxP7NWOOtCjLdHrb64/YxtS+NaOFGGzJBFRJAHQyuuDE+IG1Oh9n64juxSMd9ljCpOsHoeCe+yNGQ+5SNO+uMQ+4h4tQtmbT+E8Weqn2V5LpAOrrGseb9UqwMDd+oGytSqUTzEDPdRELjY0Ha4T10tqIrYmXTk/QjuMw4Hh0miJkk9lOViI0luIVX/s0PpBDNl4JnGpRmF+LDDHn5WP8v8y4ZK/OLSyQBMkq83viGWQIEl7CfMr00FdfkbB8V9Ux0+03n2IRdzqBVL9B5UAc4IajVE5mAay2/X9rQxlvBc5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tra83U/Z/uXuF1zo+Kq6wuCti6FnHbrV72o/fDdWE+Q=;
 b=L/tZOzcVbz3thmk1E50XJMJ9AE61mIkkVqnFkJ3MvCxuRsJWRnI/KBiYFjZ4mlsHkqZNGjb+Vd/qpRX2EqoYEsI6er+pKgYcCtxEeKrD3pP4ngblx7+f+CwZTfPBPb4jkF0N9Q+f2dfC2lWMeUXqBhkx0vmurxuSB1g1Z3QOWWIKBCX53pAv4UV9HNo6Qosm64COkv+w08X+C9+cL1VK6ht5/5i5GJhgvAsBhtwtFZ7EmSggK3dkohgf05gi6MV5YOk5DqaSagFYVLMGwd5xFoTIA64MoS7AMFjUUHTPvEuR2vgutC/EERNGubrJgw535sxpPM+sf1xZsZ0OD+0uIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tra83U/Z/uXuF1zo+Kq6wuCti6FnHbrV72o/fDdWE+Q=;
 b=VkQm6Ld+sDT8ecQ1whXwPJPVEEcRtTapy+jWLh+T/n5cqg3YC9hKkudCYaCG9DV7Gd9ZKHbDR6pjKOyNsGXRCwFu+M3eelB3SuJD+d46aUIuZD3kkBkPL4H8Ba+E30DTcLSJ+MBLbcASkrcHNgUVdolATJdSnCq2BLAnZBPfWLo=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 CH0PR11MB5219.namprd11.prod.outlook.com (2603:10b6:610:e2::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.18; Fri, 22 Jul 2022 07:45:21 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4%6]) with mapi id 15.20.5458.019; Fri, 22 Jul 2022
 07:45:21 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <p.yadav@ti.com>,
	<Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Thread-Topic: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Thread-Index: AQHYnRvdTEt+bD16DUaYd/6imLQaP62KAe4AgAAB14A=
Date: Fri, 22 Jul 2022 07:45:21 +0000
Message-ID: <70ff017e-cff3-0dc2-6624-5dcc27fc67de@microchip.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <dac51af409be97ab316a9de5c0297359df7d2e2d.1652063152.git.Takahiro.Kuwano@infineon.com>
 <99cf396f9210279e28dc1656a652efb4@walle.cc>
 <93de6975-c734-06d4-7865-bbe7f90cba4a@gmail.com>
 <0eea594f72858ec0ee099d45da71bc96@walle.cc>
 <57fd05cd-e0a7-b41a-53f0-c419ddc53a1a@gmail.com>
 <4d8146ceecf1f8a89c6a43fa1ac8d81e@walle.cc>
 <c42d5930-73cd-6dbe-f650-db72f35188a5@microchip.com>
 <a035a1a3-0d82-48ab-5d09-1d5164999890@gmail.com>
 <98fa98f2-055c-2338-6790-de99670e20ff@microchip.com>
 <2912f41b-5966-b08d-0b52-97eba3a809bc@gmail.com>
 <774d237f-e5cb-f46f-91ee-ae3a55dcc969@microchip.com>
 <36924e69-318a-8955-bbc8-86356c53bc42@gmail.com>
 <7a9a6f4d-37f2-68b4-2770-bff0c09de742@microchip.com>
 <070bfe6a-00e8-1c59-c9db-52d249dfbcfe@microchip.com>
In-Reply-To: <070bfe6a-00e8-1c59-c9db-52d249dfbcfe@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00251496-dc93-43b5-e9ae-08da6bb62180
x-ms-traffictypediagnostic: CH0PR11MB5219:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DAKsEb8wfhPXAHBuT/DdiVYkkoraHY9Vlvy27rvbifZa73f/wF3XQzPb/eqiwzw8UVuWrTLXG4aIO6TYGfJFZfvrsGl8e5IdAs61ZHF2cQK+itucrcX9V6ptezKV9CvAq85t9gtuwtOpapxbNXD/qdn921amyPwXwJcjT0kkoNXG3z+K36oIyEeq7GKSKMqrByyZnW0mDXfo27brmFOf+4ZIdqggjwMBnoGW9Uy3k3ShtDN3k5B5hr02mYYWoq1IF7UOTL5ys815xrlxzc8G0ZwSAoOwM9kYEL3LSqXZ399vfv/ldupCY0/6BuRGVUciia7SDBNXez71tE0YeJqYpOnSVCc3KYyFgv3cMqLjXkKrOHL5paTMdoViiuaAJ+C0ypYdGZIeK8mNaEiw+l+p+Q9+0h7QpJaKcy/d4Pxjj8GmNmpMl/i0DExHMMQdsRPA0C3ZV2O+8EXq1vZ/c6r0WUIilAm2ty0ashTVu4J9YerBRA5WjTjJbgQP56cJ4/o1S7mhvmtiZASZ4jbHX5RDGdbOiwSmkiH+u1MO3AGu1ppuVZU4z48N6DN/+V7fnz2p1NT73POYg/n7POkdAC4N5I8focgYWH94Eq2ggFzor2GRrOTdBElBW8NBKf/QxOyEzDv/a/2nKplopY96jyIUYXQ0bcCcvPULUlyrxiEXhcdTP6wOj0FvGgBgX2qJ/SkumpPQ5aR5ClzmjqWl/pSONQw/Py5bM3BmOqwCKcGz2QC7lRx8CLfyskNEuf5NFTna2pKhy44FXicU2tihM6y851WslINro6DPjvHLjkIgJCrenfMrpbOvcD6p4Ndm6p7+YF/ZVhQxsIhpU8Pv9ewQqH/6GWxGF2qyGRV5xxKTTezTDfSzUCSS1NCqfQPlkpQN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(136003)(396003)(366004)(346002)(2616005)(316002)(110136005)(122000001)(186003)(31686004)(91956017)(6512007)(6506007)(66476007)(66446008)(66556008)(54906003)(66946007)(53546011)(83380400001)(64756008)(4326008)(26005)(5660300002)(478600001)(36756003)(71200400001)(86362001)(38070700005)(41300700001)(76116006)(2906002)(31696002)(8676002)(38100700002)(8936002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?REJIeWcwUjVJb2lJNlBLY2RZbkZwazBBMUwxdFdERzVITmwwTnFDKzloUkE5?=
 =?utf-8?B?aWxac1VhUSs0WGJHb2p5Y3JORkZzUTNlNFVmN2hRODJtMzdqdTJldk1OTytH?=
 =?utf-8?B?U093bzJVQ2hMMGFUZUdOT2k1aUxXRjM1dkZ6SUR0QUtSYzdtbVJlRktXRU5a?=
 =?utf-8?B?WDcxMFFNYU10QnM4TWJjQUpuNktJaHFMRjVLSTliT3R0a1RGV01hbGRRZ05Z?=
 =?utf-8?B?OVBReDEwL0lDRDFXcmJUN0Jlbnh3RzVpK2E0eGtMRG8xcTVwa1NsY1hrUXdw?=
 =?utf-8?B?NG14aU14ckZjZTdLbGduWHBqZmQ0MUJib0tJTnRNcTBWM1lSR09WQkdaQnEz?=
 =?utf-8?B?WlJwb2prU3JPWVh2QUt5MGRKc09rQ0FjZ3lRdlBRZnovUG8zUEpUOU1LemJZ?=
 =?utf-8?B?QWg3N3pTbHVrdzBPWmdQazR2aFhDMHZCYmpIZytFaFh2WU9Wcjk3dEFySlhJ?=
 =?utf-8?B?RHpxeEkrV1BaVHNUYXBCT3ZsV00wMk5BeGNyN3FuOVVleWNiSVpRQlE0R2gr?=
 =?utf-8?B?YWJvaWlzZ0Y0Q3ZTbC9mY1dxcTVvbFAvMUx4MXJYbU5la010c1F3L0o2Vld5?=
 =?utf-8?B?aFQyTXNWbWhaZ1JvV2dkWVY5NXVEcEVtcXl0b1hkTGlscitQSzZ0b0EzRy9B?=
 =?utf-8?B?aVVKUncraEMwa3JBTjRsc3lHUERidm1VTHJEUE83bCtPbzc4dk14cjdFNU9C?=
 =?utf-8?B?dTNmaTNEM0VKMmZ2NkZ2UlFiNWgwdlptQ2k2NkNmSW9Yd0l3V1lvb3BFcTg0?=
 =?utf-8?B?cTcwM0ZMYTlXNUdoUkF0WWJrclpKTU1yMFR1bEtFZXkwdGNvSTUvNE5RbU5Q?=
 =?utf-8?B?bVNJVjBCa2p2WmFnakt0a2phRjRpSTRtUjF5TW8rUlFMbFQ5Si9YYnNWL3hZ?=
 =?utf-8?B?VHc0UHVLOXJlUEo1cGZONmpKZ2ZpTWRrVThmQ0VmQkxwMlBQZTUxZURzQVdD?=
 =?utf-8?B?TnA0RjlPNVFuMjRYTDZlemdtVVJsb1dQcGhvdGw5eThFVmswVlBOQ2dpeVNX?=
 =?utf-8?B?L1RscWN3aEp3SzRqZkJoVmJhTlVDcVU3cmdZd3JzM3RMZnViL2RUaFZOWEVa?=
 =?utf-8?B?OTl4NWVkcVlOc3lTVFdnZmZkYWpCRVNjTzdtaEJObFZPMzRERFBFQ2VOTGRD?=
 =?utf-8?B?Si9iY0poSVlWQU5RSzRDbnRkZ1VmWW0xUnVaRTV1QW1XREkxa2NRQ0svOHQv?=
 =?utf-8?B?SkhXUmJ3dTN6NmQ2WGE2SktaYjRQVTErWk9EUVEzWWJDRHJQc3JhY1k2eVRB?=
 =?utf-8?B?MWZ5YlZ1WDhkZHV1V2I4dWFjbDdKT3NGb1FnS0tDa1loalpreFdSUEtZMVdl?=
 =?utf-8?B?WHVudmNKdUhGbHJ6Yk9kQjJUdnc4dGpjZmJMZVo1cGEzSWhWR3FsUlU4L2pU?=
 =?utf-8?B?Qk93N2pXY1ZScFdMS0p3TzhEQ2tHOXB4ZHlPSWtreVd6d2JqSmtpb2d0aVl4?=
 =?utf-8?B?cXUzZi9GOEdFbDlodGNDbmF5NnZyNkNqVHFaWjFCVXRvYjF2YjJJd1UySUw4?=
 =?utf-8?B?ZE54UnQ0MzNHVFlvQnBHYWFqTXp3YzVrSHc0S2xVUW5qQ21sQUZRanNBdk9o?=
 =?utf-8?B?TkRoODBOSm1QbnNpZFVOZWhjSG1lMUtwT2hKaHBhUHhEaUU3d09vWWllYUo5?=
 =?utf-8?B?UytDbnN1VzVLZFEyU1YzOUhtWUZ0a1hjaHcvN09Ub0ZOZHoyOVBybWRMcDVY?=
 =?utf-8?B?QUVmTmduZXpUdHAzVEp2VnAzRXZsazhjYm1WSk9iam04MWRoTHRicGU0cnpM?=
 =?utf-8?B?Z0NENDFqRHVPRG91TkQ5QmpIUE1qVmVDTDc1Snk2S2kvNVB6UGJ2eThUaTNE?=
 =?utf-8?B?MFlUQytsbk9YYUhxMW5wam93N3YzaEFGSmRvb2l0MVl1RXkxbUVSajBOQW5D?=
 =?utf-8?B?R2RoNzlrYUNTNUpLaE9JaWRCaVVIUyt6eVo0eDU5aU4yTEpLRUxoVjZsbmUy?=
 =?utf-8?B?TEJwcG5xaDdKVWNUamdUZ0VaOUdDZWFWa3FOaHFUQVpVTm94N1YzZFNEQ2Zn?=
 =?utf-8?B?dkw3MnJwT3N5U1Bham53ZG9QREJxaWhUK2dIQ1pIcEhXZmVHL3JQdDBZVk91?=
 =?utf-8?B?eXZkYTYzQWlkUG51dFllQWY0UzVEQmVhUTRUN3ZPd0dMVjJRdGtrNVFSNjlC?=
 =?utf-8?B?dlBTODZ1RWp1L0pmTEZRalpOanRwbVhTTkY1UTB1bnBzUHphcWVNcFpJRHhH?=
 =?utf-8?B?NHc9PQ==?=
Content-ID: <CAEFD230600A484A9A83EACC43F5C8FF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00251496-dc93-43b5-e9ae-08da6bb62180
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2022 07:45:21.6037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ZjlsvwEoSRKpzB3n3AhvmJRJeZa5yEIFnNXq0vqh4edkKanRt8Ei25Jl2sNO/CCbMteUbaG6oIeVlr1KsauiuEYMgbvMsAgDFCi6OTRCsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_004524_968518_D45358F3 
X-CRM114-Status: GOOD (  16.26  )
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

On 7/22/22 10:38, Tudor Ambarus - M18064 wrote:
> On 7/22/22 09:08, Tudor.Ambarus@microchip.com wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 7/22/22 08:11, Takahiro Kuwano wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 7/22/2022 2:06 PM, Tudor.Ambarus@microchip.com wrote:
>>>> On 7/22/22 07:46, Takahiro Kuwano wrote:
>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>
>>>>> On 7/22/2022 1:20 PM, Tudor.Ambarus@microchip.com wrote:
>>>>>> On 7/22/22 07:00, Takahiro Kuwano wrote:
>>>>>>
>>>>>> Good morning, Takahiro!
>>>>>>
>>>>> Good morning, Tudor!
>>>>>
>>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>>
>>>>>>> On 7/22/2022 1:06 AM, Tudor.Ambarus@microchip.com wrote:
>>>>>>>> On 5/23/22 10:49, Michael Walle wrote:
>>>>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>>>>
>>>>>>>>> Am 2022-05-14 05:51, schrieb Takahiro Kuwano:
>>>>>>>>>> On 5/13/2022 6:40 PM, Michael Walle wrote:
>>>>>>>>>>> [btw the subject still has the old name of the addr_width]
>>>>>>>>>>>
>>>>>>>>>> Yes, it must be fixed in next rev.
>>>>>>>>>>
>>>>>>>>>>> Am 2022-05-13 03:26, schrieb Takahiro Kuwano:
>>>>>>>>>>>> On 5/13/2022 7:14 AM, Michael Walle wrote:
>>>>>>>>>>>>> Am 2022-05-10 00:10, schrieb tkuw584924@gmail.com:
>>>>>>>>>>>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> In 4BAIT parse, keep nor->params->addr_width because it may be used
>>>>>>>>>>>>>> as
>>>>>>>>>>>>>> current address mode in SMPT parse later on.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Mh I'm not sure this is needed at all.
>>>>>>>>>>>>>
>>>>>>>>>>>>> SFDP spec says
>>>>>>>>>>>>>   Variable address length (the current setting of the address
>>>>>>>>>>>>>   length mode defines the address length)
>>>>>>>>>>>>>
>>>>>>>>>>>>> and
>>>>>>>>>>>>>   When the length is defined as variable, the software or hardware
>>>>>>>>>>>>>   controlling the memory is aware of the address length mode last
>>>>>>>>>>>>>   set in the memory device and this same length of address.
>>>>>>>>>>>>>
>>>>>>>>>>>>> We don't set any address mode until all the SFDP parsing is
>>>>>>>>>>>>> over. Therefore we should always be in 3 byte mode, no?
>>>>>>>>>>>>>
>>>>>>>>>>>> Actually there are some devices that have variable address length but
>>>>>>>>>>>> 4 byte mode by default (I will work on those devices after this
>>>>>>>>>>>> series
>>>>>>>>>>>> is settled). To support such case, I prefer to use
>>>>>>>>>>>> params->addr_nbytes
>>>>>>>>>>>> as current address mode so that I can fix it in post_bfpt_fixup()
>>>>>>>>>>>> hook.
>>>>>>>>>>>
>>>>>>>>>>> Are there public datasheets available? So these devices have a 3 byte
>>>>>>>>>> I will send datasheets to you in another email. At this point, only
>>>>>>>>>> summary datasheet is available in website.
>>>>>>>>>>
>>>>>>>>>>> and a 4 byte mode, but after reset, they are in the 4 byte mode? Looks
>>>>>>>>>> Yes.
>>>>>>>>>>
>>>>>>>>>>> like it should be fixed in a different way. I'm not sure the "current
>>>>>>>>>>> mode" handling is correct.
>>>>>>>>>>>
>>>>>>>>>> Yes, we may want to introduce a new flag like SPI_NOR_4BAM_DEFAULT and
>>>>>>>>>> check
>>>>>>>>>> the flag in BFPT parse. Once I send another series, please review.
>>>>>>>>>>
>>>>>>>>>>> We need to differentiate between the mode the flash currently is using
>>>>>>>>>>> (nor->addr_nbytes) and the mode parsed by SFDP (params->addr_nbytes).
>>>>>>>>>>>
>>>>>>>>>> The flash's address mode affects the address length of Non-4B opcodes,
>>>>>>>>>> including read/write any register ops used in SMPT parse and Infineon
>>>>>>>>>> (spansion) specific hooks.
>>>>>>>>>>
>>>>>>>>>> The 4B opcodes always take address length of 4 regardless of flash's
>>>>>>>>>> address mode. In these Infineon chips, 4B opcodes for read/program/
>>>>>>>>>> erase are available and 4BAIT advertises them. We don't have to enter
>>>>>>>>>> 4 byte address mode for read/program/erase.
>>>>>>>>>
>>>>>>>>> btw. this is a pity. you are using the stateless 4b opcodes but
>>>>>>>>> then you don't provide stateless opcodes for the read any register
>>>>>>>>> op :/
>>>>>>>>>
>>>>>>>>>> So, I think we need to differentiate between address length for
>>>>>>>>>> read/program/erase and flash's default address mode.
>>>>>>>>>
>>>>>>>>> Or we keep them in sync. E.g. switch to 4bytes mode if we are
>>>>>>>>> using the 4 byte. Granted, that sounds like a hack :)
>>>>>>>>>
>>>>>>>>>> Obviously we are using nor->addr_nbytes as address length for read/
>>>>>>>>>> program/erase and should keep this usage.
>>>>>>>>>
>>>>>>>>> Yes, I wasn't aware that we actually two different runtime
>>>>>>>>> parameters:
>>>>>>>>>  - the read/program/erase address width, also used with the
>>>>>>>>>    4b opcodes
>>>>>>>>>  - internal mode 3b/4b. Up until now, this wasn't an issue
>>>>>>>>>    because either the mode was switched or the 4b opcodes
>>>>>>>>>    were used. So this was mutually exclusive. Now we have
>>>>>>>>>    flashes which uses 4b opcodes _and_ we need the state
>>>>>>>>>    of the internal mode.
>>>>>>>>>
>>>>>>>>> I can't think of a good solution for now. Need to think
>>>>>>>>> more about this, but I'm pretty busy at the moment.
>>>>>>>>> What I think is clear is that we need two different modes
>>>>>>>>> here in the spi_nor struct. nor->addr_nbytes for the
>>>>>>>>> read/program/erase opcodes and nor->address_mode or similar
>>>>>>>>> which tracks the SPI flash's internal address mode.
>>>>>>>>
>>>>>>>> Hi, Takahiro,
>>>>>>>>
>>>>>>>> Can we determine the flash's internal address mode by querying
>>>>>>>> the flash at run-time? Is this possible on Semper flashes?
>>>>>>>>
>>>>>>> CFR2V[7] has current address mode, but to read that, we need to
>>>>>>> issue Read Any Register which address length relies on current
>>>>>>> address mode. Chicken-and-egg...
>>>>>>>
>>>>>>
>>>>>> I see. What happens if we issue the Read Any Register command with
>>>>>> the wrong address internal mode? Will I read just 0xff?
>>>>>> For example try reading CFR2V[7] using addr_nbytes of value 3, and
>>>>>> if it fails, to read it again but this time using addr_nbytes of
>>>>>> value 4.
>>>>>>
>>>>> It's undetermined. In case we issue Read Any Register with 3B address,
>>>>> the host controller outputs 4 bytes (opcode + address) then inputs
>>>>> 1 byte. If the device is in 4B address mode at this time, the host
>>>>> controller inputs the 1 byte while device is still waits for LSB of
>>>>> address so IO is not driven by device.
>>>>>
>>>>
>>>> So if the IO lines are floating, we'll "read" whatever is indicated
>>>> by the IOs at that specific moment of time, right?
>>>>
>>> Yes, right.
>>>
>>>> If so, we're forced to statically specify the default internal address
>>>> mode.
>>>>
>>> Yes.
>> OK, let me scratch something.
>>
> 
> Would you please send me the datasheet for Semper flashes?
> I noticed that the addr mode is controlled via a volatile conf register
> in your case, but there are flashes like w25q256jv that control the
> addr mode via a non-volatile register, so only a default value will
> not empower flashes with NV register conf to actually toggle that bit.
> We may introduce a dt prop for the NV case when needed, the disadvantage
> being that the generic jedec,spi-nor will not be so generic, as it will
> have a fixed default NV addr mode specified in dt.
> 

Oh, but winbond uses a dedicated RDSR3 opcode and doesn't need addr_nbytes,
so it's safe. It looks like we can use an addr_mode_nbytes after all.

-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
