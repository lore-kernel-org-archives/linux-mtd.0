Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14YwPT-00037r-00
	for mtd-list@infradead.org; Fri, 02 Mar 2001 20:44:19 +0000
Received: from [212.87.56.100] (helo=mail.taytron.net)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14YwPQ-00037l-00
	for mtd@infradead.org; Fri, 02 Mar 2001 20:44:18 +0000
From: "Florian Schirmer / TayTron" <schirmer@taytron.net>
To: <mtd@infradead.org>
Subject: Some bugs
Date: Fri, 2 Mar 2001 21:44:00 +0100
Message-ID: <BKEKLBIBFPNGJKJDEODFKEBIEIAA.schirmer@taytron.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi!

Thanks a lot for this great piece of software!

While playing with it i noticed some bugs:



1. CFI-Intel P_ID 3 not supported

We have 2 interlaced Intel TE28F320 chips. They report P_ID = 3 which isnt
handled by mtd. After forcing this value to 1 by hand everything works very
well.

Workaround: cfi_probe.c ~ line 562:

/* Do any necessary byteswapping */
cfi.cfiq->P_ID = le16_to_cpu(cfi.cfiq->P_ID);

if (cfi.cfiq->P_ID == 3)
  cfi.cfiq->P_ID = 1;

cfi.cfiq->P_ADR = le16_to_cpu(cfi.cfiq->P_ADR);



2. CFI-Intel 16 Bit mode broken

Intel 16 bit wide access is broken because the extended query table is read
via read8() calls. Using cfi_read_query instead solves this issue.

Workaround: cfi_cmd_set_0001.c ~ line 105:

/* Read in the Extended Query Table */
for (i=0; i<sizeof(*extp); i++) {
  ((unsigned char *)extp)[i] =
     cfi_read_query(map, (base+((adr+i)*cfi->interleave*cfi->device_type)));
}


3. Write support is broken on ppc because of endianess problem

cat bla.img > /dev/mtd/0
cat /dev/mtd/0 > bla2.img

Results in a swapped file. I can only _guess_ where the problem is exactly.
Reading is done via read_fromio() while writing is done by using writew()
calls. One of these funtions seem to swapp the bytes. Maybe it isnt really a
mtd isse. Maybe it's my fault. I've read something in one of the include
files about the endianess issue but did not find the information again.

Workaround:

cfi_cmd_set.c ~ line 468:

ENABLE_VPP(map);
cfi_write(map, CMD(0x40), adr);
cfi_write(map, ___arch__swab16(datum), adr);  <--- added swab16
chip->state = FL_WRITING;


cfi_cmd_set.c ~ line 748:

if (cfi_buswidth_is_1()) {
   map->write8 (map, *((__u8*)buf)++, adr+z);
} else if (cfi_buswidth_is_2()) {
   map->write16 (map, ___arch__swab16(*((__u16*)buf)++), adr+z);  <--- added
swab16 (only for 16 bit type chips)
} else if (cfi_buswidth_is_4()) {
   map->write32 (map, *((__u32*)buf)++, adr+z);
} else {
   DISABLE_VPP(map);
   return -EINVAL;
}


4. Erase size is wrong

Chip is an CFI-Intel F640. Erase size is 128KB (reported correctly by mtd
while probing for the chip (DEBUG_CFI)!).

cfi_probe.c ~ 583:

printk("  Erase Region #%d: BlockSize 0x%4.4X bytes, %d blocks\n",
              i, (cfi.cfiq->EraseRegionInfo[i] >> 8) & ~0xff,
              (cfi.cfiq->EraseRegionInfo[i] & 0xffff) + 1);

Works corretly.

cfi_cmd_set.c ~ line 223:

mtd->erasesize = cfi16_to_cpu( (u16)(cfi->cfiq->EraseRegionInfo[0]
                                        >> 16) )*256 * cfi->interleave;

Calculates the wrong size (0x2000 instead of 0x20000) as far as i correctly
remember.


Workaround: cfi_cmd_set.c ~ line 223 (Ugly hack :-):

/* We have to assume that all the erase blocks are the same size. */
//mtd->erasesize = cfi16_to_cpu( (u16)(cfi->cfiq->EraseRegionInfo[0]
//                                        >> 16) )*256 * cfi->interleave;
mtd->erasesize = 128*1024;
/* Also select the correct geometry setup too */


Maybe this information helps a bit to fix the last bugs in mtd :) If more
infos are needed please contact me!

Thanks a lot!
   Florian Schirmer



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
