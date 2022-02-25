Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D9EC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Feb 2022 17:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=scPCRA1O9GVBly0Na7WzVxckL2Y4paoGNLfkN7vC+l4=; b=nkqwFbGldQ7Tot
	fCGCiOXA+gZiXallGx72RqNHqS/R6Bxk7l5KquQVuCYPZndDjxyq7DPol9Nsww6vfbKwA7v1h1euL
	FDHfC4iYdhxpx/N0mf7E/gD0Tan+7yGc6Bk7QgKk2sxi8PegKiJXrfLQMqge8RhYNm7TI0+06tBvJ
	0GNGIysmqa/1lAGorIuiPlJKG1vRoxLKB/O8l42NJCj5ZeM8FiW9eShLN++K3Lja6UPI/WbhASVHz
	hIymNMLsK6A7ZJ9Vi9B2KKkXlPUFtI1UEICvGIgQOt6XmiYquuYOujsg5UemN+O9bnrxK7bWglAiD
	yvQmlcAiwEdmtI0easzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNeFW-006BdJ-9V; Fri, 25 Feb 2022 17:19:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNeFS-006BcO-8f
 for linux-mtd@lists.infradead.org; Fri, 25 Feb 2022 17:19:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645809558; x=1677345558;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wDSiBDmCKpLVt2jIUR5PbJ+58L+uDnkoj+dLHErW/94=;
 b=cOCGfLyDIRSJwWn8yS1Vnin+MOKlm/QrsYLSc0VowGiWr+bjrh7eskHy
 Z3deJcT02ef2nLW9cuthsBZ5TSomzXjke7UZ9g1ns5NgmitQsDQLhun7L
 dmquBiyMLgdne3ovxF7WbQ6dpZtxfphahYAH+8GTgm1iXSt5KM29G3vXu
 qQPlbz77bNRVcSf4AXUVE4pqEA4i67PKWU6zlBWBidotVfu0q82zbjly2
 Z6S5w50E1Jbz89JYtg1G1x3DEO7Gky2pduD5sG79W+do+LX6MoNXJuP15
 hatjoHL3MHwXi6wATYDOdwHfStevfc2Uhw5DDCpb/8ub4WJa96fu2K/bI Q==;
X-IronPort-AV: E=Sophos;i="5.90,136,1643698800"; d="scan'208";a="154924973"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Feb 2022 10:19:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 25 Feb 2022 10:19:15 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 25 Feb 2022 10:19:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g87Rl4WqOXc0IKBbEwQoVOZTDfFIdhNG6X2bDIxJYSTUIz5Ilx5/RRd//gK7mSjZqrNFNnt8HJYkDSROlYGCRcklaz1oIOTxKeLDTcYCrkxwiFa5NSGo/mdViLcsdhxWFLztkwDLHtSrC/KWXEJSUNGmnSENV4lxmJu6BSCnDH6BTSOtQqvOAqMZRWJRUhLkZIMH9uvs+cMmw8WiDz+5XY4Q1d9yIGiZdg4BVr8gXLN4a8Oe3iEXDMcXFN3SuuNRPjG58Khtu7NWLMhMh4DKMNH72Jk0SQBx1CAb/Pbh8zrBV3+NojGt5ykHbx0NHI7k8ieHnylP+PYQFWIxTfAIlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDSiBDmCKpLVt2jIUR5PbJ+58L+uDnkoj+dLHErW/94=;
 b=M5k77+HMflWurrAZv5VcNe6/adJhsxyTdHvdaTkBz76atgMJfTZbw2CVRDD8nie8gyUBZStkMcVeO0X+GHdHwnbt+XzmlMuIdIim/Yedz+E2Met8lX9waT3mfjop6AHIeXSoDIaf5y1RCWwiA3wm8CbN+oOMiKsVAnOtg0br+N28ANUhGi1i2enfvyw9dCkQegp0SQBqXLA5Ar4x5D59TlVsF4yfNkWvHYsbTSaRCCE2XShyt4HGIF+CHZWa83PjyM8QgvISsclbj8W+48FEqTbsctYluUKe9Q5nRS2qZpX6qJsP57nc1ynYcw85HG4jAYfygiQtY5eTuQuIUAhdjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDSiBDmCKpLVt2jIUR5PbJ+58L+uDnkoj+dLHErW/94=;
 b=pYug7r2x+EdB9GUFxpucp74ZPiTY5oqoG1UKTWMNahHqJ9XwPT1xMkULnpSSV7pzTOUDps9u9xbyLxog3TROR7IMudt4pyy73qmJl5yiMLC+htqX1hBF5QuzdBny19RmYrsD5WDCg5RiImbE6Sl/b049pX8gSTmIIOLXDqMjTVw=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BN7PR11MB2643.namprd11.prod.outlook.com (2603:10b6:406:b2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Fri, 25 Feb
 2022 17:19:10 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%5]) with mapi id 15.20.5017.026; Fri, 25 Feb 2022
 17:19:10 +0000
From: <Tudor.Ambarus@microchip.com>
To: <quic_c_sbhanu@quicinc.com>, <dianders@chromium.org>, <michael@walle.cc>, 
 <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <quic_stummala@quicinc.com>, <quic_vbadigan@quicinc.com>,
 <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
 <quic_sartgarg@quicinc.com>
Subject: Re: [PATCH V7] mtd: spi-nor: winbond: add support for W25Q512NW-IM
Thread-Topic: [PATCH V7] mtd: spi-nor: winbond: add support for W25Q512NW-IM
Thread-Index: AQHYKmvNxsxBmNvG6U+9dCklDAOpPA==
Date: Fri, 25 Feb 2022 17:19:09 +0000
Message-ID: <63301527-46ff-b7ee-93dd-12ce9d79008b@microchip.com>
References: <1644578661-21821-1-git-send-email-quic_c_sbhanu@quicinc.com>
In-Reply-To: <1644578661-21821-1-git-send-email-quic_c_sbhanu@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9841d2a0-bf64-4ea1-8ef2-08d9f882efac
x-ms-traffictypediagnostic: BN7PR11MB2643:EE_
x-microsoft-antispam-prvs: <BN7PR11MB2643980454FE6584D44C1FCEF03E9@BN7PR11MB2643.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ko2Pn77+hTfqGuVIypQCpdcaYO0CQvK/obXLZyZ+wmZK5YYWl64eaHJEvyWhnEVdqVJdqhiEHcen3Jid7hXvcqEfT2k3nNHrxUVeMM+Stb98KDb4/OCLD1wGZKkjCpT67I2qoG33jSCsBVpKOpwyAPuNyTA8fypXfRoMZKgpXRERJ37kCy31wkgvxtc/cEahr3l3hXPPFDJij9M/4ZpYyKfgaljHkik0tO2/QiYUsz3nO3J/IAJrWHTMtgHZLvHTyE2TifuqkXmXHuq0JVSdmIA35G6NCcRSC0TuRT7Wk3HcGNbstYBLnERpT54FMUkQ6FQ5rZHT+f+lSuTSaqxvxGAMmQcNsAw88y2N26OWMF9RomW2B01QL821GEVaZm3crH2PVRRa3XeTG6x+Cc0HfYrny8MvdupcJ6PcGUZmSeKUkNt27fn+O67RrjSkuS6CcosL/0rfHYXflKhMt20JGBWdanmVuQg8etsBQDyEvRzb/Vu8V3txbaWvu5b2UAjtbYgaSiTtv9Zjj2eaEji7DFtKOUwziAHqjkaEUw0jQKLu5+FtYPh7dZ/Q2fFicqJdZ+t81I+v5yQ/V7D9jMCkVvSc2yy1eLovjaqW5dPUzf1t3mm5v9stHjzrlr837mr885y81i2B2P/QrjndMypnOF2uHa7zrU5KyC9GvS2Eab8bmTIRRGaRDZsNQzEFo5NhjIkhyqUrbX9A9IwpylBYbVhhOPiyRAocZHGGuiq+63ZIdmVIH/wztC8El8ZRWath64Hwm2mzCcO/dUvoMzM1geujTM7XRb2oAiCa+4Sq304cBFmV0o8E8Lgh/oJ6QDcpvPkffABDMUUxjHhh1jkn0eX6th1yYmZnwQPkruOAMeY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38070700005)(8936002)(7416002)(8676002)(6486002)(966005)(4326008)(5660300002)(86362001)(31696002)(316002)(36756003)(31686004)(91956017)(64756008)(508600001)(66446008)(110136005)(66476007)(66556008)(66946007)(76116006)(54906003)(6512007)(6506007)(53546011)(122000001)(38100700002)(83380400001)(71200400001)(186003)(2906002)(2616005)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVIrMFFNZGQ1QUFHTi9kVFdTNHNZSWFqNVZnY0htemxKUHRWd2wzOVdsejdS?=
 =?utf-8?B?M1dhQ1ZMWFlaUTJ4TVhORzluWW9HbFNvQ3dybFd4dDZUYkwwcDMzenNURjB2?=
 =?utf-8?B?T1BnZHhkUkFDOUpRcGhUeU9jaW53MlJlUkNqVmtURnZxekE3SlBxZmFBVnFZ?=
 =?utf-8?B?Z1JZaWVoNmZQamtNVFR6MW9ibHFjNW9GS1U5c0tza1hnSDRzWHR0RDZDbGlZ?=
 =?utf-8?B?b3VidFFveVBYaExHUmN5aGRscFQ3Rmp5L2VJeVRJQTJWVGRXcWdHMkxXTld6?=
 =?utf-8?B?ZE94Vlg5akZGQmZaV0VnZERad3pSNVFibXVpZHpZb3hiNDAxemxyVGZyM3lD?=
 =?utf-8?B?cVpWWHowcHhEMit3aklPcmRuSjhNQUU5NlVEd3ZWWGwvVWt0MEd2QkhnNlNr?=
 =?utf-8?B?SVN6eUl1SzVRTDAvZlZnR0RNU3pNRHVRY2pqL3RQVzhmdkxTUUxvUlp4QUxu?=
 =?utf-8?B?YzlsR25wV0dERTdONnVteUVBYVRRSjFHYms4QnFQQUhaR2xoY2txbEdsdHRJ?=
 =?utf-8?B?RFVRTGN6OTU5c3lqSkFGeGE2bmVudlZScHBIeVc2Wi9sTmgxTEJ2S1VIcG4x?=
 =?utf-8?B?ZmYzY2FESzBIRjM5c3hQaWdKbVppUjlJdHBVVThpaWZhZ0Vkbk54S2cwNFAr?=
 =?utf-8?B?QTNTN05xU2JnM2dTSXozYVA2Y01MT082dG5NL1B2Ky9lNXNSQWIxdnVCYm8r?=
 =?utf-8?B?aTU5UUh1Y3lNRWVCd1lzUGE5ZU81enVIU0hXTDl3VmZTUmhhZlFwUVo3cFZW?=
 =?utf-8?B?K05YTXU3NzN4OXp0d2pjTXBYV2hkRGJWQ09UT2dlQ3RJV2lQOGVnbEpLSG9h?=
 =?utf-8?B?SWtmVEt2VjNpTm5jeTNLREFiblhmTW5kWXJVOStiREVMcmMzVE5keUh1dDBu?=
 =?utf-8?B?bS9pYW1Td1BmOVhmV2ZFc1FxcnhJRDRKNjBBMWVWcHhCWHhZeHpXN3dhMDg2?=
 =?utf-8?B?UTJ4Z1B1TVJuV2xQMGFvQlRsa1Z3Zy9JcXBlTzUzTmNnVjAveFk3OWJGaFVG?=
 =?utf-8?B?dG9aNk9JOWlWTWVEU1dzT25Hc3lONENtQm9raE9aOHhjZmo4cjBBWENHeG91?=
 =?utf-8?B?T3FYWFdyV0U4RTNoRjBXMkxpb2Faa0lkWkF3MFhMNGpkbm5oUW9IU0lodVYx?=
 =?utf-8?B?NVBmUFd3UnN2VUFXWmNXZ2FQM0RKUkc3UG5ybVJiVVBaMHYxZXBCa2Q3UUk4?=
 =?utf-8?B?QW9wWmVmUVJ6UlVsek5sKzdXV3k3Zm1QOExncWo1cjIzZXpHZHdjMzBGbTQ5?=
 =?utf-8?B?YkR6d0N3T0xLcXBPeHB3TzFSU1hPN09OUGIyV1BKcHB2akxOVDh1VWQ2d2NV?=
 =?utf-8?B?ZGtoOEpIU0VheHNTVkt0d2VZVFc1SnA0TDRKSi9mdUErMXlVcTNzQys0cXFs?=
 =?utf-8?B?TU5vcGZDN1RzSXMvdEFPYU5EV0MrbHNEYWhIVUhON280UGhicDd1VTg4KzBO?=
 =?utf-8?B?N1RQdTJSUGltbytPWkJiTk1mUlozWTJ6RjZqYUFhWjR4SWhUNm54cXZ6dU5w?=
 =?utf-8?B?SjdGaS9PQ0NJT2VaRkt4R3RFWUx3cjczWHl0S2tuUDJ5THh0MTg2R3pYVHVI?=
 =?utf-8?B?dFNPVVl5TmhOZEZzZnJOaU1wakxYZ0NtL0pZdGRmSzN3UjJMZXorQnFXZFJT?=
 =?utf-8?B?Mk9IdHFOODlkeGZMeG8vRTFiRk5Ob25jTDdmZ2Iwdm1pZ2t1MWUvMmJiTE5m?=
 =?utf-8?B?RUZQNXNvc3JTVmN4YzBZNWNUUGNpLzN0Vi9rdjZvNmY5QWRkaGI2WkRGS2Zz?=
 =?utf-8?B?L1YvWWpyU1RjWk5uYzE1bFBzdGFWbDBOdFJSamFtd3lvM2VMQnZXTnJQdEFY?=
 =?utf-8?B?ZUU2R0NNc2d6NkNtVy8rTWZSVEsxclVxQUl3eEZMRk1aaHp4TFdBNnNvcjZ2?=
 =?utf-8?B?OFQvc1M0dEFXTjErMjEzdU5LaVlncTgwUU1iQjZadGRDejNTRm4vRmEwaXlP?=
 =?utf-8?B?STBLcG13aTlCTThvL2R4cmViUnZlOGQ4SEU3SExxTUIxOStudndYallhbUQy?=
 =?utf-8?B?NElCYitZUmZoL3ZXR2RJM1FxTStvbElaTVF5N0M1akZUNmtWQ084SDF0cDcv?=
 =?utf-8?B?YnlwZXZGWVhhRzR6Y1B0VXlXQWFDYTRPNEszQWw3RUtNTnRHOHVhZmZyMnoz?=
 =?utf-8?B?Q20wN0tYTmVzc2krNW1VKzk3RGx2NEI2SFZXc0dtdGtCbnJ6VHNJQTNkZGJ6?=
 =?utf-8?B?N2pHQ1UrVS9sS2lzWlVic1g4dU9oV1JLY2FBSFNLYVlDQVY2eURWSDYvdGpI?=
 =?utf-8?B?Y25YZHNCNzF5VDNpMlUxcWRmc3ZnPT0=?=
Content-ID: <243D939D9A7AA242AA426D03ECD69A74@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9841d2a0-bf64-4ea1-8ef2-08d9f882efac
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 17:19:09.9667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ui0REQGw3HsyLlBGEyZyfoQES7nVUHa2kj099h4xShXynF5bShIHdn3zJv8g8Q2s29jqQIdQDpnEZwyxU9sMhFbJK9lsu/ORkhPbvf3XbZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2643
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_091918_431329_F981250A 
X-CRM114-Status: GOOD (  22.01  )
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

Hi,

On 2/11/22 13:24, Shaik Sajida Bhanu wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add support for winbond W25Q512NW-IM chip.
> 
> Signed-off-by: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> ---
> localhost / # cat /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi16/
> spi16.0/spi-nor/jedec_id
> ef8020
> 
> localhost / # cat /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi16/
> spi16.0/spi-nor/manufacturer
> winbond
> 
> localhost / # cat /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi16/
> spi16.0/spi-nor/partname
> w25q512nwm
> 
> localhost / # hexdump /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/sp
> i16/spi16.0/spi-nor/sfdp
> 0000000 4653 5044 0106 ff01 0600 1001 0080 ff00
> 0000010 0084 0201 00d0 ff00 ffff ffff ffff ffff
> 0000020 6800 6c65 6f6c 7720 726f 646c ffff ffff
> 0000030 ffff ffff ffff ffff ffff ffff ffff ffff
> *
> 0000080 20e5 fffb ffff 1fff eb44 6b08 3b08 bb42
> 0000090 fffe ffff ffff 0000 ffff eb40 200c 520f
> 00000a0 d810 0000 0233 00a6 e781 d914 63e9 3376
> 00000b0 757a 757a bdf7 5cd5 f719 ff5d 70e9 a5f9
> 00000c0 ffff ffff ffff ffff ffff ffff ffff ffff
> 00000d0 0aff fff0 ff21 ffdc
> 00000d8
> 
> localhost / # md5sum /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi
> 16/spi16.0/spi-nor/sfdp
> 106d89d6c049110bc94c01517cb4ce24 /sys/bus/platform/devices/soc@0/88dc000.spi/
> spi_master/spi16/spi16.0/spi-nor/sfdp
> 
> Changes since V1:
>         - Added space before name of the flash part as suggested by Doug.
> 
> Changes since V2:
>         - Updated chip name as w25q512nwm as suggested by Doug.
> 
> Changes since V3:
>         - Updated flash_info flags passing according to below patch.
> 
> Changes since V4:
>         - Added OTP support for SPI card as suggested by Michael Walle.
>         - Updated SFDP flags passing as suggested by Pratyush Yadav.
> 
> Changes since V5:
>         - Reordered flags passing info for spi nor as suggested by
>           Michael Walle.
>         - Added SFDP dump info in commit as suggested by Michael Walle.
> 
> Changes since V6:
>         - Updated commit subject and added md5sum in commit as suggested
>           by Michael Walle.
>         - Reordered flags passing info for spi nor which has missed in
>           V5 patch as suggested by Michael Walle.
> ---
>  drivers/mtd/spi-nor/winbond.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index 675f32c..6fde2ac 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -124,6 +124,10 @@ static const struct flash_info winbond_parts[] = {
>         { "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ |
>                               SPI_NOR_DUAL_READ) },
> +       { "w25q512nwm", INFO(0xef8020, 0, 64 * 1024, 1024)
> +               PARSE_SFDP
> +               FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)

This flash has 3BP support, was locking tested? I would like you to
describe in the commit message how the flash was tested, and add in
the comment sections proofs on how it was tested.

https://www.winbond.com/resource-files/W25Q512NW%20RevB%2007192021.pdf

Cheers,
ta

> +               OTP_INFO(256, 3, 0x1000, 0x1000) },
>         { "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>                               SPI_NOR_QUAD_READ) },
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
