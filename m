From: robert@schwebel.de (Robert Schwebel)
Date: Sun, 2 Mar 2003 10:23:59 +0100
Subject: [PATCH] makefile bug and some cleanup
Message-ID: <20030302092359.GN15015@pengutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline

Here are two patches against current CVS; the first one fixes the
utils/Makefile, the second one removes some warnings for erase.c. 

Please apply. 

Robert
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Braunschweiger Str. 79,  31134 Hildesheim, Germany
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
    Phone: +49-5121-28619-0 |  Fax: +49-5121-28619-4

--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: attachment; filename="Makefile.diff"

Index: Makefile
===================================================================
RCS file: /home/cvs/mtd/util/Makefile,v
retrieving revision 1.28
diff -u -b -B -w -p -u -r1.28 Makefile
--- Makefile	18 Feb 2003 11:36:08 -0000	1.28
+++ Makefile	2 Mar 2003 09:17:40 -0000
@@ -24,12 +24,12 @@ $(SYMLINKS):
 	ln -sf ../fs/jffs2/$@ $@
 
 mkfs.jffs2: crc32.o compr_rtime.o mkfs.jffs2.o compr_zlib.o
-	$(CC) $(CFLAGS) -o $@ $^ -lz
+	$(CC) $(LDFLAGS) -o $@ $^ -lz
 
 eraseall: crc32.o eraseall.o
-	$(CC) $(CFLAGS) -o $@ $^ -lz
+	$(CC) $(LDFLAGS) -o $@ $^ -lz
 
 jffs2reader: jffs2reader.o
-	$(CC) $(CFLAGS) -o $@ $^ -lz 
+	$(CC) $(LDFLAGS) -o $@ $^ -lz 
 
 

--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: attachment; filename="erase.diff"

Index: erase.c
===================================================================
RCS file: /home/cvs/mtd/util/erase.c,v
retrieving revision 1.9
diff -u -b -B -w -p -u -r1.9 erase.c
--- erase.c	17 May 2002 08:54:31 -0000	1.9
+++ erase.c	2 Mar 2003 09:23:45 -0000
@@ -63,7 +63,7 @@ int region_erase(int Fd, int start, int 
 			}
 		}
 		printf("\rPerforming Flash Erase of length %lu at offset 0x%lx",
-				erase.length, erase.start);
+				(unsigned long)erase.length, (unsigned long)erase.start);
 		fflush(stdout);
 		if(ioctl(Fd, MEMERASE, &erase) != 0)
 		{
@@ -100,13 +100,13 @@ int non_region_erase(int Fd, int start, 
 
 		for (; count > 0; count--) {
 			printf("\rPerforming Flash Erase of length %lu at offset 0x%lx",
-					erase.length, erase.start);
+					(unsigned long)erase.length, (long)erase.start);
 			fflush(stdout);
 
 			if(unlock != 0)
 			{
 				//Unlock the sector first.
-				printf("\rPerforming Flash unlock at offset 0x%lx",erase.start);
+				printf("\rPerforming Flash unlock at offset 0x%lx",(long)erase.start);
 				if(ioctl(Fd, MEMUNLOCK, &erase) != 0)
 				{
 					perror("\nMTD Unlock failure");

--V88s5gaDVPzZ0KCq--
