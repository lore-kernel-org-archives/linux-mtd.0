Received: from tps-liv-spam.topcon.com ([12.107.178.116]
 helo=smtpca.topcon.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaeaD-0000kp-QU
 for linux-mtd@lists.infradead.org; Thu, 17 Apr 2014 05:09:58 +0000
Received: from LIV-EXCHCAS2.TOPCON.com (liv-exchcas2.topcon.com [10.1.4.57])
 by smtpca.topcon.com with ESMTP id CC6t5c0mRlX5IPl8 for
 <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2014 22:09:29 -0700 (PDT)
From: Paul McGougan <PMcGougan@topcon.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: tests: Fix endian issue with CRC generation algorithm
Date: Thu, 17 Apr 2014 05:09:26 +0000
Message-ID: <C7589FE7B0DE58488F2B9BF79840E9D90D525AF7@ADL-EXCHMBX1.TOPCON.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The calculation of the CRC in /tests/checkfs/makefiles.c was writing the CRC
Into the produced files in host byte-order which would cause CRC validation
to fail on big-endian systems as the validation is performed bytewise.

Signed-off-by: Paul McGougan <pmcgougan AT topcon.com>
---
tests/checkfs/makefiles.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/checkfs/makefiles.c b/tests/checkfs/makefiles.c
index 662fe86..050ea60 100644
--- a/tests/checkfs/makefiles.c
+++ b/tests/checkfs/makefiles.c
@@ -170,6 +170,7 @@ void checksum(char *filename){
     printf("Error! Cannot open filename to update checksum: %s\n",filename=
);
     exit(1);
   }
+  crc =3D htole16(crc);
   if(fwrite(&crc, sizeof(crc), 1, fp) !=3D 1){
     printf("error! unable to update the file for checksum.\n");
     fclose(fp);


Confidentiality Notice:  This message (including attachments) is a private =
communication solely for use of the intended recipient(s).  =0D
If you are not the intended recipient(s) or believe you received this messa=
ge in error, notify the sender immediately and then delete this =0D
message.  Any other use, retention, dissemination or copying is prohibited =
and may be a violation of law, including the Electronic =0D
Communication Privacy Act of 1986."
