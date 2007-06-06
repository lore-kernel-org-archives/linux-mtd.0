Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hw2HV-0000jR-79
	for linux-mtd@lists.infradead.org; Wed, 06 Jun 2007 16:39:04 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Hw2HM-0007FO-H8
	for linux-mtd@lists.infradead.org; Wed, 06 Jun 2007 22:38:52 +0200
Received: from 0x55536276.adsl.cybercity.dk ([85.83.98.118])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Jun 2007 22:38:52 +0200
Received: from martin by 0x55536276.adsl.cybercity.dk with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Jun 2007 22:38:52 +0200
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Subject: Re: [Yaffs1] mkyaffs exits with "MTD Erase failure"
Date: Wed, 06 Jun 2007 22:38:31 +0200
Message-ID: <f4760b$rmm$1@sea.gmane.org>
References: <mailman.1398.1181133636.2239.linux-mtd@lists.infradead.org>
	<200706061207.27957.ian@brightstareng.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <200706061207.27957.ian@brightstareng.com>
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ian McDonnell wrote:
> On Wednesday 06 June 2007 08:40, Martin Egholm Nielsen wrote:
>>Well, glancing at the code, it should be doing something like
>>it:

>>==== ORIGINAL mkyaffs.c ====
>>for(addr = 0; addr < meminfo.size; addr += meminfo.erasesize)
>>{
>>   /* Read the OOB data to determine if the block is valid.
>>    * If the block is damaged, then byte 5 of the OOB data
>>will * have at least 2 zero bits.
>>    */
--- 8< 8< 8< ---
>>=======================

>>However, it doesn't seem to do the trick. So I copied the
>>check from "flash_eraseall" and put in, as well:
--- 8< 8< 8< ---
>>   int ret = ioctl(fd, MEMGETBADBLOCK, &bah);
>>   if (ret > 0)
>>   {
>>     printf( "Block at 0x08%lx would have been ignored by
>>flash_eraseall!\n", addr );
>>     continue;
>>   } // if
>>=======================

>>And now it seems to work:
--- 8< 8< 8< ---
>>So that's good!? Unless there is a reason why that check was
>>not there originally!
>>Charles Manning, do you care for a comment?

> mkyaffs.c coding is from way back when reading the OOB was more
> transparent (originally written to run on 'raw' NAND without MTD, 
> non-linux). These days (post 2.6.17 mtd, perhaps earlier) this 
> technique is not successful.  

Heh! Actually, I'm running with MTD from 2005-07-22 (2005!)... But, 
still there could be some issues!


> The OOB bytes returned by MTD will have been gathered using the
> nand_ecclayout policy from the nand driver or nand_base.c and the
> byte *returned* at offset 5 is not (necessarily) the block/page
> status byte and physical offset 5, as with old mtd api.

Oh! That's a shame ;-)


> See the yaffs mail archive regarding issues with constructing 
> Yaffs images using mkyaffs.c etc.  

Well, gave it 10 minutes - didn't have any luck searching for mkyaffs 
and/or nand_ecclayout policy...


> Replacing this old test for a bad-block with MEMGETBADBLOCK is fine,
> but might only take you to the next road block.

It only seems to be a problem for the boards that I messed up by setting 
the timing parameters for the chip incorrectly!
But I will look some more to find the "correct" solution...

Thanks Ian!

// Martin
