Received: from nat1.arcom.co.uk ([194.200.159.172] helo=arcom.com)
	by pentafluge.infradead.org with asmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B2pP1-0000KG-J7
	for linux-mtd@lists.infradead.org; Mon, 15 Mar 2004 10:33:00 +0000
Message-ID: <40558646.2040907@arcom.com>
Date: Mon, 15 Mar 2004 10:32:38 +0000
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: linuxmtd <linux-mtd@lists.infradead.org>
References: <20040312205250.8650.qmail@web20729.mail.yahoo.com>
In-Reply-To: <20040312205250.8650.qmail@web20729.mail.yahoo.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: DQ7 vs DQ6 in flash erase/write
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> On Am29LV256M with the same board, the chip is writable but not erasable.

I have this part and it works.  I suspect a board specific issue.

> After long time investigation on the problem I found the following comment
> on ver 1.3 of cfi_cmdset_0002.c.

1.3?  That's fossilized.

> 
>    /* The dq6 toggling method of determining whether the erase is finished
>     * doesn't seem to work for the Fujistu flash chips populated on the
>     * TQM8260 board. We poll dq7 instead.
>     */

This sounds like a problem with a particular Fujitsu chip.  It would 
have been helpful for the person writing that comment to have mentioned 
which chip had the problem.

> 2. Why was the data polling algorithm (DQ7) removed?

Earlier versions were a mess with code for reading the chip status all 
over the place.  I refactored it for easier maintainance.

> 3. Will polling DQ7 be supported later?

If someone implements it in a clean way I don't see why not.

A quick look at the AM29PL320 datasheet indicates that the chip supports 
the DQ6 toggle algorithm.  I'm leaning towards a board specific issue 
unless you have information from AMD regarding non-functionality of the 
toggle-bit algorithm on this chip?

Are the chips interleaved?  I've never tested interleaving so that may 
be broken.

Other than that all I can suggest is that maybe something other than the 
MTD driver is accessing the flash.  This would certainly mess up the 
toggle bit algorithm.  Perhaps the chip selects are setup incorrectly?

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/
