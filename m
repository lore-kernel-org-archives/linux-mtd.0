Received: from rt-soft-2.moscow.itn.ru ([80.240.96.70] helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E3EvO-0007d1-H8
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2005 11:24:59 -0400
Message-ID: <42FB6DCE.7050307@ru.mvista.com>
Date: Thu, 11 Aug 2005 19:25:02 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <42FB5E72.2010402@ru.mvista.com>
	<1123772959.23647.24.camel@tglx.tec.linutronix.de>
In-Reply-To: <1123772959.23647.24.camel@tglx.tec.linutronix.de>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: power management routines for NAND driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thomas,

Thomas Gleixner wrote:

>On Thu, 2005-08-11 at 18:19 +0400, Vitaly Wool wrote:
>  
>
>>Hello all,
>>    
>>
>
>  
>
>>I've looked through mtd code and found mtd_pm_callback that should be 
>>called to handle PM events. This callback should in turn call 
>>mtd->suspend/mtd->resume functions, if any. Therefore one evident way of 
>>PM stuff implementation for this NAND flash is to provide suspend/resume 
>>functions. However, pm_send (that calls mtd_pm_callback) is never called
>>on ARM targets. So I doubt if it's appropriate to implement PM for the 
>>driver this way since it's looking somehow obsolete.
>>    
>>
>
>I have no idea whats the state of those PM functions and why ARM is not
>using them.
>  
>
Well, they are not at all widely used, only one MIPS board and x86 APM 
code use them.

>  
>
>>So, unfortunately, both methods don't provide the level of integrity I'd 
>>like to have. The problem is that nand core has no state machine in its 
>>internals so the driver can't track the flash being in suspended state.
>>    
>>
>
>As far as I know the nand driver code, there is a member "state" in the
>nand_chip private data structure, which is exactly tracking the state of
>the device. 
>
>FL_READY, FL_READING, FL_WRITING, FL_ERASING, FL_SYNCING, FL_CACHEDPRG,
>are the currently implemented states. Adding FL_SUSPEND is not a big
>problem.
>
>All functions which access the FLASH device are serialized by
>nand_get_device(), where the state variable is modified. So adding a
>suspend/resume function is simple enough.
>
>suspend justs sets the state to FL_SUSPEND and resume releases the
>device by calling nand_release_device() which sets the state back to
>FL_READY and wakes up the tasks on the wait_queue.
>
>It's discussable, whether suspend is supposed to fail, when a flash
>operation is in progress or just waits until the operation is finished,
>which is usually only a matter of a couple of ms.
>  
>
What if introduce an additional parameter ('nowait')?

>Of course we need an additional board function pointer in struct
>nand_chip to have a board specific callback for suspend/resume
>operations.
>
>  
>
I'd prefer probably to use platform_device and device_driver structures 
and put suspend/resume functions into device_driver. Those functions 
will first call mtd->suspend/mtd->resume and then shut down/re-enable 
the clocks.
(that's more or less how it's done in drivers/mtd/maps/sa1100-flash.c)
mtd->suspend and mtd->resume need to be implemented in nand_base then.
Does that sound reasonable?

Best regards,
   Vitaly
