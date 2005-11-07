Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EZDpu-0007KN-Pm
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2005 15:43:33 -0500
Message-ID: <436FBC6E.8050609@ru.mvista.com>
Date: Mon, 07 Nov 2005 23:43:26 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Thomas Gleixner <tglx@linutronix.de>
References: <200511071915.03263.tglx@linutronix.de>
In-Reply-To: <200511071915.03263.tglx@linutronix.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD git repository status
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thomas et al,

>- [MTD] NAND: OOB changes
>	Needs more thoughts. I'm particularly unhappy with the introduction of new 
>functions and the still pending problem of the automatic placement/retrieval 
>of oob data. The change should subsume and/or extend the oob_info 
>functionality rather than introducing a parallel solution.
>  
>
Yeah I do agree that this stuff has not been verified enough to go into 
git tree.
And I do understand your concerns, so let me elaborate on all that once 
more.

First, there's a hardware-driven need to support the OOB data 
distributed across the page. The fact is that nand_oobinfo *can't hold 
the info needed* for that since it implies that OOB data is contiguous. 
The adequate patcure can be derived only from nand_oobinfo plus 
eccsteps, but anyway handling all that in read/write functions will lead 
to the introduction of the structure similar to page_layout_item.
So, rather then trying to revise nand_oobinfo, I was moving towards 
creation of a new data structure, more say 'linear' and straightforward. 
I think that layout structure well fits.
Let's look at nand_oobinfo from the POV that page_layout_item has been 
introduced and autoplacement is the only option.
In this case the whole nand_oobinfo becomes redundant and will go away, 
and that's what I'm targeting.

I guess that the new functions introduced you're talking about are 
nand_read_oob_hwecc and nand_write_oob_hwecc.
I think that nand_read_oob and nand_write_oob will soon go away, as soon 
as the two new functions prove they are working in all the HW ECC cases. 
Extending them to support SW ECC case is trivial.
On the other hand, I do think that handling the layout in 
read_ecc/write_page should go to the separate function as now these two 
functions have become almost unreadable due to lotsa nesting levels.

Then, I'd like to point out once more that the approach introduced was 
intended to be absolutely transparent to both MTD users and particular 
NAND device drivers. This approach is capable of automated 
placement/retrieval of OOB data but that's gonna be a new stage which I 
deliberately wanted to separate from the approach introduction.
I can create a sort of design proposal for the OOB data handling and 
you/dedekind/Charles/whoever else will tear it apart :) We do need a 
good co-ordination on the changes that alter the behavior of MTD functions.

Hope that all makes sense,

Best regards,
   Vitaly
