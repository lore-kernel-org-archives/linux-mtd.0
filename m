Received: from mail.gmx.net ([213.165.64.20])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jf8mO-0003Wh-Hn
	for linux-mtd@lists.infradead.org; Fri, 28 Mar 2008 07:13:36 +0000
Received: from lyakh (helo=localhost)
	by axis700.grange with local-esmtp (Exim 4.63)
	(envelope-from <g.liakhovetski@gmx.de>) id 1Jf8mR-00014z-6e
	for linux-mtd@lists.infradead.org; Fri, 28 Mar 2008 08:13:39 +0100
Date: Fri, 28 Mar 2008 08:13:39 +0100 (CET)
From: Guennadi Liakhovetski <lg@denx.de>
To: linux-mtd@lists.infradead.org
Subject: NOR flash S29WS-N: buffered write doesn't work
Message-ID: <Pine.LNX.4.64.0803280808250.3527@axis700.grange>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all

The problem I'm experiencing is not in Linux, but in U-Boot, but I 
thought, maybe someone knows how to handle these chips on this list.

I've got the following problem: on a system with the Spansion S29WS256N 
NOR flash the buffered write mode doesn't work. Attempts to use 
CFG_FLASH_USE_BUFFER_WRITE produce

Writing to Flash... Flash buffer write timeout at address a1ff8000 data 
86c686c6Timeout writing to Flash

Interestingly, I can write up to one buffer (32 x 16-bit words) of data 
correctly at the beginning of a sector, but not the second or any further 
buffer.

I also noticed, that BDI2000 uses the MIRRORX16 flash type for these 
"MirrorBit" flash chips, but for "newer" ones according to a comment in 
the bdi2000 manual, one has to use the S29M32X16 type, "because of the 
used unlock address offset". Which also hints at differences between this 
and "older" chips.

Studying the datasheets of S29WS-N and S29GL-N indeed there is a 
difference - but not in unlock offsets, but in the address, where the data 
length has to be written. In S29GL-N the block length is written at the 
beginning of the respective erase sector, in S29WS-N - at the write 
address! And the present mtd driver - in U-Boot and in Linux - indeed 
writes at the sector start. I've changed the driver to write at the data 
address - but this didn't change anything. I verified that indeed the 
addressses are calculated correctly, and I still can write the first block 
in a sector - but not the second. For example, in a 32KB big sector at 
0xa1ff8000 a write

cp.b 0x80800000 0xa1ff8000 0x40

works, but

cp.b 0x80800000 0xa1ff8040 0x40

doesn't. In the latter case the standard procedure is to write the "length 
- 1", i.e., 31 (in words) to 0xa1ff8000 for all blocks in this sector. I 
modified the driver to write it to 0xa1ff8040, and it didn't help.

Does anyone know the problem and how shall it be solved?

Thanks
Guennadi
---
Guennadi Liakhovetski, Ph.D.

DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
