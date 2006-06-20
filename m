Received: from lorien.elatec.si ([193.77.58.106] helo=lorien.ee.elatec.si)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fsc40-0005yZ-Bt
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 04:58:48 -0400
Message-ID: <4497BAE2.3010602@epico.si>
Date: Tue, 20 Jun 2006 11:07:46 +0200
From: Savin Zlobec <savin@epico.si>
MIME-Version: 1.0
To: tglx@linutronix.de
Subject: Re: [PATCH] AT91RM9200 NAND support
References: <1150786454.15581.289.camel@fuzzie.sanpeople.com>	<1150787336.6780.102.camel@localhost.localdomain>	<1150787823.15614.297.camel@fuzzie.sanpeople.com>	<4497A723.2070006@epico.si>
	<1150790417.6780.107.camel@localhost.localdomain>
In-Reply-To: <1150790417.6780.107.camel@localhost.localdomain>
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

>On Tue, 2006-06-20 at 09:43 +0200, Savin Zlobec wrote:
>  
>
>>I'am working on this right now. I've changed the at91 driver and I'am 
>>going to
>>test it when I finish the changes on YAFFS - read/write_ecc and oobblock are
>>not part of mtd_info any more...
>>
>>I'am attaching the at91_nand.c changes.
>>    
>>
>
>Sorry, I doubt that any of these changes will actually work. The patch
>below might save your time.
>  
>
Thanks (I did a quick diff of other nand drivers, but missed the #error...).

I've put the kernel with latest mtd on my board and got the following:

Nand is recognized as 'NAND device: Manufacturer ID: 0x98, Chip ID: 0x75 
(Toshiba NAND 32MiB 3,3V 8-bit)',
should be 'NAND device: Manufacturer ID: 0xec, Chip ID: 0x75 (Samsung 
NAND 32MiB 3,3V 8-bit)'.

No bad blocks are detected at initial nand scan, but when running 
flash_eraseall all blocks are found bad.
