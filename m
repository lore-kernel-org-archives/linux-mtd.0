Received: from 207.88.121.47.ptr.us.xo.net ([207.88.121.47]
	helo=ba.realmsys.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EIyHa-00061f-Kk
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2005 20:52:58 -0400
Received: from pgrayson1.inrealm.net (unknown [66.239.3.2])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by ba.realmsys.com (Spam Firewall) with ESMTP id BD1CB15C8D
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 Sep 2005 18:52:43 -0600 (MDT)
From: Peter Grayson <pgrayson@realmsys.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-uOBcDhlUXHeBiZkBitFa"
Date: Fri, 23 Sep 2005 18:52:45 -0600
Message-Id: <1127523165.6937.61.camel@localhost.localdomain>
Mime-Version: 1.0
Subject: [PATCH] nandcombust
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-uOBcDhlUXHeBiZkBitFa
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

This is a patch that adds a new mtd util program: nandcombust. This
program is like flash_eraseall and nandwrite in one program.

Nandcombust erases as it writes and then continues to erase to the end
of the partition after the image is written. This allows a filesystem
image to be written to flash with a single command (instead of two).

Beside it being a single program, nandcombust has an important advantage
over nandwrite: nandcombust can read an image from standard input. On an
embedded device with more NAND flash than RAM, this allows filesystem
images larger than RAM to be loaded into flash. For example, you can do
this with nandcombust:

  $ cat bigimage.jffs2 | ssh 10.0.0.2 "nandcombust /dev/mtd3 -"

Or if the image is already on the device with the NAND flash:

  $ nandcombust /dev/mtd3 someimage.jffs2

Nandcombust can also be used to just erase an mtd partition (without
writing a new image):

  $ nandcombust -e /dev/mtd3

This program has been in use at my company for several months. So it is
fairly mature and stable. The code is GPL and is fairly small (about the
same as nandwrite).

Pete

--=-uOBcDhlUXHeBiZkBitFa
Content-Disposition: attachment; filename=mtd-nandcombust.patch
Content-Type: text/x-patch; name=mtd-nandcombust.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

[MTD] nandcombust

Adds nandcombust tool to mtd utils. This tool performs the functions of
both flash_eraseall and nandwrite. It can be used in situations where
nandwrite cannot.

[From: Peter Grayson <pgrayson@realmsys.com>]
diff -uNr mtd/util/Makefile mtd-nandcombust/util/Makefile
--- mtd/util/Makefile	2005-09-07 13:04:18.000000000 -0600
+++ mtd-nandcombust/util/Makefile	2005-09-23 18:29:40.687397536 -0600
@@ -16,6 +16,7 @@
 	jffs2dump \
 	nftldump nftl_format docfdisk \
 	rfddump rfdformat \
+	nandcombust \
 	sumtool #jffs2reader 
 
 SYMLINKS = 
diff -uNr mtd/util/nandcombust.c mtd-nandcombust/util/nandcombust.c
--- mtd/util/nandcombust.c	1969-12-31 17:00:00.000000000 -0700
+++ mtd-nandcombust/util/nandcombust.c	2005-09-23 18:28:26.112734608 -0600
@@ -0,0 +1,444 @@
+/*
+ *  nandcombust.c
+ *
+ *  Copyright (C) 2005 Realm Systems
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * Overview:
+ *
+ *  Write an image to a nand flash device/partition. Nandcombust is bad-
+ *  block aware and always erases to the end of the partition. This saves
+ *  the separate erase step when writing filesystem images to nand flash.
+ *
+ *  Nandcombust replaces both flash_eraseall and nandwrite. Nandcombust has
+ *  the following differences when compared to nandwrite and flash_eraseall:
+ *
+ *   * It can read an image from a file or from stdin
+ *   * It erases the mtd partition it is going to write (obviating the need
+ *     for flash_eraseall)
+ *   * It always uses automatic ECC placement
+ *   * It does not try to know about filesystem-specific out-of-bounds data
+ *     (i.e. jffs2 cleanmarkers)
+ */
+
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <sys/fcntl.h>
+#include <sys/ioctl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <getopt.h>
+#include <string.h>
+#include <errno.h>
+
+#include "mtd/mtd-user.h"
+
+#define PROGRAM     "nandcombust"
+#define VERSION     "1.3"
+#define COPYRIGHT   "(C) 2005 Realm Systems"
+
+#define verbose(x) do { if (option_verbose) x; } while (0)
+
+static char *output_filename = 0;
+static char *input_filename = 0;
+
+static int option_oob = 0;
+static int option_verbose = 0;
+static int option_erase_only = 0;
+
+static const char *short_options = "hvoe";
+static const struct option long_options[] =
+{
+    {"version", no_argument, 0, 1},
+    {"help",    no_argument, 0, 'h'},
+    {"verbose", no_argument, 0, 'v'},
+    {"oob",     no_argument, 0, 'o'},
+    {"erase",   no_argument, 0, 'e'},
+    {0, 0, 0, 0},
+};
+
+void display_help(void)
+{
+    printf("Usage: " PROGRAM " [OPTIONS] MTD_DEVICE [IMAGE]\n\n"
+           "Writes an image file or bytestream to the specified MTD device.\n"
+           "A '-' can be specified in place of an image file to read an image\n"
+           "from stdin.\n\n"
+           "  -h, --help        print this help message and exit\n"
+           "  -v, --verbose     print extra messages\n"
+           "      --version     print the version and exit\n"
+           "  -o, --oob         image contains oob data\n"
+           "  -e, --erase       erase only, do not write image\n"
+          );
+}
+
+void display_version(void)
+{
+    printf(PROGRAM " " VERSION " " COPYRIGHT "\n");
+}
+
+void process_options(int argc, char **argv)
+{
+    while (1)
+    {
+        int c = getopt_long(argc, argv, short_options, long_options, 0);
+
+        if (c == EOF)
+            break;
+
+        switch (c)
+        {
+            case 1:
+                display_version();
+                exit(0);
+                break;
+            case 'h':
+                display_help();
+                exit(0);
+                break;
+            case 'v':
+                option_verbose = 1;
+                break;
+            case 'o':
+                option_oob = 1;
+                break;
+            case 'e':
+                option_erase_only = 1;
+                break;
+            case '?':
+                display_help();
+                exit(1);
+                break;
+        }
+    }
+
+    if (option_erase_only)
+    {
+        if (argc - optind != 1)
+        {
+            display_help();
+            exit(1);
+        }
+        output_filename = argv[optind];
+        input_filename = 0;
+    }
+    else
+    {
+        if (argc - optind != 2)
+        {
+            display_help();
+            exit(1);
+        }
+        output_filename = argv[optind];
+        input_filename = argv[optind + 1];
+    }
+}
+
+ssize_t read_page(int fd, char *buffer, ssize_t buffer_size)
+{
+    ssize_t bytes_read;
+    ssize_t bytes_to_read = buffer_size;
+    char *buffer_ptr = buffer;
+
+    while (1)
+    {
+        bytes_read = read(fd, buffer_ptr, bytes_to_read);
+
+        if (bytes_read == -1)
+        {
+            return -1;
+        }
+
+        bytes_to_read -= bytes_read;
+        buffer_ptr    += bytes_read;
+
+        if (bytes_to_read == 0)
+        {
+            return buffer_size;
+        }
+
+        if (bytes_read == 0)
+        {
+            return (ssize_t)(buffer_ptr - buffer);
+        }
+
+        /* If cannot read the desired number of bytes from the input stream,
+         * we stall for a couple milliseconds to allow the stream buffer to
+         * fill up. This helps when, say, you are piping an image to
+         * nandcombust over a slow network connection.
+         */
+        usleep(5000); /* 5 ms */
+    }
+}
+
+int combust_image(int in_fd, int out_fd, struct mtd_info_user *mtd_info)
+{
+    int ret_val = 1; /* Assume the worst */
+    int finished_writing_image = option_erase_only;
+    unsigned int mtd_offset = 0;
+    unsigned int buffer_size;
+    char *buffer;
+
+    buffer_size = mtd_info->oobblock + (option_oob ? mtd_info->oobsize : 0);
+
+    if ((buffer = (char *)malloc(buffer_size)) == NULL)
+    {
+        fprintf(stderr, "Error: Could not allocate %d byte buffer\n",
+                mtd_info->erasesize);
+        return 1;
+    }
+
+    memset(buffer, 0xff, buffer_size);
+
+    /* Goals:
+     *  1) Write the image to the beginning of the mtd device (partition)
+     *  2) Erase the remainder of the mtd device
+     *
+     * To do this we erase eraseblocks as we go. When we are done writing
+     * the image, we continue to erase eraseblocks until we reach the end
+     * of the device.
+     *
+     * Note that the out-of-bounds data and whether we are writing it or
+     * not does not affect our offset calculations. All relevant sizes and
+     * offsets refer only to in-bounds data.
+     */
+
+    while (mtd_offset < mtd_info->size)
+    {
+        if (mtd_offset % mtd_info->erasesize == 0)
+        {
+            struct erase_info_user erase_info;
+            int bad_block = 0;
+
+            /* Seek to the next available non-bad block */
+            do {
+                loff_t offset_prime = mtd_offset;
+                int ioc_ret = ioctl(out_fd, MEMGETBADBLOCK, &offset_prime);
+
+                verbose(printf("block %5d ", mtd_offset / mtd_info->erasesize));
+
+                if (ioc_ret == -1)
+                {
+                    fprintf(stderr, "Error: MEMGETBADBLOCK failed: %s\n",
+                            strerror(errno));
+                    goto barf_city;
+                }
+                else if (ioc_ret > 0)
+                {
+                    verbose(printf("bad, skipping\n"));
+                    mtd_offset += mtd_info->erasesize;
+                    bad_block = 1;
+                }
+                else
+                {
+                    bad_block = 0;
+                }
+            } while (bad_block);
+
+            /* Erase the block we are about to write */
+            erase_info.length = mtd_info->erasesize;
+            erase_info.start  = mtd_offset;
+
+            if (ioctl(out_fd, MEMERASE, &erase_info) == -1)
+            {
+                fprintf(stderr, "Error: MEMERASE failed: %s\n",
+                        strerror(errno));
+                goto barf_city;
+            }
+
+            verbose(printf("erased "));
+        }
+
+        if (finished_writing_image)
+        {
+            mtd_offset += mtd_info->erasesize;
+            verbose(printf("\n"));
+        }
+        else
+        {
+            ssize_t bytes_written;
+            ssize_t bytes_read;
+
+            bytes_read = read_page(in_fd, buffer, buffer_size);
+
+            if (bytes_read == -1)
+            {
+                fprintf(stderr, "Error: while reading input: %s\n",
+                        strerror(errno));
+                goto barf_city;
+            }
+            else if (bytes_read == 0)
+            {
+                verbose(printf("\nFinished writing image\n"));
+                verbose(fflush(stdout));
+                finished_writing_image = 1;
+
+                /* We are done with this eraseblock, so bump the mtd_offset
+                 * to the next eraseblock
+                 */
+                mtd_offset += mtd_info->erasesize - (mtd_offset % mtd_info->erasesize);
+                continue;
+            }
+            else if (bytes_read < buffer_size)
+            {
+                fprintf(stderr, "Error: not enough bytes in input stream.\n");
+                goto barf_city;
+            }
+
+            if (option_oob)
+            {
+                struct mtd_oob_buf mtd_oob;
+                mtd_oob.start  = mtd_offset;
+                mtd_oob.length = mtd_info->oobsize;
+                mtd_oob.ptr    = buffer + mtd_info->oobblock;
+
+                if (ioctl(out_fd, MEMWRITEOOB, &mtd_oob) == -1)
+                {
+                    fprintf(stderr, "Error: MEMWRITEOOB failed: %s\n",
+                            strerror(errno));
+                    goto barf_city;
+                }
+            }
+
+            if (lseek(out_fd, mtd_offset, SEEK_SET) == -1)
+            {
+                fprintf(stderr, "Error: could not seek to device offset %d: %s\n",
+                        mtd_offset, strerror(errno));
+                goto barf_city;
+            }
+
+            bytes_written = write(out_fd, buffer, mtd_info->oobblock);
+
+            if (bytes_written == -1)
+            {
+                fprintf(stderr, "Error: while writing flash: %s\n",
+                        strerror(errno));
+                goto barf_city;
+            }
+            else if (bytes_written != mtd_info->oobblock)
+            {
+                fprintf(stderr, "Error: could not write %d bytes to device\n",
+                        mtd_info->oobblock);
+                goto barf_city;
+            }
+
+            /* Print out a nifty dot for each page written */
+            verbose(printf("#"));
+            /* And write a newline if it is the last page in an eraseblock */
+            if ((mtd_offset + mtd_info->oobblock) % mtd_info->erasesize == 0)
+            {
+                verbose(printf("\n"));
+                verbose(fflush(stdout));
+            }
+
+            /* Pre-pad the buffer */
+            memset(buffer, 0xff, buffer_size);
+            mtd_offset += mtd_info->oobblock;
+        }
+    }
+
+    if (mtd_offset >= mtd_info->size && !finished_writing_image)
+    {
+        fprintf(stderr, "Error: mtd device full before write completed\n");
+        goto barf_city;
+    }
+
+    verbose(printf("Finished erasing device\n"));
+
+    ret_val = 0; /* Success */
+
+barf_city:
+
+    free(buffer);
+    return ret_val;
+}
+
+int main(int argc, char **argv)
+{
+    int out_fd, in_fd;
+    int ret_val;
+    struct mtd_info_user mtd_info;
+
+    process_options(argc, argv);
+
+    out_fd = open(output_filename, O_RDWR);
+
+    if (out_fd == -1)
+    {
+        fprintf(stderr, "Error: Could not open '%s': %s\n",
+                output_filename, strerror(errno));
+        return 1;
+    }
+
+    if (ioctl(out_fd, MEMGETINFO, &mtd_info) == -1)
+    {
+        fprintf(stderr, "Error: MEMGETINFO failed: %s\n",
+                strerror(errno));
+        return 1;
+    }
+
+    if (mtd_info.type != MTD_NANDFLASH)
+    {
+        fprintf(stderr, "Error: device is not nand flash\n");
+        return 1;
+    }
+
+    if (!(mtd_info.flags & MTD_WRITEABLE))
+    {
+        fprintf(stderr, "Error: device is not writeable\n");
+        return 1;
+    }
+
+    if (option_erase_only)
+    {
+        in_fd = -1;
+    }
+    else
+    {
+        if (strncmp("-", input_filename, 2) == 0)
+        {
+            in_fd = fileno(stdin);
+        }
+        else
+        {
+            in_fd = open(input_filename, O_RDONLY);
+        }
+
+        if (in_fd == -1)
+        {
+            fprintf(stderr, "Error: Could not open '%s': %s\n",
+                    input_filename, strerror(errno));
+            return 1;
+        }
+
+        if (in_fd != fileno(stdin))
+        {
+            struct stat s;
+            int align_size = mtd_info.oobblock +
+                (option_oob ? mtd_info.oobsize : 0);
+
+            if (fstat(in_fd, &s) == -1)
+            {
+                fprintf(stderr, "Error: while doing fstat: %s\n",
+                        strerror(errno));
+                return 1;
+            }
+
+            if (s.st_size % align_size != 0)
+            {
+                fprintf(stderr, "Error: Input file is not page aligned.\n");
+                return 1;
+            }
+        }
+    }
+
+    ret_val = combust_image(in_fd, out_fd, &mtd_info);
+
+    close(in_fd);
+    close(out_fd);
+
+    return ret_val;
+}

--=-uOBcDhlUXHeBiZkBitFa--
