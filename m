Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Zjq1-0005rc-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 04:07:49 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <FA06AA2C99BCD511951200005A99441001E3ECC9@irvexch1.sextantifs.com> 
References: <FA06AA2C99BCD511951200005A99441001E3ECC9@irvexch1.sextantifs.com> 
To: "Curtis, Allen" <Allen.Curtis@Thales-IFS.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: jffs2_scan_eraseblock() - errors 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 31 Jul 2002 04:07:45 +0100
Message-ID: <20909.1028084865@redhat.com>
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

Allen.Curtis@Thales-IFS.com said:
>  INOCACHE_HASHSIZE was set to 1. Changed this to 128 and....
> real	47.258s sys	47.25s

Hmm. Out of interest, What happens if you apply this? Again, profile data 
are useful :)

DO NOT LEAVE THIS IN. It disables the CRC32 check on nodes during mount. 
It's the first (and easy) part of the proof-of-concept which involves 
moving said CRC32 check to later so the mount doesn't have to wait for it.

Index: scan.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/scan.c,v
retrieving revision 1.51.2.3
diff -u -p -r1.51.2.3 scan.c
--- scan.c	25 Jul 2002 20:49:06 -0000	1.51.2.3
+++ scan.c	31 Jul 2002 03:06:44 -0000
@@ -467,7 +467,7 @@ static int jffs2_scan_inode_node(struct 
 		ri.csize = 0;
 	}
 
-	if (ri.csize) {
+	if (0 && ri.csize) {
 		/* Check data CRC too */
 		unsigned char *dbuf;
 		__u32 crc;


--
dwmw2
