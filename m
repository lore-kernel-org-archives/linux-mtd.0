Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11svHe-0000oE-00
	for mtd@imladris.mvhi.com; Tue, 30 Nov 1999 21:58:02 +0000
Message-ID: <3843F6C5.9D6F6928@danielind.com>
Date: Tue, 30 Nov 1999 10:09:41 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: MTD <mtd@imladris.mvhi.com>
Subject: [Fwd: Flash reliability]
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Bob Canup wrote:
> 
> Vipin Malik wrote:
> 
> >
> > *(subscript).Actually, I'll disagree with the statement that "regular"
> > disks suffer from these same issues (to the same extent). To test the
> > effect of power fail under ext2 under Linux, I have done some extensive
> > (20K+) power cycles on various media.
> > The media used were the M-sys IDE2000 flash IDE disks, a "regular"
> > desktop harddrive, and a compact flash card.
> > Now, both the compact flash and the IDE (m-sys) suffered from a
> > catastrophic failure of (some) particular block suffering from some sort
> > of "low level" failure (that mainsfested itself as a CRC error or sector
> > unreadable error in trying to read it). e2fsck, nor any other utility
> > was successfull in recovering from this problem, as the low-level IDE
> > block driver bailed out due to this problem.
> > The "regular" hard drive did NOT suffer from this problem. I never had a
> > situation in which e2fsck -f -y /dev/hdaxx did not manage to repair the
> > file system to a usable state.
> >
> > I did manage to come up with a way to "repair" this system, but that
> > would result in a completely blank block of 512 bytes. If this block
> > contained 4 inodes, I could (and did) loose upto 4 files or even
> > directories and everything under them. Obviously not acceptable.
> >
> 
> I think that expecting ANYTHING to function properly during power failure is
> wishful thinking....

Hmm, why do you say that? I've designed embedded systems that worked
just fine under power fail conditions. Mostly the CPU is held in reset
once power falls below a certain threshold. Same with SRAM. Writes to
SRAM are gated through a power good signal. Of course since the writes
are asynchronous wrt power fail, any data that takes more than one bus
write cycle to complete can never be guaranteed. But that is solved at a
higher logical level by CRC'ing the block you want to protect etc. Of
course the determination needs to be made by the software designers as
to how critical protection is for a particular of data, and whether
detection is adequate or a backup must be required (recovery).

But to say that this problem cannot be managed is to take the desktop
mentality- "reboots/crashes are a way of life, get used to them".
I refuse to fall into that camp!



> ...I also suspect that the fact that the rotating media did not
> exhibit the failures that the flash based system did has to do with probabilities;
> because flash writes take much longer to occur than writes to a rotating disk the
> probability of randomly encountering a condition where a failure occurs is lower on
> a faster writing medium.

I'll buy that for now. I was just pointing out that flash is definitely
*worse* than rotating media, not that rotating media is acceptable!

> 
> Even battery backed up static ram can be trashed if power loss occurs during a
> write to the chip.

See my comment above.

> 
> The only ways that I see to handle the problem are: 1. Run the flash as a Read Only
> system. 

Not always possible/acceptable. But an (obvious) limited possibility.

>2. Have a power fail detect signal which detects that the power is going
> down , signals the system to flush the buffers, and holds up the power to the
> system long enough for that flush and subsequent ordered shutdown to occur.
> 
Unfortunately this does not work for Linux (the stock kernel) as worst
case latencies are quite high. On a 486DX2-66, with quite a good load
(ethernet, ~4 serial ports going), i've measured typical interrupt
latencies less than 100 micro secs, but worst case of ~40msec! Of course
this is just what I have managed to measure. Could be worse. But even if
one does get an advanced warning (and the warning alert margin would be
system dependent, and may not always be possible), what does one then
do. One has to signal to the lower layers (the flash driver etc.) to
finish the pending writes, but not take on new ones? Could get quite
messy.

Well there is a third solution. It was mentioned by someone else a few
mails back. And that is to inherently make the flash file system
reliable. This could be done by (as suggested by them) to have a "poor
man's journalling" where data is written in a redundant manner and a
"flag" is then flipped as to which is the later data or valid data etc.
This is the solution that I am most interested in, as it does not
require any special hardware solutions of advance warning etc.

And this is the solution that I would most like to see a discussion on.
Any one else interested here about this?

> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
