Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HvuIU-0003ZU-Id
	for linux-mtd@lists.infradead.org; Wed, 06 Jun 2007 08:10:05 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HvuIE-0008AS-Ct
	for linux-mtd@lists.infradead.org; Wed, 06 Jun 2007 14:07:14 +0200
Received: from cpe.atm2-0-1021162.0x3ef28e62.banxx2.customer.tele.dk
	([62.242.142.98]) by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Jun 2007 14:07:14 +0200
Received: from martin by cpe.atm2-0-1021162.0x3ef28e62.banxx2.customer.tele.dk
	with local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Jun 2007 14:07:14 +0200
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Subject: Re: [Yaffs1] mkyaffs exits with "MTD Erase failure"
Date: Wed, 06 Jun 2007 14:06:31 +0200
Message-ID: <f46807$6il$1@sea.gmane.org>
References: <f412p4$b20$1@sea.gmane.org>	<Pine.LNX.4.64.0706041549010.3966@lnxricardw.se.axis.com>	<f41817$vir$1@sea.gmane.org>
	<Pine.LNX.4.64.0706041709100.3966@lnxricardw.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.64.0706041709100.3966@lnxricardw.se.axis.com>
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Ricard Wanderlof wrote:
> On Mon, 4 Jun 2007, Martin Egholm Nielsen wrote:
>>>>So, I fixed the timing in the kernel and tried erasing the flash
>>>>again. But with no luck - mkyaffs refuses to erase/program the
>>>>flash:

>>>Mtd refuses to erase blocks that have been marked bad. There is no
>>>workaround on a running kernel, but it is possible to patch the
>>>kernel to do this.

>>But as you see, flash_eraseall on the same device works perfectly fine:
>>flash_eraseall /dev/mtd0
>>....
>>Skipping bad block at 0x0179c000
>>Erasing 16 Kibyte @ 1ffc000 -- 99 % complete.

> flash_eraseall skips bad blocks while erasing. I don't know how mkyaffs 
> works though.

Well, glancing at the code, it should be doing something like it:

==== ORIGINAL mkyaffs.c ====
for(addr = 0; addr < meminfo.size; addr += meminfo.erasesize)
{
   /* Read the OOB data to determine if the block is valid.
    * If the block is damaged, then byte 5 of the OOB data will
    * have at least 2 zero bits.
    */
   oob.start = addr;
   oob.length = 16;
   oob.ptr = oobbuf;
   if (ioctl(fd, MEMREADOOB, &oob) != 0)
   {
     perror("ioctl(MEMREADOOB)");
     close(fd);
     exit(1);
   }

   if(countBits[oobbuf[5]] < 7)
   {
     printf("Block at 0x08%lx is damaged and is not being 
formatted\n",addr);
   }
=======================

However, it doesn't seem to do the trick. So I copied the check from 
"flash_eraseall" and put in, as well:

==== NEW mkyaffs.c ====
for(addr = 0; addr < meminfo.size; addr += meminfo.erasesize)
{
   /* MEN 2007-06-06 */
   loff_t bah = addr;
   int ret = ioctl(fd, MEMGETBADBLOCK, &bah);
   if (ret > 0)
   {
     printf( "Block at 0x08%lx would have been ignored by 
flash_eraseall!\n", addr );
     continue;
   } // if

   // OLD CODE HERE
=======================


And now it seems to work:

# mkyaffs-hacked-2007-06-06 -e /dev/mtd0
argc 3 sh 0 optcnt 2
Erasing and programming NAND
Erasing block at 0x080
Erasing block at 0x084000
...
Erasing block at 0x0898000
Block at 0x089c000 would have been ignored by flash_eraseall!
....


So that's good!? Unless there is a reason why that check was not there 
originally!
Charles Manning, do you care for a comment?


> You can always re-mark the factory bad ones, given that you have written 
> down which they were once... if you are using a flash-based BBT, erasing 
> the BBT blocks would suffice, as the bad block management in jffs2 when 
> using a flash-based BBT doesn't touch bad block markers. I would assume 
> from your reasoning that you are not using a flash-based BBT?

I don't, no. And I didn't write down the factory ones...


BR,
  Martin
