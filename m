Received: from smtpout04-01.prod.mesa1.secureserver.net ([64.202.165.196])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IJc89-00068g-Pw
	for linux-mtd@lists.infradead.org; Fri, 10 Aug 2007 17:34:55 -0400
Message-ID: <46BCDA2B.4030609@techmoninc.com>
Date: Fri, 10 Aug 2007 16:35:39 -0500
From: Andy Kennedy <akennedy@techmoninc.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org,  dwmw2@infradead.org
Subject: Re: [Fwd: M-Sys drivers]
References: <46BA20BB.1040607@techmoninc.com>	<87F8ED761B96574FA3397B6ADBC372AC064310B0@MI8NYCMAIL01.Mi8.com>	<46BB764D.1000008@techmoninc.com>	<87F8ED761B96574FA3397B6ADBC372AC064310E8@MI8NYCMAIL01.Mi8.com>	<46BB79BC.5070708@techmoninc.com>	<87F8ED761B96574FA3397B6ADBC372AC06431118@MI8NYCMAIL01.Mi8.com>	<46BB80C8.1060803@techmoninc.com>	<87F8ED761B96574FA3397B6ADBC372AC0643112D@MI8NYCMAIL01.Mi8.com>	<46BC78BB.7020605@techmoninc.com>	<87F8ED761B96574FA3397B6ADBC372AC06431282@MI8NYCMAIL01.Mi8.com>	<46BC7CB7.7080002@techmoninc.com>	<87F8ED761B96574FA3397B6ADBC372AC064312AB@MI8NYCMAIL01.Mi8.com>
	<46BCBB6F.7050406@techmoninc.com>
In-Reply-To: <46BCBB6F.7050406@techmoninc.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Using configured DiskOnChip probe address 0xd8000
DiskOnChip 2000 found at address 0xD8000
Flash chip found: Manufacturer ID: EC, Chip ID: 75 (Samsung:NAND 32MiB 
3,3V 8-bit)
Flash chip at floor 1, chip 0 is different:
Unknown flash chip found: F9 F9
Please report to dwmw2@infradead.org
Flash chip at floor 2, chip 0 is different:
Unknown flash chip found: F9 F9
Please report to dwmw2@infradead.org
Flash chip at floor 3, chip 0 is different:
Unknown flash chip found: F9 F9
Please report to dwmw2@infradead.org
1 flash chips found. Total DiskOnChip size: 32 
MiB                                                                                



For giggles, I recompiled again with the old driver.  The above is the 
message I get.  This supports my theory that the flash drive that I'm 
attempting to fdisk is NOT the base chip, but appears to be a partition 
of the device.  David/List???? What am I doing wrong?

Andy

Andy Kennedy wrote:
> Good theory.  The thing that gets me is that I see this same error when
> I fdisk a device like /dev/sda1 in place of /dev/sda.  Is it possible
> that the nftl driver is handing out the wrong partition information?  Is
> there a way that I can know for sure that the device was formatted
> correctly by the nftl driver?
>
> I'm having this same problem with the MD-2800-D08 and MD-2202-D32-X.
>
> If you development folks have any suggestions I'm game.  Please
> enlighten me!
>
> Donald Green wrote:
>   
>> I've put the config put up. It is for a 2.6.20 kernel. I won't have a
>> chance to boot the image you made until sometime early next week but I'd
>> be happy to give it a try. It sounds like you had the same experience I
>> did. I loaded the nftl driver and it formatted the DOC. I was theorizing
>> that this creates an incorrect bad sector map and that that could be
>> corrected by using dformat. My process fails when I try to complete the
>> fdisk formatting operation by commiting the changes with the w command.
>>
>>
>> -Don
>>
>> -----Original Message-----
>> From: Andy Kennedy [mailto:akennedy@techmoninc.com] 
>> Sent: Friday, August 10, 2007 10:57 AM
>> To: Donald Green
>> Subject: Re: [Fwd: M-Sys drivers]
>>
>> Donald Green wrote:
>>   
>>     
>>> Hi Andy:
>>>
>>>
>>>   The kernel I have in the iso I'm sending is built for a Geode and
>>>     
>>>       
>> uses
>>   
>>     
>>> the natsemi Ethernet driver, will these settings work? If not let me
>>> know what processor and Ethernet driver your target has and I can
>>> rebuild it.
>>>
>>> -Don
>>>   
>>>     
>>>       
>> I'm sure that that will work. . . it isn't much different from the 
>> Pentium-MMX (they're all pretty much the same until you get to the PII 
>> anyways).  There would probably be some obscure functionality 
>> differences, but if I can get a good kernel config - hey, that's the 
>> price I'm willing to pay.  Can you also send me a config file and 
>> version of the kernel you have?
>>
>> If you'd be willing to try it, I'd like for you to attempt to load my 
>> floppy on your computer to see if you can mount the nftla1 -- one issue,
>>
>> however, is that when I load the nftl driver (I have it as a module in 
>> the initrd), it formats the DOC -- which may blow your system away. . . 
>> but if you are willing to take the risk I'd like to know if my 
>> configuration works.  It is kernel 2.6.22.1 without any patches and then
>>
>> there's BusyBox.  I don't know the BusyBox version but if you boot the 
>> disk, you'll see the version.  Booting the disk is harmless -- it is 
>> just loading that module that seems to really hose up everything.
>>
>> Thanks again for your help!
>> Andy
>>
>>
>>
>>   
>>     
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
>   
