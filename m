Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Vkey-0000Z6-00
	for mtd-list@infradead.org; Thu, 22 Feb 2001 01:35:08 +0000
Received: from [203.238.93.91] (helo=hades.idis.co.kr ident=mail)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Vkex-0000YF-00
	for mtd@infradead.org; Thu, 22 Feb 2001 01:35:07 +0000
Received: from cwryu by hades.idis.co.kr with local (Exim 3.22 #1 (Debian))
	id 14Vkbn-00008u-00
	for <mtd@infradead.org>; Thu, 22 Feb 2001 10:31:51 +0900
To: mtd@infradead.org
Subject: kernel/jedec.c bug?
MIME-Version: 1.0
Content-Type: text/plain; charset=euc-kr
Content-Transfer-Encoding: 8bit
From: Changwoo Ryu <cwryu@debian.org>
Date: 22 Feb 2001 10:31:51 +0900
Message-ID: <871ysrcxko.fsf@hades.idis.co.kr>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hello,

I'm using the MachZ (x86 compatible PC-on-a-chip) evaluation system.
It is equipped with AM29F017 2MB (8bit * 256k) flash, which is
compatible with AM29F016 except the device ID (0x3D).  But I failed to
erase a block at flash_earse() function in jedec.c.  Here it is:


         /* During erase bit 7 is held low and bit 6 toggles, we watch this,
            should it stop toggling or go high then the erase is completed,
            or this is not really flash ;> */
         Last[0] = map->read32(map,(chip->base >> chip->addrshift) + chip->start
 + off);
         Last[1] = map->read32(map,(chip->base >> chip->addrshift) + chip->start
 + off);
         Last[2] = map->read32(map,(chip->base >> chip->addrshift) + chip->start
 + off);
         Count = 3;
         while (todo_left != 0)
         {
            for (J = 0; J != 4; J++)
            {
               __u8 Byte1 = (Last[(Count-1)%4] >> (J*8)) & 0xFF;
               __u8 Byte2 = (Last[(Count-2)%4] >> (J*8)) & 0xFF;
               __u8 Byte3 = (Last[(Count-3)%4] >> (J*8)) & 0xFF;
               if (todo[J] == 0)
                  continue;
               
               if ((Byte1 & (1 << 7)) == 0 && Byte1 != Byte2)
               {
//                printk("Check %x %x %x\n",(short)J,(short)Byte1,(short)Byte2);
                  continue;
               }
               
               if (Byte1 == Byte2)
               {
                  jedec_flash_failed(Byte3);
                  return -EIO;
               }


Last[0], Last[1] and Last[2] for my flash are all "0x084C084C".  It's
ok, isn't?  Reading 32bit data requires 4 reads (0x08, 0x4C, 0x08,
0x4C) from the 8bit flash.  So when the erasure is not completed, the
two 32bit values should be same.

-- 
Changwoo Ryu


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
