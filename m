Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189RuP-00034x-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2002 15:15:58 +0000
Date: Wed, 6 Nov 2002 16:46:11 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: J B <mad_flasher@hotmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: cfi_cmdset_0020.c
Message-ID: <20021106154611.GC28558@wohnheim.fh-wedel.de>
References: <F147brL1SCeX8KShPdH00000308@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F147brL1SCeX8KShPdH00000308@hotmail.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wed, 6 November 2002 09:03:03 -0600, J B wrote:
[one big block without structure, oh well] ;-)

The M58LW064A chips has two sizes that might be confused but are
orthogonal in semantics:
- Buffer size. When writing to flash, data is copied into a write
  buffer and then written to flash by the chip itself.
- Page size. The ecc checksum is written to flash itself. This is done
  for one page (8 bytes) at a time. Due to ecc, it can only be written
  once before deleting the erase block again.
  Writing it again would cause some some ecc bits to switch from 0 to
  1, impossible for flash.

>     I have a couple of questions reguarding the patch you released a while 
> ago to support the M58LW064A STMicro flash chip.  I noticed that you set 
> the eccsize in the mtd_info structure to 8, and in your patch for jffs2, 
> you used this as the size of the wbuf for writes in nor_wbuf.c.  Isn't this 
> value really the minimum buffer size for the flash chip?

This is the page size. In effect, it also is the minimum buffer size,
yes. And it is the granularity that ecc checksums are calculated from.

> If so, since your 
> patch for jffs2 is based on NAND chips, wouldn't it make more sense to use 
> the oobblock variable in the mtd_info structure to represent the size of 
> the buffer?

Maybe, but you have to try really hard convincing me. You can view the
checksum as oob data, but there is no way to take a look at the data
or even change it. For NAND, as I understand it, the oob data is used
to store data in, the erasemarkers e.g.
And, the eccsize variable appeared to be unused. David didn't object,
so in effect I defined eccsize to be pagesize for NOR flashes. :-)

> There could be other reasons you used eccsize that I am 
> missing and if so please forgive my ignorance ;).  Also, is there a reason 
> you decided to use the minimum buffer size for the wbuf?

The write buffer is a Bad Thing (tm). Try writing to flash, cut the
power, reboot and look at the messages. The last chunk of data will be
missing in 7 out of 8 cases.
The smaller the write buffer is, the better. Zero would be perfect,
but the chip does not allow us to go below 8.

> According to the 
> datasheet for those chips, the buffer can hold up to 32 bytes.  Wouldn't 
> using the maximum buffer available make things more efficient?

32 bytes are used for writing (at least I think so, should check it
again). The write buffer is a different beast, it is the amount of
data that is held back and not written, in case your write doesn't end
on a page boundary.


The ecc chips take some time before you really understand what they
are doing. And the data cheet is not as clear, as it could be. But I
hope, this explains the most important bits to you.

Jörn

-- 
Fantasy is more important than knowlegde. Knowlegde is limited,
while fantasy embraces the whole world.
-- Albert Einstein
