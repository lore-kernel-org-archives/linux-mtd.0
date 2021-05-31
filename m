Return-Path: <SRS0=sw+G=K2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9FDCC4708F
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 08:13:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 701E56102A
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 08:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 701E56102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B6hFNLyr6wsoUcaKPR8gN+7lhqJlPT8pNfFeLlXJNOE=; b=a6un7J4S8JTJxQ
	XC8jZbyz1Y/rhnuq2nkGRg2Stx+3sVfBGqprlyAvwSuXcMDZLZ/BP68E1WrMJWimvZdm7HsjhJHeN
	cYP8n2bqNeYNFviUmuAU/ezzJeg9uE1TuBkQaiEnTDEPArrPh7DaVG9jziLj60EPtQaLd/19xGuF8
	I80Dm3sEVhV1Sq7XMpUwlGvSSzFBVw9aOMZq2WiM2a3n6/rE1+4OuQUYju90KBhDhcRStfgWXC2sK
	rMyQO97EUDVe4pCgH9FgAi5bPHK/C3NMWNB/jfrLqDikLU2Zi9t2T9kvvoijs5Y5PjgtvcLZfWNnl
	pL6bls26i1/yd6DhnoNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnd25-00BL1I-Ph; Mon, 31 May 2021 08:12:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnd22-00BKzP-2H
 for linux-mtd@lists.infradead.org; Mon, 31 May 2021 08:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1622448737; x=1653984737;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1QsEFjjaXZ7knlMtVEH6atUjOk/SjbyAgJLCVeQ9h20=;
 b=GEq4DoYqUk3qC5iDA5QU3R8LU/DMDP85L1wpJsnJAMxt5h/zXrgubtsj
 hFnMeODl0qUKY7xgErwWzzXIsVBQvDlyBg2YFdpW4WrR94iRk+M5C1/k7
 2zsMttiTPLCEmWumr3ZQ11fJNSO5pOccenhYeenIvT/+hCeouoD/F96iF
 i4S43U9PKTW91CcMAfaNKmj0ZZSIisUUxsOG5k4Tz3yqhkH3sNtqSjOpY
 NxqU1fqVFr7oa14Pa9+mluDpFBoj5wzloipC5896Bt16UPu27XiWjCR+D
 WrUBp5Fd4ndk0qfQv1A0piBYIkpXyXglXNnWMowU14HzeciUNpI4lvK0A Q==;
IronPort-SDR: OD6B7h0+cLnLBTZWOuW3vT9GFh+vM/DuJjplAOEDr8hZwE148aq/V8rCVyF8BLG3O1Cm9JgHkH
 ukivqR1JvJTmTz1MTTmAklllJRpPR/QPEgZ/Sfb2hOBAICFEuKwaepLWa3cSketw0uwmtJPxSg
 vJ7w1jiDYNe1tnYJU+Xiw/SWHyEf58qLTnUG8J3Kq4kc0qqild/LaXUud9fG3E/GvU4hMKKvHi
 lbqdP9VtpjLPwkHStlDClpKC4byVjRZj+S/w+XDKXAfFggJhoXVc3ElsMDQQ0kB1FrlkG7g2fv
 LdQ=
X-IronPort-AV: E=Sophos;i="5.83,236,1616482800"; d="scan'208";a="117123801"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 May 2021 01:12:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 01:12:16 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 31 May 2021 01:12:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpfUmiZVBIA+6gniKji8vdHd/BOy/Hbzn8nfJoMqmJ1RdMKCDdtAGMT6PtQfyVqvmLKIfrHNWtbNcov0/lZACwi3e7ZEnAMpI0Wv4srlnt0MYykOBg7Q55VNur+PtMhwcTx2AWe9gap7I0YuIUQnhk8ILtw87SjboGS6kKhJiPcqa5o3YZ1Rhvnf7fqAD+a3s1muomemc7FkT62zH6EHy6F3n2wRuFZMJQBGehMZvrHz97qleEHYNAi7QbQMhCTOYHWo1BveJ1FSBRsZemcMSHoUQX81YM09VMnYj8eI4RCc4isX8o3D9mU/bRnhnMtInwM+YP5hHMBSRAFDpKcQLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QsEFjjaXZ7knlMtVEH6atUjOk/SjbyAgJLCVeQ9h20=;
 b=j/n9ZnPcxZ+4dlVj5W5kQtcqq2TSq9HgpTNOb64Qrjl7PmOVeD4gSw6snGPtgubTjQnWYFvqDAh7XZdUZX3idYxxv5/qvDosAbqCixA33REGnFzV5Nh3JRqrQOkHEtMnIN2/be1puj5mPxHSb3x9bs3xVIUaWw4R5sBXtNTNzWf/qm4IYch7lFUIAOH2APSm/WaOb7v6L+E7f5Op2FoxHfuAlyBo2sDCdsbXZd0d5dHYqst5pjrQoKt6QQqp4q3mtNQ/7+yM6xU7w0rep6X7xOrKb33DnebS2vWruEb90q1Xoc9OvPUWimPjsPNtN5cfh+7lxhyKII7oYquA55mq2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QsEFjjaXZ7knlMtVEH6atUjOk/SjbyAgJLCVeQ9h20=;
 b=llJZijB2rtbCw2gA8FBSs0CGAN8nedO8+NQ0CC6tXGzWAnERZi4yDfaaIGC3xvW2xUwqVFWbTbdVVfiEP4r56A5hXUJMdJ4RI+KhUjWpPHPgJAS/AIN3VtQIJWfNqUFzfOWp+Ix+eU8/jfh3NdAYIttiIEGMA60f30/+vSlg688=
Received: from CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9)
 by MWHPR1101MB2176.namprd11.prod.outlook.com (2603:10b6:301:4f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Mon, 31 May
 2021 08:12:14 +0000
Received: from CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::1c4:1014:a541:e370]) by CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::1c4:1014:a541:e370%4]) with mapi id 15.20.4173.029; Mon, 31 May 2021
 08:12:14 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: otp: use more consistent wording
Thread-Topic: [PATCH v3 2/3] mtd: spi-nor: otp: use more consistent wording
Thread-Index: AQHXVfSpsxoRfN5Vh0GYXTu/SyR75A==
Date: Mon, 31 May 2021 08:12:14 +0000
Message-ID: <6e2a631d-f514-db3b-8b46-b71076bd7993@microchip.com>
References: <20210520155854.16547-1-michael@walle.cc>
 <20210520155854.16547-3-michael@walle.cc>
In-Reply-To: <20210520155854.16547-3-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4ca367f-0618-405f-6aec-08d9240bcc83
x-ms-traffictypediagnostic: MWHPR1101MB2176:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB21764E441A7670F4E92E42BBF03F9@MWHPR1101MB2176.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NSMCv7AtVsPMcApTOQIV278hLLyAqq4kIufQS+QMtP87dJtC7ahPHlFj/shOEKY+Uy3zlb25QQXK2aJi3MPu0a4ojpZ8Mml4PfQEezmMyMkqDBRcYUzFIvGWkKTcnRSnbqd53HGpowq+5A6gyUbObUVGvXevL4nMaiYp/E9dWNpVrTzcDO178tG6/UQh073CR8MhHyW7xLFiGBKPhFD9W32Q0yLkmjU3lERQDoQU4pVfBteR2WzDPrdb8Hs4j/i97+GdGrZp5RZDkqauuhhDST5g6d4cEm2AP9Sec3JnqnVM6HAiH0Mxkf9GlByE0gcjRKBboIiFQ1lx+W1g+2bft4nmDzSHmNq7uaAxgt5wfP/WScK49SKOSAKnZHFfyxWBZMHbRSa87yjbubFSAQmP7i7vT0BqCv53bzovOT4qPnE0y5bmnVYvFs+QeuEfZwdMMuMjXhYi4sJlBFEa6hq/jppeRKrCwnZ2BOyxkR1G1fT+g+Xqbwg48O6Mcd5Q1x84GlI+daBI4/BL0VxeMTeOcIZ/aBWcqDkooGEOP16uQIRbeWztlCLO3UsN9Ix9Y7sLla8MBFGdSHWhja800ZcAD5pm5QeZkHL53kLfd0obzo5J9GtiGUzR4X7BkJlCzLHUeCwivloc1yx7ovSZ4YGwM4+rsHa+Q06GA8B9hyqI83eSnnxgxTurZXlmWqBWbygt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(396003)(39860400002)(346002)(376002)(26005)(186003)(86362001)(2906002)(5660300002)(316002)(4326008)(2616005)(83380400001)(38100700002)(122000001)(6486002)(478600001)(64756008)(66946007)(8936002)(31686004)(110136005)(66556008)(76116006)(36756003)(91956017)(53546011)(6506007)(6512007)(71200400001)(8676002)(66476007)(66446008)(31696002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UXZqYXkzWk9POUw0cUFGWXJRdGdXeDlUd0xxRHpmeDFzNTgzK1gzZTF6Zk5m?=
 =?utf-8?B?Q3I1Mnl5enlkL0I5WUlPakNwWTVaVTBQdW9PYWpDZ0FaYVErSU9tMk91bHAv?=
 =?utf-8?B?YkxiZGk1STF3T211OTRzWWRMWVNiUlQ5OGZRcEZDWmZhdDA2VHhjYmlwbnor?=
 =?utf-8?B?cCt2emtROGhKMmFQQi9FUFBPamlVQ3JmdTZDNDd4eUgwTDNmOVNPRHJhcHdz?=
 =?utf-8?B?TllKdCtiUGdSK29pcHFzWkpXaU9hUzBOb2dMQnROc2pJRmVPVDYwb1M5QlRK?=
 =?utf-8?B?bDVtQ2pMVWxYY3FQdXFSc3MxN3JINVB1TEwvVUxnSEsyTUMvRktQQzl0SUF0?=
 =?utf-8?B?aUo0UHl2T05NTTBIOUZrN2VuNEVtVkdtc1ZWMkNZcTRCZm9WQ25hRlhJd2lD?=
 =?utf-8?B?c2lHTlNGWlpoSENCbmUvRXNVWjRBTDJ1NE1QL0t3Yi9FU1FZclJJUzcwMWFu?=
 =?utf-8?B?RUdZVmtEVWMySW9lQ290dXlZT3dPeEpiODNNTVJEZmEzZ2wvM1BpYkk3V2wx?=
 =?utf-8?B?Q3hoV0FXU1VJQzc1WHlMaXJqNElRSUVxYXRJbC9RUi9UbWN6SVFQUi9Va3Q1?=
 =?utf-8?B?ZEhFKzYwRzdlMG9GTzZFZ1ZTdHd5bEE1Z3piZnJ2SVZVNXRMcTVnYStLZytX?=
 =?utf-8?B?T1M4RkwvN1VWZjFhK0ZWTGFZVFVmSFh3cXpKejZOUHhRdm9xZmlrZ0xsY29M?=
 =?utf-8?B?eFNoMk5IT3NMUWJyQ2pMOFpnbDJ3ckRIY09TajBGSExIYjlZcFNaY0NYOEsx?=
 =?utf-8?B?dm5HZjNPVDlmSW9sWU9KZk9SS0QzdVlXQXdWK1YvZFdLK21DdldPc09sa0hQ?=
 =?utf-8?B?WmdwRVIyUkJaVzUrTEdWL2grU2xpWDRtUTFUT2o0MndqQWRDK0hsdGxkdWNG?=
 =?utf-8?B?YjJjdnZkOXM3SElkWXZ6SHN1UHl3WmZjaU03L2V5aTQxWkl2ZVpaYUMwYVcr?=
 =?utf-8?B?UjZWTkdIVGVNc1ZpK2hmOVd0NTJYU3c4SDQwRFJsSUJKMEYrZXJoLzdFQm5x?=
 =?utf-8?B?WC9WWDBoT3FoaC9Ydllxc3loT1MxMEw1ZFlWTzJ3Njd1ZGh6aDV6QksxMEkx?=
 =?utf-8?B?ZXNBR0NZKytneFRNUmF1MElvUVYvWUpsL1ljeHZJeFk0OVAzeE5DdkdtaXJ2?=
 =?utf-8?B?STMzT0NWNTRmTld1bnkxUnZEejdRVURmbWdrd21hREhPRHZ5Q0ZCU2ZvSGdw?=
 =?utf-8?B?R3JrQVdMdS9MV0YxVVUwVHZSTWk1ZEFTekMwU0lmVzZoV2w2RmsxekVnbyt5?=
 =?utf-8?B?L3VFUnRiaFN1ZUJiZXBSWFFKeUVBUkJZNFpyWk5NWjJ2TEZYdW9iV3pFZ1E3?=
 =?utf-8?B?LzAySEN3NnBOZHBRaWZEVTVid1g4T2RyQzNKTTB1aDlKOXRYdHFVam96dTVt?=
 =?utf-8?B?VE1oeTNvcVB2U0JOWFRLQlB1bWZFQTMxWXoyK0xiTldWNWFHUUNlSUJBN29n?=
 =?utf-8?B?VGV0WmhSZ2xNY0pNM0wyR21aR1VvTkl2WGRzYk5SeElNZ2xCbGpZTG9JY3p6?=
 =?utf-8?B?cFJZUkFVRnlpRWFHSXBsbFRzUjZMWWNvWEVydXNWR3lqQVB2eWxlTXJESmJs?=
 =?utf-8?B?ZDE5Sm5NL1ZwR1dYby93ZWFXVEpyRXp1RXRaajV1M0VtR2txemQ4UHJCZVM4?=
 =?utf-8?B?bXFUYXRZQXIrT3QvRkNrR0I0Tkt4TlR1enhpK05LRnhtRlFSZmhTaDYyUkpP?=
 =?utf-8?B?bUszVnlHWVdLVE5FWXVKWjkwSm5rRkNFRnAwRHA3T2c3M3FHdUN4SGl4Rkht?=
 =?utf-8?Q?hLDJKpNScSTTf7xiPY=3D?=
Content-ID: <1624D7D468B43841A4CCC65F171106BB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ca367f-0618-405f-6aec-08d9240bcc83
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2021 08:12:14.3373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IDgODncOmyKtxVKhGeMBN6Patr0m6/80b5pXROLHkRLoz4dGyjvmDDVrOpt0IJV6aWZhYxB+rb0JvkWkXc5nBbDCJF3NnvyebkDyeUUirF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_011218_212505_175329C4 
X-CRM114-Status: GOOD (  21.51  )
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

On 5/20/21 6:58 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Use the wording as used in the datasheet to describe the access methods
> of the security registers (aka OTP storage). This will also match the
> function names.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>


> ---
>  drivers/mtd/spi-nor/otp.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
> index 91a4c510ed51..ec0c1b33f7cc 100644
> --- a/drivers/mtd/spi-nor/otp.c
> +++ b/drivers/mtd/spi-nor/otp.c
> @@ -15,14 +15,16 @@
>  #define spi_nor_otp_n_regions(nor) ((nor)->params->otp.org->n_regions)
> 
>  /**
> - * spi_nor_otp_read_secr() - read OTP data
> + * spi_nor_otp_read_secr() - read security register
>   * @nor:       pointer to 'struct spi_nor'
>   * @addr:       offset to read from
>   * @len:        number of bytes to read
>   * @buf:        pointer to dst buffer
>   *
> - * Read OTP data from one region by using the SPINOR_OP_RSECR commands. This
> - * method is used on GigaDevice and Winbond flashes.
> + * Read a security register by using the SPINOR_OP_RSECR commands. This method
> + * is used on GigaDevice and Winbond flashes to access OTP data.
> + *
> + * Please note, the read must not span multiple registers.
>   *
>   * Return: number of bytes read successfully, -errno otherwise
>   */
> @@ -56,16 +58,16 @@ int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf)
>  }
> 
>  /**
> - * spi_nor_otp_write_secr() - write OTP data
> + * spi_nor_otp_write_secr() - write security register
>   * @nor:        pointer to 'struct spi_nor'
>   * @addr:       offset to write to
>   * @len:        number of bytes to write
>   * @buf:        pointer to src buffer
>   *
> - * Write OTP data to one region by using the SPINOR_OP_PSECR commands. This
> - * method is used on GigaDevice and Winbond flashes.
> + * Write a security register by using the SPINOR_OP_PSECR commands. This method
> + * is used on GigaDevice and Winbond flashes to access OTP data.
>   *
> - * Please note, the write must not span multiple OTP regions.
> + * Please note, the write must not span multiple registers.
>   *
>   * Return: number of bytes written successfully, -errno otherwise
>   */
> @@ -88,7 +90,7 @@ int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t len,
> 
>         /*
>          * We only support a write to one single page. For now all winbond
> -        * flashes only have one page per OTP region.
> +        * flashes only have one page per security register.
>          */
>         ret = spi_nor_write_enable(nor);
>         if (ret)
> --
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
