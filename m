Received: from cathcart.site5.com ([74.54.107.137])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lp2EN-0001HM-5n
	for linux-mtd@lists.infradead.org; Wed, 01 Apr 2009 15:20:01 +0000
Message-ID: <49D38610.2050304@compulab.co.il>
Date: Wed, 01 Apr 2009 18:19:44 +0300
From: Mike Rapoport <mike@compulab.co.il>
MIME-Version: 1.0
To: bzachar@direkt-kfki.hu
Subject: Re: nand driver help
References: <49CCEB89.1050906@direkt-kfki.hu> <49D0682E.4080500@compulab.co.il>
	<1411.192.168.200.50.1238430347.squirrel@webmail.direkt-kfki.hu>
In-Reply-To: <1411.192.168.200.50.1238430347.squirrel@webmail.direkt-kfki.hu>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



bzachar@direkt-kfki.hu wrote:
>>
>> Zachár Balázs wrote:
>>> Hi,
>>>
>>> I have a pxa270 based board, and I try to create the nand driver for the
>>> 2.6.28-7 main kernel... On this board, the nand flash is connected
>>> directly to the pxa27x PCMCIA socket's pins... (see this
>>> pdf:
>>> http://pubs.gumstix.org/documents/PXA%20Documentation/PXA270/PXA270%20Connecting%20NAND%20Flash%20%5B28014402%5D.pdf)
>>>
>> [ snip ]
>>
>>> On my board the NAND AL signal is connected to MA20 so if I "access" to
>>> 0x2010_0000 (PCMCIA0 address: 0x2000_0000) it should decoded as AL=1
>>> operation.
>>> If I right, if I "access" to the PCMCIA1 address (PCMCIA1 address:
>>> 0x3000_0000) it should decoded as a CL=1 operation.
>>> The R/Bn (ready_notbusy) signal is connected to GPIO55 and the WP signal
>>> is connected to GPIO56.
>>>
>>> I write this hwcontrol function for my board's cmd_crtl function, but I
>>> think it isn't work(bdevelb_ALE_io_base=ioremap(0x20100000,
>>> 0x1000),bdevelb_CLE_io_base=ioremap(0x30000000, 0x1000)):
>>> static void bdevelb_nand_hwcontrol(struct mtd_info *mtd, int cmd,
>>> unsigned int ctrl)
>>> {
>>> 	struct nand_chip *chip = mtd->priv;
>>>
>>> 	if (ctrl & NAND_CTRL_CHANGE) {
>>>                 if ( ctrl & NAND_ALE )
>>>                         writeb(0xff, bdevelb_ALE_io_base);
>>>                 if ( ctrl & NAND_CLE )
>>>                         writeb(0xff, bdevelb_CLE_io_base);
>>>         }
>>>
>>>         if (cmd != NAND_CMD_NONE)
>>>                 writeb(cmd, chip->IO_ADDR_W);
>> You should set chip->IO_ADDW_W to either bdevelb_ALE_io_base or
>> bdevelb_CLE_io_base, depending  on the ctrl value:
>>
>>  	if (ctrl & NAND_CTRL_CHANGE) {
>>                  if ( ctrl & NAND_ALE )
>>                          chip->IO_ADDR_W = bdevelb_ALE_io_base;
>>                  if ( ctrl & NAND_CLE )
>>                          chip->IO_ADDR_W = bdevelb_CLE_io_base;
>>         }
>>
> 
> Firstly, many thanks for your help!
> 
> I modified your code to this (the modification based on the orig (2.6.16)
> driver):
>         if (ctrl & NAND_CTRL_CHANGE) {
>                 if ( ctrl & NAND_ALE )
>                         chip->IO_ADDR_W = bdevelb_ALE_io_base;
>                 else
>                 if ( ctrl & NAND_CLE )
>                         chip->IO_ADDR_W = bdevelb_CLE_io_base;
>                 else
>                         chip->IO_ADDR_W = bdevelb_io_base;
> 
> For the first look, it works, but I will make a complete test at tomarrow...
> What do you think about this code?

seems Ok.

> regars,
> Balazs Zachar
> 
> 
>>> }
>>>
>>> Is this function good for this connection scheme?
>>> What is it mean "access" to an address? Can be enough a readb funtion?
>>>
>>> regards,
>>> Balazs
>>>
>>>
>>>
>>> ______________________________________________________
>>> Linux MTD discussion mailing list
>>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>>
>> --
>> Sincerely yours,
>> Mike.
>>
>>
> 
> 
> 

-- 
Sincerely yours,
Mike.
