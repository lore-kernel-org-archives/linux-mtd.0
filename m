Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11vnzX-0004vy-00
	for mtd-list@infradead.org; Wed, 08 Dec 1999 20:47:15 +0000
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11vnzW-0004vs-00
	for mtd@imladris.mvhi.com; Wed, 08 Dec 1999 20:47:14 +0000
Message-ID: <384EC41E.E192773E@danielind.com>
Date: Wed, 08 Dec 1999 14:48:30 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: MTD <mtd@imladris.mvhi.com>
Subject: [Fwd: Power Down]
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Oron Ogdan wrote:
> 
> Since DiskOnChip is meant to be used in embedded system, we in M-systems
> 
> do is provide a hard disk emulation on flash which is
> resistant to power failures. We power cycle the media for several
> months to check our algorithms are indeed power fail resistant.

I did not test the DOC. If you do the same with the IDE2000 line of
products, then I am telling you, there IS A PROBLEM there!

The type of problems that I saw, were loss of the sectors at the lowest
level. trying to read those resulted in various errors from the disk.
Some were:
CRC error, Unrecoverable error etc.

The only way to recover from these errors was to do a byte write to the
sector. This would make the sector readable but erase the entire 512
byte sector.
This was even before we got to e2fsck!

Unfortunately since it could be ANY sector on the raw disk, on the file
system, it could be a sector that contained 4 inodes. Maybe even 4
directories, thus resulting in the loss of multitude of files. Not only
the last file that was being written to when power failed. This
catastrophic, and not acceptable.

I went back and forth with a couple of guys from m-sys on this but it
never went anywhere.

BTW, this behaviour was observed on multiple disks (>2).


> 
> That means that the NFTL structures on the media
> are resistant to any power loss during any stage of the algorithm.
> The only thing that can happen is that you will have what's called
> orphan
> units that need to be scanned for and released on mount.
> 
> But this only protects the logical / physical mapping, It does not
> guarantee any damage to the file system on those logical sectors was
> not caused.
> 
> The only way to be resistant to power failures in the file system level
> is to use a log-structured file system. I heard ext3 is log-structured
> but
> I am sure one of the Linux guys here knows more about this, Any other
> file system
> that takes power failures into account, (I am afraid to guess NFTL
> ????).
> Some of our customers use their own home brewed LFSs and do it
> successfully.
> 
> Oron
> 
> -----Original Message-----
> From: Bob Canup [mailto:rcanup@go2fax.com]
> Sent: Tuesday, December 07, 1999 9:19 PM
> To: MTD
> Subject: Re:Power Down
> 
> Watch dogs are generally there to catch the problem of a run-away
> machine - this ought to be a very rare occurrence.
> 
> According to Vipin's statistics about 1 in 250 random power failures
> during writes to a DOC2000 results in a bad sector on the device. Since
> you are required to run the chip in RW mode the only way I see to avoid
> the problem is a UPS on the front end - with signaling to indicate power
> failure so that an ordered shutdown could occur.
> 
> As far as the problem of a bad sector which he discussed I have not seen
> any solutions other than the erase and start over one he originally came
> up with - which for the reasons he discussed - is unacceptable.
> 
> The first step toward solving a problem is understanding exactly what
> the problem is. My theory is that if you interrupt a sector write while
> it is in progress the data and the error checking code don't match -
> thus you get a bad sector. Any other theories?
> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
