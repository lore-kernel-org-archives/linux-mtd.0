Received: from [216.166.168.36] (helo=vpmail.theglobal.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A6ZEr-000251-3v
	for <linux-mtd@lists.infradead.org>; Mon, 06 Oct 2003 18:33:41 +0100
From: Tim Gardner <timg@tpi.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 6 Oct 2003 11:32:47 -0600
References: <200310021344.14931.timg@tpi.com>
	<200310060713.13344.timg@tpi.com>
	<1065446123.22491.191.camel@hades.cambridge.redhat.com>
In-Reply-To: <1065446123.22491.191.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Message-Id: <200310061132.47410.timg@tpi.com>
Content-Type: Multipart/Mixed;
  boundary="------------Boundary-00=_NEJCXE8JVKUOF9J4A15Z"
cc: linux-mtd@lists.infradead.org
Subject: Re: Patches to nanddump.c
Reply-To: timg@tpi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--------------Boundary-00=_NEJCXE8JVKUOF9J4A15Z
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Since the patch is nearly as large as the file, I've just attached the fi=
le=20
itself. The default options are sane in that it prints an ASCII dump of t=
he=20
specified partition to stdout. Usage output is:

[root@ppc /]$ nanddump -h
usage: nanddump
-p MTD_PARTITION  - MTD partition to dump from, e,g, /dev/mtd0
[-o DUMP_FILE]    - file to dump to, default is stdout
[-a ADDR]         - starting offset within the MTD partition, default 0
[-l LENGTH]       - Number of bytes to dump, default is size of partition
[-n]              - Omit OOB information in dump.
[-b]              - binary dump of data. Default is ASCII hex
[-v]              - verbose output.
[-h]              - Print this help message.

On Monday 06 October 2003 07:15, David Woodhouse wrote:
> On Mon, 2003-10-06 at 07:13 -0600, Tim Gardner wrote:
> > Using getopt will break command line option backward compatibility, w=
hich
> > is fine with me because it would clean up some parsing code. Any
> > objections?
>
> Nope. It's mostly a debugging tool anyway.

--=20
Tim Gardner - timg@tpi.com 406-443-5357
TriplePoint, Inc. - http://www.tpi.com
PGP: http://www.tpi.com/PGP/Tim.txt
--------------Boundary-00=_NEJCXE8JVKUOF9J4A15Z
Content-Type: text/x-csrc;
  charset="iso-8859-1";
  name="nanddump.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="nanddump.c"

/*
 *  nanddump.c
 *
 *  Copyright (C) 2000 David Woodhouse (dwmw2@infradead.org)
 *                     Steven J. Hill (sjhill@realitydiluted.com)
 *
 * $Id: nanddump.c,v 1.12 2003/02/20 13:34:20 sjhill Exp $
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 *  Overview:
 *   This utility dumps the contents of raw NAND chips or NAND
 *   chips contained in DoC devices. NOTE: If you are using raw
 *   NAND chips, disable NAND ECC in your kernel.
 */

#define _GNU_SOURCE
#include <ctype.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>

#include <asm/types.h>
#include <linux/mtd/mtd.h>

/*
 * Buffers for reading data from flash
 */
unsigned char readbuf[512];
unsigned char oobbuf[16];

static void
usage(char *p)
{
	fprintf(stderr,"usage: %s \n"
		"-p MTD_PARTITION  - MTD partition to dump from, e,g, /dev/mtd0\n"
		"[-o DUMP_FILE]    - file to dump to, default is stdout\n"
		"[-a ADDR]         - starting offset within the MTD partition, default 0\n"
		"[-l LENGTH]       - Number of bytes to dump, default is size of partition\n"
		"[-n]              - Omit OOB information in dump.\n"
		"[-b]              - binary dump of data. Default is ASCII hex\n"
		"[-v]              - verbose output.\n" 
		"[-h]              - Print this help message.\n",
		p
	);
	exit(1);
}

/*
 * Main program
 */
int main(int argc, char **argv)
{
	unsigned long ofs;
	int c, i, fd, bs, end_addr;
	int ofd=STDOUT_FILENO;
	int start_addr=0;
	int pretty_print=1;
	int no_oob=0;
	struct mtd_oob_buf oob = {0, 16, oobbuf};
	mtd_info_t meminfo;
	unsigned char pretty_buf[80];
	char *mtd_partition=NULL;
	char *ofile=NULL;
	int length;
	int verbose=0;

	while ((c=getopt(argc,argv,"p:o:a:l:nbvh")) >= 0)
	{
		switch (c)
		{
		case 'p':
			mtd_partition = optarg;
			break;
		case 'o':
			ofile = optarg;
			break;
		case 'a':
			if (sscanf(optarg,"%d",&start_addr) != 1)
			{
				fprintf(stderr,"Could not scan starting offset [-a]\n");
				usage(argv[0]);
			}
			break;
		case 'l':
			if (sscanf(optarg,"%d",&length) != 1)
			{
				fprintf(stderr,"Could not scan length [-l] from '%s'\n",optarg);
				usage(argv[0]);
			}
			break;
		case 'n':
			no_oob = 1;
			break;
		case 'b':
			pretty_print = 0;
			break;
		case 'v':
			verbose = 1;
			break;
		case 'h':
			usage(argv[0]);
			break;
		default:
			fprintf(stderr,"Unknown option '%s'\n",argv[optind]);
			usage(argv[0]);
			break;
		}
	}

	if (mtd_partition == NULL)
	{
		fprintf(stderr,"No MTD partition [-p].\n");
		usage(argv[0]);
	}

	/* Open MTD device */
	if ((fd = open(mtd_partition, O_RDONLY)) == -1) {
		perror("open flash");
		exit (1);
	}

	/* Fill in MTD device capability structure */   
	if (ioctl(fd, MEMGETINFO, &meminfo) != 0) {
		perror("MEMGETINFO");
		close(fd);
		exit (1);
	}

	/* Make sure device page sizes are valid */
	if (!(meminfo.oobsize == 16 && meminfo.oobblock == 512) &&
	    !(meminfo.oobsize == 8 && meminfo.oobblock == 256)) {
		fprintf(stderr,"Unknown flash (not normal NAND)\n");
		close(fd);
		exit(1);
	}
	bs = meminfo.oobblock;

	if (verbose) fprintf(stderr,"NAND block size %u Oob block %u\n", meminfo.oobblock,meminfo.oobsize);

	/* Open output file for writing */
	if (ofile && ((ofd = open(ofile, O_WRONLY | O_TRUNC | O_CREAT, 0644)) < 0)) {
		perror ("open outfile");
		close(fd);
		exit(1);
	}

	/* Align start address and length */
	start_addr &= (~(bs - 1));
	length &= (~(bs - 1));

	/* Compute ending address. */
	end_addr = meminfo.size;
	if (length && ((length + start_addr) < end_addr))
	{
		end_addr = start_addr + length;
	}

	/* Print informative message */
	if (verbose)
		fprintf(stderr,"Dumping data starting at 0x%08x and ending at 0x%08x...\n",
			start_addr, end_addr);

	/* Dump the flash contents */
	for (ofs = start_addr; ofs < end_addr ; ofs+=bs) {

		/* Read page data and exit on failure */
		if (pread(fd, readbuf, bs, ofs) != bs) {
			perror("pread");
			close(fd);
			close(ofd);
			exit(1);
		}

		/* Write out page data */
		if (pretty_print) {
			for (i = 0; i < bs; i += 16) {
				sprintf(pretty_buf,
					"0x%08x: %02x %02x %02x %02x %02x %02x %02x "
					"%02x %02x %02x %02x %02x %02x %02x %02x %02x\n",
					(unsigned int) (ofs + i),  readbuf[i],
					readbuf[i+1], readbuf[i+2],
					readbuf[i+3], readbuf[i+4],
					readbuf[i+5], readbuf[i+6],
					readbuf[i+7], readbuf[i+8],
					readbuf[i+9], readbuf[i+10],
					readbuf[i+11], readbuf[i+12],
					readbuf[i+13], readbuf[i+14],
					readbuf[i+15]);
				write(ofd, pretty_buf, 60);
			}
		} else
			write(ofd, readbuf, bs);

		/* Read OOB data and exit on failure */
		oob.start = ofs;
		if (verbose) fprintf(stderr,"Dumping %lx\n", ofs);
		if (ioctl(fd, MEMREADOOB, &oob) != 0) {
			perror("ioctl(MEMREADOOB)");
			close(fd);
			close(ofd);
			exit(1);
		}

		/* Write out OOB data */
		if ((!no_oob) && pretty_print) {
			if (meminfo.oobsize == 16) {
				sprintf(pretty_buf, "  OOB Data: %02x %02x %02x %02x %02x %02x "
					"%02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n",
					oobbuf[0], oobbuf[1], oobbuf[2],
					oobbuf[3], oobbuf[4], oobbuf[5],
					oobbuf[6], oobbuf[7], oobbuf[8],
					oobbuf[9], oobbuf[10], oobbuf[11],
					oobbuf[12], oobbuf[13], oobbuf[14],
					oobbuf[15]);
				write(ofd, pretty_buf, 60);
			} else {
				sprintf(pretty_buf, "  OOB Data: %02x %02x %02x %02x %02x %02x "
					"%02x %02x\n",
					oobbuf[0], oobbuf[1], oobbuf[2],
					oobbuf[3], oobbuf[4], oobbuf[5],
					oobbuf[6], oobbuf[7]);
				write(ofd, pretty_buf, 48);
			}
		} else if (!no_oob)
			write(ofd, oobbuf, meminfo.oobsize);
	}

	/* Close the output file and MTD device */
	close(fd);
	close(ofd);

	/* Exit happy */
	return 0;
}

--------------Boundary-00=_NEJCXE8JVKUOF9J4A15Z--
