Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D222EB64D7
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jun 2023 15:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4X0HpAOscWZggQvCAZOkNKgXPtlhLsxpBl/5Eu/Y7w0=; b=fhM/fT9cLjYPjX
	ynTn2u1WHIdPU2bhi1aXLgqeeOeAjbgeTSoQZHxBo8nZ52oRj5OPa3C1t9fSCSJpcLQojbjyRxu0Y
	pv0mL/PdJNT6c29dI2jrzVNWevJWw3Wy5l5Kg+2Ec72qKxwfbhFzC02SurFUVJhoaRwEA1+gI+6Hf
	gQe9hC4UAcgTsIDoujP6avSnm6cgKnima7cXUHmN6skjBoCgn6FFJdErJsUIixiIzJZxjxomzQ5PZ
	wAY15OsWUo1iiSMU6OwU8Zd9fjb1p2xn7iWaXkWuWWtjBgg+f5CnflHh9NfCSaLZsV3Y93UD7byiW
	RnCqHkv0pvjsXerilpYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBzjc-00EwGf-1b;
	Wed, 21 Jun 2023 15:27:04 +0000
Received: from mail-vi1eur04on0607.outbound.protection.outlook.com ([2a01:111:f400:fe0e::607] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBzjY-00EwFu-3B
	for linux-mtd@lists.infradead.org;
	Wed, 21 Jun 2023 15:27:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O06U7N6NOTdyiFRsSpVq7vhdTQQPTuCqJmRp0tp0BjW3YxKyIDU+6ApfsSt7uJkHTSTr454nD2TszOm7uPTdmHn+kMwNKEyDlt9Br2oaVIzq7yKE7hCs42qL9PDIwK1WjoiUZ63hTQ3SPCSX29i7zhj5GbwYRAwSjtRVGjw0nC0KtdHzqxc4TITaYBkpfoXPLMVh8m1MiviclO7O6C8tTiUDdqKJXJl/l7asG6p+QB7mBXP+g5G54anNMi3I09SvYXUWyGWfXYc2zlHV13UxwOPDc6R5nF3MxtzoDnKJZyf1hl7ywZNy1gggKxmt6Ou1sHbgYysxrk36wU/CW74W0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIzNPrQMRCHd5EsrRbnetu3AAjebfegTgJq5OPB2hbg=;
 b=kqRChdZmHQ45Wq4JACecygk1jIXTOMt2+VD9VS/Dpt3NJtEKcJxCnqO9GtlHzBzEGJIx0mROWIox4zgRAc2jC4MT98yQ7CLjcocQ81anuqFETttWxTG+GiZm0v09xBN1DkOarAQuhjrM5sFmL6OAEGPRqC6trXSW09JXamF7giG0FKuHk6ZiFuLqeimUcekgxr/C4gW1OLOBudop5LVS3K08kwP2lSH2sChA5JFWiFT4RcVhWhXOe3Z2MLrfZ5OfFSXI6PiXXNsJ1ViytFv75/RBxL06BW6ZVtXdQkDFhkRA14LY0rcF4zRwNMRpgOmnEPmcf0tTN5olU024irnbDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIzNPrQMRCHd5EsrRbnetu3AAjebfegTgJq5OPB2hbg=;
 b=d08kuln9H+tSsk0n3N3szgEGmWQ+e7PCAdd7veRX76t8DnGzxF1bL4rXVab9H7uviSRow+HG3aTr4wOetoEWB+RhgFOJCDSmwqVKsbI5sQ7i0KWEFExs2TK8VFKOih/3xh6Gx73nFNAxpBZQ5DnTrf95GVO4+0pFqwO+yrmEpKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1PR04MB9071.eurprd04.prod.outlook.com (2603:10a6:150:22::11)
 by VI1PR04MB9908.eurprd04.prod.outlook.com (2603:10a6:800:1d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 15:26:48 +0000
Received: from GV1PR04MB9071.eurprd04.prod.outlook.com
 ([fe80::ff54:11b9:7017:c36d]) by GV1PR04MB9071.eurprd04.prod.outlook.com
 ([fe80::ff54:11b9:7017:c36d%7]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 15:26:48 +0000
Date: Wed, 21 Jun 2023 10:26:38 -0500
From: "han.xu" <han.xu@nxp.com>
To: Kegl Rohit <keglrohit@gmail.com>
Cc: linux-mtd@lists.infradead.org, han.xu@nxp.com
Subject: Re: mtd: raw: nand: gpmi-nand data corruption @ v5.10.184
Message-ID: <20230621152556.qcjarclgbagkygdt@umbrella>
References: <CAMeyCbi16i4mdkOnqYhbW1tnqNwPwg2FVYqbdyhXt1fT10EaUw@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAMeyCbi16i4mdkOnqYhbW1tnqNwPwg2FVYqbdyhXt1fT10EaUw@mail.gmail.com>
X-ClientProxiedBy: BY5PR20CA0013.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::26) To GV1PR04MB9071.eurprd04.prod.outlook.com
 (2603:10a6:150:22::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9071:EE_|VI1PR04MB9908:EE_
X-MS-Office365-Filtering-Correlation-Id: 83714735-3590-43b2-59c0-08db726bed81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sjz3ZqGp82TRSrcxeGyOmDjoz+Y3sOqGh9tiMO+w53ChVOPjRKAl9Ppm5HrQaccDtCVcuJSCAgup+uYSm/qSbPD/7N8LvPm7dshc0udJonSUJ5xz7Lx71yA/QA+gMmxx7JJx8DFmKwXfvM8jGjmtC+sZZatX3zD0hZMsVdz0oZAHNIjnZhhaBVgPdFmyUnCeBOvvqiXSMcj0J8CBv774ObjqgEM1mBz8KusuSx367tMSp3EN+WHPuVj9gimnO5QiVa4Ts6tUZBeUOzoQFnCwPwLKFtr9lGB175hCGidkjiYffsuSCAgj0dnS7M8QpI7JLX+PVr3rvC4sfnmJIfdQI49o8m0myCZPFwxKCMMSM6tO7jmQQwhCfn6ltEgQjhVH6CHuqEmNruW/45wEp6T2DR2worhZvv38gQRep1mFydB8iy/ERNBz6u9R607whXkiVmaPr/aXno1YMfBIuQn1ApNCVOFtcLLY5ifc0ol9+zCx8Vk0giFC7KLmKQFMvoEAVlUhR1MXHmTjQujXCu/TGCv+F0pHTihnqbM/2jb01hDcZKZVocjHWhNgjNSbHccHkt2mZoQ/A85dGE10P3UsWAs5SLeBuoepWTeMKeiC7ZlgpXvOnVmwM/g9dTWnkpVEvfA231QF1ThpsyJz2x0yEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9071.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199021)(478600001)(1076003)(966005)(6486002)(83380400001)(52116002)(6666004)(186003)(2906002)(6512007)(26005)(6506007)(9686003)(3716004)(33716001)(5660300002)(6916009)(38350700002)(38100700002)(4326008)(316002)(66946007)(66476007)(86362001)(8936002)(8676002)(41300700001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7ZfSfgdWymzhQErHhJVyz/KOBbfU5HR7iuJTCmr/P559Fjk95ZHkBgGtXFkl?=
 =?us-ascii?Q?BEBTV4IIUIkAF5EDu9NRcp72k1K7EzPi3shS67wzDi5SXMfbhw/pLfkf+7wn?=
 =?us-ascii?Q?jXaYcRI36icUtiZTmkT2Oj+n0WVzZ7NApQV0bF1TF6PMPhD6ANz2NmGKG4jc?=
 =?us-ascii?Q?7Z545ZurbAZUz+vM707Lwwnjm3YFlxztvLSLFx13A4lGAxvpjJqfhTxPIi79?=
 =?us-ascii?Q?Gcp782RFuUtbddBemwrE2/MTDolq1JBe8f7ajPYAGQtTb+gkgP1mab6zuJ9Q?=
 =?us-ascii?Q?//v/aeKo4XOCnSEL6dy4kQpV7FDdoCaFLD2mG+KO0mSQRSJuh7yYeQK2fIzm?=
 =?us-ascii?Q?JuyF/MiVJQcBQfM1UaEWVLcg4O50/gTfqXb4MKdUCwkAZfbQFCHdbIJ8a3FL?=
 =?us-ascii?Q?CcOcJ1UtVhkf93FbafPDumFRQvPImvc752CuaKd2dq7EJ2V8Hbqee792rPSP?=
 =?us-ascii?Q?QY0KDU3I0kfx0um8UXjLOS6Ay47+JCaTR+7oM6MwWawW/01nn6cNF/QR7gjA?=
 =?us-ascii?Q?JzYdKmXzHxnJImaJ3wlT5/sIE4j6FyiawzYO/ITcuDM4qQgsKjoa/qG4B8IQ?=
 =?us-ascii?Q?TXK+qtXdDk0UpOjzf0VJ+/BeFaliOvSWewNAGdGQln8VXs+OLwOhX7E9Llps?=
 =?us-ascii?Q?aspdK1Vhlt8Lj2BGejxew3q7Ef1wHdJ1q7ItFe6hNzzfdySUO61N24+YQEZv?=
 =?us-ascii?Q?j3Vh3hebA3XigM+lobg/xJOYFyaEgfdMIlmj7KFRSUC2Z+qTlKFgGIsl4fbi?=
 =?us-ascii?Q?wWg3jfUnASr6vkDT/8ni+mgAQP+yRS1LfJkeCfasq+VW+CriSjbtXFUcREc1?=
 =?us-ascii?Q?bxWM6xcquVQhSJ6M+Vnx0fXOawuK5thbHTz6xSkbSlhVhlvuZrvnYdQJnruG?=
 =?us-ascii?Q?nMx7X4qqlh+yAcIdbhveWPEFM0fmWunFWFfaso6LjpuuqLMQ1RTEwiKd+DNE?=
 =?us-ascii?Q?G4isxnIal9qUYN7c2GwnW8cqJWXuT0ehaGv+yFyfEcOWtFngRZb0EFyKoerW?=
 =?us-ascii?Q?ErDAXxLd0OfmJU39itd83g8LPnpjpUlOXKqo39SS1NZYKHaAtmmhUgqBk1+Y?=
 =?us-ascii?Q?b7LM+eead4zPJ0T3G+SgmAsuHzjz6wowGKVOXpWrxpSGOzS7yhAdw3jE2ZRb?=
 =?us-ascii?Q?ZpLhZF3Y1WRjymq4D6+vDYbAnPfVNZqvoVsupsHkqaydo7fPqa06EXdMpLre?=
 =?us-ascii?Q?0YAdxRW8Sfv0SQgfB7JtkfbrrdgO59/aa6UfDSJ3u2EfiLgkBsRtgpn+h84X?=
 =?us-ascii?Q?jWAs0TsXvcW2lSrF8JJjbT3hN2lV6CttGNfEEGpyKapC9rihScySgMlBzt2w?=
 =?us-ascii?Q?3S1YrsSH48O8YnOjoTVge4u6njml7XCj1b3wfXQd9gYJhW8vaixNYopYbIwc?=
 =?us-ascii?Q?Dqh1Ph+FCSvJJ6Vp1lME1HQBLVOh23RU9GIjuOPZeMKufzOQ8GC09WWszRWT?=
 =?us-ascii?Q?kechDSgcIyoFLceM2uyyleWei96NXJjLLpS2VTrJUDnbd4EkCQBDJoIPbp3n?=
 =?us-ascii?Q?+8iffpmAwAHGRfjwhC3pvvMSEj9kxPrLLOscFhMPGLP52qBk8QpWrI/Pmk5n?=
 =?us-ascii?Q?8MA27CWdHknWhCCFRSI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83714735-3590-43b2-59c0-08db726bed81
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9071.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 15:26:47.8185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CBnXmIxvREdv9pCN+ckmCG4VmScTP0tfSolijgL2WyoDEsDbGHRU56VdcILUoqXU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9908
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_082701_128956_5F08E579 
X-CRM114-Status: GOOD (  17.02  )
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

On 23/06/21 04:27PM, Kegl Rohit wrote:
> Hello!
> 
> Using imx7d and rt stable kernel tree.
> 
> After upgrading to v5.10.184-rt90 the rootfs ubifs mtd partition got corrupted.
> https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git/tag/?h=v5.10.184-rt90
> 
> After reverting the latest patch
> (e4e4b24b42e710db058cc2a79a7cf16bf02b4915), the rootfs partition did
> not get corrupted.
> https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git/commit/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c?h=v5.10.184-rt90&id=e4e4b24b42e710db058cc2a79a7cf16bf02b4915
> 
> The commit message states the timeout calculation was changed.
> Here are the calculated timeouts `busy_timeout_cycles` before (_old)
> and after the patch (_new):
> 
> [    0.491534] busy_timeout_cycles_old 4353
> [    0.491604] busy_timeout_cycles_new 1424705
> [    0.492300] nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xdc
> [    0.492310] nand: Macronix MX30LF4G28AC
> [    0.492316] nand: 512 MiB, SLC, erase size: 128 KiB, page size:
> 2048, OOB size: 112
> [    0.492488] busy_timeout_cycles_old 4353
> [    0.492493] busy_timeout_cycles_new 1424705
> [    0.492863] busy_timeout_cycles_old 2510
> [    0.492872] busy_timeout_cycles_new 350000
> 
> The new timeouts are set a lot higher. Higher timeouts should not be
> an issue. Lower timeouts could be an issue.
> But because of this high timeouts gpmi-nand is broken for us.
> 
> For now we simple reverted the change.
> The new calculations seem to be flaky, a previous "fix backport" was
> already reverted because of data corruption.
> https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git/commit/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c?h=v5.10.184-rt90&id=cc5ee0e0eed0bec2b7cc1d0feb9405e884eace7d
> 
> Any guesses why the high timeout causes issues?

high timeout with wrong calculation may overflow and causes DEVICE_BUSY_TIMEOUT
register turns to be 0.

> 
> 
> Thanks in advance!
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
