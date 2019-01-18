Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E89C1B0FD
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 22:12:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1F392086D
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 22:12:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k5I7fEEm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=MicronCorp.onmicrosoft.com header.i=@MicronCorp.onmicrosoft.com header.b="pl8T5p2b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1F392086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xAE1+NkE6OKAki/2LZBEqFJJTcTje4oWGwXhi+IGjvs=; b=k5I7fEEmWo6NVh
	fBr4IMUHTlx1HorqVEX634X1lArIWOxxwPdzgq5L6YNd1PRqSRWL1tMhwV2PZEhyeoMjqwmBdFlPF
	aK1XQ7k6ALGZ9urih19HdJCQKrGDCRp3bA65NwT+I3khukgLOt26KbKIblDaqQQBpvz+P8XuSWyTe
	Ak77PJMZ4dFukphxl4w8qK1nh0qCniiK1gb9lCx9pjb/uds81dHD8HghbO6w+9dTvOV7x8oP5sTPa
	Gbzf+bpijPFfTozhY85LgUm6HZwK8urzkW/qsDJVfwXqjvNrHr7CE9MPIUvTA0KaWGF04vYApMCv8
	Ruds9hnIGAStr5IcxcgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkcNY-00048J-VQ; Fri, 18 Jan 2019 22:12:44 +0000
Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkcNV-00047w-Vj
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 22:12:43 +0000
Received: from mail.micron.com (bowex36g.micron.com [137.201.84.120])
 by mailout.micron.com (8.14.4/8.14.6) with ESMTP id x0IMC9H2015030;
 Fri, 18 Jan 2019 15:12:09 -0700
Received: from BOWEX17G.micron.com (137.201.20.31) by BOWEX36G.micron.com
 (137.201.84.120) with Microsoft SMTP Server (TLS) id 15.0.1365.1; Fri, 18 Jan
 2019 15:12:09 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (137.201.20.7) by
 BOWEX17G.micron.com (137.201.20.31) with Microsoft SMTP Server (TLS)
 id
 15.0.1365.1 via Frontend Transport; Fri, 18 Jan 2019 15:12:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=MicronCorp.onmicrosoft.com; s=selector1-micron-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ipUlmCjoC3Om5NpJij34hUQ2L2y4Emh4KRuYPC7lE0=;
 b=pl8T5p2b2tViYDmdL3fuJqhgzSeWMp5jobyBjIdtZBmQaLv8jzBW1bACUXmsXLL9gYa9Sntej8V4972wjJeFjwSLfJ2YGJkfz1hbaciObsWjcTQ2Osui6j25TSsE15pTbP4bBK6boreaQ1BOSqN9nuAUDyb70gOF1nX/GGCiicI=
Received: from BYAPR08MB4533.namprd08.prod.outlook.com (52.135.234.15) by
 BYAPR08MB5560.namprd08.prod.outlook.com (20.178.49.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1516.19; Fri, 18 Jan 2019 22:12:05 +0000
Received: from BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::1182:ed1b:cf84:b5e3]) by BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::1182:ed1b:cf84:b5e3%5]) with mapi id 15.20.1537.028; Fri, 18 Jan 2019
 22:12:04 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "richard@nod.at" <richard@nod.at>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>
Subject: [RESEND PATCH V2 2/2] mtd: core: NAND filling block
Thread-Topic: [RESEND PATCH V2 2/2] mtd: core: NAND filling block
Thread-Index: AdSvejlpF3Q6HUqcQlOcRwI7zje2QQ==
Date: Fri, 18 Jan 2019 22:12:04 +0000
Message-ID: <BYAPR08MB4533401FB969CA9A8D254F34DB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-originating-ip: [165.225.81.41]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR08MB5560;
 6:4lgq/g3kliPX8sGZJy6obpRoyaNbmOPZDLF8iyNGma7pvSy2ZTwU0GDTRG8+v4a8KCd6pF+nl8X44plo+1fAXiJXZOP8zSZF1ILXRGznyx4tNcp9i7Pwu6FGJzDxBCJIWpZbDw3bfwhjF/qzTDWz+4Kmd00JNIOfTq2CHJfsOMdFGbC0gHGrEh2wSLBeoUJo+1TsKEu0qlratzS65VTGigYxjzYxAbx4BfAL2838Vnaumff1hAvGUw+9v3cwWhGMx5ae11wPL2/1hKu0hQQqTl2Bmxt675D1JOAMu0yVKeYTGNsJ8N47N2qowSeAVRIBwW8nbE602QFaecv+jSBYK677mAhRUY6SqS+LLu4ZBc5XjSROA40/sEUEL5lkrqNiDApcwyHCWAZAKg+uzpBvJkSZ1nSpeAyWusXi4oNKDR1sPcRqVB4F7zOuBims4jMdGNJ1FxxjaD6TlsmWHSUEcQ==;
 5:wJYF5AZ7GD1FeZPdiQsGmhC2qy+dFKh+n9O0mOA0sWdXssAQ/TXk+zevqg0twXxws2IlKv51qcqJTtD598YNx4sF3jM6fL858oNbKKa4lIhXD+8dQE8FC0Xn7SXzsmHqxA8JQh1wa5c1kx/sK9vvpC1ZSfdaI6SpQt1bGT0C+X5QWm/da5mUPOCnjvLyy24SnQ+Tsm83m48VgGjm3fefSQ==;
 7:zUgKA5qX0kPOnOgwURNT9JhuGrcY0905Sx9F+gQYdfy/fzN9QAg9md5DXXRG0Ha6xXrmXt6Zq8mLu9IBu+cJk1bZYNHxWWFt1pmtmJvIculViZcJPyfFtnDVzMGbE3K0oE61RzTQDrmc6Z4RpsQ3bg==
x-ms-office365-filtering-correlation-id: 1a934ca3-337b-4100-2a9a-08d67d91fabf
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR08MB5560; 
x-ms-traffictypediagnostic: BYAPR08MB5560:|BYAPR08MB5560:
x-microsoft-antispam-prvs: <BYAPR08MB5560328264F383494397798BDB9C0@BYAPR08MB5560.namprd08.prod.outlook.com>
x-forefront-prvs: 0921D55E4F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(396003)(136003)(376002)(39860400002)(189003)(199004)(102836004)(7696005)(68736007)(7736002)(8936002)(256004)(14444005)(9686003)(8676002)(81166006)(99286004)(478600001)(217873002)(6506007)(26005)(81156014)(6436002)(55236004)(33656002)(55016002)(476003)(86362001)(14454004)(6116002)(106356001)(316002)(486006)(5660300001)(2501003)(2201001)(71190400001)(97736004)(3846002)(2906002)(105586002)(71200400001)(305945005)(25786009)(186003)(74316002)(110136005)(53936002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR08MB5560;
 H:BYAPR08MB4533.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4Gs9PG5vW+9PbCesA5m/BhA8UyrNbXsIsVWCSpNjwQ8GR28jfpuyHnZ2B5AyXs7A80+u7F3sVerzZKqAv9CeS0yD+uH48kwCLbqVviioH220BRQUUAPNjPdcjiNWWBdIKCrIQKON2tHRDJXngh78jC7px1R/STqXXI17yBg6LXXbVpCtnPYME3zWzrIvdQo5zoDB3Zc6dpMnfyzX0c8zybA787+VvNN0yXGT84p0MKJePfgy8x6GP3SWD+6t7lTIxeDSDTJog65crm0ozEC9sta/IlXM0foc0jYNgFe7Yl1OK63OsEETQbqwTwOiyWMgOE8Ly1RKacJe+ZIRRrM0WdMVC6dZMkGWiFyAQshydMM5gdQS5vpZlebGVv7dA9p1N7+R/Hzw1i71ltWgqyedj9Bgxjn+AgKv9Ol5vdZVB+I=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a934ca3-337b-4100-2a9a-08d67d91fabf
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2019 22:12:04.8347 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB5560
X-OriginatorOrg: micron.com
X-TM-AS-Product-Ver: SMEX-12.0.0.1782-8.200.1013-24372.000
X-TM-AS-Result: No--6.856200-0.000000-31
X-TM-AS-MatchedID: 700038-702931-704156-703788-707451-707866-701708-707064-7
 80016-705232-701618-709803-707800-703399-704930-700104-851106-701475-188019
 -706290-702037-105250-700057-188199-700264-700324-701384-707654-701594-7031
 76-700492-703523-710837-704935-709755-105630-707325-703712-700398-700251-14
 8004-148007-148020-148050-42000-42003-63
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-MT-CheckInternalSenderRule: True
X-Scanned-By: MIMEDefang 2.78 on 137.201.82.98
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_141242_080274_CF899585 
X-CRM114-Status: GOOD (  14.83  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

On some legacy planar 2D Micron NAND devices when a
block erase command is issued, occasionally even
though a block erase operation successfully completes
and returns a pass status, the flash block may not be
completely erased. Subsequent operations to this block
on very rare cases can result in subtle failures or
corruption. These extremely rare cases should nevertheless
be considered.

These rare occurrences have been observed on partially
written blocks. Partially written blocks are not uncommon
with UBI/UBIFS.

To avoid this rare occurrence, we make sure that at least
15 pages have been programmed to a block before it is erased.
In case we find that less than 15 pages have been programmed,
additional pages are programmed in the block. The observation
is that additional pages rarely need to be written and most of
the time UBI/UBIFS erases blocks that contain more programmed
pages.

Signed-off-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: ZOLTAN SZUBBOCSEV <zszubbocsev@micron.com>
---
 drivers/mtd/nand/raw/nand_micron.c | 119 +++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index b85e1c1..f52e072 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -541,8 +541,127 @@ static void micron_fixup_onfi_param_page(struct nand_chip *chip,
 		p->revision = cpu_to_le16(ONFI_VERSION_1_0);
 }
 
+static int check_page_if_emtpy(struct nand_chip *chip, char *data)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	int ret, i;
+	void *databuf, *eccbuf;
+	int max_bitflips;
+	struct mtd_oob_region oobregion;
+
+	mtd_ooblayout_ecc(mtd, 0, &oobregion);
+	eccbuf = chip->oob_poi + oobregion.offset;
+	databuf = data;
+	max_bitflips = 0;
+
+	for (i = 0; i < chip->ecc.steps; i++) {
+		ret = nand_check_erased_ecc_chunk(data,
+						  chip->ecc.size,
+						  eccbuf,
+						  chip->ecc.bytes,
+						  NULL, 0,
+						  chip->ecc.strength);
+		if (ret >= 0)
+			max_bitflips = max(ret, max_bitflips);
+		else
+			return false;
+
+		databuf += chip->ecc.size;
+		eccbuf += chip->ecc.bytes;
+
+	}
+	/*
+	 * As for the empty/erased page, bitflips number should be zero or
+	 * at least less than the bitflip_threshold.
+	 */
+	if (max_bitflips > mtd->bitflip_threshold)
+		return false;
+	else
+		return true;
+}
+
+#define LAST_CHECKPU_PAGE 13
+
+static int before_erase_checkup(struct nand_chip *chip, int page)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	u8 *data_buf;
+	int ret;
+	uint32_t empty_page_mask = 0;
+
+	 /* Only for legacy planar 2D parallels NAND. */
+	if ((mtd->type != MTD_NANDFLASH) || (chip->bits_per_cell != 1))
+		return 0;
+
+	data_buf =  kmalloc(mtd->writesize, GFP_KERNEL);
+	if (!data_buf)
+		return -ENOMEM;
+
+	memset(data_buf, 0xFF, mtd->writesize);
+	/*
+	 * pgs[] contains pages need to be checked. We firstly check
+	 * page13,because, for the most of cases, PEB being erased is
+	 * not partially programmed. If page13 contains data, we directly
+	 * return since it is not a partially programmed PEB. Otherwise,
+	 * then we check page0. And if page0 is programmed, and page13
+	 * is not programmed, then we start to check from page11, page9,
+	 * page7, page5, page3 respectively since the pages of PEB are
+	 * programmed sequentially. We olny check odd page.
+	 */
+
+	char pgs[] = {13, 0, 11, 9, 7, 5, 3};
+	int  c = ARRAY_SIZE(pgs) - 1;
+	int i;
+
+	for (i = 0 ; i <=  c; i++) {
+		ret = nand_read_page_raw(chip, data_buf, 1, page + pgs[i]);
+		if (ret)
+			continue; /* Read error, we just skip it now. */
+		if (check_page_if_emtpy(chip, data_buf) == true) {
+			if (pgs[i] == 0)
+			/* page0 is not programmed. */
+				goto free_buf;
+
+			/* Mark page need to program later */
+			empty_page_mask |= (1 << pgs[i]);
+		} else {
+			if (pgs[i] == LAST_CHECKPU_PAGE)
+			/*
+			 * If page13 is programmed, this block has
+			 * met the requirement of robust erase.
+			 */
+				goto free_buf;
+		}
+	}
+	/* Corrupt page0 and page1, in order to simulate an
+	 * uncompleted eraseing scenario. Just for case of
+	 * power loss hits while below programming. in this
+	 * way, the PEB will be re-erased again.
+	 */
+	empty_page_mask |= 0x3;
+	memset(data_buf, 0xAA,  mtd->writesize);
+
+	for (i = 0; i <= LAST_CHECKPU_PAGE; ) {
+
+	/* Start to program empty page, we only program the odd page. */
+		if (empty_page_mask & (1 << i))
+			nand_write_page_raw(chip, data_buf, 1, page + i);
+
+
+		if (i == 0)
+			i = 1;
+		else
+			i += 2;
+	}
+
+free_buf:
+	kfree(data_buf);
+	return 0;
+}
+
 const struct nand_manufacturer_ops micron_nand_manuf_ops = {
 	.init = micron_nand_init,
 	.cleanup = micron_nand_cleanup,
 	.fixup_onfi_param_page = micron_fixup_onfi_param_page,
+	.erase_pre = before_erase_checkup,
 };
-- 
2.7.4

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
