Received: from out02.mta.xmission.com ([166.70.13.232])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KwAhC-00028w-1a
	for linux-mtd@lists.infradead.org; Sat, 01 Nov 2008 07:14:54 +0000
From: ebiederm@xmission.com (Eric W. Biederman)
To: David Woodhouse <dwmw2@infradead.org>
References: <20081029195349.imqvyxcajuoko0wo@imap.linux.ibm.com>
	<1225463927.16774.106.camel@macbook.infradead.org>
Date: Sat, 01 Nov 2008 00:04:37 -0700
In-Reply-To: <1225463927.16774.106.camel@macbook.infradead.org> (David
	Woodhouse's message of "Fri, 31 Oct 2008 14:38:47 +0000")
Message-ID: <m11vxwhqpm.fsf@frodo.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Re: ST M29W320D incorrectly configured
Cc: jwboyer@gmail.com, linux-mtd@lists.infradead.org,
	Corinna Schultz <cschultz@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse <dwmw2@infradead.org> writes:

> On Wed, 2008-10-29 at 19:53 -0400, Corinna Schultz wrote:
>> I'm having a problem getting the unlock addresses correctly configured  
>> for the ST M29W320D chip. CFI query data is shown below (from  
>> debugging statements I enabled and/or added to the driver). The chip  
>> is wired so that the #BYTE pin is low, putting the chip into x8 mode.  
>> The data bus is physically 8 bits.
>> 
>> I don't understand everything that's going on in the code, but it  
>> seems to me that the following code (taken from cfi_cmdset_0002.c,  
>> which sets the unlock addresses needed for writing and erasing) has a  
>> logic error. Maybe someone can explain it to me?
>> 
>>   if (    /* x16 in x8 mode */
>>      ((cfi->device_type == CFI_DEVICETYPE_X8) &&
>>       (cfi->cfiq->InterfaceDesc == 2))
>> 
>> 
>> The reason I think this is in error is that both the device type and  
>> the interfaceDesc are defined by the hardware, and not indicative of  
>> the mode. Besides, isn't this conditional actually testing if the chip
>> is an X8 chip and supports x8 and x16 async modes?
>
> That condition is doubly wrong, I think. Not only does it never trigger,
> but it'd do the wrong thing if it _did_ trigger. I think the answer is
> to revert this:

Yep.  The logic came from a misunderstanding of how the devices would show up.
> http://lists.infradead.org/pipermail/linux-mtd-cvs/2004-September/004096.html

> It would be nice if we could do it that way, but these ST chips don't
> seem to work. When they're in 16-bit mode, they really do need a byte
> address of 0x555 for the second unlock address, not 0x554 (0x2aa*2) as
> every other chip seems to accept. Although it takes _extra_ logic to
> check the input on the 'A-1' pin, they seem to have it.
>
> So I think the answer is to go back to cfi->addr_unlock[12] being _byte_
> addresses within the chip...

And in case you prefer to go do everything in byte address here are some
comments in line.

> +		cfi->addr_unlock1 = 0x555 << cfi->device_type;
> +		cfi->addr_unlock2 = 0x2aa << cfi->device_type;
> +
> +		/* Handle the case of x16 chips in x8 mode which are _really_
> +		   picky about the unlock addresses, and require that A-1 is
> +		   set too. This is only some ST chips so far...  */
> + if (cfi->device_type == 2 && map_bankwidth(map) == cfi_interleave(cfi))
> + cfi->addr_unlock2 |= 1; /* i.e. 0x555 instead of 0x554 */

Note the correct test here is:
		if (cfi->device_type/2 == (map_bankwidth(map)/cfi_interleave(cfi)))
			cfi_addr_unlock2 |= 1;

You need the division or else crazy cases like interleaved x16 devices in x8 mode 
won't work.  Testing device_type/2 == map_bankwidth(map)/cfi_interleave(cfi) automatically
enables x32 devices in x16 mode as well.
                        
>   retry:
>  	if (!cfi->numchips) {
> + unsigned unlock_mask = 0xFFFF << (map_bankwidth(map) / cfi_interleave(cfi) -
> 1);
> +

Looking at the specified unlock address it looks like the loss of the low
bit here is actually a bug in jedec_probe.  So we should not need unlock_mask.

It appears you have passed over the probe sequence in cfi_probe_setup to reset
the chip.  It doesn't seem to make a difference in this case but still it
won't work on x16 devices in x8 mode as current written.

Eric
