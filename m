Received: from lorien.elatec.si ([193.77.58.106] helo=lorien.ee.elatec.si)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FsfBy-0001HK-Kl
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 08:18:57 -0400
Message-ID: <4497E9D4.9040307@epico.si>
Date: Tue, 20 Jun 2006 14:28:04 +0200
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
	<4497DF09.70404@epico.si>
	<1150804501.6780.141.camel@localhost.localdomain>
In-Reply-To: <1150804501.6780.141.camel@localhost.localdomain>
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

>On Tue, 2006-06-20 at 13:42 +0200, Savin Zlobec wrote:
>  
>
>>>Well, we read the manufacturer ID. When we get 98H, how should we know
>>>that this is a Samsung part ? And I doubt that this is a quad bit flip.
>>>
>>>      
>>>
>>What bothers me is that MTD from 2.6.17 reads manufacturer ID = 0xec,  and
>>the latest git MTD reads 0x98. The chip on my board is Samsung.
>>    
>>
>
>Thats indeed strange. Whats the exact part number ?
>
>  
>
>>>Can you please remove the nand_wait_ready() call in nand_command() and
>>>test the following patch ? It disables the ready busy pin and uses the
>>>chip_delay. Please check, whether the 20us are correct. You can safely
>>>set it to 50 without breaking stuff.
>>>
>>>      
>>>
>>It doesn't work with 20us nor with 50us.
>>    
>>
>
>Ok, revert the patch. I really need to know which code path triggers
>this behaviour. Can you apply the patch below and compile the kernel
>with CONFIG_DEBUG_INFO.
>
>When the chip is not in READY state on entry of nand_command() debug
>info is printed. Please decode the kernel addresses of "Last caller" and
>"Current caller" with 
>
>addr2line -e vmlinux 0xNNNNNNNNN
>  
>
Here it is.
    savin

Chip not ready in nand_command():
Last caller: c012aa04 (nand_base.c:389)
Last command: 0x70
Current caller: c012c0e8 (nand_base.c:1720)
Current command: 0x60

384     static int nand_check_wp(struct mtd_info *mtd)
385     {
386             struct nand_chip *chip = mtd->priv;
387             /* Check the WP bit */
388             chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
389             return (chip->read_byte(mtd) & NAND_STATUS_WP) ? 0 : 1;
390     }


1715    static void single_erase_cmd(struct mtd_info *mtd, int page)
1716    {
1717            struct nand_chip *chip = mtd->priv;
1718            /* Send commands to erase a block */
1719            chip->cmdfunc(mtd, NAND_CMD_ERASE1, -1, page);
1720            chip->cmdfunc(mtd, NAND_CMD_ERASE2, -1, -1);
1721    }
