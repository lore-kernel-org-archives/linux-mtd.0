Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E655C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Oct 2022 08:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3TqLyzbJtnXgi/ySXOPFRktK234WYoAhGJm17ycYAQ=; b=UwSbBqzfbFwKud
	q0G67HlVJl3HVIF7wf56qtLsY61X4378fpQo8H5HDpvObBW+L/JSmtHfATLGpFFJwpJiHY7C2wHQR
	rvqtwaxcVKK0lOLwAl4DEhbz/7DwQZpSfCHNGH7YcZrltE1FZMwlwBPkvOvh8ZLaaBNT60wpwEwGc
	7rsfm+7tcU61cNfJETz7E7kzt7Q1h9I5GyuiUfj0kdd2DXhu4QBMw/qMXxF1/CKc2UlaNKEZqniXd
	+TaWiNSZAft61yA4rLA4rsmyh977qIUpY5ucFoF4unUKFsPT6erZEWLcVX1OROUKrx/9njYY4JtSC
	BMbW/4Fg4ezTZLlojHaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol4Kw-00GVJH-NY; Wed, 19 Oct 2022 08:22:02 +0000
Received: from mail-eopbgr70117.outbound.protection.outlook.com ([40.107.7.117] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol4Ki-00GV23-4v
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2022 08:21:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0W3Ts1ztmJ9gdIZt+w3uvHJ9vK2Bj8W5kE4OJmEaZeRodYm88M4yXFS0xfMZXeHTnJ+6WM8Z6UP497IzibtxO9bBEnpahnjyXvGPEvxXL6V5Tu2nMqXxVyXjLq5THYJcw+x3V69eRpQ2zrltgoRgSuw7cNxCNb4sM+8eVbwUMo6Od44jwnkLfRVMAON181CCGMhprsChT8SWo3HhE4FXFM+YpZPLmpNjn3Ae8IHTuAz97SvTWGJBoF7uSqFh2qv433QHLWkNl8oK43sgGJMsbRjhQbHEiKS8pZldqRhbg9dl/kh2aurWNjVKOqyL2/5KJgdKcE/gx03thfi3WkE4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3fLESMnk6sIqVQ9NjyRNm6gBDyIFXUIP05qlM7qhUY=;
 b=isndHxhS+MJ1PO/93itlJ4pP4dwXv4UZRwQt/oI371ypKexNB7+p/FydGJtIUwY11H3IdqVO8Tkx++ErAgoDnr8JN3NViLB/s0FOg7HLGkV2u/6BAaZuiDCiF5524lHwqXPA2BcHRkcZmxhl+IgKIjRGacKFpnbAaDjd8oYr3pCDo7PnJWk6sMwgsTCU0bgGWBWW22Owp5u7wl7pJnPk1HiUTf/rApw6uarHN/CaVBpDi+m7xrvCJaeQ8lcpqhcafRoHf8MFbJM+m7Z1LqfxCHgC/+YJK5mkeyKp67rNJIiyQ0x1BoHgit3fH/N9pHkJ0IHFTrxurd1rMb48NWd/aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=plvision.eu; dmarc=pass action=none header.from=plvision.eu;
 dkim=pass header.d=plvision.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plvision.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3fLESMnk6sIqVQ9NjyRNm6gBDyIFXUIP05qlM7qhUY=;
 b=A+C4ojQOeYCfuo3ME8rSuubp9ktQq8Cl3zWfvg6p8XJnB3Rf8k92o2g6LsttMc78wnfLBQ24AWejNZOXT1HoM3GXUit4jM1ivAC4jZsSxqn1DcE4d+3aI7EREIoJrQBLXFaqPdSXAv5tOdmOyzkOzF5fZQWsyXffZn1aYkZadf0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=plvision.eu;
Received: from VI1P190MB0317.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:38::26)
 by DU0P190MB1930.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:3bd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Wed, 19 Oct
 2022 08:21:40 +0000
Received: from VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
 ([fe80::a621:b61f:de56:b8]) by VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
 ([fe80::a621:b61f:de56:b8%7]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 08:21:40 +0000
From: Vadym Kochan <vadym.kochan@plvision.eu>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Roger Quadros <rogerq@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Liang Yang <liang.yang@amlogic.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Vadym Kochan <vadym.kochan@plvision.eu>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Elad Nachman <enachman@marvell.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 1/3] mtd: rawnand: Partially revert 4114f97c41cd ("mtd: rawnand: Get rid of a few unused definitions")
Date: Wed, 19 Oct 2022 11:20:38 +0300
Message-Id: <20221019082046.30160-2-vadym.kochan@plvision.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221019082046.30160-1-vadym.kochan@plvision.eu>
References: <20221019082046.30160-1-vadym.kochan@plvision.eu>
X-ClientProxiedBy: FR3P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::7) To VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:38::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P190MB0317:EE_|DU0P190MB1930:EE_
X-MS-Office365-Filtering-Correlation-Id: d3b68600-5c8a-4d46-b09c-08dab1aaf2d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	hD3fBs81da6+jaZY2Lh7W5PX6/9iiYmFacwrl2vUwj+x4fo6+1HSEanlJFdp5ulXLGlIxvcBaNGp00yt6jL2NelaEBT6zoxBIlSFKNEQN86li0v5XEqirG2b83ee2ANFv4VegXtzzZCDGW42Nn89GzWa7sEo1eg93RlvJnv6v9oz1OxMipWv3QgrZu+TLP7g/LxfV/Qcx7b+ftuCSH3arWciriE1FMNcHp9343tY6oOfIFY7iqmNw2n638nSw6zAPmGRkTq4F04KZviO9AdZu1yoWQGVtofqlWu21pwTosyFx6z3m7RNev4wNCLrzuLo/vBMjy6IKFGGCDvLAqrSHZ8ALJIvDTk89VaEa34oPHy94SqTOXby0b2DfgefLXaYRexJMTlJOYFcpOThJfcgj7bTtUhjz6K2ttPGCgMlUjLc3X8aYnqgoLSQBMqixN4rXyLWqsQBCGM2OGDDIOVSq3LPg99cN2zgcU7LOQW5sfm6SlKpgH7METdHE7yzXMHCgvaHJ/vCZBJSvh6wNPaNI4RyY7VRWSCz3qxQ8MCNLKspTXpuUztvTxUAeE2PI9C2gN4ooICHLCdDyTHjmRw72D/6q7aKGXg1KcZSRX0rgZt+zYuR16BLhuqHUZZByF2wboGvKbwXCOuqaW2Qi349pqtxaGiTfLY0iRebMjAA3ZWnfWNSgy9JqffcA4iLE82k3+DZoPvTjmACt9gjcKEfxnL4cgR6kkeLC/j51/AQNFmDtuYD/ImYZoTF76gvqSULJaDHCactm5I1perAGrM8zwpW4FvP0O4fe24j9UevrBzpWKRfpXMRyJrLTYVtYuA2
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P190MB0317.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39830400003)(366004)(136003)(346002)(34036004)(451199015)(186003)(2616005)(26005)(6512007)(6506007)(1076003)(52116002)(83380400001)(7416002)(2906002)(5660300002)(44832011)(41320700001)(41300700001)(110136005)(6486002)(316002)(508600001)(8936002)(66556008)(54906003)(4326008)(66476007)(66946007)(8676002)(36756003)(86362001)(921005)(38350700002)(38100700002)(26583001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?OJH6QvTS3f/HcPrlkaubQ40felMaab7gMjH59d1XA2DXSHSuJGb2Ap+SOG7t?=
 =?us-ascii?Q?O+fEwHh3kubGFvfC+LyhV7MVGhOpxyOjmZ/0WtwFZ4EkGk5xQGHEW9PzfoHk?=
 =?us-ascii?Q?G2Z9Mde+eJwxYiBiYLkw+O9vksLa401DaF3eAkpCqAsEKfOltjgVW5vgB4nk?=
 =?us-ascii?Q?Mj65zmT/eWW5px2P/U2hX9G+hxPFrY5L58XO0MbZay3Rh+1o+R5rU/wTzbwV?=
 =?us-ascii?Q?O5S6W+T1vCJCsMPmh7BK51wGlTArcbsHcxzMPrQ7WjG6FmPofQvwkOFcSSpb?=
 =?us-ascii?Q?wEM7M/tQi1dRiqZRDSAjMRcJBrI7u0cvHZteM8IixNaRKmHLMBHZfR1LG+Oc?=
 =?us-ascii?Q?cv2K1pdOkPTDXFN6yzYwApHw0LN0Ir6sfqg0d5D/GyDSKmWl1qBT4ckFM5yz?=
 =?us-ascii?Q?nczNHJv1coJL/xP9TezOwMQCL4QpneGgN9rRQc9Imr+D00kKJtz3Up/xnJ5j?=
 =?us-ascii?Q?INgq74UczZysRGZWkVdm/uY5bMObhOndCtXMgCaZJgpcec8ZgQl/lOjUep0w?=
 =?us-ascii?Q?S7NknYE/hEvASZkl03jDeWjpFlz9HQGzq09peXRPvp3DdHFoxm/Wp8cSD/h2?=
 =?us-ascii?Q?Kw04RtDUuCsQXqXlBhaBgnSrdWRkSMYAR8tD7MMBWHciYybxwAEohe03OHOp?=
 =?us-ascii?Q?/18yx28wAq7V/n5LvgLKwzCAKHxdfSqzgk217t8JW9KmzSb7Wq2WUToE88MC?=
 =?us-ascii?Q?eSI9EzQTdc8CtM317tB6omKCPXB9fzHKUeOpEDULaEA8AB2RBAmPBBRGQJ0i?=
 =?us-ascii?Q?fQtCWwrPJ9wh26uRWe0IakkPP/Nw61+s/Hm0u16qdxaznwL4X80ERKjhsIUJ?=
 =?us-ascii?Q?O7/OENrt4P5ejiGf5929tqg/gc7H17VHuXLvz9s7sIXgc/IKLXap7MtykAVG?=
 =?us-ascii?Q?ogZuINSkBbHCIW3qC7qkin8Osaoe0cZPhY0b5VLt6F4l5vBiBi7Lvfvw+asB?=
 =?us-ascii?Q?ucfq01fTSaE72+fh/FAP4bl+iPRip/gFTcKTgbDvCOsJvHBuTP5CqxyKiex8?=
 =?us-ascii?Q?g0jblDsGFqLXHrwDRxbg4AnDz+hJyZM/sfkteeckWwllaZSwuGVOvVTR3U+P?=
 =?us-ascii?Q?mCwiQGLavrIBfxmAZkKXkc46GKyaC0JWe2KXixzVlUXVFi/hgukkDE7QVYlM?=
 =?us-ascii?Q?nMi3sc6bW31ytXnIP8urTJ/ueoAvynjWWX3SA9zoL59vyshWiIgCIPv8FT4k?=
 =?us-ascii?Q?JtaTEyuGhl63AaZqGmHUNgFCgYwQwPfCw8JUB87NrRj/SKzbxTWJBSuDRHMc?=
 =?us-ascii?Q?u4IcrPqJVpFLmD4CA++zpFzpd+IGD3YDmD4qhlabl6zRszsSWKISmlibXfWs?=
 =?us-ascii?Q?yDaqZpUCw6Kia8dcRRCw85NcRNXYD6XWSatZ5esmWmsyBjou5T8f3i8/NbmX?=
 =?us-ascii?Q?lAUg72TQfKSmqDTZ9CkkOY6X63M9HX8xSWeaGM13OH7o5LVbiSQTui3GPCuZ?=
 =?us-ascii?Q?I/HQPYSSNIT8hNSR+7xtYVbl15qr3op8dTVCIn8DXRJMfffAHloKzyWhN2+D?=
 =?us-ascii?Q?xmiHF9UMlikr3pKfP08rdN4XW3ErgfEDzVXLb+rRi33wLfCxMrBKIAnba7MV?=
 =?us-ascii?Q?IPRD7bDdAkIb533cGHN8DlVnc5CHBcrQosG5ny7ECX4hqAHtKaXgfuJEJRfc?=
 =?us-ascii?Q?jA=3D=3D?=
X-OriginatorOrg: plvision.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b68600-5c8a-4d46-b09c-08dab1aaf2d8
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 08:21:40.4596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 03707b74-30f3-46b6-a0e0-ff0a7438c9c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xRayd4KFYxFfZy0yt7aIkTxwEHCkLjUfVONyLe7opJXHJW2e6OBHrBumHqxu8Im/t7gnyI5J8rRen2qPoCUE+Rp2YNKAS9Oif76fFcdFhss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P190MB1930
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_012148_631713_0B97C4C7 
X-CRM114-Status: GOOD (  11.43  )
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

onfi_async_timing_mode_to_sdr_timings is required for ac5 support in marvell_nand.c

Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
---
 drivers/mtd/nand/raw/nand_timings.c | 14 ++++++++++++++
 include/linux/mtd/rawnand.h         |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
index 7b41afc372d2..5604e3dc632c 100644
--- a/drivers/mtd/nand/raw/nand_timings.c
+++ b/drivers/mtd/nand/raw/nand_timings.c
@@ -642,6 +642,20 @@ onfi_find_closest_nvddr_mode(const struct nand_nvddr_timings *spec_timings)
 	return 0;
 }
 
+/**
+ * onfi_async_timing_mode_to_sdr_timings - [NAND Interface] Retrieve NAND
+ * timings according to the given ONFI timing mode
+ * @mode: ONFI timing mode
+ */
+const struct nand_sdr_timings *onfi_async_timing_mode_to_sdr_timings(int mode)
+{
+	if (mode < 0 || mode >= ARRAY_SIZE(onfi_sdr_timings))
+		return ERR_PTR(-EINVAL);
+
+	return &onfi_sdr_timings[mode].timings.sdr;
+}
+EXPORT_SYMBOL(onfi_async_timing_mode_to_sdr_timings);
+
 /*
  * onfi_fill_sdr_interface_config - Initialize a SDR interface config from a
  *                                  given ONFI mode
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index dcf90144d70b..7702abf9e1f0 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1481,6 +1481,9 @@ int rawnand_sw_bch_correct(struct nand_chip *chip, unsigned char *buf,
 			   unsigned char *read_ecc, unsigned char *calc_ecc);
 void rawnand_sw_bch_cleanup(struct nand_chip *chip);
 
+/* get timing characteristics from ONFI timing mode. */
+const struct nand_sdr_timings *onfi_async_timing_mode_to_sdr_timings(int mode);
+
 int nand_check_erased_ecc_chunk(void *data, int datalen,
 				void *ecc, int ecclen,
 				void *extraoob, int extraooblen,
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
