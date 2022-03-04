Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4799C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Mar 2022 02:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=siBUiefBBwONmcjk2mlfimQ8dqauI3OQVnRMmiur5pw=; b=bVpjoA6sVajrkO
	0CNsM4l8yOa01ZfUSey5JNCE/+WHOz8K9D783NfbzvMqDLnQyX1q/x9mWR+CXJ2M1VdJ85yYxGIvD
	7M9rCfJJoVcaXkkeRmjjMqD+L0gvGfEZXqr2yfH89GDGuaTzK5LfE3PbwnrVatCCmG49hd4/In12j
	NuJvUvBwa75pEz31U+tp0bghfaRFdRjzw2HuSL9hagKGHWCWyBKmWoFBkqf3z698yyLm3rektGDB8
	OHJpm7go5INUYYpJU6Z8ts4Sgey1JUNyzS69u63ihlyRBrw2MKdzo6Yaroig8qFzAWS1VVp1u4OBr
	K5liZLHBJkDYMMrz2vfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPxpf-008LZv-GO; Fri, 04 Mar 2022 02:38:15 +0000
Received: from mail-sn1anam02olkn20816.outbound.protection.outlook.com
 ([2a01:111:f400:7ea9::816]
 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPxpc-008LZH-76; Fri, 04 Mar 2022 02:38:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrUlGXMkinQcc5Y2+kMTxuaPNU24I+DcDXiZrmURUyOP+h8fi4gh27qf5EArB3oI/Xy3Xu8Uub0H6morAlVeIfqL4Mg33OSzPlWphNdCOLHlTph8OG4puqnCBFVSPxNtDgXi5LiargKTEb3W4MNRcWaSjhNK/6A7+9k5ZZKGXbqtBgIuj1UCKDg+5wHYj8Ad6+07rvFXKY4K46OzJFDWhJfGcXHOWM58c2zeR+A53UqqGwy52iXbJhbLBSbstg8EYPOoN0/5/x8QjRAsmMkw2pQlMtHD86hizO+ueI9HIa5Ex+dxo6VOaqUhPka2D6ifGyjkoK94PlgHlFBSf3Cglw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32tGGFDmiDqmgq/S2mFt9l0AIReT7Lff/bHBX9Gvp/g=;
 b=a1dmsgpw5VN9BO1//ZsHHRptHJdcUfCgN+lv88pGbHweVmsREh8q0q5klmy+xjrCpqCPjOie6CfYo0koOaZlRKOX2HQw4l1kxWyVFHZNqjONiSRu/nlR17dB4u0H7U+QkVMu3rPzc9SyG3HuOgfLMXqxHs0JlQB1iiXXRzFyvq7o3Z349AGsXpjWhI/pjEDAxCcmU0Clnax3SVXcZtR53eE9dcfODe/u5Jc9NTQSSXbaT+owUSPmsAO6syRxV41d8rUN2z//yr87sGrFrlXM/rUVyL588NEJCGQXF+UrKxBIFGf5tEPMRgo2J1jtQbNkS701LRNIDI/YuFHY47pNJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32tGGFDmiDqmgq/S2mFt9l0AIReT7Lff/bHBX9Gvp/g=;
 b=A6Zwk6O2xXLR27JhWeWk/ceMAddhanzmzLZ+c6WD+2Y334b9Y3WoGZXJboGSHQH6VUDsjigdd37fWKTOlkMRS1fR0uVNefwsMxWykC/mlNb1Z4UYCT2q3fBfqQR/A8YqsutHLdOHzZHSCh5Cy1l5h+8HMVCQ3ckx/FRg8sNxAwW9N5oRlOa/jvV88JPZmoopZiBLAuYjdfVUU999Phw9QHbL+MSXTfyqjwjFAnN/g+hEnKFSrj9LDiAFDNayS6ma16nKJsVwRm+hHWWcB3WQudK0C9uVKwc68nI4D2KoEEuUmRe4wDt4PzMyxeWE3Z2StJguPgBOj6kAT9XanamXRw==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by DM6PR06MB4139.namprd06.prod.outlook.com (2603:10b6:5:92::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Fri, 4 Mar
 2022 02:23:27 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc4d:1caf:5746:df98]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc4d:1caf:5746:df98%6]) with mapi id 15.20.5017.027; Fri, 4 Mar 2022
 02:23:27 +0000
Date: Thu, 3 Mar 2022 20:23:26 -0600
From: Chris Morgan <macromorgan@hotmail.com>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v4 6/6] mtd: spi-nor: manuf-id-collisions: Add support
 for xt25f128b
Message-ID: <SN6PR06MB53420A7847CD3D45A31D84ECA5059@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-7-tudor.ambarus@microchip.com>
 <1a05176e6e2457c1b86035522c3f691b@walle.cc>
 <SN6PR06MB53428C8EB83C2DAFACFDBE70A5049@SN6PR06MB5342.namprd06.prod.outlook.com>
 <1e78a5bf-8948-c998-8275-87bbf841c304@microchip.com>
Content-Disposition: inline
In-Reply-To: <1e78a5bf-8948-c998-8275-87bbf841c304@microchip.com>
X-TMN: [oIKFrCUgWVHDmTKb7AiwVzr+DuZJ463C]
X-ClientProxiedBy: SA9PR13CA0151.namprd13.prod.outlook.com
 (2603:10b6:806:28::6) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20220304022326.GA3878@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37912a25-010d-4041-91df-08d9fd85f748
X-MS-TrafficTypeDiagnostic: DM6PR06MB4139:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wumq47AWSmzlb5IMlOnThk7TEh+1mRoT/27Tw80+9xdjEszjgZj9x5V/Z6SD3QiIqicrlPks6X2kNN+IR/5ypQkOed2Y+WS+1MLuXNnqCkLobRzffEZPezrtQhTlwoXv4a0PS8Zm5mAtXITjJ23Regj3bwaJgrzh232w+CsJf+sce+LQA2zZDCVEG0W7x4Zru+f9kLwwiaAO6p1UQ0DDfd2hf2wp9CGv6fBROBfqal7ZeelSYiAZCuGlaAPwmWAF8PhZ/B3e3QVw0isoPf5+I/UytZe50aIk/ikvJloFj5tivzMugdO4jmtF9Jz9yM144ESQob4emAAGe2YodVdBdEWw7UsqtMx9Acxlv8y/2bdYV7tFs9HS1A064mO2VlRyJn2bqE7Rf7sKTVVKDWn5NbMApyvkDI9DsFYcGoEIYrh5CjVSH4Rnx0doUPwluIzn724dG1ywuVLC2DDT9wqo+swiIqNfBgBPu3DfFfsDzoOBVE7vFgUrrpvkz5EFMfSQg+goG2O3m3w3QsMiIFBbqcFwWdwchCl3PoPzXzzh1faJXFy7vvY2rk04EERj7ogo
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BiDFZ7kXVQV3OR/HR204Xv5y11gCx7c07VEPUZSR7txAQyRXZ8sv90b0I6Tr?=
 =?us-ascii?Q?LhZmi3eVmTNH1no1YwdvJO6Q2o4CXTFNPaRwB20IVACoSYiq3cRAeT3SgDEp?=
 =?us-ascii?Q?eXbWxs9EDBVns0TXGW4TihGuEtoIO97HvtANuir4K1u11tnUWGOF6gUbkC1c?=
 =?us-ascii?Q?1JQPMI2nPvfbhD6cyUzWAb7/h39peer2ZZqQ1lSQDdgXaEyFeC2XD8pxdLbw?=
 =?us-ascii?Q?Ae0EzHu+JMpEUdMWZ59gkaw7RTPvvSDz3yp4jY6puwBl38UJVR+q0XQwQ3hR?=
 =?us-ascii?Q?mnebAgItA2sicArrDyx+XPaHA6o2TeWf9qLTzOb9DC1KSSiptZppnGA6naKo?=
 =?us-ascii?Q?XfFJblJzBBLjGVCIrAt7JpeFx5fuud0sqyVeUdz9A4coqg+8oATQ7kGzh/gW?=
 =?us-ascii?Q?7fFtv576lDJxC/pkb6JA0vy/COT9K2aGJzNCIL/xQsWnqasvHbxcvCZZXiO0?=
 =?us-ascii?Q?WalkHjP/g8t2Qk6xYBcKv06ZrnwkR98RwXsvYL9CDqJKvk6J8cG7zNA4omAY?=
 =?us-ascii?Q?yfgJY3pZ1whvIN2vmVl0d/l60mcg5UJVHDc1/n7b5EQQA8lHWb5lX6/OjC9X?=
 =?us-ascii?Q?mcZFshKxxNbD1nv0YFAh9xQlMVCdLCWDE2OCvPz34GaqD6/YdGGlEknHcw8m?=
 =?us-ascii?Q?1xRYrtk8CO9iYMRRcS4fM9e3L/q4rJ1ZMUoE+9c4zJPQQsZNIGtx/MjIjLlc?=
 =?us-ascii?Q?pxG0QE6oHburfx4YyAz+kKwwHT9Erach9PWUMpu9hAc/OwZR0vQAcSR3vt/5?=
 =?us-ascii?Q?K2hnZAFOrSIEqjujCK9EthQtxLzWWIww6yFJlFOI/SSfQq1ygprAZH/VHa1v?=
 =?us-ascii?Q?FOnP0nq8Ydb90ZakT4C2wXVpRjM7cNtGO+9rNE919X3Ty3nfC9IoDeqAH5GM?=
 =?us-ascii?Q?M5U+pA1XpkcYFJMx7jWZhgJY4RqaOK/F/XyjFQSEU7CLtAXF3+ChzmT5U0SS?=
 =?us-ascii?Q?sSThtBz0AEIu7BfTQweung=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 37912a25-010d-4041-91df-08d9fd85f748
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 02:23:27.8341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR06MB4139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_183812_312692_CB6B71BB 
X-CRM114-Status: GOOD (  23.01  )
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
Cc: vigneshr@ti.com, jaimeliao@mxic.com.tw, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, Nicolas.Ferre@microchip.com,
 michael@walle.cc, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, code@reto-schneider.ch,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, sr@denx.de, p.yadav@ti.com,
 mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Mar 03, 2022 at 11:50:34PM +0000, Tudor.Ambarus@microchip.com wrote:
> On 3/3/22 23:04, Chris Morgan wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Tue, Mar 01, 2022 at 11:23:24PM +0100, Michael Walle wrote:
> >> Am 2022-02-28 14:45, schrieb Tudor Ambarus:
> >>> Flash does not support continuation codes and may collide with a flash
> >>> of other manufacturer, Intersil being an example. Add support for
> >>> xt25f128b.
> >>>
> >>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> >>> ---
> >>> 0000000 4653 5044 0100 ff01 0000 0901 0030 ff00
> >>> 0000010 000b 0301 0060 ff00 ffff ffff ffff ffff
> >>> 0000020 ffff ffff ffff ffff ffff ffff ffff ffff
> >>> 0000030 20e5 fff1 ffff 07ff eb44 6b08 3b08 bb42
> >>> 0000040 ffee ffff ffff ff00 ffff ff00 200c 520f
> >>> 0000050 d810 ff00 ffff ffff ffff ffff ffff ffff
> >>> 0000060 3600 2700 f99f 6477 e8d9 ffff
> >>
> >> You don't have this flash no? because the md5sum is
> >> missing.
> > 
> > I have this flash, what do you need from me?
> 
> Hi, Chris,
> 
> Thanks for getting back!
> 
> I would need you to dump all the SPI NOR sysfs entries and then do a little
> test. Here's an example:
> # cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/jedec_id
> c22018
> # cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/manufacturer
> macronix
> # cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/partname
> mx25l12835f
> # xxd -p /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
> 53464450000101ff00000109300000ffc2000104600000ffffffffffffff
> ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
> 083b04bbfeffffffffff00ffffff44eb0c200f5210d800ffffffffffffff
> ffffffffffff003600279df9c06485cbffffffffffff
> # sha1sum  /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
> c5e5abe6c5650a9d9c448690b1eeebdf5bfe57d4
> /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
> 
> And then an erase, write, read back and compare test.
> 1/ generate a 6M file:
> dd if=/dev/urandom of=./nor_test bs=1M count=6
> 2/ read first 6MB from flash and check if is already erased:
> time mtd_debug read /dev/mtd5 0 6291456 nor_read
> hexdump nor_read
> 	If at the hexdump you'll see anything that just 0xff, the flash has
> something written to it and you can go to step 3. If you'll see just 0xff
> data, then jump at 4/
> 
> 3/ verify if the erase is successful, then do a write, read-back and compare test.
> time mtd_debug erase /dev/mtd5 0 6291456
> time mtd_debug read /dev/mtd5 0 6291456 nor_read
> hexdump nor_read
> time mtd_debug write /dev/mtd5 0 6291456 nor_test
> time mtd_debug read /dev/mtd5 0 6291456 nor_read
> sha1sum nor_test nor_read
> 
> If you reached here the test ends, you can ignore 4/.
> 
> 4/ if you reached here the first 6MB of the flash is already erased. Do a write
> read back and compare test, followed by an erase test:
> time mtd_debug write /dev/mtd5 0 6291456 nor_test
> time mtd_debug read /dev/mtd5 0 6291456 nor_read
> sha1sum nor_test nor_read
> time mtd_debug erase /dev/mtd5 0 6291456
> time mtd_debug read /dev/mtd5 0 6291456 nor_read
> hexdump nor_read

Looks good to me. See below for test outputs. Thank you for all your hard work
on this.

Tested-by: Chris Morgan <macromorgan@hotmail.com>

# cat /sys/bus/spi/devices/spi2.0/spi-nor/jedec_id
0b4018

# cat /sys/bus/spi/devices/spi2.0/spi-nor/manufacturer
xtx

# cat /sys/bus/spi/devices/spi2.0/spi-nor/partname
xt25f128b

# xxd -p /sys/bus/spi/devices/spi2.0/spi-nor/sfdp
53464450000101ff00000109300000ff0b000103600000ffffffffffffff
ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
083b42bbeeffffffffff00ffffff00ff0c200f5210d800ffffffffffffff
ffffffffffff003600279ff97764d9e8ffff

# sha1sum /sys/bus/spi/devices/spi2.0/spi-nor/sfdp
191346c29bddd9ea16bc59727c390df50687313f  /sys/bus/spi/devices/spi2.0/spi-nor/sfdp

# time mtd_debug erase /dev/mtd0 0 6291456
Erased 6291456 bytes from address 0x00000000 in flash

real    2m7.957s
user    0m0.001s
sys     2m7.868s

# time mtd_debug read /dev/mtd0 0 6291456 nor_read
Copied 6291456 bytes from address 0x00000000 in flash to nor_read

real    0m0.785s
user    0m0.000s
sys     0m0.259s

# hexdump nor_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000

# time mtd_debug write /dev/mtd0 0 6291456 nor_test
Copied 6291456 bytes from nor_test to address 0x00000000 in flash

real    0m8.851s
user    0m0.000s
sys     0m6.020s

# time mtd_debug read /dev/mtd0 0 6291456 nor_read
Copied 6291456 bytes from address 0x00000000 in flash to nor_read

real    0m0.811s
user    0m0.000s
sys     0m0.285s

# sha1sum nor_test nor_read
1404362fff3b2f8a79f8090901a5276e66598b72  nor_test
1404362fff3b2f8a79f8090901a5276e66598b72  nor_read

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
