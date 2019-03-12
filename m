Return-Path: <SRS0=+O2D=RP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFEC1C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 09:29:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BEF6214AE
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 09:29:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WoFk4+ij";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="p76XF1jE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BEF6214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3JDvFfX5/Gk54SQMoSgScxXwBmTMMoxtJYTMbE2xfwo=; b=WoFk4+ij3V640B
	EAZ1xWR4WJGp8JHslTwHYHzyyCTPp8xGS15YmL4dTSIeDjmqxTwZ4Nn+itLuWakXqbF0dsUDg2CEJ
	Qnz80l1bX7XVMXHGMpei3CgtvAL22HvinCiBiTO4kubBUKCQTFnbEmODEfMnt3N98hD9ZX1Unwkfg
	u/Tr5dw/d6pc725Qivbv7R6h9Q4dyJ3DB0WxI9hNtG0BUky/M2CjAHPA82Jot/TlrevQCmyvd/Sjq
	ZYWgnzq+T4bNSFkJYDaoMf8nK7uJlhaKVMiCxw4Q1+Pb0rBurUGx3E0No577Ja1AuHjNPLpAxtkwu
	g6uHg3eEziHURazrfcNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3djC-0004BG-AE; Tue, 12 Mar 2019 09:29:42 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3dj7-0004Ah-Nz
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2019 09:29:40 +0000
X-IronPort-AV: E=Sophos;i="5.58,470,1544511600"; d="scan'208";a="27620635"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 12 Mar 2019 02:29:34 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.106) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Tue, 12 Mar 2019 02:29:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kn/IAAyr/wKKsMgApQMNsfsZkEpwqbqjrto8dCwWGdo=;
 b=p76XF1jEXczSbYm1I6wJf7zIBhVOFguLYKxuLbL2W2yJOif7LHOHZxk8sp5711DVX1/qWDdwleJrMjcxjlytiPU3a7Bqkazm0bMEm3J28KKmefCpRLei4QALG9B/mBdatdsrKM87lMW09uOfaTigb2gXwunRKfFrdWiUPBS6Ejw=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1538.namprd11.prod.outlook.com (10.172.23.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.21; Tue, 12 Mar 2019 09:29:32 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%10]) with mapi id 15.20.1686.021; Tue, 12 Mar
 2019 09:29:32 +0000
From: <Tudor.Ambarus@microchip.com>
To: <Yong.Qin@cypress.com>, <jonas@norrbonn.se>, <James.Tomasetta@cypress.com>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
Thread-Topic: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
Thread-Index: AQHUuB8ZhXd2N1Mh6EWe4SXNj0Cyz6YE33oAgAAMRYCAAcsCAIAAWT4wgADr6oA=
Date: Tue, 12 Mar 2019 09:29:31 +0000
Message-ID: <4ddb8f33-93b1-9aa4-3fdd-c60cfa1d1d7d@microchip.com>
References: <20190129220705.5143-1-jonas@norrbonn.se>
 <20190129220705.5143-2-jonas@norrbonn.se>
 <db7aef53-43bc-2c14-12bc-2f0d452b4bc8@microchip.com>
 <cb41d4e3-d300-89da-3378-6305699d610c@norrbonn.se>
 <6e20b1c1-4eaf-bdcc-aec4-59dcbe2a8a34@microchip.com>
 <BYAPR06MB5893F6DEA9B0965E234983CD8F480@BYAPR06MB5893.namprd06.prod.outlook.com>
In-Reply-To: <BYAPR06MB5893F6DEA9B0965E234983CD8F480@BYAPR06MB5893.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0079.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::32) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cff1f7ce-18e1-4336-c638-08d6a6cd3b8a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1538; 
x-ms-traffictypediagnostic: BN6PR11MB1538:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtCTjZQUjExTUIxNTM4OzIzOnFZNXp3a1JwcTVrQ1hKbDhHeFk0eHRNOVlG?=
 =?utf-8?B?TEFKRmVzQzd6M2VwRml2MWZ5YWYwWDZnbGt5MCtiR3BsZkhCbmVpUXpMTDFN?=
 =?utf-8?B?eXlTWnlmUFJHME1HSStrMFlDcDhoZU9DSU9vTGlZY3VqNTZ4WTA5V0h2TTdI?=
 =?utf-8?B?ejVCZXNHVEhVYWNlSEYzc2NDZ0F1MEdUOVFZT3Z0SWlsZFBRbllRaElDMzRM?=
 =?utf-8?B?ZDhYVmwybldFcGh0TXBIcFhiUndIaXFqRUhiZ2F6THlHQ0sySkdFV0N4Mmtt?=
 =?utf-8?B?NmdDODhGeEdtRUlZbDJFRHljRmIvSE4yc2NjRGFBVWl3SXpzWEdzRUw4R1pW?=
 =?utf-8?B?V2tnVUY2b3V0S2hEaWczK0FEeVhMZnRiUmRqZ1QycDlFa1RPckp1TXJPR25o?=
 =?utf-8?B?ZkpqUlRueHMyL3hxbUFTdWpQWGdvNTlNWW53Z2Mwb29mTUhHd2JZRUQ1Y1Qx?=
 =?utf-8?B?WmF3NmxCeHdpOUw4aHFYSWR3T1MyTEVDOHRCQ0srV01RVFBiL0VUU0twWFlB?=
 =?utf-8?B?VEpQb0k0SXplMUhrL2RLWWFxazRrUEMraEhzcXdwMVVldjNqWlAyMjhqSFpM?=
 =?utf-8?B?MUpzR1l6S0tSMngxbDZLTEhBTUZiMEpPMFo1MXpTSCt1dUhQd1dwSDdMLzdE?=
 =?utf-8?B?Zm9ZQjV1UnEzdWx5T2NNOFJnd01iaHlMNHZDMzMvT1c3by9IT213dG8vMmpJ?=
 =?utf-8?B?Qm1aczA2OEVCelhlTSs2R3lNSFkxTjQzN0NsWjRNS1J4MytGZW52STFSc3FQ?=
 =?utf-8?B?YUpQYXoxM2F5Tm9OOThNUE9rU0tveGdnQVpIOGEzdGtGMEpBRXg4TUVzckxj?=
 =?utf-8?B?UlNpODQ3Yk9BbHhIRnc0YkJYZ01KMmJVU1BJeFRpa05xcm51dEl5RGZVMUlB?=
 =?utf-8?B?NGpyV3VHR25scVRUNlpJTThKVzZHVXFjTE1iajkydWlzZE1aaTBSa3FZczhs?=
 =?utf-8?B?Q3Y2WElCb1lXZUxFc0YvQ2NpRU02QkNka0dZNEFSdkpPNGJNanJ0MldHYnpC?=
 =?utf-8?B?VFhFN0cvdTFrNkFSUURaMmYxazhKbjJGVmxEc3MwSHhwOXlIRUozejVEY3Qy?=
 =?utf-8?B?THRVd2Irb1ZZeHlnVVVrYy9jTGgzZ3lPQXZwSUZwb24vbEhqeDduOUlSaXdr?=
 =?utf-8?B?VmtXYkZVdUFTZWxDR0M0NDJMOWNwM1dITERVNUo3U1RVOFF5QlJLd3ZQWGVu?=
 =?utf-8?B?Zm1FTDgwWlhUbXpkSEZwTFZhTVAwTUREZE53SGlxUXNYVWdmZW56T0VqampX?=
 =?utf-8?B?T0w5aVY3Nm1HTWV0bXM3QUtNMWZveXBoRVhwTjllZ2xmTUh1dGVxalZXV0l5?=
 =?utf-8?B?SHZEb1dSVmZNL3NlbFlIbXl4LzVadWl6anpyd3kyY2pXWXlWWE9nZ3JxeUpz?=
 =?utf-8?B?SGFWb01PTXo4bEh5MUdqSE1GY2hZakxISkc5a1drNThSTys3NXZNWGdwZmt6?=
 =?utf-8?B?d00wbGMxSGpxeTVzQzBXZ3JCN2pZaGJ5L0xQdVNEL25zZyswUGV5WHJmS1h2?=
 =?utf-8?B?d1VMRWxzdnVFaEs3RzF0K0ozb0NQcm5kUXpUeDB0VnlsMG9pK0dScjdDdzhE?=
 =?utf-8?B?WmVxbnIzc3Fwa21qSHRNZUpkRlo5T25XSURSZ2hEU1BnelhaajVRdUE4Snlh?=
 =?utf-8?B?S3ZzaDZLTUpoZVhxTFgwaWdQaDhmSnU0OHJoYTh6bGhPQWpSS0QwV25rTHBU?=
 =?utf-8?B?M1AvK1JZbkZzMWhlTmxYb1FXS2RHK09acGFkMVFXbk1sUTM4ZTdYdEJBQno3?=
 =?utf-8?B?RUpYR1NMQk5ZSFE5Q00yNUNMU25qbGZFQnFmd2FJeDFRd2plaXFXY0UzUUlN?=
 =?utf-8?B?MXlvanMwNnhCM2dpUFpvS3JDWk1yTFdjc3lWT1RRR09aRElyNHgrSTI2dFFw?=
 =?utf-8?B?SGk3VVdjdjhwR3NyNUU5b2E4NTdwcDRPeElRSmQ1TVpJTGxxVmYvWTl6T3lX?=
 =?utf-8?B?SUVGaCtCWmZRPT0=?=
x-microsoft-antispam-prvs: <BN6PR11MB1538DAC22EB5271D31ECD726F0490@BN6PR11MB1538.namprd11.prod.outlook.com>
x-forefront-prvs: 09749A275C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(396003)(39860400002)(366004)(346002)(136003)(376002)(199004)(189003)(446003)(6246003)(53546011)(11346002)(476003)(2616005)(53936002)(31686004)(8676002)(81156014)(52116002)(5660300002)(486006)(68736007)(36756003)(72206003)(99286004)(71190400001)(478600001)(81166006)(71200400001)(97736004)(8936002)(76176011)(86362001)(386003)(6506007)(256004)(102836004)(31696002)(2501003)(4326008)(25786009)(6486002)(106356001)(26005)(229853002)(6512007)(14454004)(6436002)(305945005)(110136005)(54906003)(186003)(316002)(93886005)(2906002)(66066001)(7736002)(6116002)(3846002)(105586002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1538;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CjSL/GkeW9J61Mp5iVI76xqIR5ULNicGBoUuJ82lDMkt9oCOdbKjyXZHu64LHzmjBBWZ+ONs4nvyHyE9y+xrdnZFxVWts4TNPoEGq3Ooi29nSkRsHjZpk/tIG8qe4BkWmELsehmFGmrtc01mJu/AZrRPFlpZ9Sn1GRPPinPW46KFiRgHdfsQUcw9sPvDYxDSRWDZsnio0u+eNO8+JIo4ETO4sbr3vimYThbcJIH3/BeS1Ew2nWiXkc9KQ0NvuNjSLFrwGzJi7e3J/Vh3C641X9PkMRV3SjNPVCXjokiyTqgZkakaoztVVaRafalTCWnDaOjViau/4nPlnpDauJEZ4V7kiFqF1Pm17lx6gZJTJzs1RT6WMEpe7jy9w4jCN/nwsTxUP+/TxHffkipYeGd12Qyn+uqqj8n1Q3JufzHLx4g=
Content-ID: <47C2B43CA9A2674783BE8EDA4BD789CE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cff1f7ce-18e1-4336-c638-08d6a6cd3b8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2019 09:29:32.0013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1538
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_022937_854676_DAEF806D 
X-CRM114-Status: GOOD (  10.22  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: bbrezillon@kernel.org, richard@nod.at, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Yong,

Thank you for the explanation. There are still few things to clarify.

On 03/11/2019 10:14 PM, Yong Qin wrote:
> SRWD bit (along with WP#) provides a way to protect Status and Configuration Registers from been modified unintendedly or by a malicious actor.
> 
> By default, SRWD bit is 0, which means no protection on registers alternations. Registers can be modified easily by WRR command. (this is most of the application use cases).
> 
> If set SRWD bit to 1, then when WP# is driven low during WRR command, WRR command will be ignored and Registers can't be modified. This provides a way to protect Registers, meanwhile still reserve the capability to modify Registers when necessary by driving WP# to high during WRR command.

Does the SRWD bit protect the Status and Configuration Register bits even when
in Quad Mode? WP# function is not available in Quad mode. How can one release
this protection when in Quad Mode and SRWD set to 1?

If SRWD bit is ignored in Quad Mode, then why didn't Cypress enable Status and
Configuration Register bits protection by default? I.e., remove SRWD bit from
SR1, make BIT(7) a NOP, and consider the Status and Configuration Register bits
protection enabled by default when not in Quad Mode.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
