Received: from 206.173.66.57.ptr.us.xo.net ([206.173.66.57]
	helo=zebra.brightstareng.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hvy2s-0006qB-6F
	for linux-mtd@lists.infradead.org; Wed, 06 Jun 2007 12:07:41 -0400
From: Ian McDonnell <ian@brightstareng.com>
To: linux-mtd@lists.infradead.org,
	Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Subject: Re: [Yaffs1] mkyaffs exits with "MTD Erase failure"
Date: Wed, 6 Jun 2007 12:07:27 -0400
References: <mailman.1398.1181133636.2239.linux-mtd@lists.infradead.org>
In-Reply-To: <mailman.1398.1181133636.2239.linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200706061207.27957.ian@brightstareng.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 06 June 2007 08:40, Martin Egholm Nielsen wrote:
> Well, glancing at the code, it should be doing something like
> it:
>
> ==== ORIGINAL mkyaffs.c ====
> for(addr = 0; addr < meminfo.size; addr += meminfo.erasesize)
> {
>    /* Read the OOB data to determine if the block is valid.
>     * If the block is damaged, then byte 5 of the OOB data
> will * have at least 2 zero bits.
>     */
>    oob.start = addr;
>    oob.length = 16;
>    oob.ptr = oobbuf;
>    if (ioctl(fd, MEMREADOOB, &oob) != 0)
>    {
>      perror("ioctl(MEMREADOOB)");
>      close(fd);
>      exit(1);
>    }
>
>    if(countBits[oobbuf[5]] < 7)
>    {
>      printf("Block at 0x08%lx is damaged and is not being
> formatted\n",addr);
>    }
> =======================
>
> However, it doesn't seem to do the trick. So I copied the
> check from "flash_eraseall" and put in, as well:
>
> ==== NEW mkyaffs.c ====
> for(addr = 0; addr < meminfo.size; addr += meminfo.erasesize)
> {
>    /* MEN 2007-06-06 */
>    loff_t bah = addr;
>    int ret = ioctl(fd, MEMGETBADBLOCK, &bah);
>    if (ret > 0)
>    {
>      printf( "Block at 0x08%lx would have been ignored by
> flash_eraseall!\n", addr );
>      continue;
>    } // if
>
>    // OLD CODE HERE
> =======================
>
>
> And now it seems to work:
>
> # mkyaffs-hacked-2007-06-06 -e /dev/mtd0
> argc 3 sh 0 optcnt 2
> Erasing and programming NAND
> Erasing block at 0x080
> Erasing block at 0x084000
> ...
> Erasing block at 0x0898000
> Block at 0x089c000 would have been ignored by flash_eraseall!
> ....
>
>
> So that's good!? Unless there is a reason why that check was
> not there originally!
> Charles Manning, do you care for a comment?

mkyaffs.c coding is from way back when reading the OOB was more
transparent (originally written to run on 'raw' NAND without MTD, 
non-linux). These days (post 2.6.17 mtd, perhaps earlier) this 
technique is not successful.  The OOB bytes returned by MTD will 
have been gathered using the nand_ecclayout policy from the nand 
driver or nand_base.c and the byte *returned* at offset 5 is not 
(necessarily) the block/page status byte and physical offset 5,
as with old mtd api.

See the yaffs mail archive regarding issues with constructing 
Yaffs images using mkyaffs.c etc.  Replacing this old test for a 
bad-block with MEMGETBADBLOCK is fine, but might only take you 
to the next road block.

-imcd
