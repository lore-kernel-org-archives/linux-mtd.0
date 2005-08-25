Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E8NBQ-0000CG-Vu
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2005 15:14:46 -0400
Message-ID: <430E1898.4000806@mvista.com>
Date: Thu, 25 Aug 2005 12:14:32 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
References: <1124978894.17190.40.camel@icampbell-debian>
	<Pine.LNX.4.63.0508251039400.15345@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.63.0508251039400.15345@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Ian Campbell <icampbell@arcom.com>, linux-mtd@lists.infradead.org
Subject: Re: problem with strataflash after suspend and resume
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas Pitre wrote:
> On Thu, 25 Aug 2005, Ian Campbell wrote:
>>I have a PXA255 (Xscale/ARM) platform with a strataflash part on it
>>(28F128J3). With 2.6.11.11 (the only previous version I have convenient
>>access to) I can suspend and resume repeatedly just fine, however with
>>2.6.13-rc7 I occasionally get something like this just after resume:
>>
>>        Waiting for chip to be ready timed out. Status 0
...
>>The flash would appear to be readable, since resuming involves running
>>the very early parts of the bootloader, which is stored in flash.
> 
> 
> And that's the problem.  The flash is in data mode while the driver 
> probably still thinks it is in status mode.
> 
> Make sure that cfi_intelext_suspend() gets called prior going to sleep 
> and that cfi_intelext_resume() is called upon getting back from sleep 
> mode.  If those calls don't take place you'll have inconsistent driver 
> state, or worse inconsistent flash content.

Since the bootloader is running I'll guess the PXA255 suspend mode 
chosen powers the system (and flash chips) down and up during 
suspend/resume (as do some PXA27x modes), so the mtd chip driver state 
machine is out of sync with the hardware state.  Those routines will 
force the hardware and software back to consistent state.  Getting those 
routines called involves adding LDM support and suspend/resume callbacks 
a la drivers/mtd/maps/sa1100-flash.c, and registering a platform_device 
in the board files.


-- 
Todd
