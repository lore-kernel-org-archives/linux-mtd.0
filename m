Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233F1C77B7C
	for <linux-mtd@archiver.kernel.org>; Thu,  4 May 2023 13:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lfAT9RLjbqqFBV+YzfDgiXX4UfO8kkX+F4o01wTgrhY=; b=2mJi4R8+EX1m27
	MKFekjLQA4/h+Rc99bzsbXNNcDgrXDYI2rgGHvpeUbMplrAvwxYV/uKL5PZoi7WmdyPBWYP9oewqo
	/RWLN7BxJ+xPa8Z9KgNvm/hgV1vR+r6W2Mz3RsMJRnWusjgcRVW9uR/3XQhLY5Tggc8SfBXPlcofF
	VUp+LO8mEE4G/22fODf8yCZsgWwcTYTVnrIPoeJ4/zCaelfX0u+l4ApSn3Kj4N9aM2pXAqNgHWmx2
	eVynkcNyuoolHURRh1+j2M6i548P1tqeJNsvPSqOuCGx18FG17/A7wcmqlUL28Rr2KermYEQUDza4
	i+HuZnL2kbXowrWytrfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puZ0j-007yBX-2F;
	Thu, 04 May 2023 13:28:41 +0000
Received: from outbound-ip23a.ess.barracuda.com ([209.222.82.205])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puZ0g-007yAD-1T
	for linux-mtd@lists.infradead.org;
	Thu, 04 May 2023 13:28:40 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169]) by mx-outbound46-226.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 04 May 2023 13:28:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6bgAvaNuuv9QQXwxn0GuT+lp09tVsg0y4ehx1davGSsYfZbj/H7ZULl38Ve/ig4y9sMHyS5cqvByDs8a7idTWbwPSlTkXWXAwYtKXinn+kgv4eQBxeC/hjP1dCucx88K3RzN8K7MNoJkI6tJgUpfAzZtOaF+4p33sTtkf6qNJ2I4pKRM6aw4RGyTlFRSQiScMoMTsctg0se46E2x1xdMhCfAhvQE/ZBNOnf1dsz6eQ6rfN4J0US7sqK6jtji/4BFnUYp3NDFGcRUiOPNAD8BCMGggmiUn8sQAwjNrC45oqNxLzt84WpbMKOGnG56FbsGvj2wsYWtd/oix81iXk6zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIUO9cWBYfXYGkknurBZAsezqHavxJz7lJwboqTqaTk=;
 b=oHKzYOqHYh2wgvnxPu03/n4NWAKgyrkM9vfa8NBa/ep6F7Yq7eWI5pGUG+W31Jf17d1LbBkWNAGgkLamrJklJeeBe5K3QuP+ScWY5ypN9AtoqdD8uhwXRxlHTO9/Pi+TTWQ5urTScAV6jvw887DIAi5/U+OQNbBWGiB/DDQPm+HxFzTCNe0qlkRYKn52bPhskS9QBwc4xCwsjbAPL1NoCQ+fzCFRtQjbZnqs2uMxm/9fiHdOYN4oBBe881NiywaLrZvJ9+cc84vMidbnpDwRxiYOFI0rk/hseUoXSFWQOTxXmtce1G0KGo/nodcCNHswKNvZ1oUm2gmYRv8nJmawhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIUO9cWBYfXYGkknurBZAsezqHavxJz7lJwboqTqaTk=;
 b=CODkxU95xETAGmuDlMb+OwtqHh71N43hGxLvYniRZJhBMK1lYoDQF4t+cW1JBB+b/2REvsk67uZt/q+z0U026s0nmkT3LTLwupfk5OAEJ4hJrIn4w6MYk40u9dkVWvZfJL+xy0NiRx2XL4/Mx3PvAO82ynOn0EDA7+MeS6ouD7A+FCM3bm2pK1rup3q0gB60RHeUJ18kUHjfaz+IZXN7dS/EyaxbrzW2I0o27YGSZQ7qFaQBaP8h2UJRqwYKIwuBTPeNAoC21GFXXEKz6wfDwUV1yfp8T2zWKPfoGQTjU6c4TzxHT84Swpf+IaFP560DXmmWfYDZ11fbtZuEgybwfw==
Received: from DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20)
 by SJ1PR10MB5953.namprd10.prod.outlook.com (2603:10b6:a03:48c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Thu, 4 May
 2023 13:28:27 +0000
Received: from DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::738c:b283:c54:57c0]) by DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::738c:b283:c54:57c0%5]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 13:28:26 +0000
From: "Buzarra, Arturo" <Arturo.Buzarra@digi.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: BUG: Kernel Oops in in_wl_tree() with UBI Fastmap support
Thread-Topic: BUG: Kernel Oops in in_wl_tree() with UBI Fastmap support
Thread-Index: AdlxyiBTtkpMCNQ3Q2yY/BV9fl+VgAMwfwTw
Date: Thu, 4 May 2023 13:28:26 +0000
Message-ID:  <DS7PR10MB492688E6D99DB504415D7210FA6D9@DS7PR10MB4926.namprd10.prod.outlook.com>
References:  <DS7PR10MB49268C3812616F173BF44EAEFA9D9@DS7PR10MB4926.namprd10.prod.outlook.com>
In-Reply-To:  <DS7PR10MB49268C3812616F173BF44EAEFA9D9@DS7PR10MB4926.namprd10.prod.outlook.com>
Accept-Language: es-ES, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR10MB4926:EE_|SJ1PR10MB5953:EE_
x-ms-office365-filtering-correlation-id: eb9904bd-3214-4c5f-cef0-08db4ca3713b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Sq6l9Kd+diyqZYX6om6pJyGaCd6Eamd33DfC/3sxE3f5hJNMbnjp65kpxZ/IN8i/24K88No1/XzOdwiHVOUL1PsusqEU/K9XeUajlGcum6Kpev00g+Ef4Na/yf6bVVeq2DHfhkOp4oR45FISs0iv2LtSnywYC/Hml5MX8WPPdPWeBLl92xXo9/x392xCqi7NVgec7Vj0Cpa6FllNrj0c51kFpS3MaKOg+4Bls4IS791EbmsGXtLyVL5a20lhsh4kl6rF99B0kOW1LeRTwEopBm8upHPrHHuV20g2deqx2tR+CWOJ1ysNHkF/CZFqkvmBKZDiGBSfSMz/7R0Way/PJm285blzNYeyT8k0ZwbJ6U2vBcr3PXGNaWA0xtvoZlkBUhSjx5RpP3bbBngjZWyADGB84NL9HRQGQr+/OfTDFoqIot09nupYZb5gGPqYP0ikCMbWtYG/0YxzEBTY0DAZ1qIUpiM9WYX03hvx92xoXD0L+EuXTaUzetV430+nL8lXuSLBtzN7TGUHyYyEU2pQsjvwbEyyg4u86z8BxQNZmL5Fiq0nu83EXxS8vh+87Lm40jipba7sxdOrxREXVnMGPO83U9nZkb6H/PDKIp4S0qM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4926.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(39850400004)(136003)(346002)(396003)(451199021)(26005)(71200400001)(7696005)(33656002)(966005)(478600001)(55016003)(76116006)(66446008)(64756008)(66476007)(66556008)(4744005)(2906002)(38070700005)(6916009)(52536014)(8936002)(8676002)(41300700001)(86362001)(186003)(316002)(5660300002)(122000001)(38100700002)(9686003)(66946007)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?/mGg4WahcXI17YUKBboImuF7/22AIwZct1GwHZX4n0/4nBuawxFmMOhZCLB7?=
 =?us-ascii?Q?zgpOOJ285PAZPcM/7nXI5kWGrwnp1KYmRLzaS6Ao7HYzBuQp7NfKG4CaNUsg?=
 =?us-ascii?Q?zBO8Hrp5Zbnn62mpcCdHwv3RSQqRAjhv7eLPwq/GYh1Rk+XoaCnq+tjiubw2?=
 =?us-ascii?Q?g8fqXjyvf2Du8ZvZE8dLxNRokBjDb2LzC8pG0ycBVvMHRzSyiUWHKZvmBQ67?=
 =?us-ascii?Q?81kjZDYTnSAfD4QE9Ad+r29XovOlm+x//L/iQhYxkSHuTBEFLiWN2NhVdXSs?=
 =?us-ascii?Q?Mb6rILPvmsouGs/ncfSSrz0rTPvlK5w+93ULzCXNjw618lMQ40bz/V6Zjm70?=
 =?us-ascii?Q?bQamtPJO4cFoPOc2scM8VLu0evTtay6zb01e29TCNYLqC7FNYvATBPGbyWuL?=
 =?us-ascii?Q?DAQbkujEQfEbhMucC0slK2E2t/aTTPCi1/MfANezpn+I9A/0xGvd1pT1EzG6?=
 =?us-ascii?Q?pdV4KX7ewl10m/VPKURkG8G9Q2+6wPnjO9XTbcG/oJf/NiPE5ZqRyUm1q5jS?=
 =?us-ascii?Q?AUemRca4flud9YMpH2O2kymaTu1TI8t0304RngPZIAw0MYpKUQPI+AMKMlDF?=
 =?us-ascii?Q?qg36A2NmDrSb74A8goNfQwI5P0GITd7P/Iw5fRM4eqwUdBQ84yRu3FlVo76k?=
 =?us-ascii?Q?0fgetCXqA0wmbLwPuv+qPLEibbxOrV2kefH/oC/+BZ04bJmk8bozNllSNYmz?=
 =?us-ascii?Q?4FOC8AlbARFnbcglSRmab4rZPtZwnDMjNvr2sabOi/2qJ3tDddTpQ93ogTHH?=
 =?us-ascii?Q?v8eejS+9OXJsrDALRCi6PVpYsZjjAcaXH+Bo751v1bh/Eni16FqXK8Zs+jtz?=
 =?us-ascii?Q?zxXozJHELeEOBUGynYlspKsAaIom6NLXb/onDZOJZcygTTlFsDUBUSoDARbL?=
 =?us-ascii?Q?ZK+6tcGPmkhXG50HnIC1mstcfjkDOuE0pawhYz1Hsv8hFqnIKRYGValPYIFP?=
 =?us-ascii?Q?8UqbTs9yusbLPsPLxwQAVDNe0d8wpWH1Yn81q0BJUk9LLd04XxevbiDbt3z7?=
 =?us-ascii?Q?LB3F+fjNlfmp7qGCJNWfaBkjEw1S6L6Njzd0aYMV31b7RC1a9EAzrEgWNPFD?=
 =?us-ascii?Q?ZUUUA2DkcnEgwLKQ9AN7qVkyhmaK1JcfTh5IAMr5SvVzSeEYfVdhaosNT4lx?=
 =?us-ascii?Q?8SsGtNIcwSsP+A78gohJsOC9gUASTjbLzZGw4lCnZmX8Im/dBYuS5LS+zqso?=
 =?us-ascii?Q?91ek+znl+X51zQZQeThfIMvnXkRzdtcS66+4dhVZ0s3252sezaLooYYjTu89?=
 =?us-ascii?Q?tb0kR8JNz+EDXiTIBDESyUmd/yB8DKSxI+tGAMKz1XZM5dbgVp+EEkP5GYLM?=
 =?us-ascii?Q?U5FzwJdN79oYckmCGY7hzcARcuDI1zQmxyFYqz35R6UMLTcJQYdWPh+TrbJB?=
 =?us-ascii?Q?SjUNtomj1aKR6yf2cbDBQq+2aRdYauNvzK1VAI+vDlTOjeA9oXRL7RjYA5CZ?=
 =?us-ascii?Q?fRTjlt4t+AAIPuB0p7hmNBJTfB7Z3zWqKIiqJPKYmu6BZwzAW2HJj+ChOYbC?=
 =?us-ascii?Q?ItHgRrNbUHfxA9IWhUuG/LCAhM8HNgFPEuLMhuJUzBkeN8lw4DPI9Okzz1Vc?=
 =?us-ascii?Q?IT4PrxLDlW0sG54NMkQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9904bd-3214-4c5f-cef0-08db4ca3713b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 13:28:26.5802
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5rHAlkRWO33DWlRRxqBU0Dhs8RA16OI8gaXHstKh4jxmLrkgLl4yQCd/MLnKy3S39HRSbkxFbrp8WfOryoO8ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5953
X-BESS-ID: 1683206910-112002-5497-1170-1
X-BESS-VER: 2019.1_20230502.2000
X-BESS-Apparent-Source-IP: 104.47.59.169
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVsaWxkBGBlDM0DTZICXRwtLEwM
	gyKTXF0jLNwtwoLdkMyExLs0g0V6qNBQDuR6WWQAAAAA==
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.247930 [from 
	cloudscan12-127.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_062838_628303_48C4C5A5 
X-CRM114-Status: UNSURE (   6.09  )
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

Any clue about the root cause? or how to debug the issue?

Thanks,
______________________________________________________
Linux MTD discussion mailing list
https://linkprotect.cudasvc.com/url?a=http%3a%2f%2flists.infradead.org%2fmailman%2flistinfo%2flinux-mtd%2f&c=E,1,vmAqlE362IdN6sagasDNLPJlKfjqEGwQmLFtVbCAc_Wbk_dnAlhSGiApLGzDYasLJE-eIuN2UuHVjSBCp8i0mSrJiCEUGzQcud3LvjrNJuf4eLCT3rQ,&typo=1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
