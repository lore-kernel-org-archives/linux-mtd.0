Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29931CD37B7
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2026 06:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+JQlwGwkjhVdYGkj6+SIRKi0aNog61CDqAwnKNTmAyM=; b=4164EedSvMGDOq
	KD20o95sR5R0ya2zDspogRR/9m6mZ5aSuPy592A12MLob5VAxPgRsRz7zOCmu9GyzidP0DWeKuZP2
	uN6WqisC+ofqMv/zz0ZPAq1VIN/Da5j7lnmXaYZ5QA+OdGScvTAPDHsncB7PcfuXnyb1ZpQ/Nqa/t
	WyBOTwk0qRnW5EeAE77Jf6kOUsqcHaBglDR1SkmM3oTayuuaybf/ZNsxx1G2nGy9svQzCnVyx85N+
	AaTLrUHswp7QnKfokKglJfI3UMfM6AX/Bw1oSxS2RakTlc02CcOiQ62CbfQTLpLoNc631NJcLrS4C
	Ci01n7YrGMvhJz0OUMCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMJmj-0000000CRtp-3kEZ;
	Mon, 11 May 2026 06:06:33 +0000
Received: from mx0a-009ae801.pphosted.com ([208.56.8.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMJmf-0000000CRt0-0JVb
	for linux-mtd@lists.infradead.org;
	Mon, 11 May 2026 06:06:30 +0000
Received: from pps.filterd (m0495959.ppops.net [127.0.0.1])
	by mx0a-009ae801.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B3edvJ1829857;
	Mon, 11 May 2026 14:06:07 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=issi.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=11242025; bh=vpDDymUD9UtmXq+k0exb2ct
	ThaFXz4AeBW5pPfPic4o=; b=FnQupq92JyvSjCFHsWKx4ZoOLwlCWE0iZTpjPHN
	61UThPtWAiHTonxHy+QCoO7BiZyemMXdHhGFStcPjg57nezhTrESzNuwPaLIo+1p
	bxHotYmUsgBfDpK2XzTkZvV8/lpmB+P7cPZ/hn1zb29QPt//yctLctdSd9e3nDQm
	2D1m0br7PNuiOCaQvp7pCiCqWFlozLH1uZylxN07ggRxXtDKfEs6E/4EINEPZyUf
	C5ICggEH/QidtVFd99dlZsDYNGt3ztAOtXqeYZAJSqwcLoECnz8UucLrAqD7DxvH
	gp6titgLv0Thuel92VhvrDwfggEu/kgsbJMyqHHbgnTF/VQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020076.outbound.protection.outlook.com [40.93.198.76])
	by mx0a-009ae801.pphosted.com (PPS) with ESMTPS id 4e2c0u0ppg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 14:06:07 +0800 (WST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QMG6CletjZ0DmCHXmVUrwuo9XYDtBPiwCbCvklqQjVshC8Vla77x7u/NiiFp5HrK/RCs9KbFjY1gv1FJeEaTrwsHBwgcnMqSvBFEIws1QYzyqh10ZX7scc+5uzRMksZ1X/gJ5bYRhy0nyLO785zGmBFajFfRlq5gxe39qt/78x+CVFFuPF4DqedXE5UjVZm2rHltsoOHirv3AayG9SNAQv6hlF3Ts9RbDV+3BFGpWS6TUZ5X6F+Si8L/KBO3jpRodf/djGq5O9/alzoXXDJQkgXaCnKYk5xhsbg5ZT858PWC4kDq5pyJaXgTotSLVFPKJJtOBKtQv0fEdDMOHvo32w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpDDymUD9UtmXq+k0exb2ctThaFXz4AeBW5pPfPic4o=;
 b=XkzJE+6Vxwi+1ssLHwCEYDQiJ1n6kxzdwC1OytdL6ZPS3h2B91WRf8DOBjNwEWIeIxj8SVpQVxlNgqwEq6A0kHwTUlowsuUckVwS9fYdLDGjII21hcFHgOYp5ivmHLTjW4hMSgoyHpEOv+0iwbtbVjczKMSgxEV7UtLdKSX7XKDil986P6e3mPrlozW75Ia4H0rtDA66/5ZsofRLr4zuFcENQXi/215sgdH1f70ifqCtFLG1CfBOorUfLGNFUoPFWpLbSxlhltb7HpeDqPY1IMThts0UkzuqBEOmUPXfmRxYF4XG9BDBkU3ia1m7BDG52wOqnl73o5tqVEdC2LxwYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=issi.com; dmarc=pass action=none header.from=issi.com;
 dkim=pass header.d=issi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=issi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpDDymUD9UtmXq+k0exb2ctThaFXz4AeBW5pPfPic4o=;
 b=kppOgMrR5EFndMyx7Soa3oDU2xoJXNa9+YUME9qX/F6jEVzuoF3UgMugmBq2MNqYQTLjEeqqQ6HgmUUS+n/83rhx82s4QXvjNnfxfujPme6lNiQ0/BxIMvx/U/ARDKVnmPs+YZS7o5FOSdHbHKlz/Cd2veMKvj+nhWsA1P61c84=
Received: from LV8PR19MB8597.namprd19.prod.outlook.com (2603:10b6:408:25c::15)
 by SJ0PR19MB5416.namprd19.prod.outlook.com (2603:10b6:a03:3d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 06:06:03 +0000
Received: from LV8PR19MB8597.namprd19.prod.outlook.com
 ([fe80::d035:5ff:4546:5713]) by LV8PR19MB8597.namprd19.prod.outlook.com
 ([fe80::d035:5ff:4546:5713%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 06:06:02 +0000
From: Jeffrey Yu <jeyu@issi.com>
To: "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
        "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>,
        "computersforpeace@gmail.com"
	<computersforpeace@gmail.com>,
        "bbrezillon@kernel.org"
	<bbrezillon@kernel.org>,
        "richard@nod.at" <richard@nod.at>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        Ji-Ho Kim
	<jhkim@issi.com>, "Mutya, Havish" <havish.mutya@amd.com>
Subject: [PATCH] Add JEDEC ID table entries for additional ISSI SPI-NOR
  devices.
Thread-Topic: [PATCH] Add JEDEC ID table entries for additional ISSI SPI-NOR
  devices.
Thread-Index: AQHc4QnpIel8cMKs3kmXmxGteCCkPw==
Date: Mon, 11 May 2026 06:06:02 +0000
Message-ID: <LV8PR19MB85977D6569B526DB1B068CACB6382@LV8PR19MB8597.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR19MB8597:EE_|SJ0PR19MB5416:EE_
x-ms-office365-filtering-correlation-id: cb0608d0-2eb0-4d1e-ab7b-08deaf23615e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|38070700021|13003099007|18002099003;
x-microsoft-antispam-message-info: 8WQ58s3fT8uPQ0jzBHlagO1UKyoCjfw4C3xhXPb/zR407GIyWxxD9XCRex0YdnSg2VQHO1GdXmfJSyJYL+oTthC6r/Pkj7Nm3u+0MwAx35RtOFcavNMH6o1D1eEk11rYtKKCB6SVPe+fDh6CU/EBm/VERDleSVM/F1WKzKpA1GKIffvSomKB1IPr49E0JPXhhplDzsXubz0bPpQoQosnBm8NyUbU399Ru9JKUW0tOMJiDYlqNTRBnznj1PqLHvokjhNvOeFdNwegJCjbFkaqX6iMIQtKGU91nkahCxE8yacf66SeNcTjhpZ/7GOL+kItTnorXg9UWpe4IlYp5C/GefO12j3GbWgH8RTGjWjTC+ugWDdX6k+sMtJ/XVV25OEv+cBcMSlcgoMvKJRY+ou+qqV69DiK4QiWtJ+8GVoUhENb+nsoWsvQJg56CulUg4jxYukqU0rhfEKMTeTYzBbuiTKIyMfrnD4ge+0SRbWlhbtCZeHNiewCTrIYc7beXNWVkXQb31MWgvBlAmMyRlkOh5ovTtWOFE5fYVm8ZBMf2VJy9mzzp1cB1EQP/acq0QMBEdmC5ovgfOlex9SPOsJ+BurZbNSMevjCGEbFvASlL2FrMTQZz/AbBrDHHolagQxtDfTEonVYMdyjquoKJVsN2yPWIFnuQnEyhIqHSIkcLV9UtNwK8AqUFTsoUD90MwMCmkTqosfjvtWSSJfdtt4s7w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR19MB8597.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(38070700021)(13003099007)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ka4BTCQmmREoSi8zJzELEMMm3fH3GySf5Bs8uMXZAcSg+gSpMs0qN+rMvc?=
 =?iso-8859-1?Q?laIeXl0rcdSPmsTJDXToITEZu1xRlbN32BpXB7MzN6MsSMSmFpHLHyirXD?=
 =?iso-8859-1?Q?aCj5JIo06JasHKmOFF4XXM3kzHImPc9HLqzkMqUvWIv3WfeC69OKCmJzsY?=
 =?iso-8859-1?Q?9lIBbL/+iIJNUm6RWhWNMBi3CZmyhjK3rGVgPhj3ni2Msu6DQyqBMWTd6V?=
 =?iso-8859-1?Q?E4N+q/DzmmJXqcHxu+5o+K+qsASioaq44VSn2iA729dOCfZuZ1OWMQt4uq?=
 =?iso-8859-1?Q?YZqya/S27gEuDbk8R8AxtFGF5h3Fzjdvos2He4eLAT3ITRP3v+bwq4yHNt?=
 =?iso-8859-1?Q?dQMs62PfiQ2lx3jn09x5yUq8o47eDuNkoDtzIdpmZ5xdJMERS7KIcNlw51?=
 =?iso-8859-1?Q?sa9oy347qJZMO/c4opurvLKYSq5Pw/XyKz+eUiOCTcR3gs0pQ2HnymdZZG?=
 =?iso-8859-1?Q?cT4q1tJDdYTyydulh6JXPIJ+DL+2b3YI3j5ZCgjOaMrAmQv+TZCArJ5TPL?=
 =?iso-8859-1?Q?fenW5OS3H8x4oFdSjgNR9TCPWgym4tW3z4P7Hc/PK+Irf1lui0OsS7X+8M?=
 =?iso-8859-1?Q?e9B899JBDfhjTVp7UG0QbI2LQbI5ToITVABUStnh+DaE3H6xYoqqeVwBan?=
 =?iso-8859-1?Q?ZTYWl+Htf/8Bl1O1xB4SZs49xY/2AToF/VlEmH8IQghCXgD7lWpWcT4wL0?=
 =?iso-8859-1?Q?6BqBvOKZCtL7hn7j/83QzSzQcHEodcZpJk3w8PjmmBbSTKj+XQxLfKf6a9?=
 =?iso-8859-1?Q?6isppyVQPhd5Rk4pP7hN7h/stScGpmnFudO528EJexUMBcY5Sf1vz0V89U?=
 =?iso-8859-1?Q?3RM/9Jfn3rp6slhYeroO7sKP5cq3YCLc9VnWB/kloXz+QWRUOapmu8hFlq?=
 =?iso-8859-1?Q?dgbwOydhFiU8veVcBGL4/qc76nmLCi7xfM4NUVKzabQRBvdg4gQGE+S18g?=
 =?iso-8859-1?Q?C+/xSwxW9qS93zYnm6Nj3J72QpdpdJjRIJ0oCLOjjbZas27QL3f4rPNrBT?=
 =?iso-8859-1?Q?pexQT/GkvkgPu6S3ejwY9iBIqN/5IHHyqKG40milroWdPxyfKboWw1+NPc?=
 =?iso-8859-1?Q?BwhIHlUS14S4m8XEa8poAx/aef2e3M6JpqBVN+cFosNlpZEtYuoR+ljP0s?=
 =?iso-8859-1?Q?DiXHnzvGyzQJD1z5hOUngYBmhQ3vcqGuxwHEFS+kdWyWx00KE/0EVc9B87?=
 =?iso-8859-1?Q?kSmystPhKhel1f2UWIK1sMRq9Ug4sVPOdC3wrQQYybcCRHBiueT1YnexFX?=
 =?iso-8859-1?Q?Its4vD/vn3G1yYeKzVfJMxAkC1rteOkNK8PdtzBvQv2BJTicH2GHI3Z1N7?=
 =?iso-8859-1?Q?xhWYh5hspSrHr03ul61H3yMX4QoutHisSUWbg/T2Bqro0Zzibp3H6tN66U?=
 =?iso-8859-1?Q?ZjTrYn+VTJePjEYKaKQfA2pHQsOlEei0zgHf7ghgDIr//OkWaGbiSDBwKr?=
 =?iso-8859-1?Q?GKRKkCGhI+MEExAj04HoQbDuMce7OAZp3f41LZYd64LBPqhVOLZAlNrWcD?=
 =?iso-8859-1?Q?Y1RpW0vW7fhEcc/+Pps8e6PqinNAEfEQPE6o/vJAmZ972e9N9JcblhdpK9?=
 =?iso-8859-1?Q?ticel/+LA0x+Mp28WRd81QX3Rrvwrj0cYxSuXet2JnHRW5yaY5BFEX887P?=
 =?iso-8859-1?Q?FqIrNwoGEzKAeQEWvSELWPjEdVPJDGhzK1khg7rQy0Wx1A9b22jqVlMi7q?=
 =?iso-8859-1?Q?3STCp/8zGSUxd+IuHTC7L13uulRIclAJ6ir2p8zdNlgA6We5SoUH7RHs/L?=
 =?iso-8859-1?Q?HvEQ1sfQPtOJNqMxNSiP333d0YpXCFsJPdmquZ+XUlT4FR?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sjTHXAnDPYCUsQuQIWgyD4QIo6yzW7AHuYhyWD9SA8Yss5mwfJarzq/KKxpmGi9DFkAje/2u2XVTzvbMyGkwcEwX4PPz5KvTU5GmpkqQtu/V8wSmMLCba3E5ZQUonN92EHiBVkTGPpBHvO0vh9P3CSs2DITa5KzUkIx+lhROC29laInKd2OLOY8rRS4HGJsASa1w9PI6gILwPt6DOeMpF0DeyJLTE5ST6LSabWb1+nOcSrHxSVl1lKe9YSFt8jno6b0QGs6TLvDpawlnZhZGV+RSHcsJsD2ZS+3iwf83IQKej/jcV8rFd31KZ4E1RTXlRdVdFyVead+QX+1Y8ry4xg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: rHZkZ2EQVnWTHlx1CxJ9EA4JLI2O9+jB0QCP9RCgHeH4E//3gvSLhB/6qNsUEUcl7vfQd+rzmq/G0quDFKAFKu6jm1FR3AUIbE59dpRKZuOEjCGnWu48gY49RFTBdH/pdcZ0gmqSdtHztmxgoO5dlqFdry0W7HXjz608+dQ5IKZoeYCiIgn2WIj+qguFS3B9mzUnZVcwH/46x/s8QzUkX0+Oaj8fgcF9ko0ItbJy2y4Afu0dw9dCs6l8+CKecmcqoACKVEOsZ1nqDF24cuAf8/vdoAJgIh6Uds5vbSlgeTjynNM9w0oXOz24eCHGEa576upJoDgAHrouNFrXcViaoSaixNkzs0eEE2eNpIHynVuf7y13IlP7BswFSNpkHLupkDQkXA55WaaqNhc8zzOxzr4GCDUObK6iX07+nuRYhN91rD8M9pXDsvJWfNMcFCDeST89xPf6GkVit3VUb92VDGWqn+o6Kp3eiGFsfflhf5Jb+bKWtcQwu8Px/o2yD32HLQFFlKZsy5e4vg48Lmv9OkB7grNqsnTvkKpKqxrfHKozYG8OgMFroaLhF0UC8UL8UsCLRN5XhEEitC/1mcr8a+pCbRqC8zJZhA/10SGHzMKawaVYAFD3gijZ7r4CZ2GU
X-OriginatorOrg: issi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR19MB8597.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb0608d0-2eb0-4d1e-ab7b-08deaf23615e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2026 06:06:02.5471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6af618fc-4f7d-45f1-a2f2-8c59a26d2c10
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z5ehS6xiomoUJSiLtLi4XwMq9w6oGiZT3JDOBrJMalXGaeBmhmVA/TFp/kHI0JM4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB5416
X-Authority-Analysis: v=2.4 cv=A99c+aWG c=1 sm=1 tr=0 ts=6a0171cf cx=c_pps
 a=MbNv1jpVkP+ZxYLbwzdjUA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=NGcC8JguVDcA:10 a=ozMtBe7fU4EA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yOHNzV93IasTtWdH6Nhn:22 a=vXxuYqdcOO96AszD6dbd:22 a=DUnRZS7UAAAA:8
 a=nvTeL_1jq9qHVabOFKcA:9 a=wPNLvfGTeEIA:10 a=cDzw7mrAGmWHSR5u0tpu:22
X-Proofpoint-GUID: OFghxzedWIErpqQA7QvFBpMrSTiY7YXc
X-Proofpoint-ORIG-GUID: OFghxzedWIErpqQA7QvFBpMrSTiY7YXc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA2NCBTYWx0ZWRfX+wOLX/+OZADl
 A/gYm8B0+x6M3Ml7jlNWnHeHiu9F9nd4/CrA66dm5UxVwoihgAvu7g0qwqMSXl6i01FSQtxh1o8
 yuU6wrnQzqrkgZmlVLzLsBLOIlBkVkB3DFD0/EKoyHaT4eu+DEkKS5MUQzwQVEIbIMjRSVARPKU
 0aAB7Z8Zmc9e+ONeGRkM1PKyKd3COqlxjejWswLjeQ7Bopz55lFcROFpjqawamquwryl5nFQsDY
 qbnb396hmVekqsiKDJA3NAvVwzSUMcTfXaGaPYNPsOIw6DKimoL8vIJEXUx2UmkmnxC3DBAwOXW
 uGsqg23mztVaQlXiJVfCMiZPQWc3iMhxet21vZlUP3xbTn30psE5IgPEz6Cm9mnLpBqTLjpEmYS
 VoYAr5pOgqNf+/kX4qmqNaVp5HsIVr1uaJMRmMrFGaRFTANsCn6nDpWVnnfo8ditfKH2yFfY3Gs
 Nimx3f5ExLUEGPIoi4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1011 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_230629_142836_1DB39A8B 
X-CRM114-Status: UNSURE (   9.34  )
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

Add JEDEC ID table entries for additional ISSI SPI-NOR
 devices.

These parts previously not yet supported.
With these entries, Linux software can match the device by JEDEC ID
and use the existing ISSI SPI-NOR device handling.

Newly added devices include:
  - IS25LP512MJ  (JEDEC 0x9d6020)
    https://www.issi.com/WW/pdf/25LP-WP512MJ.pdf
  - IS25WP512MJ  (JEDEC 0x9d7020)
    https://www.issi.com/WW/pdf/25LP-WP512MJ.pdf
  - IS25LP010E   (JEDEC 0x9d4011)
    https://www.issi.com/WW/pdf/25LP-WP040E-020E-010E-512E-025E.pdf
  - IS25LP020E   (JEDEC 0x9d4012)
    https://www.issi.com/WW/pdf/25LP-WP040E-020E-010E-512E-025E.pdf
  - IS25LP040E   (JEDEC 0x9d4013)
    https://www.issi.com/WW/pdf/25LP-WP040E-020E-010E-512E-025E.pdf
  - IS25LP01GJ   (JEDEC 0x9d6021)
    https://www.issi.com/WW/pdf/25LP-WP01GJ.pdf
  - IS25LP02GG   (JEDEC 0x9d6022)
    https://www.issi.com/WW/pdf/25LP-WP02GG.pdf
  - IS25LP02GJ   (JEDEC 0x9d6022)
    https://www.issi.com/WW/pdf/25LP-WP02GJ.pdf
  - IS25WP01GG   (JEDEC 0x9d7021)
    https://www.issi.com/WW/pdf/25LP-WP01GG.pdf
  - IS25WP01GJ   (JEDEC 0x9d7021)
    https://www.issi.com/WW/pdf/25LP-WP01GJ.pdf
  - IS25WJ128F   (JEDEC 0x9d7118)
    https://www.issi.com/WW/pdf/25WJ128F.pdf
  - IS25WP02GG   (JEDEC 0x9d7022)
    https://www.issi.com/WW/pdf/25LP-WP02GG.pdf
  - IS25WP02GJ   (JEDEC 0x9d7022)
    https://www.issi.com/WW/pdf/25LP-WP02GJ.pdf

Signed-off-by: Jeff Yu <jeyu@issi.com>
---
 drivers/mtd/spi-nor/issi.c | 571 +++++++++++++++++++++++++++++++++++++
 1 file changed, 571 insertions(+)
 create mode 100644 drivers/mtd/spi-nor/issi.c

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
new file mode 100644
index 000000000000..56a1fccc6b5b
--- /dev/null
+++ b/drivers/mtd/spi-nor/issi.c
@@ -0,0 +1,571 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2005, Intec Automation Inc.
+ * Copyright (C) 2014, Freescale Semiconductor, Inc.
+ */
+
+#include <linux/mtd/spi-nor.h>
+
+#include "core.h"
+
+#define SPINOR_OP_IS_DTR_RD    0xfd    /* Fast Read opcode in DTR mode */
+#define SPINOR_OP_IS_RD_ANY_REG        0x85    /* Read volatile register */
+#define SPINOR_OP_IS_WR_ANY_REG        0x81    /* Write volatile register */
+#define SPINOR_REG_IS_CFR0V    0x00    /* For setting octal DTR mode */
+#define SPINOR_REG_IS_CFR1V    0x01    /* For setting dummy cycles */
+#define SPINOR_IS_OCT_DTR      0xe7    /* Enable Octal DTR. */
+#define SPINOR_IS_EXSPI                0xff    /* Enable Extended SPI (default) */
+
+static int spi_nor_issi_phy_enable(struct spi_nor *nor)
+{
+       struct spi_mem_op op;
+       u8 *buf = nor->bouncebuf;
+       int ret;
+
+       ret = spi_nor_write_enable(nor);
+       if (ret)
+               goto ret;
+
+       buf[0] = SPINOR_IS_EXSPI;
+
+       op = (struct spi_mem_op)
+               SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
+                          SPI_MEM_OP_ADDR(4, SPINOR_REG_IS_CFR0V, 1),
+                          SPI_MEM_OP_NO_DUMMY,
+                          SPI_MEM_OP_DATA_OUT(1, buf, 1));
+
+       spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_1_1_1);
+
+       ret = spi_mem_exec_op(nor->spimem, &op);
+       if (ret)
+               goto ret;
+
+       nor->spimem->spi->controller->flags |= SPI_CONTROLLER_SDR_PHY;
+       /* Read flash ID to make sure the switch was successful. */
+       op = (struct spi_mem_op)
+               SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
+                          SPI_MEM_OP_NO_ADDR,
+                          SPI_MEM_OP_DUMMY(0, 1),
+                          SPI_MEM_OP_DATA_IN(nor->info->id->len, buf, 1));
+
+       spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_1_1_1);
+
+       ret = spi_mem_exec_op(nor->spimem, &op);
+       if (ret)
+               goto ret;
+
+       if (memcmp(buf, nor->info->id->bytes, nor->info->id->len))
+               goto ret;
+
+       return 0;
+ret:
+       nor->spimem->spi->controller->flags &= ~SPI_CONTROLLER_SDR_PHY;
+       return 0;
+}
+static int spi_nor_issi_octal_dtr_enable(struct spi_nor *nor, bool enable)
+{
+       struct spi_mem_op op;
+       u8 *buf = nor->bouncebuf;
+       int ret;
+
+       if (enable) {
+               /* Use 20 dummy cycles for memory array reads. */
+               ret = spi_nor_write_enable(nor);
+               if (ret)
+                       return ret;
+
+               *buf = 20;
+               op = (struct spi_mem_op)
+                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
+                                  SPI_MEM_OP_ADDR(3, SPINOR_REG_IS_CFR1V, 1),
+                                  SPI_MEM_OP_NO_DUMMY,
+                                  SPI_MEM_OP_DATA_OUT(1, buf, 1));
+
+               ret = spi_mem_exec_op(nor->spimem, &op);
+               if (ret)
+                       return ret;
+
+               ret = spi_nor_wait_till_ready(nor);
+               if (ret)
+                       return ret;
+       }
+
+       ret = spi_nor_write_enable(nor);
+       if (ret)
+               return ret;
+
+       if (enable)
+               *buf = SPINOR_IS_OCT_DTR;
+       else
+               *buf = SPINOR_IS_EXSPI;
+
+       op = (struct spi_mem_op)
+               SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
+                          SPI_MEM_OP_ADDR(enable ? 3 : 4,
+                                          SPINOR_REG_IS_CFR0V, 1),
+                          SPI_MEM_OP_NO_DUMMY,
+                          SPI_MEM_OP_DATA_OUT(1, buf, 1));
+
+       if (!enable)
+               spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
+
+       ret = spi_mem_exec_op(nor->spimem, &op);
+       if (ret)
+               return ret;
+
+       if ((nor->flags & SNOR_F_HAS_STACKED) && nor->spimem->spi->cs_index_mask == 1)
+               return 0;
+
+       /* Read flash ID to make sure the switch was successful. */
+       op = (struct spi_mem_op)
+               SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
+                          SPI_MEM_OP_NO_ADDR,
+                          SPI_MEM_OP_DUMMY(enable ? 8 : 0, 1),
+                          SPI_MEM_OP_DATA_IN(round_up(nor->info->id->len, 2),
+                                             buf, 1));
+
+       if (enable)
+               spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
+
+       ret = spi_mem_exec_op(nor->spimem, &op);
+       if (ret)
+               return ret;
+
+       if (memcmp(buf, nor->info->id->bytes, nor->info->id->len))
+               return -EINVAL;
+
+       return 0;
+}
+
+static int is25wx256_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
+{
+       int ret;
+
+       ret = spi_nor_write_enable(nor);
+       if (ret)
+               return ret;
+
+       ret = spi_nor_set_4byte_addr_mode(nor, enable);
+       if (ret)
+               return ret;
+
+       return spi_nor_write_disable(nor);
+}
+
+static void is25wx256_default_init(struct spi_nor *nor)
+{
+       struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+       params->set_octal_dtr = spi_nor_issi_octal_dtr_enable;
+       params->set_4byte_addr_mode = is25wx256_set_4byte_addr_mode;
+       params->phy_enable = spi_nor_issi_phy_enable;
+}
+
+static int is25wx256_post_sfdp_fixup(struct spi_nor *nor)
+{
+       struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+       /* Set the Fast Read settings. */
+       params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
+       spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
+                                 0, 20, SPINOR_OP_IS_DTR_RD,
+                                 SNOR_PROTO_8_8_8_DTR);
+
+       nor->cmd_ext_type = SPI_NOR_EXT_REPEAT;
+       params->rdsr_dummy = 8;
+       params->rdsr_addr_nbytes = 0;
+
+       /*
+        * The BFPT quad enable field is set to a reserved value so the quad
+        * enable function is ignored by spi_nor_parse_bfpt(). Make sure we
+        * disable it.
+        */
+       params->quad_enable = NULL;
+
+       return 0;
+}
+
+static struct spi_nor_fixups is25wx256_fixups = {
+       .default_init = is25wx256_default_init,
+       .post_sfdp = is25wx256_post_sfdp_fixup,
+};
+
+static int
+is25lp256_post_bfpt_fixups(struct spi_nor *nor,
+                          const struct sfdp_parameter_header *bfpt_header,
+                          const struct sfdp_bfpt *bfpt)
+{
+       struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+       /*
+        * IS25LP256 supports 4B opcodes, but the BFPT advertises
+        * BFPT_DWORD1_ADDRESS_BYTES_3_ONLY.
+        * Overwrite the number of address bytes advertised by the BFPT.
+        */
+       if ((bfpt->dwords[SFDP_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) ==
+               BFPT_DWORD1_ADDRESS_BYTES_3_ONLY)
+               params->addr_nbytes = 4;
+
+       return 0;
+}
+
+static const struct spi_nor_fixups is25lp256_fixups = {
+       .post_bfpt = is25lp256_post_bfpt_fixups,
+};
+
+static int pm25lv_nor_late_init(struct spi_nor *nor)
+{
+       struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+       struct spi_nor_erase_map *map = &params->erase_map;
+       int i;
+
+       /* The PM25LV series has a different 4k sector erase opcode */
+       for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++)
+               if (map->erase_type[i].size == 4096)
+                       map->erase_type[i].opcode = SPINOR_OP_BE_4K_PMC;
+
+       return 0;
+}
+
+static const struct spi_nor_fixups pm25lv_nor_fixups = {
+       .late_init = pm25lv_nor_late_init,
+};
+
+static const struct flash_info issi_nor_parts[] = {
+       /* ISSI */
+       {
+               .name = "pm25lv512",
+               .sector_size = SZ_32K,
+               .size = SZ_64K,
+               .no_sfdp_flags = SECT_4K,
+               .fixups = &pm25lv_nor_fixups
+       }, {
+               .name = "pm25lv010",
+               .sector_size = SZ_32K,
+               .size = SZ_128K,
+               .no_sfdp_flags = SECT_4K,
+               .fixups = &pm25lv_nor_fixups
+       }, {
+               .id = SNOR_ID(0x7f, 0x9d, 0x20),
+               .name = "is25cd512",
+               .sector_size = SZ_32K,
+               .size = SZ_512K,
+               .no_sfdp_flags = SECT_4K,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x7f, 0x9d, 0x46),
+               .name = "pm25lq032",
+               .size = SZ_4M,
+               .no_sfdp_flags = SECT_4K,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x9d, 0x40, 0x13),
+               .name = "is25lq040b",
+               .size = SZ_4M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                                       SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x9d, 0x60, 0x14),
+               .name = "is25lp080d",
+               .size = SZ_8M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                                       SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x9d, 0x60, 0x15),
+               .name = "is25lp016d",
+               .size = SZ_16M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                               SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x9d, 0x60, 0x16),
+               .name = "is25lp032",
+               .size = SZ_32M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                                       SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x9d, 0x60, 0x17),
+               .name = "is25lp064",
+               .size = SZ_64M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                               SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x9d, 0x60, 0x18),
+               .name = "is25lp128",
+               .size = SZ_128M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                               SPI_NOR_BP3_SR_BIT5,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x9d, 0x71, 0x18),
+               .name = "is25wj128f",
+               .size = SZ_128M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                                       SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+    }, {
+               .id = SNOR_ID(0x9d, 0x60, 0x19),
+               .name = "is25lp256",
+               .size = SZ_256M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                               SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+               .fixups = &is25lp256_fixups,
+       }, {
+               .id = SNOR_ID(0x9d, 0x60, 0x1a),
+               .name = "is25lp512m",
+               .size = SZ_512M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                               SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x9d, 0x60, 0x1b),
+               .name = "is25lp01g",
+               .size = SZ_1G,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                                               SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x9d, 0x60, 0x21),
+               .name = "is25lp01gg",
+               .size = SZ_1G,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                               SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x9d, 0x60, 0x21),
+               .name = "is25lp01gj",
+               .size = SZ_1G,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                                       SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+    }, {
+               .id = SNOR_ID(0x9d, 0x60, 0x22),
+               .name = "is25lp02gg",
+               .size = SZ_2G,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                               SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x9d, 0x70, 0x16),
+               .name = "is25wp032",
+               .size = SZ_32M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                                               SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x9d, 0x70, 0x17),
+               .size = SZ_64M,
+               .name = "is25wp064",
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                               SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x9d, 0x70, 0x18),
+               .name = "is25wp128",
+               .size = SZ_128M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                               SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x9d, 0x70, 0x19),
+               .name = "is25wp256",
+               .size = SZ_256M,
+               .flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+                               SPI_NOR_4BIT_BP | SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixups = &is25lp256_fixups,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x9d, 0x70, 0x1a),
+               .name = "is25wp512m",
+               .size = SZ_512M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                               SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x9d, 0x60, 0x20),
+               .name = "is25lp512mj",
+               .size = SZ_512M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                                       SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+    }, {
+               .id = SNOR_ID(0x9d, 0x70, 0x1b),
+               .name = "is25wp01g",
+               .size = SZ_1G,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                               SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x9d, 0x5b, 0x19),
+               .name = "is25wx256",
+               .size = SZ_256M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                               SPI_NOR_BP3_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
+                          SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,
+               .fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
+               .mfr_flags = USE_FSR,
+               .fixups = &is25wx256_fixups,
+       }, {
+               .id = SNOR_ID(0x9d, 0x5a, 0x1a),
+               .name = "is25lx512m",
+               .size = SZ_512M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                       SPI_NOR_BP3_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
+                               SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,
+               .fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
+               .mfr_flags = USE_FSR,
+               .fixups = &is25wx256_fixups,
+       }, {
+               .id = SNOR_ID(0x9d, 0x60, 0x22),
+               .name = "is25lp02gj",
+               .size = SZ_2G,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                                       SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x9d, 0x70, 0x20),
+               .name = "is25wp512mj",
+               .size = SZ_512M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                                       SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x9d, 0x70, 0x21),
+               .name = "is25wp01gg",
+               .size = SZ_1G,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                                       SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x9d, 0x70, 0x21),
+               .name = "is25wp01gj",
+               .size = SZ_1G,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                                       SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x9d, 0x70, 0x1b),
+               .name = "is25wp02g",
+               .size = SZ_2G,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                                       SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x9d, 0x70, 0x22),
+               .name = "is25wp02gg",
+               .size = SZ_2G,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                                       SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x9d, 0x70, 0x22),
+               .name = "is25wp02gj",
+               .size = SZ_2G,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                                       SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+       }, {
+               .id = SNOR_ID(0x9d, 0x40, 0x11),
+               .name = "is25lp010e",
+               .size = SZ_1M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                                       SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+       }, {
+               .id = SNOR_ID(0x9d, 0x40, 0x12),
+               .name = "is25lp020e",
+               .size = SZ_2M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                                       SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+       }, {
+               .id = SNOR_ID(0x9d, 0x40, 0x13),
+               .name = "is25lp040e",
+               .size = SZ_4M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                                       SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }, {
+               .id = SNOR_ID(0x9d, 0x70, 0x12),
+               .name = "is25wp020e",
+               .size = SZ_2M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                                       SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+       }, {
+               .id = SNOR_ID(0x9d, 0x70, 0x13),
+               .name = "is25wp040e",
+               .size = SZ_4M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                                       SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+       }, {
+               .id = SNOR_ID(0x9d, 0x70, 0x16),
+               .name = "is25wj032f",
+               .size = SZ_32M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                                       SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+       }, {
+               .id = SNOR_ID(0x9d, 0x71, 0x17),
+               .name = "is25wj064f",
+               .size = SZ_64,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                                       SPI_NOR_TB_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
+       }
+};
+
+static void issi_nor_default_init(struct spi_nor *nor)
+{
+       struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+       nor->flags &= ~SNOR_F_HAS_16BIT_SR;
+       params->quad_enable = spi_nor_sr1_bit6_quad_enable;
+}
+
+static const struct spi_nor_fixups issi_fixups = {
+       .default_init = issi_nor_default_init,
+};
+
+const struct spi_nor_manufacturer spi_nor_issi = {
+       .name = "issi",
+       .parts = issi_nor_parts,
+       .nparts = ARRAY_SIZE(issi_nor_parts),
+       .fixups = &issi_fixups,
+};
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
