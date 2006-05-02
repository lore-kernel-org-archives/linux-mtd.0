Received: from elasmtp-banded.atl.sa.earthlink.net ([209.86.89.70])
	by pentafluge.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FayD7-0001gO-ML
	for linux-mtd@lists.infradead.org; Tue, 02 May 2006 17:58:55 +0100
Received: from [209.86.224.44] (helo=elwamui-ovcar.atl.sa.earthlink.net)
	by elasmtp-banded.atl.sa.earthlink.net with asmtp (Exim 4.34)
	id 1FayD4-0000KP-0C
	for linux-mtd@lists.infradead.org; Tue, 02 May 2006 12:58:50 -0400
Message-ID: <25572836.1146589129967.JavaMail.root@elwamui-ovcar.atl.sa.earthlink.net>
Date: Tue, 2 May 2006 12:58:49 -0400 (EDT)
From: Steve Finney <saf76@earthlink.net>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: [PATCH 2/3] MTD Utils. Add noecc option to nanddump
Reply-To: Steve Finney <saf76@earthlink.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add option to read nand data _without_ doing ECC; can be useful for
development/debugging. Also allow hex args for start and length.

Signed-off-by: Steven Finney <sfinney@healthhero.com>

------------------------

--- util.orig/nanddump.c        2006-05-02 07:52:41.459895032 -0700
+++ util/nanddump.c     2006-05-02 08:53:35.334421672 -0700
@@ -33,6 +33,10 @@
 #define PROGRAM "nanddump"
 #define VERSION "$Revision: 1.29 $"

+struct nand_oobinfo none_oobinfo = {
+       .useecc = MTD_NANDECC_OFF,
+};
+
 void display_help (void)
 {
        printf("Usage: nanddump [OPTIONS] MTD-device\n"
@@ -43,6 +47,7 @@ void display_help (void)
               "-f file    --file=file          dump to file\n"
               "-i         --ignoreerrors       ignore errors\n"
               "-l length  --length=length      length\n"
+              "-n         --noecc              read without error correction\n"
               "-o         --omitoob            omit oob data\n"
               "-b         --omitbad            omit bad blocks from the dump\n"
               "-p         --prettyprint        print nice (hexdump)\n"
@@ -67,6 +72,7 @@ void display_version (void)

 int    ignoreerrors;           // ignore errors
 int    pretty_print;           // print nice in ascii
+int    noecc;                  // don't error correct
 int    omitoob;                // omit oob data
 unsigned long  start_addr;     // start address
 unsigned long  length;         // dump length
@@ -80,7 +86,7 @@ void process_options (int argc, char *ar

        for (;;) {
                int option_index = 0;
-               static const char *short_options = "bs:f:il:op";
+               static const char *short_options = "bs:f:il:opn";
                static const struct option long_options[] = {
                        {"help", no_argument, 0, 0},
                        {"version", no_argument, 0, 0},
@@ -90,6 +96,7 @@ void process_options (int argc, char *ar
                        {"omitbad", no_argument, 0, 'b'},
                        {"startaddress", required_argument, 0, 's'},
                        {"length", required_argument, 0, 'l'},
+                       {"noecc", no_argument, 0, 'n'},
                        {0, 0, 0, 0},
                };

@@ -114,7 +121,7 @@ void process_options (int argc, char *ar
                        omitbad = 1;
                        break;
                case 's':
-                       start_addr = atol(optarg);
+                       start_addr = strtol(optarg, NULL, 0);
                        break;
                case 'f':
                        if (!(dumpfile = strdup(optarg))) {
@@ -126,7 +133,7 @@ void process_options (int argc, char *ar
                        ignoreerrors = 1;
                        break;
                case 'l':
-                       length = atol(optarg);
+                       length = strtol(optarg, NULL, 0);
                        break;
                case 'o':
                        omitoob = 1;
@@ -134,6 +141,9 @@ void process_options (int argc, char *ar
                case 'p':
                        pretty_print = 1;
                        break;
+               case 'n':
+                       noecc = 1;
+                       break;
                case '?':
                        error = 1;
                        break;
@@ -163,6 +173,8 @@ int main(int argc, char **argv)
        struct mtd_oob_buf oob = {0, 16, oobbuf};
        mtd_info_t meminfo;
        char pretty_buf[80];
+       int oobinfochanged = 0 ;
+       struct nand_oobinfo old_oobinfo ;

        process_options(argc, argv);

@@ -190,6 +202,21 @@ int main(int argc, char **argv)
        /* Read the real oob length */
        oob.length = meminfo.oobsize;

+       if (noecc)  {
+               if (ioctl (fd, MEMGETOOBSEL, &old_oobinfo) != 0) {
+                       perror ("MEMGETOOBSEL");
+                       close (fd);
+                       exit (1);
+               }
+               if (ioctl (fd, MEMSETOOBSEL, &none_oobinfo) != 0) {
+                       perror ("MEMSETOOBSEL");
+                       close (fd);
+                       exit (1);
+               }
+               oobinfochanged = 1 ;
+       }
+
+
        /* Open output file for writing. If file name is "-", write to standard output. */
        if (!dumpfile) {
                ofd = STDOUT_FILENO;
@@ -297,6 +324,15 @@ int main(int argc, char **argv)
                        write(ofd, oobbuf, meminfo.oobsize);
        }

+       /* reset oobinfo */
+       if (oobinfochanged) {
+               if (ioctl (fd, MEMSETOOBSEL, &old_oobinfo) != 0) {
+                       perror ("MEMSETOOBSEL");
+                       close(fd);
+                       close(ofd);
+                       return 1;
+               }
+       }
        /* Close the output file and MTD device */
        close(fd);
        close(ofd);
@@ -305,6 +341,11 @@ int main(int argc, char **argv)
        return 0;

  closeall:
+       if (oobinfochanged) {
+               if (ioctl (fd, MEMSETOOBSEL, &old_oobinfo) != 0)  {
+                       perror ("MEMSETOOBSEL");
+               }
+       }
        close(fd);
        close(ofd);
        exit(1);
