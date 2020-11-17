Return-Path: <SRS0=l5Rv=EX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9963BC2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 10:17:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C2B4221FC
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 10:17:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DurL36PL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C2B4221FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Date:To:From:Message-ID:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+qvt1k0DvBjCagucqS6zkYZSYz29BLJFxeZDsOgG5kg=; b=DurL36PLILtTeCkNOCKqoU7FAU
	PNDsKuwDMzU5c429sAhUy1XoToNAq0JeCscxU6ixaZDyQD+eKX5bOGiZAWqe10bNG/og5H9mpf3X1
	HoXF3hzpKIWACH5VhP+RVxzcabgs7lFDpaYNuR9OXDOIgAH0NH1hLOgIhOmQo/DwgjoprClW1vKRA
	dSJhXHZ8eTcM6MYQOsOxhfMCntRsXf0AkmA/vCjufqkzu6Bj24iQiCTNBS1Ox3efcSPsbTEJoRwz6
	51mcY+DXKa6YUzW4GoPvMqNkoyBJrfc7RWPzH8dvKSa5E8a9sbUnQ2eaqwB1azymuWyoK2w+Xu+Tn
	222Hs6ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1key2R-0005os-Oq; Tue, 17 Nov 2020 10:16:39 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1key2K-0005oL-GE
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2020 10:16:33 +0000
Received: from [2a0a:edc0:0:900:2e4d:54ff:fe67:bfa5] (helo=ginster)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <jbe@pengutronix.de>)
 id 1key2G-00021H-3e; Tue, 17 Nov 2020 11:16:29 +0100
Message-ID: <315838324eb25d3a1ab37ee90fa28fa1cdc48cae.camel@pengutronix.de>
From: Juergen Borleis <jbe@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Date: Tue, 17 Nov 2020 11:16:26 +0100
Organization: Pengutronix e.K.
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:2e4d:54ff:fe67:bfa5
X-SA-Exim-Mail-From: jbe@pengutronix.de
Subject: mtd: rawnand: gpmi: regression since
 e5e5631cc88987a6f3cd8304660bd9190da95916
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_051632_673898_6763D97C 
X-CRM114-Status: GOOD (  12.62  )
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
Reply-To: jbe@pengutronix.de
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 kernel@pengutronix.de, Han Xu <han.xu@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

reading a NAND page in raw mode is required to check the consistence of the so-
called FCBs (used to boot the SoC from NAND content).

Before e5e5631cc88987a6f3cd8304660bd9190da95916 ("mtd: rawnand: gpmi: Use
nand_extract_bits()") it reads the first page of the NAND correctly as:

00000000  00 00 88 fb ff ff 46 43  42 20 00 00 00 01 50 3c  |......FCB ....P<|
00000010  19 06 00 00 00 00 00 08  00 00 80 08 00 00 40 00  |..............@.|
00000020  00 00 00 00 00 00 00 00  00 00 00 00 00 00 09 00  |................|
00000030  00 00 00 02 00 00 00 02  00 00 09 00 00 00 0a 00  |................|
00000040  00 00 03 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00000050  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00000060  00 00 00 00 00 00 00 00  00 00 00 01 00 00 80 10  |................|
00000070  00 00 55 01 00 00 55 01  00 00 01 00 00 00 9e 07  |..U...U.........|
00000080  00 00 02 00 00 00 00 08  00 00 00 00 00 00 00 00  |................|
00000090  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000200  40 05 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |@...............|
00000210  40 01 00 00 00 80 05 00  00 80 05 00 40 01 00 00  |@...........@...|
00000220  c0 03 00 00 80 02 00 00  00 00 00 00 00 00 00 00  |................|
00000230  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00000240  00 00 00 00 00 00 00 00  00 00 00 00 00 00 07 00  |................|
00000250  80 83 06 00 00 00 07 00  00 00 07 00 00 07 00 00  |................|
00000260  00 42 06 00 80 05 00 00  00 40 06 00 00 00 00 00  |.B.......@......|
00000270  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000790  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 fc  |................|
000007a0  03 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
000007b0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000800  ff 00 00 00 00 00 00 00  00 00 00 00 17 15 06 06  |................|
00000810  10 1f 03 07 00 00 00 1c  0f 17 1f 05 00 00 00 00  |................|
00000820  00 19 00 00 0e 19 00 00  00 00 00 00 00 00 00 00  |................|
00000830  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000880

After applying e5e5631cc88987a6f3cd8304660bd9190da95916 reading the same page
the reported content is broken (the NAND page still contains correct data):

00000000  00 00 88 fb ff ff 46 43  42 20 00 00 00 01 50 3c  |......FCB ....P<|
00000010  19 06 00 00 00 00 00 08  00 00 80 08 00 00 40 00  |..............@.|
00000020  00 00 00 00 00 00 00 00  00 00 00 00 00 00 09 00  |................|
00000030  00 00 00 02 00 00 00 02  00 00 09 00 00 00 0a 00  |................|
00000040  40 05 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |@...............|
00000050  40 01 00 00 00 80 05 00  00 80 05 00 40 01 00 00  |@...........@...|
00000060  c0 03 00 00 80 02 00 00  00 00 00 00 00 00 00 00  |................|
00000070  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000250  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 fc  |................|
00000260  03 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00000270  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
000002c0  06 70 c0 a8 00 00 00 00  00 00 00 00 40 00 00 00  |.p..........@...|
000002d0  10 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
000002e0  00 00 00 00 00 01 00 00  10 00 00 00 fe 80 00 00  |................|
000002f0  00 00 00 00 52 2d f4 ff  fe 0a f9 6b 80 00 00 00  |....R-.....k....|
00000300  10 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00000310  00 00 00 00 00 00 00 00  10 00 00 00 fe 80 00 00  |................|
00000320  00 00 00 00 00 00 00 00  00 00 00 00 40 00 00 00  |............@...|
00000330  10 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00000340  00 00 00 00 00 01 00 00  10 00 00 00 ff 00 00 00  |................|
00000350  00 00 00 00 00 00 00 00  00 00 00 00 08 00 00 00  |................|
00000360  10 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00000370  00 00 00 00 00 01 00 00  09 00 00 00 52 6f 75 74  |............Rout|
00000380  65 44 61 74 61 00 06 61  61 7b 73 76 7d 00 00 00  |eData..aa{sv}...|
00000390  28 02 00 00 64 00 00 00  04 00 00 00 64 65 73 74  |(...d.......dest|
000003a0  00 01 73 00 25 00 00 00  32 30 30 31 3a 36 37 63  |..s.%...2001:67c|
000003b0  3a 36 37 30 3a 63 30 61  38 3a 35 32 32 64 3a 66  |:670:c0a8:522d:f|
000003c0  34 66 66 3a 66 65 30 61  3a 66 39 36 62 00 00 00  |4ff:fe0a:f96b...|
000003d0  06 00 00 00 70 72 65 66  69 78 00 01 75 00 00 00  |....prefix..u...|
000003e0  80 00 00 00 00 00 00 00  06 00 00 00 6d 65 74 72  |............metr|
000003f0  69 63 00 01 75 00 00 00  00 00 00 00 54 00 00 00  |ic..u.......T...|
00000400  00 b0 c8 ec 64 65 73 74  00 01 73 00 13 00 00 00  |....dest..s.....|
00000410  32 30 30 31 3a 36 37 63  3a 36 37 30 3a 63 30 61  |2001:67c:670:c0a|
00000420  38 3a 3a 00 00 00 00 00  06 00 00 00 70 72 65 66  |8::.........pref|
00000430  69 78 00 01 75 00 00 00  40 00 00 00 00 00 00 00  |ix..u...@.......|
00000440  06 00 00 00 6d 65 74 72  69 63 00 01 75 00 00 00  |....metric..u...|
00000450  00 01 00 00 5c 00 00 00  04 00 00 00 64 65 73 74  |....\.......dest|
00000460  00 01 73 00 19 00 00 00  66 65 38 30 3a 3a 35 32  |..s.....fe80::52|
00000470  32 64 3a 66 34 66 66 3a  66 65 30 61 3a 66 39 36  |2d:f4ff:fe0a:f96|
00000480  62 00 00 00 00 00 00 00  06 00 00 00 70 72 65 66  |b...........pref|
00000490  69 78 00 01 75 00 00 00  80 00 00 00 00 00 00 00  |ix..u...........|
000004a0  06 00 00 00 6d 65 74 72  69 63 00 01 75 00 00 00  |....metric..u...|
000004b0  00 00 00 00 44 00 00 00  04 00 00 00 64 65 73 74  |....D.......dest|
000004c0  00 01 73 00 06 00 00 00  66 65 38 30 3a 3a 00 00  |..s.....fe80::..|
000004d0  06 00 00 00 70 72 65 66  69 78 00 01 75 00 00 00  |....prefix..u...|
000004e0  40 00 00 00 00 00 00 00  06 00 00 00 6d 65 74 72  |@...........metr|
000004f0  69 63 00 01 75 00 00 00  00 01 00 00 44 00 00 00  |ic..u.......D...|
00000500  04 00 00 00 64 65 73 74  00 01 73 00 06 00 00 00  |....dest..s.....|
00000510  66 66 30 30 3a 3a 00 00  06 00 00 00 70 72 65 66  |ff00::......pref|
00000520  69 78 00 01 75 00 00 00  08 00 00 00 00 00 00 00  |ix..u...........|
00000530  06 00 00 00 6d 65 74 72  69 63 00 01 75 00 00 00  |....metric..u...|
00000540  00 01 00 00 74 00 00 00  04 00 00 00 64 65 73 74  |....t.......dest|
00000550  00 01 73 00 02 00 00 00  3a 3a 00 00 00 00 00 00  |..s.....::......|
00000560  06 00 00 00 70 72 65 66  69 78 00 01 75 00 00 00  |....prefix..u...|
00000570  00 00 00 00 00 00 00 00  08 00 00 00 6e 65 78 74  |............next|
00000580  2d 68 6f 70 00 01 73 00  17 00 00 00 66 65 38 30  |-hop..s.....fe80|
00000590  3a 3a 35 30 35 34 3a 66  66 3a 66 65 62 33 3a 61  |::5054:ff:feb3:a|
000005a0  35 66 62 00 00 00 00 00  06 00 00 00 6d 65 74 72  |5fb.........metr|
000005b0  69 63 00 01 75 00 00 00  00 04 00 00 00 00 00 00  |ic..u...........|
000005c0  0b 00 00 00 4e 61 6d 65  73 65 72 76 65 72 73 00  |....Nameservers.|
000005d0  03 61 61 79 00 00 00 00  00 00 00 00 00 00 00 00  |.aay............|
000005e0  07 00 00 00 44 6f 6d 61  69 6e 73 00 02 61 73 00  |....Domains..as.|
000005f0  00 00 00 00 00 00 00 00  08 00 00 00 53 65 61 72  |............Sear|
00000600  63 68 65 73 00 02 61 73  00 00 00 00 00 00 00 00  |ches..as........|
00000610  0a 00 00 00 44 6e 73 4f  70 74 69 6f 6e 73 00 02  |....DnsOptions..|
00000620  61 73 00 00 00 00 00 00  0b 00 00 00 44 6e 73 50  |as..........DnsP|
00000630  72 69 6f 72 69 74 79 00  01 69 00 00 64 00 00 00  |riority..i..d...|
00000640  09 00 00 00 46 6c 6f 77  4c 61 62 65 6c 00 01 75  |....FlowLabel..u|
00000650  00 00 00 00 00 00 00 00  05 00 00 00 46 6c 61 67  |............Flag|
00000660  73 00 01 75 00 00 00 00  00 00 00 00 30 02 30 02  |s..u........0.0.|
00000670  30 02 30 02 30 02 30 02  30 02 30 02 30 02 30 02  |0.0.0.0.0.0.0.0.|
00000680  30 02 30 02 30 02 30 02  30 02 30 02 30 02 72 00  |0.0.0.0.0.0.0.r.|
00000690  72 00 72 00 31 02 31 02  31 02 31 02 31 02 31 02  |r.r.1.1.1.1.1.1.|
000006a0  31 02 31 02 31 02 31 02  31 02 31 02 31 02 31 02  |1.1.1.1.1.1.1.1.|
*
000006f0  31 02 31 02 31 02 72 00  72 00 72 00 72 00 72 00  |1.1.1.r.r.r.r.r.|
00000700  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000720  01 00 00 00 00 00 00 00  17 00 17 00 17 00 17 00  |................|
00000730  17 00 17 00 17 00 17 00  17 00 17 00 17 00 17 00  |................|
00000740  17 00 17 00 17 00 17 00  17 00 17 00 72 00 72 00  |............r.r.|
00000750  72 00 72 00 32 02 32 02  32 02 32 02 32 02 32 02  |r.r.2.2.2.2.2.2.|
00000760  32 02 32 02 32 02 32 02  32 02 32 02 32 02 32 02  |2.2.2.2.2.2.2.2.|
*
00000790  32 02 32 02 33 02 33 02  33 02 33 02 72 00 72 00  |2.2.3.3.3.3.r.r.|
000007a0  72 00 72 00 72 00 72 00  72 00 72 00 72 00 72 00  |r.r.r.r.r.r.r.r.|
000007b0  72 00 72 00 34 02 34 02  34 02 34 02 34 02 34 02  |r.r.4.4.4.4.4.4.|
000007c0  34 02 34 02 34 02 34 02  34 02 34 02 34 02 34 02  |4.4.4.4.4.4.4.4.|
000007d0  34 02 34 02 34 02 35 02  34 02 34 02 34 02 34 02  |4.4.4.5.4.4.4.4.|
000007e0  34 02 34 02 34 02 34 02  35 02 72 00 72 00 72 00  |4.4.4.4.5.r.r.r.|
000007f0  72 00 72 00 36 02 36 02  36 02 36 02 36 02 36 02  |r.r.6.6.6.6.6.6.|
00000800  ff 00 00 00 00 00 00 00  00 00 00 00 17 15 06 06  |................|
00000810  10 1f 03 07 00 00 00 1c  0f 17 1f 05 00 00 00 00  |................|
00000820  00 19 00 00 0e 19 00 00  00 00 00 00 00 00 00 00  |................|
00000830  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|

Juergen

-- 
Pengutronix e.K.                       | Juergen Borleis             |
Steuerwalder Str. 21                   | https://www.pengutronix.de/ |
31137 Hildesheim, Germany              | Phone: +49-5121-206917-128  |
Amtsgericht Hildesheim, HRA 2686       | Fax:   +49-5121-206917-9    |


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
