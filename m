Received: from [203.115.19.131] (helo=matrix.mediasolv.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15pnDu-0000sP-00
	for <linux-mtd@lists.infradead.org>; Sat, 06 Oct 2001 09:54:18 +0100
Message-ID: <3BBEC7ED.517EF502@mediasolv.com>
Date: Sat, 06 Oct 2001 14:59:25 +0600
From: visakan <visakan@mediasolv.com>
MIME-Version: 1.0
To: uclinux-dev@uclinux.org, jffs-dev@axis.com, linux-mtd@lists.infradead.org
Subject: mtd-jffs
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Hello everybody,

I am trying to put jffs filesystem on the ucLinux 2.0.38 ,on the ATMEL
AT49BV1604 flash.
Since It s not cfi-compatible , I try to use cfi-jedec anc the command
set cfi_cmd0002,
I managed to identify the flash and the mtd partitions after hard-coding
the mfr-id and dev-id.
The jffs file system can be mounted when we used romfs as the root
filesystem.
When I tried to write something on the mounted partition I got the
following:

Last[2] is ffff, datum is 3931
Last[2] is ffff, datum is 3931
Last[2] is ffff, datum is 3931
Last[2] is ffff, datum is 3931

after that it hangs ...
Though  the flash is comfletely free I could not be able to write.
The atmel flash has two planes , and the os  and the fileysstems are on
seperate planes,
and kernel is XIP. I tried the kernel executed on the RAM but I failed,
Then  I write a program similar to the (prog.c, amd.c in the armtool)
burning program from armtool
and executed as a user-space prog, so I could manage to write and erase.

my progream is:

#include <stdio.h>
#define FLASH_BASE 0x1000000

void program(long address,unsigned short word);
void sector_erase(unsigned long sector);

unsigned long *p_out;

int main(){
 int i;
 char opt;
  p_out=(unsigned long*) 0x40;
 printf("Enter the operation:\n\t(E)rase\n\t(P)rogram\n_>");
 opt=getchar();
 switch (opt){
  case 'P':
  for (i=64*1024;i<128*1024; i++){
   p_out[1]=i;
   program(i,0xabcd);
  }
  p_out[1]=0x31415;
  return 0;
  case 'E':
  for (i=0; i<7; i++)
   sector_erase((64*1024)+(i*64*1024));
  return 0;
  default:
  return 0;
 }
}



void program(long address,unsigned short word)
{
 int i;
 volatile unsigned short *ptr;

 ptr = (unsigned short *)FLASH_BASE;

 ptr[0x5555] = 0xaa;
 ptr[0x2aaa] = 0x55;
 ptr[0x5555] = 0xa0;
 ptr[address] = word;
 i=0;
 while(i != 2)
  if(ptr[address] !=word)
   i=0;
  else
  i++;
}

void sector_erase(unsigned long sector){
 int i;
        volatile unsigned short *ptr;
        ptr = (unsigned short *)FLASH_BASE;
        ptr[0x5555] = 0xaa;
        ptr[0x2aaa] = 0x55;
        ptr[0x5555] = 0x80;
        ptr[0x5555] = 0xaa;
        ptr[0x2aaa] = 0x55;
        ptr[sector] = 0x30;
        i = 0;
        while(i != 2)
                if (ptr[sector] != 0xffff)
                      i = 0;
                else
                      i++;
}

Can anybody encountered the same problem?
pls give some idea to get rid off??

Cheers

Viskan.P
