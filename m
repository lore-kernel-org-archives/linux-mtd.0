Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMhun-0003dy-QJ
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2013 17:21:18 +0000
From: Marek Vasut <marex@denx.de>
To: Hector Palacios <hector.palacios@digi.com>
Subject: Re: gpmi-nand driver and jffs2 support
Date: Thu, 19 Sep 2013 19:20:53 +0200
References: <522062B4.4080709@digi.com> <201309191807.21140.marex@denx.de>
 <523B22D6.8050303@digi.com>
In-Reply-To: <523B22D6.8050303@digi.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201309191920.53621.marex@denx.de>
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Fabio Estevam <festevam@gmail.com>, Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "scottwood@freescale.com" <scottwood@freescale.com>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Hector Palacios,

> On 09/19/2013 06:07 PM, Marek Vasut wrote:
> > Dear Huang Shijie,
> > 
> > Sorry, I think I got lost in the discussion. I will pull out.
> > 
> > btw Hector, I managed to verify JFFS2 mounting doesn't work on 3.10 , now
> > I'm trying to backport patches from -next and apply the GPMI NAND
> > patchset, without much luck yet.
> 
> Oops, sorry, did you mean you were trying to backport them into U-Boot?
> Then please disregards my previous message.

After applying the batch of patches, this is what I get. Interestingly enough, 
this JFFS2 was written from FSL 2.6.35 kernel.

[   24.118091] jffs2: mtd->read(0x100 bytes from 0x0) returned ECC error
[   24.164458] jffs2: mtd->read(0x1fa34 bytes from 0x5cc) returned ECC error
[   24.171377] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
0x000005cc: 0x7953 i
nstead
[   24.180969] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
0x000005d0: 0xe837 i
nstead
[   24.190675] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
0x000005d8: 0x85ff i
nstead
[   24.200274] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
0x000005dc: 0xcde0 i
nstead
[   24.209853] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
0x000005e0: 0x7000 i
nstead
[   24.219428] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
0x000005e4: 0x020f i
nstead
[   24.229000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
0x000005e8: 0x0200 i
nstead
[   24.238570] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
0x000005ec: 0x2400 i
nstead
[   24.248142] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
0x000005f4: 0xa400 i
nstead
[   24.257645] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
0x00000608: 0xacc8 i
nstead
[   24.267191] jffs2: Further such events for this erase block will not be 
printed
[   24.275419] jffs2: jffs2_scan_inode_node(): CRC failed on node at 0x000021c8: 
Read 0x00000000, cal
culated 0xd5be0e0f
[   24.287221] jffs2: jffs2_scan_inode_node(): CRC failed on node at 0x000049d4: 
Read 0xd1f00000, cal
culated 0x34cb9a56
[   24.300900] jffs2: jffs2_scan_inode_node(): CRC failed on node at 0x0000b9c0: 
Read 0x7fd74190, cal                                                                       
culated 0xfdbc37a5                                                                                                                                                          
[   24.312171] jffs2: jffs2_scan_inode_node(): CRC failed on node at 0x0000d1f4: 
Read 0x16600000, cal                                                                       
culated 0x00cb3014                                                                                                                                                          
[   24.326509] jffs2: jffs2_scan_inode_node(): CRC failed on node at 0x000161d4: 
Read 0x9a500000, cal                                                                       
culated 0xcd68c7e3                                                                                                                                                          
[   24.338761] jffs2: jffs2_scan_inode_node(): CRC failed on node at 0x0001a1e4: 
Read 0x14500000, cal                                                                       
culated 0xa3e78a6c                                                                                                                                                          
[   24.352739] jffs2: mtd->read(0xc28 bytes from 0x1f3d8) returned ECC error                                                                                                
[   24.359661] jffs2: Empty flash at 0x0001f3d4 ends at 0x0001f400                                                                                                          
[   24.366953] jffs2: mtd->read(0xbec bytes from 0x1f414) returned ECC error                                                                                                
[   24.374053] jffs2: Empty flash at 0x0001f410 ends at 0x0001f604                                                                                                          
[   24.381408] jffs2: mtd->read(0x9e8 bytes from 0x1f618) returned ECC error                                                                                                
[   24.388450] jffs2: Empty flash at 0x0001f614 ends at 0x0001fa00                                                                                                          
[   24.395141] jffs2: mtd->read(0x5f4 bytes from 0x1fa0c) returned ECC error                                                                                                
[   24.402059] jffs2: Empty flash at 0x0001fa08 ends at 0x0001fc00                                                                                                          
[   24.408794] jffs2: mtd->read(0x3ec bytes from 0x1fc14) returned ECC error
[   24.415615] jffs2: Empty flash at 0x0001fc10 ends at 0x0001fca8
[   24.422351] jffs2: mtd->read(0x350 bytes from 0x1fcb0) returned ECC error
[   24.429262] jffs2: Empty flash at 0x0001fcac ends at 0x0001fe04
[   24.435930] jffs2: mtd->read(0x1e8 bytes from 0x1fe18) returned ECC error
[   24.443789] jffs2: mtd->read(0x100 bytes from 0x20000) returned ECC error
[   24.491452] jffs2: mtd->read(0x1f964 bytes from 0x2069c) returned ECC error

Best regards,
Marek Vasut
