Received: from koko.iders.ca ([206.45.72.61])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MYRs8-0007Nk-3Y
	for linux-mtd@lists.infradead.org; Tue, 04 Aug 2009 21:48:44 +0000
Received: from [200.123.101.231] (zen.iders.ca [200.123.101.231])
	by koko.iders.ca (Postfix) with ESMTP id 5D04E3E400A
	for <linux-mtd@lists.infradead.org>;
	Tue,  4 Aug 2009 16:26:08 -0500 (CDT)
Message-ID: <4A78A76F.4080702@iders.ca>
Date: Tue, 04 Aug 2009 16:26:07 -0500
From: Andrew McKay <amckay@iders.ca>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: ECC not appearing in OOB
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm having some issues with a YAFFS2 filesystem on a Micron NAND part 
(MT29F16G08DAA).  The NAND part has 4K pages and 128bit spare area.  My kernel 
version is 2.6.20.4 which didn't support 4K page NAND ports.  I had patch in 
changes for 4K parts.

Since I was having errors with the filesystem I went back to testing the NAND 
part with raw binary accesses.  Neither writing nandwrite (in mtd-utils) or dd 
seems to add ECC information in the OOB block.  I copied a section of a large 
binary file with the following command:

dd if=../nand_testing/binblob of=/dev/mtdblock12 bs=1024 count=10240

When I dump the nand with nanddump, it prints out the following for the first page:

/mnt/zen/mtd-utils # ./nanddump -p /dev/mtd12
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 10
Number of bbt blocks: 0
Block size 262144, page size 4096, OOB size 128
Dumping data starting at 0x00000000 and ending at 0x80000000...
0x00000000: 92 89 30 f4 b4 67 4f e7 48 d1 1f d9 00 d6 f9 22
0x00000010: a2 62 e2 5e 72 91 fa 11 15 64 35 27 f4 fe 2c 49
0x00000020: 4d 5c 78 82 dd 98 d3 9c 1e 2d 3b fd 8e 31 ee 7c
0x00000030: ec 3c 18 65 1c 01 ae a0 0a 19 32 e6 92 67 6c 2e
0x00000040: 92 e2 bb 4f 71 e3 00 ec a2 be 6a fa 6c 51 45 b9
0x00000050: 00 ef 0f df 44 9e a8 c1 3d 83 16 1e 05 bd e5 6d
0x00000060: 55 3c 79 e7 24 1f 2e 7f 60 cc 43 ed 43 30 c8 fb
0x00000070: ae a6 d3 dd 90 2e 01 a1 27 d2 b5 26 58 4c 7b 65
0x00000080: 8c 83 3a a0 a1 01 78 15 07 44 4f 48 4a db af a1
0x00000090: 32 3e 12 08 00 cf 98 86 65 c8 bc c0 5a 05 78 1c
0x000000a0: 79 af 88 63 c3 e4 e2 eb 90 2d 2a aa 53 16 bf 22
0x000000b0: 2f 81 00 fd 33 b4 4f 58 7d c2 fd 09 0d 94 9d 42
0x000000c0: be ee 85 69 2f 83 e0 fc 15 43 36 52 c4 5c 9d 58
0x000000d0: 02 ec 0c b4 d9 ac c7 16 e7 dc 7d c8 3d d2 43 a0
0x000000e0: 62 12 c8 af 1f bb ff e8 44 e6 8a 7c 04 54 b7 d7
0x000000f0: ca 32 2e 4d bc 54 21 a4 00 e6 bf 1c d3 b0 c9 8d
...[trim]...
0x00000f10: 0b 9c cb d4 e1 f6 cb 62 f6 93 9f 48 8d cc af 53
0x00000f20: b0 ae 99 e6 0b 99 65 1e 0c e0 6f 06 5d 64 75 16
0x00000f30: 82 eb 09 0a 7d 39 a5 23 ae 71 56 1a d2 0e 59 20
0x00000f40: f3 48 bf 6c ea 00 9d 7a 10 e3 16 b8 d6 5f d9 2f
0x00000f50: 28 f8 28 1d 0e df 41 05 32 5b 0f 02 28 ea 5f 8f
0x00000f60: a6 80 da 34 1c 3f a3 09 90 dc 95 e2 fe 5d 56 12
0x00000f70: d0 6e 59 5f 75 81 43 72 99 d9 44 fb 3e 15 09 da
0x00000f80: 8d 17 c1 90 56 22 6b c2 b9 47 11 c3 f0 ad 32 63
0x00000f90: a4 a5 45 8b e6 f6 81 4a 2b d5 e2 6f ae a0 d5 c7
0x00000fa0: 76 9c f4 f2 4c 70 7a 48 bb 6a 5e 8a ad 8f 0f 82
0x00000fb0: c0 4f 47 74 4d 01 cb 1e d1 f0 19 3a fa 91 5a e0
0x00000fc0: 63 d8 7e 95 27 04 79 99 15 6b 50 d1 39 9d 30 3c
0x00000fd0: d5 82 8a f5 ec 59 d0 41 4f 1b 1c 68 b4 1e 40 de
0x00000fe0: 9b e5 31 16 f3 01 e7 a7 c4 9f 48 24 67 61 76 4e
0x00000ff0: 9a bc ba 63 74 39 56 c6 6b d4 c2 ce 4e 43 e6 1d
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff

Shouldn't there be ECC information in the last 48 bytes of the OOB Data section? 
  My NAND driver is setup for NAND_ECC_SOFT.

I'm wondering if I missed some other things to patch at the MTD level.  I 
applied the following changes to the Kernel to support the 4K NAND part.

Index: linux/drivers/mtd/nand/nand_base.c
diff -c linux/drivers/mtd/nand/nand_base.c:1.1.2.2.2.1 
linux/drivers/mtd/nand/nand_base.c:1.1.2.2.2.1.2.1 
                                    *** 
linux/drivers/mtd/nand/nand_base.c:1.1.2.2.2.1  Thu Dec  6 18:25:34 2007 
  --- linux/drivers/mtd/nand/nand_base.c  Wed Jul  8 12:51:53 2009 
        *************** 
              *** 81,86 **** 
                    --- 81,100 ---- 
                                 .length = 38}} 
                                  }; 
 
                                            + static struct nand_ecclayout 
nand_oob_128 = {                                      +   .eccbytes = 48, 
                                                            +   .eccpos = { 
                                                                  +        80, 
81, 82, 83, 84, 85, 86, 87,                                             + 
  88, 89, 90, 91, 92, 93, 94, 95,                                             + 
        96, 97, 98, 99, 100, 101, 102, 103, 
     +        104, 105, 106, 107, 108, 109, 110, 111, 
           +        112, 113, 114, 115, 116, 117, 118, 119, 
                 +        120, 121, 122, 123, 124, 125, 126, 127}, 
                       +   .oobfree = { 
                             +     {.offset = 2, 
                                   +      .length = 78}} 
                                         + }; 
                                               + 
                                                       static int 
nand_get_device(struct nand_chip *chip, struct mtd_info *mtd, 
    int new_state);
 

*************** 
      *** 2403,2408 **** 
            --- 2417,2425 ---- 
                        case 64: 
                                chip->ecc.layout = &nand_oob_64; 
                                      break; 
                                    +     case 128: 
                                          +       chip->ecc.layout = 
&nand_oob_128;                                            +       break; 
                                                                      default:
         printk(KERN_WARNING "No oob scheme defined for "
                "oobsize %d\n", mtd->oobsize);
***************
*** 2518,2523 ****
--- 2535,2541 ----
         break;
       case 4:
       case 8:
+     case 16:
         mtd->subpage_sft = 2;
         break;
       }
Index: linux/include/linux/mtd/nand.h
diff -c linux/include/linux/mtd/nand.h:1.1.8.3 
linux/include/linux/mtd/nand.h:1.1.8.3.4.1
*** linux/include/linux/mtd/nand.h:1.1.8.3  Thu Dec  6 15:43:10 2007
--- linux/include/linux/mtd/nand.h  Wed Jul  8 12:51:53 2009
***************
*** 45,52 ****
    * is supported now. If you add a chip with bigger oobsize/page
    * adjust this accordingly.
    */
! #define NAND_MAX_OOBSIZE  64
! #define NAND_MAX_PAGESIZE 2048

   /*
    * Constants for hardware specific CLE/ALE/NCE function
--- 45,52 ----
    * is supported now. If you add a chip with bigger oobsize/page
    * adjust this accordingly.
    */
! #define NAND_MAX_OOBSIZE  128
! #define NAND_MAX_PAGESIZE 4096

   /*
    * Constants for hardware specific CLE/ALE/NCE function

Thanks,
Andrew
Iders Inc.
