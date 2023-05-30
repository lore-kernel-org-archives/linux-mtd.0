Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4B6C7EE31
	for <linux-mtd@archiver.kernel.org>; Tue, 30 May 2023 14:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MbMXqt8Cb0JmxncIAqWRNel5ZV1PbkWJq0eFGFL9s4w=; b=NDdQA8ujE5WFlC
	vRNAIe6SE20xRRCwdapx8PsSCG8zbSWJ/4G8pbI45Q+L8w6RMF0JzRPR2nJtRM7H+lP0bTyjbrc51
	rE16ikXqlXc0qa669FJ3Nvl2w8oXL/zM7DxlsLVIL2FH1H4fjIAs34XcFcluNAHupBRAknKJpxO9v
	E7BOVWkNd5LWM9WUZHcXbf+6C/j6JYewyZqgc6qR3wIqabapdhzXC2mxJCAbI7qY4yel3plELafYo
	4ADrABMmWCr/6iYk8mUn6TOspdPOqkwRQ+8HRk05lwA4MIKgw3jozp/iYApO6tNOSB2MnaTgH0eJg
	QOPCku4Uk0Fz9+OO3Jvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q40fB-00EHZt-0l;
	Tue, 30 May 2023 14:49:29 +0000
Received: from mx0a-003b2802.pphosted.com ([205.220.168.83])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q40f8-00EHZD-0O
	for linux-mtd@lists.infradead.org;
	Tue, 30 May 2023 14:49:27 +0000
Received: from pps.filterd (m0278964.ppops.net [127.0.0.1])
	by mx0a-003b2802.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34UEl7GA030017;
	Tue, 30 May 2023 08:49:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=I1Cgb+IehKRxHx6bvP6fq28YfUz07G1aj3HmexJnMPo=;
 b=f/yXtaQFUujFJJFFL2cZTszqIN2WaWiKswhm2byG5VDQAuqtVJHPbU0ZeQ1oY432s2b8
 wTMszH4fvVnQWuTl3+Pzm9lk9kpxWYie4/1zyMD2LEyR8oGbjKoewISbfFVgiBDGV0GH
 TPC7PB5EkHIOsgV+9Aek/vac4JWfEQHV2Dtc9I4j4iK2zTaR8FwfCe8aNxTzzTMAKZGD
 TRVFR/szPMhroH6mHj0wIhXbgE43Ygh2LFd6Kh+4nhrzkVz4Ft1GK9qY1nqdF8GWCwsG
 hBgtsNz6X4jsARpl/uEZjJscw7MK5J4dIi0eU17TeBBHIo5fTHpxtputknAGn1KvQVJy sg== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2043.outbound.protection.outlook.com [104.47.57.43])
	by mx0a-003b2802.pphosted.com (PPS) with ESMTPS id 3qughnwgtm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 May 2023 08:49:20 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2WMq5JXMX19WKTwJuMl0dxVuJ3wPr2oMyfSDKzeTt1ef4qli5XCzIMNMflDqIqiVx8M3ymt7F0PoAHItBDNzx8CYvCQm0J+J504DNhm1ar2vKPrsX8r1i9GL4yzenL5CyO4bVhCeSyoWoqUtdvWXDf7YGTyfpWYts1whZK9/J0JGengUOA10Brh0vKjfqMRbmfrk/pMaN9uChyUMoFGNm0DbR4v5/tQD2itxSBLz2B1wwyPZJihJ9Sg9IJxr8hx28P/s1eOSpjKKtDCmB0Z+vnvstOIB8Kx/EsxnEIGN03Bw5cJsWRfXuD7E01EZxrMAaw7aRdI169MJNMuTS6I/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1Cgb+IehKRxHx6bvP6fq28YfUz07G1aj3HmexJnMPo=;
 b=RmzJ8EdCohL9k55aXrMjvss6BmoNTwFZ4wkOkpfaPBxF4hJ5IKRtuzVCKK5aEBczjgQYekVGGTWsZJWDedCQ4feUdPFbHMhUAOYz04FQKRWwOk+Awj/SmrDgT5OOZ36hrRuzYOfRffuYN7ekNVjGLdnfR/4lXwXHZXgPPjrIDMGpLqU+smw66rVavXJGciXjuplKzmaTyjgwDcu0XdlfxJ5tfO354gUCU+55sYvJnl+R10pDgzuVas6y34xJTQf5L/wQxhGNbNrShystU7Y+Vx++jIbCDiivHc9tGCkiD/K251CAZnRd/qnPwl2Rb0dHtpnAXPMi/RZMrvOaZAcdgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1Cgb+IehKRxHx6bvP6fq28YfUz07G1aj3HmexJnMPo=;
 b=QUCDIONrGe3+F2bj0OLmp7+xjO4OLgSvXDcWY8BDOupRgyO+xB1ZH8OmY4jHDVhlhgMgS/NWOj2aqHXYUA6DoC8Q2lD5zYlwU6N+8yjh+uEc3OFSMqTVdcyoMrGc3xVGLnlcICfUgqdVXQOFx9tbLKquBGEj3sT6eCS9bMU5mki1GqW4xvEVLc6jM4dAPLBSWLha7AP0pO3bkrul0K7NaddRpyNnxsKlXYQqm5ExktsBVf3RHXlbgm5vqPNBDt/ZlW6MVcOWRlq1np7T/8jUMUQoNo4al2HtAcN67Nf+GsGFupVqu9gTsP/aVBEaIMKIikzF3xcfbijshIX+SClYdw==
Received: from PH0PR08MB7889.namprd08.prod.outlook.com (2603:10b6:510:114::11)
 by CO1PR08MB6820.namprd08.prod.outlook.com (2603:10b6:303:9b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 14:48:43 +0000
Received: from PH0PR08MB7889.namprd08.prod.outlook.com
 ([fe80::838a:faaa:a6c:ce8b]) by PH0PR08MB7889.namprd08.prod.outlook.com
 ([fe80::838a:faaa:a6c:ce8b%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 14:48:42 +0000
From: Bean Huo <beanhuo@micron.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Alexander Shiyan
	<eagle.alexander923@gmail.com>
CC: JaimeLiao <jaimeliao.tw@gmail.com>,
        "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: RE: [EXT] Re: Boot failed after patch "mtd: rawnand: Support for
 sequential cache reads"
Thread-Topic: [EXT] Re: Boot failed after patch "mtd: rawnand: Support for
 sequential cache reads"
Thread-Index: AQHZkiMzb3ovCmHk00i8y+AILspS+q9y4RPg
Date: Tue, 30 May 2023 14:48:42 +0000
Message-ID: <PH0PR08MB788936E00C0DD958BFB9B3F6DB4B9@PH0PR08MB7889.namprd08.prod.outlook.com>
References: <CAP1tNvS=NVAm-vfvYWbc3k9Cx9YxMc2uZZkmXk8h1NhGX877Zg@mail.gmail.com>
	<20230526201420.231092a0@xps-13>
	<CAP1tNvQsmYKMHZ662f1yiLv2JmZZrnQsJr2Lf5xiafxJSkZfBQ@mail.gmail.com>
	<20230529101240.53065e04@xps-13>
	<CAP1tNvRTRkXMztGL=nxrd-Cv5xO58-R=A_M2r65d6cyidoVz0g@mail.gmail.com>
 <20230529134619.255d0b07@xps-13>
In-Reply-To: <20230529134619.255d0b07@xps-13>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_ActionId=bc8d6cf4-7cd7-44c0-b3ff-69332d8116dc;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_ContentBits=0;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_Enabled=true;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_Method=Privileged;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_Name=Public;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_SetDate=2023-05-30T14:26:42Z;MSIP_Label_6fdea275-d6f3-438f-b8d8-013cab2023d3_SiteId=f38a5ecd-2813-4862-b11b-ac1d563c806f;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR08MB7889:EE_|CO1PR08MB6820:EE_
x-ms-office365-filtering-correlation-id: 761b1cca-24b0-4702-b197-08db611cf68a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BiZzWCtqaVtyHfPV5C7jYRaSVDu629gt6zPBYhnvHy5cWS7vgHuma/60FKLY8tX4d7KfT4q3SZM1PIQ6vuxOnPMWw51aF7WLN8b155GzkQIPo7/5+pOxqiFQL8x5Incgv6BXdsCgomTzsxr1TYP3qjEjw/PMljBoESl8g9OnpWIdYacg27tWBx9Z1xXw1JBHnmcS/yrqpeaQQWuptQIFOQqVpOMeHXZzOA+g/WJRxPMElGcmNNHT6y/9wfyha3S7kg5vnvjj3BLpAV4NnJE9NvPkJfexm0bZONzS2hkZ/W8mAntol0SwueMTaEqM/3QfCDQAVGL3CvvlYIC1ufC1BYlAb4fpZi6AMaRPuOPEW6FDlMTEOSJWVs4NitkJvYaIiK+H7XWR3ixTkRySM8tWJa6O+Z9Nu9M+gowSxYFqMxlOnwD0DGZx3ZBPLm3/sJvmukIrJAGC5dkLTkEBS+c/pnWm5yXgpm705+vep1YUY23JkgCAKv02A3Ag4azN651gJgybNH5Oz6chtGHUUGNt+G3f7DD56psEzfZm0J9lLUJvmleTIX8xjIS7k5sTpm/w33yufPY2T8p8o29394Ae2TvalNmubEb6l1qKvvjsuVE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR08MB7889.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(451199021)(966005)(478600001)(83380400001)(55016003)(66574015)(5660300002)(186003)(33656002)(71200400001)(4326008)(7696005)(86362001)(8676002)(2906002)(8936002)(52536014)(41300700001)(316002)(122000001)(38100700002)(38070700005)(6506007)(26005)(66946007)(76116006)(54906003)(110136005)(9686003)(53546011)(66556008)(66446008)(66476007)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmM2WnlxY0xzaklyaUdFU2t2V0JoalB1Z2QzTEJ6RktwQkpmbkVZMzBHL2Zj?=
 =?utf-8?B?MXhQQVprWFN6UGdRUTREdklxTXFnUHVZTXd1UzFnVllOSFc3TEtXbFFlbDJl?=
 =?utf-8?B?cW5WK1RKekVhdm9LbElpNEFkcU5wQmVJdW5GUEZWZG1IdTBwV1lmUjIrUVpy?=
 =?utf-8?B?eGFBa2JXL2JtdThXTGdVcUV5NW92MXBia29wRWtteCtOcDBpbGVqMEN5MjVE?=
 =?utf-8?B?elFmMDhxcG9LQzVLYnVYV1RRK280QVpCQ3RTaGVhcy9SQUMrRWNJdFJzenNp?=
 =?utf-8?B?NkkyOG9YZExXbjFtd21NMnhIMXgyWFkrZEFuSy9xT3MrKytKVXREU1JIRFFY?=
 =?utf-8?B?WFdyMStBakxtTEI3bUU1aFBoYkc2VTdRclo1b29tOVZ0ZU4rcWIwVWQ2aUNm?=
 =?utf-8?B?VDg5S0FWQ21ETzBWV2dTSnRIT2phRFVZRTFZNFhkaW1vQ3VkVnhvMEV1RFZX?=
 =?utf-8?B?NXltZm8rMnI4YzBPa1dOL29JVzlmdVNYMDFEVDhTYW54NGhsaGVYS0lnRU04?=
 =?utf-8?B?T1hJVTM2SnlWWHh5NzZMYVRwMUxkN0cvN2twQUZIZjNmNVZENWlSNHBxYktT?=
 =?utf-8?B?bjI4a0xvQ3BydFNENlQ1bjl0cXBSUnJ3UkZvZm15MmJydllwNlJFWGkwREti?=
 =?utf-8?B?dEFHT3Q5elo4UmJaU0FZYzd6SkI3anRGd1htZ1NGSGJneFd2Vlo2WDBLS2NX?=
 =?utf-8?B?Y0svOUV4RStPd2cvOGNLdjVMODJLZDdHaloxemE4eFIycjRQNGkyVnpNRDlE?=
 =?utf-8?B?Y1Z6QkZ3bXVYQVVtR0ZPdjcxdG9pQURKQVpnQjFhZHVaSU1PWGhoZFFKUHFE?=
 =?utf-8?B?alJ2VmxmOXZ6Q01BdUl6THR2dzdhdTJzWDAzYWoxb0hNZDVrZ2R2NEVPa0lE?=
 =?utf-8?B?V2VqaVRWOHZWWThiV2kxelRsZ05PbDRTamRGcUkrSlRVV1dFYUtZZm1nb2FX?=
 =?utf-8?B?RVlVeW5yQjFraFZNVWQvaVJHSzg0azcwbmttVm5WVVhlN0hFMHorVnVXNkZD?=
 =?utf-8?B?elFTYnFZNTdqeE9iVVRlV0VZdzVHVEJseHpGUEpNK1RuTmZSY01SYjlOODNI?=
 =?utf-8?B?RUpRc00wZThaRzk3UW5HMlpwT3VFakhacHhTZTZBY1lNcTBhK2c2OVJmVmUv?=
 =?utf-8?B?Z21DaFlhaStxeFhEbFI1eGhoVWQ0ZXNoc2Q4TzlYaVliVm5kVW45SE43cmZS?=
 =?utf-8?B?MnRTWS9BRStzOG9kUXZnNDAvQ3VLWXF0ZWl2ME1yU3orSkJiMytvWmh4ZHdX?=
 =?utf-8?B?TG9mdWFTcTNDemRmaWl1QTRyZzRhaHU3MS81YTQrbUZWem05TzFMSTlWeDVz?=
 =?utf-8?B?R3ZBTXE4TmVISEZ0QXY2dXBZUDFXZURYUXFsWnhXZUVmcjlNTXg2eE9XNDR0?=
 =?utf-8?B?OFNSbFRpWjgvOHozVmdFcDV2VThnWGl5Q0U5NVhnRmk3T3FUdmo1Qk00c3Iz?=
 =?utf-8?B?S2pVVFE4UkxrZTVQM2hGODdXRVlXZnI1enN5OHR5Q2YvbHczVGlHZGlaODRD?=
 =?utf-8?B?Wm9pdlJkMTVWajQxMm00V2dXT2dJdFBJZ1NDdVNpd2dFV1R3UVdoNUhMRjZW?=
 =?utf-8?B?RUZkdWZ3bHF6ejlVbFBpRUIwbG80N0VwYk9KbGNIWVhzWjYrckhGN2FwTndn?=
 =?utf-8?B?aWIrYjVncGJhdXlLd25VQnBwVEtzcDhxdDlmMzZxOFd2NWdveXRPZ3Z3RDV1?=
 =?utf-8?B?eEJ2RElyM3lseFJJQkpBOTBMWktkVFVTVld3R1ZzTk8yWmE2STN3UFJoNUkr?=
 =?utf-8?B?SW5BQnJvTERBM29wb1Y3TkdZamN3KzU0Y2NrZ0hxU204bzdGOHROdzIzZmZy?=
 =?utf-8?B?czVzVHFkSnEyQ2NSdUhiczM1QkMrNWUyb01QWFdUb3Z1U2xZdXlVaXlJcGVH?=
 =?utf-8?B?M2E4N3dyKzBmdG43YkVYZkYvaTh4MTBBY05DOW9RdW1JQjd2ck9VVUFZMnc5?=
 =?utf-8?B?WVh2RHptdDVITTNqVU11dFJyb0Q0ZVRtclZwbU9VTzdBUk8yeEJsNXZxOGNk?=
 =?utf-8?B?dTd4Qkovazl0ejJXcE1FRlNISmM2dlZOMDFsd1FZc0NQNVVibWpnQkdLbzB1?=
 =?utf-8?B?SDAzOFhKaFFjZkllc0tKeWdjRkhvNjhVdVhUWGI3V3krSmVkQXpaaWx5REQx?=
 =?utf-8?Q?I6SA4AeFGnNBXw09wKGYdEYU/?=
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR08MB7889.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 761b1cca-24b0-4702-b197-08db611cf68a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2023 14:48:42.5854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eFTlGV6jtiEdxyLilKVWZ1y+CwTn5yqmymGF6BSW5ut0HxQ01i9Le2TCza0ZS8UaWmNH7k6G1XXnnDWnjkGZpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR08MB6820
X-Proofpoint-GUID: U3274C9HGRcCGE8pkUA3d9FdFNrhDvSt
X-Proofpoint-ORIG-GUID: U3274C9HGRcCGE8pkUA3d9FdFNrhDvSt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_074926_255932_087E7DD3 
X-CRM114-Status: GOOD (  36.51  )
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

SGkgTWlxdWVsLCANCg0KVGhhbmtzIGZvciByZWFjaGluZyBvdXQgbWUsIGhlcmUgaGFzIGEgVE4t
MjktMDE6IEluY3JlYXNpbmcgTkFORCBGbGFzaCBQZXJmb3JtYW5jZS4NCmh0dHBzOi8vbWVkaWEt
d3d3Lm1pY3Jvbi5jb20vLS9tZWRpYS9jbGllbnQvZ2xvYmFsL2RvY3VtZW50cy9wcm9kdWN0cy90
ZWNobmljYWwtbm90ZS9uYW5kLWZsYXNoL3RuMjkwMS5wZGY/cmV2PWEyMjhmZDE1NGMyNzRlZjc4
NjY5YjY3ZWEwOTdlY2RhDQoNCg0KSWYgQWxleGFuZGVyIGNhbiBkbyB0cmFjaW5nIHdpdGggb3Nj
aWxsb3Njb3BlIG9uIHRoZSBwYXJhbGxlbCBOQU5EIGJ1cywgdGhhdCB3b3VsZCBiZSBoZWxwIHRv
IGNoZWNrIGlmIHRoaXMgaXMgdGhlIHRpbWluZyBpc3N1ZS4gDQoNCktpbmQgcmVnYXJkcywNCkJl
YW4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPg0KPiBTZW50OiBNb25kYXksIE1heSAyOSwgMjAy
MyAxOjQ2IFBNDQo+IFRvOiBBbGV4YW5kZXIgU2hpeWFuIDxlYWdsZS5hbGV4YW5kZXI5MjNAZ21h
aWwuY29tPg0KPiBDYzogSmFpbWVMaWFvIDxqYWltZWxpYW8udHdAZ21haWwuY29tPjsgbGludXgt
bXRkQGxpc3RzLmluZnJhZGVhZC5vcmc7IEJlYW4gSHVvDQo+IDxiZWFuaHVvQG1pY3Jvbi5jb20+
DQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBCb290IGZhaWxlZCBhZnRlciBwYXRjaCAibXRkOiByYXdu
YW5kOiBTdXBwb3J0IGZvciBzZXF1ZW50aWFsDQo+IGNhY2hlIHJlYWRzIg0KPiANCj4gQ0FVVElP
TjogRVhURVJOQUwgRU1BSUwuIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRz
IHVubGVzcyB5b3UNCj4gcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIHdlcmUgZXhwZWN0aW5nIHRo
aXMgbWVzc2FnZS4NCj4gDQo+IA0KPiBIaSBCZWFuLA0KPiANCj4gSSdtIGFkZGluZyB5b3UgdG8g
dGhpcyB0aHJlYWQgYmVjYXVzZSBJJ20gY2x1ZWxlc3MgcmVnYXJkaW5nIHdoYXQncyBoYXBwZW5p
bmcgdG8NCj4gQWxleGFuZGVyLg0KPiANCj4gU2hvcnQgcmVjYXA6IHNlcXVlbnRpYWwgcGFnZSBy
ZWFkcyBzZWVtIHRvIGZhaWwgd2l0aCBhbiBNVDI5RiBNaWNyb24gY2hpcC4NCj4gQWxleGFuZGVy
IGlzIHVzaW5nIGEgZ3BtYyBjb250cm9sbGVyIHdpdGhvdXQgb24tZGllIEVDQywgSSBkb3VidCB0
aGUgZXJyb3IgY29tZXMNCj4gZnJvbSB0aGUgY29udHJvbGxlciwgc28gSSB3b3VsZCBsaWtlIHRv
IGtub3cgaWYgdGhlcmUgaXMgYW55dGhpbmcga25vd24gdG8gZmFpbCB3aXRoDQo+IHRoZXNlIGNo
aXBzIHJlZ2FyZGluZyB0aGUgdXNlIG9mIHNlcXVlbnRpYWwgcmVhZHMuIFdlIGNhbiBlYXNpbHkg
d29yayBhcm91bmQgdGhhdA0KPiBzaXR1YXRpb24gaWYgd2UgaWRlbnRpZnkgdGhlIHByb2JsZW0u
DQo+IA0KPiBUaGFua3MgYSBsb3QsDQo+IE1pcXXDqGwNCj4gDQo+IGVhZ2xlLmFsZXhhbmRlcjky
M0BnbWFpbC5jb20gd3JvdGUgb24gTW9uLCAyOSBNYXkgMjAyMw0KPiAxMzozMzowNCArMDMwMDoN
Cj4gDQo+ID4g0L/QvSwgMjkg0LzQsNGPIDIwMjPigK/Qsy4g0LIgMTE6MTIsIE1pcXVlbCBSYXlu
YWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Og0KPiA+IC4uLg0KPiA+IEFjY29yZGluZyB0
byB0aGUgTVQyOUYyRzA4QUJBRUFXUCBkYXRhc2hlZXQsIHRoZSBjaGlwIHN1cHBvcnRzDQo+ID4g
PiA+IHRoZSBSRUFEIFBBR0UgQ0FDSEUgU0VRVUVOVElBTCBvcGNvZGUsIGJ1dCB3aXRoIHR3byBj
YXZlYXRzOg0KPiA+ID4gPiAgNC4gVGhlc2UgY29tbWFuZHMgc3VwcG9ydGVkIG9ubHkgd2l0aCBF
Q0MgZGlzYWJsZWQuDQo+ID4gPiA+ICA1LiBJc3N1aW5nIGEgUkVBRCBQQUdFIENBQ0hFIHNlcmll
cyAoMzFoLCAwMGgtMzFoLCAzRmgpIGNvbW1hbmQNCj4gPiA+ID4gICB3aGVuIHRoZSBhcnJheSBp
cyBidXN5IChSRFkgPSAxLCBBUkRZID0gMCkgaXMgc3VwcG9ydGVkIGlmIHRoZSBwcmV2aW91cw0K
PiA+ID4gPiAgIGNvbW1hbmQgd2FzIGEgUkVBRCBQQUdFICgwMGgtMzBoKSBvciBSRUFEIFBBR0Ug
Q0FDSEUgc2VyaWVzDQo+ID4gPiA+ICAgY29tbWFuZDsgb3RoZXJ3aXNlLCBpdCBpcyBwcm9oaWJp
dGVkLg0KPiA+ID4gPg0KPiA+ID4gPiBBcyBmYXIgYXMgSSB1bmRlcnN0YW5kLCB0aGUgc2Vjb25k
IHJlbWFyayBzdWl0cyB1cywgc2luY2Ugd2UNCj4gPiA+ID4gY3JlYXRlIHRoZSBjb3JyZWN0IHNl
cXVlbmNlLg0KPiA+ID4NCj4gPiA+IEV4YWN0bHksIHdlIGRvOg0KPiA+ID4NCj4gPiA+ICAgICAg
ICAgUkVBRDAgKDApLCBSRUFEU1RBUlQgKDMwKSwNCj4gPiA+ICAgICAgICAgUkVBRENBQ0hFU0VR
ICgzMSksIGRhdGEsDQo+ID4gPiAgICAgICAgIFJFQURDQUNIRVNFUSAoMzEpLCBkYXRhLA0KPiA+
ID4gICAgICAgICAuLi4NCj4gPiA+ICAgICAgICAgUkVBRENBQ0hFRU5EICgzZiksIGRhdGEuDQo+
ID4gPg0KPiA+ID4gd2hpY2ggaXMgd2hhdCB0aGUgZGF0YXNoZWV0IHRlbGxzIHVzIEkgYmVsaWV2
ZS4NCj4gPiA+DQo+ID4gPiA+IEJ1dCB0aGUgZmlyc3QgcmVtYXJrIGNhbiBiZSBhIHByb2JsZW0g
aW4gdGhpcyBjYXNlLg0KPiA+ID4NCj4gPiA+IEkgd2FzIG5vdCBhd2FyZSBvZiB0aGlzIGxpbWl0
YXRpb24sIGl0J3Mgb25seSB3cml0dGVuIGluIHRoZQ0KPiA+ID4gc3VtbWFyeSwgbm90IGluIHRo
ZSBkZXRhaWxzIGFib3V0IHRoZSBjb21tYW5kcywgbmljZSBmaW5kaW5nLiBXZQ0KPiA+ID4gbmVl
ZCB0byBwcmV2ZW50IG9uLWRpZSBFQ0MgdXNlcnMgZnJvbSBlbmFibGluZyB0aGlzIGZlYXR1cmUu
DQo+ID4gPg0KPiA+ID4gQnV0IGdpdmVuIHRoZSBiZWxvdyB0cmFjZSwgeW91J3JlIG5vdCB1c2lu
ZyB0aGUgb24tZGllIEVDQyBlbmdpbmUsDQo+ID4gPiByaWdodD8gSXQgbG9va3MgbGlrZSB5b3Un
cmUgdXNpbmcgdGhlIGNvbnRyb2xsZXIncyBFTE0gZW5naW5lIHRvDQo+ID4gPiBwZXJmb3JtIEVD
QyBjb3JyZWN0aW9uLCBzbyBJIGRvbid0IHNlZSB3aHkgdGhpcyBzcGVjaWZpYyBsaW1pdGF0aW9u
DQo+ID4gPiB3b3VsZCBoaXQgdXMuIENhbiB5b3UgY29uZmlybSB0aGUgRUNDIGVuZ2luZSBvZiB0
aGUgY2hpcCBpcyBkaXNhYmxlZD8NCj4gPg0KPiA+IFllcywgb24tZGllIEVDQyBpcyBkaXNhYmxl
ZC4NCj4gPiBQbGVhc2UgYWR2aXNlIHdoZXJlIEkgY2FuIGluc2VydCBzb21lIGRlYnVnIG1lc3Nh
Z2VzIHRvIGNsZWFyIHRoaW5ncyB1cC4NCj4gPg0KPiA+ID4gPiA+ID4gb21hcC1ncG1jIDUwMDAw
MDAwLmdwbWM6IEdQTUMgcmV2aXNpb24gNi4wIC4uLg0KPiA+ID4gPiA+ID4gbmFuZDogZGV2aWNl
IGZvdW5kLCBNYW51ZmFjdHVyZXIgSUQ6IDB4MmMsIENoaXAgSUQ6IDB4ZGENCj4gPiA+ID4gPiA+
IG5hbmQ6IE1pY3JvbiBNVDI5RjJHMDhBQkFFQVdQDQo+ID4gPiA+ID4gPiBuYW5kOiAyNTYgTWlC
LCBTTEMsIGVyYXNlIHNpemU6IDEyOCBLaUIsIHBhZ2Ugc2l6ZTogMjA0OCwgT09CDQo+ID4gPiA+
ID4gPiBzaXplOiA2NA0KPiA+ID4gPiA+ID4gbmFuZDogdXNpbmcgT01BUF9FQ0NfQkNIOF9DT0RF
X0hXIEVDQyBzY2hlbWUgLi4uDQo+ID4gPiA+ID4gPiBWRlM6IE1vdW50ZWQgcm9vdCAoc3F1YXNo
ZnMgZmlsZXN5c3RlbSkgcmVhZG9ubHkgb24gZGV2aWNlIDI1NDowLg0KPiA+ID4gPiA+ID4gZGV2
dG1wZnM6IG1vdW50ZWQNCj4gPiA+ID4gPiA+IEZyZWVpbmcgdW51c2VkIGtlcm5lbCBpbWFnZSAo
aW5pdG1lbSkgbWVtb3J5OiAxMDI0SyBSdW4NCj4gPiA+ID4gPiA+IC9zYmluL2luaXQgYXMgaW5p
dCBwcm9jZXNzIFNRVUFTSEZTIGVycm9yOiBsem8gZGVjb21wcmVzc2lvbg0KPiA+ID4gPiA+ID4g
ZmFpbGVkLCBkYXRhIHByb2JhYmx5IGNvcnJ1cHQgU1FVQVNIRlMgZXJyb3I6IEZhaWxlZCB0byBy
ZWFkDQo+ID4gPiA+ID4gPiBibG9jayAweGQyOTFjMjogLTUgU1FVQVNIRlMgZXJyb3I6IGx6byBk
ZWNvbXByZXNzaW9uIGZhaWxlZCwNCj4gPiA+ID4gPiA+IGRhdGEgcHJvYmFibHkgY29ycnVwdCBT
UVVBU0hGUyBlcnJvcjogRmFpbGVkIHRvIHJlYWQgYmxvY2sNCj4gPiA+ID4gPiA+IDB4ZDI5MWMy
OiAtNSBTUVVBU0hGUyBlcnJvcjogVW5hYmxlIHRvIHJlYWQgZGF0YSBjYWNoZSBlbnRyeQ0KPiA+
ID4gPiA+ID4gW2QyOTFjMl0gU1FVQVNIRlMgZXJyb3I6IFVuYWJsZSB0byByZWFkIHBhZ2UsIGJs
b2NrIGQyOTFjMiwNCj4gPiA+ID4gPiA+IHNpemUgMTQzMDcgU1FVQVNIRlMgZXJyb3I6IFVuYWJs
ZSB0byByZWFkIGRhdGEgY2FjaGUgZW50cnkNCj4gPiA+ID4gPiA+IFtkMjkxYzJdIFNRVUFTSEZT
IGVycm9yOiBVbmFibGUgdG8gcmVhZCBwYWdlLCBibG9jayBkMjkxYzIsDQo+ID4gPiA+ID4gPiBz
aXplIDE0MzA3IEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBBdHRlbXB0ZWQgdG8ga2lsbCBp
bml0IQ0KPiA+ID4gPiA+ID4gZXhpdGNvZGU9MHgwMDAwMDAwNyBDUFU6IDAgUElEOiAxIENvbW06
IGluaXQgTm90IHRhaW50ZWQNCj4gPiA+ID4gPiA+IDYuMy4wKyAjMTA1IEhhcmR3YXJlIG5hbWU6
IEdlbmVyaWMgQU0zM1hYIChGbGF0dGVuZWQgRGV2aWNlDQo+ID4gPiA+ID4gPiBUcmVlKSAgdW53
aW5kX2JhY2t0cmFjZSBmcm9tIHNob3dfc3RhY2srMHhiLzB4YyAgc2hvd19zdGFjaw0KPiA+ID4g
PiA+ID4gZnJvbSBkdW1wX3N0YWNrX2x2bCsweDJiLzB4MzQgIGR1bXBfc3RhY2tfbHZsIGZyb20N
Cj4gPiA+ID4gPiA+IHBhbmljKzB4YmQvMHgyMzAgIHBhbmljIGZyb20gbWFrZV90YXNrX2RlYWQr
MHgxLzB4MTIwDQo+ID4gPiA+ID4gPiBtYWtlX3Rhc2tfZGVhZCBmcm9tIDB4YzEwMmNhODAgLS0t
WyBlbmQgS2VybmVsIHBhbmljIC0gbm90DQo+ID4gPiA+ID4gPiBzeW5jaW5nOiBBdHRlbXB0ZWQg
dG8ga2lsbCBpbml0IQ0KPiA+ID4gPiA+ID4gZXhpdGNvZGU9MHgwMDAwMDAwNyBdLS0tDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
