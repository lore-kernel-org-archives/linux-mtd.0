Received: from c214.h061013191.is.net.tw
	([61.13.191.214] helo=Thunder.arbor.com.tw ident=root)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Fc7K-0002GF-Vz
	for <linux-mtd@lists.infradead.org>; Tue, 13 May 2003 16:55:03 +0100
From: Daniel Toussaint <daniel@arbor.com.tw>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <3EC0A6E3.5070404@arbor.com.tw>
Date: Tue, 13 May 2003 16:03:47 +0800
MIME-Version: 1.0
References: <NEBBLJGMNKKEEMNLHGAIEEHGDAAA.mdharm@momenco.com>
	<1052811622.10222.42.camel@imladris.demon.co.uk>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip 2000 128Mb problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



David Woodhouse wrote:

>On Tue, 2003-05-13 at 02:42, Matthew Dharm wrote:
>  
>
>>Well, I found at least one part of the problem.
>>
>>The Linux driver doc2001.c assumes that addresses (in DoC_Address) are
>>23 bits max.  On some parts, the max is 31, so an extra write of the
>>address component is needed.
>>    
>>
>
>Interesting. If we make this change, does it still work with the older
>units?
>
>  
>
>>                                             ... the string "ANAND" is
>>somewhat rare -- the string "BNAND" is significantly more common.
>>
>>I'm starting to wonder if M-Systems has changed their on-chip data
>>format from NFTL to something else....
>>    
>>
>
>Definitely looks that way. Some reverse-engineering (or hopefully
>perhaps assistance from M-Systems) is required. A lot of the format
>looks the same as 'normal' NFTL; it may just be the MediaHeader block
>which has changed. 
>
>Alternatively, given that it's just a bunch of NAND flash chips, we
>could fix up the incompatibility between the DiskOnChip driver and the
>normal NAND drivers, then you could use JFFS2 or YAFFS on it. Real file
>systems directly on the flash make a whole lot more sense than this
>pretending-to-be-a-block-device nonsense anyway
>  
>
David, other MTD guru's , 

Interesting. My company wants to deploy the DiskOnChip millenium PLUS as 
a new standard for our x86 embedded pc product line. (so far we were 
using DIP sockets with a doc2000/mil as an option) . Our other option is 
to just use raw memory chips of some kind -but then we leave the wince 
and other embedded os users with more difficulties.  
We had the local m-systems representatives over , and I can tell you 
that their attitude towards the Linux open source (mtd) drivers for 
their products was close to hostile. Also, they don't even want to 
comment on some issue's (for example jffs2 on DiskOnChip).
I work in support, and whenever a customer has problems with M-systems 
binary drivers/ lilo install / license questions - I teach them how to 
use the linux mtd utilities(+grub)  and this always solves all problems.
For the millenium plus however the only way to go is to use the 
m-systems binary driver. A while back I saw that www.snapgear.com 
announced they had spend several months in developing open source (mtd 
based drivers & the new INFTL layer) for the millenium plus - but 
nothing has been released yet I -  probably licensing/nda issue's.

To get back to the point: Being able to use the raw nand chips in Doc 
devices and put jffs2/yaffs on it would be the greatest thing ever.
My question is , following guidelines in the nand documentation on how 
to write a "mapping driver for your board" is it theoretically possible 
to get it to work? I am not an mtd guru - but  given  enough time , and 
studying the current Doc code ,myself, or someone else might get it to 
work some day?
Or is there just no way to make it work due to lack of 
information/licensing issue's ?? Also, of course the  company I work for 
can sign an nda with m-systems - but this is no use to since we also 
just want to provide open source code to our customers to develop with - 
we don't make end user products.

(Sorry for the long story , ...)

Greetings,
Daniel
