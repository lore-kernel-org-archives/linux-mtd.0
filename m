Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14qzzV-0004wr-00
	for mtd-list@infradead.org; Sat, 21 Apr 2001 17:12:09 +0100
Received: from enst.enst.fr ([137.194.2.16])
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14qzzU-0004wa-00
	for mtd@infradead.org; Sat, 21 Apr 2001 17:12:09 +0100
Received: from email.enst.fr (muse.enst.fr [137.194.2.33])
	by enst.enst.fr (Postfix) with ESMTP id E15C61C8DA
	for <mtd@infradead.org>; Sat, 21 Apr 2001 18:11:59 +0200 (MET DST)
Received: from FABRICE (droopy.maisel1.rezel.enst.fr [137.194.8.239])
	by email.enst.fr (8.9.3/8.9.3) with ESMTP id SAA28552
	for <mtd@infradead.org>; Sat, 21 Apr 2001 18:11:42 +0200 (MET DST)
Date: Sat, 21 Apr 2001 18:11:12 +0200
From: Fabrice Gautier <gautier@email.enst.fr>
To: mtd@infradead.org
Subject: Mapping for JEDEC and CFI
Message-Id: <20010421180325.DAC3.GAUTIER@email.enst.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I think there is a problem in Config.in wrt CFI and JEDEC custom
mapping.

What's the differnece between CONFIG_MTD_PHYSMAP:

   dep_tristate '  CFI Flash device in physical memory map' CONFIG_MTD_PHYSMAP $CONFIG_MTD_CFI
   if [ "$CONFIG_MTD_PHYSMAP" = "y" -o "$CONFIG_MTD_PHYSMAP" = "m" ]; then
      hex '    Physical start address of flash mapping' CONFIG_MTD_PHYSMAP_START 0x8000000
      hex '    Physical length of flash mapping' CONFIG_MTD_PHYSMAP_LEN 0x4000000
      int '    Bus width in octets' CONFIG_MTD_PHYSMAP_BUSWIDTH 2
   fi

and  CONFIG_MTD_CSTM_CFI_JEDEC:

   dep_tristate '  CFI and JEDEC Flash device mapping on custom board' CONFIG_MTD_CSTM_CFI_JEDEC $CONFIG_MTD_CFI
   if [ "$CONFIG_MTD_CSTM_CFI_JEDEC" = "y" -o "$CONFIG_MTD_CSTM_CFI_JEDEC" = "m" ]; then
      hex '    Physical start address of flash mapping' CONFIG_MTD_PHYSMAP_START 0x8000000
      hex '    Physical length of flash mapping' CONFIG_MTD_PHYSMAP_LEN 0x4000000
      int '    Bus width in octets' CONFIG_MTD_PHYSMAP_BUSWIDTH 2
      define_bool CONFIG_MTD_JEDEC y
   fi


And by the way, why the support for custom JEDEC mapping is here and not
with the JEDEC driver?

Thanks
-- 
Fabrice Gautier <gautier@email.enstfr>



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
