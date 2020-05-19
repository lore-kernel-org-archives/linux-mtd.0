Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D131BC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 10:47:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DAB620674
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 10:47:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FPWkfPCu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sifive.com header.i=@sifive.com header.b="B+HUOhUy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DAB620674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ruG/VNi5gFgni0m8cuQT4Nj78PPdYGaElGkbnrtRyNU=; b=FPWkfPCuQvXMB3
	E4nnayLNOQERZNbVbRiw7672nybbT4/92wzgHc2Q3DYyXZ//PNBVYkVXDUdF+cQzfB9NPSJ7hitoy
	jJYnjDADATHryXghIwOfqOc+QfnzpHa0rpWsKhL5fRysnVySgPBZNTSV5r3Gkg+ZBLcoGh1CjlDPK
	NG9/rEIM57QcmgLvIAK3FZ0CrAwoRngsR/v6KoZ6pnLiXtEnrrBE/AuMpX9s8gvvOiOIObLBuTmUx
	eKTp0LKcORaAQ/zZyez1ijnKKXH324ocdiHnSUHXG1h1aBgOa36B7x8O8DoJlCoGdcP8OuWUfli93
	Z1UAUdhqpwiN12+7ExDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jazls-0005Kw-MK; Tue, 19 May 2020 10:46:52 +0000
Received: from mail-eopbgr690064.outbound.protection.outlook.com
 ([40.107.69.64] helo=NAM04-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jazlm-0005I1-Kf; Tue, 19 May 2020 10:46:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7x2qFqj/gar8YLjWlrMEIPiL3H5N+rbsi0n1DXqousnziyhA5kQYCzx7A3kioylMlM5NzyE5NDcGGxASEsxcAzuam3VFmgk17qfbS7EwM+IssFDIm4sL/fB7j2slTHP3cQjuqi13Yy98PEBwjmSv90durqiIHVDpgNsbnni1FBQOQi93fBwybhKE3rLKZENSsk5RpY0/L43cK67BD1TGdVdNVUVtkk5BPjze/KzXC77bq2Pt/x3+InHAJLRplxUMDV+UY0cxZaPIqkY0Ac3cFyqTHi6S16oPQMron/5uANcvQSPxpfEzIFdRhus7ADX7sqZb/xBPLeijqaoPnrAxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxjiQQJG3aOM+U/qCJKWnNUt742TC4aqrzToznec4l0=;
 b=K+wYy3urJ3ttjNwPjVlIs0fx846E/pjL/Rb6m7uTFmr8AFDFyyMuTQaySqvaEnNOUdIbYWO1OQknUcuin14qsHarAoXDcgUkXlGYs2WlRGmr1SveM1kPNgrNWHcwWbXABKxoKhfFyqbu4m1tZdtDVFoPhi+a2ke0q1Ilw6vJgY4Ny0WQRjv4sLr/7NVxio9O7/dTx7M8aK+jYI+cEE2lUkRfiHi1hHzPhHii8j3MejF41vuzSl/FvWEnJabZE6r5eRg3lvHm+4kw4ZES9/Rmho15QMoG2NzzwX7OsMfNUMzJ/htJZADbIkQMWXUM16VBflxkCsJbBecianciPTMvQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxjiQQJG3aOM+U/qCJKWnNUt742TC4aqrzToznec4l0=;
 b=B+HUOhUyopCzEG3aMqlh63cdkg56Pdm0XsYXypV66k/Y+g7VKxiP0gzTnSmVeeWxvC7Qf8Anmxt0DSqgHHEi/d7/5JIO7/PzqIQaqZdUgF7He0sEmEC78BQcBWsIrXufjQfIHlTOVpUPbMnZJo1HUCfNom+ku1Y7XPjO2chh57s=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=sifive.com;
Received: from DM6PR13MB2619.namprd13.prod.outlook.com (2603:10b6:5:140::13)
 by DM6PR13MB3882.namprd13.prod.outlook.com (2603:10b6:5:22a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.11; Tue, 19 May
 2020 10:46:43 +0000
Received: from DM6PR13MB2619.namprd13.prod.outlook.com
 ([fe80::ad23:dfbe:7ec:e5ca]) by DM6PR13MB2619.namprd13.prod.outlook.com
 ([fe80::ad23:dfbe:7ec:e5ca%3]) with mapi id 15.20.3000.015; Tue, 19 May 2020
 10:46:43 +0000
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2 0/2] enable spi flash and update is25wp256d page write
 capabilities
Date: Tue, 19 May 2020 03:46:25 -0700
Message-Id: <1589885187-31247-1-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: BYAPR05CA0073.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::14) To DM6PR13MB2619.namprd13.prod.outlook.com
 (2603:10b6:5:140::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gamma07.internal.sifive.com (64.62.193.194) by
 BYAPR05CA0073.namprd05.prod.outlook.com (2603:10b6:a03:e0::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3021.10 via Frontend Transport; Tue, 19 May 2020 10:46:42 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [64.62.193.194]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc50f93a-8d37-499e-1e02-08d7fbe1eba8
X-MS-TrafficTypeDiagnostic: DM6PR13MB3882:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR13MB3882092AADB6ACA3FCDB9E0B99B90@DM6PR13MB3882.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 040866B734
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hX5G+5bpMY9/uhl8IqB5EBKOxQMoVnPDA6tvRLirJufvAwvBuEsyMmpls77T5UaJJeCojWb5jKeyoCg4EXqDHthgSEdSfptn3GJ/oMCEKOp16QXN/92kJd1FR8fHiSDYV9GN8AfRkOyu3Wv53p/nm3LAYQLBDdeyigq3t3x5Y/c5eyQMUKq9CULRBNQUgo8L7UX+saaDpgIAo8oD0anRucZR1ZGnYgfE68qv9h/vdFUaQYeIfpGiFuuzxNXt1f+M7OQ2FKHAiQ2yYVr8aidpEO6L3htMdOa8IHNKPN/x9VoGGVxoWItnlqhSM1JxGfIdU3lkWvfBZkaMwqbRElgYp5yBoL2owSbKSYVQf1VM5YWyVGE8MuXSFhq5QDU6dFHNnAsHGMINZGldloTLxMk/bg6mug3F42CqLT3W0aJV4Dl3+x1HSXLMi/IEulyr/45Z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR13MB2619.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(346002)(396003)(39850400004)(376002)(366004)(7416002)(4326008)(86362001)(6666004)(66946007)(66556008)(66476007)(316002)(15650500001)(5660300002)(107886003)(36756003)(2906002)(26005)(6486002)(52116002)(16526019)(2616005)(7696005)(956004)(8936002)(8676002)(186003)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 8UCX/RCjWuRK00Cf3PF22hU38vCnoYXXV5C+RqWHSjih4h5J1LXSNyBkl5ZHRwwfoYrgtQqJMncYo4SYXVRbYTIPcU79HZL8vz/X1nUsy9fZOydqfxu6v/dpeDD+2DZRNyxa7xwBmPM/q0jqh3MeQe4WctNi8b2SRf5Y51iaDXZPFAQ4+zCKFcqz9AaX2plfTAisc9Uqr58aB/plYMIsXZVq6t9IKcQ4ofBKjmGxOjoeKbgqI8SmnGLqgdaYDOzYcTKUoFTAEOgdlELpC4WjwlepCVAPIDnJNTgOt7axgF9ChE4aGiy9FSN5jk5hdXYMCPCEhpRv6PPnXxQm5lEH0yPVPCIhk/sQjRl7FLPSQ8dtTNP7Dc4sQ0Izn3NyH0AMW4MWJ29fqWWGde7e3/PEQOu1R4qFGHFQKreW+CUCPkGgWbjdPWybCXBK8nox1VWuEOflZuqSIzIfBO22RVdM7sebjI3oa8/HdRyXqxAssSI=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc50f93a-8d37-499e-1e02-08d7fbe1eba8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 10:46:43.8130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqhvrEJr7PQmXr0vlrMwAV/4cVWWj9mU+a4xtyjziMn3GIEeouGXHNV+VsTil7rtrBTASLkuac0MQflrzbap1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB3882
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_034646_755913_5AEAE14B 
X-CRM114-Status: UNSURE (   7.72  )
X-CRM114-Notice: Please train this message.
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
Cc: aou@eecs.berkeley.edu, vigneshr@ti.com, tudor.ambarus@microchip.com,
 richard@nod.at, paul.walmsley@sifive.com, anup.patel@wdc.com,
 palmer@dabbelt.com, Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

HiFive Unleashed A00 board has is25wp256d snor chip. It is observed
that it gets configured with Serial Input Page program by the end
of spi_nor_scan. Using the post bfpt fixup hook we prioritize the
page program settings to use quad input page program (opcode:0x34)
over serial input page program (opcode: 0x12).

The patchset is tested on Linux 5.7.0-rc5.

Changelog:
===============================
V2:
-Split common code between is25lp256 and is25wp256 devices as suggested
 Added a generic post bfpt fixup handler that identifies the flash parts
 based on their device id and uses the corresponding fixup. Other device's
 that need a post bfpt fixup can just add the device id check and either
 reuse the available fixups or write the necessary fixup code if one is not
 available.
 
V1:
-Moved SPI_SIFIVE from defconfig to Kconfig.socs for SOC_SIFIVE.
 Retained it's configurability using "imply" instead of "select"

V0: Base version patch (Tested on 5.7.0-rc3).


Sagar Shrikant Kadam (2):
  riscv: defconfig: enable spi nor on Hifive Unleashed A00
  spi: nor: update page program settings for is25wp256 using post bfpt
    fixup

 arch/riscv/Kconfig.socs      |  1 +
 arch/riscv/configs/defconfig |  3 +-
 drivers/mtd/spi-nor/issi.c   | 72 ++++++++++++++++++++++++++++++++++++--------
 3 files changed, 63 insertions(+), 13 deletions(-)

-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
