Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from [209.184.180.169] (helo=bob.faxtel.net)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11soQD-0003WB-00
	for mtd@imladris.mvhi.com; Tue, 30 Nov 1999 14:38:25 +0000
Message-ID: <3843E156.7CF8945B@go2fax.com>
Date: Tue, 30 Nov 1999 08:38:14 -0600
From: Bob Canup <rcanup@go2fax.com>
MIME-Version: 1.0
To: mtd@imladris.mvhi.com
Subject: Flash reliability
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


Vipin Malik wrote:

>
> *(subscript).Actually, I'll disagree with the statement that "regular"
> disks suffer from these same issues (to the same extent). To test the
> effect of power fail under ext2 under Linux, I have done some extensive
> (20K+) power cycles on various media.
> The media used were the M-sys IDE2000 flash IDE disks, a "regular"
> desktop harddrive, and a compact flash card.
> Now, both the compact flash and the IDE (m-sys) suffered from a
> catastrophic failure of (some) particular block suffering from some sort
> of "low level" failure (that mainsfested itself as a CRC error or sector
> unreadable error in trying to read it). e2fsck, nor any other utility
> was successfull in recovering from this problem, as the low-level IDE
> block driver bailed out due to this problem.
> The "regular" hard drive did NOT suffer from this problem. I never had a
> situation in which e2fsck -f -y /dev/hdaxx did not manage to repair the
> file system to a usable state.
>
> I did manage to come up with a way to "repair" this system, but that
> would result in a completely blank block of 512 bytes. If this block
> contained 4 inodes, I could (and did) loose upto 4 files or even
> directories and everything under them. Obviously not acceptable.
>

I think that expecting ANYTHING to function properly during power failure is
wishful thinking. I also suspect that the fact that the rotating media did not
exhibit the failures that the flash based system did has to do with probabilities;
because flash writes take much longer to occur than writes to a rotating disk the
probability of randomly encountering a condition where a failure occurs is lower on
a faster writing medium.

Even battery backed up static ram can be trashed if power loss occurs during a
write to the chip.

The only ways that I see to handle the problem are: 1. Run the flash as a Read Only
system. 2. Have a power fail detect signal which detects that the power is going
down , signals the system to flush the buffers, and holds up the power to the
system long enough for that flush and subsequent ordered shutdown to occur.





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
