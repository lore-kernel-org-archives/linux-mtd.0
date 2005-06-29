Received: from ms-smtp-04-smtplb.ohiordc.rr.com ([65.24.5.138]
	helo=ms-smtp-04-eri0.ohiordc.rr.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DnhAs-0004sh-To
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2005 14:20:42 -0400
Received: from [192.168.1.89] (rrcs-24-123-18-42.central.biz.rr.com
	[24.123.18.42])
	by ms-smtp-04-eri0.ohiordc.rr.com (8.12.10/8.12.7) with ESMTP id
	j5TIKQHH010782 for <linux-mtd@lists.infradead.org>;
	Wed, 29 Jun 2005 14:20:30 -0400 (EDT)
Message-ID: <42C2EAEE.8040204@clarionsensing.com>
Date: Wed, 29 Jun 2005 13:39:42 -0500
From: "Brian O'Dell" <brian@clarionsensing.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <42C03FFB.3080208@clarionsensing.com>	<42C04A65.5040804@ieee.org>	<42C180D4.1010607@clarionsensing.com>	<42C1A11A.2020108@ieee.org>
	<42C1C3A3.5030007@clarionsensing.com>
In-Reply-To: <42C1C3A3.5030007@clarionsensing.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: DOCBoot doesn't compile
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian O'Dell wrote:

> Dan Brown wrote:
>
>> Brian O'Dell wrote:
>>
>>> Thank you for the quick response Dan.  DOCBoot does compile now, but 
>>> it freezes prior to any indication that it is trying to load the 
>>> kernel.  Here is what I get with DEBUG_BUILD defined:
>>> Installing DOCBoot.
>>> doc_seg = 0xE000           setup_seg = 0x2400
>>> int15/e801 returns 0x0F00    initrd_start = 0x0FFF0000
>>> top of low mem = 0x0279k    handler seg = 0x9E00
>>> -- Press any key --
>>>
>>> Prior to pressing any key, numlock and capslock respond normally.  I 
>>> can also reboot via ctrl-alt-del.  I press enter, then the system 
>>> freezes hard.  No numlock or capslock response, ctrl-alt-del does 
>>> not work.  Any thoughts or ideas are much appreciated.
>>
>>
>>
>>
>> Hmm.  Well, nothing appears odd in the debug messages.  Your DOC is 
>> at E000, you have 256Mbytes of RAM, you have 633k free low memory, 
>> etc.  Let me get some more info from you:
>>
>> - what type/size of DOC you're using
>> - size of your kernel and initrd
>> - what options you use when building DOCBoot (which interrupt, for 
>> instance).
>> - what other devices are in the system (video, harddrives, etc)
>>
>> Hopefully you're able to boot your system normally (DOCBoot install 
>> will be skipped if you hold down shift, alt, or control at the 
>> appropriate phase of BIOS boot).
>>
>>    -Dan
>
>
>
> I'm using a 128M DOC2000, model number:  md2202-D128.  It is one of 
> the newer INFTL devices.  The kernel is a hefty 1.9 Megabytes.  I 
> would like to use initrd in the future, but for now I am leaving it 
> out.  I haven't used any options when compiling.  I left 
> doc_bootstub.h alone, except to turn on the debugging messages.   
> DOC_BIOS_HOOK is defined to 0x18.  Though in my system it behaves more 
> like the description for Int 19h.   It completely ignores the hard 
> drive on boot even though it is there.  I don't care really, just 
> mentioning it in case some BIOS weirdness could be causing the 
> trouble.   The BIOS is from General Software.  The mainboard is a SBC 
> from Versalogic, VSBC-8.  It has the BX chipset and a ATI Rage 
> Mobility video chip.  I have a ultra ata hard drive also.  I can boot 
> fine.  The shift bypass works very well.
>
> Thanks
> -Brian
>

After reading through the doc_bootstub.S a bit, it looks like my system 
isn't even getting to the interrupt handler.  I've installed to 18h and 
19h.  Both with the same result:  The system locks hard right after it 
exits from the SPL.  Could docboot be clobbering something important 
when it loads the interrupt handler?  I'm assuming that it isn't getting 
to the interrupt handler because I don't get the "Kernel Loading..." 
message.  Is my theory plausible or likely?

-Brian
