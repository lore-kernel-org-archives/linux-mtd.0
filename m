Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UailY-0002Hr-N7
 for linux-mtd@lists.infradead.org; Fri, 10 May 2013 08:33:25 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Mike Frysinger <vapier@gentoo.org>
Subject: [mtd-utils] nanddump: print ecc.stat info after reading
Date: Fri, 10 May 2013 08:32:50 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9C3862@DBDE04.ent.ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mike,=20

One more request..=20
Shouldn't the following ecc.stat info moved after actual mtd_read() ?

fprintf(stderr, "ECC failed: %d\n", stat1.failed);
fprintf(stderr, "ECC corrected: %d\n", stat1.corrected);
fprintf(stderr, "Number of bad blocks: %d\n", stat1.badblocks);
fprintf(stderr, "Number of bbt blocks: %d\n", stat1.bbtblocks);

Currently this info is printed, before the actual reads happen on
MTD device. I'm not sure if this was intended for some other purpose?

-----------------------------------------------------------------

diff --git a/nanddump.c b/nanddump.c
index be458c6..ac0f299 100644
--- a/nanddump.c
+++ b/nanddump.c
        /* Open output file for writing. If file name is "-", write to stan=
dard
@@ -476,6 +464,18 @@ int main(int argc, char * const argv[])
                        write(ofd, oobbuf, mtd.oob_size);
        }

+       /* check if we can read ecc stats */
+       if (!noecc && !ioctl(fd, ECCGETSTATS, &stat1)) {
+               eccstats =3D true;
+               if (!quiet) {
+                       fprintf(stderr, "ECC failed: %d\n", stat1.failed);
+                       fprintf(stderr, "ECC corrected: %d\n", stat1.correc=
ted);
+                       fprintf(stderr, "Number of bad blocks: %d\n", stat1=
.badblocks);
+                       fprintf(stderr, "Number of bbt blocks: %d\n", stat1=
.bbtblocks);
+               }
+       } else {
+                       perror("No ECC status information available");
+       }
        /* Close the output file and MTD device, free memory */
        close(fd);
        close(ofd);


with regards, pekon
