Received: from msgbas2x.cos.agilent.com ([192.25.240.37])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B2yLT-0001Vp-Mj
	for linux-mtd@lists.infradead.org; Mon, 15 Mar 2004 20:05:55 +0000
Message-ID: <40560EA2.3000205@agilent.com>
Date: Mon, 15 Mar 2004 12:14:26 -0800
From: Shawn Jin <xiaogeng_jin@agilent.com>
MIME-Version: 1.0
To: David Vrabel <dvrabel@arcom.com>
References: <20040312205250.8650.qmail@web20729.mail.yahoo.com>
	<40558646.2040907@arcom.com>
In-Reply-To: <40558646.2040907@arcom.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linuxmtd <linux-mtd@lists.infradead.org>
Subject: Re: DQ7 vs DQ6 in flash erase/write
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Vrabel wrote:
>>On Am29LV256M with the same board, the chip is writable but not erasable.
> I have this part and it works.  I suspect a board specific issue.
Two Am29LV256M chips are interleaved to form a 32-bit data bus.

>>After long time investigation on the problem I found the following comment
>>on ver 1.3 of cfi_cmdset_0002.c.
> 
> 1.3?  That's fossilized.
Right, :(. But it works for me. It comes from Denx's linux-ppc distribution.

>>   /* The dq6 toggling method of determining whether the erase is finished
>>    * doesn't seem to work for the Fujistu flash chips populated on the
>>    * TQM8260 board. We poll dq7 instead.
>>    */
> 
> This sounds like a problem with a particular Fujitsu chip.  It would 
> have been helpful for the person writing that comment to have mentioned 
> which chip had the problem.

I guess it's Wolfgang Denk. I'll ask him about this.

>>2. Why was the data polling algorithm (DQ7) removed?
> Earlier versions were a mess with code for reading the chip status all 
> over the place.  I refactored it for easier maintainance.

The code is much easier to understand than before. It'll be much better 
if the same functionalities are supported. ;)

> Are the chips interleaved?  I've never tested interleaving so that may 
> be broken.
Yes. The chips are interleaved. That may be the problem.

> MTD driver is accessing the flash.  This would certainly mess up the 
> toggle bit algorithm.  Perhaps the chip selects are setup incorrectly?
I don't think so far the chip selects would be messed up.

-Shawn.
