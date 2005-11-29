Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1Eguy2-0004dA-24
	for linux-mtd@lists.infradead.org; Mon, 28 Nov 2005 21:11:51 -0500
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1EguxC-0004V8-Of
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 03:10:46 +0100
Received: from desk.marajade.sandelman.ca ([205.150.200.247])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 Nov 2005 03:10:46 +0100
Received: from mcr by desk.marajade.sandelman.ca with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 Nov 2005 03:10:46 +0100
To: linux-mtd@lists.infradead.org
From: Michael Richardson <mcr@sandelman.ottawa.on.ca>
Date: Mon, 28 Nov 2005 20:58:37 -0500
Message-ID: <v08xv8gqpe.fsf@marajade.sandelman.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Sender: news <news@sea.gmane.org>
Subject: [PATCH 3/4] added jffs2cpio skeleton
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=-=-=


Subject: [PATCH] decodes the directory tree properly

Signoff: Michael Richardson <mcr@sandelman.ca>

---

 util/jffs2cpio.c |  317 +++++++++++++++++++++++++++++++++++++++++++++---------
 1 files changed, 262 insertions(+), 55 deletions(-)

applies-to: eab8317f7c4184698a7b3eef7cbd1430e068f4db
062a4f6bdea4577b9abb5de02b9b997f3c474208
diff --git a/util/jffs2cpio.c b/util/jffs2cpio.c
index e4d8b61..024f43a 100644
--- a/util/jffs2cpio.c
+++ b/util/jffs2cpio.c
@@ -1,7 +1,8 @@
 /*
- *  dumpjffs2.c
+ *  jffs2cpio.c
  *
  *  Copyright (C) 2003 Thomas Gleixner (tglx@linutronix.de)
+ *  Copyright (C) 2005 Michael Richardson <mcr@xelerance.com>
  *
  * $Id: jffs2dump.c,v 1.12 2005/11/07 11:15:12 gleixner Exp $
  *
@@ -10,7 +11,7 @@
  * published by the Free Software Foundation.
  *
  * Overview:
- *   This utility dumps the contents of a binary JFFS2 image
+ *   This utility dumps the contents of a binary JFFS2 image in cpio format.
  *
  *
  * Bug/ToDo:
@@ -22,6 +23,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
+#include <limits.h>
 #include <fcntl.h>
 #include <time.h>
 #include <sys/types.h>
@@ -29,15 +31,17 @@
 #include <sys/param.h>
 #include <asm/types.h>
 #include <dirent.h>
+#include <ctype.h>
 #include <mtd/jffs2-user.h>
 #include <endian.h>
 #include <byteswap.h>
 #include <getopt.h>
+#include <assert.h>
 #include "crc32.h"
 #include "summary.h"
 #include "jffs2lib.h"
 
-#define PROGRAM "jffs2dump"
+#define PROGRAM "jffs2cpio"
 #define VERSION "$Revision: 1.12 $"
 
 // Global variables
@@ -81,7 +85,7 @@ void display_version (void)
 
 int 	verbose;		// verbose output
 char 	*img;			// filename of image
-int	dumpcontent;		// dump image content
+int	dump2cpio;		// dump image content in cpio format.
 int	target_endian = __BYTE_ORDER;	// image endianess
 int	convertendian;		// convert endianness
 int	recalccrc;		// recalc name and data crc's on endian conversion
@@ -101,7 +105,7 @@ void process_options (int argc, char *ar
 			{"version", no_argument, 0, 0},
 			{"bigendian", no_argument, 0, 'b'},
 			{"littleendian", no_argument, 0, 'l'},
-			{"content", no_argument, 0, 'c'},
+			{"cpio", no_argument, 0, 'c'},
 			{"endianconvert", required_argument, 0, 'e'},
 			{"datsize", required_argument, 0, 'd'},
 			{"oobsize", required_argument, 0, 'o'},
@@ -137,7 +141,7 @@ void process_options (int argc, char *ar
 			target_endian = __LITTLE_ENDIAN;
 			break;
 		case 'c':
-			dumpcontent = 1;
+			dump2cpio = 1;
 			break;
 		case 'd':
 			datsize = atoi(optarg);
@@ -164,13 +168,152 @@ void process_options (int argc, char *ar
 	img = argv[optind];
 }
 
+void hexdump(const char *label, const void *data, size_t dlen)
+{
+	char line[81];
+	int  i, len;
+	int pos;
+	
+	pos=0;
+	line[80]='\0';
+	
+	memset(line, ' ', 80);
+
+	while(pos < dlen) {
+		snprintf(line, 11, "%08x ", pos);
+		len = dlen - pos;
+		if(len > 16) len=16;
+		
+		for(i=0; i<len; i++) {
+			unsigned char *p = ((unsigned char *)data)+pos+i;
+			unsigned char  c = *p;
+
+			snprintf(line+9+(i*3), 4, "%02x ", c);
+			if(isprint(c)) {
+				line[9+16*3+4+i]=c;
+			} else {
+				line[9+16*3+4+i]='.';
+			}
+		}
+		line[9+16*3]=' ';
+		puts(line);
+
+		memset(line, ' ', 80);
+		pos += len;
+	}
+}
+
+struct jdirent {
+	union jffs2_node_union *file;
+};
+
+struct dirino_entry {
+	union jffs2_node_union *dir;
+	int                     entry_size;
+	int                     entry_next;
+	struct jdirent         *entries;
+	char                   *pathdown;
+};
+struct dirino_entry *dirino_table=NULL;
+int dirino_table_size=0;
+
+void insert_dirent(union jffs2_node_union *dino)
+{
+	int ino = je32_to_cpu(dino->d.ino);;
+	int pino= je32_to_cpu(dino->d.pino);;
+	int maxi = (pino > ino ? pino : ino)+1;
+	struct dirino_entry *de;
+	struct jdirent *jd;
+
+	/* see if table is big enough for this entry */
+	if(dirino_table_size < maxi) {
+		int old_table_size = dirino_table_size;
+		if(dirino_table_size == 0) dirino_table_size=1;
+		
+		while(dirino_table_size < maxi
+		      && dirino_table_size < INT_MAX) {
+			dirino_table_size = dirino_table_size*2;
+		}
+		dirino_table_size++;
+		assert(dirino_table_size < INT_MAX);
+		
+		dirino_table=realloc(dirino_table, (dirino_table_size)*sizeof(struct dirino_entry));
+		
+		memset(&dirino_table[old_table_size], 0,
+		       sizeof(struct dirino_entry)*(dirino_table_size-old_table_size));
+	}
+	
+	de = &dirino_table[ino];
+	/* point this entry correctly */
+	de->dir = dino;
+
+	/* now insert this item into the directory for this node */
+	if(de->entries == NULL || de->entry_next == de->entry_size) {
+		int newsize=de->entry_size*2;
+		if(newsize==0) { newsize=2; }
+		
+		de->entries=realloc(de->entries, newsize*sizeof(struct jdirent));
+		memset(&de->entries[de->entry_size], 0,
+		       sizeof(struct jdirent)*(newsize-de->entry_size));
+		de->entry_size = newsize;
+	}
+	jd = &de->entries[de->entry_next++];
+	jd->file = dino;
+
+	return;
+}
+	
+struct dirino_entry *get_dir_inode(int ino)
+{
+	struct dirino_entry *de;
+
+	if(ino <= dirino_table_size) {
+		de = &dirino_table[ino];
+		return de;
+	}
+	return NULL;
+}
+	
+void generate_dir_names()
+{
+	int pino, pdownlen;
+	int ino;
+
+	/* inode 1 is weird */
+	dirino_table[1].pathdown=".";
+
+	for(ino=2; ino < dirino_table_size; ino++) {
+		struct dirino_entry *de = &dirino_table[ino];
+		struct dirino_entry *pde;
+		char name[256];
+		if(de->dir == NULL) continue;
+		
+		pino = je32_to_cpu (de->dir->d.pino);
+
+		pde = &dirino_table[pino];
+		memcpy (name, de->dir->d.name, de->dir->d.nsize);
+		name [de->dir->d.nsize] = 0x0;
+		
+		/* space for / and \0 */
+		if(pde->pathdown == NULL) {
+			printf("pathdown failed at ino=%d pino=%d\n",
+			       ino, pino);
+		} else {
+			pdownlen = strlen(pde->pathdown)+de->dir->d.nsize+2;
+			de->pathdown=malloc(pdownlen);
+			snprintf(de->pathdown, pdownlen, "%s/%s",
+				 pde->pathdown, name);
+		}
+	}
+}
+		
 
 /*
  *	Dump image contents
  */
-void do_dumpcontent (void)
+void do_dump2cpio(void)
 {
-	char			*p = data, *p_free_begin;
+	char			*p, *p_free_begin, *nextp;
 	union jffs2_node_union 	*node;
 	int			empty = 0, dirty = 0;
 	char			name[256];
@@ -178,28 +321,35 @@ void do_dumpcontent (void)
 	uint16_t		type;
 	int			bitchbitmask = 0;
 	int			obsolete;
+	void *fdata;
+	int   fdatalen;
+	struct dirino_entry *dp;
 
 	p_free_begin = NULL;
-	while ( p < (data + imglen)) {
+	nextp=NULL;
+
+	/* first scan through to find all the directory entries */
+
+	for(p = data; p < (data + imglen); p = nextp) {
 		node = (union jffs2_node_union*) p;
 
 		/* Skip empty space */
 		if (!p_free_begin)
 			p_free_begin = p;
 		if (je16_to_cpu (node->u.magic) == 0xFFFF && je16_to_cpu (node->u.nodetype) == 0xFFFF) {
-			p += 4;
+			nextp = p + 4;
 			empty += 4;
 			continue;
 		}
 
 		if (p != p_free_begin)
-			printf("Empty space found from 0x%08x to 0x%08x\n", p_free_begin-data, p-data);
+			fprintf(stderr, "Empty space found from 0x%08x to 0x%08x\n", p_free_begin-data, p-data);
 		p_free_begin = NULL;
 
 		if (je16_to_cpu (node->u.magic) != JFFS2_MAGIC_BITMASK)	{
 			if (!bitchbitmask++)
-    			    printf ("Wrong bitmask  at  0x%08x, 0x%04x\n", p - data, je16_to_cpu (node->u.magic));
-			p += 4;
+				fprintf (stderr, "Wrong bitmask  at  0x%08x, 0x%04x\n", p - data, je16_to_cpu (node->u.magic));
+			nextp = p + 4;
 			dirty += 4;
 			continue;
 		}
@@ -211,53 +361,31 @@ void do_dumpcontent (void)
 			type |= JFFS2_NODE_ACCURATE;
 		} else
 			obsolete = 0;
+
 		/* Set accurate for CRC check */
 		node->u.nodetype = cpu_to_je16(type);
 
 		crc = crc32 (0, node, sizeof (struct jffs2_unknown_node) - 4);
 		if (crc != je32_to_cpu (node->u.hdr_crc)) {
-			printf ("Wrong hdr_crc  at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->u.hdr_crc), crc);
-			p += 4;
+			fprintf (stderr, "Wrong hdr_crc  at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->u.hdr_crc), crc);
+			nextp = p + 4;
 			dirty += 4;
 			continue;
 		}
 
-		switch(je16_to_cpu(node->u.nodetype)) {
-
-		case JFFS2_NODETYPE_INODE:
-			printf ("%8s Inode      node at 0x%08x, totlen 0x%08x, #ino  %5d, version %5d, isize %8d, csize %8d, dsize %8d, offset %8d\n",
-					obsolete ? "Obsolete" : "",
-					p - data, je32_to_cpu (node->i.totlen), je32_to_cpu (node->i.ino),
-					je32_to_cpu ( node->i.version), je32_to_cpu (node->i.isize),
-					je32_to_cpu (node->i.csize), je32_to_cpu (node->i.dsize), je32_to_cpu (node->i.offset));
-
-			crc = crc32 (0, node, sizeof (struct jffs2_raw_inode) - 8);
-			if (crc != je32_to_cpu (node->i.node_crc)) {
-				printf ("Wrong node_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->i.node_crc), crc);
-				p += PAD(je32_to_cpu (node->i.totlen));
-				dirty += PAD(je32_to_cpu (node->i.totlen));;
-				continue;
-			}
-
-			crc = crc32(0, p + sizeof (struct jffs2_raw_inode), je32_to_cpu(node->i.csize));
-			if (crc != je32_to_cpu(node->i.data_crc)) {
-				printf ("Wrong data_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->i.data_crc), crc);
-				p += PAD(je32_to_cpu (node->i.totlen));
-				dirty += PAD(je32_to_cpu (node->i.totlen));;
-				continue;
-			}
-
-			p += PAD(je32_to_cpu (node->i.totlen));
-			break;
+		nextp = p + PAD(je32_to_cpu (node->d.totlen));
+		if(obsolete) continue;
 
+		switch(je16_to_cpu(node->u.nodetype)) {
 		case JFFS2_NODETYPE_DIRENT:
 			memcpy (name, node->d.name, node->d.nsize);
 			name [node->d.nsize] = 0x0;
-			printf ("%8s Dirent     node at 0x%08x, totlen 0x%08x, #pino %5d, version %5d, #ino  %8d, nsize %8d, name %s\n",
-					obsolete ? "Obsolete" : "",
+			insert_dirent(node);
+
+			fprintf (stderr, "Dirent     node at 0x%08x, totlen 0x%08x, #pino %5d, version %5d, #ino  %8d, nsize %8d, name %s\n",
 					p - data, je32_to_cpu (node->d.totlen), je32_to_cpu (node->d.pino),
 					je32_to_cpu ( node->d.version), je32_to_cpu (node->d.ino),
-					node->d.nsize, name);
+				 node->d.nsize, name);
 
 			crc = crc32 (0, node, sizeof (struct jffs2_raw_dirent) - 8);
 			if (crc != je32_to_cpu (node->d.node_crc)) {
@@ -274,8 +402,94 @@ void do_dumpcontent (void)
 				dirty += PAD(je32_to_cpu (node->d.totlen));;
 				continue;
 			}
+			break;
+		}
+	}
+
+	generate_dir_names();
 
-			p += PAD(je32_to_cpu (node->d.totlen));
+	for(p = data; p < (data + imglen); p = nextp) {
+		node = (union jffs2_node_union*) p;
+
+		/* Skip empty space */
+		if (!p_free_begin)
+			p_free_begin = p;
+		if (je16_to_cpu (node->u.magic) == 0xFFFF && je16_to_cpu (node->u.nodetype) == 0xFFFF) {
+			nextp = p + 4;
+			empty += 4;
+			continue;
+		}
+
+		if (p != p_free_begin)
+			fprintf(stderr, "Empty space found from 0x%08x to 0x%08x\n", p_free_begin-data, p-data);
+		p_free_begin = NULL;
+
+		if (je16_to_cpu (node->u.magic) != JFFS2_MAGIC_BITMASK)	{
+			if (!bitchbitmask++)
+				fprintf (stderr, "Wrong bitmask  at  0x%08x, 0x%04x\n", p - data, je16_to_cpu (node->u.magic));
+			nextp = p + 4;
+			dirty += 4;
+			continue;
+		}
+		bitchbitmask = 0;
+
+		type = je16_to_cpu(node->u.nodetype);
+		if ((type & JFFS2_NODE_ACCURATE) != JFFS2_NODE_ACCURATE) {
+			obsolete = 1;
+			type |= JFFS2_NODE_ACCURATE;
+		} else
+			obsolete = 0;
+
+		/* Set accurate for CRC check */
+		node->u.nodetype = cpu_to_je16(type);
+
+		crc = crc32 (0, node, sizeof (struct jffs2_unknown_node) - 4);
+		if (crc != je32_to_cpu (node->u.hdr_crc)) {
+			fprintf (stderr, "Wrong hdr_crc  at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->u.hdr_crc), crc);
+			nextp = p + 4;
+			dirty += 4;
+			continue;
+		}
+
+		nextp = p + PAD(je32_to_cpu (node->d.totlen));
+		if(obsolete) continue;
+
+		switch(je16_to_cpu(node->u.nodetype)) {
+
+		case JFFS2_NODETYPE_INODE:
+			dp = get_dir_inode(je32_to_cpu (node->i.ino));
+			fprintf (stderr, "Inode (%s) node at 0x%08x, totlen 0x%08x, #ino  %5d, version %5d, isize %8d, csize %8d, dsize %8d, offset %8d\n",
+				 dp->pathdown,
+				 p - data, je32_to_cpu (node->i.totlen),
+				 je32_to_cpu (node->i.ino),
+				 je32_to_cpu ( node->i.version),
+				 je32_to_cpu (node->i.isize),
+				 je32_to_cpu (node->i.csize),
+				 je32_to_cpu (node->i.dsize),
+				 je32_to_cpu (node->i.offset));
+			
+			crc = crc32 (0, node, sizeof (struct jffs2_raw_inode) - 8);
+			if (crc != je32_to_cpu (node->i.node_crc)) {
+				fprintf (stderr, "Wrong node_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->i.node_crc), crc);
+				p += PAD(je32_to_cpu (node->i.totlen));
+				dirty += PAD(je32_to_cpu (node->i.totlen));;
+				continue;
+			}
+
+			fdata = p + sizeof (struct jffs2_raw_inode);
+			fdatalen = je32_to_cpu(node->i.csize);
+				
+			crc = crc32(0, fdata, fdatalen);
+			if (crc != je32_to_cpu(node->i.data_crc)) {
+				fprintf (stderr, "Wrong data_crc at  0x%08x, 0x%08x instead of 0x%08x\n", p - data, je32_to_cpu (node->i.data_crc), crc);
+				p += PAD(je32_to_cpu (node->i.totlen));
+				dirty += PAD(je32_to_cpu (node->i.totlen));;
+				continue;
+			}
+			hexdump("data", fdata, fdatalen);
+			break;
+
+		case JFFS2_NODETYPE_DIRENT:
 			break;
 
 		case JFFS2_NODETYPE_SUMMARY: {
@@ -366,8 +580,6 @@ void do_dumpcontent (void)
 					je32_to_cpu(sm->magic),
 					je32_to_cpu(node->s.padded));
 			}
-
-			p += PAD(je32_to_cpu (node->s.totlen));
 			break;
 		}
 
@@ -383,8 +595,6 @@ void do_dumpcontent (void)
 				dirty += PAD(je32_to_cpu (node->eh.totlen));;
 				continue;
 			}
-
-			p += PAD(je32_to_cpu (node->eh.totlen));
 			break;
 
 		case JFFS2_NODETYPE_CLEANMARKER:
@@ -393,7 +603,6 @@ void do_dumpcontent (void)
 					obsolete ? "Obsolete" : "",
 					p - data, je32_to_cpu (node->u.totlen));
 			}
-			p += PAD(je32_to_cpu (node->u.totlen));
 			break;
 
 		case JFFS2_NODETYPE_PADDING:
@@ -402,7 +611,6 @@ void do_dumpcontent (void)
 					obsolete ? "Obsolete" : "",
 					p - data, je32_to_cpu (node->u.totlen));
 			}
-			p += PAD(je32_to_cpu (node->u.totlen));
 			break;
 
 		case 0xffff:
@@ -416,7 +624,6 @@ void do_dumpcontent (void)
 					obsolete ? "Obsolete" : "",
 					p - data, je32_to_cpu (node->u.totlen));
 			}
-			p += PAD(je32_to_cpu (node->u.totlen));
 			dirty += PAD(je32_to_cpu (node->u.totlen));
 
 		}
@@ -473,8 +680,8 @@ int main(int argc, char **argv)
 	// Close the input file
 	close(fd);
 
-	if (dumpcontent)
-		do_dumpcontent ();
+	if (dump2cpio)
+		do_dump2cpio();
 
 	if (convertendian)
 		do_endianconvert (cnvfile, data, imglen, recalccrc);
---
0.99.9.GIT


-- 
]       ON HUMILITY: to err is human. To moo, bovine.           |  firewalls  [
]   Michael Richardson,    Xelerance Corporation, Ottawa, ON    |net architect[
] mcr@xelerance.com      http://www.sandelman.ottawa.on.ca/mcr/ |device driver[
] panic("Just another Debian GNU/Linux using, kernel hacking, security guy"); [

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iQEVAwUAQ4u1z4CLcPvd0N1lAQInhwf9HOEm+xJLkUY3jyCw1hWBzU9XeHd+zSD1
wmgyVlP/X9Djejj8R1l6306sNI5lUsVK5+MQqRu1XYAqoO2wvEau1zDYQrKWCWul
vUNWIeNkA/BnFyWv2MnDy0Ja9+GqQ0uA5/KRQuor9SVzcQZYFLRGKNBafPGOyCuT
hCcSC9ppPbW815ydOlZcH2IIRlqcVE7jmk/KUTOw5QxUlwtrzNgwTZJKmGM2Xq6O
F4qKV8z+7mCMurVLJSs7RALsPf4IZTCZYXre2Wsbb3SYt6ApRJd07MpogA6WHkgM
UZrXFvHPLypINaDPTUEeE98F9N8mvNWxK6Jg9czZHCLamGGYgrpFww==
=+yKp
-----END PGP SIGNATURE-----
--=-=-=--
