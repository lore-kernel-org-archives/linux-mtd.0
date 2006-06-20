Received: from lorien.elatec.si ([193.77.58.106] helo=lorien.ee.elatec.si)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FseTG-0000IT-Hk
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 07:32:47 -0400
Message-ID: <4497DF09.70404@epico.si>
Date: Tue, 20 Jun 2006 13:42:01 +0200
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
	<4497D2CE.7070000@epico.si>
	<1150801960.6780.132.camel@localhost.localdomain>
In-Reply-To: <1150801960.6780.132.camel@localhost.localdomain>
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

>Savin,
>
>On Tue, 2006-06-20 at 12:49 +0200, Savin Zlobec wrote:
>
>Patch is correct, applied. Thanks
>
>  
>
>>And managed to erase the nand flash  and mount JFFS2 on it, but writting 
>>still
>>didn't work -  got  errors like :
>>
>>Data CRC d507eb40 != calculated CRC 2e617dde for node at 00e4f700
>>
>>The I put a call to nand_wait_ready at the top of nand_command function and
>>as far as I could test everything worked (exept that the flash is still 
>>recognized as Toshiba (0x98) not Samsung (0xec)).
>>    
>>
>
>Well, we read the manufacturer ID. When we get 98H, how should we know
>that this is a Samsung part ? And I doubt that this is a quad bit flip.
>  
>
What bothers me is that MTD from 2.6.17 reads manufacturer ID = 0xec,  and
the latest git MTD reads 0x98. The chip on my board is Samsung.

>  
>
>>It looks (to me) that there are still some parts of the code that should 
>>wait for nand to get ready before sending commands.
>>    
>>
>
>The only point where this really matters is, when we read data from
>those chips. They have a horrible feature, which automatically loads the
>next page into the internal buffer. There are only two places where we
>actually read from the device. On has the check at the correct place
>already, the other fixed you up.
>
>Can you please remove the nand_wait_ready() call in nand_command() and
>test the following patch ? It disables the ready busy pin and uses the
>chip_delay. Please check, whether the 20us are correct. You can safely
>set it to 50 without breaking stuff.
>  
>
It doesn't work with 20us nor with 50us.

savin
