Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F132606A33A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2026 12:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UMtbfEz0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xCu5HYawrKXY3jjF2Efe2YnY4ZrhjRAFBBXE5biu3Uk=; b=UMtbfEz00LRC5j0zTKeez8SEcQ
	1cmWI/PYTt0L+sO/niZZuDxuHZOQ9HUv3VK/OVJePCewFHCZeJQJ7DBn5PfmNbXZFFvC40oQWdzBR
	8GpXiHYUPXLAtxr0xeTJUoYB6qxKVmcJTk8jhnrfC+xFINZQA34RVXhDcGQNGsQdk0m39OZff5GQK
	jH1x+opa7nvNkt18GGGaPPagpDUHWMBltqlJsOr+kAjCnXAmUyY4sHyQau2MZKZQ/hCl/VfJyZ51I
	X7gwbTQdPVBML5NJiWuwdNDNJ+rmEpVqV2P848csUjWNZtJcwHOg52MUrU0mAyabwY7UN2AWjgn5R
	6iXOp9Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2VP-00000006vlF-3itL;
	Wed, 28 Oct 2026 12:11:47 +0000
Received: from mail-sh0chn02on2071f.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::71f] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2VN-00000006vgh-1hWc
	for linux-mtd@lists.infradead.org;
	Wed, 28 Oct 2026 12:11:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4bU1KKDLY4g94B14Sc0OoslkxSzMW1GpEkGW1TgWD87zEiifklYN8TaBnYo2qojq7vnhoxj2eUNIbL5f/S7TKcFV/XkImek0rTR0E2nXQiYqaccRkMA7YRlR+1xiga3bNIUxpWpeqYiGWp58wm3qifaJ4an/tWiVXQH4hmyHXUNc81cY55CPgDZIDcaPRiqdy1SHulSRZyiv6pPc1DoIDAcsyZdeoHRxewAvW5L6+GPc7qOfECVJnuROVV68+TILlrD0xv8joE93WHAtmmgtHa4jAbx/dlRenknl7eY5w4sHtBvxLDmQ0AKpSqfA8lf572joKLcMboniZcLAqyG9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vy3n70/oQ5S5fauBqpGfqu7BJ0laCgO2F7TDmIdnv0=;
 b=FqOT61QxwkOqe0ptXtC1pbjiidIOch8HmUl2QsYv4WWH0C7gq+jtUxFJWbtfQNCQlQK24FsXLaOIrg1HQVBKWSoUOepAR4iBaVwXll2vblAhzGhH375bVhyEHFYiU8d7z7q5j+TTeGB0+vaeRZy0fC9dzAjwW0m/42/YFkPfInkDI1zeeszYcnIdhbx1MVuP1byG7DNfqSur3V9klRuVv2smp5vdlKwGeqkyrEbmmAT9dH3BnK/1ksOYL5EaQIiwYV9e9g5dJ0lWrDqx7ok91pZrGAJBxHCPDg7GLT0GcXyRW0o1ZiuXMaPQjQmkMwNG50dkT4VmYaacHRY9N+Yjaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9) by NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 12:11:25 +0000
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 ([fe80::1666:48e8:19e9:ad29]) by
 NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn ([fe80::1666:48e8:19e9:ad29%4])
 with mapi id 15.21.0546.021; Wed, 28 Oct 2026 12:11:25 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v2 5/5] mtd: spi-nor: macronix: Add 1-4-4 DTR read support for MX66L1G45G
Date: Wed, 28 Oct 2026 05:11:00 -0700
Message-Id: <20261028121100.79667-6-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261028121100.79667-1-changhuang.liang@starfivetech.com>
References: <20261028121100.79667-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0007.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::14) To NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1216:EE_|NT0PR01MB1070:EE_
X-MS-Office365-Filtering-Correlation-Id: 066b3ec8-299d-483a-9f09-08df34ec96ce
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|7416014|366016|261009221227099003|261009220027099003|261021121427099003|261009223327099003|261022105027099003|261022075727099003|261021123027099003|261009223027099003|261009221727099003|10067099003|56012099006|261026140227099003|3023799007|6133799003|18002099003|22082099003|261026121527099003|38350700014;
X-Microsoft-Antispam-Message-Info: pUQhyQQT5R8/qtwxgxi0LVNYuUJN6UErdBDQk/pdtK4BbFaLYlt+L1J5N5lrYd1U78dewt0HZs2QeXdb6lkd9iUc13v+B3mffccP+MkFWGhFRl81NkJUseaCWoISOpY0IrHgoe+1Aq21G9IjCZY0kaudMeBfceKvbt22AXFFsQ2S93lkZWQN3QZNviAegqIDZoW9mFa3Q4DTEeUFvgpMxVJlUHVqSbA/Y1J1RMlsxSGRxi/ZqU0L2mMMRIjG9uaEL9z+ePx6Br5UUdadWJncyp3TnpcQQ8UeHhwHnDOPqwFAOb7bN/xxKTsCOK9BPCSqbKXZoWJ4yLRR83jE73BS1QjS/6UvR3wQZzH8LGMNeWnG1EqXVRUyHTgCTlArRlzItVyiy/ZX1hZvwBZdWK/2yVCtsSlcMU0EizsNrATpkDviCJ21XdEKSp7eYRyt1CpjM3QrwuymOxgmlsfj6GBRHelqB4YpF1JnBEk2YLpjiBE5OIRWEj0wawJosrEn8AKdNkAP8oKWGoUXR19ltjcS3sSKyEgdILomV1+WhX7dd2+gVn8Hg1zpox1V4+0Osi37
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(7416014)(366016)(261009221227099003)(261009220027099003)(261021121427099003)(261009223327099003)(261022105027099003)(261022075727099003)(261021123027099003)(261009223027099003)(261009221727099003)(10067099003)(56012099006)(261026140227099003)(3023799007)(6133799003)(18002099003)(22082099003)(261026121527099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CeRVo/wkhx3GFrus8gIIpG2ORdSYtq7HVmPCXWF8b49lQiOF1jwOSDqdim1Z?=
 =?us-ascii?Q?mjTTRsxfKv9Edho7u5ZxGjcR+mS5FBS3esAZAcIs8rjxQCJiU4yoc3mooRV0?=
 =?us-ascii?Q?t8PP2ibDXcWpVCQ1zXmo1p0JsoFPXfGMKhgvfXvAhpVaP0BEzVmIYw6215Fw?=
 =?us-ascii?Q?WEA7HKlTCmUswq3nYiJMBkLow197LxN6Vh81z1XCROe3ELasN3CWFsjap8eo?=
 =?us-ascii?Q?83ex2R/JHM5re42N7Rm7Nv3JZYMQG95Ln8rJ6lVKK+2hPGZVaWbtrSAeD9fp?=
 =?us-ascii?Q?1qlTt71AQlaBR0Y2UpVLhSYDcMmoMaDBsYN/M8PYQQ2C9dS53221qKF4Hp2h?=
 =?us-ascii?Q?noX5HRYqsMuOkbCCRYzXRymfhZlaI4IQlaTOVeYCgE+RYT7YkZlcpeRWaAJ+?=
 =?us-ascii?Q?RBuTMB5XYypVEXWyJTZJljmQdiVhi2drXIIGLTRCZ4S2wTy/DLH5m6FFGpWc?=
 =?us-ascii?Q?JPweDF2kWoBletDzzvbBe/taDae0BPfTBgk9AhDIHDT5K5I/fMc2kp0Y7wkc?=
 =?us-ascii?Q?riVqA92C6Pqnhe392tUn+QsphA2YqDrZoQDaz71dwQNAGXep5Nnxr6yKOpm4?=
 =?us-ascii?Q?9gVQVqR/oYV0qkm6CIVomQDDmwEy8utdJQ8N7N+NyLD6x6nwAevw7DKACmmP?=
 =?us-ascii?Q?nqvU35DXEjKy+1Vy/gl6tqZqq3fgc+YCIPHMzqKskHzPf639EI1Skm9hnyKc?=
 =?us-ascii?Q?zrbCU8tuPnSoKCtISZcfipNrNK0Mwaoi4E4/8ifvy+kI9kbECZGm7Hz8rbTB?=
 =?us-ascii?Q?BqkXLnkuX6KG6MmFP9hXF38PR1rnb3TyqyKfNGCf3ePjBSF9JPCNPNVu2ONr?=
 =?us-ascii?Q?TcGZbHpHAsN/oOyhg5/DzlWbd7E1xFv5+tH+ot0bYsBqplSvF6gcUUqgWBe+?=
 =?us-ascii?Q?xqki9OrF5ACUmdPyXuYwuC363imOQ6aM9QyMS+9IAoLrV2UEKMD9XABmL782?=
 =?us-ascii?Q?PF0wpMEYFwB90f6iEQNiEfJUk6K7svi4116FFDDKesPn+QV18nPLwgIIUFwo?=
 =?us-ascii?Q?6ev247ir/dI0U3mjJgHq7sXllDCoxrW5+OrSnaKDmqfyBl5oqqDVZseQqIe7?=
 =?us-ascii?Q?kCQzOSNfhgq4rchOS3nhqckvC9In8sT2tFCdJ9Nr1By8wEjSnkuqB3YC1vJS?=
 =?us-ascii?Q?aoMYoGyvmC8qQL9F2ivD7LY6+nuwqpTGJ6ORYiy7AFxdgW/pP+ZBikJFZ2p4?=
 =?us-ascii?Q?DA5SGh2vyeP0306F9+UPhsVSgWLbWQMQjgoYAp0pznu6JDW5K2KFwhuqTErC?=
 =?us-ascii?Q?0TYQP7bpqkbJH3ew7anMf6ukiWZBDKKsnl9FAozDN4Ug6pMATFV9vGFzpnVx?=
 =?us-ascii?Q?BHOlaDFYbeMpLNZAopYjbF70L91WMoU8CzvkmXyt5fUWtzc9X9BbtV35FgJA?=
 =?us-ascii?Q?TXnkxBhQaIx/TsZ/h6fa85vw0JqqOEuWsZrp0l1aUhOLUDlVTfj04ujkvt9G?=
 =?us-ascii?Q?wq5liuRIwWVIZjD4JYoTWutaADmPtObtJ1KAdcJaDPdodQ6nOmSZZDzl4O3A?=
 =?us-ascii?Q?t9ltQocN6GD0Lpcgd0US/0lamqNtzCaNtOsl7waz2nMaOf314vC8rbEVBsb0?=
 =?us-ascii?Q?00dRg04aW6gvXKpztYAAmEKlMO68P0eRXv+AQ2YzqkISmtZQNLz0e19l4mwa?=
 =?us-ascii?Q?3cB797hJaBR1SVIWRtkgjJ0kV6ufZfKakU56jkLNsuxbnkbuaRv5jLHUB37R?=
 =?us-ascii?Q?wRAncHRPiyYL2Bl9/u6xSjlSMDap+MPVNITXjKtJFUppZVsDk1zzK9i16sNP?=
 =?us-ascii?Q?qS22OprkxfjkfcuidO5Skq73uEXrlnu7ZjQ1ObOgsYG71E2/ld0Z?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 066b3ec8-299d-483a-9f09-08df34ec96ce
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 12:11:25.8027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kors0QCNu6xiY4IIOREyj5IcBYRW5R0e2ViqpWDMlQPsRmDLWxOC+mqaODqCnwKkfQlY2NK6PxQUID47ly/urO46i7+WglR+ClLx0wNw8IBSTAinemo+owTqrjIBD+sP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_051145_454350_B1EA79C9 
X-CRM114-Status: GOOD (  18.81  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MX66L1G45G supports the 1-4-4 DTR read mode. This flash uses 6
dummy cycles by default in 1-4-4 DTR mode.

For 1S-4D-4D, its support bit is located in the 21st DWORD of the
BFPT table, while the dummy cycles are described in the 23rd DWORD.
Unfortunately, the BFPT of this flash model currently only supports
16 DWORDs, and the kernel's SFDP parser does not derive any
SNOR_HWCAPS_READ_1_4_4_DTR capability from the BFPT table.

Therefore, implement late_init to initialize support for this opcode,
configuring the read settings with the default 6 dummy cycles.

The SFDP of this part provides a 4BAIT table, which also advertises
the 4-byte 1-4-4 DTR opcode (0xEE). SFDP parsing converts the read
opcodes to their 4-byte variants and spi_nor_set_4byte_opcodes() is
skipped later on, but the 1-4-4 DTR read is only added in late_init,
after 4BAIT has been parsed, so it is not converted there. Select
the 4-byte opcode directly in that case.

Also set SPI_NOR_4B_OPCODES like MX66L51235F (0xc2 0x20 0x1a). The
part supports the 4-byte opcode set, so if 4BAIT parsing does not
complete, spi_nor_set_4byte_opcodes() still picks the 4-byte variants,
including 0xEE for 1-4-4 DTR. With 4BAIT parsed, as on the tested
part, the flag has no further effect.

Add a dedicated fixup for the part (SNOR_ID 0xc2, 0x20, 0x1b) that
keeps the existing QPP 4-byte post-SFDP fixup and additionally
advertises the 1-4-4 DTR read capability in late_init.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Logs for MX66L1G45G:
********************

+ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c2201b
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
+ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060102ff00060110300000ffc2000104100100ff84000102c000
00ffffffffffffffffffffffffffffffffffe520fbffffffff3f44eb086b
083b04bbfeffffffffff00ffffff44eb0c200f5210d800ffd649c50085df
04e34403673830b030b0f7bdd55c4a9e29fff050f985ffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffff7fefffff215cdcffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffff003600279df9c06485cbffffffffffff
+ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
bec91ac20c9f7c63a00992fd2f779f8c5378d8f9afc699a2c741be5bdf268e35  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
+ cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x13
  mode cycles   0
  dummy cycles  0
 1S-1S-2S
  opcode        0x3c
  mode cycles   0
  dummy cycles  8
 1S-2S-2S
  opcode        0xbc
  mode cycles   0
  dummy cycles  4
 1S-1S-4S
  opcode        0x6c
  mode cycles   0
  dummy cycles  8
 1S-4S-4S
  opcode        0xec
  mode cycles   2
  dummy cycles  4
 4S-4S-4S
  opcode        0xec
  mode cycles   2
  dummy cycles  4
 1S-4D-4D
  opcode        0xee
  mode cycles   0
  dummy cycles  6

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x12
 1S-1S-4S
  opcode        0x34
 1S-4S-4S
  opcode        0x3e
 1S-1S-8S
  opcode        0x84
 1S-8S-8S
  opcode        0x8e
+ cat /sys/kernel/debug/spi-nor/spi0.0/params
name            (null)
id              c2 20 1b c2 20 1b
size            128 MiB
write size      1
page size       256
address nbytes  4
flags           4B_OPCODES | HAS_4BAIT | SOFT_RESET

opcodes
 read           0xee
  dummy cycles  6
 erase          0x21
 program        0x3e
 SR1 read       0x05
 SR1 write      0x01
 QE             SR1 bit 6
 8D extension   none

protocols
 read           1S-4D-4D
 write          1S-4S-4S
 register       1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
 dc (64.0 KiB) [3]
 c7 (128 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-07ffffff |     [ 1  ] | no
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
+ sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
+ dd 'if=/dev/urandom' 'of=./spi_test' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4e6069fe661b4f2ad8b96620641219cd9b34758e1b5d8585af867ff9ab4c349c  spi_read
4e6069fe661b4f2ad8b96620641219cd9b34758e1b5d8585af867ff9ab4c349c  spi_test
+ mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 134217728 (128M)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0
---
 drivers/mtd/spi-nor/macronix.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index b3fdb4b2fa1c..3401275f096b 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -103,6 +103,26 @@ mx25l12805d_4pp3b_post_sfdp_fixups(struct spi_nor *nor)
 	return 0;
 }
 
+static int mx66l1g45g_late_init_fixups(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+	u8 opcode = SPINOR_OP_READ_1_4_4_DTR;
+
+	/*
+	 * When a 4BAIT table is present, SFDP parsing already converted all
+	 * read opcodes to their 4-byte variants and spi_nor_set_4byte_opcodes()
+	 * is skipped later on, so select the 4-byte opcode here.
+	 */
+	if (params->flags & SNOR_F_HAS_4BAIT)
+		opcode = SPINOR_OP_READ_1_4_4_DTR_4B;
+
+	params->hwcaps.mask |= SNOR_HWCAPS_READ_1_4_4_DTR;
+	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_4_4_DTR],
+				  0, 6, opcode, SNOR_PROTO_1_4_4_DTR);
+
+	return 0;
+}
+
 static const struct spi_nor_fixups mx25l25635_fixups = {
 	.post_bfpt = mx25l25635_post_bfpt_fixups,
 	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
@@ -120,6 +140,11 @@ static const struct spi_nor_fixups mx25l12805d_4pp3b_fixups = {
 	.post_sfdp = mx25l12805d_4pp3b_post_sfdp_fixups,
 };
 
+static const struct spi_nor_fixups mx66l1g45g_fixups = {
+	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
+	.late_init = mx66l1g45g_late_init_fixups,
+};
+
 static const struct flash_info macronix_nor_parts[] = {
 	{
 		.id = SNOR_ID(0xc2, 0x20, 0x10),
@@ -355,7 +380,8 @@ static const struct spi_nor_fixup macronix_fixups[] = {
 	{ .id = SNOR_ID(0xc2, 0x20, 0x19), .fixups = &mx25l25635_fixups },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x1a), .fixups = &macronix_qpp4b_fixups,
 	  .fixup_flags = SPI_NOR_4B_OPCODES },
-	{ .id = SNOR_ID(0xc2, 0x20, 0x1b), .fixups = &macronix_qpp4b_fixups },
+	{ .id = SNOR_ID(0xc2, 0x20, 0x1b), .fixups = &mx66l1g45g_fixups,
+	  .fixup_flags = SPI_NOR_4B_OPCODES },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x1c), .fixups = &macronix_qpp4b_fixups },
 	{ .id = SNOR_ID(0xc2, 0x25, 0x3a), .fixups = &macronix_qpp4b_fixups },
 	{ .id = SNOR_ID(0xc2, 0x25, 0x3b), .fixups = &macronix_qpp4b_fixups },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
