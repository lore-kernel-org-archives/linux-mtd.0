Received: from anchor-post-33.mail.demon.net ([194.217.242.91])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AJWyb-0007GG-Kz
	for <linux-mtd@lists.infradead.org>; Tue, 11 Nov 2003 11:46:29 +0000
Received: from baydel.demon.co.uk ([158.152.156.193])
	by anchor-post-33.mail.demon.net with esmtp (Exim 3.35 #1)
	id 1AJWxI-00054a-0X
	for linux-mtd@lists.infradead.org; Tue, 11 Nov 2003 11:45:08 +0000
From: Simon Haynes <simon@baydel.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 11 Nov 2003 11:18:26 +0000
MIME-Version: 1.0
Message-ID: <4BFD9F0F1890@baydel.com>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Fwd: Re: SFFDC and blksize_size
Reply-To: simon@baydel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I have been following this thread on the list. I noticed that I had not sent 
this message to the list, as I had intended. After following up with the 
Administrator I am not sure I actually sent this mail anywhere.

So here it is again. I apologise if you already have this.

I don't understand the comments about transfers greater than 16k. As far as I 
can see this never happens. The maximum is set to the blocksize I specify. 
Sure it would be best if all the transfers were modulus 16k. However a 20k 
transfer is better than 5 * 4k. This is not dma so I have no maximum size I 
just keep looping until the data is transferred.

Cheers

Simon.

----------  Forwarded Message  ----------

Subject: Re: SFFDC and blksize_size
Date: Fri, 7 Nov 2003 15:55:54 +0000
From: Simon Haynes <simon@baydel.com>
To: David Woodhouse <dwmw2@infradead.org>

Under SSFDC, as I understand the storage is allocated in 16k chunks.
If the SMC is erased consider writing logical blocks 0-31. First the block
driver requests a write to blocks 0-7. Here I allocate a block and write the
data and OOB. Then for 8-15, 16-23, and 24-31 I just write the data and OOB.
Now this 16K block is valid and full. If you then write 0-31 again I have to
read the old block, allocate a new erased block, copy logical blocks 0-7 from
the write buffer and blocks 8-31 from the old block, write them to a new
location and erase the old physical block.  This is repeated 3 times with the
patched in write data shifting 4k up the 16k block each time. I think this is
the case, perhaps you can suggest an alternative method ? Thus I have to do
this 4 times to write 16k, which means things are slow.

I guess the timing is not that bad. It will do for me I just thought I would
improve it if I could.

I don't really understand what this blocksize business is all about. Is it
the minimum space that can be allocated ? Are you saying that small files or
files which are not modulus 4k will end up allocating 4k and thus space is
wasted ?

16k would work well fro me as I only want 2 big files on a single partition.

I don't know what this mtd_blkdevs helper code is either. Can you point me at
something to look at.

Despite the performace the driver seems to work well. I have a couple of
outstanding issues which are not a problem for me but might be to others.
The first is I have used the FTL major number as I don't know how I should go
about allocating my own. Secondly I may have some issues with concurrent
access to multiple partitions. I know you set up a CVS account for me but I
really don't know what and at what stage to send this stuff. I take it the
code + a make file is enough ?

Thanks

Simon.

On Friday 07 Nov 2003 2:18 pm, you wrote:
> On Fri, 2003-11-07 at 13:12 +0000, Simon Haynes wrote:
> > I have been writing a block driver for SSFDC compliant SMC cards. This
> > stuff allocates 16k blocks.  When I get requests the transfers are split
> > into the size I specifty in the blksize_size{MAJOR] array.
>
> You can't set a block size larger than page size.
>
> > It sems that most things
> > set this to 1k. In my case this causes a performance problem  as I have
> > to end up doing 16 * (16K write,  16K read, 16k erase)  to write and
> > verify a 16k block which has been previously written.
>
> Urgh. Whereas with FTL, NFTL etc. you can just fill in new sectors
> individually in the newly-allocated eraseblock.
>
> Surely you're not actually erasing the block and then praying you don't
> lose power before writing the new contents back? There's some kind of
> chaining from the old to the new block? Can't you say which sectors are
> valid in the new block, and which should still be used from the old?
>
> I wouldn't advocate setting the block size even to 4KiB, since that'll
> waste a lot of space. But we could certainly make use of request merging
> if what you're doing really is necessary -- we can make a
> 'write_sectors' function which writes more than a sector at a time.

-------------------------------------------------------
