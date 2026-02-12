Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7E7EE3695
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Feb 2026 15:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DzkdaWaFGNc4X/ymIDWsrV+c3QAdzpYWijVpoCXHthk=; b=L4Q8RqMKzD4+hg
	wHe28PPDJVcPfofT4nVGHT9xkLg+Cts0/Ctc5k72zgeZmApRvf+5NdtE+Dl1oPp/I/0yE8EZUD+tA
	VQnvZPBJGSNL6LpcCZUBbj3xZZvxa3RQOjQ0NiFMH5t8POfsoGm33TaD8KDAK/J2ObbBbESxg8/cy
	AkiR5rI0/25xbge2UIS/9LTPF2jqDJbV2lveljLEMGDW8n/UbvnMM0R1Ge7koOgqyevPOfyvdCcym
	lCqMAKQRZZmRB6GqShjL/M4cPZ7LFb4qUuJblDLLjDpsiz/mIF/An5E80SgB3B216RNQ+jwcN0M6d
	kZCtN9c0VRKWoN/IqRXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqYr6-00000002Hta-3wBR;
	Thu, 12 Feb 2026 15:43:48 +0000
Received: from mail-swedencentralazon11013032.outbound.protection.outlook.com ([52.101.83.32] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqYr4-00000002HtE-1Hj5
	for linux-mtd@lists.infradead.org;
	Thu, 12 Feb 2026 15:43:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fd/NlUsv7zHdt0S8xfIzjnQEyr+cp0G3rwQ8NGd9CJDveIMM3XUDJSE132krlZzNMa00Ze94e2ClLXbBOMLVz1ieUU4bXbJr4nJ/fj/Chi5Db14LTt2d1dSPAZHxj2ucouIVqxOXBVFcvZ/qAhbT/e0FjGQULMW1jMWEfQ1PFN8dtF9P7LcI855sw8bztxC8sCYk/XdH1jtLUFpvEE6aHJNSTjsJo5k/O5DU8Onos6zGq4+CcgM7yqcgwFGsPYOSKLmq3ig4p59RWNPx0QSTbTw2+TWWHBq6e2vxVmN5v5MOChNi25Fv9UfPKaC0U1z16RUEcC/wfsJ4CGiMUupkcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7uc0A6M1SuN63PAjhSXWDT+SKJFJtcqYwnCyZPXEfZs=;
 b=X5KnRXTGhFOMcTufmTy2jyMl/mnKbl71OJoAwDG6b9XfCkaGjWkHCs+WxH5pPeYd/iei+xuH/YYskZhNsC1ErFBP/Th3SX8i2jkTGNMEuC5bCzmLFvWcsyN7QF4Rdjbm5UfVgw6/nWWTmB+s0qQ4aPL4FhciTbofPWWGwaIYYlBXbQ0lsUufjcdu/nR/ZvnfDWQsxDQjVPou/WP31K1UinSBm+mNloGrTZIKDsckfWxvnRdRffuwmMxtb4Y331blDABtJQiY6Y2IE1T7qgE6gw7wBBq5B/WDexZM0Bsnw5I0+lZchUAOGXB2NDXmS5pBafad/Lq/3eBXPApDXUms9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7uc0A6M1SuN63PAjhSXWDT+SKJFJtcqYwnCyZPXEfZs=;
 b=H4fyaxh8G0A6atccGC7gc+Nnj5G6dqzB1wosoBa1/bIS81V9kWREqnIHMnojfeShYkrh5Vu6UMUDglWKQ3rA6cdCE+Y4FULS0ynu4bSDjuR24ZsddNGgyZRJfXxd2VX2fEf3sR+sZGnQ8gaoyN4mQ/wz7NWssV/A6L4SaxfJjU3qx+AkgyeEB6jJBAW7ALy1gADdmAVJLcVb8On8fvnzmk9NRiFYvo9PG7iNKSfsyS/LkcxVUMtCkr9fzfaqBU4YpHL2t7wn7d3rCW0XN0SSL3zQVU+CJuRen3mhT5g3IvrAzllodv2vQVgGLPZLWt4ba47ls5do8Hz7w2GxfzzOMA==
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com (2603:10a6:10:291::22)
 by VE1PR06MB7005.eurprd06.prod.outlook.com (2603:10a6:800:1a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 15:43:41 +0000
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::f0f5:da:c159:65ab]) by DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::f0f5:da:c159:65ab%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 15:43:41 +0000
From: Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: Re: [BUG] UBIFS corruption on powerpc 32-bit targets
Thread-Topic: [BUG] UBIFS corruption on powerpc 32-bit targets
Thread-Index: AdyRCkfQa4Zi0XkcSIOaDwEHvEKqQgAfkK0AANfexzAAKpBxgAASt8aTABoBiQAAHEXIlAAWQcWAAB0NmY8AFokAgAB/U8m+ABbb5YAAHUm/jwAeEzQAAAAbHwAAFGe7lAAR8ZqAAB3ltgg=
Date: Thu, 12 Feb 2026 15:43:41 +0000
Message-ID: <DB9PR06MB7849BA3437461A502A4C115BC260A@DB9PR06MB7849.eurprd06.prod.outlook.com>
References: <DB9PR06MB784979B96C388174F81F9103C29EA@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <b93ff0e5-79ad-ff73-bdb3-e7e7d5c35256@huawei.com>
 <DB9PR06MB78498340513D9788FC7576FDC298A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <d0eb0572-e383-466e-7b4f-97e4a853b7c5@huawei.com>
 <DB9PR06MB7849BCA2FA49A7AEE3D03104C299A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <2e8dee20-842e-e946-87a0-9ff0190600ab@huawei.com>
 <DB9PR06MB7849E51C72D54F8109C55714C266A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <581cbf94-a48b-3670-27bf-3ecca07ddcb8@huawei.com>
 <DB9PR06MB78496EADCD11536AA66C22CFC265A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <8f65d531-b752-b058-4163-09a66fd9a7a1@huawei.com>
 <DB9PR06MB78496CB06BF8E60582CF40F7C262A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <abfe8c37-11ea-a76d-5aea-014b39fcdf2e@huawei.com>
 <d5c8fe2d-2b78-3459-d176-da15ae24d1ab@huawei.com>
 <DB9PR06MB7849403569974A214C101D77C263A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <01bac338-856c-599d-85d5-ed6485707310@huawei.com>
In-Reply-To: <01bac338-856c-599d-85d5-ed6485707310@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR06MB7849:EE_|VE1PR06MB7005:EE_
x-ms-office365-filtering-correlation-id: 42ff6253-6c49-44e3-8d97-08de6a4d7f24
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?hwKuweICgPQXS4xC+ZpCY85sYiPBHkkhSM5RTud5qAE5Jym2qkNO4RuOTR?=
 =?iso-8859-1?Q?9zCj4flwNPkWG6lVzor5xrMeU/I3e4rrleUDKT88VqXyKzA7Qq3lmBrfNX?=
 =?iso-8859-1?Q?SMpqxEYXJTT80cWvXyE9IXdu+cMMuCmrsP36dQ0Yme4ew5SKpzeKxZGO1O?=
 =?iso-8859-1?Q?yqRkRcHBP63IuV0onIpL4HGeTMFohXOlJogycLW2DF/7WX/sZfQgzyo4HJ?=
 =?iso-8859-1?Q?ipzp1GlUUdJl3JXFHOEPJK4vg5y+8LRl1I0YDTDlj2Vl31bZbE9w5GSJoT?=
 =?iso-8859-1?Q?FTCui8IHWKtS//oRvDE2d77+gPhCJW62H/98adWmm0I82CisPONfn4A/Qg?=
 =?iso-8859-1?Q?1KLc3Dvrz24aAHs5yLYFFvbuB8aI3StMLiDR53CeiIqu0RppOKVGyGn5sh?=
 =?iso-8859-1?Q?vy4bPP297uVuTGhblc5ZZ51MGF/WGuzUvjC2S6RjIEEQ4paJb2UGaswCLK?=
 =?iso-8859-1?Q?f3FPdjxeE/+PfVfN08nM1R8/ds6R6oKX/vlPfbXXG6AslS6zpbOM77yCBC?=
 =?iso-8859-1?Q?/NHequp9pk5ilTUknDDLx1vTrQnkl+xfH1dbEK33xSdA4mZQ+U6rkHeDJ3?=
 =?iso-8859-1?Q?rx+I7iaZx3avrNWGsCAFZwSD3W4Qm8Om5v0Tqei3ROqGKBc10J9R+Nac9r?=
 =?iso-8859-1?Q?FLqfBd5LBfH5q4eBTacaPxskV6btjROgk6RX85WSbQ14ZxddJP3yJe1id1?=
 =?iso-8859-1?Q?1Celu8pbU8WSlmccUlFs5KzVLX55kHjhbnF8CLAqmf382mL6ibUL4O/mUr?=
 =?iso-8859-1?Q?bTPiWnN6MHjGErbx1Ge9kL1eKD6OBVYBCdcnwpHxDJQu1g37Al6L8gqZxG?=
 =?iso-8859-1?Q?vMloCzYVjktKe9GOUtAvfLTyQWigT8TxPZpQHAKH4cJqbrFoBaQuj/d4Uv?=
 =?iso-8859-1?Q?oKv8p6TJy9C+CHY6Vwzofxalh+U6WJTtCiVo4/U+4rLy9EJAr1Bu5LFJ92?=
 =?iso-8859-1?Q?VPeCak9Qv7FKXPZn8HmA1zGu0cBVObac22RafSSrUixVrgy+53Xm1WO7s1?=
 =?iso-8859-1?Q?mLp3I/t5LUgv9RV1sToYscf9GIeQ8Cand+OU/0BWe/aQClkpoYnotbq+E4?=
 =?iso-8859-1?Q?hkjBF3XFDXJA0dV9O/EsAb99uWVGLAlcfdDoqWiyDLM0xNlYkIHp6i9Ed0?=
 =?iso-8859-1?Q?OmPEBe/wkftAAL38FdtDHhbOq/ceTZSRcHnK0xlBhqQ4MYsOAFDF4kFrsU?=
 =?iso-8859-1?Q?l+GujAsdP0MBEUVPzGPELi/vOmurUQBeBOXy18mH5wXC1tCq785kaCdofA?=
 =?iso-8859-1?Q?tqA0uuVDTbbz3v/KElbrzNe/rXrxt4zzPpSiogwSxqka43e1o3SZuDfZ+R?=
 =?iso-8859-1?Q?UOUC/n41deI5SJkHG1S+8JIdyc7hifcOzYYsk3I7uzvyXpijgdExjhUJ9l?=
 =?iso-8859-1?Q?0i47VKeeXIZ53nDlXGIjztWfStO4rMKFYw07umZzWK3qD+YiKxw5hQ/RPW?=
 =?iso-8859-1?Q?eR4Ng75PEcemqF+SnWDIE4tZCOtz9nEzhqYdgN8WhFjfdqTL4paYAyJDCN?=
 =?iso-8859-1?Q?RPFSfvMyAQCYg3HeuD3NlWtyDVNywAn+N4NNqt7togZUQc8LUscaMzcAgt?=
 =?iso-8859-1?Q?hr2Cn1qCU7hC396/3KuUB8/LlV4sLJseMwsX9e5cZzEcOhKyfDW1LwTVkH?=
 =?iso-8859-1?Q?LFSapeNQTXgU41uiVp7+NioZreR19vGsU7JjzOE0gaXeP9P6RCn+6FUK+g?=
 =?iso-8859-1?Q?3EafU5E9UsQTE1h+tzg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB7849.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3WQ41VoVR7aopgsWmO7at/qVgmb1aWPED470Dodaz0tL6/PU+GVeTs7qkZ?=
 =?iso-8859-1?Q?b95WQZMpB4glWiv1nd/WFxYhnpmQjLq/zx35FbxQTjkTxzaTM6biARK3cf?=
 =?iso-8859-1?Q?19tHgf3trveL5k69sxT6WsnbXW1i547ftrPpLvzezmMUc6RX196NITe2XS?=
 =?iso-8859-1?Q?MZETlDcMkAIrIEUG1M5182b3SmNCeURObI7bfIocEwSXjuQcIA/unjkTZK?=
 =?iso-8859-1?Q?eEpuhUwwjuOvCrgthuyXl5XtPW1QTTbNeOwzSpzv6IdfHS32QnP/9bzwMk?=
 =?iso-8859-1?Q?fMhCRfBYybFfqOBhg4DafLh9RqX1CpEEKiNde4SGaXb1iyLgemJOW+vNa/?=
 =?iso-8859-1?Q?QiIScd2eideNaNcU0feBdJSQyckSO+JIMLukuNDLlxzKMz25NDJDRNSoy5?=
 =?iso-8859-1?Q?pqsiBA1d8/0XLal9ZP+O0GR3j4WFg8HRJyBpkVblWVJTOJR0z/iNt7JYn+?=
 =?iso-8859-1?Q?a+ZxQpuOTJhGHQGvb+nmdwulIHiRpsuHxW+k6VcndKxxnpdwfVe06RFmCR?=
 =?iso-8859-1?Q?0FZbSfNBUD8sD0GhxGPAed2POzbzK21an2eYaS3AipUNHUUWbjBkSO29rM?=
 =?iso-8859-1?Q?b0UGs9YY8xMJgkZT9xoSUqtPD9QXIqO46/vq/CIA5ddLfuDnU7oQNcV0FL?=
 =?iso-8859-1?Q?1oJkoO5NkEcBVcGmxzoxg4d1xJwOxYaA3nz0fIdU6+nl+AVmCEJJCBBVFb?=
 =?iso-8859-1?Q?o0ngaACqBCEM3RmWjIlbSQnxHUJkh7Iv30ZNJ0lrnqi0aizVE7dFoBS1ML?=
 =?iso-8859-1?Q?TqxCt//EA+qGElgqM5SOIP6NxG/hhzsOhwgJ6TzEEpIBzuROwNNArAfegy?=
 =?iso-8859-1?Q?eYMiir2Iy8qNgqBrdopS6pHYy9jo8fxsIILHvCRJx/PFbAbrX9VZYb2mwx?=
 =?iso-8859-1?Q?MaPXW83VdCiKNlN8J60FAPQV5Pq/K02R1R5pH1rAjd1lK/6hUq2N7sA1LK?=
 =?iso-8859-1?Q?QVDbE/5a0vSe0PjXFuagKAR5jAz0J7lv5JcPOoxfR1MT5Tv9kEySk3t36B?=
 =?iso-8859-1?Q?9OC6n2zZ1cmaJZBuh6DZztV9N4fjuhL59iWZkHeO9l1zkVIKlFmz+ayeXE?=
 =?iso-8859-1?Q?UufZmR/NspyK9QyTUxZHJZ204iUS5EiZK0Y5i6vgKo/8TqWUTqacN5/qHG?=
 =?iso-8859-1?Q?MW7n+ye6ugAv1EYdRRMI8J6WUrx4zRUl9ECM06P57N1FhgRn6y0oLWfv9y?=
 =?iso-8859-1?Q?cG+v0T3Nd0j16MShQeYMtWBnLX1caYUccoM7i+FIJ/iyXpbhV1imdgmMFg?=
 =?iso-8859-1?Q?HYUJK/5XqOr2lihu2CuKcM69G9sr8h0iuBpWlnAD8QoUYqItCuQ17Ji/Gt?=
 =?iso-8859-1?Q?W6NeQHlkKoQmWTdwu9JTgWn+FeRADDfAf8aAVgt3yFdPO61ZjIE/kRCAk8?=
 =?iso-8859-1?Q?SiPHGkiiK+F9MweMOWifomeddideZTQ9RfvodfN3dluhO3GqnIajtUPmtT?=
 =?iso-8859-1?Q?x3qk13lQFRkKNZj357qaJgEJ4751Ij+W7fhadwQXR+zSWjC1zcbHF2W6s1?=
 =?iso-8859-1?Q?c7XCo+ghLoXoAJa9jgRgvyzr33nZyAHVJjfCb8LThc546bDs5zxtT7XrDx?=
 =?iso-8859-1?Q?mR7vioSr51393qykaK+BoCL5TrDvzRmSzDEAc82Y4tCPjnsMOU9Wz4r1vC?=
 =?iso-8859-1?Q?wBMTDY5LgmLBspDovHRd2Txq62gZCoRKAPezd1EHI1coq5xq8wnVwRasDp?=
 =?iso-8859-1?Q?WaRN9nKxhiXuRpO6lsZJUYKX+tE88FRdyB6n2bHkywi86oyVs2yzrbrcH8?=
 =?iso-8859-1?Q?37KJc1UOHOl6oxkXiGRGfeHIBfByyPkkQgj8esYold1MUoAqosIfwQBjHf?=
 =?iso-8859-1?Q?kPGom4xUI55f6J/iVJK88BiZaYT/0yM01+KdT1xGpguyj/Nxj5xb?=
MIME-Version: 1.0
X-OriginatorOrg: hitachienergy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB7849.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ff6253-6c49-44e3-8d97-08de6a4d7f24
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2026 15:43:41.0961
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s/VVamj9hEkPq3iwqve3H3cjDDHHNqp2m2gCNH/pJSSw26nGqqcH/fnmtqSHYjEOYomFOupfpNfRMyLef9xff4YDtsavsWdZowErHRZYSLe2DEFk9PgcnL3zjOJNo+NV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB7005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_074346_360595_56FA67F5 
X-CRM114-Status: UNSURE (   7.94  )
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

>The 'sync' syscall will call ubifs_orphan_end_commit if the orhpan list
>is not empty.
>ubifs_sync_fs -> ubifs_run_commit -> do_commit -> ubifs_orphan_end_commit
>
>In ubifs_create, the new inode will be added into orphan list.
>ubifs_create -> ubifs_new_inode -> ubifs_add_orphan
>
>You can add some debug messages to check which condition is broken.

Alright, it was some user error :) I am able to reproduce it consistently now.

We will have to analyze what to do in the end about this, because we have no
control of what versions are being ran in what order in the field. Backwards
compatibility and being able to switch versions is important. Since this
volume does not use encryption and 3af2d3a8c56fe7dc24f60c4df0ab85b7ac941902
seems to be fixing a bug related only to encryption, we might just revert the
commit for the affected boards. Hopefully this will not generate other
unforseen consecuences.

I'll submit the fixes for mtd-utils tomorrow.

Thanks for all the help
Best Regards,
Tomas
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
