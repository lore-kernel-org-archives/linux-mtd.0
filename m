Received: from lorien.elatec.si ([193.77.58.106] helo=lorien.ee.elatec.si)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fsden-0007qq-M1
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 06:40:44 -0400
Message-ID: <4497D2CE.7070000@epico.si>
Date: Tue, 20 Jun 2006 12:49:50 +0200
From: Savin Zlobec <savin@epico.si>
MIME-Version: 1.0
To: tglx@linutronix.de
Subject: Re: [PATCH] AT91RM9200 NAND support
References: <1150786454.15581.289.camel@fuzzie.sanpeople.com>	
	<1150787336.6780.102.camel@localhost.localdomain>	
	<1150787823.15614.297.camel@fuzzie.sanpeople.com>	
	<4497A723.2070006@epico.si>	
	<1150790417.6780.107.camel@localhost.localdomain>	
	<4497BAE2.3010602@epico.si>
	<1150795093.6780.117.camel@localhost.localdomain>
In-Reply-To: <1150795093.6780.117.camel@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:

>On Tue, 2006-06-20 at 11:07 +0200, Savin Zlobec wrote:
>  
>
>>I've put the kernel with latest mtd on my board and got the following:
>>
>>Nand is recognized as 'NAND device: Manufacturer ID: 0x98, Chip ID: 0x75 
>>(Toshiba NAND 32MiB 3,3V 8-bit)',
>>should be 'NAND device: Manufacturer ID: 0xec, Chip ID: 0x75 (Samsung 
>>NAND 32MiB 3,3V 8-bit)'.
>>
>>No bad blocks are detected at initial nand scan, but when running 
>>flash_eraseall all blocks are found bad.
>>    
>>
>
>Hmm. The interface has not changed, AFAICT. What version of
>flash_eraseall are you using and which commandline options ?
>
>Can you verify with the latest mtd-utils from 
>
>http://git.infradead.org/?p=mtd-utils.git;a=summary
>  
>
I did the following modifications to nand_base.c :

--- drivers/mtd/nand/nand_base.c.orig   2006-06-20 12:19:10.000000000 +0200
+++ drivers/mtd/nand/nand_base.c        2006-06-20 12:18:51.000000000 +0200
@@ -1134,10 +1134,6 @@
                else
                        buf += ops->ooblen;

-               readlen -= ops->ooblen;
-               if (!readlen)
-                       break;
-
                if (!(chip->options & NAND_NO_READRDY)) {
                        /*
                         * Apply delay or wait for ready/busy pin. Do this
@@ -1151,6 +1147,10 @@
                                nand_wait_ready(mtd);
                }

+               readlen -= ops->ooblen;
+               if (!readlen)
+                       break;
+
                /* Increment page address */
                realpage++;

And managed to erase the nand flash  and mount JFFS2 on it, but writting 
still
didn't work -  got  errors like :

Data CRC d507eb40 != calculated CRC 2e617dde for node at 00e4f700

The I put a call to nand_wait_ready at the top of nand_command function and
as far as I could test everything worked (exept that the flash is still 
recognized
as Toshiba (0x98) not Samsung (0xec)).

It looks (to me) that there are still some parts of the code that should 
wait for
nand to get ready before sending commands.

savin
