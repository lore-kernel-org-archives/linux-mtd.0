Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13TS60-0004bF-00
	for mtd-list@infradead.org; Mon, 28 Aug 2000 17:49:16 +0100
Date: Mon, 28 Aug 2000 18:50:18 +0200
From: Ciro Cattuto <ciro@prosa.it>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Miguel Freitas <miguel@cetuc.puc-rio.br>, mtd@infradead.org
Subject: GRUB on DOC: 2Mb issues
Message-ID: <20000828185018.A2777@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David,

since the only DiskOnChip I have is a 2 Mb one, I had to solve some issues
with makecsum.c and doc_stage1.S before being able to load/run GRUB as a
replacement firmware. The ROM IPL of the 2Mb DOC (or any DOC with page256==1,
I guess) loads the first 0x2000 bytes sequentially instead of loading half
of the first 0x4000 bytes, as you describe in mtd/grub/README. This requires
some modifications to makecsum.c in order to build a valid firmware image.
Also, doc_stage1.S doesn't support the addressing scheme needed for 2Mb DOCs,
so I had to make a few modifications to make it load GRUB-stage2.

The relevant cvs diffs follow. Notice: these mods make doc_stage1.S and
makecsum.c work _only_ for 2Mb DOCs! I'd like to merge this functionality
into the existing code, but I'll wait for your feedback. I'd use a simple
"#ifdef DOC_PAGE256" both in doc_stage1.S and makecsum.c, but in the long
run it would be nice to be able to access the page256 flag (mtd->priv->page256)
from userland (page256 in mtd_info_user?).

Cheers,

Ciro


Index: doc_stage1.S
===================================================================
RCS file: /home/cvs/mtd/grub/doc_stage1.S,v
retrieving revision 1.8
diff -r1.8 doc_stage1.S
166c166
< 		/* Send new READ command - is it READ0 or READ1? */
---
> 		/* Send new READ0 command */
169c169
< 	andb	$1,%ah
---
> 	xorb	%ah,%ah
176,177c176
< 		/* We sent bits 0-7, then 9-16, then 17-23 */
< 		/* Yes bit 8 is missing. Read the NAND flash specs */		
---
> 		/* We sent bits 0-7, then 8-15, then 16-23 */
182,186c181
< 			/* Bits 9-16 */
< 	shrw	$1,%dx
< 	.byte	0x80, 0xce /* orb adrbit16, %dh */
< adrbit16:	
< 	.byte	0	
---
> 			/* Bits 8-15 */
189c184
< 		/* Bits 17-23 are also zero */
---
> 		/* Bits 16-23 */
216,217d210
< 	addb	$0x80, %cs:adrbit16	/* Increase bit 16 */
< 	jnc	endloop			/* Did it overflow? */




Index: makecsum.c
===================================================================
RCS file: /home/cvs/mtd/grub/makecsum.c,v
retrieving revision 1.1
diff -r1.1 makecsum.c
5c5
< unsigned char buf[16384];
---
> unsigned char buf[8192];
12c12
< 	memset(buf, 0xff, 16384);
---
> 	memset(buf, 0xff, 8192);
61c61
< 	len = read(st2fd, buf+512, 16384-512);
---
> 	len = read(st2fd, buf+512, 8192-512);
73,74c73
< 	i=0;
< 	while (i<16384) {
---
> 	for (i=0 ; i<8192 ; i++)
76,79d74
< 		i++;
< 		if ((i >> 8)&1)
< 			i += 256;
< 	}
85c80
< 	len = write(outfd, buf, 16384);
---
> 	len = write(outfd, buf, 8192);
94,95c89,90
< 	if (len < 16384) {
< 		fprintf(stderr, "short write of output file (%d bytes < 16384)\n",
---
> 	if (len < 8192) {
> 		fprintf(stderr, "short write of output file (%d bytes < 8192)\n",
105c100
< 		len = read(st2fd, buf, 16384);
---
> 		len = read(st2fd, buf, 8192);



-- 
Ciro Cattuto, Open Source Developer, Linuxcare Italia SpA
Tel. +39.338.3002140  Fax +39.049.8036484 
ciro@linuxcare.com    http://www.linuxcare.com/
ciro@prosa.it         http://www.prosa.it/
Linuxcare. Support for the revolution.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
