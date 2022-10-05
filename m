Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0FAC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Oct 2022 07:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QIzRNtJd0grQUPPfmte0CZRes6GFZuIK8+o+xA64P+Y=; b=Su1niAYxpOKLZT
	Q9d7V9T44SAfnCbnNhS4kdMmLkJ+jK3w+0FPej5F/Sp9eZO4l5gED/tfNJaX0YRcAQ2hZ5MueHvz+
	y1Gf0wsgoRyAfAdPDfMgYmvMQz3BQgcm7r2tyrH/h9Nvwn/ztSNYJOFce/UeP00kzhoqIV49KS1ES
	htz7kwWFGfA4LNK1I8cVW24gL5xNY4T8sidfbt1VBAJho0JTHuduWFB35nbVd6hcem41fYLHCjCNJ
	/Px5bUvCTQ6mga8Iu9EwLonVp8+IR75LPHdNzcWFxJGapG5xod85iWm0VdtyHZ8DkJD9GKRPaWICs
	i0HP550WuldMSQbCsYOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofyYQ-00CmA7-1i; Wed, 05 Oct 2022 07:10:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofyYM-00Cm8V-N0
	for linux-mtd@lists.infradead.org; Wed, 05 Oct 2022 07:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664953850; x=1696489850;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YcqjQ2F3LbSzRCy/UG4eP4lsISYuRbjW58ELHD/n83M=;
  b=qHRd0P9qRrhwCbOb8KWd3JsFkKs/bVI2HCg4W236eS12B4GcfH62XJm9
   mrIirAkfpeErCduSq/UcCktnutqaIdgIZrNrM/7Dht9rFuTAdTtb5NBD3
   7BDJ2LF8SPc5orS0FqFON1l2mYYBP2w2hxey6tM2wN4a1wgUrVFFaApm9
   I/1mLfYNB9PjxeD+nympFqZDZaxBVTO/kCcIstvD6NAzstp/rds98q2fF
   1430MNVuI/ENMD6KlL2JhQjKgLxEqbVBClLHngZyi9lur/g53p2q8RBDT
   Kqud2mjNv9IvHkTW+XX67k1rvYS+VZg6zK5ZKQmR0a9OvYyJZZr+WyCjl
   w==;
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; 
   d="scan'208";a="180446075"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Oct 2022 00:10:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 5 Oct 2022 00:10:49 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 5 Oct 2022 00:10:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKnQ/19NlwA3P98rLO7NctT587MmOitJxpCz1fcLNB+yb1FeZLFdI7MtWLf15fGIigMnGggOWGkdq9WdSjI9TOrOveRJ/tspEeehQ+/9lFkrVveOJ50gJNpcJ6Hrx5YFbdpAA9/c/WHIshS6lBbWYid9pyJS4npPaXCVj0/wAuLeDUP7rbJ1ZVVcPZ34EvQS+fecQjI1LCOFHqbUcwyDmpRJhtpvFPWZbBA5pI0MhDo5ySPOPGDb5wUHQMbmSyfjIPSO3W/T1U7HHmdBDC1RvhTgGT7iDK68XT35tK832TskvsAsnysXK2AxZjs8cTlehVa09p8EpmvFqhCEDqzdeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcqjQ2F3LbSzRCy/UG4eP4lsISYuRbjW58ELHD/n83M=;
 b=XHUzrcXCBoRZUapSH0tR/fFLdA4ym5/Z3tqNqThsF94Jdsomp4eDdYzWRgh3zUON5je4ozQNUqnePobuePNNkHEQNzF/s1szGB4//EhmZ4xK3mPhYl9L8nB8t2aA1m/GPIqrnXJnogLNdI3Q7uEmcXze2qxvWbCCr3LsWXKd/z7MY1djZ+lZ+ceu1uMQEKc9sp/PLdNrR8vvycHmQGP3Nlbn8VSnD9ChI9JmeKxw8rjwYfBWPf8lc5LA01glaJ3DzkfUOni7iBA5cJhFondHs0j5LK/9+oIEN5p1WHP1Yf7STlECifSHV/Oa4mxXP/ysUod4dnR0q1O0jUyhvs0WAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcqjQ2F3LbSzRCy/UG4eP4lsISYuRbjW58ELHD/n83M=;
 b=Im9bRji1tNSCu4bPNSiK/w3ApYHbXWMz42uRlzmr8cgmO6CD2N8AxbVG6dZ9ruV/XFBKQdCE1eQWCmtQON6zuejHLcwJsHkgIo7NrSgdgomfnKgwBItWkSoWhLHOxXRIGUzNRWcTWCuIw9f5WlYxvXfsB/naRbmn19fx6gL2eGg=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 PH8PR11MB7069.namprd11.prod.outlook.com (2603:10b6:510:217::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Wed, 5 Oct
 2022 07:10:45 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::94df:cb94:4d1:3490]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::94df:cb94:4d1:3490%5]) with mapi id 15.20.5676.031; Wed, 5 Oct 2022
 07:10:44 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <pratyush@kernel.org>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <Bacem.Daassi@infineon.com>,
	<Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: spansion: Discover current address mode
 by CRC
Thread-Topic: [PATCH 2/2] mtd: spi-nor: spansion: Discover current address
 mode by CRC
Thread-Index: AQHY2ImWDl5knglsB0euwdj9/bfg+w==
Date: Wed, 5 Oct 2022 07:10:44 +0000
Message-ID: <bf12251a-dcc9-0d64-7229-5c69cb461fdb@microchip.com>
References: <cover.1660291281.git.Takahiro.Kuwano@infineon.com>
 <53d37eead9bdd09744af555b93381af477643a46.1660291281.git.Takahiro.Kuwano@infineon.com>
In-Reply-To: <53d37eead9bdd09744af555b93381af477643a46.1660291281.git.Takahiro.Kuwano@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6479:EE_|PH8PR11MB7069:EE_
x-ms-office365-filtering-correlation-id: bc1b56f8-b51e-45fe-ccfe-08daa6a0b897
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SWtj83kGMdYVuS1n7Joih0UR1j7ThjsP0wclJ8yhOTPOthzGbBXhBQ9AqPGuC7cYIb1oD9u7tRPatzpi/uihGifn0J5xQA4zlOA/Zxu59EPVRP7lKMMCgSg9zHpDG8SgK5RVt3OdXgCX2+7q+TtOG6LQArV/XZc+HS1uOIP4y5i8pK3m2EKd5yTduJ+kup2RXTdr57r0hufV/obcA9gsA+44oru/x7OB8r/p/m9o1+bkQHawR4ZlSEL6C5f5MmpUy+pwU4JC+tfpKiz6J78NM+mpm6T0wj6ETtVQwqTmlVnARkRaDtAN1FjB50DYNOOO5n0vTxsnoszfGPvXZaHpfRs53zrTKkY4s+ICCglWafem8ASUpVkoKd3w++k3hk1kzQKLIUjag7n8O92eKyJb9aMZyeShExRR0oYqwe1TTvaIsKI5crOGEYMQwosAPCD8AQ6Gl7LhQJkv8d+so861F32cx0jke6vf6OmkPxD8ixBeLrsOicWhmtICjBIGf/HQg7YLZLCGvHyQkMVIEZqajVkCFEzS3qVLcn8H0/OC0/r5g00PiwWRpyxdp9wLmwSNQjVH9XqkBnYXRcfuR4Jnyal7cNzS9mT00KdKv6/MANPdu4xB2QMyrLq/TmkNfoPe939e258CxwcioTe9Nmu4L8BdkG0HEo1UM+N5x9WZcDi/3V/TL2za28c4cNzTu2scdjfjz1KDL1YOvX2puaF8Blias8l4+wYHgYSF+fIbT3PxhQlZisgerfhP6cQUq4//cJrmVppTBPMrzZrYC6eC8V5sAoPQWXZGU0L2wRPqRx9n35qeSjlzI46yLiRLVAy0URJ6zCDpSrLo1lOohb4G4A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199015)(38070700005)(86362001)(4744005)(36756003)(38100700002)(66556008)(186003)(5660300002)(316002)(122000001)(76116006)(6512007)(53546011)(66946007)(91956017)(2906002)(26005)(478600001)(31696002)(110136005)(54906003)(6506007)(66446008)(64756008)(71200400001)(41300700001)(66476007)(8936002)(6486002)(2616005)(8676002)(31686004)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWQrcGs3eU1oa2k0cDY5OFdwcndwU0FtOGo5RG5NcnRlV1JwMmJhZXVQRHVZ?=
 =?utf-8?B?M3JESzZ4cERza1lUTTNYTWR5cFAwMnVKUVpWV3BYbE1rZS9Rd0FsRERYQkZR?=
 =?utf-8?B?cy9wTHA4bHpjcjRaNXVDYzV5Q3ZFakxjQ2xuY1hVS3VoWnVxemUxT1lQc0h2?=
 =?utf-8?B?YkxHUitXUWtiN2xkZFRCZm5YRmUwMThuQzduTEx4VkVKcWcxcFNVK29LZlhE?=
 =?utf-8?B?NWhxV3UzcHVIWHpjVzE4UUNQZTh5MkRsL1FVVmZUaGViRktUMVZwSWM3bG54?=
 =?utf-8?B?VVBPNWlrMzlpSXYzSEVhMGVFQkNNcGdLUUh2STVLQ0pleVl4SGdBS3pFeDRM?=
 =?utf-8?B?c0lETitWVzRTZkFqUGVRRkREYmo1VEhKR1VEVHJiWTNGVmJsVnArYkF2S0lS?=
 =?utf-8?B?eWVBS05wZnVxK3JNYy9teG5tRDNTN3J0TTU3bU1RdE1aWk1tRUNldHlaaWpY?=
 =?utf-8?B?ZlI4bElua282SlQxK29SMCs0dm9hR1dUUnpQQi9KR1c2S0JreTd3ZTNkNzA2?=
 =?utf-8?B?QW1oQWt3VU9GeFkrdThEaHZLNFRPMUR0dktWYzFjSU1oYmxybW50RUJqeU5p?=
 =?utf-8?B?MnE4MkliTGhyOURSTjBOZTVPRGd3ejlZM2FJRkRHRVJHeEhoc1VDUXdPVTJL?=
 =?utf-8?B?VGdWTUM0RjIzLzlyV3Baa2lFRFZzM1VoVWt0Z2JmOWNXdnRGQ01JQnllTXow?=
 =?utf-8?B?d0g4Mk5jNjl1emtSZkZLcDliZW1lVjR3ZmhqSCtnN2VCQnJQUzFIZlV2cFlt?=
 =?utf-8?B?M3hTZEtBalVEeDVLRTNzZFAyQTRwZVQwR3Y0cldjQkhTcGRMZU9Ma1pBMXlG?=
 =?utf-8?B?dGFPM1hBMHlKWENGR013eXAvYWREZ0d3dnJDU3ZCL3dWN1Y2SXM0ZmxHVGdJ?=
 =?utf-8?B?ZjZ3bVltSHpLK2NXRFZVSnliY0dmczl5OWxrSjZQZnhwekhod2QxVngzKy9J?=
 =?utf-8?B?TzRNc0orS2J4SnZZYWZjeThqa0prUUJCdVJUZW0rYWpYMEpZWmhyWTIvdFYv?=
 =?utf-8?B?NUJ3d3JDekJEWWo4NitJZXpwekFhRkpmbFkxRDZTV1FFczRGNnNqZ2pmdHV0?=
 =?utf-8?B?UE5GY0hNVVJFV2YwT05TUlRuUHFKWW9rLzFPZDdYK3R5cUtTanA3elhLQjYw?=
 =?utf-8?B?V1RCMVM5UUlOWGUydXZOMi90ZjhlSFhrUXNqcGNPSVREWlZaR2VDU3N4aEs2?=
 =?utf-8?B?Kyt4WFlmbFQ3Mk9Gb1JZRS8yVFNZaFR5WDJkbU5EbVloMUt2NnZlbCs3eUho?=
 =?utf-8?B?SEpncTd3bzMyY0FMVjMrY0VJRHBNR0NrN0FhUWQ0M2ZJK2V6aHlZalhxcisv?=
 =?utf-8?B?S0ZZVDhJblpNdW9hRnM5OCtLUmpQMjQ5c2dOaDFZM2UrL3ZnVHZpU2grVmlZ?=
 =?utf-8?B?aG4vVjVlTFc1czk3Wjh2UDBrMFpYN0ZndklQcDRJelJsbWhOcjAyOWFBckQ2?=
 =?utf-8?B?RW1iSC9oYkc3bXFIL2VyMHhXQVpMcTlqWGtqN1RIT0pmd2xjSW5MZVo3am1F?=
 =?utf-8?B?QW9wWjY1RFV2aUVtaHdLbVVWcGdTYlNpY0Q4WDdYb05LbG1GWWQ0ZkY0akEx?=
 =?utf-8?B?SnJ6ZS84RWR4amRQV09xZDhKRUQ3WjhSakgvVnRNZHUrcUxtZ2wwRGRGL1h0?=
 =?utf-8?B?RVExR1dPenpLUjZBTlJOemJ1bXVTZW9vaHJ5WWpPTWZyb3NNR3FTcjVPazZv?=
 =?utf-8?B?WGxVZWFuZEZ1S1FhQUZmeXlYU0ZtYUVDYkJpaThpNmJ1ZnhGWXZWdldJY01W?=
 =?utf-8?B?R1hYRDV0bHJ5MitRS29kS0JuRXlCd3RlUjAwLzloNytzaWdGTTc2WVoyeU5Q?=
 =?utf-8?B?VXk2WUZPU1RVNDREZnZubnpOYUVFaDNzV00zUG9jT1lFdDQxYnQrTmp5ZFVH?=
 =?utf-8?B?d1lwWU5wTWw5NlI0bm9WV2E0MG9VVDh1WU1jTnBPSUpOTXZkM1hjemxmY0Ex?=
 =?utf-8?B?NDRUZ1JsYm1VV04yclhYQUhwQ0RTcDdBNS9KZzlQUm1OZU40TVByRUxOTlhF?=
 =?utf-8?B?eXcvckE1aUxKUEI2UVZTRENDOVlTaE9WL3h0T2QvR0kwMGdFVlJ0RE1TQUpR?=
 =?utf-8?B?TXVmRGR5K2hHZTFMMlMyeUorZ3FEYVZ5ZzJ4cFFMYWZISE5aZmROV1g1bjBU?=
 =?utf-8?B?NFJOSEpORUdhZFp2aHYvOGxmZHhOckRib3Z3VG12UVZtNnhvSktUVGNKUmRU?=
 =?utf-8?B?QXc9PQ==?=
Content-ID: <EC6905C9DAFE9A47A68E22DF9C115D11@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1b56f8-b51e-45fe-ccfe-08daa6a0b897
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2022 07:10:44.7812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QfX+rbth7pccyOW/P8zifdEt3PD3G09DE/ujW9WbqTelcquysjfmpBh8Ybbm6Mn7Cl8gv0QrQNe1R3ayQW0ihNUj9fZQUn+Y3HbolQI1BE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_001051_026018_321C52B5 
X-CRM114-Status: GOOD (  10.37  )
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

Hi, Takahiro,

On 8/12/22 11:06, tkuw584924@gmail.com wrote:
> +#define CRC32C_POLY    0x1edc6f41
> +static u32 cypress_nor_calc_crc32c(u32 len, u8 *buf)
> +{
> +       u32 crc = 0;
> +       int i;
> +
> +       while (len--) {
> +               crc ^= *buf++ << 24;
> +               for (i = 0; i < 8; i++)
> +                       crc = (crc << 1) ^ ((crc & 0x80000000) ? CRC32C_POLY :
> +                                           0);
> +       }
> +
> +       return crc;
> +}

I haven't gone through the details of the patch set, but I like the idea.
I stumbled on your crc implementation. Can't we use #include <linux/crc32.h>
instead?

-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
