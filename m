Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B60C38A2D
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Oct 2022 08:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:References:In-Reply-To:Cc:To:Subject:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjVbz5Yzo0gvF/eqgiLYYGJLWhhq/5CGM39yWaY+Tmk=; b=hMeY8Mlnt8JSeIiGfiZREfHLGM
	JP03dAcYKwmBSIEpHV8DSL+SdS3d/A1zzzrF1Y+SzUGR2FFKRjo2eK+HzauQvuwThxjxEL3HO+Qx0
	8z32IcsGALyJ4Bd1a0WoqAGvE922pCfd/x2X9xy54lwZ7s4pB9+sgNruP3ZtX6g/n5dSCm41lCpAR
	dNC9E7ETA9LRhwB2CEnp2Wv/WPrP67r6w+bFVVLPjF0S5kUp62hoLHQzmgK3CA+kDZ3T8dJzpyT6m
	svZuu3fo5BH4Qlx8lYtvc4QuuMvoMzbTyJL1zve6Z/t+QUFeDOWTu/zccEPYgWN4sH9LcjvMqXZDV
	C2r3vVBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onExy-004HIQ-GA; Tue, 25 Oct 2022 08:07:18 +0000
Received: from mail-am0eur02on2095.outbound.protection.outlook.com ([40.107.247.95] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onExw-004HHi-4J
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2022 08:07:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQ6Db4KAWhXU1Rtnjyjj5V/g33tIpi5bfxZET7ySQMk5Evl961AMtkRMzakxVGda4PC5b2P4q713gk7fq79NPdlBBUljoYQayZ+VelFI7fW3GHRp3tfYBCJIZhG73PJGelt3mVNsXSKP2l5BibhA0MWAiHi/Qc9fKOSl62kCMtUegoeALicyoGhMebqjhCOp2tXCt2wDmF8LgzXIWFZowBLw4EfUn65Uc/6cKCUxihrXFk0vnzFq8ryC9xsowyyd7ErYMCIxMEAmyG0Q8ix+thYp6EFELXNgMGbM2FLiOGlDCLoj2VD2+nrO4qzJAxgctR5x2fqnLrSkYTdE19RTiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQEr2CxtZjFzeBPhgmo1M//8ZriFqcebixY9uypYk9c=;
 b=G7SQzK6mKYsmIiPSJN3d/RbS9Yycb0a4/LrJiUYYCLOCiGeNDUieDDmwcpqUQgYM9vvlElwImD65Wx0SGcgbB4K8I4gSYm5D+TsLioNBZocEdErF6rI50wans4K/KTW5vtaSKOxrka7T8T7zWRwr5Th1qbhj2rQw7DLMbp/0eDbAt19eI2VW58fEoisxdcoYmF8SVbrEcYJ6jMLGrCu+bvZ9yDl8/DuGwxxDkfqrF98cNRbkYWFzFX/8IC825/dGCnE5E3quhSIRDSvGVl9+XISqmH3Q66L8UkcpRChHkb+A31FtcjnBTcAE/ShYg3IPsG1kXp44NQrE06/FZE8p2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=plvision.eu; dmarc=pass action=none header.from=plvision.eu;
 dkim=pass header.d=plvision.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plvision.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQEr2CxtZjFzeBPhgmo1M//8ZriFqcebixY9uypYk9c=;
 b=OppPAzS4lmHKURYW05njZ+5+KkefPo85CnQ4pgb7adxrncog9yPXrEQnQlLp/i3XWbuTzUwumBAwRdAsiG+X5NJfPMmfIuf8dOlEpQ3u2gcqYswi6UC6Bc26qQpaPlTyuEXHSqc943y/UQg9ElOJPY+ZQY5EUtPx/wAz5iPvU7s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=plvision.eu;
Received: from VI1P190MB0317.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:38::26)
 by DB8P190MB0796.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:125::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Tue, 25 Oct
 2022 08:07:09 +0000
Received: from VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
 ([fe80::2b03:a6ec:3529:b969]) by VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
 ([fe80::2b03:a6ec:3529:b969%5]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 08:07:09 +0000
Date: Tue, 25 Oct 2022 11:07:06 +0300
From: Vadym Kochan <vadym.kochan@plvision.eu>
Subject: Re: [PATCH] mtd: rawnand: marvell: add missing layouts
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Elad Nachman <enachman@marvell.com>,
	=?iso-8859-1?q?Chris=0A?= Packham <chris.packham@alliedtelesis.co.nz>,
	Aviram Dali <aviramd@marvell.com>
In-Reply-To: <20221025094748.7dda3a57@xps-13>
References: <20221024215531.32033-1-vadym.kochan@plvision.eu>
	<20221025094748.7dda3a57@xps-13>
X-ClientProxiedBy: AS9PR06CA0501.eurprd06.prod.outlook.com
 (2603:10a6:20b:49b::26) To VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:38::26)
Message-ID:  <VI1P190MB0317725ACC6A276932060BF595319@VI1P190MB0317.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P190MB0317:EE_|DB8P190MB0796:EE_
X-MS-Office365-Filtering-Correlation-Id: 391f9411-6e93-4113-c752-08dab65fea06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	aeZCv6Fn/SzPEx5AQZacUl9zMPadat9gif7t6VFq2E5ecm7WovNeC5O39QokCyE+hZPa6H9smk+WHqT6WGRe4YnG4Y7kppmlEVEOjaNWYVbniMCgTZgf3VPLjOTWatHXdHL7EE6bX8tNvW7LB171h2uZY1SSfgQ/WKeO/4uRnrpn4iZ/NhFXGErviqd0ds5ZfO14DHviFFMgno6B9ERc5vGCZ74bcFSKP3/ocFVbUQg+g0YpLDokyPSEb3W4Tz8p74rDWQW3i8yx67LNTVlprd2ODi4K7M6h2sFHvO5tHcKTFkzCyEWV/Wyf+R0KH79av3wZIzcmMFN6h2cruigH7Kl5N/dq8LlojrmhVsnNfzbjRrx9OFzPWhgqeyu5kRYlINo9ieE+PwMcomx7kHEHI1l5VvQ+uUtbAlyo+/nnI+yJfp9rbc51vs5CIWO0lCDIX3HDUZvMzR7FtazQXJUdU0zMgnwBMNywr3YOUencqyBYtYSYsDsFhze+3yfMOpJb8TmyejgIDP27zv0qSZnOet3RXaDJ73KDTKfVXWHlTR+BQE+OnGZA4KLs5v/L3BTFJxkGEZFY+OhlJQXf1PkKxldEygNTbr11ih4Erdk22dJks5gsRcA8tFGjAUBPyhgYCmh1WVOb4k7taUjoY4x/jcKog2xZKi/7iy235R5mpxlgng1oR0hN5BYmeQ3yOQBGNX0nLuJwU1RRWIBQnMSagqQmdjG88r6zssJEkwGOZIQ7LyycGdjtVNmoyeF1XM1F
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P190MB0317.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(34036004)(346002)(396003)(366004)(39840400004)(376002)(136003)(451199015)(83380400001)(66476007)(186003)(86362001)(44832011)(38100700002)(38350700002)(2906002)(8936002)(41300700001)(41320700001)(5660300002)(55016003)(52536014)(508600001)(52116002)(19627235002)(6666004)(26005)(54906003)(7696005)(6506007)(316002)(4326008)(66556008)(66946007)(8676002)(6916009)(33656002)(9686003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?yZwJIrSKNJLp3ABplUNvW4QXjw+he00b+2C+Mnd1N5SGDPC7hzyDTjTlKH2w?=
 =?us-ascii?Q?t5rZfH+6gN3dzL+q8U7/VWuJI3N9MIvCuX+U5jbYl8NoU+oXAGomt7MQyk+x?=
 =?us-ascii?Q?bcjd7hhQTPqXB63pG9YA9i3H02aBLJMcOmY1mK1iEHEgFI/dBKm2uhH94j6F?=
 =?us-ascii?Q?EEFFaTQsOPiC8jZ/pk3g7jVObp59J9zfHI5x72f2f8u3t/cUe+yupYo6h2qB?=
 =?us-ascii?Q?iBl4wcCDfGjWs3YlxJhzgsrJz0dznidGtohfD+K4+4kGYj2z2rN5pC6eYdNt?=
 =?us-ascii?Q?UYVUAuF93WBOeEDLRQwV8NZDtiQYJwHsIJeOOgwlV06dCwdqzHY8n2qckn1q?=
 =?us-ascii?Q?1gOI8pjMn19VC0Zwivdw+CMxTFcUF6zxDpcny7wNjI0hw2GwMEJRBIfHeTYP?=
 =?us-ascii?Q?T06tHLcKMgPWVUpdfa2a3YFMYU9+JLRGlH5Lix5e0zKbBWPS8l8gDhwwIWae?=
 =?us-ascii?Q?itk9VjPGhE6k6LEx/b5p3IZ028OimB2UVKkgeC7BLarkOPHTxQv8nvL803gr?=
 =?us-ascii?Q?cZCMZPHFHR5RbkUwYt5pyjGFAPrY1oeLMqmBjiWxsa25K6KNIDbmpPBLALte?=
 =?us-ascii?Q?uKMrk2GNceG9jwXOzw8URJBUUrwpeTSg87HbDdLHfk04CTarhrIfc/rnKXhT?=
 =?us-ascii?Q?D+f9AiHrQ/cKpsOaBsBYhzN0ZapSMe3LwMgAl7Gy05dvF2a3MarmK2MLHple?=
 =?us-ascii?Q?I+/BYmWEFESikoYIpKl9gIv7Cn6lZ71C5p9+9A4lkZTB3VonKYFU/vfGPGiq?=
 =?us-ascii?Q?m+RsXRECOfa7+8mpHiAQLQDoOHPqVdIO8y71whBf8uGBwz8Qd7iH2yZeUw2c?=
 =?us-ascii?Q?CDxmBT9tsFIUZovAbhsk8xhU1up4MA5t3k1EpQtSF1PMFuwaAmUvQ9A178TE?=
 =?us-ascii?Q?zaE4UyXXaN5HgFJ2IQPUig/yqEz9l9comg0lKGTKSIff9eSLf7nX7vlgLcoU?=
 =?us-ascii?Q?ZOV6n291sbIHSTocrC5X2QlcyVhmZPAZht7J4jlJsLlRyemrx+0DJkioSV5I?=
 =?us-ascii?Q?suNfy6xwZ5+ZfMJSueG5Tfi99M14O9KIFlouNzlneVJQhLvBg/0ycLuzjyKl?=
 =?us-ascii?Q?SCDxpeWF/JOKOpOqiNrOzlkCf6j7hI3tmSHRPLyM8AzRkMCaHZe6q/hinNoL?=
 =?us-ascii?Q?P4chQDaXMQWt0rTldG6vEJg0o+M3zhJKInaRAg8INxPo8xB3Tw6ge7MpI7og?=
 =?us-ascii?Q?guUDNkzlnBwaVw9k+zxSsac2MsTs5LS6dMaYKgZq0yRNTNUP9LNqovKV7sf5?=
 =?us-ascii?Q?FZ+ZOJq8wmbpbLcyRCCK/f5mHoCf8UeBI2yOsvbNSPuMg9dbIGSyLLSm6aFo?=
 =?us-ascii?Q?nkDoIq0/AXuB80MecZqnAZZg1Gvok1oXjKFDSFPLpEUA3dWVLGbBG0VVnqaV?=
 =?us-ascii?Q?bnqDNvREinLAX6wNKMb2GFo44hu7mTIbK0iEeqfuaOC2bfLhCbIuAfQ9Hm6S?=
 =?us-ascii?Q?fCr/3XujW1s48WkvO1FPxljr/7+LujADTLRsaIlXq5rrLo46uW+NM881U/80?=
 =?us-ascii?Q?SKhqE0o8NOlxceMNSvBccDXan6JhD8vBRrnK0V5lutax9dnA/8k5wawCjomY?=
 =?us-ascii?Q?3ixc1nqeNUmMlu6Ctd03ggAL64uTkmOk7fjVf7+GprGS95N+k/aeW4i+oK/J?=
 =?us-ascii?Q?tA=3D=3D?=
X-OriginatorOrg: plvision.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 391f9411-6e93-4113-c752-08dab65fea06
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 08:07:09.2370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 03707b74-30f3-46b6-a0e0-ff0a7438c9c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KvGX1dJeNn3RWiMWp2PSSADsdeD0NAVc5nGNiDJivMIZqafDBLsfBqt2mVPcd8mpJPBUBbkUGOjQArNo01WIscKlJcgPiffX/S3B0iZNpR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P190MB0796
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_010716_409953_309CA610 
X-CRM114-Status: GOOD (  19.25  )
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
Content-Type: multipart/mixed; boundary="===============3597065493099439125=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3597065493099439125==
Content-Type: text/plain

Hi Miquel,

On Tue, 25 Oct 2022 09:47:48 +0200, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> Hi Vadym,
> 
> vadym.kochan@plvision.eu wrote on Tue, 25 Oct 2022 00:55:31 +0300:
> 
> > From: Aviram Dali <aviramd@marvell.com>
> > 
> > A missing layouts were added to the driver to support NAND flashes
> > with ECC layouts of 12 or 16 with page sized of 2048, 4096 or 8192.
> > 
> > Usually theses are rare layouts, but in Marvell AC5 driver, the ECC
> > level is set according to the spare area, so we may use these layouts
> > more frequently.
> 
> Again, please do not carry cosmetic changes and real new additions in
> the same patch.
> 

You are right, it is difficult to see the real changes. Will try to
make diff to look more clear.


> > 
> > Signed-off-by: Aviram Dali <aviramd@marvell.com>
> > Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> > ---
> >  drivers/mtd/nand/raw/marvell_nand.c | 23 +++++++++++++++--------
> >  1 file changed, 15 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> > index b9d1e96e3334..7944787f7b9f 100644
> > --- a/drivers/mtd/nand/raw/marvell_nand.c
> > +++ b/drivers/mtd/nand/raw/marvell_nand.c
> > @@ -283,14 +283,21 @@ struct marvell_hw_ecc_layout {
> >  
> >  /* Layouts explained in AN-379_Marvell_SoC_NFC_ECC */
> >  static const struct marvell_hw_ecc_layout marvell_nfc_layouts[] = {
> > -	MARVELL_LAYOUT(  512,   512,  1,  1,  1,  512,  8,  8,  0,  0,  0),
> > -	MARVELL_LAYOUT( 2048,   512,  1,  1,  1, 2048, 40, 24,  0,  0,  0),
> > -	MARVELL_LAYOUT( 2048,   512,  4,  1,  1, 2048, 32, 30,  0,  0,  0),
> > -	MARVELL_LAYOUT( 2048,   512,  8,  2,  1, 1024,  0, 30,1024,32, 30),
> > -	MARVELL_LAYOUT( 4096,   512,  4,  2,  2, 2048, 32, 30,  0,  0,  0),
> > -	MARVELL_LAYOUT( 4096,   512,  8,  5,  4, 1024,  0, 30,  0, 64, 30),
> > -	MARVELL_LAYOUT( 8192,   512,  4,  4,  4, 2048,  0, 30,  0,  0,  0),
> > -	MARVELL_LAYOUT( 8192,   512,  8,  9,  8, 1024,  0, 30,  0, 160, 30),
> > +	MARVELL_LAYOUT(512,   512,  1,  1,  1,  512,  8,  8,  0,   0,  0),
> > +	MARVELL_LAYOUT(2048,   512,  1,  1,  1, 2048, 40, 24,  0,   0,  0),
> > +	MARVELL_LAYOUT(2048,   512,  4,  1,  1, 2048, 32, 30,  0,   0,  0),
> > +	MARVELL_LAYOUT(2048,   512,  8,  2,  1, 1024,  0, 30,  1024, 32, 30),
> > +	MARVELL_LAYOUT(2048,   512,  8,  2,  1, 1024,  0, 30,  1024, 64, 30),
> > +	MARVELL_LAYOUT(2048,   512,  12, 3,  2, 704,   0, 30,  640, 0,  30),
> > +	MARVELL_LAYOUT(2048,   512,  16, 5,  4, 512,   0, 30,  0,   32, 30),
> > +	MARVELL_LAYOUT(4096,   512,  4,  2,  2, 2048, 32, 30,  0,   0,  0),
> > +	MARVELL_LAYOUT(4096,   512,  8,  5,  4, 1024,  0, 30,  0,   64, 30),
> > +	MARVELL_LAYOUT(4096,   512,  12, 6,  5, 704,   0, 30,  576, 32, 30),
> > +	MARVELL_LAYOUT(4096,   512,  16, 9,  8, 512,   0, 30,  0,   32, 30),
> > +	MARVELL_LAYOUT(8192,   512,  4,  4,  4, 2048,  0, 30,  0,   0,  0),
> > +	MARVELL_LAYOUT(8192,   512,  8,  9,  8, 1024,  0, 30,  0,  160, 30),
> > +	MARVELL_LAYOUT(8192,   512,  12, 12, 11, 704,  0, 30,  448, 64, 30),
> > +	MARVELL_LAYOUT(8192,   512,  16, 17, 16, 512,  0, 30,  0,   32, 30),
> >  };
> >  
> >  /**
> 
> 
> Thanks,
> Miquèl


--===============3597065493099439125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3597065493099439125==--
