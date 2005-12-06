Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EjaB0-0006I5-LW
	for linux-mtd@lists.infradead.org; Tue, 06 Dec 2005 05:36:05 -0500
Message-ID: <439569AC.8080409@ru.mvista.com>
Date: Tue, 06 Dec 2005 13:36:28 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <438FF22A.2060203@ru.mvista.com>
	<1133865021.16302.37.camel@tglx.tec.linutronix.de>
In-Reply-To: <1133865021.16302.37.camel@tglx.tec.linutronix.de>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd/utils: sync with MTD ioctl interface rework to get
 rid of MEMGETOOBSEL/MEMSETOOBSEL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:

>On Fri, 2005-12-02 at 10:05 +0300, Vitaly Wool wrote:
>  
>
>>Hi,
>>this patch reorganizes the MTD utls to
>>- not use MEMGETOOBSEL/MEMSETOOBSEL ioctls as they're planned for 
>>removal and anyway not needed
>>- use MEMGETOOBAVAIL ioctl to get the number of available OOB bytes and 
>>read/write OOB accordingly
>>
>>Any input is most welcome.
>>    
>>
>
>1. Rendering the utils unusable for older kernels is wrong.
>
>Its simple to handle this in the utils depending on the functionality
>which is exposed by the kernel.
>  
>
Makes sense to me.

>
>2. Your current approach prevents me to
>- dump the raw flash content including OOB data
>- write a nand image with given oob data
>
>This is essential for troubleshooting and must still be possible
>somehow.
>
>  
>
Lemme disagree with you here. Raw OOB content-related stuff is not IMHO 
the thing to debug from userland.
Suggest prinitng out the raw OOB contents for MTD_DEBUG_LEVEL3 instead.

Vitaly
