Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ESCbx-0003EP-7B
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2005 08:00:34 -0400
Message-ID: <4356354A.9020805@ru.mvista.com>
Date: Wed, 19 Oct 2005 16:00:10 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Charles Manning <manningc2@actrix.gen.nz>
References: <20051018211330.GA28414@slurryseal.ddns.mvista.com>
	<200510191158.49192.manningc2@actrix.gen.nz>
In-Reply-To: <200510191158.49192.manningc2@actrix.gen.nz>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 ignore ECC bytes in cleanmarker
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I do agree that the OOB data returned should be in the same format as 
OOB data provided. The layout-based model for handling NAND reads/writes 
is capable of fixing that, however, I didn't implement that in my 
layout-based patch due to the fact that I wanted to make it compatible 
with the current drivers.

So, I suggest the following way to go:

1. After linux-mtd is merged into the kernel, commit layout-based patch 
and fix the problems found (if any :)).
2. Agree on the format of OOB data.
3. Implement what was agreed upon.
4. Get rid of redundant structures (I hope that redundant will become 
eccbytes and maybe even oobfree).
5. Update the MTD userland utilities accordingly.

Does that make sense?

Best regards,
   Vitaly

Charles Manning wrote:

>On Wednesday 19 October 2005 10:13, Todd Poynor wrote:
>  
>
>>Floating for discussion a patch that avoids inspecting the ECC (and bad
>>block indicator) bytes in the OOB area when checking an autoplaced
>>chip's block for a valid JFFS2 cleanmarker.  It sounds like cleanmarkers
>>are on their way out, so this specific code might have a pretty short
>>lifespan.  But in general it may be best for the flash filesystems to
>>restrict themselves to looking at the free OOB bytes and ignoring those
>>that the hardware claims for its own purposes, whatever the FS-specific
>>data structure.
>>    
>>
>
>As to scrapping clean markers: One benefit I see in clean markers is that it 
>protects against power loss/reset halfway through an erase. Even though an 
>erase only takes ~2ms, the chip won't complete the erase if the write protect 
>kicks in. For this reason, YAFFS2 *might* start using cleanmarkers at some 
>stage.
>
>This is definitely the way to go for the oob data. This is how YAFFS2 handles 
>things. [YAFFS1 is Smartmedia-format centric, so that is another matter].
>
>As recently discussed on YAFFS list this is the fundamental reason for having 
>AUTOPLACE. Basically oob bytes go in and oob bytes come out and actual 
>physical positioning (and other trickery) should not need to be visible 
>through the fs<-->mtd interface.
>
>  
>
>>In my case I'm dealing with a NAND flash hardware controller that
>>automatically plunks down generated ECC bytes into the OOB (and so far I
>>haven't found a good way to avoid behaviors that modify those bytes), so
>>once the cleanmarker is written the ECC bytes will not be 0xFF and the
>>existing check will fail.
>>    
>>
>
>Yes, an excellent example of why the fs does not want to know, though I have 
>seen even uglier ones!
>
>  
>
>>This falls under the general topic of recent discussion re: JFFS2 and
>>YAFFS* use of OOB bytes, and redefining what read_oob() returns based on
>>the chip-specific layout may well be a better answer (I think Vitaly
>>Wool's recent patches address this).  All in all, I'm not suggesting
>>commit the patch below at this time, but if it's useful to somebody with
>>a NAND controller that behaves similarly or it sparks any discussion
>>then have at. -- Todd
>>    
>>
>
>The current semantics of read_oob give raw info, not AUTOPLACEd info.  Whether 
>the semantics should be changed, I don't know. 
>
>An alternative way to get at the autoplaced oob is to change nand_read_ecc to 
>accept a NULL parameter for the data. ie:
> mtd->read_ecc(mtd, addr,
>                         0,  /* n-data-bytes == 0 : don't read any data */
>                          &dummy,
>                          NULL, /* data-ptr == 0: don't read any data */
>                          oob_buffer,
>                          NULL); /* AUTOPLACE */
>
>This would be more consistent since it preserved read_oob() as "read raw". 
>Some people might baulk at the use of NULL to signify this meaning, but this 
>function already uses oob_buffer == NULL to signify that oob should not be 
>transfered and oobsel==NULL that AUTOPLACE should be used.
>
>- Charles
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
>  
>
