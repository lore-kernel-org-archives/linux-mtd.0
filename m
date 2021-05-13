Return-Path: <SRS0=otIu=KI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A007DC433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 13 May 2021 20:04:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 246B6613CD
	for <linux-mtd@archiver.kernel.org>; Thu, 13 May 2021 20:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 246B6613CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=brp2jb5pfyuQ1OYCZYsVsj+9btr2IvjyLhRrMnfaD1s=; b=p9sMLAOSXsz1Vt+3tCPRjuF2e
	C1PT8QQGgGbNYP6kpk6rt8kJIPxASzrSiOM0Edvk9/ACA0GDG9aH4iH3eTQ98vddJQV2jFRv+X1r1
	y+7H5wgbMJw8zweI4MM8MNa4pfjViOCvUg1IuWvRkZF6f6gSDs+YngqRb0GdmhOrY9kbutnlMr0E1
	O5lftjgn3Zy+UUWTxJyWekXIQLoDgWhNyUUtR4qxqxfe/PjiKgeBHnCgNH5o9SvOqa/3PP2LzamZL
	j5m5YFs1iUTdA8RP9ZQ9a1kFWzws5d/v9hglX1e3Elz0mO+D1JX4/8BTNrilcB1JUDrMxFX38Ter0
	UAInHnNrQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhHY8-006LdC-Dl; Thu, 13 May 2021 20:03:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhHXx-006LcY-1a
 for linux-mtd@desiato.infradead.org; Thu, 13 May 2021 20:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:In-Reply-To:Content-Type
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=QZAjXpzzQEqvDbZE5V2GT2aECmPzmfSLEO/QqaEnrE8=; b=u9DLTFgRmCks5jD+6tGjC2HJ+9
 Ie3tnqEH88tVFEcRf5xR8NTFZC3jqrPhiL0dq/BxEIHjNR8fJ9E1LGNzlIhhbmACzJLKe5djcm6o6
 sswomY5GmzacfoPGNo8sdpHEB1E+idzB6zrbdNlP75RJkdv4CDNmUg/0kCaTMz8sR0HMfHSQwBuBF
 Avhplq09dqQypMGeci89FDyaAHdDFlGC0V9lcpzta63ULET5HwQk8ABApq6Y03wbFv9U8DxWh9z6R
 6jmwlioxGW4aOvSrzxFZCzgZmXQTbjOx8Ad5VFZ6ZUaOOicGKFOBPUJ9iWqurFBeI0q90pzLHcdJn
 Q2LhCbSA==;
Received: from mail-eopbgr80048.outbound.protection.outlook.com ([40.107.8.48]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhHXu-00BUsx-02
 for linux-mtd@lists.infradead.org; Thu, 13 May 2021 20:02:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRH275IczgdNx976iLVfcQ/nltkUloXB3p0CyGxPvzVWIhDbJxS5SLLMh56L0z7izK4s5FxZ5FZl6Zl6kuGwPLVeeaOf2LWZJbG5eKqF4oPWnPe828zjwxPX4gX1NaFpWlnms87TSqvBZvs+NkRrkxXmvRns9EiW89JPI4mOzuL+pU/RoYIDNj5JnQ9uZO4/PlKM3ym9i90YPVLGehZU0SHRWVg+R5SlNwTHzLTj1BOeT5BUwZKI0rhtkF266zTCvzf/wVZz3QDVctesh9aEzD8PYTtYwD72MCQyCiB04nMau9P540mRVyvKKXSm1h/tX8pj3L0RqT+WBq070nocFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZAjXpzzQEqvDbZE5V2GT2aECmPzmfSLEO/QqaEnrE8=;
 b=SP5BxRIlK+XbhQgcSGB+2b1iBwe/HimyXOaFFkdFqXvJaCKFmkNH6AlQe/9aoKU26Du1zQ1bsKOzWZqsGhqJWGSXQaGHHaZce6h5ShzVlFvLH6dw/aIGeB1/Bs592IPbASfMHTKsxxr8MuHdAo8i4XgJuwu5aEC4NYZ9tYxAPLM+h7FmN5N1yLUGogw9m5BkV1buqm7M8NuCheFxV01Bt3BMZ0v/NYMYsZNtfoLBVGlvlnKBxBN3g/JNV+z7oqNF0QWO/ndTlotCMZ8O2x7SDVWqELTRuKkIWnt7Lx62XoV00Zo/AOBoexCImCiyS9qb6Kkp0BdLEqApVoUGda46Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZAjXpzzQEqvDbZE5V2GT2aECmPzmfSLEO/QqaEnrE8=;
 b=iP6+/Ysvu0MvrTV2RTDq54ANcT4LR7Iae20Ug0HyRVYBnLu9LD6sdF9Zr1QQtwUxTMdHOy963CquAKbIOMBsh70/fg84f6MnUzLJJxIyy49eVUOlG05qFmYf9nctLS94mLWrOWQEQJP9dcDuRouFZ0QFItnvxW/M20KAsri28/M=
Authentication-Results: geanix.com; dkim=none (message not signed)
 header.d=none;geanix.com; dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by DB9PR04MB8479.eurprd04.prod.outlook.com (2603:10a6:10:2c5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 13 May
 2021 20:02:52 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::285f:56e6:a248:1c78]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::285f:56e6:a248:1c78%5]) with mapi id 15.20.4129.028; Thu, 13 May 2021
 20:02:52 +0000
Date: Thu, 13 May 2021 15:02:42 -0500
From: "han.xu" <han.xu@nxp.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: peng.fan@nxp.com, ye.li@nxp.com, alice.guo@nxp.com, sjg@chromium.org,
 seanga2@gmail.com, u-boot@lists.denx.de, miquel.raynal@bootlin.com,
 linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: [EXT] [PATCH] mtd: mxs_nand: default to legacy bch and rename to
 modern bch option
Message-ID: <20210513200242.fxvfvwgua35hbqvr@umbrella>
References: <20210510100043.449294-1-sean@geanix.com>
 <20210511024926.t6kunesknbwe7k2x@umbrella>
 <a33cac1f-7988-08ea-7d9d-c9b76b80cc3e@geanix.com>
Content-Disposition: inline
In-Reply-To: <a33cac1f-7988-08ea-7d9d-c9b76b80cc3e@geanix.com>
User-Agent: NeoMutt/20171215
X-Originating-IP: [70.112.23.252]
X-ClientProxiedBy: SJ0PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::15) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (70.112.23.252) by
 SJ0PR03CA0340.namprd03.prod.outlook.com (2603:10b6:a03:39c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Thu, 13 May 2021 20:02:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1e75eea-f00e-48d3-f0fa-08d9164a1712
X-MS-TrafficTypeDiagnostic: DB9PR04MB8479:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB8479C30BA0D753A7D095527F97519@DB9PR04MB8479.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iZopqRh8NldLy50K8Z7TmbFGx4niAGgCKJ5YLpZ2Ltz7T2cq5NRnxebdJCW2f8KWW17UjljZFt78SYrFvOgD8AgWk/b+bGGsg6hTlDgfyPtcAzaoWE6pVaAMaJpHiaGj8ppE0l8UkBKTa9/DiPTFPzxY91wT+TuAl/pNI9qIn+eZ4Rn9f4g6c2g/XpEjPGaFn026U/5r9I9e70PbV30zzXqRpSGb3T5ORUM+V4lUKde89VbyBsr4/Zu6ZDJIqLNU6KqM3SwfV2qHh8BxLbYBV62IycTojw7eJB2YLjqvp7B+dVf0B9eBZorijjfykklXCRnRw3beKd+OnKoF+7il92PmGRL3Hz9aDyP+Bg2qnvihqAxbAs1bktxQH3MxBVYPPylRmJJtn/Pc9j2uKpJe3ZknaE6Upc25mSkYUKZyFIO/XRbqjlRW1Cvqkl/u5cpL70uM1vTPvpbgkJ9q+Mrqyrt8GCrqUoGR/oYn4zB4eRrOxIwg7PsbDO7GrD0IcKfwZwMLirquPh0WxZZd8tjn2BI7ZvDCBHHhwMXxGDuR3qDCgY3Z/fmXoPiYqV93F2FLb4jIpeX1LbscVKY4Yrfh3Ak8rtlQMgkckDLPgVJLqu8iciU6Bh1i9OCAzU83WTJurehXN0CujdKNBW/PN2Etpg59QL97WqtQRkR7Rg6tA4s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(39850400004)(376002)(396003)(136003)(366004)(346002)(6486002)(33716001)(1076003)(26005)(4326008)(6916009)(8676002)(2906002)(9686003)(52116002)(6666004)(38350700002)(186003)(478600001)(66476007)(5660300002)(16526019)(38100700002)(316002)(8936002)(66556008)(66946007)(86362001)(6496006)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WMNJHHXkw5AeTLP6dog101wPGWpqcFsjtUNIPbFlOazcuC8lyFOWbKpHYvXt?=
 =?us-ascii?Q?+l37EXQYrxmRFDsb9ExSVB/Ge1RIG31Axo2+VXT2r5ona9Ks5YCxxF3IGWG+?=
 =?us-ascii?Q?ZR+Bej1A3wXVJPyNaYADJimJgavWyNEpykLVajxnlv8kEGElOJoNQElJBCMO?=
 =?us-ascii?Q?yvJEIPC8NSZe2NlKW+soLpQkIJCouzYVw+1gQTv6389aJEjmcXTnQ9bJ1ZJz?=
 =?us-ascii?Q?aHBOP8r9lE1+3w+9RlAZo8F+7EHLkrVTrCpCKCYp1muHZBaec2NxjwCwu1X/?=
 =?us-ascii?Q?qnceoxZ5Ay4/9B92A3N49dYGDGhnONnlOTovbCwMm2dKtTEmDcaN3Fda47jJ?=
 =?us-ascii?Q?rSvSBPF+WwjlR+PzbnJCNj3OZoWdTLjXFEq3Iyi4VTwW5jq9O1hpUK5+efeE?=
 =?us-ascii?Q?oGh6FHrTyYxh8H7z8/GD3hYk6souAKcA95XqbFd1VJ6vGz/zc1UDHAn6lHN9?=
 =?us-ascii?Q?67e2WP14bL0Jsp1zhI7HDKn09PZNcaWuDS1plLbMGrV2SuzmCQdtNaPIafzU?=
 =?us-ascii?Q?/BEPyc1YN+/5qpV5vhJO7Yr9jaJhV6fxU/jCyFjFbCieag7lZ2jJDT9BpJ/l?=
 =?us-ascii?Q?M97kKXpypd9Ag0RkTQLv5XY86wErqX5+HcCrEq6Ya5/w3fFnX+8k9gzBpkUZ?=
 =?us-ascii?Q?JCYii6SITI4tKNvBjI0P7kg0eP9arIxQ9lr3ZPdxnUQ/1ILk/RuicUYLQg0k?=
 =?us-ascii?Q?JcBthuT3B2XdDiqio1l6616AZJiKUbA15lOhvYKRkJQOFynzO0N6Sy74m4lc?=
 =?us-ascii?Q?prXYI1TLUSfMcjw2/l+7i0jjQ0irw2k4SJvXiA+hkUDCnTb1ARlMDbnhEvcQ?=
 =?us-ascii?Q?TR9Lem4pdR+vXZhxHqUT/YbW2/KSf62lBd2H1+lzhhT9hw3n12MhhkUIjSuT?=
 =?us-ascii?Q?dKgb6VloynM0gR0fR1sRORCnn1CwqGNKT4mPCzRnaVbAd71HZRatSt0JZcpG?=
 =?us-ascii?Q?XaYcDMAmmhKv3g70cgalVDNAXAqKv1axvdPHgzyrwJntak9TK+x8LzIcNt8p?=
 =?us-ascii?Q?n4qmAAkC+eiNoAcy21QsIeIpw35TfHpihlA0Cv6eMcoMf6I8PrqSd1YTCsUO?=
 =?us-ascii?Q?qpfaaR/hZ4+T2WAl1tVLaA4oJj6917MKp/Jd/SF+TglreZZ6QmsIAkcICK1P?=
 =?us-ascii?Q?Iu4lzdVuqlUHPa/DnWcU/wRIBGwssYMvo1Ejg4RJY2+jeRYyC5EqcbUpmgEI?=
 =?us-ascii?Q?clzy15xq61RXCaeMt+zhucrcPGxlbmc3/9YieijmuF5mQ8nozLVM5lDviHgq?=
 =?us-ascii?Q?atH65UExeL1iBJRkto4YCH4Lk47hu0KnUOrRka2SAH187CrZhiE1dxxe93DT?=
 =?us-ascii?Q?KhAK+p2434UUWShddNJR7wVm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e75eea-f00e-48d3-f0fa-08d9164a1712
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2021 20:02:52.1687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fCDGvPYmst7ECZ7Oaikv0GqfcAiBxV/3Tg9YmZpFFtzJnkJrJpTd+QNMAJdaX45B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8479
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_130258_148410_18AAC25B 
X-CRM114-Status: GOOD (  16.21  )
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

On 21/05/11 07:08AM, Sean Nyekjaer wrote:
> Caution: EXT Email
> 
> On 11/05/2021 04.49, han.xu wrote:
> > On 21/05/10 12:00PM, Sean Nyekjaer wrote:
> >> Caution: EXT Email
> >>
> >> Linux kernel defaults to use legacy bch setting, this was creating a
> >> mismatch between U-boot and Linux default settings.
> > Kernel uses the NAND chip specified minimum ecc strength and steps by default
> > not the legacy bch setting, unless users enable it in DT file.
> >
> 
> Hi,
> 
> Adding, mtd-list and Miquel
> 
> With u-boot dtb:
> &gpmi {
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_gpmi_nand1>;
>         compatible = "fsl,imx7d-gpmi-nand";
>         nand-on-flash-bbt;
>         status = "okay";
> };
> 
> With linux dtb (mainline 5.10):
> &gpmi {
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_gpmi_nand1>;
>         nand-on-flash-bbt;
>         status = "okay";
> };
> 
> U-boot prior to commit 51cdf83eea selected 18 bit ECC, after that commit it selects 8 bits.
> With legacy option it selects 18.
> Linux is selecting 18 bits ;) So now we have a mismatch.
> 
> I have been searching for the legacy option in the mainline kernel can't find it ;)
> Please show me where it is (is it in the NXP fork?)

You are right, it's only fixed in NXP fork, with kernel driver modification. We
prefer the current u-boot bch geometry, so I will send out a kernel patch to
make them align.

> 
> /Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
