Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E28AC54E58
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 03:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=blYJISnlmzuEZWWCerMcGyhPx35tgRwaJ3PXnQNiqtk=; b=JVuUHCvtNqpAKq
	boUFJC1eNP6IPz6hQCcukupphGzJswprjJMrpMA62Zh0Q/zhYtgeG3MxZMMVV18gG/Qd85+Ui6kBn
	UEttaYlc0vCEJkqMXjRerU7ZfOu1gLKURsWu99ncYdRhwsVy46mFjqtDG68XiRVFUU7bn1urJHDT0
	yBYvxF068of813buJENcojmZRXmoLnQhzXzq9wXrmQY0TEMlzvUjWJ7Q9pTBYev4082EaVc9/lVke
	Di1zmywW8GU5u2KlhsxXa6uyXg8DNc+AQ4/T2RM6X55AeRzjzxG0x6N2Gxt64wi9jSeiIu4Rx114M
	E7a24Yf6PsnFHWWSO5YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1robSk-0000000F2vU-1d50;
	Mon, 25 Mar 2024 03:57:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1robSf-0000000F2pa-1C1f;
	Mon, 25 Mar 2024 03:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1711339045; x=1742875045;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ZUxkxCE/vBmMl6E37W8ndCiGnStgr/XqwJ6LzFblp6g=;
  b=V2side27PtF4nd5Nf5HvV6NYKvb9dpdTTUYAUsg7jnYO9MPXvxTdagQd
   qm0ytU5lyOsDvjD7DaAhfZ2v+AVg2y4Axt69RfByIbEaWbfwiqG17PBmj
   4wAeVbVjXUE7zxdzaf4XyXxnje8wh37EHrakOLi5fTgf9qjLycJB8ORGW
   MlsBU+j/v6oWZEJr1o9z6M3O6iYeBtySoIDKSKbg7KNLNCXn/Lkt45h5A
   DOUi3qcmtkTN8n/fOriiriwBQ6TH7xZRgt8gWA8DS4v+pXtCSRyJLYr7B
   u6IZHLeQBsj19e1eu8x44Wr3z7PPRfc0d7lilQMYRd92ZMd0CFL+5q/nh
   A==;
X-CSE-ConnectionGUID: /eYAHis0TmusLMYfzwOOwQ==
X-CSE-MsgGUID: SMUNbZFBQOeJVR5JD2OF1w==
X-IronPort-AV: E=Sophos;i="6.07,152,1708412400"; 
   d="scan'208";a="18634162"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Mar 2024 20:57:11 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 24 Mar 2024 20:56:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 24 Mar 2024 20:56:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTQ/rd+q5wET5bMnPl342DQ5EeZOC3gGTPoCBuG3P6YB6gecYozhqgqqmdy2BMVarUVe8qJ/Q0gM3YVl0zDAiImuYZhKbz9bnpDh9Fam15X8IL+IYUPVKBHkK3SMoEwpFPNz0x+lezvWGs9d8OrsZzV+jYptj+b10kaSC+9/v6WasogcC/mwcedHgPvaMTpDHwzZ4ofzR+649iNO/hrxes7F0z7o+ZCUMWFEjiaUcI4W4XH0aG6NTgQsQ12ZwhgcDVTkt7uf1yUUp95JyMSiGsCWFG61+Z+YHWUFWrwxjxv92q0nvB2USQ/unDf1zsFBjYjonU6QVbDMqweUk2W8RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZUxkxCE/vBmMl6E37W8ndCiGnStgr/XqwJ6LzFblp6g=;
 b=Ss8nu4xVUMTkiITQ4jwY37jqZLKoSnrW/Jx5oK/cVG45GYbWvw4dNiWTgpYdhywq9Q/T8qNIpShq6AS59fQz9s1vty7QWq04mRFoGxUQksxTPjz+U9JoJQWb1t1O5oHNuDJAVRCPj5oQyXjG/yqUTRtCcCZ3EWjgMaixYmjp11VywpcV4JQNpoBP+JLl30klpOs/AgfgD34dOchPmsAYP8T6H2lzZ/b12v7Ot1tag8hUgNCBwE6uY/DUDS6Ub/oHQarZaDS1MbPxKnfb6YO3MtCYKjsgMQHWIXlxgbf5/rPXmtuOADwEFw/1pYROoiUh54FWwzJbCyYM7jBkuVYbYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZUxkxCE/vBmMl6E37W8ndCiGnStgr/XqwJ6LzFblp6g=;
 b=RuzV7zDrGkn8irsPI41DHuVG0+WRlNVz24XCa5M0Ql3mgIY2dheFkusEP+iLJgtRdW5VOEmeDAs/dOkHPi4E5wonGoBdK0hoQ8ruWX3916OGmfePFkBfFYVbAfHjhly9dZafObQayPf7xAURNHsknQ3QBtcyU3ho4XAsas+AR5ZHGteg3+BMJhzpKt/jql3yvlPCKNj3wmOIonrxK+C7LyUJmWIUPq/k7XtStLICNppJDTa7RLnDS9oDvgAgYRPpfd3+4l4hsnyIqvbZ3RUQcarvJtQadTi9WWVrHnO0nAdlnBnO//Z5vafGSBBR85G1WhmNJX3fMHLseOFJja5OCA==
Received: from MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15)
 by SJ2PR11MB7453.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.21; Mon, 25 Mar
 2024 03:56:47 +0000
Received: from MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::6440:4b82:c32c:9eb7]) by MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::6440:4b82:c32c:9eb7%5]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 03:56:47 +0000
From: <Balamanikandan.Gunasundar@microchip.com>
To: <Conor.Dooley@microchip.com>
CC: <conor@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: mtd: atmel-nand: convert txt to yaml
Thread-Topic: [PATCH 1/3] dt-bindings: mtd: atmel-nand: convert txt to yaml
Thread-Index: AQHaeoroe47HkYrCOkO/zG8i/RhtzbFA1CuAgAJZPQCAADMvgIAEezwA
Date: Mon, 25 Mar 2024 03:56:46 +0000
Message-ID: <d3f2c773-ca53-43bd-bca8-4e27b9a4e5c1@microchip.com>
References: <20240320-linux-next-nand-yaml-v1-0-2d2495363e88@microchip.com>
 <20240320-linux-next-nand-yaml-v1-1-2d2495363e88@microchip.com>
 <20240320-quicksand-attentive-14610103237b@spud>
 <3c199359-f0d8-4ec0-bf86-930b2ecfb876@microchip.com>
 <20240322-arrest-pucker-7ff731359fa0@wendy>
In-Reply-To: <20240322-arrest-pucker-7ff731359fa0@wendy>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6231:EE_|SJ2PR11MB7453:EE_
x-ms-office365-filtering-correlation-id: db4eb569-e4c4-4c57-7416-08dc4c7f97ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1Rl7V3xUVX5U7kAF2hbvL9kGJiNXVt/gAq0mf3pY5T2LHYZHLiTzQsoHzhhlzKj9+6J3UBKXmh29rSWwAgekzcoJcf6bgODeErzK2ZjIqQozTMah7dQnb0SNCejg1hVCh99JaFlby6R657rAWuVeWGgNBjH6oTDWGXgoy34kDS14b+Fzw3vGe9yVYmV2WTOXdu7kiyoSbq/IIPiBiHHWiDd4dkfQivOHtMc4LRZSNMTb9foPYtbdq+qesJfKIBTFrfuiD1lr45shvmB1fGmEN/8dFJspIYyoJX/Z1rKsx1I5piOSxW+av1EWKTBZmLgzHjm36ThTMYA/z8UPZRZee/xeO5cG6H0/GIHAnXzbHqpdjWODydI4W0Z0lsEhaVwKP4qtawK8Jvue2Ql1+LYWzEEjMIIEHbUJoTmj1TuUKtQFylg78H9nZxciBgOO5VwtVFLNq/L0vzEBtnSROmBB0vO23yzzdyZ9RDuQdzKYJbVvvWK5xVuXsoU9TA5kwUpBCuUYbMGuncRSr9/mr6Ng0pUnKYJN2+QL0H7Rsqt2coPj5HCi+Ef1olDdSdQWHnXDVT+i9IipFr10JFp8TqJeQridPBlXwE+/gPXMI0a2Udip9QXWcs/yKtLqSVaonmlAVXyYudXdtbz4ScrBbGLt6jZmzPuarmrD341YtLSrUkOv+FoONVDlvYDbYJOKKfMv4Z19LRxcs6ZwPO0BMclRW8qND2c8MAjttji/3vbQUIQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6231.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QnI4V25lYVR1NklsSjlvdDBoRDhFUWFUbFkxOG81MzRrRW4rL3ZoQ3EveXhm?=
 =?utf-8?B?a25yaTFZcWlzS0l5eWRUbjJya1VHL25hSExpS1J4N1E5RkdwZDJlbjFES3F6?=
 =?utf-8?B?eWVPR21YQnVpMWdlbXEwSUo4Zng4Q3Z0TG1NQXQ4WUZUSEtFZnZTUG9VSXRP?=
 =?utf-8?B?dEY1R08reXJKSWx6NkZxc3BaUkYwcDQ1WVBYc2NJVG05OUVESFhsdlRodFVC?=
 =?utf-8?B?Zk5ZL3gxNUFLL2h3SmU1NkwyWmQzRTkrVk9pVG9EaGo4VXRHa1B3VjFWdTZK?=
 =?utf-8?B?cTZGWHpSK0lEMnVPZHk5YllJT1pMci9FUVJUNWZ4dmlnT1JLSFQ2VUtLc3Vh?=
 =?utf-8?B?RS9IbFI5dFF4eGs3SUthSHBMblRXcnR4SEFsUDNrMkE3ZVJPblhSUXRRVkpi?=
 =?utf-8?B?TzcrNXFDU2JiS2p5S1ExM243T1JDRkdETE1zNFd4RHZQS25HWUh4NjZNaFNs?=
 =?utf-8?B?eGtvcEpTQnB4U1RNL3lyVVo5aWdrUHV3NVBVMnhrUmIvMHRDTHM4MVBzckFO?=
 =?utf-8?B?TnpINnlHNmFLSXZ4cmFNRE9ZVU9VNGluMjcveDVTSW9TaHBjaVpicDBaQ2pO?=
 =?utf-8?B?SXdEWWkxdU5HWDZhOTE5WXBybG8vRFNzZDlhM0dlNjdVM3ByUW0xdDZ0dEJY?=
 =?utf-8?B?WERmSHhrK1lQbU5KTXloLzFYbjMrNFJPUzdQZm51SlluUjRkUkprVmNycDlM?=
 =?utf-8?B?V2ZjMUxqRURGOER3cDRQbHkrUzJrclZra3BqZFRSWktIMVJJVzhKa2F6Rzha?=
 =?utf-8?B?VEdlNW9aaTNPWW5vdnJnZ01wVnkwUldrUmFlM0tjMEJYRWFoVEtMbjFMTHl2?=
 =?utf-8?B?NWJGVlBOei9BS3NoK3dKOHpZaENUNWJ2dEx2VUlvN0dHb2tnRUNLdUdHZXdM?=
 =?utf-8?B?WFVNK0h3VmpzTGd5cm00Z3VXSWNuczlYU3BtNHpsbmhqOFZibkpyTGZqdXky?=
 =?utf-8?B?TXBINmhRb0JlMnJTMlRPbDZoaDB1QVRFTi96TkNIejJSMmdubGFPanpMR1h3?=
 =?utf-8?B?Rmp1VmxLeFNBUUVsclhPdW9mVkoybWlSS0gwYmN1SkJwQ21CM0tYT29DOGlS?=
 =?utf-8?B?U1pENTdydkdKUXhiVWNDV3RSdFJqQ3JWZDMwT0tGdjdHSFo3K2hyN3htSVVB?=
 =?utf-8?B?UEszMjFRZThFUU0xVkk0SFRTSEpORzFTK25HZ2wzL1dnNm0zSmdQNUg1cXRl?=
 =?utf-8?B?bnhSU1lvZlhZSU5vSHdMTEt6STQ3U0FVNS9raVZiaWJHaWxISmVKdnZMMlk3?=
 =?utf-8?B?a08yVUgvVmNPUVRrWEtsVXFDd0pVRnJia2ZleXlqMjVTSmNFN2R0NUxLSDR1?=
 =?utf-8?B?YWo5OG9rR0YyRGJReHpzclN4elNOMndSM1k2RW8wNmhiVnJNUlkvSFQ0SFc0?=
 =?utf-8?B?RWdaSjlSMU1JMEh6akYvZ0tCU1VMdjdkazhyNXRaeG5CTzByWFVsWXFxdHNa?=
 =?utf-8?B?cEM3Q25Ta1Z2UUpwcFVTVG9VcjMxeDJPWFBldHpoNWlsOUJMcGJVOG0zczZG?=
 =?utf-8?B?QU1OTkFKc2puZFVmWmNNYVRyT1Nwa3hPR2Z4VDQ2Z0dzaU5DNnJ5UnBKVFdE?=
 =?utf-8?B?eVJwanVHS1J1RlF6U3IxcVUyQm1PaTdFeWluaFJORzJrZjNENWhNcDVVTlRT?=
 =?utf-8?B?dDZYK1JXdG5DTGh5bFczZVJua3ZLb29SZjloYUNENEpReDZLcDNNOVBsWjcv?=
 =?utf-8?B?elh5R0sweHU5RmZQcXBKekpoOHF6V1NMOXhSTmdVVXJhQUJybUZMU1JmQUU5?=
 =?utf-8?B?V3pHeXNvbGdMenhUZVpJK1B6NHFuZkpNUFI5bnRza2E3Qnd3TUF6WkYwb1I1?=
 =?utf-8?B?UGcvVFdMVUtaZ1JSNlA5MkdvaWZqSmdlSjlTWXEyWHJlelBPVytLUzloRENF?=
 =?utf-8?B?eGJOR0pTS1AwWHR2QUJLWXgybVQ2SFFiSzNnT3hyRzYvOW5aa3RzUEdGYWhs?=
 =?utf-8?B?Si83NkhBcjZDUTR3WmUwak80UDNsQzVNMlZKVkR6dEdqcXVRYS9VYng0WVU1?=
 =?utf-8?B?MlhrSHVqNEhzclY3OHhWNzVlSDhJWklMQ0tvWUNmeG5wRlZONDRWKyt5Vktx?=
 =?utf-8?B?QWF4RFZlemdwRlJYWFMzb0pNM0podVhucTlpd3VkTGdpbkJHOVdwVjlTOGpr?=
 =?utf-8?B?R1lUdHJZTEVqQjdjU3A3aTlrQmpXdHZEZEdPRlF3L3ZUTUNUZ1JQYUNsRmlI?=
 =?utf-8?Q?PhRwRfTadA9xAXDWh5P5QVw=3D?=
Content-ID: <AAF8B1F6AB24974C87C655A411DA54D2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6231.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db4eb569-e4c4-4c57-7416-08dc4c7f97ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 03:56:46.9400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RhDjfARhrzWzMIru/AdSGlYwOgi9fQj50VIC9m3EX/VR8ARt5XWsvU0q8WaUiDpuS+E9QrRiYTxXkzJoHe1iXqptSkUWJlQrWXxpo/40c9YS0sFa2eKXir3/SLW0L5Wa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7453
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_205725_598996_19E3D89B 
X-CRM114-Status: GOOD (  23.70  )
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

On 22/03/24 1:00 pm, Conor Dooley wrote:
> On Fri, Mar 22, 2024 at 04:27:29AM +0000, Balamanikandan.Gunasundar@microchip.com wrote:
>> On 20/03/24 10:05 pm, Conor Dooley wrote:
>>> On Wed, Mar 20, 2024 at 11:22:07AM +0530, Balamanikandan Gunasundar wrote:
> 
>>>> +allOf:
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            enum:
>>>> +              - atmel,at91rm9200-nand-controller
>>>> +              - atmel,at91sam9260-nand-controller
>>>> +              - atmel,at91sam9261-nand-controller
>>>> +              - atmel,at91sam9g45-nand-controller
>>>> +              - atmel,sama5d3-nand-controller
>>>> +              - microchip,sam9x60-nand-controller
>>>> +    then:
>>>> +      properties:
>>>> +        "#address-cells":
>>>> +          const: 2
>>>> +
>>>> +        "#size-cells":
>>>> +          const: 1
>>> Why is this in an if? Isn't this all of the devices in the binding?
>>>
>>
>> The default nand-controller.yaml defines this as const values.
>> (#address-cell : 1 and #size-cells : 1). I am trying to override this
>> const value.
> 
> You're not overriding anything as you don't have a ref to
> nand-controller.yaml in this file, AFAICT. Why don't you?
> 
>> May be I should think about better approach ?
> 
> You should be able to apply this unconditionally for this file. I don't
> see why the if would be needed?
> 
> 
>>>> +patternProperties:
>>>> +  "^nand@[a-f0-9]$":
>>>> +    type: object
>>>> +    $ref: nand-chip.yaml#
>>>> +    description:
>>>> +      NAND chip bindings. All generic properties described in
>>>> +      Documentation/devicetree/bindings/mtd/{common,nand}.txt also apply to
>>>> +      the NAND device node, and NAND partitions should be defined under the
>>>> +      NAND node as described in
>>>> +      Documentation/devicetree/bindings/mtd/partition.txt.
>>> These files do not exist.
>>>
>>
>> Apologies for copying the content from the text file. I will correct this.
> 
> You don't need these comments at all I think. You have the ref to
> nand-chip.yaml, so at least the first text file reference can be
> removed.
> 

Agree with this. I will remove it.

>> Yes. I should fix the alignment. I will send a v2 shortly
> 
> I did make other comments, so I assume you agree with everything else I
> mentioned and will implement them in v2.

Yes. I agree with other comments as well. I will also address all the 
comments with the other 2 patches and send a v2. Thanks for reviewing.

Regards,
Bala.

> 
> Thanks,
> Conor.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
