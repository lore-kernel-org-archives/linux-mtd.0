Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CCTmI-0003s6-Je
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2004 22:01:12 -0400
Message-ID: <415A1757.9080007@mvista.com>
Date: Tue, 28 Sep 2004 19:00:55 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Nicolas Pitre <npitre@mvista.com>
References: <20040925021907.D14A2A00043@mail.murgatroid.com>
	<1096108415.31730.4411.camel@imladris.demon.co.uk>
	<20040928234320.GA8283@slurryseal.ddns.mvista.com>
	<Pine.LNX.4.61.0409282042570.15236@xanadu.home>
In-Reply-To: <Pine.LNX.4.61.0409282042570.15236@xanadu.home>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Christopher Hoover <ch@murgatroid.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: Supporting flash that is locked by default
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas Pitre wrote:
> On Tue, 28 Sep 2004, Todd Poynor wrote:
>>Here's a try at automatically unlocking all blocks of Intel CFI flash at
>>probe time and at system resume time.  The new logic is in the chip
>>driver, but perhaps it would be better to move it generic, adding a new
>>chip driver callback for "is unlock needed?"; can rework things that way
>>if desired (was originally hoping to hide this "feature" from generic
>>code).
>>
>>I did not notice a query feature bit that identifies whether the flash
>>has the "all blocks locked at power on" property in the datasheets, so
>>the patch checks whether block 0 is locked and assumes its one of those
>>flashes if so.
> 
> 
> This is a rather bad idea since block 0 is often the bootloader and most 
> likely to be locked on purpose.
> 
> I'm a bit unconfortable with a feature like this as well.  What if I 
> want some partitions to remain locked at all times at the hw level?

The intention was to catch the power-on behavior and normalize it to 
"all unlocked" like traditional flashes, then allow system-specific 
actions (or map partition software locking) to lock blocks, as is 
commonly done on a Rev. J flash, for example.  But it may be the case 
that some folks like the default-locked CFI behavior of these flashes 
and don't want the "all unlocked by default" common denominator, so 
agreed this should be rethought.

> I think the decision of unlocking the chip and what to unlock should 
> remain in the map driver since this is where the knowledge of what the 
> flash is meant to be used for is the most likely to be found.

Or require all the policy on this matter to reside in userspace, 
requiring an explicit flash_unlock for partitions, and not have the 
kernel automatically unlock anything.  If the map partition writeable 
flags are proof enough the partition should be automatically unlocked 
then sounds good to me, I'll send a patch.

>>Since all blocks may be unlocked at resume time, it would be up to a
>>userspace action to relock any previously explicitly locked blocks soon
>>afterwards.
> 
> 
> This sounds really really fishy to me.
> 
> If you can query which blocks are or are not locked before suspending, 
> then why don't you just create a bitmap with the state of the entire 
> flash and restore it upon resume?

I was planning what you describe for "phase 2" (the userspace actions to 
re-lock are actually the converse of how it works today, where actions 
are required to unlock), thought maybe adding this would be 
controversial.  I'll send a patch to do this.  Thanks,

-- 
Todd
