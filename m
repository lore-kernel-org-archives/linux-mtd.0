Received: from asia.telenet-ops.be ([195.130.137.74])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G5Rjv-0006zp-0d
	for linux-mtd@lists.infradead.org; Tue, 25 Jul 2006 14:34:47 -0400
Message-ID: <44C66437.9030402@telenet.be>
Date: Tue, 25 Jul 2006 20:34:31 +0200
From: Jurgen <jurgen.parmentier@telenet.be>
MIME-Version: 1.0
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] PNX8550 NAND flash driver
References: <43A2F819.1040106@ru.mvista.com> <43C69EC2.2070601@mvista.com>	
	<43F1D439.60205@ru.mvista.com>
	<1152525196.30929.11.camel@localhost>
In-Reply-To: <1152525196.30929.11.camel@localhost>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	"Vladimir A. Barinov" <vbarinov@ru.mvista.com>,
	Todd Poynor <tpoynor@mvista.com>, linux-mips@linux-mips.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner schreef:
> On Tue, 2006-02-14 at 15:59 +0300, Vladimir A. Barinov wrote:
>   
>>>> +    }
>>>> +
>>>> +    if (((bytes & 3) || (bytes < 16)) || ((u32) to & 3) || ((u32) 
>>>> from & 3)) {
>>>> +        if (((bytes & 1) == 0) &&
>>>> +            (((u32) to & 1) == 0) && (((u32) from & 1) == 0)) {
>>>> +            int words = bytes / 2;
>>>> +
>>>> +            local_irq_disable();
>>>> +            for (i = 0; i < words; i++) {
>>>> +                to16[i] = from16[i];
>>>> +            }
>>>> +            local_irq_enable();
>>>>         
>>> Really necessary to disable all irqs around this transfer?  How long 
>>> can interrupts be off during that time?
>>>       
>> That is needed since the NAND device is binded to the external XIO bus 
>> that could be used by another devices.
>>     
>
> Err, you have to protect the whole access sequence then. What protects
> the chip against access between the command write and data read ?
>
> If this really is a bus conflict problem, then you need some more
> protection than this.
>
> Can you please describe in detail why you think this is necessary. 
>
> 	tglx
>
>
>
>
>
>
>
>   
Root cause of the problem lies within the early implementation of the 
low-level NAND commands. There was a severe risk that the PCI accesses 
were stalled because of a Read Status command for the NAND Flash. This 
Read Status was launched immediately after program/erase command. The 
hardware itself will wait for the Ready/Busy to be high and only then 
launch the Read Status command. This behavior caused timeout on the 
internal bus because PCI was unable to use the pins during this wait.

If this problem was coinciding with an ISR that tried to perform a PCI 
status register, then this PCI access could possibly timeout (because 
the PCI pins were already claimed for the XIO access that is depending 
on the RBY signal).

Since the problem only showed during the PCI device ISR, the 
quick'n'dirty hack was to disable interrupts during XIO accesses.

A better fix that should be available somewhere, is to improve the 
low-level NAND driver that will first check the status of the Ready/Busy 
line and only THEN launch the Read NAND Status command...

Jurgen
