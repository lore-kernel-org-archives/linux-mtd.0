Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from mail1.danielind.com ([12.19.96.6])
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11sZAX-0002bb-00
	for mtd@imladris.mvhi.com; Mon, 29 Nov 1999 22:21:13 +0000
Message-ID: <3842FC71.9BFC757A@danielind.com>
Date: Mon, 29 Nov 1999 16:21:37 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: MTD <mtd@imladris.mvhi.com>
Subject: [Fwd: Reliability of FLASH data storage]
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> vmalik@danielind.com said:
> > Hi all, going through the list archive at the web site I did not find
> > any discussion on the reliability of data storage during writes to
> > FLASH.
> 
> You haven't thought about bit errors in read/write.
> 
> NFTL stores 6 bytes of error correction data for each 256-byte block stored on
> the flash. This can be used to correct bit errors upon reading it back.

I guess that this works for bit/byte read/write errors. Not what I was
really refering to. (BTW, how many bit errors can 6 bytes in 256
correct/detect?)

> 
> > By reliability I mean, when data is being stored onto a flash sector,
> > what happens when power is suddenly and without warning removed?
> 
> That flash sector is invalid - it contains unknown data. The same problem
> exists with data storage on magnetic media. That's what journalling
> filesystems were invented for.

Well, yes, but embedded systems have a *MUCH* higher requirement for
unattended reliability/recoverability than desktop systems.
Disk systems may have the same issue, however embedded systems that are
thinking of using FLASH as a storage medium do not have the option to
use rotating disks. Hence its not as if disks are really a choice. Hence
even if disks are unsuitable due to this limitation does not mean that
FLASH systems should be too!*(See subscript).

About Journalling file systems, what is the overhead (in the Kernel).
Are they readily available for linux. The only journaling f/s that I
heard for Linux was the one that SGI was supposed to release a while
back. I read the specs on it, and it was obviously designed for large
disks (recommented minimum disk size of a few gigs, 32+Meg system memory
etc.). Not really affordable in embedded systems.

> 
> Actually, NFTL handles this situation OK - it always keeps a consistent state
> on the flash media, and only after the new block is written will it be marked
> as valid, then the old one overwritten.

Isn't that NAND-Flash? What about using the routines already implemented
for NOR flash. (am I getting really confused here?).
Hmm, what about the place that it is being marked valid? Are there 2
copies of that too? This was the stuff that I was talking about in my
original mail, about not seeing a discussion about.
I am willing to do some extensive power cycle tests if these have not
been done  before on these drivers to test their roburstness.


> 
> But that's not enough - if you have a bog standard ext2 filesystem on your
> NFTL, then you have just reduced the problem to the same level as you'd have
> on a real disk.

...but as mentioned above embedded systems are held to a much higher
standard than real disks in real desktop systems.

> 
> You also need a filesystem which does the same - like ext3.

I didn't get this. Does the same as what?

> 
> What I really want to do is a filesystem directly on the flash - none of this
> 'pretend it's a block device' stuff.

Do you have a list of advantages/disadvantages for this? I would be
interested to see those if possible.

> 
> Jason, how's FFS2 coming along? Is it possible to make it POSIX-compliant
> without a hack as evil as UMSDOS?
> 
> --
> dwmw2
> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

*(subscript).Actually, I'll disagree with the statement that "regular"
disks suffer from these same issues (to the same extent). To test the
effect of power fail under ext2 under Linux, I have done some extensive
(20K+) power cycles on various media.
The media used were the M-sys IDE2000 flash IDE disks, a "regular"
desktop harddrive, and a compact flash card.
Now, both the compact flash and the IDE (m-sys) suffered from a
catastrophic failure of (some) particular block suffering from some sort
of "low level" failure (that mainsfested itself as a CRC error or sector
unreadable error in trying to read it). e2fsck, nor any other utility
was successfull in recovering from this problem, as the low-level IDE
block driver bailed out due to this problem.
The "regular" hard drive did NOT suffer from this problem. I never had a
situation in which e2fsck -f -y /dev/hdaxx did not manage to repair the
file system to a usable state.

I did manage to come up with a way to "repair" this system, but that
would result in a completely blank block of 512 bytes. If this block
contained 4 inodes, I could (and did) loose upto 4 files or even
directories and everything under them. Obviously not acceptable.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
