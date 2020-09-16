Return-Path: <SRS0=QbZc=CZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FBDC43461
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Sep 2020 16:43:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DEF0224B0
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Sep 2020 16:43:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QHx0r8YM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="rND+ZAEm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DEF0224B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O0WSLIk5ELRR5bo2LPBc4nK3+BHZ/WNLvJqIZ8IbMX8=; b=QHx0r8YMY0Fo4jEqHCcvbbw5uA
	3s/dDVwdtge07sgH8NBCl+0PDgmHelbdqHWsXrXmPlI2qnTHyaYfK8oVtqtUg9EFGk0Pd2/uc8xby
	tKz3VkIVbskc5FyhOfO6jAYDWRTdzIb7OJN3EwmFQNkF4CXGmgQieo2TSOveMjUhT5H3sGGsVdTNo
	OCgr5mOIiH6tHNd450p2542DobG8pSZAfINFlly8r2lIJ/adCaGilHCL2Mbz5U1Oa9IlcgwJYLinj
	e1+nbucpHFdrUPQ/gixqLXKP7vez9RWmwRkHYt3hzKNq1gvsZngq9hym4/7sLnCjWfpSA+7oKBlH4
	XWVdxaSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIaVm-0001wr-4C; Wed, 16 Sep 2020 16:42:26 +0000
Received: from mail-eopbgr70100.outbound.protection.outlook.com
 ([40.107.7.100] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIaVj-0001vl-Lu
 for linux-mtd@lists.infradead.org; Wed, 16 Sep 2020 16:42:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQ+aIc2sUp28DyU6QO2PxQuR0iVpszRDuI8ROM3vTgXBLckAtqlKLZg5Zvsk1uygiuauU/Ubh48vrtqx6oUGVfQ33SrE914k1PJ0/+bkwBsTcrLa3RFRvEbpb1CAPj5JLaJCnpVrRr6dojFNQCaN58sKu5+hS/8gKxTVZ/iP2+SICRDIyEVvCC5cHwoueSTDKc2Sdy9zm2P1S5+stRl1PnBsLJtGXZff/4q6peVgNmrly9Jww5SpblWj9vgcn3FFSWq+++k2OQfjL4vnRs7jwD1yurMDp0qrZfXQ7TmqCpVjr/b0C/0yy7jbjME1ombjg5/gK1HsPsl/PL3TnpX6fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5ZxufJIl5gqLOe2NL0dxVg29dvFq5tquKDOut0luNM=;
 b=FQPKeVwyvC51skdgqIqmiMO+ghC/gfWSrKlrky6Pu2lZkTBlERpjy2l8gCOlSl3QH1MHJoP7wBHEzMZQieoLdYBn4d8pTg7iYibRNusmmuakV6KeU05paZyF4GCOiKkVI9I0iFq+PMElyC+O9xUXiBrZ52BQOAwXHcp22V0ntf0oWDlomLZq3onffCk9Gb7kF+hAgTHPRGBRhMarZRQhq18Hw+Z9ANR6EsdfB4iJM9X8xbarKCLSknVJ8rucLSiAgRwcT8Su8c2k8E+WMIAZmKBZrR5PpwT9NX4Q+XMwtqu9u/FGrQp0PC+Fv3+V4TbRME4bj3xPy9ogBVCTUqFs9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5ZxufJIl5gqLOe2NL0dxVg29dvFq5tquKDOut0luNM=;
 b=rND+ZAEmg4A76jrN8ORanvdLRTpSr0AOyuDYqr/LIWYAp+VuZRp0qNhUHXY0GOVsxKDmVrDAeop2yiaTZxF+nJR1Jx7Dfvy8hiNBveH7yAzIl4vKE/9v/U7nzDdTjAu1cZlWwckGVsHdOI2Am/Ot9xxgJfM8qCq21A5Hml1SPGg=
Authentication-Results: nokia.com; dkim=none (message not signed)
 header.d=none;nokia.com; dmarc=none action=none header.from=nokia.com;
Received: from VI1PR07MB5216.eurprd07.prod.outlook.com (2603:10a6:803:b0::15)
 by VI1PR07MB5950.eurprd07.prod.outlook.com (2603:10a6:803:b5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.5; Wed, 16 Sep
 2020 16:42:18 +0000
Received: from VI1PR07MB5216.eurprd07.prod.outlook.com
 ([fe80::4d01:44de:bd25:b64a]) by VI1PR07MB5216.eurprd07.prod.outlook.com
 ([fe80::4d01:44de:bd25:b64a%6]) with mapi id 15.20.3391.009; Wed, 16 Sep 2020
 16:42:18 +0000
To: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com
From: Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>
Subject: [PATCH] mtd: spi-nor: Do not proceed with spi_nor_sr_unlock if WP
Message-ID: <fc01cab3-7c95-9d24-a32f-d215fe834105@nokia.com>
Date: Wed, 16 Sep 2020 18:42:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
X-ClientProxiedBy: HE1PR0401CA0050.eurprd04.prod.outlook.com
 (2603:10a6:3:19::18) To VI1PR07MB5216.eurprd07.prod.outlook.com
 (2603:10a6:803:b0::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.30.9.6] (131.228.32.166) by
 HE1PR0401CA0050.eurprd04.prod.outlook.com (2603:10a6:3:19::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3391.13 via Frontend Transport; Wed, 16 Sep 2020 16:42:16 +0000
X-Originating-IP: [131.228.32.166]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e2dd6691-d61b-4397-6bc7-08d85a5f7965
X-MS-TrafficTypeDiagnostic: VI1PR07MB5950:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR07MB5950F7CC5BCE9A1C9F505A5BFF210@VI1PR07MB5950.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I6T1oHOz6YAaJnIVTr3EZ3ulWAHhivfH8gwFOfYTSupXh4N1IGeul66DNtcpdHnIITPSi0j2XvxBp4W0XilBDWpiIMh6O/GGUXiJJureA3ECcT34kk6GA2ytfQVAp0rB/Dz6v33TOMiGqkt5CvowF8/mUzYTzdJ0mK+PZDkk2Wc1mH7OJbhL5ZsBB22QhTBe/gCqypLFTFRzVHQucIsJNHOnyiaq4goIjgJSbz0ItAE4JCq9h64bN4EnqYvA8Bz/T2BJF2ukTFa5JzUtYKJ0mDqhcXlow4l7hfTm7aliS7tLngZcQlzT1auD3ESyQxym7npfIMOQwyQLkFwmCc6h/5g8oY+BwPGqJl8Y+Ja3LCyDQny1lDeH2mvW7PLOvryThbJ6Cl+v7irhUXpBCZjrOafFvIKb2SPVIUVxTY4/B04=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR07MB5216.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(66946007)(86362001)(16526019)(8676002)(6666004)(2616005)(26005)(186003)(31686004)(66556008)(66476007)(83380400001)(478600001)(956004)(52116002)(2906002)(16576012)(4326008)(36756003)(107886003)(31696002)(8936002)(5660300002)(316002)(6486002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: IVURPuFZ+LlFquMsvLpY+DfLFVXjGo4kvMfNLn4gAsIAlNyIOoD+SNJy1Oo/95AyuLDGIzi8VaTV3WRKhOgCC0eC1p9yjO14WW7/fEqBsyYOIaCKhGaU4RkjuCWqK5IJkaot535j8aNv3pg7fE1jragxydL/MawbzEHFlbG4WONLo8O30oureiPcKH4ycwm7SOCsp0VSo988QULu9QdEKI7UKkm0/uQyiToEj+typt0WsjcpNV1y/vc18dfrifBPACGxeSPGPqlciOiTO/9rpVYiRfAO6Kk2/FbcUuOHtbFwfoVaobjGBB47UnF9tIy3nJWM0XLWL/y1J+MROku+LaQ2dR1plOw1Q7X3kEJZ1luhng7eU+JS5dahDVUGLgpMMcePx7uLBqgy4gXfrfDl85TVwp05NAHW+IOH4gWEMqDx/RGd6FcYLQqlFhD5eLw9b45tH52A3AF6eYqlPTPw+TZZLLuArTvW4Z0VbliDnxMvFwhnH3byb4I32qEwwN27bp9zCmYFDZOpNBWfqUCPEyPLPmYUT0R3ZFl/Qf41Cplpc4jOc2PbdWnWiJ11e1dJ+X3ea7ptCmJr6fg8nWsxapIw6dNYPD72GKWtsGSyQnNRbjzSUKGbtlBY7cpqDc0HdDbdNvBwpT97HZ3wvWvRIQ==
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2dd6691-d61b-4397-6bc7-08d85a5f7965
X-MS-Exchange-CrossTenant-AuthSource: VI1PR07MB5216.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 16:42:18.0286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4VQT6zuc/URPSQLgHlYKFrJyOCIyIDCqeeympXAgMeu9Ur4A7qkHZfcuHcIW3Wa8gfHuCFYDUhW/gWwFZvnUMPiyxdHSRZRdaNLTv0tUWivt3sqJSehm8kZFxzRejD+l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB5950
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_124223_831444_770965FE 
X-CRM114-Status: GOOD (  14.15  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "Sverdlin, Alexander \(Nokia - DE/Ulm\)" <alexander.sverdlin@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In case Status register 1:SR_SRWD was set (either by software or write
protect pin), sr_unlock fails on spi_nor_write_sr_and_check in 8-bit
mode due to fact that written value will not match read value.

Problem was observed with n25q128a11 device having protection enabled
by W# pin.

Problem was uncovered by 82de6a6fb67e16 ("mtd: spi-nor: Fix the writing
of the Status Register on micron flashes"). Commit selected 8-bit mode
for micron devices. In 16-bit mode, CR content is verified, while in
8-bit SR is checked for sanity.

Signed-off-by: Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>
---
  drivers/mtd/spi-nor/core.c | 4 ++++
  1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 65eff4c..4c3acc0 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1777,6 +1777,10 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
  
  	status_old = nor->bouncebuf[0];
  
+	/* If SR is write protected, we cannot unlock */
+	if (status_old & SR_SRWD)
+		return 0;
+
  	/* If nothing in our range is locked, we don't need to do anything */
  	if (spi_nor_is_unlocked_sr(nor, ofs, len, status_old))
  		return 0;
-- 
2.10.2

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
