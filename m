Received: from albatross-ext.wise.edt.ericsson.se ([194.237.142.116])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15c7TF-0005KK-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2001 16:41:37 +0100
Received: from mbb4.ericsson.se (mbb4.ericsson.se [136.225.152.56])
	by albatross.wise.edt.ericsson.se (8.11.0/8.11.0/WIREfire-1.3) with ESMTP id f7TFlYK14482
	for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2001 17:47:34 +0200 (MEST)
Received: from switchboard.ericsson.se
 (kieraypc01.p.y.ki.era.ericsson.se [147.214.82.33])
 by mbb4.ericsson.se (PMDF V5.2-33 #39350)
 with ESMTP id <0GIU00M3F6J9XH@mbb4.ericsson.se> for
 linux-mtd@lists.infradead.org; Wed, 29 Aug 2001 17:47:33 +0200 (MET DST)
Date: Wed, 29 Aug 2001 17:47:33 +0200
From: Kenneth Johansson <kenneth.johansson@inn.ericsson.se>
Subject: Problem with mmap
To: mtd <linux-mtd@lists.infradead.org>
Message-id: <3B8D0E95.FF94487@inn.ericsson.se>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_741nQUF/f7MGkweW8Tenmg)"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This is a multi-part message in MIME format.

--Boundary_(ID_741nQUF/f7MGkweW8Tenmg)
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 8BIT

Here is a program that works on ext2 but not on jffs2.


-- 
Kenneth Johansson	
Ericsson Business Innovation AB   Tel: +46 8 404 71 83
Viderögatan 3                     Fax: +46 8 404 72 72
164 80 Stockholm                  kenneth.johansson@inn.ericsson.se

--Boundary_(ID_741nQUF/f7MGkweW8Tenmg)
Content-type: text/plain; name=fail1.c; charset=us-ascii
Content-disposition: inline; filename=fail1.c
Content-transfer-encoding: 7BIT

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <stdio.h>
#include <string.h>

static const char *file = "mmap_file";
#define FILE_SIZE 8192

int main ()
{
   int i,fd;
   unsigned char *map;

   if ((fd = open ("mmap_file",O_RDWR|O_CREAT)) < 0) {
       printf("Could not open file %s\n",file);
       perror (NULL);
       exit (1);
   }

    map = mmap (NULL,
	       FILE_SIZE,
	       PROT_READ | PROT_WRITE,
	       MAP_SHARED,
	       fd,
	       0);

   if (map == MAP_FAILED){
       printf("Could not mmap file %s\n",file);
       perror (NULL);
       exit (1);
   }
   
   printf("mmap of file %s OK\n",file);

   munmap (map,FILE_SIZE);
   close (fd);
   exit (0);
}


--Boundary_(ID_741nQUF/f7MGkweW8Tenmg)--
