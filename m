Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CWbbH-0003RZ-5M
	for linux-mtd@lists.infradead.org; Tue, 23 Nov 2004 09:25:05 -0500
Received: from localhost ([127.0.0.1] helo=eos.fwall.u-szeged.hu)
	by eos.fwall.u-szeged.hu with smtp (Exim 4.34) id 1CWbb7-00018I-Nu
	for linux-mtd@lists.infradead.org; Tue, 23 Nov 2004 15:24:49 +0100
Received: from eos.fwall.u-szeged.hu ([127.0.0.1])
	by eos.fwall.u-szeged.hu (SAVSMTP 3.1.0.29) with SMTP id
	M2004112315244913532
	for <linux-mtd@lists.infradead.org>; Tue, 23 Nov 2004 15:24:49 +0100
Received: from sol.cc.u-szeged.hu ([160.114.8.24])
	by eos.fwall.u-szeged.hu with esmtp (Exim 4.34) id 1CWbb7-0001Lz-Ju
	for linux-mtd@lists.infradead.org; Tue, 23 Nov 2004 15:24:49 +0100
Received: from sed.inf.u-szeged.hu ([160.114.37.208] helo=sed)
	by sol.cc.u-szeged.hu with esmtp (Exim 4.34) id 1CWbb7-0002sQ-9m
	for linux-mtd@lists.infradead.org; Tue, 23 Nov 2004 15:24:49 +0100
Received: from kpax.inf.u-szeged.hu ([160.114.36.214] ident=hafy)
	by sed with esmtp (Exim 3.36 #1 (Debian)) id 1CWbb4-0001eV-00
	for <linux-mtd@lists.infradead.org>; Tue, 23 Nov 2004 15:24:46 +0100
Message-ID: <41A34894.4060808@inf.u-szeged.hu>
Date: Tue, 23 Nov 2004 15:26:28 +0100
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="------------000406080502090804000107"
Subject: incremental mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------000406080502090804000107
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Dear All,

We've imlemented a small but (I think) usefull feature for mkfs.jffs2.

It gives the possibility for the user to create a jffs2 image which can 
be writen after an already created image to the flash. (similar to the 
multi-session CDs)

In practice it means a new option (-i,--incremental) which specifies the 
already created image.

I would like to commit it. Comments?

Regards,
Ferenc

--------------000406080502090804000107
Content-Type: text/plain;
 name="jffs2-mkfs.jffs2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="jffs2-mkfs.jffs2.patch"

diff --unified --recursive --new-file mtd/util/mkfs.jffs2.1 mtd-nov15/util/mkfs.jffs2.1
--- mtd/util/mkfs.jffs2.1	2004-05-28 12:51:11.000000000 +0200
+++ mtd-nov15/util/mkfs.jffs2.1	2004-11-17 15:31:15.000000000 +0100
@@ -27,7 +27,7 @@
 .B -o,--output
 .I image.jffs2
 ]
-|
+[
 .B -l,--little-endian
 ]
 [
@@ -75,6 +75,11 @@
 [
 .B -V,--version
 ]
+[
+.B -i,--incremental
+.I image.jffs2
+]
+
 .SH DESCRIPTION
 The program
 .B mkfs.jffs2
@@ -214,6 +219,11 @@
 .TP
 .B -V, --version
 Display version information.
+.TP
+.B -i, --incremental=FILE
+Generate an appendage image for FILE. If FILE is written to flash and flash
+is appended with the output, then it seems as if it was one thing.
+
 .SH BUGS
 JFFS2 limits device major and minor numbers to 8 bits each.  Some
 consider this a bug.
diff --unified --recursive --new-file mtd/util/mkfs.jffs2.c mtd-nov15/util/mkfs.jffs2.c
--- mtd/util/mkfs.jffs2.c	2004-05-28 12:51:11.000000000 +0200
+++ mtd-nov15/util/mkfs.jffs2.c	2004-11-17 14:49:56.000000000 +0100
@@ -76,6 +76,8 @@
 #define mkfs_debug_msg(a...)	{ }
 #define min(x,y) ({ typeof((x)) _x = (x); typeof((y)) _y = (y); (_x>_y)?_y:_x; })
 
+#define PAD(x) (((x)+3)&~3)
+
 struct filesystem_entry {
 	char *name;					/* Name of this directory (think basename) */
 	char *path;					/* Path of this directory (think dirname) */
@@ -91,6 +93,7 @@
 
 
 static int out_fd = -1;
+static int in_fd = -1;
 static char default_rootdir[] = ".";
 static char *rootdir = default_rootdir;
 static int verbose = 0;
@@ -650,7 +653,8 @@
 #define JFFS2_MAX_SYMLINK_LEN 254
 #endif
 
-static uint32_t ino;
+static uint32_t ino = 0;
+static uint8_t *file_buffer = NULL;		/* file buffer contains the actual erase block*/
 static int out_ofs = 0;
 static int erase_block_size = 65536;
 static int pad_fs_size = 0;
@@ -1112,7 +1116,10 @@
 	cleanmarker.totlen   = cpu_to_je32(cleanmarker_size);
 	cleanmarker.hdr_crc  = cpu_to_je32(crc32(0, &cleanmarker, sizeof(struct jffs2_unknown_node)-4));
 
-	ino = root->sb.st_ino = 1;
+	if (ino == 0)
+		ino = 1;
+	
+	root->sb.st_ino = 1;
 	recursive_populate_directory(root);
 
 	if (pad_fs_size == -1) {
@@ -1156,6 +1163,7 @@
 	{"disable-compressor", 1, NULL, 'x'},
 	{"test-compression", 0, NULL, 't'},
 	{"compressor-priority", 1, NULL, 'y'},
+	{"input", 1, NULL, 'i'},
 	{NULL, 0, NULL, 0}
 };
 
@@ -1190,11 +1198,147 @@
 	"  -P, --squash-perms      Squash permissions on all files\n"
 	"  -h, --help              Display this help text\n"
 	"  -v, --verbose           Verbose operation\n"
-	"  -V, --version           Display version information\n\n";
-
+	"  -V, --version           Display version information\n"
+	"  -i, --incremental=FILE  Parse FILE and generate appendage output for it\n\n";
 
 static char *revtext = "$Revision: 1.42 $";
 
+int load_next_block() {
+	
+	int ret;
+	ret = read(in_fd, file_buffer, erase_block_size);
+		
+	if(verbose)
+		printf("Load next block : %d bytes read\n",ret);
+	
+	return ret;
+}
+
+void process_buffer(int inp_size) {
+	uint8_t		*p = file_buffer;
+	union jffs2_node_union 	*node;
+	uint16_t	type;
+	int		bitchbitmask = 0;
+	int		obsolete;
+	
+	char	name[256];
+	
+	while ( p < (file_buffer + inp_size)) {
+		
+		node = (union jffs2_node_union *) p;
+		
+		/* Skip empty space */
+		if (je16_to_cpu (node->u.magic) == 0xFFFF && je16_to_cpu (node->u.nodetype) == 0xFFFF) {
+			p += 4;
+			continue;
+		}
+		
+		if (je16_to_cpu (node->u.magic) != JFFS2_MAGIC_BITMASK)	{
+			if (!bitchbitmask++)
+    			    printf ("Wrong bitmask  at  0x%08x, 0x%04x\n", p - file_buffer, je16_to_cpu (node->u.magic));
+			p += 4;
+			continue;
+		}
+		
+		bitchbitmask = 0;
+		
+		type = je16_to_cpu(node->u.nodetype);
+		if ((type & JFFS2_NODE_ACCURATE) != JFFS2_NODE_ACCURATE) {
+			obsolete = 1;
+			type |= JFFS2_NODE_ACCURATE;
+		} else
+			obsolete = 0;
+		
+		node->u.nodetype = cpu_to_je16(type);
+		
+		switch(je16_to_cpu(node->u.nodetype)) {
+		
+			case JFFS2_NODETYPE_INODE:
+				if(verbose)
+					printf ("%8s Inode      node at 0x%08x, totlen 0x%08x, #ino  %5d, version %5d, isize %8d, csize %8d, dsize %8d, offset %8d\n",
+						obsolete ? "Obsolete" : "",
+						p - file_buffer, je32_to_cpu (node->i.totlen), je32_to_cpu (node->i.ino),
+						je32_to_cpu ( node->i.version), je32_to_cpu (node->i.isize), 
+						je32_to_cpu (node->i.csize), je32_to_cpu (node->i.dsize), je32_to_cpu (node->i.offset));
+				
+				if ( je32_to_cpu (node->i.ino) > ino )
+					ino = je32_to_cpu (node->i.ino);
+				
+				p += PAD(je32_to_cpu (node->i.totlen));
+				break;
+				
+			case JFFS2_NODETYPE_DIRENT:
+				memcpy (name, node->d.name, node->d.nsize);
+				name [node->d.nsize] = 0x0;
+			
+				if(verbose)
+					printf ("%8s Dirent     node at 0x%08x, totlen 0x%08x, #pino %5d, version %5d, #ino  %8d, nsize %8d, name %s\n",
+						obsolete ? "Obsolete" : "",
+						p - file_buffer, je32_to_cpu (node->d.totlen), je32_to_cpu (node->d.pino),
+						je32_to_cpu ( node->d.version), je32_to_cpu (node->d.ino), 
+						node->d.nsize, name);
+				
+				p += PAD(je32_to_cpu (node->d.totlen));						
+				break;
+		
+			case JFFS2_NODETYPE_CLEANMARKER:
+				if (verbose) {
+					printf ("%8s Cleanmarker     at 0x%08x, totlen 0x%08x\n", 
+						obsolete ? "Obsolete" : "",
+						p - file_buffer, je32_to_cpu (node->u.totlen));
+				}
+				
+				p += PAD(je32_to_cpu (node->u.totlen));						
+				break;
+		
+			case JFFS2_NODETYPE_PADDING:
+				if (verbose) {
+					printf ("%8s Padding    node at 0x%08x, totlen 0x%08x\n", 
+						obsolete ? "Obsolete" : "",
+						p - file_buffer, je32_to_cpu (node->u.totlen));
+				}
+				
+				p += PAD(je32_to_cpu (node->u.totlen));						
+				break;
+				
+			case 0xffff:
+				p += 4;
+				break;
+				
+			default:	
+				if (verbose) {
+					printf ("%8s Unknown    node at 0x%08x, totlen 0x%08x\n", 
+						obsolete ? "Obsolete" : "",
+						p - file_buffer, je32_to_cpu (node->u.totlen));
+				}
+				
+				p += PAD(je32_to_cpu (node->u.totlen));						
+		}	
+	}
+}
+
+void parse_image(){
+	int ret;
+	
+	file_buffer = malloc(erase_block_size);
+	
+	if (!file_buffer) {
+		perror("out of memory");
+		close (in_fd);
+		close (out_fd);
+		exit(1);
+	}
+	
+	while ((ret = load_next_block())) {
+		process_buffer(ret);	
+	}
+	
+	if (file_buffer)
+		free(file_buffer);
+	
+	close(in_fd);
+}
+
 int main(int argc, char **argv)
 {
 	int c, opt;
@@ -1208,7 +1352,7 @@
         jffs2_compressors_init();
 
 	while ((opt = getopt_long(argc, argv, 
-					"D:d:r:s:o:qUPfh?vVe:lbp::nc:m:x:X:Lty:", long_options, &c)) >= 0) 
+					"D:d:r:s:o:qUPfh?vVe:lbp::nc:m:x:X:Lty:i:", long_options, &c)) >= 0) 
 	{
 		switch (opt) {
 			case 'D':
@@ -1361,6 +1505,15 @@
                                 }
                                 free(compr_name);
                                 break;
+			case 'i':
+				if (in_fd != -1) {
+					error_msg_and_die("(incremental) filename specified more than once");
+				}
+				in_fd = open(optarg, O_RDONLY);
+				if (in_fd == -1) {
+					perror_msg_and_die("cannot open (incremental) file");
+				}
+				break;
 		}
 	}
 	if (out_fd == -1) {
@@ -1378,6 +1531,9 @@
 	if (!(cwd = getcwd(0, GETCWD_SIZE)))
 		perror_msg_and_die("getcwd failed");
 
+	if(in_fd != -1)
+		parse_image();
+	
 	root = recursive_add_host_directory(NULL, "/", cwd);
 
 	if (devtable)

--------------000406080502090804000107--
