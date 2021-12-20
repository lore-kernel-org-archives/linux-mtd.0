Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC10C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Dec 2021 07:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/OUKJNYvrEQyZZ9FtrJoV0mLfVMoOSv/WuF358PbHw=; b=4t8GvO0IzZ0QV1
	WRb3VlXYaueA+KvU31yxr8X0orMS7Fk7SfyEb6riAPZhSe4LWTJ4Q/p/wucxT1NfeKoOWs/2TKjaf
	xGrnxLt4M6HesWqNsBCpgjRWyST32xH42sRIRbr3vTt7hPiaiCJ2ETarDwq9bkABESxKzCWFQY6Uu
	hyOYJ+JoAloMU4WpFP6r8SSO1qyYpPZh/zBW7giZsbYRNP0HNSbJ/FaZ1HyF9oO+FGiLAMuCu+aHu
	Xd/5/DC4mtv5t2BXZUxbFc0WA/cp24/4oZ2Rt9OvzIUSWvz9UnzUP6XdasmHSmsFxpcBoi1CghbFy
	fulEoNRzI1kCs4ITV3fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzDMV-0014V0-4z; Mon, 20 Dec 2021 07:45:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzDMS-0014Tw-6z; Mon, 20 Dec 2021 07:45:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639986333; x=1671522333;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=uMeHPmQzvA1oBwZ57Z/geH9QALMA7vAYy8wZP3fG4JQ=;
 b=OKr/wQscXGmTs46q3KpQh01hLiaHgZoHPyXHZCpOlLZaIN3BKF+4ixt7
 1h6vuufVCNsIa2FkIcfw+/LYkymEw/UrBBBMdr8hSXDHrbC9KUTomqJt/
 JoraJBtlLV01ZKDMIXlv3qZsGSs0ulbXkMWrJI+1xwmKbBU/kaTZjqU5D
 HyAPMPtoEeX8JTPesqr3dh4Eca7Gqhb6R/Ve0+G9mtqly/81WVBhVN+Kx
 qZZipCb/GU697QxzCDfwgkfn3F8agLxP/MKL+QPPCK0//Q6W55tj0ALi0
 vIg1AO2iXxij2K14xq7mLOXHDiM1hTku238+c8SDWMX3oWuDvburCMphI g==;
IronPort-SDR: 76Tvv3jkT0Ti3cwFfJV4hwLO0jAut7UknB8n2RyxWitVTopsffBihDtAvmBkWs3YEEk48We7V6
 /67uw2T7gR/F0cPYBD0hw7toC8k6+4FsGIzewo3KxQGUYLQlhcPkC63EZRDUKwgbp7QgP+dJwm
 QDVukBsV/ibliJ8fU2CioFfIHfdOeWrm71flYp+CnpmDpmqHjI1AaU+2l5X6s5yhYFTUMF51Wf
 gkZKsrj0FXkayjHGCJOHqulr+yMm/3QAVtKQQL++es2hXEwpZZT8aS/LI2g+ZvCIM38T6YVLMZ
 4iMvc/QoFVduevOM4ToTg7WR
X-IronPort-AV: E=Sophos;i="5.88,219,1635231600"; d="scan'208";a="147210299"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Dec 2021 00:45:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 20 Dec 2021 00:45:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 20 Dec 2021 00:45:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jk5a0r+BMyuzycF6R60IuhnQKvLUjehIfv7vd9wwGVzB+KX3XIiBxLib2mEvzwuX02CM+elELmrbiYxVGv0jW/c13EuznUFPxdiPCYjvQW3+c75Kzw3zfiA3XBPTfSJOhlmDPP9ScNAKH9TlpV1g67gNgoBv7bxoimlRrpMpxq256rcQDNqffUZ3cw+pmJnjcgBYIkcNVCM55A6gQxyMYbrHGPqcXYKSYd6AW0CdFNfARQ8cqddnAtJDXNMDcd5fq9SLlFZOEIK1QUvjz2l8ZRd9zPDqrNSoj4HKW+krtX3+kHHrO6YY04kXjONCfojQPj1/e+AoxnTmB2qfQd+apA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMeHPmQzvA1oBwZ57Z/geH9QALMA7vAYy8wZP3fG4JQ=;
 b=HXP2KXFJBriaoBcv0/rirxBOvX23t27CO+yHgbV1LW/vTmMtQavuOoFDIzM9CDnrJ1rpLuvUuC9yEkDRju9TyIEejMjs5CL524XWz7gOoIr+SDVG0a5FFYhRMwc0DTZmxERlkdu74vFyjaWWUbWlqVelAlb1E01J8u2jrTsUXSPMgvTeey5Ggo05+ybmy7BBkpbiCArbzgFWacwC+rvqRdD9rALthBwzG+EDnLXUJjcxQM/MSD2OZlVRx7z0s4WuoS/qACW+8Z6J2ckY2hzY5Fi2wCuPLGDqBYVY2ecIz7tp6OhAm+9cZ1n0U9HATCGqciKFtF4f844F+GFX6mlDdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMeHPmQzvA1oBwZ57Z/geH9QALMA7vAYy8wZP3fG4JQ=;
 b=k2JnR6pbPJVDo8AEntrYWODrXMdnr7VDoL//3a6ighX232vhiv13TgWhjlGS6LoCayVHqztCCjcvMIoIoZ/6SzldSpnu0Evdx0smqHgf6Lu2DpxSc12mES1syz16c9RrXViPpZDxbfw8pia9T2xFfOcuj69Q4CusrEPb4FyKMxw=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3392.namprd11.prod.outlook.com (2603:10b6:805:c5::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 07:45:07 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%9]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 07:45:07 +0000
From: <Tudor.Ambarus@microchip.com>
To: <pranav.vaze@iwavesystems.com>, <linux-mtd@lists.infradead.org>,
 <linux-mtd-request@lists.infradead.org>,
 <linux-mtd-owner@lists.infradead.org>
Subject: Re: Fwd: Error Prints during SPI Mount
Thread-Topic: Fwd: Error Prints during SPI Mount
Thread-Index: AQHX8zG79y+/iajeAUWaTh9DxM/SOg==
Date: Mon, 20 Dec 2021 07:45:07 +0000
Message-ID: <ffaa7444-16c2-dac4-86b7-d6165478d301@microchip.com>
References: <505a5ad7-edbc-7cd5-1827-4b717a03a169@iwavesystems.com>
 <a4ae5966-0aba-aed4-a25b-051346412fb3@iwavesystems.com>
 <b70f1535-f052-6686-109b-24083ed1b432@microchip.com>
 <a72e7762-7d8d-a507-dc6f-8f70e91505b7@iwavesystems.com>
In-Reply-To: <a72e7762-7d8d-a507-dc6f-8f70e91505b7@iwavesystems.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c659299d-5d0b-4169-cdda-08d9c38ca4a0
x-ms-traffictypediagnostic: SN6PR11MB3392:EE_
x-microsoft-antispam-prvs: <SN6PR11MB3392534590E0D5CBB9B97486F07B9@SN6PR11MB3392.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:209;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qTJMj7aknBrcGGh7ZwvnG7vsf7s6+7NpmUzaZoO848lILQlXIEDQmrf5mmb0S+g2657GCHm6XCgglJ6q9v7j5aZ2ZnifcThNHCYxlGWvA40DUvxK9dYlfkjlL3wTLvpltx4J/LR+NoGbdOABdUVRcEc2/UHX22/uskkf39I+p0PPQdVGr2Sd/BY0PdWAAPgxqIvtb1f7othoCldYv/zR7W051aRuP8r6MDqrnVhdW7VvgNwUAD5G5nQdUJWGRmdaYMIQ1eUiXKQxlQlqwYIzN7QMvFRrtmDQlRXajqID2525qrtvUjN1vtNrozt6i36igtXGtwHNi5Tqaq4qrR88pkmkpJ7I5BZSfPR4zlmNgt/vpHe0tf/BdCcTlxmg+SVRK34qZtnM9fqkvYJd9QWfeVWl0NueO1m2qYoevD9AK3xlb0zt5fj8RHy8uLhczAgBICe0Zq9yagbEr8B+r0UkCdWVpaORa4joUmdk7QL3BTAmei66SavFboMR/P2O4boZJpsTs0Ym/fx8k3IDH4zshmPup4dwnBCpVn3W/0JdJkARN2GkOBQYrK7Gj8MeY1ySDIG80r+zjowLySstCnzxkF4XNQIUNSIAmzuP2Gs7ORN1LDx5fP3Cyi0Gz7c7IWLhF7waGpS6mxn/JbOxPxJKV2XgE/cOswSrv5Zo249/mot/iUK83unrDjG0DTcYIUaVrabfBZvvCml5pHwol1z9gbPgg+0w3hOqJpAaY0ksRzbn+EjCUCPbM/zcxOL1EN06MyPo2mjidc3O59NUNbFNnQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(76116006)(66446008)(64756008)(66556008)(31686004)(186003)(91956017)(316002)(66476007)(110136005)(71200400001)(26005)(66946007)(83380400001)(8676002)(2616005)(31696002)(8936002)(6512007)(122000001)(5660300002)(4744005)(508600001)(6506007)(53546011)(38100700002)(38070700005)(2906002)(36756003)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?di9LRU8ybDZDRkZ0MDdTdEFOWG1Vc2JhaFFtSkxTeUNGc0hSRVJTc3hsRThr?=
 =?utf-8?B?OGZ3RHk2TG8wU28zbDRXY1IwTnBPWXpFd3NGVC9UdWtCdmMxeTAzajd2disy?=
 =?utf-8?B?ZXA2Wkt1TzZiMmE5UFJUV2o2cDlMK2w1RU1NOVJyUEp3dTFjYkFvZ3BFc0E5?=
 =?utf-8?B?dUIyT1B6MVhodm9MWngrczVMaHk2aUZNVXQrMHlJK1NvNjF6YUZ3eTAvQ1VN?=
 =?utf-8?B?NG56b3hOcjdNSzdiL0k4NWRJTDB5cy9zeGFheGFCVHFLOE4yd1NoRTlqY1Fu?=
 =?utf-8?B?eWhpcXRYeE9sbGZDUWZMQzZZRzJBUHorajhFY2pVVUhhaGJZM3hsa3R6V3Fv?=
 =?utf-8?B?eFUyVlB0cEFiYlhBeUNXMldVSFZwVWhBOWlaMURvV3FtRW1KMTYwZFRkWkJn?=
 =?utf-8?B?YWx3aktCVVYrOCtjbFNVem53M0gwVDREeTdud21hT0JrWmNEa09hYU9DNng3?=
 =?utf-8?B?Y3ByN1I2Q3BmVktMdHpYbFk1N1plSE1BdGN6M0dhdmxzSmc4b0gwTzExTGNo?=
 =?utf-8?B?YTl0M2NRallKNHU5ZU94a3BQT0RrVTg2eFNzeU5zTzV0TVZWVTBEVHpzd2hF?=
 =?utf-8?B?UEVXMXNQS3NNMERBb1lTSFNwYi9BWUdodG44NnpLZkpVUUZaaEJHUDNnMjVU?=
 =?utf-8?B?ZHFoY3F2cThFOWdEcExncEwxYmVyRHFOeFVWQUdRU0RaeDJ3bVJjcUJrRUxT?=
 =?utf-8?B?dUk2TlZ4c2VnK1B2NW56azdZSVRCK3dJZmxEalFtUFNlck9CbW9GL0xrdTZW?=
 =?utf-8?B?L3JVYjVaM0JEQzdIRTNnSXZVRDZoaS9SODNZdzZmZERXaXkzZzVqRkNlTloy?=
 =?utf-8?B?VEVMSWsveVNaS2JnZyt4YUcxQlhkOGxQamVGWXJFQzN1bUk1VFFSZVU2U2dN?=
 =?utf-8?B?a3duVDFQenZ2UHZCVjgyZjJJZWlDcTBDaWxOOHc2bk1aNFE2UzltcjNIVjRp?=
 =?utf-8?B?ZW9HdXBrdmpWSll6dXMwQTJkODZpMUUxdXd2bFhvZ29GUnVoM0RKMkx0Tmt5?=
 =?utf-8?B?UTlXWkwzUkt5b3czeEZXMTdOd2xVeUh6RWZlZXpib1lId3FMNjVDYWpHUVNQ?=
 =?utf-8?B?U1NSdWJSdDRsbGdKNUUyU2FqS1BaY2VhSHI3N2MvVUpoNmhDREd3OGNUUHlM?=
 =?utf-8?B?ODZ4SE1Qd2FkMVUyV3FqN1JCd2xyTjFRNDc1SSsrOWNiTWpDSXp5SElQVjVT?=
 =?utf-8?B?UFZFcm5JMkZ6M0t5d1Raam55UGNrYVM0RXE2QjFmeWtqdGFEdSsrT1d1bnZY?=
 =?utf-8?B?K0dUbUptTU5ZVE5pdTlOY2ZyQnNXUWpLM2pJV2hrSlBzenN6STN6MjhKMTZH?=
 =?utf-8?B?U0VNRVFJbzErV2ZlSVRvOGN0UFhncWF5RTFQMW1RWXZRQ25VKy9tZzZVSlF5?=
 =?utf-8?B?emRBamx0Vy9RdDFTejVqNW9pc2RhNzcvRDV0M2JOaGd6eFUwcmVZclB4ODlF?=
 =?utf-8?B?SEFaU2tYMFk4QmFZYjcrdlRKQ2NBVlAyai8xNDFLTU8xV1pFUFNXZFJnMXhY?=
 =?utf-8?B?Q2c4QTIwZ2dFTWVub0pUaVhNVFBzUkF6ZGQzTmF2ZCtDUld5T0tRRlh1OXI3?=
 =?utf-8?B?MGN2SDk1dm1sd3RRbEdEMzk2cWpCRE9lNksycXVYelFwT0R2by9DWWtkbzhu?=
 =?utf-8?B?eVBxRTJrZGpsY3ptd3l3aXIvQWdVelY5eURnWldTM3NGMEMwL2RzbC9kL0dy?=
 =?utf-8?B?YlhsdG1ibmxGUkdGeXREVm9ySTdCdUlBVU52ZXFLV3dqd2wyWmpHcEI5UDhR?=
 =?utf-8?B?SVJsUWJpQmxia2tCVVNSU2hIWHQ4RnUzTnBYOWVNSXdOZGlpOXB0Qng5TGhi?=
 =?utf-8?B?dG9zbXh2Wk8vY3NDM1pLZjQ2bFpHUjVjRTZobSs2MEdlRkxCUnBrZkZpb2pL?=
 =?utf-8?B?UWM5U3I2dkxtRXRVQ2xjeWNtQWd4SnNZY0FzVW1Qb0lDV3pUdGVJRFhRclNu?=
 =?utf-8?B?YUcwMFVVeUcyMTdienFvNE9iVEZxMWplNThwcVZUMDRDbUFRenRzS1lLNmRI?=
 =?utf-8?B?S3NsajByWVZOOUszNitUa1ZPZDVXZnhPa0I3V2o4emp5aVRiS1JaWjFzZHVY?=
 =?utf-8?B?ZE5YUkFZcjcrdzRTcmlTSzdGaWdVby9aNEhpOUYvaklQQ0FCT0pwSzdaVVpD?=
 =?utf-8?B?MGxjcjUyRllFdy9NcjFkeWNHNTRtVzBqSTJUV095dXIrT1Y3Y2NzK1dXQmVL?=
 =?utf-8?B?RkF4V0FJYndLSTJFSS95N1JoZHFpMnoxcjNIUHdOd1VmZGcwWUlWNlZ4dDhl?=
 =?utf-8?B?cWo3M2FYcUpOUytROVA1R1hZcUd3PT0=?=
Content-ID: <97584357DC807640B19576EAFFB82435@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c659299d-5d0b-4169-cdda-08d9c38ca4a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 07:45:07.3071 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Cbg43ucG52VGggqz6AkAkdLY6fG+e7I6vdMmM+loRkgrLC0eEFZOJ0dohuCbELf2Qvqv1yk2V7KxCHa2XZbOXYYPaVzuZu7Bv9DlAkB8oA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3392
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211219_234532_291149_5DBAE8E8 
X-CRM114-Status: UNSURE (   9.98  )
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

On 12/20/21 9:24 AM, Pranav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi,
> I tried with
> 
> spi-nor/next branch from
> git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
> 
> And I'm facing same issue. Attached the log file.
> 

Ok, thanks. You'll need to identify a kernel version where your flash works
and then to use git bisect in order to identify the commit that introduced
the regression.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
