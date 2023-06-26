Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4807EEB64DA
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jun 2023 09:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KafujoLZZAciq8SlfTTZfIamPpVOeUSBKBuaDMZz77M=; b=H11WH2CUs3tQIl
	VtYZAAjJzEizu3VMN2tfrZnmrCu719u7MNPbeR+RemuRSC+pcL4SEiPhJ+MORyr9Il8WPHzK9Y9E8
	/ldhH1rHHpeX/XdjFv6QZq390S6RHfZhSRohuwevXnrQPv8HqA3keP6E4OSJ5EPUKp55hOGdvqlRJ
	lcKIysEg0T0D75fLlF9RjBbEjFfo2bK8nnhhBoyDLnmgnALitxtZZYYUFdTMzuHkYJ3NQO0e1e4D2
	OVkXZbr+m7v9ByjtaKUyFsOF7SKPTfcUqXZchgbXIPWuvLLz7KcR9pajPkXZ9qsjbzssSnMSk8Ehk
	lkW4s29xBjhIqZDmeIEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDiR2-009j92-2i;
	Mon, 26 Jun 2023 09:23:00 +0000
Received: from mx0a-003b2802.pphosted.com ([205.220.168.83])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDiQy-009j81-0z
	for linux-mtd@lists.infradead.org;
	Mon, 26 Jun 2023 09:22:57 +0000
Received: from pps.filterd (m0278965.ppops.net [127.0.0.1])
	by mx0a-003b2802.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35Q17Sct022594;
	Mon, 26 Jun 2023 03:22:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=M5NdGffogi9UtBlb5JkPxm1F1kVCEj/GRC5hKOl3xKs=;
 b=TC5cO1y4PA5lFjVfVUeUqwEvDvB5Y3krIgNQosXjaD2MtGCMNVYUMlOPySvWP4oPnqkL
 qkOGussZeLoq2RkxWchyoq1iDOoHiUe7Iem+cVRKiqQKWZbYAlqjfiiYP4vZ2nIcxBde
 Lsd9gqf0ADnCahk80Baoxr7AW1V4qpx23wB8NHzCEQNDYrEtyKI61/CdqToFYGMOBZma
 XnaxP9Iq2Gx6wPgis0GvkGspGBhE8IUyRGj0a7Z5k8NJf20G/dp/SiguxED2QpEVk3Pk
 vXArtDFvbDdRHYaL4A029sQ5r+B2CVKolaTj0HmxhTAylqRCHJot6939wduYVyh16GiN Tw== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
	by mx0a-003b2802.pphosted.com (PPS) with ESMTPS id 3rduhau3u1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jun 2023 03:22:50 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GARRJIAto6/P0qFNpfBRrBu9g2tFLSAgZPnx2AOVkeocvPL4MrFn5mPlsEwcjth3NURWVsGRL5RpJ6LHTkCU3SwitZ2wzgx6GkVkXom4PlBxiFt+PcIXgm3VJS0ftyfBlGSgEYgNw5gDG1Eiwj+Tf3PchFYIbnnN0IzCWFtGvmFPPgO59ADfoo5w2eLsOkBSOAI3Jip/lf8KiAI9BgsUgOE2kpgW1Rlca+UZWhtTaSqD7ep6vNdPEn/PW7wDJxIh11ejLdc1kxwBgjK0DsFw85ykJkuPcEtcLnJVWO9RDtPCJvCoJGptTe0i34ad1hUoHxXj/9OSWBpm0hSRBUOGWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5NdGffogi9UtBlb5JkPxm1F1kVCEj/GRC5hKOl3xKs=;
 b=HF1Sg4Uk0CJDgZKa4SpufGujw0Qu8jCsMj8aDUcZ0W0KlHpx48652oTsvT3HStOM5YBZlJxzf4gJuY3jnWS7q17DISdM03zla8dNoVohGeJ3KHKUKG+/4BJ5NJJZ4u8gWayAbDsblR5q3CTGc31g93Ulk4nkflh6D+SOZ6a3ifa5L7r2rYOggbBxTKAcOdhdq3P3l+XljBP+PlST98SmP+9LDBEkTxWltUD9L3hN+15Wr6Js2jBbbmK+S9UwrBWYfHz2OAmi/y4tE194Z1SIHvCkmICUwNrUgeUbrFSuW0XyQ7ms/03UmNNXazn2txyIfZEPq2kTPOvq1sm1U2uvvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5NdGffogi9UtBlb5JkPxm1F1kVCEj/GRC5hKOl3xKs=;
 b=Nqucs7YQC8zeggIpIrbaXfk/8fkypC5j4vcVGUPMAOteggYDJ8V1GsOJTZg7BOvwokIKMqhsGASEbgY9+OBB6tE9Rfd1T+8O8MXO9AMfianzNbUR+57sOoNrjmo5wPIK2L0lrT2J5QrVgNPWe2m+egxkrA2ALHuDpWHP7a9G5w8vsVWvzxVPM/76kErA3NLWtBuctkJgy0Rrx1uRSd33o9XJCyEgQDQzK2/MevivMLqcJnBMTuG4uPfNZ9nvBd9NP/BCNEtBP2lpDkT9UhRYHQfTmn4SOHyBqZxun7QmUlC6qOmRAfYMoQSz62oqp+Dtd2LK7PfsWCs+o4zqcJe2Og==
Received: from PH0PR08MB7889.namprd08.prod.outlook.com (2603:10b6:510:114::11)
 by SN7PR08MB8590.namprd08.prod.outlook.com (2603:10b6:806:2ed::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.47; Mon, 26 Jun
 2023 09:22:46 +0000
Received: from PH0PR08MB7889.namprd08.prod.outlook.com
 ([fe80::838a:faaa:a6c:ce8b]) by PH0PR08MB7889.namprd08.prod.outlook.com
 ([fe80::838a:faaa:a6c:ce8b%4]) with mapi id 15.20.6455.030; Mon, 26 Jun 2023
 09:22:46 +0000
From: Bean Huo <beanhuo@micron.com>
To: 'Miquel Raynal' <miquel.raynal@bootlin.com>,
        'Alexander Shiyan'
	<eagle.alexander923@gmail.com>
CC: 'JaimeLiao' <jaimeliao.tw@gmail.com>,
        "'linux-mtd@lists.infradead.org'"
	<linux-mtd@lists.infradead.org>
Subject: RE: [EXT] Re: Boot failed after patch "mtd: rawnand: Support for
 sequential cache reads"
Thread-Topic: [EXT] Re: Boot failed after patch "mtd: rawnand: Support for
 sequential cache reads"
Thread-Index: AQHZkiMzb3ovCmHk00i8y+AILspS+q9y4RPggAE3zgCAAXq0AIAAlvEAgAEg/QCABKLDgIAAdZjwgCCUtMA=
Date: Mon, 26 Jun 2023 09:22:46 +0000
Message-ID: <PH0PR08MB7889328970694F570AD16E4FDB26A@PH0PR08MB7889.namprd08.prod.outlook.com>
References: <CAP1tNvS=NVAm-vfvYWbc3k9Cx9YxMc2uZZkmXk8h1NhGX877Zg@mail.gmail.com>
	<20230526201420.231092a0@xps-13>
	<CAP1tNvQsmYKMHZ662f1yiLv2JmZZrnQsJr2Lf5xiafxJSkZfBQ@mail.gmail.com>
	<20230529101240.53065e04@xps-13>
	<CAP1tNvRTRkXMztGL=nxrd-Cv5xO58-R=A_M2r65d6cyidoVz0g@mail.gmail.com>
	<20230529134619.255d0b07@xps-13>
	<PH0PR08MB788936E00C0DD958BFB9B3F6DB4B9@PH0PR08MB7889.namprd08.prod.outlook.com>
	<CAP1tNvQg+3O6LOaAnAMXionvLUy2FkF7yWtjXUma-ZLL3EE7nQ@mail.gmail.com>
	<20230601093734.3c752d2f@xps-13>
	<PH0PR08MB7889C9577C6AD5BA2221B74DDB499@PH0PR08MB7889.namprd08.prod.outlook.com>
	<CAP1tNvTS=kW_pPM5Vn4COmCXR7L6wj+CXtKs_Tnf=UQk2i7=Bg@mail.gmail.com>
 <20230605103943.064d142e@xps-13>
 <PH0PR08MB7889A36C14C2229C3DA3CDB0DB4DA@PH0PR08MB7889.namprd08.prod.outlook.com>
In-Reply-To: <PH0PR08MB7889A36C14C2229C3DA3CDB0DB4DA@PH0PR08MB7889.namprd08.prod.outlook.com>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_ActionId=ac8213de-f050-4a7e-999e-4db9edc695b7;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_ContentBits=0;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_Enabled=true;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_Method=Privileged;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_Name=Public;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_SetDate=2023-06-05T15:40:53Z;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_SiteId=f38a5ecd-2813-4862-b11b-ac1d563c806f;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR08MB7889:EE_|SN7PR08MB8590:EE_
x-ms-office365-filtering-correlation-id: f7337e98-6367-44a2-beaa-08db7626e76e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ilGdJtl/r7gE82JhlK3gp9q//bbJIk5SBixuXSCqKWUsNW2MCwoPgIencH7JMUd7Wbf4fKHENCDjSRvjSlXVR2fJtl+7AH3rXoOr+qGowewHsmN1C7qz3afh335ietxWOAxc7vK6Co7w1wX6P1nYBtTeLyMH1eoGcXKVtAVl0qvwvL37ahiOsHtuGYUcEZX5avVVL2A3NCszRmV5Z2PkkdOUVWLMAkZ33Djdh0eJcm68ZY6nS8MMnhq1VH1NMQIn+9lAhRNExsGy84xrZctODThxD+XmQIrbuMUbxQJDBZIOT81Xmx81VBcxZBL0IvvPn7qzobKdd+eXEQsVvapOU+RHD1o/m5y8wXVSIpwHQxm/NKkdXfJA1pLOHm3djjNWVpG+efiA0pLTVCNXF63sNSAUD3Q2Is6lhjDsc6TDBWQuHzcLcx2wB7a8+Id8xUesf1DXxHJAIfbzsBsT3Lt3a4tIG105c4kbAC/r6qmplM5f8gV3yNGZ+yTPxOtKdi38oRRMBqcbueq7Q8K2s5Dax/7bs+uwhaxwtupvD4B8Qq+Wde3949oWIXSXWMaeMQ9sL+RpTjLvaeVN2EHD8m/ii7yGOKZO6DgyHH0IPprNHfsZJJkBkQpBIGPwiu40GFRz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR08MB7889.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199021)(33656002)(52536014)(5660300002)(41300700001)(86362001)(8936002)(8676002)(66446008)(38070700005)(64756008)(66476007)(76116006)(4326008)(66556008)(38100700002)(122000001)(55016003)(316002)(66946007)(66574015)(9686003)(6506007)(53546011)(26005)(186003)(2906002)(7696005)(71200400001)(54906003)(478600001)(110136005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFhicGZqVXpNN1JRTHgyWGRyZGNRdmZ2enlETjN0NjFRdERIUlQ2S2FzNVlj?=
 =?utf-8?B?ODluYVNOdGY4YmM4Z0g0UGlwR1dRb0NnaFk4aGF3aVVjOC9JS0daSFlkSHFO?=
 =?utf-8?B?RFZRd21jNkQrVVh0RWVuRkZxMkQyZWlQWWFqcXkvTzg2UDhFOVp6UHZ0b0h0?=
 =?utf-8?B?enkxMzNsT1QzUlBlRmIyMXBCQVA0YTE5ZEpxR0JKMjBMN0FidngzZnhwNGdU?=
 =?utf-8?B?dUJDdDkyS2w4VWhEV0ZXUDNUdjc0TURhM3dMYnBoNTFNcVVNYzYzQXNPVHRs?=
 =?utf-8?B?OVBxRmRvWG02a0lCYU5DWTU5bmcvVnpxdENrdit5NCtQa0l2ZWhZbGRpWFlZ?=
 =?utf-8?B?amx6R0hXMXBvRGR5TGJYSzFmeFBIbFlqTzkxWVN1cFE0RFoxUy9sbVlBclNI?=
 =?utf-8?B?TjhDbnJyK05XUUNiUXFVTU5yb0hBWi9lcU5yL1E0TllXYlIrUFAzMk9QWHR2?=
 =?utf-8?B?bXdHcEkvTFI4RWNUaG5kS3h4V1NlbUpkcHpkZkZZZzZmU056U2NzZ3RKT1Zm?=
 =?utf-8?B?MTRYQnIyTmxSaXg0WDlqNnJjYWpCanppTDM1c3U5elZueEUrWnFTeE1aQ05E?=
 =?utf-8?B?d3VQZXFkNXRUWFNUVVA3dy9wczFKaUc5ckJVL2l5VlV3UmRpakx1L2h6R3U5?=
 =?utf-8?B?a2hsMCtkbTF5SnovbllYeUcrRDFpbkhJcHpRTGtWejkyZmhsOVhoamE2NVVl?=
 =?utf-8?B?eTlSSGNEblpvSTBsYmNnRk5wMkZYbVM5VG4zZU1BVGJHd21BRUo1SFpVbVZs?=
 =?utf-8?B?Z0YzcVlqM1l0QytwZkZEc1htMFFMQURoL2R2V2xpNStSZERKMXR3bE9BUTZ5?=
 =?utf-8?B?YlY0WUNtSFZiVmFtdDlwU2ZkS0RENUtHcHNoR1VrQWtMLzFqYlZMdG0ycEM3?=
 =?utf-8?B?Wk0vei9CcUxTSW02M2ZsWmhudjQxMU1WLzQyUVNyQnpvNjZMR1MzaXBQWGJI?=
 =?utf-8?B?NFY1a0IzU0tWTUppWHhqYmpQUHVPaTlwaDJkay9uS2R4UlN6WHJFQWRWMnVG?=
 =?utf-8?B?OTNIZERySVVUVGdtYXk5cU1CYzhXazJzbE5qdHNPYXlPRDZxVXlzdnRTc1VB?=
 =?utf-8?B?emFWdEQ0bUtOc1BjMnlCd21lV00zekZIQTRYQ1ZRL3E2UUpoVXdaWjk1TGZw?=
 =?utf-8?B?OTE3bHd0TTVWSG1YbGhSakxyK24vakdXM1daOWpCSHhPcUM3eDQzMFhpQVBR?=
 =?utf-8?B?M2djZElwMFhOVllLR0I1N1dPY2ZwbWticjhTaHBLNjhRZys4YkR0dENXamo1?=
 =?utf-8?B?QTdIWlR2TTNyMFhUWllDa1Nwd0VSeEpzMjBKNmcvaXlXS1lwR1o5a3FXUWpE?=
 =?utf-8?B?QXdyVjJWblg0ckREc1hweHlOMkEweVBDa1ZMdGpGczM4ektrblRxREdQa1hq?=
 =?utf-8?B?L0lFM1dTZ1VtOWVZVjhoV1grQ0R4L3ArODI1ME1aNmFXejhRYnBuZ3l4clNu?=
 =?utf-8?B?SkZHRnVEK3pwTjU2V0NKWE9sdXFYdFZXM0h3QmtjaVpDN21qL1RYV2VDYlBO?=
 =?utf-8?B?a3BPYTVKSEV5L1VKSisxZWJ6U0dpWld2V2NRSFp0SWVYbDc3WWhCNkU3aG4r?=
 =?utf-8?B?MkJodjIyMzZ2UXU1d2dmS1Nudm0zbFV5MzVtUWQ3MGFGeHlicERrRzFoZkt3?=
 =?utf-8?B?UjkxWHJXMTBXNDlFdENTcUtGMlovcks2dXYycmlyVFV5Z3N2MTZwWEZwWkg5?=
 =?utf-8?B?YktTaWNybFNFeHJOaXUrNTBQbTVGdlBVdlI5UldtUlhnLzc0QXRwUTl5cjgz?=
 =?utf-8?B?OFY2cE1NNHozdmlQWE9uRU5IdHU2aUxQK3hrZ3JteFpOaWpFU0V2dEdad0pq?=
 =?utf-8?B?RkFJckxWQ00zakFiSlVVMDFVYjJpL2ZSTnVuUjlJWFBaOXRKZ1hEY1N2QWgr?=
 =?utf-8?B?TittNnYwREFybnk3eXltZHVDblVGNUFmRU14Ty93aHU2NkhYSk0wYnFNK0hq?=
 =?utf-8?B?azdrT3p0VHJtZFJQOUFOUk84NTdLUnF2NERaMVBzNW5OKzRLazdGZXY1cDg5?=
 =?utf-8?B?RFFXSkRMOU1RN2VzUjBqb2NyN0xWdFdjakJWejNTcmVQZnNwMHkzVUp0S2pI?=
 =?utf-8?B?ZVptNklHYjZ1SjRPNTlZeHhnVW5jR1ZaRkpoUFJIVGpFYktyNy9BcnJrTGZm?=
 =?utf-8?Q?UDpcgSwKsJuQuW0vWRT3ZlHi5?=
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR08MB7889.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7337e98-6367-44a2-beaa-08db7626e76e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2023 09:22:46.6126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R7/GPeq3slVQAzFzWJPnzSPKMfZDX/hEbq4NIw6xA6OYLafGDdHKOeQ2gzWaBQN7BhvkGQX/rRjcZ5IKe5fj4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR08MB8590
X-Proofpoint-GUID: A4VlYL5FfCalltT6qMkUeYyn3-Gjy4kb
X-Proofpoint-ORIG-GUID: A4VlYL5FfCalltT6qMkUeYyn3-Gjy4kb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_022256_636446_198C868E 
X-CRM114-Status: GOOD (  30.22  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQWxleGFuZGVyLA0KDQpEbyB5b3UgaGF2ZSBhbnkgdXBkYXRlIG9uIHRoaXMgaXNzdWU/DQoN
Cg0KS2luZCByZWdhcmRzLA0KQmVhbg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IEJlYW4gSHVvDQo+IFNlbnQ6IE1vbmRheSwgSnVuZSA1LCAyMDIzIDU6NDYgUE0NCj4g
VG86IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+OyBBbGV4YW5kZXIg
U2hpeWFuDQo+IDxlYWdsZS5hbGV4YW5kZXI5MjNAZ21haWwuY29tPg0KPiBDYzogSmFpbWVMaWFv
IDxqYWltZWxpYW8udHdAZ21haWwuY29tPjsgbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcN
Cj4gU3ViamVjdDogUkU6IFtFWFRdIFJlOiBCb290IGZhaWxlZCBhZnRlciBwYXRjaCAibXRkOiBy
YXduYW5kOiBTdXBwb3J0IGZvciBzZXF1ZW50aWFsDQo+IGNhY2hlIHJlYWRzIg0KPiANCj4gSGkg
TWlxdWVsDQo+IA0KPiBJIG9ubHkgY2FuIHNheSwgd2UgaGF2ZSBub3QgZXhwZXJpZW5jZWQgdGhp
cyBraW5kIGlzc3VlIHlldC4gIE15IHN1Z2dlc3Rpb24gYXMgeW91cnMsDQo+IHBsZWFzZSBmaXJz
dGx5IExldCBBbGV4IGFkZCBkZWJ1ZyBwcmludCBpbiBtdGQsIGVzcGVjaWFsbHkgaW4gTkFORCBk
cml2ZXIuIFRvIGNoZWNrDQo+IHdoYXQgZXhhY3RseSBlcnJvciBjYXVzZXMgdGhpcyBTcXVhc2hG
UyBjb21wbGFpbiwgaXMgaXQgSU8gZXJyb3IsICBvciBDUkMsICBvciBFQ0MNCj4gZXJyb3IsIG9y
IE5BTkQgZGV2aWNlIG5vIHJlc3BvbnNlIGFuZCB0aW1lb3V0Pw0KPiANCj4gS2luZCByZWdhcmRz
LA0KPiBCZWFuDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTog
TWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4NCj4gPiBTZW50OiBNb25k
YXksIEp1bmUgNSwgMjAyMyAxMDo0MCBBTQ0KPiA+IFRvOiBBbGV4YW5kZXIgU2hpeWFuIDxlYWds
ZS5hbGV4YW5kZXI5MjNAZ21haWwuY29tPg0KPiA+IENjOiBCZWFuIEh1byA8YmVhbmh1b0BtaWNy
b24uY29tPjsgSmFpbWVMaWFvIDxqYWltZWxpYW8udHdAZ21haWwuY29tPjsNCj4gPiBsaW51eC1t
dGRAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiA+IFN1YmplY3Q6IFJlOiBbRVhUXSBSZTogQm9vdCBm
YWlsZWQgYWZ0ZXIgcGF0Y2ggIm10ZDogcmF3bmFuZDogU3VwcG9ydA0KPiA+IGZvciBzZXF1ZW50
aWFsIGNhY2hlIHJlYWRzIg0KPiA+DQo+ID4gQ0FVVElPTjogRVhURVJOQUwgRU1BSUwuIERvIG5v
dCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcw0KPiA+IHlvdSByZWNvZ25p
emUgdGhlIHNlbmRlciBhbmQgd2VyZSBleHBlY3RpbmcgdGhpcyBtZXNzYWdlLg0KPiA+DQo+ID4N
Cj4gPiBIaSBBbGV4YW5kZXIsDQo+ID4NCj4gPiBlYWdsZS5hbGV4YW5kZXI5MjNAZ21haWwuY29t
IHdyb3RlIG9uIEZyaSwgMiBKdW4gMjAyMyAxMjo1MjowOCArMDMwMDoNCj4gPg0KPiA+ID4gSGVs
bG8uDQo+ID4gPg0KPiA+ID4gPiBBcyB5b3UgbWVudGlvbmVkIG5vIEVDQyBlcnJvci4gIEFuZCBT
cXVhc2hGUyBjb21wbGFpbnM6IFVuYWJsZSB0bw0KPiA+ID4gPiByZWFkIGRhdGENCj4gPiBjYWNo
ZS4NCj4gPiA+ID4gV2Ugd2FudCB0byBzZWUgSS9PeCwgUkUjLCBXRSMgYW5kIFIvQiMsIHRvIGNo
ZWNrIGlmIGNvbW1hbmQgaW5wdXQNCj4gPiA+ID4gYW5kIGRhdGENCj4gPiBvdXRwdXQgcHJvcGVy
bHkuDQo+ID4gPiA+IEl0IGlzIGJldHRlciB0byBjYXB0dXJlIHRoZSBjb21tYW5kIDMxaCwgYW5k
IGl0cyBmb2xsb3dpbmcgZGF0YS4NCj4gPiA+DQo+ID4gPiBJIG9ubHkgaGF2ZSBhIHR3by1jaGFu
bmVsIG9zY2lsbG9zY29wZSA6KSBJbiBhbnkgY2FzZSwgaW4gb3JkZXIgdG8NCj4gPiA+IGNhcHR1
cmUgdGhlIHJpZ2h0IG1vbWVudCwgSSBuZWVkIHRvIHNvbWVob3cgbG9vcCBjb21tYW5kIDB4MzEg
d2hlbg0KPiA+ID4gYW4gZXJyb3Igb2NjdXJzIGluIG9yZGVyIHRvIHRha2UgYSBwaWN0dXJlLiBS
aWdodD8NCj4gPiA+DQo+ID4gPiBQbGVhc2UsIHRlbGwgbWUgd2hlcmUgSSBjYW4gcGF0Y2ggdGhl
IG5hbmRfYmFzZSB0byBnZXQgc3VjaCBhbg0KPiA+ID4gaW5maW5pdHkgbG9vcCBvbiBlcnJvcj8N
Cj4gPg0KPiA+IEFueXdoZXJlIGluIHRoZSBjb3JlIHlvdSBjb3VsZCBqdXN0IG1ha2UgeW91ciBv
d24gZXhlY19vcCBzZXF1ZW5jZSBhbmQNCj4gPiBjYWxsIGl0IGluIGEgbG9vcCBJIGd1ZXNzPw0K
PiA+DQo+ID4gQmVhbiwgd2hhdCBhcmUgeW91IHRyeWluZyB0byBwaWN0dXJlIHByZWNpc2VseT8g
SGF2ZSB5b3UgZXZlciBoYWQgYW55DQo+ID4gaXNzdWVzIHdpdGggdGhlc2UgY29tbWFuZHM/IENh
biBBbGV4YW5kZXIgdHJ5IHRvIGFkZCBhIHN1cmdpY2FsIGRlbGF5IHNvbWV3aGVyZT8NCj4gPg0K
PiA+IFRoYW5rcywNCj4gPiBNaXF1w6hsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
