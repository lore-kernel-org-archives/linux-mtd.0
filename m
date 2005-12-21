Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EoyLO-0001VB-6Y
	for linux-mtd@lists.infradead.org; Wed, 21 Dec 2005 02:25:10 -0500
Received: from ep_mmp1 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0IRU00DA679LOU@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 21 Dec 2005 16:24:58 +0900 (KST)
Received: from july7 ([10.88.163.199])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0IRU00ACJ79L6E@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 21 Dec 2005 16:24:57 +0900 (KST)
Date: Wed, 21 Dec 2005 16:24:57 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
In-reply-to: <1134990437.31513.9.camel@localhost.localdomain>
To: "'zhao, forrest'" <forrest.zhao@intel.com>,
	'Christian Lehne' <christian_lehne@gmx.de>
Message-id: <0IRU00ACK79L6E@mmp1.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Cc: 'Jarkko Lavinen' <jarkko.lavinen@nokia.com>, tglx@linutronix.de,
	linux-mtd@lists.infradead.org, priewasser@gmail.com
Subject: RE: EBH with OneNAND doesn't work
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

As you know the OneNAND has only 16bit bandwidth
When you access OneNAND with 8bit bandwidth, OneNAND can't work correctly

In the previous JFFS2 w/o EBH, there's no problem with OOB. 
But JFFS2 w/ EBH is different. we have to handle byte access in OneNAND

The previous patch is handle byte without optimized memory copy
The following patch handles only byte offset. 

Please apply the following patch and test again 

Thank you
Kyungmin Park

p.s, Does it need to check byte access in 'offset', I never see that case.

Index: drivers/mtd/onenand/onenand_base.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/onenand/onenand_base.c,v
retrieving revision 1.12
diff -u -p -r1.12 onenand_base.c
--- drivers/mtd/onenand/onenand_base.c	21 Dec 2005 04:59:19 -0000	1.12
+++ drivers/mtd/onenand/onenand_base.c	21 Dec 2005 07:05:16 -0000
@@ -373,6 +373,17 @@ static int onenand_read_bufferram(struct
 
 	bufferram += onenand_bufferram_offset(mtd, area);
 
+	if (ONENAND_CHECK_BYTE_ACCESS(count)) {
+		unsigned short word;
+
+		/* Align with word(16-bit) size */
+		count--;
+
+		/* Read word and save byte */
+		word = this->read_word(bufferram + offset + count);
+		buffer[count] = (word & 0xff);
+	}
+
 	memcpy(buffer, bufferram + offset, count);
 
 	return 0;
@@ -400,6 +411,17 @@ static int onenand_sync_read_bufferram(s
 
 	this->mmcontrol(mtd, ONENAND_SYS_CFG1_SYNC_READ);
 
+	if (ONENAND_CHECK_BYTE_ACCESS(count)) {
+		unsigned short word;
+
+		/* Align with word(16-bit) size */
+		count--;
+
+		/* Read word and save byte */
+		word = this->read_word(bufferram + offset + count);
+		buffer[count] = (word & 0xff);
+	}
+
 	memcpy(buffer, bufferram + offset, count);
 
 	this->mmcontrol(mtd, 0);
@@ -427,6 +449,22 @@ static int onenand_write_bufferram(struc
 
 	bufferram += onenand_bufferram_offset(mtd, area);
 
+	if (ONENAND_CHECK_BYTE_ACCESS(count)) {
+		unsigned short word;
+		int byte_offset;
+
+		/* Align with word(16-bit) size */
+		count--;
+
+		/* Calculate byte access offset */
+		byte_offset = offset + count;
+
+		/* Read word and save byte */
+		word = this->read_word(bufferram + byte_offset);
+		word = (word & ~0xff) | buffer[count];
+		this->write_word(word, bufferram + byte_offset);
+	}
+
 	memcpy(bufferram + offset, buffer, count);
 
 	return 0;
Index: include/linux/mtd/onenand.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/onenand.h,v
retrieving revision 1.10
diff -u -p -r1.10 onenand.h
--- include/linux/mtd/onenand.h	21 Dec 2005 02:55:41 -0000	1.10
+++ include/linux/mtd/onenand.h	21 Dec 2005 07:05:16 -0000
@@ -130,6 +130,9 @@ struct onenand_chip {
 #define ONENAND_SET_SYS_CFG1(v, this)					\
 	(this->write_word(v, this->base + ONENAND_REG_SYS_CFG1))
 
+/* Check byte access in OneNAND */
+#define ONENAND_CHECK_BYTE_ACCESS(addr)		(addr & 0x1)
+
 /*
  * Options bits
  */

> > 
> > diff -uN ..
> > --- linux/drivers/mtd/onenand/onenand_base.c    2005-12-19
> > 10:46:37.000000000 +0100
> > +++ linux/drivers/mtd/onenand/onenand_base.c    2005-12-16
> > 02:02:11.000000000 +0100
> > @@ -33,8 +33,8 @@
> >                  56, 57, 58, 59, 60,
> >                  },
> >          .oobfree        = {
> > +               {14, 2}, { 2, 3}, {18, 3}, {30, 2},
> > +               {34, 3}, {46, 2}, {50, 3}, {62, 2} }
> > -               {2, 3}, {14, 2}, {18, 3}, {30, 2},
> > -               {24, 3}, {46, 2}, {40, 3}, {62, 2} }
> >   };
> > 
> >   /**
> > @@ -367,33 +367,12 @@
> >   {
> >          struct onenand_chip *this = mtd->priv;
> >          void __iomem *bufferram;
> > +       unsigned short *p;
> > +       int i;
> > 
> >          bufferram = this->base + area;
> > 
> >          bufferram += onenand_bufferram_offset(mtd, area);
> > 
> > +       p = (unsigned short *)buffer;
> > +       for (i=0; i< (count >> 1 ); i++)
> > +        p[i] = onenand_readw(bufferram + offset + 2*i);
> > +       if(count%2)
> > +               buffer[count-1] = (unsigned char) (0xff &
> > onenand_readw(bufferram + offset + count - 1));
> > +
> > -       memcpy(buffer, bufferram + offset, count);
> > 
> >          return 0;
> >   }
> > @@ -442,40 +421,12 @@
> >   {
> >          struct onenand_chip *this = mtd->priv;
> >          void __iomem *bufferram;
> > +       unsigned short *p;
> > +       int i;
> > 
> >          bufferram = this->base + area;
> > 
> >          bufferram += onenand_bufferram_offset(mtd, area);
> > 
> > +       p = (unsigned short *)buffer;
> > +       for (i=0; i< (count >> 1 ); i++){
> > +        onenand_writew(*p, bufferram + offset + 2 * i);
> > +        p++;
> > +       }
> > +       if(count%2)
> > +               printk("FATAL ERROR: 
> onenand_write_bufferram count is
> > odd : %x\n", count);
> > +       if(offset%2)
> > +               printk("FATAL ERROR: 
> onenand_write_bufferram offset is
> > odd : %x\n", offset);
> > +
> > -       memcpy(bufferram + offset, buffer, count);
> > 
> >          return 0;
> >   }
> > 

T
