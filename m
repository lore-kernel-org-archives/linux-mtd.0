Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C454EC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 02:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=31OM5h5lVvoi7g8GuuoFiNFLI5GU6cnxpL27zx7IUjE=; b=PV0EmbIAMctYbT
	PI4IJBneRIUOWZtpNBoL6LvfPmfYprasJ2deH9a/djN3CNjzVUjtrmqtmA35C3E/tym9T1zFswqR/
	8hBp8Xov8e+OYPpBclmaoAyOQ0eQVBOwjjqPH0CJQr7SBvmiCUlF0FT5BEJFuNnvzBYz/WKcoW2bK
	7AnZVzZMNF6LHPhsX13zldi1L7gMgeVXkH++mPHhBrX6WT8D3x6TdiVAO7fkKA4ctOFBGjzHEkRXm
	s8ExCA6NydHYsQpilH8/JddygBkQebkJoGAhWrX21yBe2cAUeFYz/ef7sNbvG78bJdjAnePi2037c
	0WuD20tb/M1yHfJ2kRpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okcf1-001ioZ-8e; Tue, 18 Oct 2022 02:48:55 +0000
Received: from mail-eopbgr60044.outbound.protection.outlook.com ([40.107.6.44] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okcey-001in8-47
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 02:48:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlW1zdCfClEx0YLI0IDw2SsXkwKoAdU0B4EM/kBcWeP+UfzjD03cdrGAsMtSVY2oegD+Ix6YfY9eH/W3zpO9Q/kR+iOSF1iS2j2qvglqrmMoiAp8aT2CtcKvBcmLX3nqqnjbvuo7SmxT/XQdcfixkm6x882trmiSd0m/DyqVoAKrasdBqcBmKdUwI3Ethb2G7fizwXr0/D+i5bNboWRZ/3Rb9LwzxVOUWk0KDyyOtVMK+gpCBZjyIAg5Lc9Y+vzeawE3xh3FDiBcI+ns9r5w1XU6flR9mkv5E+Z1EXR5QSujeGyWWdgH9pRr+rGs9WV9wCaFathByacs3avhBiOcmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTlOmRo0zi01hMW2zfwA6tn3oW3bBS6AxZeRrYO/Mj0=;
 b=JSqteS0m0YyTmy2jyw/zcL/x27GRW1afqYTe/i/Hhwnn5Ly46azDco1qiWo/Yi4Jf4ivmq2fSv91Sm37hVngaaXFB0CBlvfLKy/dVgnGbj4hCpjBPCZapQ3c74eCxRTwFFF0nOaUDO1oWsNzKfncohY/AHnpLUTWoIrrv+Uc/u//r2dJ9lnbPYtjX3tbLKTfLc/ZHBst/wEBLRHRaYD+q6o6XJzxwwYOtnZZWj5zgKVucUiumZd07zfuAPUKg+vWHjZRvke4BHAf6+94bN0PdbG9R/RpUzN14MNPGnScO5p7PbB6QpRR4odkdouu9OiUhOh1uFEfq99p2M8xQ0IR9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTlOmRo0zi01hMW2zfwA6tn3oW3bBS6AxZeRrYO/Mj0=;
 b=D/XjxfjIht+K3xgj3B6J5YRHJqKSk3NTKRraSOjNjjd1FIb03Bzyv7EVWXmqKr/L8escrxv13tj3WmgkJm1ZK9jpwZ3ZyS65Lq/q+bRkwHDbN6OcfRrmitARsYc9SJbt2mvdUtgX1c8Lwg+VdgbEQKyoc4mr+HJRmX27bDkau0M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1PR04MB9071.eurprd04.prod.outlook.com (2603:10a6:150:22::11)
 by DB9PR04MB8345.eurprd04.prod.outlook.com (2603:10a6:10:246::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Tue, 18 Oct
 2022 02:48:49 +0000
Received: from GV1PR04MB9071.eurprd04.prod.outlook.com
 ([fe80::306c:ec79:32a4:afab]) by GV1PR04MB9071.eurprd04.prod.outlook.com
 ([fe80::306c:ec79:32a4:afab%9]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 02:48:49 +0000
Date: Mon, 17 Oct 2022 21:48:40 -0500
From: "han.xu" <han.xu@nxp.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Ansuel Smith <ansuelsmth@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	=?utf-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] mtd: core: introduce of support for dynamic
 partitions
Message-ID: <20221018024840.z2qzt4kac2jilbq7@umbrella>
References: <20220606151417.19227-1-ansuelsmth@gmail.com>
 <20220606151417.19227-4-ansuelsmth@gmail.com>
 <20221017195820.ve6c3zj2civkswm6@umbrella>
 <d98dd483-70b9-4bd1-0463-9e3343576955@gmail.com>
Content-Disposition: inline
In-Reply-To: <d98dd483-70b9-4bd1-0463-9e3343576955@gmail.com>
X-ClientProxiedBy: BY5PR16CA0014.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::27) To GV1PR04MB9071.eurprd04.prod.outlook.com
 (2603:10a6:150:22::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9071:EE_|DB9PR04MB8345:EE_
X-MS-Office365-Filtering-Correlation-Id: d2b78219-e3fd-4a31-eefa-08dab0b34892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	FG/+vWbwWz1XYIa3xhquHIAQzizf8zWRFyD2N8DfGMJPe/MFgZ4y5nsAEAkb4bvtDrV7sT5HvjGpNMRZWy29GuB3Q3HYhzsoa8JENYqBj4VWqQMOer1DTzW+ID2FzmDVx0LbBN9j1Z/HeUcHu+YY8JbawaopqP2btATnNniZbyDh6hS0j79ENysD5LMHv6VyTb/rblaSZowaYiBrwisWMb590mvdBJ1D/V9NrH6TWzmxt//1R20ldLMyVSVN6PjVEnhEYUqZ6Fl4YhbC0nu4sucUkwL2vwtkVVRKoHxC4BnAfMdl/ThoA3mgIlVmf+m/LHAnClpWpATPZmDR+ILv8Ef8XoO0V18LK1EVwgaFcCXeKE1DxXd0JCBI+qESp8tgB/L78abi0nZN1fGcCBu1oMpStW95tliXaYE63Dfp/EPj4WbEesBKhiW/0T3XwJa3OWZ1pwElaEEuL/4jwd+fkjrHMNO7zlNDyXyOHaPiYL5sL82uW/7p2KrnQMQANCczV2xwMoNvgaJBzZLygzVuBxZlkeY84Voqb8Wk8qUj2qkNtsm9Q8EQj34SMx9IWCkb2BGugShbkHPQIqNIakXLwnQuCYgH/pJvnzjXWXy4Zjv411XD3KVsKkVeGYjli8dtGX67y7ThtVWhPhn9fw4ebMnDoWUcdXrO8HQ3h+LTx0ZO3XOd3O9Flyg7dLjPbJvIe0qitKyffCZr9q9JT2qaFrm+KLByFBiq64rDJPVW80ap44AVd3bMDQTsAg72mwzvKYIoGnh1yI+3X3EAqemJaA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9071.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(451199015)(6506007)(2906002)(8936002)(52116002)(38350700002)(86362001)(7416002)(53546011)(4326008)(5660300002)(9686003)(6512007)(6666004)(26005)(41300700001)(186003)(1076003)(33716001)(478600001)(8676002)(66574015)(6486002)(66946007)(83380400001)(66476007)(66556008)(38100700002)(6916009)(54906003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ak04ZUlRSmwwWCsxVVE4Y2RTdEgxL1d4Nko4V3pOQnJGZk4zelhIck5Cdm1E?=
 =?utf-8?B?cURCN01vTFVjRjR1YklOSkVVcWtDY0hhdVluTk9aSlhEbUN4Rm5aQ0poZGZl?=
 =?utf-8?B?RnB4Qmd0WXNENXN5YXR2eE1EYlV5Q0dOdG0yQnlOc3JTRTBlelUrTGVjZ1hU?=
 =?utf-8?B?UC94YVN3VExYbDg2a2NmZURIek5OSGJmSm9DNXczdE1NdmVVemRjWWdRQndP?=
 =?utf-8?B?cVF5aWxsQ0JESlNmb1NCWXBXbkt2OWpGL0VoWDA3Q0VUL0RBQVNpWVFwTG5o?=
 =?utf-8?B?SXNzbjBJQlA5OThTa3FxRW5DeVdPYjJpTVRSWWpId0s3VE1zUm9Va0tSTlZ1?=
 =?utf-8?B?cFgrQ01KUmUxa2pZRmVORk00TFM1bUhnM0s1V1BXb0lpT1Bmd3JuSlJQL2Fq?=
 =?utf-8?B?NHJsT0tHOUgzaFpmVjNYeFhldFFpcW5ZcDdMR0JNOUNOUzBUNy95VUFRSUdD?=
 =?utf-8?B?b1hkbzY4M2xPVGVlMmlCbDZyWnJMakhtRVlBZzk3bEZ0ZDdzb1l1SjNkN1NF?=
 =?utf-8?B?ZmkxTDh4K25Zd0RnaUlIK3diN3I3bElHOFM4RlErUHIvWnE2Mk80ZWVxVWtl?=
 =?utf-8?B?ZWVFWTFHRkdjclhBdURQWVY2NWh0ZWpWVzNZdEVtZTkzdmx5eFhlQU5wSnVO?=
 =?utf-8?B?OWovdDJCTE4raUtpSWUzd3owZkJaeTIrd0wxTmlGQ1dYdUZENWNqbzYxUFNL?=
 =?utf-8?B?MGNNVEdmS2ZTOUNmVkFWalBNU3MvY3VUOHdrS2FRRlZqQldBYmZlSHhIMDB2?=
 =?utf-8?B?bU1tL0J0bWg3d3BONnJDak44Q01nMWpGK24rdllNM3hpMW1kdlFVWkExNXNY?=
 =?utf-8?B?THJJK0x0SjUvajBoRUpxL3lkRklzYUhZLy9WSFEweFBENkZ1NVJWRGtzYlpJ?=
 =?utf-8?B?aFRiR25Xakw1b1UwdmVPR294dlZreUNlajBzcGRqeERzbS85QjdrSUsxRlRm?=
 =?utf-8?B?WGRzNEdoOG1QUy9YUWtFWW1ma0hLT0Evb0poOXBEVGhDTWl2SElPZ0lNb2dZ?=
 =?utf-8?B?cllBeVZPYWxuZTdPcUQ3YklWN1RjYi9Tb0pGMTJZMW04MDE0T0ZaU3U3ZkJV?=
 =?utf-8?B?OVJSNFVZdnVVZTExRWdQdmZTZ3ZNMGxacndLVjBvcnI5OFZFV2VLWlNEaEJ6?=
 =?utf-8?B?a1VRYU4zelVHQi9XVEd4Rkk4Wk41SmxRODNiS1NyelUrdTd4eHdYbmJ5MzZ4?=
 =?utf-8?B?akdQR3paTTIvaGNGelliWVhQZzJHVFlrYzRnczV2emhZQklpVWhNSW5HbC9M?=
 =?utf-8?B?VkJBeTVZTUdvSnVJaXhhVWQ4SjlZMUNzMllXTXowMnBlR0xSUjN2bzMzbGJ2?=
 =?utf-8?B?QmFDeHFCRzQrak1ma0dpZDZQeEY5ZDB5eTZmV3lueXRwc2JwcHNvK2duTnY1?=
 =?utf-8?B?RmNvR2FaK0I0U2ZzZW11aTZzYVM2Y1daeTg0eVZWUjlNWXJQZGQvMGFzdzlv?=
 =?utf-8?B?ZWg4ZHVaaEt2R2tOaWtvUmxseWFJWWpjZ280VjJEVEsxZ0RXbWROQWxTbTBW?=
 =?utf-8?B?WnN1Q3g1eTRvQ3hqODM5ZUhrOFVhaFdQSW1RZGlsd2txZHFNaDFwZjIxOThk?=
 =?utf-8?B?elFUM3k3Qnh0dXdnd3lwN2V3Qm1DVmhoMStWYklDWjRIU3BkVEVnWENWZ3h1?=
 =?utf-8?B?N0premNjNlptemNiWlBROEtlSDhJZFE1cGFtQVVYQ0lyNmgxQitTMzJ5dS9P?=
 =?utf-8?B?dVdkOUMyc1hodDNDZ1lkdDNWQVpkQTZKOWoxRGNRdEx1QVo2RG5GbkpvVUMw?=
 =?utf-8?B?eEFzR291MU9IamYzeXA4R0hTREV6YXE4OHk0T0c4dVlTQjk4YUxCZ2s4d2xE?=
 =?utf-8?B?dDlpYW1XSlpsb2ZWamg2QUFsdm9qWHZDVnFET3JoTjllNnlpTlhzbnJKOXB5?=
 =?utf-8?B?RE5PMHp5WjZSWlFYZU9QV3owZFhZWk0xK2xPTmxlbDdiMkhpOUZqZVAzOSs3?=
 =?utf-8?B?b2pIUDhSZ2drbHZQVmlPY0FWTTA0YWs0VHE1VUo5SWJ1YmtJYjN6WjkvSEp4?=
 =?utf-8?B?Vng2dlZOd1p0azMzdytNeXBHNXlNOEJQVXVNcjJMYk5STVo2QmovL2tQTldn?=
 =?utf-8?B?R3UzMFl1MEcwQWcwcHRzVFYvbUE0NEg1T29oYnpZRGNSZnZ0bFc4R0tNOVF5?=
 =?utf-8?Q?c71yPftV+RWRyApFk1JQ5Ikbg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b78219-e3fd-4a31-eefa-08dab0b34892
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9071.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 02:48:49.1600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uw/gTebivUq+HPry1fjTjg+pgFntly/N3CrjJltrPE81sptJjgT6bDMwpNmlxJR0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8345
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_194852_197902_E96467FB 
X-CRM114-Status: GOOD (  34.79  )
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

T24gMjIvMTAvMTcgMTE6NTJQTSwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IE9uIDE3LjEwLjIw
MjIgMjE6NTksIGhhbi54dSB3cm90ZToKPiA+IE9uIDIyLzA2LzA2IDA1OjE0UE0sIEFuc3VlbCBT
bWl0aCB3cm90ZToKPiA+ID4gV2UgaGF2ZSBtYW55IHBhcnNlciB0aGF0IHJlZ2lzdGVyIG10ZCBw
YXJ0aXRpb25zIGF0IHJ1bnRpbWUuIE9uZSBleGFtcGxlCj4gPiA+IGlzIHRoZSBjbWRsaW5lcGFy
dCBvciB0aGUgc21lbS1wYXJ0IHBhcnNlciB3aGVyZSB0aGUgY29tcGF0aWJsZSBpcyBkZWZpbmVk
Cj4gPiA+IGluIHRoZSBkdHMgYW5kIHRoZSBwYXJ0aXRpb25zIGdldHMgZGV0ZWN0ZWQgYW5kIHJl
Z2lzdGVyZWQgYnkgdGhlCj4gPiA+IHBhcnNlci4gVGhpcyBpcyBwcm9ibGVtYXRpYyBmb3IgdGhl
IE5WTUVNIHN1YnN5c3RlbSB0aGF0IHJlcXVpcmVzIGFuIE9GIG5vZGUKPiA+ID4gdG8gZGV0ZWN0
IE5WTUVNIGNlbGxzLgo+ID4gPiAKPiA+ID4gVG8gZml4IHRoaXMgcHJvYmxlbSwgaW50cm9kdWNl
IGFuIGFkZGl0aW9uYWwgbG9naWMgdGhhdCB3aWxsIHRyeSB0bwo+ID4gPiBhc3NpZ24gYW4gT0Yg
bm9kZSB0byB0aGUgTVREIGlmIGRlY2xhcmVkLgo+ID4gPiAKPiA+ID4gT24gTVREIGFkZGl0aW9u
LCBpdCB3aWxsIGJlIGNoZWNrZWQgaWYgdGhlIE1URCBoYXMgYW4gT0Ygbm9kZSBhbmQgaWYKPiA+
ID4gbm90IGRlY2xhcmVkIHdpbGwgY2hlY2sgaWYgYSBwYXJ0aXRpb24gd2l0aCB0aGUgc2FtZSBs
YWJlbCBpcwo+ID4gPiBkZWNsYXJlZCBpbiBEVFMuIElmIGFuIGV4YWN0IG1hdGNoIGlzIGZvdW5k
LCB0aGUgcGFydGl0aW9uIGR5bmFtaWNhbGx5Cj4gPiA+IGFsbG9jYXRlZCBieSB0aGUgcGFyc2Vy
IHdpbGwgaGF2ZSBhIGNvbm5lY3RlZCBPRiBub2RlLgo+ID4gPiAKPiA+ID4gVGhlIE5WTUVNIHN1
YnN5c3RlbSB3aWxsIGRldGVjdCB0aGUgT0Ygbm9kZSBhbmQgcmVnaXN0ZXIgYW55IE5WTUVNIGNl
bGxzCj4gPiA+IGRlY2xhcmVkIHN0YXRpY2FsbHkgaW4gdGhlIERUUy4KPiA+ID4gCj4gPiA+IFNp
Z25lZC1vZmYtYnk6IEFuc3VlbCBTbWl0aCA8YW5zdWVsc210aEBnbWFpbC5jb20+Cj4gPiA+IC0t
LQo+ID4gPiAgIGRyaXZlcnMvbXRkL210ZGNvcmUuYyB8IDQ5ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgNDkgaW5zZXJ0
aW9ucygrKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYyBi
L2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+ID4gPiBpbmRleCA3NzMxNzk2MDI0ZTAuLjgwNzE5NGVm
YjU4MCAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gPiA+ICsrKyBi
L2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+ID4gPiBAQCAtNTQ2LDYgKzU0Niw1NCBAQCBzdGF0aWMg
aW50IG10ZF9udm1lbV9hZGQoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gPiA+ICAgCXJldHVybiAw
Owo+ID4gPiAgIH0KPiA+ID4gK3N0YXRpYyB2b2lkIG10ZF9jaGVja19vZl9ub2RlKHN0cnVjdCBt
dGRfaW5mbyAqbXRkKQo+ID4gPiArewo+ID4gPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqcGFydGl0
aW9ucywgKnBhcmVudF9kbiwgKm10ZF9kbiA9IE5VTEw7Cj4gPiA+ICsJc3RydWN0IG10ZF9pbmZv
ICpwYXJlbnQ7Cj4gPiA+ICsJY29uc3QgY2hhciAqbXRkX25hbWU7Cj4gPiA+ICsJYm9vbCBmb3Vu
ZCA9IGZhbHNlOwo+ID4gPiArCWludCBwbGVuOwo+ID4gPiArCj4gPiA+ICsJLyogQ2hlY2sgaWYg
TVREIGFscmVhZHkgaGFzIGEgZGV2aWNlIG5vZGUgKi8KPiA+ID4gKwlpZiAoZGV2X29mX25vZGUo
Jm10ZC0+ZGV2KSkKPiA+ID4gKwkJcmV0dXJuOwo+ID4gPiArCj4gPiA+ICsJLyogQ2hlY2sgaWYg
YSBwYXJ0aXRpb25zIG5vZGUgZXhpc3QgKi8KPiA+ID4gKwlwYXJlbnQgPSBtdGQtPnBhcmVudDsK
PiA+ID4gKwlwYXJlbnRfZG4gPSBkZXZfb2Zfbm9kZSgmcGFyZW50LT5kZXYpOwo+ID4gPiArCWlm
ICghcGFyZW50X2RuKQo+ID4gPiArCQlyZXR1cm47Cj4gPiA+ICsKPiA+ID4gKwlwYXJ0aXRpb25z
ID0gb2ZfZ2V0X2NoaWxkX2J5X25hbWUocGFyZW50X2RuLCAicGFydGl0aW9ucyIpOwo+ID4gPiAr
CWlmICghcGFydGl0aW9ucykKPiA+ID4gKwkJZ290byBleGl0X3BhcmVudDsKPiA+ID4gKwo+ID4g
PiArCS8qIFNlYXJjaCBpZiBhIHBhcnRpdGlvbiBpcyBkZWZpbmVkIHdpdGggdGhlIHNhbWUgbmFt
ZSAqLwo+ID4gPiArCWZvcl9lYWNoX2NoaWxkX29mX25vZGUocGFydGl0aW9ucywgbXRkX2RuKSB7
Cj4gPiA+ICsJCS8qIFNraXAgcGFydGl0aW9uIHdpdGggbm8gbGFiZWwgKi8KPiA+ID4gKwkJbXRk
X25hbWUgPSBvZl9nZXRfcHJvcGVydHkobXRkX2RuLCAibGFiZWwiLCAmcGxlbik7Cj4gPiA+ICsJ
CWlmICghbXRkX25hbWUpCj4gPiA+ICsJCQljb250aW51ZTsKPiA+ID4gKwo+ID4gPiArCQlpZiAo
IXN0cm5jbXAobXRkLT5uYW1lLCBtdGRfbmFtZSwgcGxlbikpIHsKPiA+ID4gKwkJCWZvdW5kID0g
dHJ1ZTsKPiA+ID4gKwkJCWJyZWFrOwo+ID4gPiArCQl9Cj4gPiA+ICsJfQo+ID4gPiArCj4gPiA+
ICsJaWYgKCFmb3VuZCkKPiA+ID4gKwkJZ290byBleGl0X3BhcnRpdGlvbnM7Cj4gPiA+ICsKPiA+
ID4gKwkvKiBTZXQgb2Zfbm9kZSBvbmx5IGZvciBudm1lbSAqLwo+ID4gPiArCWlmIChvZl9kZXZp
Y2VfaXNfY29tcGF0aWJsZShtdGRfZG4sICJudm1lbS1jZWxscyIpKQo+ID4gPiArCQltdGRfc2V0
X29mX25vZGUobXRkLCBtdGRfZG4pOwo+ID4gPiArCj4gPiA+ICtleGl0X3BhcnRpdGlvbnM6Cj4g
PiA+ICsJb2Zfbm9kZV9wdXQocGFydGl0aW9ucyk7Cj4gPiA+ICtleGl0X3BhcmVudDoKPiA+ID4g
KwlvZl9ub2RlX3B1dChwYXJlbnRfZG4pOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICAgLyoqCj4g
PiA+ICAgICoJYWRkX210ZF9kZXZpY2UgLSByZWdpc3RlciBhbiBNVEQgZGV2aWNlCj4gPiA+ICAg
ICoJQG10ZDogcG9pbnRlciB0byBuZXcgTVREIGRldmljZSBpbmZvIHN0cnVjdHVyZQo+ID4gPiBA
QCAtNjUxLDYgKzY5OSw3IEBAIGludCBhZGRfbXRkX2RldmljZShzdHJ1Y3QgbXRkX2luZm8gKm10
ZCkKPiA+ID4gICAJbXRkLT5kZXYuZGV2dCA9IE1URF9ERVZUKGkpOwo+ID4gPiAgIAlkZXZfc2V0
X25hbWUoJm10ZC0+ZGV2LCAibXRkJWQiLCBpKTsKPiA+ID4gICAJZGV2X3NldF9kcnZkYXRhKCZt
dGQtPmRldiwgbXRkKTsKPiA+ID4gKwltdGRfY2hlY2tfb2Zfbm9kZShtdGQpOwo+ID4gPiAgIAlv
Zl9ub2RlX2dldChtdGRfZ2V0X29mX25vZGUobXRkKSk7Cj4gPiA+ICAgCWVycm9yID0gZGV2aWNl
X3JlZ2lzdGVyKCZtdGQtPmRldik7Cj4gPiA+ICAgCWlmIChlcnJvcikKPiA+IAo+ID4gTlhQIEdQ
TUkgTkFORCBjb250cm9sbGVyIHdpdGggNiBjbWRsaW5lIHBhcnRpdGlvbnMgbWVldHMgcmVmY291
bnQgdW5kZXJmbG93Cj4gPiB3aXRoIHRoaXMgcGF0Y2guIFRoZSBvZl9ub2RlX3B1dChwYXJlbnRf
ZG4pIGRvZXNuJ3Qgd29yayB3aXRoIGNtZGxpbmUgcGFyc2VyIGFuZAo+ID4gY2F1c2VzIHRoZSBp
c3N1ZS4KPiAKPiBDYW4geW91IHRyeToKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRk
Y29yZS5jIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gaW5kZXggMThhYTU0NDYwZDM2Li4wYjRj
YTBhYTQxMzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gKysrIGIvZHJp
dmVycy9tdGQvbXRkY29yZS5jCj4gQEAgLTU2Miw3ICs1NjIsNyBAQCBzdGF0aWMgdm9pZCBtdGRf
Y2hlY2tfb2Zfbm9kZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPiAgCWlmICghbXRkX2lzX3BhcnRp
dGlvbihtdGQpKQo+ICAJCXJldHVybjsKPiAgCXBhcmVudCA9IG10ZC0+cGFyZW50Owo+IC0JcGFy
ZW50X2RuID0gZGV2X29mX25vZGUoJnBhcmVudC0+ZGV2KTsKPiArCXBhcmVudF9kbiA9IG9mX25v
ZGVfZ2V0KGRldl9vZl9ub2RlKCZwYXJlbnQtPmRldikpOwo+ICAJaWYgKCFwYXJlbnRfZG4pCj4g
IAkJcmV0dXJuOwoKWWVzLCB3aXRoIG9mX25vZGVfZ2V0KCkgdGhlIHJlZmNvdW50IGlzc3VlIGdv
bmUuCgo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
