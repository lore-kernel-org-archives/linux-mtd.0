Received: from mail.linux-boards.com ([62.90.235.247])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G0GYt-0001aQ-UA
	for linux-mtd@lists.infradead.org; Tue, 11 Jul 2006 07:38:05 -0400
Message-ID: <44B39B5D.3070302@compulab.co.il>
Date: Tue, 11 Jul 2006 14:36:45 +0200
From: Mike Rapoport <mike@compulab.co.il>
MIME-Version: 1.0
To: tglx@linutronix.de
Subject: Re: [PATCH] CM-x2xx NAND flash support
References: <44AD06B5.7060708@compulab.co.il>	<1152437179.24611.376.camel@localhost.localdomain>	<44B36563.9050103@compulab.co.il>
	<1152606233.32107.98.camel@localhost.localdomain>
In-Reply-To: <1152606233.32107.98.camel@localhost.localdomain>
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

>On Tue, 2006-07-11 at 10:46 +0200, Mike Rapoport wrote:
>  
>
>>>>+       unsigned int nandaddr = (unsigned int)this->IO_ADDR_W;
>>>>   
>>>>
>>>>        
>>>>
>>>what the hell is this type cast for ?
>>>
>>>	void __iomem *nandaddr = 
>>> 
>>>
>>>      
>>>
>>you can't do |= and &= with void __iomem*
>>    
>>
>
>Err, why not ?
>  
>
I have this function:
static void cmx270_hwcontrol(struct mtd_info *mtd, int dat,
			     unsigned int ctrl)
{
	struct nand_chip* this = (struct nand_chip *) (mtd->priv);
	void __iomem *nandaddr = this->IO_ADDR_W;

	if (ctrl & NAND_CTRL_CHANGE) {
		if ( ctrl & NAND_ALE )
			nandaddr |=  (1 << 3);
		else
			nandaddr &= ~(1 << 3);
		if ( ctrl & NAND_CLE )
			nandaddr |=  (1 << 2);
		else
			nandaddr &= ~(1 << 2);
		if ( ctrl & NAND_NCE )
			nand_cs_on();
		else
			nand_cs_off();
	}
	this->IO_ADDR_W = (void*)nandaddr;
	if (dat != NAND_CMD_NONE)
		cmx270_write_byte(mtd, dat);
}

And these errors:
drivers/mtd/nand/cmx270-nand.c: In function 'cmx270_hwcontrol':
drivers/mtd/nand/cmx270-nand.c:137: error: invalid operands to binary |
drivers/mtd/nand/cmx270-nand.c:139: error: invalid operands to binary &
drivers/mtd/nand/cmx270-nand.c:141: error: invalid operands to binary |
drivers/mtd/nand/cmx270-nand.c:143: error: invalid operands to binary &

> gcc -v
arm-xscale-linux-gnu-gcc -v
Using built-in specs.
Target: arm-xscale-linux-gnu
...
Thread model: posix
gcc version 4.1.0



>  
>
>>>Can you please combine both drivers into one and make it a platform
>>>device. There is no need to keep lots of duplicate functionality around.
>>>
>>>      
>>>
>>I'm dropping cm-x255 support (management decision) so there's only one 
>>platform that can use this driver. What's the point then?
>>    
>>
>
>Sorry man, you submitted _two_ drivers in the first place and I did the
>review on those. I'm not good at witchcrafting the decisions of your
>management.
>  
>
You're right, and I agree that for two drivers it makes sence creating 
platform device and combining the drivers. But now I'm going to submit 
only _one_ driver. Do you still think platfrom device would be necessary?

>	tglx
>
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
>
>  
>


-- 
Sincerely yours,
Mike Rapoport
