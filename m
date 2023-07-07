Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB4FC001B0
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jul 2023 04:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQiXSG423G2vTA2LVnNJcZkowFOIerKKmjuIhUgja4o=; b=C+nrrJv7j8h15b
	qRJDfvTyzcoMwodBNdck0JBegl2nDoP31Ccb+K5HpWQ38arNKaHYyxDzCHhTn17AZZVtkPrXiLYeI
	VSypoYdpbCV04O1OpxlPtAf73zOmlcGpnMSltZbgFeBmIEoICzKzL+FflKizpq3mQD+lukgq0zDGX
	wk9KfoUyX0Q8JVTjsWnkcdcDRXGPJ0VE3W3VPcrXLvp3ATUP6/368sh/CzozIUNI3ilj3H2TtUMD3
	SSgmr54c3/HMlkUaOp0HaIrc3dFVXtErfZWsvSY9upPNjYiJLs9Rj4pzsXDTXXjVThXdXpqYscZNE
	c5zVP7FSliszERnso1FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHckI-003PrR-2X;
	Fri, 07 Jul 2023 04:07:02 +0000
Received: from mail-tyzapc01on20721.outbound.protection.outlook.com ([2a01:111:f403:704b::721] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHckD-003Pkw-2w;
	Fri, 07 Jul 2023 04:06:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWLzjXQOLzG83xsxTOMmtdU+ByBDhg6qcKE0Hd5jmx99AWQqgj2VCkHt4e/sVwbEdH+pbbPRgS0CSlYX1MJ95ztDMo8jLMZe8I26DN2fDfvHjyU9SSnP1Ek1HZU3A8RgcoxsOuz8YViirnJhHBSeojZy/TNOLqjERQQZ3rIwO9BLoB2R3Pq+sMtWJvUgEM9GZbuUamsGVIXvHmyc/9Kzr7fONl3yKvgSHiPq8Me0AE/92QDFfWiMQSfT7bHvGd000qSyPrEWEFabJuDGgdwaZx7OWZvlrp8UiefNP5TsV+ghVq6+Iz9Ta3zlTpUAu4sZpBCX7V36gXohyfoBE74xmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOPiujfmumy5qPnC+xECA6xjofv/nI/7adzc/RmsMGE=;
 b=QhdM0Ph4IxNL7aUuCcMLi2/Vf//4PuG/Lib3E8hamUoe7xLUJw3CeT1i5dFrae8gdS7czw18Fm4FQkTIkI42f2zpQa/XQ+bcAblYmeJ4pnddRFugB8WuQwnEvVxAL8HfD49URSHDrP2Form2PBHE/a8vb+xo/1lxCBTu1UbnT2LQr8e/mcmJW3ayvvKudVsZN2X2VNj170LVmyhvqCca9qddK9Io7sGllBfqs5A+k21WXQMlxHnzXEWKF+dmyzbRqPYyyPTRAGVonJy31J/xktyw0tO9XGKE0PpQvOtH/YUxwifDDOXFqTzQcJk13ECU9AISvXiYGzF/2QbdtkYjQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOPiujfmumy5qPnC+xECA6xjofv/nI/7adzc/RmsMGE=;
 b=RCcivcgyf3sTtJWCVaU8lLK3c60rPeRb/QSWTqcfEIOyKAIJAhp/N4OLJVMOdWQBacJRfnc9ltmJMsDDJVcyhdQv6Sk00orGeH63EYS17AdHi3GXZfn7k35zbC1qeUCJfpIBuxSH9R8OboV7lfpsYqNHq7zep+7gIW/KORkncuWErkxvbiFlrqK7wu3SfJRJQ+a5XeEgID/+FWdwg9ZGJ7QiCQf8uQoh6OlgoKH3wSRJeLDUfCjh5WfzbxwSnIbNG91HT3u9vAt1HKGoRksbM3H4QswCuQAIgHxPME4OmexKIiWjPWxC53VGWjvCaiCM3FzT/RhY38a6wtR2Ypw+ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5470.apcprd06.prod.outlook.com (2603:1096:400:264::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 04:06:36 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 04:06:36 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/18] mtd: rawnand: lpc32xx_slc: Use devm_platform_get_and_ioremap_resource()
Date: Fri,  7 Jul 2023 12:06:06 +0800
Message-Id: <20230707040622.78174-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230707040622.78174-1-frank.li@vivo.com>
References: <20230707040622.78174-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR01CA0112.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5470:EE_
X-MS-Office365-Filtering-Correlation-Id: f96051dc-f48e-4d5f-7ad0-08db7e9f8e9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iiumK/UmRsYh6OG8V04MV3N/S2lN6yh+biyfMG3hfqt4/YkRR5CXa0q5qTKvhG+qg9cz2VvZyUWv8mpdmHfil03SXtfkfGWSqjpuKmH2LyYuqij5uqetVp31QR0h46QY2xKmADpDPAciH1g4JFHjws8ZC4pIb6vSphBO7KWtCLFHqW4v7GntYUZP3V/oAFmxq96QCCkavEQXLuNM5HHd12vg5qBROGJl5NPMh1gHj4R8z3EN8zqaVeDWoiQEIi/yxV5ptxMP8t0zFqG2spxePh49j5ov4dwCZVqfcyZnt1RCVzZLYjpwhVDrNtx+6OQgh3NI7lG6U8BhTSq8OM3/c6RYU4F5I0OMMF3BzeM+30/2ndAUWsf2cc3gnrR3rYYJE0n1ylaXDwR6ve6x+49+tKFZGm8/cdGbtVN09d0iDx+deo89P0ImeSG+aWbmBr7+EpDpayj9S+oTFiiAfHUQVwfWVykR9tSXLpRKMHXeG2qpFbonLuOV9cs5r1OkOLAGIVNU7+peFO6eSo9VItEZuqp4kIQSO+GJZ5a3P6RlCPjpLjYs3xmfcSjwwPloTkEURS+04AilIXL4lRyo2SRHvSQKCfDZgV8FmkoFOMyAVfqeQUcKgcU8zJdbyMJyTQxq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199021)(478600001)(6486002)(52116002)(6666004)(110136005)(26005)(186003)(6506007)(1076003)(6512007)(2906002)(4744005)(316002)(4326008)(41300700001)(66946007)(66476007)(8936002)(5660300002)(8676002)(66556008)(38350700002)(38100700002)(86362001)(36756003)(83380400001)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TuLGR4rCjEWuU/sToyXSnXkoZh36krdI35iI0CqeXR3/fQNupzwB9JJdg7fh?=
 =?us-ascii?Q?Q88ExzNxby6eZkDb4w3ThXZCMIV7XL/wTpXt44oRqDModl2XJNXut7zWQ2u/?=
 =?us-ascii?Q?Roe3VJGa4LerQCIVYdZSX55vLSVOAfut698XFJB0y4qb6YWxFmgjTaCxYLMD?=
 =?us-ascii?Q?RenTvl0PH+hfEWcexdKSTv94XgdnZJFiNvUZH5PpWJHGXJkJnLMiWLzgDjpc?=
 =?us-ascii?Q?FRjHK+Sy3HISWK7OwVLGnZ2+B1VVD04YbOgi7Qh95MtamutB0uWkNYE/hBkT?=
 =?us-ascii?Q?agEVfhYwr3iKAABzaNYLDs0EHUzqK3eh6oOxSUu2IfwUrflxpsCZigcReLol?=
 =?us-ascii?Q?1gPFC6m4NDjvBDLQPjpMkwlmIyb+pt/mPwQgXNfM6VIkX59Tn6TqSFJP4phW?=
 =?us-ascii?Q?1cZUxSJ+0QyFL+hmN9UtDEd/ebOmBYf/r7BZ5SN4Hvov2coeGZbfZhKSE8Pj?=
 =?us-ascii?Q?OWNkHV1iI53cgDRDRAloUY/3IE97P7MIBpxredAs0QBpyZ1sjeWyF3v6047n?=
 =?us-ascii?Q?FEP+AV0Fbs9Dq61j+A1PXA6QkxsBQic5HgfurQkgCKpnM/bdJ/mnENDxSjE0?=
 =?us-ascii?Q?0i96P56nW5nEuWeopp74jcBPoRaXmITRrrARqJ29IZPihGP2T/neBkqcvavM?=
 =?us-ascii?Q?DMdisu3t002tYlPzYT7B5+NKpAK+VYK1kmpHqzrwFYAFrVekLCo8nHhYxbsr?=
 =?us-ascii?Q?XmI36MHJTErJkrnHO6Hd/MNekXC1wA5tk+3p/Q+TKfCjYfAtDJauLh+ec42t?=
 =?us-ascii?Q?QlbNEOlaxy5IbEHyXjdI/GCgtl/YLpZ4GpI2uVz7AUpmXn+I5Axtnp/iDBsV?=
 =?us-ascii?Q?mJ9MtBseV/h7No7hxhkrECfLVSr+wiKYP3QQhqTmKnC41Mx8trBScg31Xf4V?=
 =?us-ascii?Q?jgrMFd85bYzSU5ptyoKLlL+CwvvxE4uDplGDHLJoaQYNLPJlWN82r6j9Ue9v?=
 =?us-ascii?Q?B6f6qH559xG2icNMQc/jXrX1r7Ek3VjMvMBGLP75lUp4lCiXxvg+WfsafdIO?=
 =?us-ascii?Q?x7y4Afv+bbjj7lG7v6HqiXgE/UQeqH/W1fyoj3cGbx9ccQxnv9Mn2xP7s3KK?=
 =?us-ascii?Q?hg9yVNV6u1LxOYSGXa3hEKPj/OuyOdIazDfqXxOxfMnAUZIDV5pUAi7NOG0/?=
 =?us-ascii?Q?mhizdBqXmYPUT4aMwZxuaJVxOLDVXZ5J8reOFw5sr2j4XPNeqQ/x7gveR6Hq?=
 =?us-ascii?Q?+Datw3hhTj8YrBP2ylVvVOOqGu1egJjZdHvZOhlEepEo+YzlqOcO+Pzj9lR+?=
 =?us-ascii?Q?dvKkuR1Dsucrom0aSRMbBXjjomBG7jlOFpnIbgSUuxffDLk6zTBESgHISnDS?=
 =?us-ascii?Q?4zXI+F17ql+UzU/f8d7AuoxKU7Ojvot9tQBS7BdIuajEsXF28+nrySGMBhtS?=
 =?us-ascii?Q?qwZdIcSiHZTuIfFLAIHDwADnWxciq0ym58yEc+Gx5v3KBoOs2kvb718hwx8/?=
 =?us-ascii?Q?CPiDcjBz2mOPHKSsURrAdvdsYiLntyt+f+olQ/1x9XKB9eeLQ9esU2QdhMeU?=
 =?us-ascii?Q?deHsF0kHtxg8X6za4IxzQmLqBnvQ79wQcOS0Tl3EaNCWwb0zb0AOY0mAwLql?=
 =?us-ascii?Q?VaPaVLCMnamjrkUsRjs2wO1EMPPD/0bV/a3mGL0y?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f96051dc-f48e-4d5f-7ad0-08db7e9f8e9d
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 04:06:36.2711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMV9aq+JgPF/ioFF/rsFrA+zhRdupc4FBJ/sryIhe3erspANf3EbsyHuBQ+Sg0X+XOJM23gEK39Ma6ObHUE0XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5470
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_210657_957242_27FBAEBE 
X-CRM114-Status: GOOD (  10.58  )
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

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/mtd/nand/raw/lpc32xx_slc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index 3139b6107660..2201264d3c37 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -836,8 +836,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	if (!host)
 		return -ENOMEM;
 
-	rc = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	host->io_base = devm_ioremap_resource(&pdev->dev, rc);
+	host->io_base = devm_platform_get_and_ioremap_resource(pdev, 0, &rc);
 	if (IS_ERR(host->io_base))
 		return PTR_ERR(host->io_base);
 
-- 
2.39.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
