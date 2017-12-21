Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eS1Hx-0004iV-4J
 for linux-mtd@lists.infradead.org; Thu, 21 Dec 2017 13:53:35 +0000
Subject: Re: [RFC 09/10] mtd: spi-nor: Disable hybrid mode for SPANSION
 S25FS-S family
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: Poonam Aggrwal <poonam.aggrwal@nxp.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Rajat Srivastava <rajat.srivastava@nxp.com>,
 Suresh Gupta <suresh.gupta@nxp.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>
References: <1512548141-3319-1-git-send-email-prabhakar.kushwaha@nxp.com>
 <1512548141-3319-10-git-send-email-prabhakar.kushwaha@nxp.com>
 <c764fd31-29c4-865c-656f-23c758af0640@wedev4u.fr>
 <HE1PR04MB1241C99974A1B5A7BF7BBCFA97310@HE1PR04MB1241.eurprd04.prod.outlook.com>
 <HE1PR04MB124101E3618C5EA65C7CD6FF970D0@HE1PR04MB1241.eurprd04.prod.outlook.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <e14cb203-dd70-dc7f-518c-fd503c4080cf@wedev4u.fr>
Date: Thu, 21 Dec 2017 14:53:15 +0100
MIME-Version: 1.0
In-Reply-To: <HE1PR04MB124101E3618C5EA65C7CD6FF970D0@HE1PR04MB1241.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Prabhakar,

Le 21/12/2017 à 13:41, Prabhakar Kushwaha a écrit :
> Hi Cyrille,
> 
> 
>> -----Original Message-----
>> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of
>> Prabhakar Kushwaha
>> Sent: Saturday, December 09, 2017 10:46 PM
>> To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>; linux-mtd@lists.infradead.org
>> Cc: Poonam Aggrwal <poonam.aggrwal@nxp.com>; boris.brezillon@free-
>> electrons.com; dedekind1@gmail.com; Rajat Srivastava
>> <rajat.srivastava@nxp.com>; Suresh Gupta <suresh.gupta@nxp.com>;
>> computersforpeace@gmail.com
>> Subject: RE: [RFC 09/10] mtd: spi-nor: Disable hybrid mode for SPANSION S25FS-
>> S family
>>
>> Hi Cyrille,
>>
>>> -----Original Message-----
>>> From: Cyrille Pitchen [mailto:cyrille.pitchen@wedev4u.fr]
>>> Sent: Wednesday, December 06, 2017 4:28 PM
>>> To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>; linux-
>>> mtd@lists.infradead.org
>>> Cc: boris.brezillon@free-electrons.com; computersforpeace@gmail.com;
>> Rajat
>>> Srivastava <rajat.srivastava@nxp.com>; dedekind1@gmail.com
>>> Subject: Re: [RFC 09/10] mtd: spi-nor: Disable hybrid mode for SPANSION S25FS
>> -
>>> S family
>>>
>>> Hi Prabhakar,
>>>
>>> Le 06/12/2017 à 09:15, Prabhakar Kushwaha a écrit :
>>>> The S25FS-S family physical sectors may be configured as a hybrid
>>>> combination of eight 4-kB parameter sectors at the top or bottom
>>>> of the address space with all but one of the remaining sectors
>>>> being uniform size.
>>>> The default status of the flash is the hybrid architecture.
>>>> The parameter sectors and the uniform sectors have different erase
>>>> commands.
>>>>
>>>> This patch disables the hybrid sector architecture which makes the
>>>> flash have uniform sector size and uniform erase command.
>>>>
>>>
>>> This issue should be addressed in a generic way, not Spansion specific,
>>> by adding support of the optional Sector Map Parameter Table (SFDP).
>>> In case of non uniform memories, like this Spansion S25FS-S family or
>>> SST26, the Sector Map Parameter Table becomes mandatory as a SFDP table.
>>>
>>> From the JESD216B specification, about the JEDEC Sector Map Parameter
>> Table:
>>> """
>>> This table is required when a memory device:
>>> * Has sectors of more than one size
>>> * Or, does not allow all Erase Type commands to be applied to all sectors.
>>> """
>>>
>>
>> As I understand from Sector Map Parameter Table, It tell about the flash layout
>> and which region support which erase type.
>>
>> Flash layout can be configured using volatile or non-volatile registers. For e.g.
>> Spansion S25FS has following combination
>> Device    CR3NV[3]    CR1NV[2]    CR3NV[1]     Index Value      Description
>> FS512S       0                  0                    1                01h                      4-kB sectors at
>> bottom with remainder 256-kB sectors
>>                     0                  1                    1                03h                      4-kB sectors at top
>> with remainder 256-kB sectors
>>                     1                  0                    1                05h                      Uniform 256-kB
>> sectors
>> Once one of the combination programmed.  Sector Map Parameter Table help
>> with type of erase supported.
>>
>> My requirement is for setting flash in particular configuration i.e. "05" -->
>> Uniform 256-kb. This requirement is getting met with existing patch.
>> I don’t want "uniform 256-kb" as default  in spi-nor.c as different user may have
>> different requirements.
>> How to achieve this? Device tree ??
>>
> 
> Flashes has different layout based on configuration. For e.g. Spansion S25FS supports 3 layout. 
> Same has been explained in previous mail.
> 
> I have requirement of selecting a particular layout of flash. I don’t want to fix/hardcode flash layout in spi-nor.c. 
> This means layout info should come from defconfig or device tree. 
> 
> Do we have any such device tree binding available for flash.
> 

AFAIK, there is currently no existing DT property. So we may introduce a
generic one like "sector-map-index":

sector-map-index = <5>;

However, now I'm reading again the JESD216B specification about the sector maps.
I'm looking at the "configuration detection command descriptor (command)".

"""
The Sector Map table is built from a sequence of descriptors. There are two
types of descriptors: 
• A configuration detection command descriptor (command)
• A configuration sector map descriptor (map)

The command descriptors are optional. If there is a single configuration
then no command descriptors are needed. If there are more than two
configurations, more than one command descriptor is needed. If command
descriptors are provided, they always precede map descriptors in the
table.

Each configuration detection command is described by two Dwords. These
Dwords provide: 
• A bit indicating that the descriptor is a configuration detection command,
• a bit indicating whether this descriptor is the last command descriptor,
• the instruction code for the command,
• the number of address bytes for the command,
• the number of read latency cycles between the last address byte and the read data byte,
• a mask to select the bit of interest in the returned data byte,
• and the address value for the command.

It is assumed that each command is reading a configuration register with a
single byte of return data and that this type of command does not provide
mode bits. Each command selects a single bit from the byte of returned
data. There will be a separate command descriptor and command sent for each
bit of configuration selecting information that is needed to select the
current Sector Map Configuration that is in use.
"""

So it looks like only instruction op codes are provided for reading the
selected sector map configuration, but not for updating it.
If there is no standard to describe a generic way to select the wanted
sector map configuration, then I'm no so eager to introduce support of all
manufacturer's custom procedures with all their quirks.

Besides, I guess there is no point updating the selection of the sector map
configuration at each boot or SPI NOR memory initialization. I think this
selection should be done once for all, likely when programming the memory
for the first time in the factory, and/or could be done by some custom boot
loader.

I'd rather focus on implementing standards like JEDEC/JESD216B than adding
support to all memory manufacturer quirks when we can avoid them.

The reason? I used to do this in the past, implementing manufacturer
specific procedures, for instance to modify the number of dummy clock
cycles used by Fast Read commands. Then time showed that it was a mistake
because manufacturers don't seem to be consistent and don't hesitate to
change their procedures breaking the compatibility with their previous
memory parts. So it was a real pain to add support to new memory parts,
especially because the work I did was in some read-only boot-loader (ROM
Code), hence that can be updated without producing new chips.

My point is that manufacturer specific pieces of source code *in a generic
framework like spi-nor* are not so reliable whereas sticking to standards
as mush as possible has showed up to be a better choice over the time.
I agree this is a little bit a personal opinion but based on practical
experience.

Of course it doesn't mean that manufacturer specific pieces of source code
are forbidden, of course not! It means that this is not the recommended way
hence should be avoided. Also you will have to justify your position if you
think this should be done in Linux anyway :)

So I'm still open to the discussion then don't hesitate to defend your
position.

For now, adding support to the non-uniform erase sector map based on the
dedicated SFDP table sounds like a good idea to *read* the current
configuration but *updating* the selection from Linux might not be worth.

Best regards,

Cyrille


> --pk
> 
> 
> 
