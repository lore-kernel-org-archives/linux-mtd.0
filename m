Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79432C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Mar 2022 16:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cj+UROY3Y8s2u8EceM6D9ufO3p1JIlGrwXdLFLw5zxk=; b=xTR6h7uaxTxvUh
	xknBK3YSvSwGL7bFLbqswK02tIEnIBTGY4fxBIeoXkwxfVFD1dsEfvFFjJ0S2vk+JV5a9LU31TbxX
	YvUTuFt0LlPOwFZ6cwrlspjtZyoJVz/W27IlZIvSUUvX2/EIfJcQr3UyxGI71dIjQVfWKB+O6iH4k
	wWh7R3Ms6bE47DK+2PdtBTg99rQATiftFsAAEjxiDjVNWvysFmHNmp391iRfOaanTh/rdA3IK0JVG
	D2K7/G9vyTP7kc8zOl9EXW+dGmUXy4yY4hERHEv348H2gVgM1lOx+4YyjCUWKc2KQrz97crOqYgOS
	Mgy1UKxhDHF0Sfrag8Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRce1-005CCy-7z; Tue, 08 Mar 2022 16:25:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRcOM-0057tr-CJ
 for linux-mtd@lists.infradead.org; Tue, 08 Mar 2022 16:08:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646755734; x=1678291734;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=pWOAq488Xvvhf1RHTaQKN6WEodh7i5cAAQjswpbB8Es=;
 b=Nz6zH/UaGKcYog49rN4eaf3FJJ24aPxS4owP1F/PJnietw4G4/u66Zh2
 Wpc5GVvTzzI3Cx8afiUVOqN/oqsU3HNn/1y9mbQvJ1zVaBdwsMwiPO8Sd
 iXqHISDZ3rqMjdVYGvYo3Ql61NFh6eVLcnfmloCaa4sIKx4xA+S1dhO4l
 /8/b2q4Q/mSZfGcGl35NsPOQraHVHNcXqGDByyLjOQHOn9OBZdoycPJJq
 xAysci3BstBMqPL1avNPXo4+pQUYJjeNJUIqGuenwGjHwMdNJWqZv0uc1
 GHS09Vlrrwus4Yf351Qungu11ARCxAPkNQ967nZZOMRBF27Z1t1FowUYF w==;
X-IronPort-AV: E=Sophos;i="5.90,165,1643698800"; d="scan'208";a="156128934"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Mar 2022 09:08:52 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 8 Mar 2022 09:08:52 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 8 Mar 2022 09:08:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCx1LL0g1m7T+tjcxo3vvw3KDcHkngbKnWasXpIwhQTxQeXjf9gUCthDH8+aCUHwQmTq52MVwD7bIeFc8LAQnKNlOzNVws8fbYbYD0/m91lJhDeF4BLa79qmc7KnyC8FanWDHJDNE8dCrkgv8nveX3O0GvGaDweuC/XC2V6fmLXZB6LqmFlkkUUa+I1SAEBCOkUx5CMQw3dvPl9HDDwMILZA5zqTWoKw9AuL3UKsWmmgQ67F0Svz6ySJINsh/OCrKSXNTMrMdxVM7mhY+INks8s3i92fSIGAPQ4+4chy2ILSG3U1Qin555nkamjE7Mu8nLTWcRiibKwW0WfLjtpkzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWOAq488Xvvhf1RHTaQKN6WEodh7i5cAAQjswpbB8Es=;
 b=d8YRKxwFjtmwju5F8W0n4+qzsvQ3wKq7fmf/BkGVL2g9CNgAZDSsPzYJCKyz0xAFSrIwCqz92JSYgx6pVk4S0OULb7/pYPWYp54lBtb0jXTFHhbqpPfiLxILNtML6v60jUywoja+nQcO7wNv9CKNGX7I68LEr4tYOD8jdHVS5zmP8A56GYsETnXioPM1OO+jpoHVjyC0zaXgTMLXNRC4yBqw8u3NHQJGUqICMiQnKPdKR3FA8mYMTTVEPJ8mWxQUcnh3Nse6R1BzMRNnpK29/pgZQzbE11WV4p/YavQWsnpAYCRb6zM1iTtIshZ2eP/1arZKoyIyGGNKIcC7UlVZLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWOAq488Xvvhf1RHTaQKN6WEodh7i5cAAQjswpbB8Es=;
 b=EUlJMHH6CbQlR69urHYBnBQTaDAEs/i2CXlQA+kdhKAsrtR4BSVLWlKpQLgiGd0NwWU/I9dgCV5K/cmD+3m4terehNJ0rL12TYoANplJIuj6tYmYv9Ys+VqHPP8xd2Mbz6fonMCpY54hBmey9nNoAIdQqgmUbnR4QJPrYThXjyw=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by DM6PR11MB4201.namprd11.prod.outlook.com (2603:10b6:5:200::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 16:08:50 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 16:08:50 +0000
From: <Tudor.Ambarus@microchip.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>
CC: <p.yadav@ti.com>, <michael@walle.cc>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>
Subject: [GIT PULL] mtd: spi-nor: Changes for 5.18
Thread-Topic: [GIT PULL] mtd: spi-nor: Changes for 5.18
Thread-Index: AQHYMwbMjTd/2/1PUECZUT8llAzFDA==
Date: Tue, 8 Mar 2022 16:08:50 +0000
Message-ID: <417d66fc-121b-6bd3-1dd9-b85c45cf30b9@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1c0e6b3-c06d-4aa0-ac72-08da011def67
x-ms-traffictypediagnostic: DM6PR11MB4201:EE_
x-microsoft-antispam-prvs: <DM6PR11MB4201CED138401A2D32F87841F0099@DM6PR11MB4201.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jMve8uUzDC7fhqJ+mM0OfFw/iW4kaXmhqDUEPYCKFCY3dqiEbEp50tsdTHZoYzuzjV7U3smQRhhCD89/0VmDff27OebXhrNCiupB7v0PtefcP/jOI0SxH+upFgSxYTMhcV8BicXiku9eHudrlHDF2/Wmy34j+t6N4Jy1piSetqEj4Yb0yLu205eair7yqgNCC5kb+a/lHN1c9VDhvfLbHU4sYJrG2lxxTFzhcDphZWpigf39KBSpccu+7c+dEwssXjIrF2C8lbKRjxTTshzU0Jb2g+LitnQvmZRnjI8O7c/OrmrzAvJJUYV+btZOlsqbk347xo7x1gPistI0wwYYyS04kHY/POKSVg0m6PwSxF8s/M3ZBjtB1O1BEL831MgcgBblina6+kFVqYA9Wu6sjrnJH7rHEquTUk9bkRR4TsHbSirRvynSpCaLDRsXrwiT4QHqI7zqIcHIElK7oS2uQfgbhXwD0veoYUYoohj46rrMdpZSSQ0FjdoTSw9B5Q+unnlawrviuDXWwWveL2lXicvd7kMrEm5g4arVe1DHGe4/6fP5wwaump2grOTd5xvjJHK4QjulS0AKYtJhXlvnSNDnpIhoO6ixX1qYnW7Au38L0bzL0D4QKXgZrb51ebaL2c5Jy4rk06soDfZWgpoSvzxtujuoeXA/2T14oFbhet5B/iuD5K443QA8j94bX1ZaxdhP7Rf9wCB87oGW34MV3Ev4cKqcd58DtCm0e6RHL43QOSQN+nItub9/5L9xBpu/bT4S3mjfoOuwuDlIpDhR/w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(2906002)(8936002)(122000001)(316002)(91956017)(31686004)(6512007)(508600001)(110136005)(71200400001)(54906003)(6486002)(6506007)(5660300002)(38070700005)(31696002)(2616005)(38100700002)(66946007)(186003)(26005)(8676002)(64756008)(66556008)(66476007)(66446008)(76116006)(4326008)(83380400001)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N0xuaXNrbE4xU2FQOEtKOE5FNk5VVCtVKzR4UWpHVFpaa1I1QXRidkEwazFL?=
 =?utf-8?B?REJ6M3ZnNGRqQTVIL2ZQU21LRmpUOWxTcWFpclBaMWhqbEgxbGVFb1p2dHZo?=
 =?utf-8?B?a2NXdlNWUWZWK0hEUnkxOW9KYjJVUlNPWHVsVUJvdXBiZ1NxUG11SmZSMDcv?=
 =?utf-8?B?QVNiSjlrMlljckQ1T0w1R3pTai96cmdNTU9vSE8zT2p5L0FrT2pONVprd3pB?=
 =?utf-8?B?dEoycm9GSGZrVGMvZnAxNW5ublRNdHo2RGFjTVphZFcxUlk3NmV2R25Pdk5X?=
 =?utf-8?B?aFczSFdtaFY1Wk5CWGM5cHNWWEQ5enVYaDZwMTZneDkrUHNKditCaVVPMFhD?=
 =?utf-8?B?WGx0Qno1YVdFNmRTV1Q1dXROUHUyL0kvdHBCc3RiVHQyRlpJa2ZOa2xzWTVW?=
 =?utf-8?B?THpTL0xnQm5YeGpPYklsYWhrMjNTdlFwMUE0aUFId1gzOGp4QXdPenVJa3R3?=
 =?utf-8?B?MGZQN3d1ZC9iZXlZOXZ1NCtLbW1tNUprSkFic1FYQ0hkYnY5SGFIbXM0M2Jm?=
 =?utf-8?B?SmFKTXZFOUd1NTNGUmM2Qko0SW5uNVU5amhXZUFCTmF2TmV3NTBIZzJHaHJh?=
 =?utf-8?B?MmZ6dUwrSTdCUG5vMFVHSGFReGs3cGNLU25DdVZGUWc2S2JhbUdQeUtubmtS?=
 =?utf-8?B?QWZiS2RSL0JLV2c1Sm1vMzZENXNBWWlTUUZpTHdoS3JjWTIzS0tHRGVxS25W?=
 =?utf-8?B?UEpvZTZ3endEdDJlbm1Ua0tRdVpNMG5wTWdaZFZXTVQvL3IwODdYQTZEcno3?=
 =?utf-8?B?NEVCMHo0VUZiMVhJVGtYRkNGb2xQcXpQa3dYUHVHVUZCQmlRRXBjdjE5VGFh?=
 =?utf-8?B?UUNrY3lOM2dVTXpTS0xrZVljakZhRGFsakdvOWtUWisxYy9HVGlIYzA1Z20r?=
 =?utf-8?B?SHloblBKbGhza2Y3U3dTblRveUdYeHNzcmhhbERSUmJaQldIUnlqMDAxNnlj?=
 =?utf-8?B?bUVCN2p3cmk3MUtsbUdHQmZJRW90bWhqVFJuWVF4R0tjZS96SXJPdVBmdXpu?=
 =?utf-8?B?MkNjZ1llYUNvRURraWprUlFSUkVYNnJzbWRpaFQray85SHlwN3dWMUV5NVVn?=
 =?utf-8?B?ckJLYzVOM1A3S0dqV2t3aXplQ0ZvQ2VyWXI1eFdrTU8zMkF2MCttT2U2ME5x?=
 =?utf-8?B?bWFwaU5ZVlpYUU9aQ29vUm9ONU1BNVE2QXBnU0JDeVdOMHJwa0JXSlQveTZz?=
 =?utf-8?B?d1RWQjFNSVdZOVlWaXJVMDlUOER6VzZmR2hVNFhnMGxMelZBR0xYL1pYQksz?=
 =?utf-8?B?bC9UeCthZ3JXUTNTTS9rWWp5Qmw4Q3l6cmVuczhBMURabXg1bHRYaUxDbHJK?=
 =?utf-8?B?dUdKbU5qdlBTUXRERFpPNHpBbGFHSHZsNHJEZnAyWUIzbjh5c0JXeEQvMDBz?=
 =?utf-8?B?blRHOTJYZS8wNXpweThoOXpmdjJPRXk0bnpoN2JlTFpaQWQzMU9OSW1jb1Qx?=
 =?utf-8?B?T05WSkJSbWRnby9zeDNNZ0xzdHlXVTNvOGZiSDBDS3JCc3crQ2ZxMEl0WFNO?=
 =?utf-8?B?YmtTMFYrTEFKc1RiMnhPNHdXR3JxWVdQN0dYanFsZWpHbWhLQk05RHo3K1Aw?=
 =?utf-8?B?N0dwb0JGL05VNzFpWDhsKzhkRXlwTnAwYW8rWWRMUXZLTjArNGM4Rzh3SVdZ?=
 =?utf-8?B?dEFVajcwNytrMWdiOGVqYkRiTTlPRDRZalFuMEpSTmF2ck5wellDdExaZkVL?=
 =?utf-8?B?d29OU2lTdWF1TGJvNlVLS0RWdzhXc0Y2akpjVjhwWnFiQ3lCa1RqSWlwNFp5?=
 =?utf-8?B?Qm1QVTBzN05oU2VwdWJybExDbjVQNUd0M1VPSE55ay9YQ0tsOC9sYjNCWlZZ?=
 =?utf-8?B?a0xMVnkzN213V2ZiaWlnakF6VFExN0RSNXBReDVXZjZmUUxvUjdIcXg1V1N4?=
 =?utf-8?B?cERpaVd3eXJmME5KVXQxcEdLK3h0M24xc3NZOVRKd2g4Mm53RzdyZXAybVlC?=
 =?utf-8?B?dXhBdjRkWkdaOGZnRWN3Zm9Tb2llQVZISzFnUmNycHJVeTk5eElQQ29IaGhv?=
 =?utf-8?B?Sm8zR1JEQVBlSTg1OHVnT0FsVVFwWUxMZ0F1VlF2aDBJQlA5clJzaWxVV3hE?=
 =?utf-8?B?SGJ1Qmg2SSsrcklZc2JlQWladWhnZnMybzFudFVJMVpaemg2VGJkKzE5bkgv?=
 =?utf-8?B?R21jLzN6b3B2QkczSzFYQVI4RmlYUDFFTWEzTXNHbEdXbElLeE5PNlJLREFG?=
 =?utf-8?B?eWRMRjBoZk5QWVQzVDdRUkI2bGpOZFVmeUU2cjVtVEZzcTAwWDlYYnNlWi9o?=
 =?utf-8?B?VlQxUk9CR1U5bXBBK3FYTDlScUVBPT0=?=
Content-ID: <837A6E3FA5E3F0459215318372D94D90@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c0e6b3-c06d-4aa0-ac72-08da011def67
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 16:08:50.8106 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 80zXYSN281exHuA5asqC91nWedI/ezi0v6YNo0sh2PznPO+ltLMWH9SirZsN+dmGdLdJ/1qB8ZZ8s3dQSFyYZxPzRvoFL/Dx+W0N1Gp7NMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_080854_535718_9233EB21 
X-CRM114-Status: GOOD (  10.28  )
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

Hello,

This is the SPI NOR PR for 5.18.

Cheers,
ta

The following changes since commit cfb92440ee71adcc2105b0890bb01ac3cddb8507:

  Linux 5.17-rc5 (2022-02-20 13:07:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/for-5.18

for you to fetch changes up to 151c6b49d679872d6fc0b50e0ad96303091694a2:

  mtd: spi-nor: Skip erase logic when SPI_NOR_NO_ERASE is set (2022-03-08 10:36:56 +0200)

----------------------------------------------------------------
SPI NOR core changes:
- move vendor specific code out of the core into vendor drivers.
- unify all function and object names in the vendor modules.
- make setup() callback optional to improve readability.
- skip erase logic when the SPI_NOR_NO_ERASE flag is set at flash
  declaration.

----------------------------------------------------------------
Michael Walle (32):
      mtd: spi-nor: atmel: unify function names
      mtd: spi-nor: catalyst: unify function names
      mtd: spi-nor: eon: unify function names
      mtd: spi-nor: esmt: unify function names
      mtd: spi-nor: everspin: unify function names
      mtd: spi-nor: fujitsu: unify function names
      mtd: spi-nor: gigadevice: unify function names
      mtd: spi-nor: intel: unify function names
      mtd: spi-nor: issi: unify function names
      mtd: spi-nor: macronix: unify function names
      mtd: spi-nor: micron-st: unify function names
      mtd: spi-nor: spansion: unify function names
      mtd: spi-nor: sst: unify function names
      mtd: spi-nor: winbond: unify function names
      mtd: spi-nor: xilinx: unify function names
      mtd: spi-nor: xmc: unify function names
      mtd: spi-nor: slightly refactor the spi_nor_setup()
      mtd: spi-nor: allow a flash to define its own ready() function
      mtd: spi-nor: export more functions to be used in vendor modules
      mtd: spi-nor: guard _page_size parameter in S3AN_INFO()
      mtd: spi-nor: move all xilinx specifics into xilinx.c
      mtd: spi-nor: xilinx: rename vendor specific functions and defines
      mtd: spi-nor: xilinx: correct the debug message
      mtd: spi-nor: move all micron-st specifics into micron-st.c
      mtd: spi-nor: micron-st: convert USE_FSR to a manufacturer flag
      mtd: spi-nor: micron-st: rename vendor specific functions and defines
      mtd: spi-nor: spansion: slightly rework control flow in late_init()
      mtd: spi-nor: move all spansion specifics into spansion.c
      mtd: spi-nor: spansion: convert USE_CLSR to a manufacturer flag
      mtd: spi-nor: spansion: rename vendor specific functions and defines
      mtd: spi-nor: slightly change code style in spi_nor_sr_ready()
      mtd: spi-nor: renumber flags

Tudor Ambarus (1):
      mtd: spi-nor: Skip erase logic when SPI_NOR_NO_ERASE is set

 drivers/mtd/spi-nor/atmel.c      |  81 +++++++++----------
 drivers/mtd/spi-nor/catalyst.c   |   6 +-
 drivers/mtd/spi-nor/core.c       | 268 +++++----------------------------------------------------------
 drivers/mtd/spi-nor/core.h       |  70 +++++++----------
 drivers/mtd/spi-nor/eon.c        |   6 +-
 drivers/mtd/spi-nor/esmt.c       |   6 +-
 drivers/mtd/spi-nor/everspin.c   |   6 +-
 drivers/mtd/spi-nor/fujitsu.c    |   6 +-
 drivers/mtd/spi-nor/gigadevice.c |   6 +-
 drivers/mtd/spi-nor/intel.c      |   6 +-
 drivers/mtd/spi-nor/issi.c       |  10 +--
 drivers/mtd/spi-nor/macronix.c   |  14 ++--
 drivers/mtd/spi-nor/micron-st.c  | 259 ++++++++++++++++++++++++++++++++++++++++++++++++------------
 drivers/mtd/spi-nor/spansion.c   | 168 +++++++++++++++++++++++++++++----------
 drivers/mtd/spi-nor/sst.c        |  44 +++++------
 drivers/mtd/spi-nor/winbond.c    |  29 +++----
 drivers/mtd/spi-nor/xilinx.c     |  97 ++++++++++++++++++++---
 drivers/mtd/spi-nor/xmc.c        |   6 +-
 include/linux/mtd/spi-nor.h      |  18 -----
 19 files changed, 581 insertions(+), 525 deletions(-)
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
