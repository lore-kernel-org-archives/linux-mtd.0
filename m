Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2FFECAAD8
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Sep 2022 03:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMNCia7ZVvADEwIegaYnvfB4qQZIVix7yuPLmWgnDN4=; b=gHl/UjbESH8eQOwsIYQtxNyJgc
	aRiU/WKMq7xXtDBJ3znkCKGhIusLnYbJjuS7caZuxh3qKZMhfBgQh67Ht3xQS/6JdJDl/sHs47HjA
	8x7GGcJIbxJoXXA9O7KqsusqsBAwFyAgiNqUec4T1P7BVxKTrR2ZDjIbeU+gt/adqskPclTcgkDsw
	J7zGn9CG7hqpX1RtvxiC+Y9DKJA7BuOBuYoHocAewgAZs6AQJNp40HK94sEZYPlBqCI2XVFdi9C/9
	ka0xZI4C97cLZn/hYfc0MYpc7w+QVhosp5iyhly5m9vX0P/cPLoDVLSNyppPBOi5Ib2qgYCvE/F/i
	qbh2fptQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYIin-005B9R-Ig; Wed, 14 Sep 2022 03:05:53 +0000
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYIih-005B2a-OM
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2022 03:05:50 +0000
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28E2gVMO015186;
	Wed, 14 Sep 2022 03:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=2NZhqdg3bkCmCSUQr3MnAes+PgmIYpKCYn37umJi54E=;
 b=IpQBuSH/sjjNTDeyIbtxKiKorVELFIQ6ee7wyylqls0CqegfD/UKSWnHtWDrXZFWDbvy
 YEvROA+9I5alwAP8NpaI1yl6bJPdOXAMLpwoXhTw9Dxz+Egz8j00yPt+KtH/5Twl2Rop
 7XA0QX90ZVOcFjDSb6bg4tqXjPyszcAF6PUB2XHZx6RvE42nz1+QIe3D6EDhVdwrFzNe
 sKKvuHDxOl4zDU2elKW7sRO9iPy1rPM3WCK2aROGU3+mwmOFJcZjyZvrxSuRPVVK75q0
 pr2BpioVti6QdLB7dJIy8u+ed34N7BZxdvxenwkkrcY1dQrgVpQKsvcQ5ymkNXEETmg5 eg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jk4tng2ff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Sep 2022 03:05:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0f465EdDfIAusF1/3xV/XSdou1MUWD3u/ls+Vd2EzpBJ3kjWoWxlGPPQo8UrUIj43HgOJwsI7ObtU1yQ/zOGwWPtMH1ngOe8fCCmdWTBz97QNhAIiBf/Rk2I2hmKDA0DEVcADYWGWGSKwL4UpH6aBnowO7b400t51959BCAydDsEnnsZ+W9j0bwfFPc7VamKIuhk6BhttOJ9lAZf3Ca/9mMAy5RBPI+IRPME5wPloK8XjdtpcIy9PnlNE9f+giI3jW/ZA/yKtvAQBqpYZdiD9CvL9D00162WXmiIAUrNi7BNJxcccDi81ImyBBpGwuaezHmjWcmkH/LathubNMo4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NZhqdg3bkCmCSUQr3MnAes+PgmIYpKCYn37umJi54E=;
 b=b6H5rXpE1yg/SrgOSyeGWXIjFJOKFF6zDyIcM/twt0ON+1pxFXw6I/4M5WvMFsVGXZyBUZuMPP+zeTgLnGxxj+w14oJbo0gvXysbaKbx9ShAGNBzgx4k3hNwGTJgMWzz4fJn2j+o/1YpDjaPYA4or2DYblIkS+UWiIbZwqXPvGA6nV/pr3LlH5eqHGQpSS+lUu5S4EhPIQCHJTLz12aAbkLnqcrS3XXPk2+GUAz2L1hotbANRL0LbTsLuWbPSyK8zs28FIy2zMk3FUjl2O57vTOXHnoRW3Y9zpe5+k6E3q++kSIMwt0hT9jzrEhmt0HLom51LJks4bFfZ/3lbiuEPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20)
 by CY5PR11MB6317.namprd11.prod.outlook.com (2603:10b6:930:3f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 03:05:31 +0000
Received: from SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::5077:607a:fb5b:9cfd]) by SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::5077:607a:fb5b:9cfd%5]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 03:05:30 +0000
Message-ID: <948d4846-dd7e-04a3-51e7-588d266cc28e@windriver.com>
Date: Wed, 14 Sep 2022 11:05:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] mtd: spi-nor: gigadevice: gd25q256: replace
 gd25q256_default_init with gd25q256_post_bfpt
Content-Language: en-US
To: Vanessa Page <Vebpe@outlook.com>,
        "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
        "pratyush@kernel.org" <pratyush@kernel.org>,
        "michael@walle.cc" <michael@walle.cc>,
        "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
        "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220913084023.2451929-1-yaliang.wang@windriver.com>
 <MN2PR17MB3375BC0E5878B19651475413B8479@MN2PR17MB3375.namprd17.prod.outlook.com>
From: Yaliang Wang <Yaliang.Wang@windriver.com>
In-Reply-To: <MN2PR17MB3375BC0E5878B19651475413B8479@MN2PR17MB3375.namprd17.prod.outlook.com>
X-ClientProxiedBy: SI2PR01CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::22) To SA0PR11MB4766.namprd11.prod.outlook.com
 (2603:10b6:806:92::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR11MB4766:EE_|CY5PR11MB6317:EE_
X-MS-Office365-Filtering-Correlation-Id: c93af4fa-5690-49dc-44c1-08da95fdfb71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	JUsM6DsqyFppzsTstT4ttRcCKpnqrbyiaDYUJ35ZMID/UEmGAEXLXPvQjmVz+xncJPofCNNmA2GbusRSLq6dR5iX8OydlUtwEkWWnTIPgQOCC/OAxHoJI2Tk9I8BkOtIrebikN3u3TUezVzOOJwMcw/iebNFuF+3mGuBTcZ52a7VzesJBkRNM6zDlB3mEeThfr1OvJTrBPaJ+zE/xJhCWU83EEK5GmFmVjPBeCGqLNLHeAHOJ218WWRykrYy8AMDbUxWJEmZEq5bNrKX/JV4NVpAqoQVccbHBTZNFhyKyK35ida+OQTeVvqh48eNQpfgUcBuDVlhQlfWDN+ydm2egVyDbQ+kvOXbMMcdxUC7HJUZUgfHpxOnexk/61nS/uY33M3zMARCgjt+zh4Tx26eXZj4liXjLy/PbOxnFh1SJfy2M2sukaAsUuVnguW2/QJ5w04M/HqmqbQIISoYOCgFotRVX0GnWthioLej1JDkV7qbHiTQ6HHkick4pAy+ab1XnfvJAr82pXnWjCmJkHQ9C2ln+KoisGEimJNCR9gO8+aWPXUiU915zvgB2VzESzbT4vRm54DRWEB3v+YoWNpkWR2LIGBYdc6C6L/YiCv+w2Tm/Kb4uHBycmItAbTvjSpBJQtWtINzKKRpQJ5MqNYvD4mtUe6a0CDAeXBMatfHW16gvbfHVVzO0kD+hwEMBOwGj8bU7ZRWEMDUAG3ONsIDiRmqJX97kUzuIdBBMdlH8mo5lDvavk6wWlI9IdcwdDDnhW1emljZwNNbnAKEZur11RvrJN7l8VOrH6OXeej8oi0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4766.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(396003)(136003)(39850400004)(376002)(451199015)(110136005)(54906003)(31686004)(6486002)(478600001)(8676002)(38100700002)(2906002)(966005)(186003)(83380400001)(4326008)(41300700001)(86362001)(66556008)(6666004)(31696002)(66476007)(66946007)(36756003)(6512007)(53546011)(316002)(5660300002)(6506007)(26005)(2616005)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?OFN3cStDdzlVMUFxQ2lsSlNwUGlicFQ0MG43OHc4d3Evb3RmSDBQVWlLdlF5?=
 =?utf-8?B?SHladSttdXBuS2NtYVhFY1ExTlh3cWN6WkFkSVVSdEVZTGErSnRLS2l1elZj?=
 =?utf-8?B?TldNdEZ5SUFiRWVkcGhZQU0xbDBCVnNyUnVhU21RNXN2c3hONGpUcXF6Mno3?=
 =?utf-8?B?OGMyZmYrZk16WUswckJaYlZiWWNTYW9OeGFlNm56djcyWlN4TUhaemYzVkZM?=
 =?utf-8?B?NDRnQ25xZFRibVVkZjhRWnBhQ0E4MTRmeWl1RXJ3b0FwT1A1MzUxWTM0a2hw?=
 =?utf-8?B?UXVjVmh1Mk9YeFZNT01iQ3VPK2k3VGEzMWRZOEh4akJqNkN4Q24xYU5ob2pH?=
 =?utf-8?B?TFVrRVFqbnVGb0FSTE1ibVE1Q3diWWY4eDVYWlFDeE9ZZUJydmh3aTJySnRF?=
 =?utf-8?B?RUpXanlXNmxWdVZqbmQ2cnZCSlFZOG1sNHpmRWptUUpyazFzMzNDT2JKR2Rx?=
 =?utf-8?B?Uzk5dkIrSTFVM1lLOFlubTY4VmgvczhxUE42STMyOHpJZU1tSGNOK0haNTBS?=
 =?utf-8?B?K0NlMjZ3c1VaeU4rekMyYXdTMHVybzhMcko2bDAxdVRjRE1ORGJ3NG5yS3ly?=
 =?utf-8?B?U1JHcHJCNVJwdTE5VUhUOVQ0NUdCQzdpcTRuSjNzNzBIaXgvKzZnSlV0dmRJ?=
 =?utf-8?B?RlFuUTZFdHZBbVdURTl6Sm5tNCtwd0VDWlprdlNSSEt5VFVzNkhXa3lkaHpI?=
 =?utf-8?B?Z3NQNWVJUjJwN0tlYnNsc2FvQjMrUzhvSkkvV0o3d25uVFlEVUtOVUhWRGEv?=
 =?utf-8?B?c0piUVArSmlzRktCNWl4RHA1ZUZYRjh3NDJyUUV4NTNSd0N1Q0hXYUE5YjlU?=
 =?utf-8?B?UkJ3NEtVcjNZTG5QUWFSb3NXMG5PUnRIVGRBOFc5SXEyR1dTOWl1M2NwTU1I?=
 =?utf-8?B?Z0lnMEp1M3hpV0gyRHMzd2RCakh4ZzdNK042TTBvaTNCUzRBY3dTemlvbVI5?=
 =?utf-8?B?OGkyM1dXaUdlQ2xXcUxDdUQydy9TOGcwdzVYU0dxd01iRzVkVXlTQ05BQUFJ?=
 =?utf-8?B?a0E0RXp2WVF3c0FUQ3FDTldFV3JCTmx6MkdkZW5OWkZBRkVuYVh4SDM0N3pK?=
 =?utf-8?B?a2FIREpuUzRyYTB0WkVpS1hMNnMwYjlJS3VuSDVweXlLQU9mdDM4VStseWQ4?=
 =?utf-8?B?d3NYWkMvamFkajV2Skc1djNNbDZqYnF0LzFUMU4ySW5EaG1UUDV6S2Fzc3pD?=
 =?utf-8?B?SGRwYkdYQjBBakR6OFJweS9Zci92NEdFcStnY1NYWnJHWUg1amZGTTkzNWJh?=
 =?utf-8?B?dzlPZEx2U2dsb1JNWVowYk5vdzkzOVRFdDAvZ0VQN2VUUkduTVNiVzEyaVkv?=
 =?utf-8?B?bDlCN0R4U3V6SERvRzNVS2FsT25JdGhJVFNDeUErVThVbHR6VFVVNnhnK0Q1?=
 =?utf-8?B?KytpdndNMnMyYUpmR3pyaTAxUHBTbkFGV2J5UkQySWR4TGxVM0NNa1BUM1dR?=
 =?utf-8?B?TlZKeTNnZUVvYnZLQUFqYnRNbjRwblk0bncwVFZ4RkUyV2ZPZ1FPbDlhb2Q0?=
 =?utf-8?B?Q0VLSEZCVmZGRWdBTGxsa0tHTGJDSUJtUmVSN0xpNWZReER4azMwMlZBZ3ZS?=
 =?utf-8?B?ZkcweU1FQWJjaFhEZ3VuT2pCdCtnZ3BpSUJxNVZ4ZkNXNnovT3FGeG1lL3Nw?=
 =?utf-8?B?dXUzcWhvVFZLSGp2dmY2S05teWw1bk93L25jdTVRNkJpakZKSVErLzgvbk1R?=
 =?utf-8?B?UFFsSUh4Ym54bG5IUWg0Z2tiVWpkcnlKYm5YU1R6dFFNUER4YVJUaG5UY2tJ?=
 =?utf-8?B?VXFabmgyeHp4Ky96NWlZUkR2YzBCV1FKNXk1NzRKbFNEbU80M1I5aE11Nmht?=
 =?utf-8?B?dmpwODU3QzBHUmdSLzN6Y1cxSWNNUHkyOEJiM001K2RjSFFqQ0F4NmdpYjdT?=
 =?utf-8?B?K0sxVVByS2hFckttTk01bDFUTUNwbURPRGpoblU0M09LN05sR2J0b2NnRS9u?=
 =?utf-8?B?NHh4dTc2MXB5Um9zZWZoeVpISlB1T2ZQSjlMUjd1NE1qSDBxV0NyeWFXSXNX?=
 =?utf-8?B?MFpjeXoxNDlKaEJVT0N1eXNYc3dHWkF4aVNyMXo4RkJ5VWl1SklkZ0dYY0dY?=
 =?utf-8?B?dUE5cnVpVUV2YThBbE9uemxyZEVSOVNoMWFySnJNYUtnaDdhdldvMVh3eStw?=
 =?utf-8?B?c2pCd1pVN3JzbmFzdzVZMVVpdzF2YXoyQ0IzZDFxQk5YRzhDT2pVNlY0bFdB?=
 =?utf-8?B?dVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c93af4fa-5690-49dc-44c1-08da95fdfb71
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4766.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 03:05:30.7863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ylpWr+k/3OqbccgQr8xN8lf/rDFw+R2zI0zMPGXs4llll0u1YWEN1G8dXQ/0GgmDLrOVtC2g0MOmj1wC4FIf4pSqnNHhngrvfblzHUfVb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6317
X-Proofpoint-GUID: _tQ5j9P-LSg8pk53TTgv5o_wdpk4-4SA
X-Proofpoint-ORIG-GUID: _tQ5j9P-LSg8pk53TTgv5o_wdpk4-4SA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_12,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209140013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_200548_775609_16D60BA3 
X-CRM114-Status: GOOD (  36.63  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SW4gY2FzZSB0aGUgbWFpbCBsaXN0IGNhbid0IHJlY2VpdmUgdGhlIGVtYWlsLCBJJ2QgbGlrZSB0
byBzZW5kIHRoZSAKZW1haWwgYWdhaW4uCgpTb3JyeSwgSSBkaWRuJ3QgbWFrZSBpdCBjbGVhci4K
SSdtIGRvaW5nIHRoaXMgYmVjYXVzZSB0aGUgZmxhc2ggaW5mbyBtZW1iZXIgcGFyc2Vfc2ZkcCBp
cyBpbml0aWFsaXplZCAKdG8gInRydWUiIGJ5IFBBUlNFX1NGRFAgbWFjcm8sIGFzIHlvdSBjYW4g
c2VlIGJlbG93CiAgICAgICAgIHsgImdkMjVxMjU2IiwgSU5GTygweGM4NDAxOSwgMCwgNjQgKiAx
MDI0LCA1MTIpCiAgICAgICAgICAgICAgICAgUEFSU0VfU0ZEUAogICAgICAgICAgICAgICAgIEZM
QUdTKFNQSV9OT1JfSEFTX0xPQ0sgfCBTUElfTk9SX0hBU19UQiB8IApTUElfTk9SX1RCX1NSX0JJ
VDYpCiAgICAgICAgICAgICAgICAgRklYVVBfRkxBR1MoU1BJX05PUl80Ql9PUENPREVTKQogICAg
ICAgICAgICAgICAgIC5maXh1cHMgPSAmZ2QyNXEyNTZfZml4dXBzIH0sCgpBbmQgd2hlbiBwYXJz
ZV9zZmRwIGlzIHRydWUsIHRoZSBmdW5jdGlvbiBzcGlfbm9yX2luaXRfcGFyYW1zKCkgd2lsbCAK
Y2FsbCBzcGlfbm9yX3BhcnNlX3NmZHAoKSB0byBpbml0aWFsaXplIHRoZSBwYXJhbWV0ZXJzLCBh
bmQgSSBjYW4ndCBzZWUgCmFueSBvdGhlciBwbGFjZSB0byBjYWxsIHRoZSBvcmlnaW5hbCBkZWZh
dWx0X2luaXQoKSBob29rIGluIHRoZSBmaXh1cHMgCm90aGVyIHRoYW4gaW4gc3BpX25vcl9pbml0
X3BhcmFtc19kZXByZWNhdGVkKCkgIC0+IApzcGlfbm9yX21hbnVmYWN0dXJlcl9pbml0X3BhcmFt
cygpLgoKQWZ0ZXIgY2hlY2tpbmcgdGhlIGhpc3Rvcnkgb2Ygd2h5IHdlIGFyZSBhZGRpbmcgdGhp
cywgdGhhdCBpcyB0byBzYXkgdGhlIApjb21taXQgNDhlNGQ5NzNhZWZlICgibXRkOiBzcGktbm9y
OiBBZGQgYSBkZWZhdWx0X2luaXQoKSBmaXh1cCBob29rIGZvciAKZ2QyNXEyNTYiKSBhbmQgdGhl
IGNvcnJlc3BvbmRpbmcgZGlzc2N1c2lvbnMsIEkgYmVsaWV2ZSBpdCB3YXMgYWRkZWQgZm9yIApz
b21lIHJlYXNvbiwgYW5kIHdlIG5lZWQgdG8gYWRkIGJhY2sgdGhpcyBmdW5jdGlvbi4KCk9uIDkv
MTMvMjIgMTg6NDYsIFZhbmVzc2EgUGFnZSB3cm90ZToKPiAqKltQbGVhc2Ugbm90ZTogVGhpcyBl
LW1haWwgaXMgZnJvbSBhbiBFWFRFUk5BTCBlLW1haWwgYWRkcmVzc10KPiAKPiBXaHkgYXJlIHlv
dSBkb2luZyB0aGlzPwo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICpGcm9tOiogbGludXgtbXRkIDxsaW51
eC1tdGQtYm91bmNlc0BsaXN0cy5pbmZyYWRlYWQub3JnPiBvbiBiZWhhbGYgb2YgCj4geWFsaWFu
Zy53YW5nQHdpbmRyaXZlci5jb20gPHlhbGlhbmcud2FuZ0B3aW5kcml2ZXIuY29tPgo+ICpTZW50
OiogVHVlc2RheSwgU2VwdGVtYmVyIDEzLCAyMDIyIDQ6NDAgQU0KPiAqVG86KiB0dWRvci5hbWJh
cnVzQG1pY3JvY2hpcC5jb20gPHR1ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNvbT47IAo+IHByYXR5
dXNoQGtlcm5lbC5vcmcgPHByYXR5dXNoQGtlcm5lbC5vcmc+OyBtaWNoYWVsQHdhbGxlLmNjIAo+
IDxtaWNoYWVsQHdhbGxlLmNjPjsgbWlxdWVsLnJheW5hbEBib290bGluLmNvbSAKPiA8bWlxdWVs
LnJheW5hbEBib290bGluLmNvbT47IHJpY2hhcmRAbm9kLmF0IDxyaWNoYXJkQG5vZC5hdD47IAo+
IHZpZ25lc2hyQHRpLmNvbSA8dmlnbmVzaHJAdGkuY29tPgo+ICpDYzoqIGxpbnV4LW10ZEBsaXN0
cy5pbmZyYWRlYWQub3JnIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz47IAo+IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+Cj4g
KlN1YmplY3Q6KiBbUEFUQ0hdIG10ZDogc3BpLW5vcjogZ2lnYWRldmljZTogZ2QyNXEyNTY6IHJl
cGxhY2UgCj4gZ2QyNXEyNTZfZGVmYXVsdF9pbml0IHdpdGggZ2QyNXEyNTZfcG9zdF9iZnB0Cj4g
RnJvbTogWWFsaWFuZyBXYW5nIDxZYWxpYW5nLldhbmdAd2luZHJpdmVyLmNvbT4KPiAKPiBXaGVu
IHV0aWxpemluZyBQQVJTRV9TRkRQIHRvIGluaXRpYWxpemUgdGhlIGZsYXNoIHBhcmFtZXRlciwg
dGhlCj4gZGVwcmVjYXRlZCBpbml0aWFsaXppbmcgbWV0aG9kIHNwaV9ub3JfaW5pdF9wYXJhbXNf
ZGVwcmVjYXRlZCgpIGFuZCB0aGUKPiBmdW5jdGlvbiBzcGlfbm9yX21hbnVmYWN0dXJlcl9pbml0
X3BhcmFtcygpIHdpdGhpbiBpdCB3aWxsIG5ldmVyIGJlCj4gZXhlY3V0ZWQsIHdoaWNoIHJlc3Vs
dHMgaW4gdGhlIGRlZmF1bHRfaW5pdCBob29rIGZ1bmN0aW9uIHdpbGwgYWxzbyBuZXZlcgo+IGJl
IGV4ZWN1dGVkLiBBcyB3ZSBkbyBoYXZlIHF1YWQgZW5hYmxlIGZ1bmN0aW9uIGRlZmluZWQgaW4g
QkZQVCwgdGhlCj4gcG9zdF9iZnB0IGhvb2sgd2lsbCBiZSB0aGUgcmlnaHQgcGxhY2UgdG8gdHdl
YWsgdGhlIGZ1bmN0aW9uLgo+IAo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gRml4ZXM6
IDA0NzI3NWY3ZGUxOCAoIm10ZDogc3BpLW5vcjogZ2lnYWRldmljZTogZ2QyNXEyNTY6IEluaXQg
Zmxhc2ggCj4gYmFzZWQgb24gU0ZEUCIpCj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90
IDxsa3BAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFlhbGlhbmcgV2FuZyA8WWFsaWFuZy5X
YW5nQHdpbmRyaXZlci5jb20+Cj4gLS0tCj4gIMKgZHJpdmVycy9tdGQvc3BpLW5vci9naWdhZGV2
aWNlLmMgfCAxMSArKysrKysrKy0tLQo+ICDCoDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
Z2lnYWRldmljZS5jIAo+IGIvZHJpdmVycy9tdGQvc3BpLW5vci9naWdhZGV2aWNlLmMKPiBpbmRl
eCAxMTliMzhlNmZjMmEuLmJkYzRkNzM0MjRhZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9z
cGktbm9yL2dpZ2FkZXZpY2UuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvZ2lnYWRldmlj
ZS5jCj4gQEAgLTgsMTkgKzgsMjQgQEAKPiAKPiAgwqAjaW5jbHVkZSAiY29yZS5oIgo+IAo+IC1z
dGF0aWMgdm9pZCBnZDI1cTI1Nl9kZWZhdWx0X2luaXQoc3RydWN0IHNwaV9ub3IgKm5vcikKPiAr
c3RhdGljIGludAo+ICtnZDI1cTI1Nl9wb3N0X2JmcHQoc3RydWN0IHNwaV9ub3IgKm5vciwKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3Qgc2ZkcF9wYXJh
bWV0ZXJfaGVhZGVyICpiZnB0X2hlYWRlciwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBjb25zdCBzdHJ1Y3Qgc2ZkcF9iZnB0ICpiZnB0KQo+ICDCoHsKPiAgwqDCoMKgwqDC
oMKgwqDCoCAvKgo+ICDCoMKgwqDCoMKgwqDCoMKgwqAgKiBTb21lIG1hbnVmYWN0dXJlciBsaWtl
IEdpZ2FEZXZpY2UgbWF5IHVzZSBkaWZmZXJlbnQKPiAgwqDCoMKgwqDCoMKgwqDCoMKgICogYml0
IHRvIHNldCBRRSBvbiBkaWZmZXJlbnQgbWVtb3JpZXMsIHNvIHRoZSBNRlIgY2FuJ3QKPiAgwqDC
oMKgwqDCoMKgwqDCoMKgICogaW5kaWNhdGUgdGhlIHF1YWRfZW5hYmxlIG1ldGhvZCBmb3IgdGhp
cyBjYXNlLCB3ZSBuZWVkCj4gLcKgwqDCoMKgwqDCoMKgICogdG8gc2V0IGl0IGluIHRoZSBkZWZh
dWx0X2luaXQgZml4dXAgaG9vay4KPiArwqDCoMKgwqDCoMKgwqAgKiB0byBzZXQgaXQgaW4gdGhl
IHBvc3RfYmZwdCBmaXh1cCBob29rLgo+ICDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPiAgwqDCoMKg
wqDCoMKgwqDCoCBub3ItPnBhcmFtcy0+cXVhZF9lbmFibGUgPSBzcGlfbm9yX3NyMV9iaXQ2X3F1
YWRfZW5hYmxlOwo+ICsKPiArwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+ICDCoH0KPiAKPiAgwqBz
dGF0aWMgY29uc3Qgc3RydWN0IHNwaV9ub3JfZml4dXBzIGdkMjVxMjU2X2ZpeHVwcyA9IHsKPiAt
wqDCoMKgwqDCoMKgIC5kZWZhdWx0X2luaXQgPSBnZDI1cTI1Nl9kZWZhdWx0X2luaXQsCj4gK8Kg
wqDCoMKgwqDCoCAucG9zdF9iZnB0ID0gZ2QyNXEyNTZfcG9zdF9iZnB0LAo+ICDCoH07Cj4gCj4g
IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIGdpZ2FkZXZpY2Vfbm9yX3BhcnRzW10g
PSB7Cj4gLS0gCj4gMi4zNC4xCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvIAo+IDxodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvX187ISFBanZlWWR3OEV2USFjRmNJanVf
NnJkYXNBNjdKQVZCNVd3NzI3WVRqN3V6V2hKOEhqa1JqRUptbi1CRkdXc2dhOW1QVHFDb19tOFdG
VDRKY3U4VWowaU1FMzRCM09PYyQ+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
