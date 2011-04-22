Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QDCGp-0007ye-5E
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2011 09:03:23 +0000
Message-ID: <4DB14439.1050507@parrot.com>
Date: Fri, 22 Apr 2011 11:02:49 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: dangerous NAND_BBT_SCANBYTE1AND6
References: <4DB052DB.7040308@parrot.com> <4DB06A6B.2080806@gmail.com>
In-Reply-To: <4DB06A6B.2080806@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Brian Norris a écrit :
> Hi
> 
> On 4/21/2011 8:52 AM, Matthieu CASTET wrote:
>>
>> [1]
>> The devices are supplied with all the locations inside valid blocks erased
>> (FFh). The Bad
>> Block Information is written prior to shipping. Any block, where the 1st and 6th
>> Bytes, or 1st
>> Word, in the spare area of the 1st page, does not contain FFh, is a Bad Block.
> 
> I've tried my best to verify that any modifications I have made to bad 
> block scanning comply with the data sheets, but I very well could have 
> made mistakes (especially since there are so many different types of 
> scanning patterns, and very few manufacturers are actually being 
> consistent with these things).
Did you ask some clarification to manufacturers ?

> 
> That being said, I believe that the data sheet you quoted has some answer:
> "Any block, where the 1st and 6th Bytes, or 1st Word, in the spare area 
> of the 1st page, does not contain FFh, is a Bad Block."
> AFAICT, this description means that x8 buswidth devices must scan bytes 
> 1 and 6 while x16 devices only need to scan the first word. 
Did you see real case where 6 was not 0xff but 1 was 0xff ?


> So I bet 
> your device is actually an x8 device and so the 1st/6th byte pattern is 
> correct. I think the fact that this conflicts with your ECC patterns is 
> something you must deal with.
I don't agree, that's a big mtd regression. If you update your kernel on such
flash, you brick it.


Matthieu
