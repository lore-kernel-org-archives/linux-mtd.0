Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64DF1C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 21:22:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CB6E611BD
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 21:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CB6E611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eR3lADsSQP1aHnW8pICmC7I7t1qVKVoxU9n1wpa1GoQ=; b=fyEfkbjqitnQpA
	d+sLKEzckzvlgMN5VH154KPh2JZtAKA5MzpsmUUobz2bh+YDgBxR1+jx6pacTvG7xkv/VLxYwmwxN
	sSLblAD0RH10Wq3ZC1BUxkeauftX830DXM6lCyTtExrrEQBsQyuB4GQzLEphJOG+klnLB1b1iuwvS
	0maERgkfF4TV9ZuPacnMsHdc0tBkUFCGs/8zaldo+Jy74P+9FxNWafBHlY40u2/r6DRc8T3RSQmhA
	rBRgmLtl7SDkPL6HKbKWswwY1Pj/jf2EOd5hiP2H5X6cPOIgocSeuhJixh5HxeAsnKXXwcJEuIOez
	hIl2zvNrpt+7AS06lOnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVKXa-008q7h-1Y; Tue, 28 Sep 2021 21:21:30 +0000
Received: from mail-dm6nam12on2082.outbound.protection.outlook.com
 ([40.107.243.82] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVKXX-008q74-KV
 for linux-mtd@lists.infradead.org; Tue, 28 Sep 2021 21:21:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQDRP5bewN4nA0TE5jgm4UJaixLQXoJhCQPr8IZxGg83ROX1DCElQ95BNsBaPVwihuWegQzNNSlp2XDQkaEVCWUTBNkMW1ZrEyYWQ+xlJlxEGM+c3fWLvXK/Ww5y12IaY8iuAMgRrU5NYvfkX9tzpD6/IO7jMfC4Gnl+JKsQY3N+IXWRzLzih8YT3pY0l8E8oVLFna/Oyyxr+feqaVp9vbrql2MLT6o9uvYCRoXX0X6ncpFnqn+ecf0REt0LBlIWQom4XGH6gjrBE8ziHcPZphGe2KqSB3FjslU9lMN4uiYQPRrMioE/65LQaE7Jrcu4E4DcYx1O5nDTxBBQoQ0LkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=aRUyIONgpgPBf9C+eOEBrO6fIDBaW8qc8QxjNql7NxI=;
 b=hs0+4DScxYFNLFm0Qv/mKifv3OOkN+7o0Hfl5Rsra5lnLoKded/pj04Py0OmBIoqc92hXjIFIf5wEpev6JnVIB9RCIpjX0MO7WB5RCVASUhhCDnsg5QxUCnOjhXlKxoCTEd9ae4hwAYAQ9cQ+qdJd03TK/F4wV5YR2avYBH896ZB9oGsoC2AC1otn7dy7YgAwxoyGHb62v/oQ/HMlIIuCSulbbSazcq6Xxnl2VwL4p56VHma/Z02wCbjV08X6sShwj3CXRrnIEpAKDrrfsLlOEoFQu6wnoJyXTc0YBfW8H4TChPYR2TSVR4/zl2o8c6ib0lKG38+QlH+KtAZKQnYIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRUyIONgpgPBf9C+eOEBrO6fIDBaW8qc8QxjNql7NxI=;
 b=UkRECUGOmRqf6qLBvMMJhIHnkVhhJJyqHxD2tp1P9srk5LmMUC97G8AogNEeT+mNIE3QE9G60dDXXqEwYuxap+9/xErTr3px8mHquW3Z1r4dohtxoxDaLP1lrT3eNXbn7dF/xQbO5wfsh6gbv3OD3RKW1Tb8S4swqDcdso3XQvYdT8jDfk3cHe5w0jAWBM6RZNIcMGyKPmI1hjnY7CrKiFOK2nJoplBjm1GiBHGKyt5LPLMno39FhYH2twLY3IoPLAaAdZPcjPkyJmonTEGmAA0cgHc02qQvSw7cPJ8tXtTwy6Mbe3enyiZB5d2iJTV/A8BP7CFVpEvhmzuHLufrEQ==
Received: from BL0PR12MB4659.namprd12.prod.outlook.com (2603:10b6:207:1d::33)
 by MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Tue, 28 Sep
 2021 21:21:25 +0000
Received: from BL0PR12MB4659.namprd12.prod.outlook.com
 ([fe80::8931:3580:e129:7d15]) by BL0PR12MB4659.namprd12.prod.outlook.com
 ([fe80::8931:3580:e129:7d15%7]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 21:21:25 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, "linux-block@vger.kernel.org"
 <linux-block@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>
Subject: Re: [PATCH 3/5] block: remove the ->rq_disk field in struct request
Thread-Topic: [PATCH 3/5] block: remove the ->rq_disk field in struct request
Thread-Index: AQHXtCkr41vPlTt4RECKC2kVkjtGu6u58pUAgAACrQA=
Date: Tue, 28 Sep 2021 21:21:25 +0000
Message-ID: <e9a6e00f-60e1-c604-9e08-3789fd057df9@nvidia.com>
References: <20210928052211.112801-1-hch@lst.de>
 <20210928052211.112801-4-hch@lst.de>
 <e88de776-fae9-7241-b741-9cf467f0965a@nvidia.com>
In-Reply-To: <e88de776-fae9-7241-b741-9cf467f0965a@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ce03e25-c6ab-4c3c-b780-08d982c5ed52
x-ms-traffictypediagnostic: MN2PR12MB4342:
x-microsoft-antispam-prvs: <MN2PR12MB43426BF59318D80B5190F507A3A89@MN2PR12MB4342.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K/bf5YVPW04Oa42uJ+2ERfXUud01bBQBXj3WBu24fwiTy4Ymgjr6RXld/ZIM3NPxCaZOm1vKYeM3CgzwcFTQxb3cwVxmGiKX4Ga0IiMLPNKtOC2xspsumUOY6vIAXl9oiyM8zanGY3GAQWwmVhixlX/wthuBsfdH6BS0U1xtb4KdVO993KB3+pOfy4XZNswppo8qTebhg/KJL4eDc333pWd+r/K4/wUyV7xPl+tgqzPnhJzLqgRep9cRFcv+31/LaMft3+CtP/CBWR5WkBbd9nmrQ9rZiJLUs8cHHlLHi0J311kb4p1le9X+xGj7wKMxYUDOLiPw6vs5dTdF426dqR7E6eTQ9+y/QGw2BVVtaBljvAbstWjo9+p/OP3jFJsG7ImCpdF7gX+b8/LmMBZzZ6sV884pHVFas6wKwt0GZ46WC4MGQo5Rg5jv0vzWeR8i4XtjIiJevErlRjRsCSW9lxO1u3bc3Din26Da7Q3Sy7fWtL3e/2PZIr8EeA/AYN2Vvv8QdDAANa2Dl5b3SJegnv7TavLpoEag7DruSCOYi1RE1NNcl4/ypGAbuyEDdvXgtF2wkbl2i4TOhjKLSLeomlyU4ZklKKodwua6x6J0dAjwmrx5Fr2zf7W70uyQ7Q0KepLLDj7Rvt7stmG9QQyMJ+BqE6IbRLDErpOR1IBVe+kEoMN81FkOSm7jh5BbkWCmSWc1kSrVB+8kviD/QVK0VWhfrVOfUwcqmUt03ZfCOuHVwsbniRzoOdmkmJRqzej+7ce27hrWWPUBm6dDZg8tHQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(53546011)(76116006)(66476007)(66556008)(8676002)(66446008)(64756008)(36756003)(5660300002)(31696002)(86362001)(91956017)(4326008)(38070700005)(71200400001)(2906002)(83380400001)(186003)(110136005)(6512007)(38100700002)(122000001)(508600001)(4744005)(2616005)(316002)(54906003)(8936002)(66946007)(31686004)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXp1UmVSdk5qNjJxa214VVhNa3o1QnBaQ0Y4eTVObk9BcXRuVnJ4WTcwZGxh?=
 =?utf-8?B?Z1FVTlBXS21tL1d6ejMzM3dZVS9OdFhpK3FoVTlUaWV2UDlGOVlKTGI2cElk?=
 =?utf-8?B?NDFyUDRRSndVdlpIZ2xCdHB6WHZaTmVkNnBvUzVyN3lFZHpkUmxrd1JOamdU?=
 =?utf-8?B?cXBBc3MvTWxZc0hZMTZPSHNxb1lydDBLRVVUVFI0WGtqTEUxMjV5Q3ZGSGJ4?=
 =?utf-8?B?YkFsWDV3U05BeVh2dC9obXBoQVNkMEd0Nmp1aXpYYkdhS0tNNFVVbEQ3SUtT?=
 =?utf-8?B?dkluRkRFNWRLZzJWcEg4OWMxQXhubWVPRi9vU2VhaE4vZWtxQnBtclhnMW1r?=
 =?utf-8?B?MWJ0VmZTZVMvZVFMMUxIVk9uWngxb3NmTnBtSXZrL29lK00vWXA4RDRKNHFu?=
 =?utf-8?B?c1ZEenJJYlAzRnJqaU9LbEJpWmN4QW52L0daQXJhVXZKVmhQODdlZGh2NmFr?=
 =?utf-8?B?UjdiUW1FcnMyMHQwaEd4bEZPUDNRcnRCckNSWEErZ285ZUNYS2RpSWRPZDFO?=
 =?utf-8?B?Mm1lbHNWdjM0SVA3a3ZPVmh1U3l2aFVkSXVmQXZpZkNOemNMNXZYUHVNR0h6?=
 =?utf-8?B?NjVlWEU4bTVxU0hDVTBVWU1CbklLQi9tTjlubHRJVEh3WmVQZzBzcnFDRzNx?=
 =?utf-8?B?eTF2UDZUOFRHM0l0NnRmeWtzeEFFamQ5UXcraDZpR1dDWWdOMkpiQkZXY2Uz?=
 =?utf-8?B?RHBtUyt5SU42VFhOUjBPR2pKbWdiK3huZUtyOVNJNmduaWtwWWsvb2d4Wmlk?=
 =?utf-8?B?dy9FckhqR25XSGQxYXptejlDZGpoM2grWndGVkF3SlMyMjZGSzYramVGR1Nt?=
 =?utf-8?B?L3FMN1hyVE5WZ3MxMmJaNHhsNmo5NGZScDUrdEIwSi8yOFZmL210WXJaeHJB?=
 =?utf-8?B?dG83UlVCZnhwK3AybmZ5NlJFNkVoUVdad0VBaEtaVWtKNXhmK1JiZmlqbmU4?=
 =?utf-8?B?K2JJeW1TWnFCMHlPR2FLYktCUVdYejY0cWphb0FHOTJPVGNDQXpaNUdMMEhq?=
 =?utf-8?B?UGtzWG04UWU3Q24rbHhOanZmVVhoRlYzM0twRi9lQ24yVGdVSmFYTVR2TThC?=
 =?utf-8?B?N0JQbEM0TE40QUFnRjEwdng0VVlienBrVDVDbSt4SmZVek41czhESUtwZUNS?=
 =?utf-8?B?ZDMxQmNRM3lmK3paRm85VGRZaVZ6TFRSeW0rNStVa2JGQytoYkZjYjdVY3VR?=
 =?utf-8?B?RW43ckJDekRUTlp0SXNYQmpDL1dOelkyRW1XZkQ0dnltRUxzbkNDRWREblZX?=
 =?utf-8?B?U0xWUGd0UWdQamh0SDRVVnpUMnBMeXdxNVNwY0tQOGp1ODJteDZsNHAzVmVs?=
 =?utf-8?B?a1NRVWRpb3ZybDIyQ01ScXdpSjNzZnRpVWpRNVpqTWUyNTBTMzU3WnhTRk8z?=
 =?utf-8?B?VDhLZ3RFRFVqUkk3amVQekVTOE9vdWpKWFE1UUZMaVp2TzlkNnBuY1FRaWhL?=
 =?utf-8?B?VnVpNi9VZW9Qdzd4a0poQnhsTExCWCtZR283Um9MWjB6bGJCUHpIbnBGNTJT?=
 =?utf-8?B?cG1NOE9xOVpnM3JCSlNNTXNFWXZKODRCNEVEeEdmTzdBTjFJdU9Hc0RnaTdV?=
 =?utf-8?B?VTFDQTFQYlp0WUNlaDBKVytJbDZJRmJKdWpNR2dVRGwyR2xMd2NBUHJDNHRS?=
 =?utf-8?B?ejZ5UzcwZSsrVmx1Si94ZkhvakZubUxVVk01UEFqVnF4U3Q4YmJ3K25IQXpM?=
 =?utf-8?B?MXFRSXRieXBjajBDak5RT3RpNVZHYkRIYm1QanU2bmw3OWhaNzdFZmM0S20z?=
 =?utf-8?B?WjBsRkwvVWxhTmdObnpXTXFZWEZkbGNKSGxXSWd4dVV3a2ZRSTRlY2J4dExS?=
 =?utf-8?B?YlhNdWdoWitrME1SNnpidz09?=
x-ms-exchange-transport-forked: True
Content-ID: <D12520F09FE86A4FA7DF9C9CD0462296@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce03e25-c6ab-4c3c-b780-08d982c5ed52
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 21:21:25.0685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F31LrF81S5rOD0JS+Gpsatq4d1NVjLXlk6+XEAPhpqgA1syv52af93lmJ9Y8byn8+2lBZub8q4cSSetNQtEzXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4342
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_142127_698180_F9D7F81E 
X-CRM114-Status: GOOD (  17.70  )
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

On 9/28/21 2:11 PM, Chaitanya Kulkarni wrote:
> External email: Use caution opening links or attachments
> 
> 
> On 9/27/21 10:22 PM, Christoph Hellwig wrote:
>> Just use the disk attached to the request_queue instead.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> ---
> 
> Please consider adding :-
> 
> root@dev linux-block (for-next) # git diff drivers/mtd
> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> index b8ae1ec14e17..f0488694afdb 100644
> --- a/drivers/mtd/mtd_blkdevs.c
> +++ b/drivers/mtd/mtd_blkdevs.c
> @@ -59,7 +59,7 @@ static blk_status_t do_blktrans_request(struct
> mtd_blktrans_ops *tr,
>           }
> 
>           if (blk_rq_pos(req) + blk_rq_cur_sectors(req) >
> -           get_capacity(req->rq_disk))
> +           get_capacity(req->q->disk))
>                   return BLK_STS_IOERR;
> 
>           switch (req_op(req)) {
> 

sorry for the noise, you have already done it in patch 1,
when I applied patch 1 it failed on my tree due to copy paste
error and I missed it ..




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
