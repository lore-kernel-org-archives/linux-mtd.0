Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EaSqo-000509-Ft
	for linux-mtd@lists.infradead.org; Fri, 11 Nov 2005 01:57:38 -0500
Message-ID: <437440D0.6090007@ru.mvista.com>
Date: Fri, 11 Nov 2005 09:57:20 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Charles Manning <manningc2@actrix.gen.nz>
References: <200511071915.03263.tglx@linutronix.de>
	<200511080826.30601.manningc2@actrix.gen.nz>
In-Reply-To: <200511080826.30601.manningc2@actrix.gen.nz>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org
Subject: Re: MTD git repository status
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Charles et al,

>>- [MTD] NAND: OOB changes
>>	Needs more thoughts. I'm particularly unhappy with the introduction of new
>>functions and the still pending problem of the automatic
>>placement/retrieval of oob data. The change should subsume and/or extend
>>the oob_info
>>functionality rather than introducing a parallel solution.
>>    
>>
>
>There are two parts to this, I think:
>1) The client (ie fs) side: 
>More and more I think that the client should just call read_ecc etc with null 
>data params in the spirit of my semi-patch proposal. This is pretty straight 
>forward and obvious as to what is intended. read_oob is ambiguous. I expect 
>that with time all fs/clients will move all oob handling to AUTOPLACE because 
>it is too messy having oob_sel hanging through the interface. ( I know I have 
>small intestines, I want to have small intestines, but I don't want to see 
>them). From an OS perspective (ie outside of mtd), getting a simple interface 
>that is well defined and will be consistent over time is pretty important.
>  
>
This may be implemented but will lead to more complicated do_read_ecc 
function so I suggest not to do that.
Reasons:
1. nand_read_oob is capable of reading the oob data from a given offset. 
nand_do_read_ecc is not. The need for that may go away as we move 
forward with the new approach to the oob, but still...
2. There may be a need to read oob data from more than one page. If we 
want to have this functionality supported in do_read_ecc, it will lead 
to introduction of yet another parameter of this function and 
complicated function finish criteria.

>2) I think that oob_info-driven nand_base has got about as complex as it can - 
>perhaps gone too far. You cannot handle all possible cases with nand_base 
>anyway(eg. dma-based solutions). If you try, then do too many things with the 
>same code you end up with so many ifs and branches that performance goes to 
>hell, as well as very convoluted code where bugs can hide with ease. I agree 
>therefore that using functions to replace functionality is a better idea. It 
>is perhaps time for a bit of modularity too.
>  
>
I propose to get rid of nand_oobinfo completely and introduce the only 
one 'oobfree' integer which will denote spare (i. e. not used by the MTD 
layer) OOB data size per page.
This should be enough for the MTD users, as far as I can see. On the 
other hand, it will provide better modularity.
This also shows the advantage of layout-based NAND page handling. The 
layouts remain inner part of the MTD layer so MTD users like JFFSx or 
YAFFSx don't need to know anything about that as opposed to nand_oobinfo 
which needs to be exported.

Details:
Currently we have the following layout item structure:

struct page_layout_item {
        int length;
        enum {
                ITEM_TYPE_DATA,
                ITEM_TYPE_OOB,
                ITEM_TYPE_ECC,
        } type;
};

This reflects the current nand_base implementation, but in order to 
implement what's proposed above, this needs to be

struct page_layout_item {
        int length;
        enum {
                ITEM_TYPE_DATA,
                ITEM_TYPE_OOB_MTD,
                ITEM_TYPE_OOB_SPARE,
                ITEM_TYPE_ECC,
        } type;
};

Then it's going to be as simple as follows. do_read_ecc/read_oob will 
just copy only the OOB_SPARE data to the data pointer provided. 
write_page/write_oob will treat the incoming oob data as data that is 
needed to be written into the OOB_SPARE parts.
OOB_MTD will define OOB bytes used for bad block markers and whatever 
else MTD layer wants.

Best regards,
   Vitaly
