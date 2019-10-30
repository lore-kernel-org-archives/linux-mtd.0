Return-Path: <SRS0=8kzJ=YX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3AF6CA9EAF
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 07:45:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B788A20663
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 07:45:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jM4TmuAb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="aX3lZyPx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="HJIjBKP5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B788A20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PbykEzW2UGotVY6/YKGJoZvl9wBGiOD7dks2C1wZDOw=; b=jM4TmuAb6p2mCX
	SEjro0qLQoC9LoZrYKUDj3T/sWckSOSb4tArylciHXoMQwKlmmrhrDs+zJHbpGVZJ9K6WjN6tAGwe
	tU4vLBlgddgAyKpmBs7QWNGEQ4rleS5+a2jNolZv4rMsEPkgwLIfEOh5vd9Yvgj5X33F/xkSK/Jfm
	O/VzT0zWtDixbEPmpEMFx0WBw7I37YGML3nGS7Sp9TMHEnlZs4BTSa5uCvCwIHMGEyKaCbEu5yYju
	okIAgHamMvWCv0xJrmDk3UkX1GUedFZJR0R7n7N6ALjpgMm49hYpDevlPkjw05wv9DzdaSTJYDR5i
	rwrPDc/w5nfUX93yBNQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPifk-0004xL-AP; Wed, 30 Oct 2019 07:45:40 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPifh-0004we-20
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2019 07:45:38 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9U7fWZo030979; Wed, 30 Oct 2019 00:45:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=Hw/C4iHo7svq7YlOOOShKp3/wMYdc6IqynleoNnrPKI=;
 b=aX3lZyPx0FUgMsvtpy+sK27AOnRgHzAK1simsf2WfvNpYGIigz6VbtwHssn07ioWXqL8
 /f8b+KWPuJFyQoOtQG+w+qxGKgsaVaa6en8zuNe0e5cxNPAOZ2bcOm46rRiK17nQS6Q7
 9gvwgeIpSHTHAU0dIxI5kTB/4l2k7n4NPO3wgAcNVH/1/CmKodzpOtEC2MtqjqYXXsdx
 hS4UTiDQXpYYbSZXXCDR2X1ISyIWsZyEC/12MMvY5M9Antt4kHJIE7ScKxociV7OugQx
 CMPUA81q1AbqJX6o1qurzmlXOnuTP5heCNAGy3mrnXDS5VH/wLxUigzet+I0ApwEjFO2 pg== 
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2058.outbound.protection.outlook.com [104.47.37.58])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2vxwfdsp1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 30 Oct 2019 00:45:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbUI8Oe3isZpuMl8Zf4mVQ+dJ96afiXpiTZ/4Flo1tOze7f+AlY1Fq3Qf8dajmrjyPrZDUV8zfhPYld/R6JuKWhmY2UXEwt8Dy7UCLQ77ajjJ0levaMbpjSaXep4NgaLtWfGFY3MbEBICqQqhgKN0VmqGWXieY2+kjb0IiNZJCfl5OgxuYaOuDPuPEuBUTPpbz9EnPBb1cepKQz70M7Aw00yfAxIe5L4WreKAB8XuAYeOZ8DjS3pn/uQYdUnRUVKj4fPwIz8ZSwgM1A1Oj4d4phPxMNUkxh11Pe2zPOjJZnbUvOvM8HO5n6E5QZgzNz+b1sUG0dDmw0l3j1WgZAHBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hw/C4iHo7svq7YlOOOShKp3/wMYdc6IqynleoNnrPKI=;
 b=NcpkcbTlR+GVRTamDqCb3OwWN8hQlyiMCyeY5zenZ6moWQbU2ATkA6bLJUgwgl3PTjOwyCMBdT2nJs/zDA+03RQKxyXZcSgn+Szbmdehr6DCQWyO10BTwmFtmf4gOfHW8CIBUogBkR0V46VCqM287fEWBI4KNZPaUB+w/t0HQ0sOQXrRF47K+VmSN2jYWjDeHOIAcF/FiecAq5JsSpqZt3NQAn3Em9sJ6x1f2Yeo6ude1/cmbaPpK5L1UTLQR1tj//th1cC5HWL+Dc22Rd8Wg2rZyLpMMT8fFca8OMxDSTdE+lTUNinGao659TAQl2rlRSeEhHYQUslsNjC4vh7Uqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=oracle.com smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hw/C4iHo7svq7YlOOOShKp3/wMYdc6IqynleoNnrPKI=;
 b=HJIjBKP5Om0lNK6KN6ndH3go+UsOCH80ClFIZ6pXuCJtFTVnH6swGtw0oV5cDwWQJtiT1a5mH2EmtmmplCkMdlFt9a7GB2/f8nd6s823R6A9yha7ge6mTZwNq9fEbtVSbqddut/v/7dMiC7GsSisYojFRXRG4rN9aTIXP888Bfk=
Received: from SN4PR0701CA0027.namprd07.prod.outlook.com
 (2603:10b6:803:2d::13) by BYAPR07MB4664.namprd07.prod.outlook.com
 (2603:10b6:a02:f0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.24; Wed, 30 Oct
 2019 07:45:28 +0000
Received: from DM3NAM05FT061.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::209) by SN4PR0701CA0027.outlook.office365.com
 (2603:10b6:803:2d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.22 via Frontend
 Transport; Wed, 30 Oct 2019 07:45:28 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 DM3NAM05FT061.mail.protection.outlook.com (10.152.98.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2387.9 via Frontend Transport; Wed, 30 Oct 2019 07:45:28 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x9U7jO1c021619
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 30 Oct 2019 00:45:25 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Wed, 30 Oct 2019 08:45:23 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Wed, 30 Oct 2019 08:45:23 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x9U7jNZ1017669;
 Wed, 30 Oct 2019 07:45:23 GMT
Received: (from piotrs@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x9U7jMdg017638;
 Wed, 30 Oct 2019 07:45:22 GMT
From: Piotr Sroka <piotrs@cadence.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] mtd: rawnand: remove unecessary checking if dmac is NULL
Date: Wed, 30 Oct 2019 07:45:09 +0000
Message-ID: <20191030074509.15664-1-piotrs@cadence.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(36092001)(199004)(189003)(107886003)(36756003)(16586007)(4326008)(8676002)(8936002)(86362001)(246002)(2906002)(54906003)(6666004)(1076003)(356004)(50226002)(76130400001)(316002)(42186006)(486006)(70206006)(70586007)(126002)(47776003)(478600001)(26826003)(426003)(336012)(26005)(2616005)(476003)(87636003)(6916009)(7636002)(305945005)(51416003)(5660300002)(186003)(48376002)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR07MB4664; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 919fa32c-431a-4e14-4046-08d75d0d2217
X-MS-TrafficTypeDiagnostic: BYAPR07MB4664:
X-Microsoft-Antispam-PRVS: <BYAPR07MB4664F5D01958972B0CF9968DDD600@BYAPR07MB4664.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-Forefront-PRVS: 02065A9E77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kRuzfuEWNrRMwmr78kr2jKw2KFz//3EkW0WUZcy4q2Usf+hZOpQpMoaE0hMP82mMKf6qgFIH0FXyohkb4qqhJ1Ah0vmL5yYSG/ilC2UNrRRnIOwJEPfqW6FyrfrMJ/uLeejTUKJPxIm2BYNGIT7QMB+8pqelXHlVC1WT6YSSrjmM1As6ytr7MST2juQ3935V+0Cyd2SNpL6ExjWvP+LbFG2ZsGILq1WenuJHrouThJpWF9CYQoqUHuVNeJceI94vCDx9VzawKoW+jhhA5gsnRWYwi6od09ozoZeT1MwwzmOxs0cuG5h6TJSxAESRqdQI10hUzTPlxE+JSDMDkjW5n5ihdjyxdHb9cED4lhA5EpXvpA0I/p+RheWtDfCLl2MThqjQsSVNN0Ulxr7VUMgqZmnBAqflo2RgslzFcLHowIedB3AoXJvPJhv9hvpuSCp0IkshAa9bH+hN2tmt0S2k8g==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2019 07:45:28.1639 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 919fa32c-431a-4e14-4046-08d75d0d2217
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB4664
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-30_03:2019-10-30,2019-10-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910300076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191030_004537_238284_429341F9 
X-CRM114-Status: GOOD (  11.82  )
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
Cc: Piotr Sroka <piotrs@cadence.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Remove unecessary checking if dmac is NULL.

If Cadence nand controller driver uses DMA engine then cdns_ctrl->dmac
cannot be NULL. It is verified during driver initialization. 
If Cadence nand controller driver does not use DMA engine then 
CPU IO read/write are executed instead of slave DMA transfer. 
In that case cdns_ctrl->dmac is not used at all.

Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com> 
Signed-off-by: Piotr Sroka <piotrs@cadence.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 91dabff4b09d..d32e2713f89e 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -1886,7 +1886,7 @@ static int cadence_nand_read_buf(struct cdns_nand_ctrl *cdns_ctrl,
 		return 0;
 	}
 
-	if (cdns_ctrl->dmac && cadence_nand_dma_buf_ok(cdns_ctrl, buf, len)) {
+	if (cadence_nand_dma_buf_ok(cdns_ctrl, buf, len)) {
 		status = cadence_nand_slave_dma_transfer(cdns_ctrl, buf,
 							 cdns_ctrl->io.dma,
 							 len, DMA_FROM_DEVICE);
@@ -1940,7 +1940,7 @@ static int cadence_nand_write_buf(struct cdns_nand_ctrl *cdns_ctrl,
 		return 0;
 	}
 
-	if (cdns_ctrl->dmac && cadence_nand_dma_buf_ok(cdns_ctrl, buf, len)) {
+	if (cadence_nand_dma_buf_ok(cdns_ctrl, buf, len)) {
 		status = cadence_nand_slave_dma_transfer(cdns_ctrl, (void *)buf,
 							 cdns_ctrl->io.dma,
 							 len, DMA_TO_DEVICE);
-- 
2.15.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
