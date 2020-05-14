Return-Path: <SRS0=QwSX=64=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31BB4C433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 14 May 2020 11:52:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E899E206DA
	for <linux-mtd@archiver.kernel.org>; Thu, 14 May 2020 11:52:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qVG9Xk/f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sifive.com header.i=@sifive.com header.b="d761aF6N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E899E206DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NtC33CC6wmUvKnBPUNB8Tdebq3wdR1SMJdijckvbrjM=; b=qVG9Xk/ffdE91y
	EsL2x9TEfV6y6+8ZIpec+lC6bP/k7D++8TFJRwXjQIkfFEV2ysIR3WyN39VoVYqpAuWVASC51jxG1
	0BuD0JRZHdM+77K7cR1Jh99OuKGS9yhvd8E8qzMFdbCUfmVa/OV8HSBZt8QBp1Wh8k7XsGsjdmgxB
	sFGjiMhChi8ys+3lIEBMHugdvIn0FPX67pmAfRh+HjUtJRaQ5MMIdNK8fEucd1jFm2s3Th3ot0lYk
	3SOOIVGk5vKhtkpVWpmZQCwZVkhFFgyJFoUifq1kTh+LjkBu3XWJ924B7qjgzQU/NCCNcsGIQE0lt
	r74brEX8LdyNDb7np8eA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZCPi-00075f-Fv; Thu, 14 May 2020 11:52:34 +0000
Received: from mail-bn8nam11on2083.outbound.protection.outlook.com
 ([40.107.236.83] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZCOj-0005uH-GS; Thu, 14 May 2020 11:51:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfBqXeqYn+X58gBB0n5LvLh0NnWmRx40OzKRHcfaIApXNhtdRpBdeEyYy3OXhDSWlVgB5RBaVU9e50EHBZ4uKwvL29u3zN9vG16LXCAFSVjdJbt8A+No0t0lau4BEO6/i3KvcqHp6p2MGK4DCxtgAMkPTF4Wug/qgNIA544KX6dCGKWeLZVkTJKwrJNyRAhh2R7rkyIM44kK2L2VpDOrtoaUM2qiv6MCNJy1QeO2YjcPWS35Q5aWgzr+DDsBo/8j0qjhbT3GhhCGZAdmKNHsiTXKbF1+3O33GXRjeDWNo7ltv5+tfBlm0cwfI99757pvsNGacfYNozPIQo/ZnOSViw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuwNckBsREWK/wRm/JNwz4peDmzIsWTpLA7jtPQWozc=;
 b=Dq58agJh6Yc60MsgLC7HA//h5hJuFabdPEiCnRxDtNY2/9sFkRPmCe1npc+QYyLSKHeQOeAOy97mZsmphF2UZjs6+rwu76LZiRkrRVSBVAvrku6e7pksGo+GIVHjiwoAydlVQFrHchw+6/CWTdcuiGNTDcAZG0Yq6fSTZ39jMlSVsXaF15qEACN95ooItuDNT4yECcx/zLezLn79mRvpzhLrrxyl0kmWCkJc+F8nt7ralCshT2yXXp+UGjMbWe/6oQcQgcJnPbyk7OV4n9LkwRFl/H6CddJ+NMrkA7jkEAEFUnvgkPYEgKQSY30Z8LqUc3yIZ/NXTFj/Bp9spk4nxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuwNckBsREWK/wRm/JNwz4peDmzIsWTpLA7jtPQWozc=;
 b=d761aF6NzRAiqao5PNTGdWR3DHL548ny5bvYzMrUqcs0MWLY/WfBmJt9naavEODyWJ0+K0G887cNR8WSg2XNLffbuJIEoI8DbtlVXFmE6/5dDMF3q8OmKa7YbGkRqE8m/pr4WbwF0vWbOR98H1/d7fMWna+oFeqrbkj0uHjPflg=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=sifive.com;
Received: from BYAPR13MB2614.namprd13.prod.outlook.com (2603:10b6:a03:b4::12)
 by BYAPR13MB2469.namprd13.prod.outlook.com (2603:10b6:a02:ca::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.14; Thu, 14 May
 2020 11:51:28 +0000
Received: from BYAPR13MB2614.namprd13.prod.outlook.com
 ([fe80::c0fc:30a3:5e5f:c2b6]) by BYAPR13MB2614.namprd13.prod.outlook.com
 ([fe80::c0fc:30a3:5e5f:c2b6%7]) with mapi id 15.20.3000.013; Thu, 14 May 2020
 11:51:28 +0000
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: [PATCH v1 2/2] spi: nor: update page program settings for is25wp256
 using post bfpt fixup
Date: Thu, 14 May 2020 04:50:51 -0700
Message-Id: <1589457051-5410-3-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589457051-5410-1-git-send-email-sagar.kadam@sifive.com>
References: <1589457051-5410-1-git-send-email-sagar.kadam@sifive.com>
X-ClientProxiedBy: BYAPR08CA0053.namprd08.prod.outlook.com
 (2603:10b6:a03:117::30) To BYAPR13MB2614.namprd13.prod.outlook.com
 (2603:10b6:a03:b4::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gamma07.internal.sifive.com (64.62.193.194) by
 BYAPR08CA0053.namprd08.prod.outlook.com (2603:10b6:a03:117::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3000.25 via Frontend
 Transport; Thu, 14 May 2020 11:51:28 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [64.62.193.194]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fec432bd-7271-4dc4-ef23-08d7f7fd2324
X-MS-TrafficTypeDiagnostic: BYAPR13MB2469:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR13MB24692E8D33BE1BA384BF772499BC0@BYAPR13MB2469.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 040359335D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vGHrCmi2SKIJBp8FybCzGXOuWFeMbBULex3iU3oBbCy6yLEDMbqIBOAqTVaYY/84WccGSx9Hw57FdHH7vlN4mm5WhUze9guHvITfJy5eu83AIPnnZYY+Yhf2AgYZli3OR4PDG3XZboUXxLx0l+Z7xzNsgb39/meMTuyzL9m74rfD+xGtlW0X9gNdcuI3tVQnR+0840y1BusYi7EuOW3x6dcYV9tQtG3Y5xjiI0/ohL5HQCiqdAaCGV6yFQ0De6SQU9qN3Z2m1QL+6bNAUspR1py3Re+/tw2068Z53XWmbpSgN7OEBl6GuTGc91OIF9/XfIQopT1PhRjCo/Bw80m6qek+DWv5Nv6ETc6o26gFVzci3xcseXmUnUUfwVCMRr6iTVEqkFVMhJ036vYiam8jhQLYvsORKYXejjy8OkEMiBr8y3RxvL2Y6P0rOwFvTMWa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR13MB2614.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(396003)(39850400004)(376002)(346002)(136003)(8936002)(186003)(4326008)(16526019)(2906002)(5660300002)(15650500001)(107886003)(26005)(66946007)(8676002)(7416002)(6666004)(478600001)(2616005)(956004)(66476007)(52116002)(7696005)(86362001)(36756003)(66556008)(6486002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: aMPpT3zStYBL+aL4e/tHVglJByIuBDDMXxdxh6s/fuaUG20pnztlcEpsasf6KRJe/ugGQgrUpcgxhcLmhclI0D11vTU7PSG3W1RQRPExinCWfRRB7zDdLN84IU9qjwU9PVlverdxc9qsQmT8tJnEzPKhY0IZHlqWIveqwPCHjsJnY9/JVK6Q0odl8iNN5feWojDh78g4NUVW7kjVzdzRRrqFanLILDCr7ZjWYKtBOsmgIX6PhKeC4/ztK8XkAy01+38y3zkbqjz5Vr6nIQB776VS2KB3RKdLTTTLMI0fmchV4vHB4QQHA/a15GZK0s4clKxrRvxsiwYvrs6MfxrZ/zGjtfiZ6WzTh7AqC5mM5ZK4RRkKcytb14HKLqPC83XlI8g8Vtg4sGVwRjufY8IBszU5Rz4R5LIisdRwjokE14aazQlF4eqkBBk7fqwbL7gNy5JMpOa7TEu+RXJlp8ZbL4FGi3RXuouFz2iLt9vvEEw=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fec432bd-7271-4dc4-ef23-08d7f7fd2324
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2020 11:51:28.6982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cVKPJmtl8r2oinKhCS8scHqM6/tkFz7Eowxr5pZuzgGMXsXYLndzGUYk0OeoUKcnDtUf4B1H9fuUfeB2I9j/Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR13MB2469
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_045133_572852_A935052E 
X-CRM114-Status: UNSURE (   9.36  )
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
Cc: anup.patel@wdc.com, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>, paul.walmsley@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

During SFDP parsing it is seen that the IS25WP256d device is missing 4BAIT
(4-Byte address instruction table), due to which it's page program
capacity doesn't get correctly populated and the device gets configured
with 4-byte Address Serial Input Page Program i.e. SNOR_PROTO_1_1_1
even though it can work with SNOR_PROTO_1_1_4.

Here using the post bfpt fixup hooks we update the page program
settings to 4-byte QUAD Input Page program operations.

The patch is tested on HiFive Unleashed A00 board and it benefits
few seconds of average write time for entire flash write.

QUAD Input Page Program operations:
> time mtd_debug write /dev/mtd0 0 33554432 rd32M
Copied 33554432 bytes from rd32M to address 0x00000000 in flash
real    0m 32.85s
user    0m 0.00s
sys     0m 31.79s

Serial Input Page Program operations:
> time mtd_debug write /dev/mtd0 0 33554432 rd32M
Copied 33554432 bytes from rd32M to address 0x00000000 in flash
real    0m 35.87s
user    0m 0.00s
sys     0m 35.42s

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 drivers/mtd/spi-nor/issi.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index ffcb60e..9eb6e82 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -23,6 +23,22 @@ is25lp256_post_bfpt_fixups(struct spi_nor *nor,
 		BFPT_DWORD1_ADDRESS_BYTES_3_ONLY)
 		nor->addr_width = 4;
 
+	/*
+	 * On IS25WP256d device 4-Byte address instruction table doesn't
+	 * get populated and so the device get's configured with 4-byte
+	 * Address Serial Input Page Program i.e. SNOR_PROTO_1_1_1 even
+	 * though it supports SNOR_PROTO_1_1_4, so priorotize QUAD write
+	 * over SINGLE write if device id table holds SPI_NOR_QUAD_READ.
+	 */
+	if (strcmp(nor->info->name, "is25wp256") == 0) {
+		if (nor->info->flags & SPI_NOR_QUAD_READ) {
+			params->hwcaps.mask |= SNOR_HWCAPS_PP_1_1_4;
+			spi_nor_set_pp_settings
+				(&params->page_programs[SNOR_CMD_PP_1_1_4],
+				 SPINOR_OP_PP_1_1_4,
+				 SNOR_PROTO_1_1_4);
+		}
+	}
 	return 0;
 }
 
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
