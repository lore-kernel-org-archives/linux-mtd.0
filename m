Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC25C43334
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jul 2022 15:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vp/PO8T4iixhhEJ/HFPCPcOraxM1eOxl6hX7glT6BaY=; b=CXVN+iX4ujm4iE
	g8ed/wEYpDdMarRB/7DuHBaK/YS/Gx0g6JlcXRMiTrLA4s8m+to9FMQfg4w8xrmpmIDvMS4Nxua+t
	KEUvcW0QYPP6hbhXv9Txtfph0EZ6efGJquCIBn/p8GdpdhCHy41UBzStM5OuSxYdu0QgyGZ71+aKx
	sBJqqbAFvvu7rY3aQ9zhxTqdNZ0O4lmb4pufiuvBXyDKoxaBISB8ZnL5+cBZQL9KpP6gIjaT6xIyI
	wm+xKPXYZyXM8wRBkKNoxCTPYWWVkEt+GEImpCcFuezxXjXE6PxW5ms2FfDCkYpoWufZKNz2LC/sK
	CXQQGZ5fEITS2m2URnBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXhP-008dlO-8a; Thu, 21 Jul 2022 15:02:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXhL-008dhB-EO
	for linux-mtd@lists.infradead.org; Thu, 21 Jul 2022 15:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658415763; x=1689951763;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ozHdUbGVfOZ7XRkSWvTl7vfze5N0hk+ZKsInXBpUYGo=;
  b=dyqN6EQdO48kFLwhzosiFagadO7AStNZLsx+E4XGUkNT+gVphOJwB9d3
   Sb0IEvuEG8wGFYhjWTmdyML0n5vX/m1by5SI11GKi5NKxcbqaCQ0VSjH5
   JSmcO+xigc0SC4R037rS1+P5yjkGsM/wqe1dHZXiVWKVrJmIVCO2dh8I3
   iwHTsg0mPxucbQbg8px7ZpZjN7u16oIkC6qE+vYumGhIBcWkCCMwRq2RO
   44BAtVHWztGeW6wocFPydwnc8eNtfRgVDMzAb0eXN3DZIqW1JlKN0askp
   Zmb/kUX9vl9wA3DULGACuyDNqV2545JH3VOaQWEjpUfhMpSK8ixLNXRiH
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="165819904"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jul 2022 08:02:42 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Jul 2022 08:02:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 21 Jul 2022 08:02:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRVy1mnvMBPpMPyLj1LvRj2Tf9SIQ6yQNHm7EHZUtkwsJHIVlrTefjCqqjwGs7MdohEpvBczN0q25K7tXGb5/OzKyJLaXitNv8giP+swzWBrWr5Sjio3YUDLArbGK8nLosKrIh2RW+OOAcGYGxzepczaVTmsNrBXnaR8WdewaI9Aa5N0L0ayUrhdMSoEv5aYIzhvZHX9uB2N4B0yxRLwk5JGU2mEaTfHYQZw1v967G2D8itp0oWYDd++30lmUZbl3v6uZoUbXWVeK2rtMPOJ7qWpKYu+Gb7bhv9et51pxcy0z8xYI04/puPtjYtq0NSTadnIPmKwYpiVGZB4HNNpFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozHdUbGVfOZ7XRkSWvTl7vfze5N0hk+ZKsInXBpUYGo=;
 b=MIajsbaH2ZE68Yew29JaRN0ZqxFACCk6HpET0lEtP6H76HqWjzaQUegtLTJ1vf9H7SOw8CrakSmtj8KGOBNi3Qk8QcM0z6CLaw6wn3rjw3mhoeAu6SdAgxA5A8JjOTEK4s7y+YndYXpyKdNGYZwGpe2Jc31QtD3S0sK8v5NP1c9ZZtQhwG5PnMgCWpOQZoF04C658vuX9Af++kTIuIXJNW03sL1MnsxRCJsMc8qvjgaAS9fXzaEbLeKejlSwWBwfqfA1SlEX/b81L6UXR/q6h26u0lYa3ObPcPxYONPl98oioBcDgDnVdsLJchTGjPYZ1gXf4CHHw77mXO6Mh1o0nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozHdUbGVfOZ7XRkSWvTl7vfze5N0hk+ZKsInXBpUYGo=;
 b=Pg0xEliQ0qwQPRhEgy1FfBuHlPjd6ogyUlZdrnlUagFIYR40Lns3XBn6xD1R8rljXTUrqdEwcY+J2Cl63MapfJqIZREWphaWjhxi0bnIaSxrJWhx/3UKiPb6PNNx3DEHDXUc8+QipyG0+7ULcWhZLEPSAQo97ASNHE75oYV5zy0=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 SN7PR11MB6559.namprd11.prod.outlook.com (2603:10b6:806:26d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.19; Thu, 21 Jul 2022 15:02:21 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4%6]) with mapi id 15.20.5458.019; Thu, 21 Jul 2022
 15:02:20 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <tkuw584924@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <michael@walle.cc>,
	<Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v15 4/8] mtd: spi-nor: Do not change nor->addr_nbytes at
 SFDP parsing time
Thread-Topic: [PATCH v15 4/8] mtd: spi-nor: Do not change nor->addr_nbytes at
 SFDP parsing time
Thread-Index: AQHYnRLegJwopk3ciUahhybJr+4c6A==
Date: Thu, 21 Jul 2022 15:02:20 +0000
Message-ID: <42ee548a-2614-5f57-fdae-2dbd15c6f7df@microchip.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <ccff78b42bab8d6eb0ffa2127f4fe6c4daddf6af.1652063152.git.Takahiro.Kuwano@infineon.com>
 <20220531113056.elquk3pup5lsrz4o@ti.com>
In-Reply-To: <20220531113056.elquk3pup5lsrz4o@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0aff4e6-a268-4c2c-282a-08da6b2a02b5
x-ms-traffictypediagnostic: SN7PR11MB6559:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8xd6ncGzilsjapTEj38ZjcTC2g7FModSzssmsgBOftUNh6WwPShE40m8hWV7iKApZKW51Jgws4fozFzUsO3pk0fB93RYGH1EZbYqtVO3qFPkTnb8ZOe07cXS11cqgPnfDbsUr4jDzw5hB8G12T2+i9p+yXY+3TfINj+BwZ6nfNvIn+KfkGbl58+uf0k4W8ylZrgbXEp8w9bGV+QzdDaSywkdkTsgKgMXMCxj7oahDUSWlkGywsLO20HwvN4RPKaRkllLJ2UbHjAGTZZv/Hp6xOn0lvrwjKjWo2ZspKKzfCRJ0OdhQpDC1ahgqPiPRRj2xT4Sz/wvi40WOAl4FikxJATRdjG80aNu/psI8d0zvdQx7X0IEuhT9z1aEsicdwvBcPXo6mj/h8t5AxFX90JZ7/9pkpGJWYrqMv4UhDjMThLdC2V5fP2DcmIIj2IqiqwpErFpBqVqhjunqwQxU96OnyuZrJo+Hpr+mLu1dZfUtmVSKg5FNseReFVMEAcPJ2W/iVDfKJP1HavPVf9xEEa2UKhEojKOI+0fjiw/YHfok7RGTjrTW95PoZHCBgxRu1w1t9zS1olwcVEHRBiAyBSuSbd4EhW9XkWecLgQqgebP7wpnnYCZm44LSX5uwhYMt34H7FdVOB0hWXl/DfW3GIPpidhgAsmodk6o+TWOLUo/dUY8jjQuXf1dJ4ieMZsvmLVuuHkQPHjSlqKXYUppa9jfA7sFrrVHBpeV6E/+H0Ls61qDXOTqUoeLcz49BBpqxnkn85TbrkLmdp+ewQWbWb1BbRh0Sq4ytfh1haxH0tC3DLW6q1Eu8TpwVMGw5gfF0bNoAbjNwsZNyNVpDPQOk/VwgZGG4VHqoJXmvKZhPheFSWUBULdCYloALR0oYfoN5R9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(366004)(346002)(136003)(39860400002)(38100700002)(122000001)(38070700005)(110136005)(54906003)(316002)(83380400001)(31686004)(2616005)(36756003)(186003)(5660300002)(478600001)(6512007)(8936002)(6486002)(6506007)(86362001)(8676002)(31696002)(66946007)(66556008)(66476007)(76116006)(64756008)(66446008)(91956017)(4326008)(26005)(2906002)(71200400001)(53546011)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L21hRnZoNnRFU0dSNkVMMStpOWRKcVRSdmo3Z3pIWU9kRUpRMVV5MVBpOUNs?=
 =?utf-8?B?eWlCZXk3UGNZa0lLb2FuSDZHY1B1V3AyTFRoanZpUW94bG45U0pteVplS2tJ?=
 =?utf-8?B?aFBGWTFjRitRdGFpTld6Q2pJQk1aVEZCd25tRWQ5TFk4WUxnSWZqaXJvamdZ?=
 =?utf-8?B?VTRCYXlhNVVxcHlNM3FFSlJaWGEzSkhUdzVuTzlXOUdQaHFVRHBIZ0c0d3Nm?=
 =?utf-8?B?eHFBeFBaMTdidktkSlh2Q09SU1pFWFJNQ0Fia1NsMlNBVktTbksyK3YwcFNx?=
 =?utf-8?B?TGFIOXdzclYrOVp5WERLamlWY0VHZS8zak1vL1BJWG1nd1pldFdyOVNDMVcv?=
 =?utf-8?B?OGxhZkI3OVpVd0k5cHN5VmttbS9RSHVKMVIwVHdCQXRuMWZtU1NvVkNuRU5M?=
 =?utf-8?B?QS9DZklmMkdHS1VERXdadGdlZUtlUW5tNFcvcmFObkpQeVdDQzF2bklRY1FQ?=
 =?utf-8?B?UHc0RExPN0x5V0tvdXU2dXVnRncyeWY2TmpweUh0S1Z1Z0UydUJtOEFPbW1i?=
 =?utf-8?B?U1Y1bXJjSEtBSnlaR21xc2RzWFJ0NjVLSnZ6K0p6WWhCd3dTeXRPY2ZTUXNO?=
 =?utf-8?B?M2NnSi8yWHF3SEdjSjhzWkRGZDBqelhFa1JKOEN0WnQ1bTBKZXBTa3FxYXh5?=
 =?utf-8?B?YW5xLzZFSUJESjZ1MnNWdEJKTW5pbkpCT090ejNxc04zS2kyZFhrM3VQdmVx?=
 =?utf-8?B?blliL2FURHg1Sko5QUdUbGJJeEkvekVmSmdDcDQ4bWJwaWtrVjltemoxNmFM?=
 =?utf-8?B?K1haamJEdkEvQW1LbjZ0S3JKR1NSWUxuazl4UEN5MHA0eERlR2hDaVl4amp1?=
 =?utf-8?B?ZWpBeFltTkZzR1ZkVVlvQ2FJdWNiOUJyRGZBM293ak9KNkQ4Vm9HZjJnMTAz?=
 =?utf-8?B?bEh3cisxek1aTWdYYit1ZWZzZ21EU3loNy90UFNheVRwZEY2Q3V1cWx2aVpp?=
 =?utf-8?B?TDJNTDhFRFVBbUpEcGc1d1dNbjcxQTdtU0ZzOW56bEd3RExaS2JFVHE5dEZY?=
 =?utf-8?B?OHZlamxhTWZmakh2WndOdEl3a1ZaZGJZNDk2bExxTWFFRWg5M0FNQUczVUZ1?=
 =?utf-8?B?bVh1c0hJVVZwdzZTWWM3QjBrcmMyNTFlUk5yVTVmcW9mZHVTM092djBTeXEr?=
 =?utf-8?B?aXNZaWk2MjQvU2srK0VhV1NrTm15ZytHOXYrVlFpZmJwMlFXcjk4aURkQ2hj?=
 =?utf-8?B?WmRCK2htSTRkcGFMMFZrWU5iMXRaZ3dtaVh3ZGVXZXQ2RWVwekhUZ1RwRHFM?=
 =?utf-8?B?ZWFXNkZGS2tLN1hFUjlnVWkzdmZsUG5wQnR6Z3d5ejZGRVpabnpvc3k2NkJ6?=
 =?utf-8?B?L1VDT28zL1piampCbHo3Y2lRUjhpYmx4S1hCanZwRy9EWkowOXY4NVNQTENS?=
 =?utf-8?B?NEtjOUVRWVVDUWJuZFh3R2N3NitDMDlaNE1KblY4b1hOREdBRjlHSlV4TVFo?=
 =?utf-8?B?ellzeTRXREZiVlEvWmJyRWpxR0FaV0dXNEpmQURnckFhaU9NNS8rakFlb2pi?=
 =?utf-8?B?OWl3c0xadDhvRnVmTmFDSy9OcTdRU00wdk9CcGNYM00vQWg2cmJoN1NPc09M?=
 =?utf-8?B?UDQ1VlJFdmxHVGg3YlQxdnZTWFM3NXlVQjdsY09GWjkvNkgvTnVscVRETWhp?=
 =?utf-8?B?bkY3NFNCYm1vRHRsTmdqMFNvaVBUaWJWQW0wdkE1RVVrZzdqRHhvbExZUWQ5?=
 =?utf-8?B?WjMvdlphaERkMllOUDEwNndUdVpWVlpaTDFUWXBBdTUvbXVEd2xCK2xseXlz?=
 =?utf-8?B?WmVNa2pvWEhIeDN4eWFmSmZSN1dCeDN6NlhEZ0VNUzJnQWswYjhYWlpEaXNI?=
 =?utf-8?B?M0t3cEl1V0o0WjRVRHJVUThCMWNwYzdOY0E4em9xdWN1dzdLMGNFeDl0b1ZI?=
 =?utf-8?B?QVpqeCsvREtHSVE1NFNNaWE5SDUzLzJYUWJmaGREM3RNMTM1aWhKSEJUUk82?=
 =?utf-8?B?ZWsxVjUrejNmUGtrcG9lb3RoWjcwancxQUYzdkpiVHlVMm1XbEQwQVlUdmFH?=
 =?utf-8?B?V3plZGJNU2xLSUIrMStTcEo2eTdROUt5NkRybFp4NERCSnVKQi9UMklRbitv?=
 =?utf-8?B?UmhQQjk2RlIrQkhSSnRoQWpWVGw1R1lVTitVb1U3VjErMlo5UWQ5aktZSkIw?=
 =?utf-8?B?aExYUEhVNDZGbzR1aXFydG8wS0JUV0RzUnFpOGNiU08vWkpNMUZQSmhMUVdZ?=
 =?utf-8?B?bVE9PQ==?=
Content-ID: <4636A698075F53408289AEF6AE707051@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0aff4e6-a268-4c2c-282a-08da6b2a02b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 15:02:20.3790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PT/840sqIVqDpfo8JZP50ztMdLlnnUpfkvztcrAqyp1+SEAG6+rtJWnv/O/aLtHC+ikrYsthpGZDajRjrMeAe8K1/3U5bR6kjPSG8hGQYg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6559
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_080243_619075_21E3673C 
X-CRM114-Status: GOOD (  20.15  )
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

On 5/31/22 14:30, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 10/05/22 07:10AM, tkuw584924@gmail.com wrote:
>> From: Tudor Ambarus <tudor.ambarus@microchip.com>
>>
>> At the SFDP parsing time we should not change members of struct spi_nor,
>> but instead fill members of struct spi_nor_flash_parameters which could
>> leter on be used by callers. The caller will then decide if SFDP params
> 
> s/leter/later/
> 
>> should be used and more importantly when they should be used. Clean the
>> code flow and don't initialize nor->addr_nbytes at SFDP parsing time.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> Tested-By: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> ---
>>  drivers/mtd/spi-nor/core.c |  5 ++---
>>  drivers/mtd/spi-nor/core.h |  2 ++
>>  drivers/mtd/spi-nor/sfdp.c | 18 ++++++------------
>>  3 files changed, 10 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 7db6b41d7c30..dd71deba9f11 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -2272,8 +2272,8 @@ static int spi_nor_default_setup(struct spi_nor *nor,
>>
>>  static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
>>  {
>> -     if (nor->addr_nbytes) {
>> -             /* already configured from SFDP */
>> +     if (nor->params->addr_nbytes) {
>> +             nor->addr_nbytes = nor->params->addr_nbytes;
>>       } else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
>>               /*
>>                * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
>> @@ -2518,7 +2518,6 @@ static void spi_nor_sfdp_init_params_deprecated(struct spi_nor *nor)
>>
>>       if (spi_nor_parse_sfdp(nor)) {
>>               memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
>> -             nor->addr_nbytes = 0;
>>               nor->flags &= ~SNOR_F_4B_OPCODES;
>>       }
>>  }
>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>> index fe7683fe1b4d..41df8bc8e008 100644
>> --- a/drivers/mtd/spi-nor/core.h
>> +++ b/drivers/mtd/spi-nor/core.h
>> @@ -345,6 +345,7 @@ struct spi_nor_otp {
>>   * @writesize                Minimal writable flash unit size. Defaults to 1. Set to
>>   *                   ECC unit size for ECC-ed flashes.
>>   * @page_size:               the page size of the SPI NOR flash memory.
>> + * @addr_nbytes:     number of address bytes to send.
>>   * @rdsr_dummy:              dummy cycles needed for Read Status Register command
>>   *                   in octal DTR mode.
>>   * @rdsr_addr_nbytes:        dummy address bytes needed for Read Status Register
>> @@ -377,6 +378,7 @@ struct spi_nor_flash_parameter {
>>       u64                             size;
>>       u32                             writesize;
>>       u32                             page_size;
>> +     u8                              addr_nbytes;
>>       u8                              rdsr_dummy;
>>       u8                              rdsr_addr_nbytes;
>>
>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>> index 058ce218d2af..90d7c25f7281 100644
>> --- a/drivers/mtd/spi-nor/sfdp.c
>> +++ b/drivers/mtd/spi-nor/sfdp.c
>> @@ -178,19 +178,16 @@ static int spi_nor_read_raw(struct spi_nor *nor, u32 addr, size_t len, u8 *buf)
>>  static int spi_nor_read_sfdp(struct spi_nor *nor, u32 addr,
>>                            size_t len, void *buf)
>>  {
>> -     u8 addr_nbytes;
>>       int ret;
>>
>> -     addr_nbytes = nor->addr_nbytes;
>> -
>>       nor->read_opcode = SPINOR_OP_RDSFDP;
>>       nor->addr_nbytes = 3;
>>       nor->read_dummy = 8;
>>
>>       ret = spi_nor_read_raw(nor, addr, len, buf);
>>
>> -     nor->addr_nbytes = addr_nbytes;
>>       /* Restore setup to its uninitialized state. */
>> +     nor->addr_nbytes = 0;
>>       nor->read_opcode = 0;
>>       nor->read_dummy = 0;
>>
>> @@ -461,11 +458,11 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>>       switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) {
>>       case BFPT_DWORD1_ADDRESS_BYTES_3_ONLY:
>>       case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4:
>> -             nor->addr_nbytes = 3;
>> +             params->addr_nbytes = 3;
>>               break;
>>
>>       case BFPT_DWORD1_ADDRESS_BYTES_4_ONLY:
>> -             nor->addr_nbytes = 4;
>> +             params->addr_nbytes = 4;
>>               break;
>>
>>       default:
>> @@ -652,7 +649,7 @@ static u8 spi_nor_smpt_addr_nbytes(const struct spi_nor *nor, const u32 settings
>>               return 4;
>>       case SMPT_CMD_ADDRESS_LEN_USE_CURRENT:
>>       default:
>> -             return nor->addr_nbytes;
>> +             return nor->params->addr_nbytes;
>>       }
>>  }
>>
>> @@ -689,7 +686,6 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>>       u32 addr;
>>       int err;
>>       u8 i;
>> -     u8 addr_nbytes;
>>       u8 read_data_mask, map_id;
>>
>>       /* Use a kmalloc'ed bounce buffer to guarantee it is DMA-able. */
>> @@ -697,8 +693,6 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>>       if (!buf)
>>               return ERR_PTR(-ENOMEM);
>>
>> -     addr_nbytes = nor->addr_nbytes;
>> -
>>       map_id = 0;
>>       /* Determine if there are any optional Detection Command Descriptors */
>>       for (i = 0; i < smpt_len; i += 2) {
>> @@ -753,8 +747,8 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>>       /* fall through */
>>  out:
>>       kfree(buf);
>> -     nor->addr_nbytes = addr_nbytes;
>>       /* Restore setup to its uninitialized state. */
>> +     nor->addr_nbytes = 0;
> 
> Same as before, I don't think this function should know or care about
> the default or uninitialised values.
> 

well, maybe. nor->addr_nbytes comes with value zero when this method is called.
We gratuitously save it's zero value in a local variable and then we restore
it. The restore of the value could signify to the reader that nor->addr_nbytes
is already initialized with a sane value, which is not the case, so I find the
code more readable in my version. But I don't mind too much, so I'll drop this
particular change.

Thanks,
ta
 
>>       nor->read_dummy = 0;
>>       nor->read_opcode = 0;
>>       return ret;
>> @@ -1096,7 +1090,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>>        * Spansion memory. However this quirk is no longer needed with new
>>        * SFDP compliant memories.
>>        */
>> -     nor->addr_nbytes = 4;
>> +     params->addr_nbytes = 4;
> 
> Patch looks good at first glance but I have not looked very carefully if
> it might cause some small issues.
> 
>>       nor->flags |= SNOR_F_4B_OPCODES | SNOR_F_HAS_4BAIT;
>>
>>       /* fall through */
>> --
>> 2.25.1
>>
> 
> issi.c's is25lp256_post_bfpt_fixups() also sets nor->addr_nbytes. Should
> that be updated to use params->addr_nbytes instead?
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
