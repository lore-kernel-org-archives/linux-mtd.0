Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ERq8m-00043i-Sp
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2005 08:00:33 -0400
Message-ID: <4354E3DF.7080504@ru.mvista.com>
Date: Tue, 18 Oct 2005 16:00:31 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Charles Manning <manningc2@actrix.gen.nz>
References: <433D2815.6040603@ru.mvista.com>
	<200510160946.29897.manningc2@actrix.gen.nz>
In-Reply-To: <200510160946.29897.manningc2@actrix.gen.nz>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
Subject: Re: more flexible HW ECC support for nand_base
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Charles,

as for now, I was mainly targeting just to enable hardware ECC support 
for some complicated page layouts within the linix-mtd scope. I was also 
trying to minimize the impact of my changes, i. e. make them as 
transparent as possible for all the nand_base users, and it looks like I 
had some success with it.

I do agree with you that in future read_oob better return OOB data in 
the same format as read_ecc/write_ecc but as of now, this is not 
impemented in my patch. The layout-based approach however is powerful 
enough to allow doing that... in the closest future, if the current 
piece of work gets accepted.

Best regards,
   Vitaly


Charles Manning wrote:

>On Friday 30 September 2005 23:57, Vitaly Wool wrote:
>
>  
>
>>Another part of the problem is nand_read_oob()/nand_write_oob()
>>functions that also make assumptions on NAND flash page layout. It's
>>suggested that they go to nand_chip structure, i. e. it will become a
>>specific chip driver's responsibility to provide those; and if driver
>>does not provide one, the current implementation can be used. If
>>nand_chip provides its own layout, it must read/write oob data according
>>to the layout.
>>
>>These steps should provide backward compatibility and the ability for
>>particular driver owners to update their drivers accordingly with as
>>less pain as possible.
>>
>>Any comments are welcome,
>>
>>    
>>
>
>Hi Vitaly
>
>I'm sorry I could not access the list archive to see if there has been further 
>progress on this topic, so I apologise upfront if this wrecks the flow of the 
>thread.
>
>I think this might also be just what we're looking for to fix some problems we 
>see in YAFFSland.
>
>YAFFS2 uses AUTOPLACE for read_ecc and write_ecc, with the idea that YAFFS2 
>can just pass in a buffer and mtd can do all the byte placement. YAFFS2 does 
>not need (and should not have) knowledge of the actual physical placement. 
>
>That part works fine, but YAFFS2 also needs to read only the tags (in the oob) 
>during mount scanning (and at a few other times like gc). We obviously don't 
>want to read the entire data area and do ECC etc because that is just wasted 
>work. Instead we want to just do read_oob.
>
>At the moment we have the situation that read_oob does a raw read, so you 
>don't get the same bytes as you wrote with AUTOPLACE.  Some people hope that 
>the only difference [with 2k pages] is the 2 bytes of bad block marker and so 
>read at an offset of 2. That works for some, but won't work for everyone.
>
>If I understand it correctly, your proposal would use an implied AUTOPLACE for 
>read_oob. In other words read_oob will provide the same oob bytes as read_ecc 
>with AUTOPLACE. 
>
>That would get you some fans in YAFFSland.
>
>-- CHarles
>
>
>  
>
