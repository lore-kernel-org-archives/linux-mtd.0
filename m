Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 131Sxh-0006nk-00
	for mtd-list@infradead.org; Mon, 12 Jun 2000 13:05:01 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 131Sxd-0006nR-00
	for mtd@infradead.org; Mon, 12 Jun 2000 13:04:58 +0100
Received: from cygnus.co.uk (IDENT:dwmw2@localhost [127.0.0.1])
	by passion.cygnus.co.uk (8.9.3/8.9.3) with ESMTP id NAA30031
	for <mtd@infradead.org>; Mon, 12 Jun 2000 13:04:50 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Subject: Common Flash Interface probe code.
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Mon, 12 Jun 2000 13:04:50 +0100
Message-ID: <30028.960811490@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Anyone with memory-mapped CFI-compliant NOR flash, especially if it's not 
in 16-bit mode like the one I'm testing on - could you test this probe code 
for me?

/* 
   Common Flash Interface probe code.
   (C) 2000 Red Hat. GPL'd.
   $Id$
*/


#include <linux/module.h>
#include <linux/types.h>
#include <linux/kernel.h>
#include <asm/io.h>
#include <asm/byteorder.h>
#include <linux/errno.h>

#ifdef __arm__
/* Shoot me. Better still, shoot rmk. dwmw2 */
#undef writeb
#undef writew
#undef readb
#undef readw
#define readb(l) (*(unsigned char *)(l))
#define writeb(c,l)  do {*((unsigned char *)(l)) = (c);} while (0)
#define readw(l) (*(unsigned short *)(l))
#define writew(c,l)  do {*((unsigned short *)(l)) = (c);} while (0)
/* It's OK. You can look back now. */
#endif /* __arm__ */

struct cfi_ident {
  __u8  qry[3];
  __u16 P_ID;
  __u16 P;
  __u16 A_ID;
  __u16 A;
  __u8  VccMin;
  __u8  VccMax;
  __u8  VppMin;
  __u8  VppMax;
  __u8  WordWriteTimeoutTyp;
  __u8  BufWriteTimeoutTyp;
  __u8  BlockEraseTimeoutTyp;
  __u8  ChipEraseTimeoutTyp;
  __u8  WordWriteTimeoutMax;
  __u8  BufWriteTimeoutMax;
  __u8  BlockEraseTimeoutMax;
  __u8  ChipEraseTimeoutMax;
  __u8  DevSize;
  __u16 InterfaceDesc;
  __u16 MaxBufWriteSize;
  __u8  NumEraseRegions;
  __u32 EraseRegionInfo[1];
} __attribute__((packed));


void print_cfi_ident(struct cfi_ident *cfip);


int init_module(void) 
{
  unsigned char tmpzero;
  unsigned long base = 0xd0000000;
  int devwidth=0, numdevs=0;

  int i;
  struct cfi_ident cfip;

  tmpzero=readb(base);
  
  writeb(0x98, base+0x55);
  
  if (*(unsigned char*) (base + 0x10) == 'Q' &&
      *(unsigned char*) (base + 0x11) == 'R' &&
      *(unsigned char*) (base + 0x12) == 'Y') {
    printk("Found a CFI device at location %lx in 8 bit mode\n", base);
    devwidth=1;
    numdevs=1;
  }

  if (!devwidth) {
    writew(0x9898, base+0xAA);
    
    if (*(__u16*) (base + 0x20) == cpu_to_le16(0x0051) &&
	*(__u16*) (base + 0x22) == cpu_to_le16(0x0052) &&
	*(__u16*) (base + 0x24) == cpu_to_le16(0x0059)) {
	  printk("Found a CFI device at location %lx in 16 bit mode\n", base);
	  devwidth=2;
	  numdevs=1;
    }
    else if (*(__u16*) (base + 0x20) == 0x5151 &&
	  *(__u16*) (base + 0x22) == 0x5252 &&
	  *(__u16*) (base + 0x24) == 0x5959) {
	    printk("Found a coupled pair of CFI devices at location %lx in 8 bit mode\n", base);
	    devwidth=2;
	    numdevs=2;
    }
  }

  if (!devwidth) {
    writel(0x98989898, base+0x154);
    
    if (*(__u32*) (base + 0x40) == cpu_to_le32(0x00000051) &&
	*(__u32*) (base + 0x44) == cpu_to_le32(0x00000052) &&
	*(__u32*) (base + 0x48) == cpu_to_le32(0x00000059)) {
      /* This isn't actually in the CFI spec - only x8 and x16 are. */
      printk("Found a CFI-like device at location %lx which appears to be in 32 bit mode(!)\n", base);
      devwidth=4;
      numdevs=1;
    } 
    else if (*(__u32*) (base + 0x40) == cpu_to_le32(0x00510051) &&
	*(__u32*) (base + 0x44) == cpu_to_le32(0x00520052) &&
	*(__u32*) (base + 0x48) == cpu_to_le32(0x00590059)) {
      printk("Found a coupled pair of CFI devices at location %lx in 16 bit mode\n", base);
      devwidth=4;
      numdevs=2;
    }
    else if (*(__u32*) (base + 0x40) == 0x51515151 &&
	*(__u32*) (base + 0x44) == 0x52525252 &&
	*(__u32*) (base + 0x48) == 0x59595959) {
      printk("Found four side-by-side CFI devices at location %lx in 8 bit mode\n", base);
      devwidth=4;
      numdevs=4;
    }
  }
  
  /* We won't bother with 64-bit wide detection at the moment */

  if (!devwidth) {
    printk("Found no CFI device at location %lx\n", base);
    return -ENXIO;
  }

  for (i=0; i<sizeof(struct cfi_ident); i++) {
    ((unsigned char *)&cfip)[i] = *(unsigned char *) (base + ((0x10 + i)*devwidth));
  }
#if 0
  for (i=0; i<8; i++) {
      printk ("CFI[%2.2X]: %2.2X %2.2X %2.2X %2.2X %2.2X %2.2X %2.2X %2.2X\n",
	      i*8,
	      ((unsigned char *)&cfip)[(i*8)+0], 
	      ((unsigned char *)&cfip)[(i*8)+1], 
	      ((unsigned char *)&cfip)[(i*8)+2], 
	      ((unsigned char *)&cfip)[(i*8)+3], 
	      ((unsigned char *)&cfip)[(i*8)+4], 
	      ((unsigned char *)&cfip)[(i*8)+5], 
	      ((unsigned char *)&cfip)[(i*8)+6], 
	      ((unsigned char *)&cfip)[(i*8)+7]
	      );
  }
#endif
  print_cfi_ident(&cfip);
  for (i=0; i<cfip.NumEraseRegions; i++) {
    __u16 EraseRegionInfoNum = (*(unsigned char *) (base + ((0x2d + (4*i))*devwidth))) + 
      ((*(unsigned char *) (base + ((0x2e + (4*i))*devwidth)) << 8));
    __u16 EraseRegionInfoSize = (*(unsigned char *) (base + ((0x2f + (4*i))*devwidth))) + 
      ((*(unsigned char *) (base + ((0x30 + (4*i))*devwidth)) << 8));

    printk("  Erase Region #%d: BlockSize 0x%4.4X bytes, %d blocks\n",
	   i, EraseRegionInfoSize * 256, EraseRegionInfoNum+1);
  }
  

  return -ENXIO;

}
void print_cfi_ident(struct cfi_ident *cfip)
{
  if (cfip->qry[0] == 'Q' && cfip->qry[1] == 'R' && cfip->qry[2] == 'Y') {
    printk("Primary vendor: %4.4X\n", le16_to_cpu(cfip->P_ID));
    printk("Alternatve vendor: %4.4X\n", le16_to_cpu(cfip->A_ID));
    if (cfip->P)
	  printk("Primary Algorithm Table at  %4.4X\n", le16_to_cpu(cfip->P));
    else
      printk("No Primary Algorithm Table\n");
    
    if (cfip->A)
      printk("Alternate Algorithm Table at  %4.4X\n", le16_to_cpu(cfip->A));
    else
      printk("No Alternate Algorithm Table\n");
    printk("Vcc Minimum: %x.%x V\n", cfip->VccMin >> 4, cfip->VccMin & 0xf);
    printk("Vcc Maximum: %x.%x V\n", cfip->VccMax >> 4, cfip->VccMax & 0xf);
    if (cfip->VppMin) {
      printk("Vpp Minimum: %x.%x V\n", cfip->VppMin >> 4, cfip->VppMin & 0xf);
      printk("Vpp Maximum: %x.%x V\n", cfip->VppMax >> 4, cfip->VppMax & 0xf);
    }
    else
      printk("No Vpp line\n");
    
    printk("Typical byte/word write timeout: %d 탎\n", 1<<cfip->WordWriteTimeoutTyp);
    printk("Maximum byte/word write timeout: %d 탎\n", (1<<cfip->WordWriteTimeoutMax) * (1<<cfip->WordWriteTimeoutTyp));
    
    if (cfip->BufWriteTimeoutTyp || cfip->BufWriteTimeoutMax) {
      printk("Typical full buffer write timeout: %d 탎\n", 1<<cfip->BufWriteTimeoutTyp);
      printk("Maximum full buffer write timeout: %d 탎\n", (1<<cfip->BufWriteTimeoutMax) * (1<<cfip->BufWriteTimeoutTyp));
    }
    else
      printk("Full buffer write not supported\n");
    
    printk("Typical block erase timeout: %d 탎\n", 1<<cfip->BlockEraseTimeoutTyp);
    printk("Maximum block erase timeout: %d 탎\n", (1<<cfip->BlockEraseTimeoutMax) * (1<<cfip->BlockEraseTimeoutTyp));
    if (cfip->ChipEraseTimeoutTyp || cfip->ChipEraseTimeoutMax) {
      printk("Typical chip erase timeout: %d 탎\n", 1<<cfip->ChipEraseTimeoutTyp); 
      printk("Maximum chip erase timeout: %d 탎\n", (1<<cfip->ChipEraseTimeoutMax) * (1<<cfip->ChipEraseTimeoutTyp));
    }
    else
      printk("Chip erase not supported\n");
    
    printk("Device size: 0x%X bytes (%d Mb)\n", 1 << cfip->DevSize, 1<< (cfip->DevSize - 20));
    printk("Flash Device Interface description: 0x%4.4X\n", le16_to_cpu(cfip->InterfaceDesc));
    printk("Max. bytes in buffer write: 0x%x\n", 1<< le16_to_cpu(cfip->MaxBufWriteSize));
    printk("Number of Erase Block Regions: %d\n", cfip->NumEraseRegions);

  }
  else printk("Invalid CFI ident structure.\n");
}

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
