Return-Path: <SRS0=UGcd=OV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2526AC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 08:42:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD8D5604AC
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 08:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD8D5604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GO24KrEWCt5R+is6JcsQ6HCNeNwLCJdBLfEPheCR3vk=; b=o6yzSL3W0ftOcQ
	CVaYsfkHT8X0rFWE2Cuhk6au699JaLfAV2S4k1pOobnI76yAdXZ/2R1SemOCFvWWD8QX5ALDiMd5G
	/jCxSg+gvQu5rI5m59oLpK0OqG0N5bxrRCrigY8yKtvnqWm0YbIz3Xy+V06/PSOUv1HhoUs97RV0x
	EFGAPOFabOAbN896fagygskuCOkIDa4avVbJnoLSkE6aIx0izDX8yaYq5RmBkeTDUrHRX/7A/k/NM
	gC+dKaYg8NmcgoTUcy0qcTkUQMTxQBarAEJH6/Lr9U4DR1qmgCa0PZKPSu/FGNue9qKA7trCkqXOk
	JXXzMShL5Quf933TqhdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWE75-00H6sa-Cg; Fri, 01 Oct 2021 08:41:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWE71-00H6q1-ET; Fri, 01 Oct 2021 08:41:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1633077707; x=1664613707;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4SjWBzuTnXZ1Fx0OQkfscCoTWMi6ynYPWqzD6kyhRmw=;
 b=WfyO4kob0edDv5Hw6g+lCSXTWNa94253oJyMS9xKuwr965SokM9QmFcq
 UgPa1wUKV6xvN1I1QJ4UjS8hLPUNNeQRi6hDeZJFeWpg9n/V+m6PqublV
 KOuUhZLHb2CtD9Orl4NjjH0/eyrZa8TssJJ16I1/DmSXsXznN5ytJljvk
 lPG2wNFMPNgWcyelQtoWZtOJa4JuT+j36EeasbsK/KTZUgnuplPJrkAm7
 QxwC56Tb6Lr4wJXRHCM5gSlalbQR1tAWX1Gi9qJB8awH7UpFlu3KQ5BQL
 5eGn85ZMocezoKSlTHiwCeTSdLYHnPQl0KfCM63UL9rYvdEaJzULFc3vA w==;
IronPort-SDR: Z6MrXjmoO57ZKz4dWk6Vnnn0wSiUvqxtSXBkJ7hzk+pBUTqMlUmPrEURPusTaiYPUBQX04uUYu
 /fhZS+UUGUdntxYRgQzlcdVYM8uzfHxvGEIiEAcaUHlHrAgml1IP8OKzrocLa3kTsNAbxLj37q
 tYsDKU6wDfeMgJRqC3UDbjuACDXb1JPDxmrcybHuDljC6Xc7qUK6kYQrmFAPAn/k7OMHeqcPso
 DCnrSR4qQ/wFED+mRz+TO7FPR3mpEirsigLHgHPfpzQT2XKRkGbPzhrvhwvn6hkO31rJqf0cxT
 qkK4ma7jpKhW9VhLP9LAqKVz
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="71348004"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2021 01:41:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 1 Oct 2021 01:41:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Fri, 1 Oct 2021 01:41:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+/jUqarKDkJi9Dn4GMnrGsw7PO7FKER3zlk1FtrK9v3qtV/gTzvXMiXbWs25rxkajI5ahiiH9XhpKAuE9eGwElP0ixyzUvDItuknMqgtCk3sSnYVmAuL4JEn1ksdG/0PAfCjzgC3oHEbArj5XgBJVElVgD3fcT2pQQwRvJGhoGPglvWS3vBE2+dRKHcB+cc/R3hHt7PSUvn00XHdVs+xBI3bG1UBtJzQXdyV3uZPaafXWxPsy7UbhC1IDkypfAEqjzZIjVnC9S9UDf5nm4z7j7bqjqMPSPISayvO7W109dht9eCgnVmkZRKL6fMSiDtwp9QWb0uh6vEKV4TbC5DUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SjWBzuTnXZ1Fx0OQkfscCoTWMi6ynYPWqzD6kyhRmw=;
 b=JOuedHlnL2Y2TQHa962F7jUCYLNeZ1LeXHdVZgo23t/gU4u2zc6kIYNjH1wK9KnN8mJ4+0BXNTvN1CdjORYqiaP7Gjp1aXiLD+gBsYSs1joQ0/Lc6CwPA7ZFNfVo8WNIImU7lHkAgp2P56I+7ylTm+8XLSuZZaL+CnTo4eZrj85H6YzBuzD9kqmagInEo/6p2h53k+XPUJkAJ7S++qDha1Rr5eGBshFcOXvHI21jv4PgLgsi08wH7+DIYu790rx8mQ38b/fHG9qnvT/CUaPKKI1LEUu8sC0CJMRL4Hb+v9AGWw85XwNutdYHy6zAR+twTSo93MIW1LSwYJ9e/QX5xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SjWBzuTnXZ1Fx0OQkfscCoTWMi6ynYPWqzD6kyhRmw=;
 b=IrL5s/Ne0m8WVtWlyO5rV5m2UJEk7UfnHUiOdsoiqt3boOv9DOHcL8SLXyF2u0OUPDox/6tRm8vQxL9zRM7XOBUH/5EmJr0CZaZZ7VHCZRd5isWkWmzKAHffdbzx3yg2sUTu9EITyW3w9bac9cCeYcrO9F1Ia4cUElEdQmBOOVE=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3103.namprd11.prod.outlook.com (2603:10b6:805:d7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Fri, 1 Oct
 2021 08:41:41 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213%9]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 08:41:41 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v2 03/35] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L3233F and MX25L3205D
Thread-Topic: [PATCH v2 03/35] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L3233F and MX25L3205D
Thread-Index: AQHXtqAoMwy3SmlfCU6Q6smkBlmSDg==
Date: Fri, 1 Oct 2021 08:41:41 +0000
Message-ID: <970e427a-953d-cd3e-da80-84082a03333a@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-4-tudor.ambarus@microchip.com>
 <e41e5aa88846c87d041e3c3ea7845202@walle.cc>
In-Reply-To: <e41e5aa88846c87d041e3c3ea7845202@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ceb930e4-1682-4d37-de54-08d984b74aa4
x-ms-traffictypediagnostic: SN6PR11MB3103:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB3103D0A3CEB1E511736C20C6F0AB9@SN6PR11MB3103.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yZ8jFV1fp9Nmskpr3xynzDbxSMDTLvJpYltt0/s72bWZMq0ugDzz+aq8uikR5VDtNoy2HLfUBUo7MuIh7b1wRCiHjSuypRik0BQIoykV1zNZD49h/mmgVW8xpVz+GbjRMX9N1hsZT9ekHGF47zpmlOoWbDSrdEvNDROdV3Y+cV+Jf9yn56tzk0Z3fiIrGrpB7m9rZ+DNMR8W3cwd9fWstxBivaLrLfOkq/I6n9LKtf1g1LL34yAYNOqc94ZQnEc4ncJm4wOuf3LRVtRe8jVlDMotCRLxP7CJ4GjTDSs1qdZGJ5Ano10G9p0MNxr1FA/S/VVdZzgPIxUdXXKf4EtDLQFVyNUFUg1TTrAUPWTSQbUEL0OsRJC5LhDrxwnLG8gdQBM2Rej5rdSR+fPXAZOZwS1nqN+EuivZ/oakKg4NboZaimjLiYpgn7ZqjlqRazAB5KbSuhSg+YkFgt/1h1hr8vj7zP8hQDp1J+2j8DeIdOVAx5jupye7wbavK+DeIn6zsgQNEwe85y8dnglckTy9n/RWTGF/hZQz4M5xxyB3BJhPjl0qgtCdeC/cqA/s7N6M8fgMdo6FfawM46rjhO83K+2qsAv3MYfs6X+YoE/Z7zD7+TYGrR/eR71SLn5gdA0K92CQ7EEk9cnf9pHArwfF85uRIIaqlCIR1GVat3J6xgXd40hCqP0WFShsj2R0S8IHixZZgONeoWS1YdDl9iOkgbAuvKwGTVs9Lxx1tzdZ/q/rM25K5JZZN9YgK03928ZLw+/pZ7XKWGMQl+kEocV9Tg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(6512007)(316002)(38100700002)(26005)(8936002)(38070700005)(2906002)(54906003)(2616005)(31696002)(7416002)(36756003)(86362001)(122000001)(8676002)(31686004)(66446008)(6486002)(107886003)(71200400001)(66946007)(6506007)(6916009)(66556008)(66476007)(53546011)(91956017)(83380400001)(76116006)(186003)(64756008)(508600001)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cit2Y2xuMmNRVXQvbjNWZGRTckF3N0NKT1pQMm9aSDl2NHcrT1pzaGFmS3lu?=
 =?utf-8?B?TkQ1NkdnZ3dvZFJVcCtJelhJbjVZNnBVblYzdDBFdzVzYWlVOFluRGxDUk5B?=
 =?utf-8?B?VUUrNSthbGd6ZFBVNEd1K0IvbXlHSWVYT2FZZW90YU9ndGJucVpKUzZMdFVs?=
 =?utf-8?B?L1ZXcDJDeHZoOHpSajNoMGx1UUNyTHdYTnllcE93c0E5cFF5Y2t0K2w2Vy9G?=
 =?utf-8?B?R0haQlJ6TTRaQXpPVlNMaHovbkhjMy9jQTcxb0R0a2NWeDFrQ3RuUHdHZkU4?=
 =?utf-8?B?Z0M5L2h1TUQ0ZVp0NmNwRStPa1crckwxMHUxNk5KdFM4cVlKVDJvMzVNQnM0?=
 =?utf-8?B?UGtQejNFQXp4b2Q2MHcweDRjNmx2U2Fqb2JCNWRpWkRGTmVOU2ZLb1lqS252?=
 =?utf-8?B?ME14VkFXMVZGTzRVUEZMUnU0Sms4dVVvclBmbHU5TTRlNGs4U0RQViticzRM?=
 =?utf-8?B?S0R4OTMwaVloTGRzQXIzS2VEbnppeTEzSkFjeEw4Tk1LbEdIaVFvMTlhT0x1?=
 =?utf-8?B?MEZJclcrZDczVTQ2YWtUbVZDdFJhWE84UmVORnE0czRmQ0x6Z1BGM3BLdzkr?=
 =?utf-8?B?RmxXU2JzNWlRRXV0bStrSUowNG53L3BNamhqZmwxRUhxZWQ1RGhaZGhTZDdK?=
 =?utf-8?B?SmQ3VlIvaGZUOE5oM2VVSWdacmg0Uzl4RTluUlQyT3BLTldzNVlBOC9qMDJ0?=
 =?utf-8?B?OFhQOUxNUFVQK1VoRVhZTDlRbGlNSk5KeEpSNGErTkxHcGp3ZXBkQVVOODRv?=
 =?utf-8?B?WmVJZGh5dDQyQ3hQZVFYVHNjQ0xzY2xFNGc2b09VVnBDc0ZITGtNbmsrWkJk?=
 =?utf-8?B?V1lvUitCd2ptNzc0c0NmVHhFNlVVQkdpTEVyZDEwMUNxSHdzb0xXMStDS2NJ?=
 =?utf-8?B?MWloY0hHeDdJaHVDTjdrREQ0eFBleS9xeDBxWHpRcUdTYTlCa0pIandnYmFZ?=
 =?utf-8?B?a3l5NEw4ZStlUXI3Y2RJM1ZLdWJObjJBK2hFeEhOUDB6blVJNUgwRWlMc2Vw?=
 =?utf-8?B?T2kxeHliamN5YXpsSTFhZVBmVlZBaWZuUC82L3NFbkUxR3A5TVg4bmNUTU8v?=
 =?utf-8?B?amhPcFUrcFZiRjFYUVRaQ3JYRHBab2dISytYT2ZEMnJJVFVzSUVldWVXOURO?=
 =?utf-8?B?K01Nb1NSMG4yMnZ0RGRSbnpZQlRQUmRUeEIwMDhMd2tpT1V0c0R2NVF0ZGFJ?=
 =?utf-8?B?UXo5bDJHQ252VHUxOFZNN1ozYUpzQ3V1cGhDdm4rd2JHeXdvUzlRUEU4R2VT?=
 =?utf-8?B?c1FaTklWa3RjeUlqYStKM0ZFdlFVVExoZ2s0WW01dnludXBLRHpKOGxOYldE?=
 =?utf-8?B?bExqa2xBbEtlMk1JdUpuZXpPcHpmc1ljLyt0TDFacXRYZjFYSCtKQnJRTmxH?=
 =?utf-8?B?N1lvMi81YnR2cm9sSlBvby9wa1ZEV2tzV3dDV21aTzE2NGR5b3ZreVBkaHAr?=
 =?utf-8?B?QkpxZEp5NGFTb242dnEvOEFwSmFyS3pic3lRVjNpRWg1NFVZelRmL1pTaUtS?=
 =?utf-8?B?NTh1K3JGV1ZHcStHSEZnaHZoUEFJZnA0Slc0YWlCNlFzQytmajBDRFVPZlR0?=
 =?utf-8?B?aTdHOGtuak9yN2RWc3o2UzdJeXBPOXNQdy9HQ1ZwcW5KSTNvTnNFMWx4Y1JZ?=
 =?utf-8?B?RVVJckZqOGdhOXhORjI4WVhtYngrK2g1NlFJN0tDOXB6YmYrMmkvRHJPam01?=
 =?utf-8?B?M3BJTmNQSjFBOXF0V3BmTnh5YWdQM3IvZmlldXhaVjlBU1luVVlacDNVZlJ2?=
 =?utf-8?Q?ERkm6bzcGXbOC9cI9A=3D?=
Content-ID: <B5FEC9849FDC8F4FAC83E839E973E1CD@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb930e4-1682-4d37-de54-08d984b74aa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 08:41:41.4322 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pexghMq3DXpRAoByFFajKFFLCCVdawPcGOkYBkOdkLR+OX8Vqt3xyAYU0V0bfy5M0s1k3tUyshBlNR8DFUpM5lyJl0OkkdPQ2EYWVAodAUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_014147_720940_3D7C3028 
X-CRM114-Status: GOOD (  17.56  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gOC8yNC8yMSAxOjQyIEFNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEFtIDIwMjEtMDctMjcgMDY6NTEsIHNjaHJpZWIg
VHVkb3IgQW1iYXJ1czoNCj4+IE1hY3Jvbml4IGhhcyBhIGJhZCBoYWJiaXQgb2YgcmV1c2luZyBm
bGFzaCBJRHMuIFdoaWxlIE1YMjVMMzIzM0YNCj4+IHN1cHBvcnRzDQo+PiBSRFNGRFAgb3Bjb2Rl
LCBNWDI1TDMyMDVEIGRvZXMgbm90IHN1cHBvcnQgaXQgYW5kIGRvZXMgbm90IHJlY29tbWVuZA0K
Pj4gaXNzdWluZyBvcGNvZGVzIHRoYXQgYXJlIG5vdCBzdXBwb3J0ZWQgKCJJdCBpcyBub3QgcmVj
b21tZW5kZWQgdG8gYWRvcHQNCj4+IGFueSBvdGhlciBjb2RlIG5vdCBpbiB0aGUgY29tbWFuZCBk
ZWZpbml0aW9uIHRhYmxlLCB3aGljaCB3aWxsDQo+PiBwb3RlbnRpYWxseQ0KPj4gZW50ZXIgdGhl
IGhpZGRlbiBtb2RlLiIpLg0KPj4NCj4+IFdlIHRlc3RlZCB0aGUgUkRTRkRQIG9uIHRoZSBNWDI1
TDMyMDVEIGFuZCB0aGUgY29uY2x1c2lvbiBpcyB0aGF0IHRoZQ0KPj4gZmxhc2ggZGlkbid0IHJl
cGx5IGFueXRoaW5nLiBHaXZlbiB0aGF0IGl0IGlzIHVubGlrZWx5IHRoYXQgUkRTRkRQIHdpbGwN
Cj4+IGNhdXNlIGFueSBwcm9ibGVtcyBmb3IgdGhlIG9sZCBNWDI1TDMyMDVELCBkaWZmZXJlbnRp
YXRlIGJldHdlZW4gdGhlDQo+PiB0d28NCj4+IGZsYXNoZXMgYnkgcGFyc2luZyBTRkRQLg0KPj4N
Cj4+IFRlc3RlZCBNWDI1TDMyMzNGLiBHZW5lcmF0ZWQgYSAyNTYgS2J5dGUgcmFuZG9tIGRhdGEg
YW5kIGRpZCBhbiBlcmFzZSwNCj4+IHdyaXRlLCByZWFkIGJhY2sgYW5kIGNvbXBhcmUgdGVzdC4g
VGhlIGZsYXNoIHVzZXMgZm9yIHJlYWRzDQo+PiBTUElOT1JfT1BfUkVBRF8xXzRfNCAweGViLCBm
b3IgZXJhc2VzIFNQSU5PUl9PUF9CRV80SyAweDIwLCBhbmQgZm9yDQo+PiB3cml0ZXMNCj4+IFNQ
SU5PUl9PUF9QUCAweDAyLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFR1ZG9yIEFtYmFydXMgPHR1
ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNvbT4NCj4+IEFja2VkLWJ5OiBQcmF0eXVzaCBZYWRhdiA8
cC55YWRhdkB0aS5jb20+DQo+PiAtLS0NCj4+IHJvb3RAc2FtYTVkMi14cGxhaW5lZDp+IyBmaW5k
IC8gLWluYW1lIHNwaS1ub3INCj4+IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9haGIvYWhiOmFwYi9m
MDAyMDAwMC5zcGkvc3BpX21hc3Rlci9zcGkxL3NwaTEuMC9zcGktbm9yDQo+PiAvc3lzL2Rldmlj
ZXMvcGxhdGZvcm0vYWhiL2FoYjphcGIvZjgwMDAwMDAuc3BpL3NwaV9tYXN0ZXIvc3BpMC9zcGkw
LjAvc3BpLW5vcg0KPj4gL3N5cy9idXMvc3BpL2RyaXZlcnMvc3BpLW5vcg0KPj4gcm9vdEBzYW1h
NWQyLXhwbGFpbmVkOn4jIGxzIC1hbA0KPj4gL3N5cy9kZXZpY2VzL3BsYXRmb3JtL2FoYi9haGI6
YXBiL2YwMDIwMDAwLnNwaS9zcGlfbWFzdGVyL3NwaTEvc3BpMS4wL3NwaS1ub3INCj4+IHRvdGFs
IDANCj4+IGRyd3hyLXhyLXggMiByb290IHJvb3TCoMKgwqAgMCBNYXLCoCA5IDE0OjUxIC4NCj4+
IGRyd3hyLXhyLXggNiByb290IHJvb3TCoMKgwqAgMCBNYXLCoCA5IDE0OjUwIC4uDQo+PiAtci0t
ci0tci0tIDEgcm9vdCByb290IDQwOTYgTWFywqAgOSAxNDo1MSBqZWRlY19pZA0KPj4gLXItLXIt
LXItLSAxIHJvb3Qgcm9vdCA0MDk2IE1hcsKgIDkgMTQ6NTEgbWFudWZhY3R1cmVyDQo+PiAtci0t
ci0tci0tIDEgcm9vdCByb290IDQwOTYgTWFywqAgOSAxNDo1MSBwYXJ0bmFtZQ0KPj4gLXItLXIt
LXItLSAxIHJvb3Qgcm9vdMKgwqDCoCAwIE1hcsKgIDkgMTQ6NTEgc2ZkcA0KPj4gcm9vdEBzYW1h
NWQyLXhwbGFpbmVkOn4jIGNhdA0KPj4gL3N5cy9kZXZpY2VzL3BsYXRmb3JtL2FoYi9haGI6YXBi
L2YwMDIwMDAwLnNwaS9zcGlfbWFzdGVyL3NwaTEvc3BpMS4wL3NwaS1ub3IvamVkZWNfaWQNCj4+
IGMyMjAxNg0KPj4gcm9vdEBzYW1hNWQyLXhwbGFpbmVkOn4jIGNhdA0KPj4gL3N5cy9kZXZpY2Vz
L3BsYXRmb3JtL2FoYi9haGI6YXBiL2YwMDIwMDAwLnNwaS9zcGlfbWFzdGVyL3NwaTEvc3BpMS4w
L3NwaS1ub3IvbWFudWZhY3R1cmVyDQo+PiBtYWNyb25peA0KPj4gcm9vdEBzYW1hNWQyLXhwbGFp
bmVkOn4jIGNhdA0KPj4gL3N5cy9kZXZpY2VzL3BsYXRmb3JtL2FoYi9haGI6YXBiL2YwMDIwMDAw
LnNwaS9zcGlfbWFzdGVyL3NwaTEvc3BpMS4wL3NwaS1ub3IvcGFydG5hbWUNCj4+IG14MjVsMzIz
M2YNCj4+IHJvb3RAc2FtYTVkMi14cGxhaW5lZDp+IyBjYXQNCj4+IC9zeXMvZGV2aWNlcy9wbGF0
Zm9ybS9haGIvYWhiOmFwYi9mMDAyMDAwMC5zcGkvc3BpX21hc3Rlci9zcGkxL3NwaTEuMC9zcGkt
bm9yL3NmZHANCj4+ID4gbXgyNWwzMjMzZi1zZmRwDQo+PiByb290QHNhbWE1ZDIteHBsYWluZWQ6
fiMgaGV4ZHVtcCBteDI1bDMyMzNmLXNmZHANCj4gDQo+IHVzZSB4eGQgaWYgcG9zc2libGUgYW5k
IHRoZSBzaGExc3VtL21kNXN1bSBpcyBtaXNzaW5nLg0KDQpvaywgd2lsbCB1cGRhdGUuDQoNCj4g
DQo+PiAwMDAwMDAwIDQ2NTMgNTA0NCAwMTAwIGZmMDEgMDAwMCAwOTAxIDAwMzAgZmYwMA0KPj4g
MDAwMDAxMCAwMGMyIDA0MDEgMDA2MCBmZjAwIGZmZmYgZmZmZiBmZmZmIGZmZmYNCj4+IDAwMDAw
MjAgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmDQo+PiAwMDAwMDMwIDIw
ZTUgZmZmMSBmZmZmIDAxZmYgZWI0NCA2YjA4IDNiMDggYmIwNA0KPj4gMDAwMDA0MCBmZmVlIGZm
ZmYgZmZmZiBmZjAwIGZmZmYgZmYwMCAyMDBjIDUyMGYNCj4+IDAwMDAwNTAgZDgxMCBmZjAwIGZm
ZmYgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmDQo+PiAwMDAwMDYwIDM2MDAgMjY1MCBmOTljIDY0
NzcgY2ZmZSBmZmZmIGZmZmYgZmZmZg0KPj4gMDAwMDA3MA0KPj4NCj4+IMKgZHJpdmVycy9tdGQv
c3BpLW5vci9tYWNyb25peC5jIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKy0NCj4+IMKgMSBm
aWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25peC5jDQo+PiBiL2RyaXZlcnMvbXRk
L3NwaS1ub3IvbWFjcm9uaXguYw0KPj4gaW5kZXggMjc0OThlZDBjYzBkLi42OGY2YWMwNjBiYzYg
MTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMNCj4+ICsrKyBi
L2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYw0KPj4gQEAgLTgsNiArOCwyNCBAQA0KPj4N
Cj4+IMKgI2luY2x1ZGUgImNvcmUuaCINCj4+DQo+PiArc3RhdGljIGludCBteDI1bDMyMzNmX3Bv
c3RfYmZwdF9maXh1cHMoc3RydWN0IHNwaV9ub3IgKm5vciwNCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3Qgc2Zk
cF9wYXJhbWV0ZXJfaGVhZGVyICpiZnB0X2hlYWRlciwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3Qgc2ZkcF9i
ZnB0ICpiZnB0KQ0KPj4gK3sNCj4+ICvCoMKgwqDCoCAvKg0KPj4gK8KgwqDCoMKgwqAgKiBNYWNy
b25peCBoYXMgYSBiYWQgaGFiaXQgb2YgcmV1c2luZyBmbGFzaCBJRHM6IE1YMjVMMzIzM0YgY29s
bGlkZXMNCj4+ICvCoMKgwqDCoMKgICogd2l0aCBNWDI1TDMyMDVELiBNWDI1TDMyMzNGIGRlZmlu
ZXMgU0ZEUCB0YWJsZXMsIHdoaWxlIHRoZSBvbGRlcg0KPj4gK8KgwqDCoMKgwqAgKiB2YXJpYW50
IGRvZXMgbm90Lg0KPj4gK8KgwqDCoMKgwqAgKi8NCj4+ICvCoMKgwqDCoCBub3ItPm5hbWUgPSAi
bXgyNWwzMjMzZiI7DQo+PiArDQo+PiArwqDCoMKgwqAgcmV0dXJuIDA7DQo+PiArfQ0KPj4gKw0K
Pj4gK3N0YXRpYyBzdHJ1Y3Qgc3BpX25vcl9maXh1cHMgbXgyNWwzMjMzZl9maXh1cHMgPSB7DQo+
PiArwqDCoMKgwqAgLnBvc3RfYmZwdCA9IG14MjVsMzIzM2ZfcG9zdF9iZnB0X2ZpeHVwcywNCj4+
ICt9Ow0KPj4gKw0KPj4gwqBzdGF0aWMgaW50DQo+PiDCoG14MjVsMjU2MzVfcG9zdF9iZnB0X2Zp
eHVwcyhzdHJ1Y3Qgc3BpX25vciAqbm9yLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IHNmZHBfcGFyYW1ldGVyX2hlYWRl
ciAqYmZwdF9oZWFkZXIsDQo+PiBAQCAtMzksNyArNTcsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBmbGFzaF9pbmZvIG1hY3Jvbml4X3BhcnRzW10gPSB7DQo+PiDCoMKgwqDCoMKgIHsgIm14MjVs
NDAwNWEiLMKgIElORk8oMHhjMjIwMTMsIDAsIDY0ICogMTAyNCzCoMKgIDgsIFNFQ1RfNEspIH0s
DQo+PiDCoMKgwqDCoMKgIHsgIm14MjVsODAwNSIswqDCoCBJTkZPKDB4YzIyMDE0LCAwLCA2NCAq
IDEwMjQswqAgMTYsIDApIH0sDQo+PiDCoMKgwqDCoMKgIHsgIm14MjVsMTYwNmUiLMKgIElORk8o
MHhjMjIwMTUsIDAsIDY0ICogMTAyNCzCoCAzMiwgU0VDVF80SykgfSwNCj4+IC3CoMKgwqDCoCB7
ICJteDI1bDMyMDVkIizCoCBJTkZPKDB4YzIyMDE2LCAwLCA2NCAqIDEwMjQswqAgNjQsIFNFQ1Rf
NEspIH0sDQo+PiArwqDCoMKgwqAgeyAibXgyNWwzMjA1ZCIswqAgSU5GTygweGMyMjAxNiwgMCwg
NjQgKiAxMDI0LMKgIDY0LCBTUElfTk9SX1BBUlNFX1NGRFANCj4+IHwNCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNFQ1RfNEspDQo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIElEIGNvbGxpc2lvbiB3aXRoIG14MjVsMzIzM2Yu
ICovDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5maXh1cHMgPSAmbXgyNWwzMjMzZl9m
aXh1cHMgfSwNCj4gDQo+IFNob3VsZG4ndCB3ZSB1c2UgbXgyNWwzMjA1ZF9maXh1cHMgYXMgbmFt
ZSBoZXJlPyBXaGF0IGlmIHRoZXJlIGFyZSBtb3JlDQo+IGZsYXNoZXMgd2l0aCB0aGUgc2FtZSBp
ZC4gVXNpbmcgdGhlIG5hbWUgb2YgdGhlIGNvbGxpZGluZyBmbGFzaCBoZXJlDQo+IGRvZXNuJ3Qg
cmVhbGx5IHNjYWxlLg0KDQpJIGFncmVlLCB3aWxsIGNoYW5nZS4NCg0KQ2hlZXJzLA0KdGENCj4g
DQo+IC1taWNoYWVsDQo+IA0KPj4gwqDCoMKgwqDCoCB7ICJteDI1bDMyNTVlIizCoCBJTkZPKDB4
YzI5ZTE2LCAwLCA2NCAqIDEwMjQswqAgNjQsIFNFQ1RfNEspIH0sDQo+PiDCoMKgwqDCoMKgIHsg
Im14MjVsNjQwNWQiLMKgIElORk8oMHhjMjIwMTcsIDAsIDY0ICogMTAyNCwgMTI4LCBTRUNUXzRL
KSB9LA0KPj4gwqDCoMKgwqDCoCB7ICJteDI1dTIwMzNlIizCoCBJTkZPKDB4YzIyNTMyLCAwLCA2
NCAqIDEwMjQswqDCoCA0LCBTRUNUXzRLKSB9LA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
