Received: from alnrmhc13.comcast.net ([204.127.225.93])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HHQT8-0006aQ-Ch
	for linux-mtd@lists.infradead.org; Wed, 14 Feb 2007 20:11:13 +0000
Message-ID: <45D36C8F.9010102@ringle.org>
Date: Wed, 14 Feb 2007 15:09:51 -0500
From: Jon Ringle <jon@ringle.org>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
Subject: Re: [SPAM]  Re: P30 flash left in read status mode after a write
References: <45D35A6F.3060203@ringle.org>
	<Pine.LNX.4.64.0702141443270.1757@xanadu.home>
In-Reply-To: <Pine.LNX.4.64.0702141443270.1757@xanadu.home>
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

Nicolas Pitre wrote:
> On Wed, 14 Feb 2007, Jon Ringle wrote:
>
>   
>> I am running Linux 2.6.16.29 and I've 
>> found that whenever a write is done to the jffs2 filesystem that flash 
>> is left in read status mode and anything trying to do a read of flash 
>> directly reads only 0x0080. Reading from an mtd device seems to fix the 
>> problem.
>>     
>
> This is done on purpose.  And as you deduced yourself this is so to 
> avoid ...
>
>   
>> taking a slight performance hit to consecutive jffs2 write operations 
>> because now each write operation will need to spend more cycles putting 
>> the flash in to a write mode.
>>
>> Any advice would be appreciated.
>>     
>
> First, why is this a problem for you?
>
>   
This is a problem on our (unusual) hardware because we have a Pentium M 
processor (not running Linux) that reads fconfig partition outside the 
context of the IXP processor that is running Linux. It does so via data 
path: Pentium -> PCI -> IXP Expansion bus -> Flash. This data path 
allows the Pentium to directly access the fconfig partition without 
needing any active code on the IXP's arm core processor to do anything 
to facilitate such access by the Pentium. However, when the mtd driver 
leaves the flash in read status mode, the Pentium just reads 0x0080 when 
trying to read the fconfig partition. With a change to have the mtd 
driver put the flash back into ready mode after a write, then I think 
that the Pentium only needs to deal with a temporary read failure if it 
happens to do a read at the same time that a write is occurring on the 
jffs2. In which case, the Pentium code simply spins retrying to do the 
read until it is successful.

Jon
