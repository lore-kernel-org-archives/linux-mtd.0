Received: from darwin.altera.com ([66.35.227.3])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17u8w6-00039N-00
	for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2002 10:58:26 +0100
Received: from Altera.COM (sunrise [137.57.1.1])
	by darwin.altera.com (8.10.2+Sun/8.10.2) with ESMTP id g8P9tMs17957
	for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2002 02:55:22 -0700 (PDT)
Received: from localhost (localhost [[UNIX: localhost]])
	by localhost.localdomain (8.11.6/8.11.6) id g8P9vkh20983
	for linux-mtd@lists.infradead.org; Wed, 25 Sep 2002 10:57:46 +0100
Message-Id: <200209250957.g8P9vkh20983@localhost.localdomain>
Content-Type: text/plain;
  charset="iso-8859-15"
From: Clive Davies <cdavies@altera.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Bugfix in cfi_intelext_read_prot_reg
Date: Wed, 25 Sep 2002 10:57:46 +0100
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

This patch fixes a bug with the calculation of which byte to read from the 
protection regsietsr which are presennt in some Intel flash devices.

Index: cfi_cmdset_0001.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0001.c,v
retrieving revision 1.102
diff -u -p -r1.102 cfi_cmdset_0001.c
--- cfi_cmdset_0001.c   13 Sep 2002 14:39:34 -0000      1.102
+++ cfi_cmdset_0001.c   25 Sep 2002 09:46:16 -0000
@@ -527,7 +527,7 @@ static int cfi_intelext_read_prot_reg (s

                cfi_send_gen_cmd(0x90, 0x55,chip->start, map, cfi, cfi->device_type, NULL);
                while(count && ((offst-base_offst)<reg_sz)){
-                       *buf=map->read8(map,(chip->start+(extp->ProtRegAddr*ofs_factor)+offst));
+                       *buf=map->read8(map,(chip->start+((extp->ProtRegAddr+1)*ofs_factor)+offst));
                        buf++;
                        offst++;
                        count--;
