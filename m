Received: from alnrmhc14.comcast.net ([204.127.225.94])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HHQwp-0000u9-GE
	for linux-mtd@lists.infradead.org; Wed, 14 Feb 2007 15:41:54 -0500
Message-ID: <45D373FE.7080900@ringle.org>
Date: Wed, 14 Feb 2007 15:41:34 -0500
From: Jon Ringle <jon@ringle.org>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
Subject: Re: [SPAM]  Re: P30 flash left in read status mode after a write
References: <45D35A6F.3060203@ringle.org>
	<Pine.LNX.4.64.0702141443270.1757@xanadu.home>
	<45D36C8F.9010102@ringle.org>
	<Pine.LNX.4.64.0702141526130.1757@xanadu.home>
In-Reply-To: <Pine.LNX.4.64.0702141526130.1757@xanadu.home>
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
>> Nicolas Pitre wrote:
>>     
>>> First, why is this a problem for you?
>>>
>>>   
>>>       
>> This is a problem on our (unusual) hardware because we have a Pentium M
>> processor (not running Linux) that reads fconfig partition outside the context
>> of the IXP processor that is running Linux. It does so via data path: Pentium
>> -> PCI -> IXP Expansion bus -> Flash. This data path allows the Pentium to
>> directly access the fconfig partition without needing any active code on the
>> IXP's arm core processor to do anything to facilitate such access by the
>> Pentium. However, when the mtd driver leaves the flash in read status mode,
>> the Pentium just reads 0x0080 when trying to read the fconfig partition. With
>> a change to have the mtd driver put the flash back into ready mode after a
>> write, then I think that the Pentium only needs to deal with a temporary read
>> failure if it happens to do a read at the same time that a write is occurring
>> on the jffs2. In which case, the Pentium code simply spins retrying to do the
>> read until it is successful.
>>     
>
> And how do you determine that you have a read failure?
>
> Because the flash doesn't necessarily always have 0x00800080 to show 
> when outside of the read mode.
>   
True. However, the data that is being read has magic values and a 
checksum for validity, so the likelihood of a false positive on passing 
these tests is extremely unlikely.
> Of course, since you have an unusual setup you can have an unusual patch 
> in your own kernel tree for this issue.  But this isn't entirely safe 
> since the Pentium code might be fooled by some other flash status output 
> that doesn,t look like a read failure.
>   
I was intending for just patching my own kernel tree for this issue, 
since this issue is unlikely to be of wider audience appeal. I just 
wanted to present my problem to people that are more knowledgeable with 
the mtd code as a sanity check for my solution.

Jon
