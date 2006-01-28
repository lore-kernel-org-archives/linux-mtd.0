Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F3OFk-0007V6-15
	for linux-mtd@lists.infradead.org; Sun, 29 Jan 2006 20:55:07 -0500
Message-ID: <43DB373D.2000906@ru.mvista.com>
Date: Sat, 28 Jan 2006 12:19:57 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Charles Manning <manningc2@actrix.gen.nz>
References: <OFD870B79D.90A804FE-ON88257101.0037ED08-C2257101.0037DF6B@mindspeed.com>
	<43D8C5E1.4010600@ru.mvista.com>
	<200601271126.23808.manningc2@actrix.gen.nz>
In-Reply-To: <200601271126.23808.manningc2@actrix.gen.nz>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: yuri.golovach@mindspeed.com, linux-mtd@lists.infradead.org,
	yaffs@stoneboat.aleph1.co.uk
Subject: Re: [PATCH] treat OOB as a single chunk of oobavail bytes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Charles,

no it's not yet in CVS. I think I'll be able to commit it if we get any 
positive feedback on this patch (i. e. if it's actually working for 
anyone else than me :))
As for write_oobfree, it looks to be  useful for JFFSx to stop messing 
with oobinfos in JFFSx code.

Best regards,
   Vitaly

Charles Manning wrote:

>On Friday 27 January 2006 01:51, Vitaly Wool wrote:
>  
>
>>Hi Yuri,
>>
>>well, lemme just summarize what you hafta do in order to make YAFFS2
>>work with my patches.
>>
>>1. Apply the following patch to the mtd code:
>>http://lists.infradead.org/pipermail/linux-mtd/2005-December/014648.html
>>(yes, it's a single patch!)
>>2. Modify the fs/yaffs2/yaffs_mtdif2.c to use read_oobfree/write_oobfree
>>where appropriate.
>>
>>Hope that helps,
>>
>>   Vitaly
>>    
>>
>
>Hi Vitaly
>
>Is this in CVS yet? If not, I hope it will be there soon.
>
>From what I see, this is going to be just what we need.
>
>YAFFS2 does not need to write_oobfree as a seperate function (it is always 
>written as a single page write). YAFFS2 only needs read_oobfree.
>
>However, YAFFS1 could use the write_oobfree function at some future date if 
>YAFFS1 gets moved to this interface to remove the current reliance on hanging 
>the ugly ECC parameter stuff through the interface.
>
>I am pretty busy right now, but will try get the YAFFS2 side sorted ASAP. If 
>the YAFFS2 stuff is CVSed before the mtd then I'll just point people to this 
>patch.
>
>Thanx!
>
>Charles
>
>
>  
>
