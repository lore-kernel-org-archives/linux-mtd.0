Received: from mail.utfors.se ([195.58.103.125] helo=blooper.utfors.se)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Jsky-0002JZ-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2002 10:25:04 +0100
Received: from there ([212.105.56.242])
	by blooper.utfors.se (Utfors AB) with SMTP id g5H9OXJJ003077
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2002 11:24:33 +0200 (MEST)
Message-Id: <200206170924.g5H9OXJJ003077@blooper.utfors.se>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
To: linux-mtd@lists.infradead.org
Subject: point()/unpoint() questions + small cfi_cmdset_0001.c patch
Date: Mon, 17 Jun 2002 11:24:33 +0200
References: <0111121314140A.28381@jocke.lumentis.se> <02012911331100.15969@jocke.lumentis.se> <02022614424803.15969@jocke.lumentis.se>
In-Reply-To: <02022614424803.15969@jocke.lumentis.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi all

I am looking into using point()/unpoint() in scan.c instead of mtd->read(). A few questions:

1)  There is no point()/unpoint() function pointers in struct map_info, so I wounder where one should
     add the point()/unpoint() functions?

2)  It is not clear to me how the semantics for point()/unpoint() works, is the following sequence legal:
     point()
     ...
     read()
     ...
     point()
     ....
     point()
     ....
     unpoint()
     ...
     write()



Also here is a small patch which fixes 2 bugs:
 1) Flash always reports these in litte endian. This corrects things on a BE CPU.
 2) Was doing if ( (!*p) & 2), should be if (! (*p &2))

Index: cfi_cmdset_0001.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0001.c,v
retrieving revision 1.98
diff -u -r1.98 cfi_cmdset_0001.c
--- cfi_cmdset_0001.c   16 Jun 2002 17:14:06 -0000      1.98
+++ cfi_cmdset_0001.c   17 Jun 2002 09:17:05 -0000
@@ -156,9 +156,9 @@
                }

                /* Do some byteswapping if necessary */
-               extp->FeatureSupport = cfi32_to_cpu(extp->FeatureSupport);
-               extp->BlkStatusRegMask = cfi32_to_cpu(extp->BlkStatusRegMask);
-               extp->ProtRegAddr = cfi32_to_cpu(extp->ProtRegAddr);
+               extp->FeatureSupport = le32_to_cpu(extp->FeatureSupport);
+               extp->BlkStatusRegMask = le16_to_cpu(extp->BlkStatusRegMask);
+               extp->ProtRegAddr = le16_to_cpu(extp->ProtRegAddr);

 #ifdef DEBUG_CFI_FEATURES
                /* Tell the user about it in lots of lovely detail */
@@ -300,7 +300,7 @@
         */
        switch (chip->state) {
        case FL_ERASING:
-               if (!((struct cfi_pri_intelext *)cfi->cmdset_priv)->FeatureSupport & 2)
+               if (!(((struct cfi_pri_intelext *)cfi->cmdset_priv)->FeatureSupport & 2))
                        goto sleep; /* We don't support erase suspend */

                cfi_write (map, CMD(0xb0), cmd_addr);
