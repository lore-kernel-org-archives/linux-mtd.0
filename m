Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Zs2q-0006a2-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 12:53:36 +0100
Date: Wed, 31 Jul 2002 13:53:33 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, Stephen Hui <gromit1463@mailworks.org>
Subject: Re: "Read-only file system" error while writing
Message-ID: <20020731115333.GA28984@wohnheim.fh-wedel.de>
References: <1028064443.23642.52.camel@mahi190.austin.ibm.com> <14660.1028067926@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14660.1028067926@redhat.com>
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

On Tue, 30 July 2002 23:25:26 +0100, David Woodhouse wrote:
> gromit1463@mailworks.org said:
> > When I write to the chips using either cat, dd, stdout redirection, or
> > cp, the CFI driver complains of attempting to write to a "Read-only
> > file system", even after unlocking all blocks in the partition and
> > erasing the partition.  I can mount /dev/mtdblock*, but mount
> > complains and I still can't put anything into the mounted partition.
> > do_write_buffer() in cfi_cmdset_0001.c is returning the error (EROFS).
> 
> The only case in which do_write_buffer() should return -EROFS is if the 
> status bit is set which means that the block in question was locked. Try 
> using the MEMUNLOCK ioctl to unlock it?

We have had a similar problem with the ECC chips. When doing two
writes to the same page, the second write causes an error, leaving the
status word with 0x90. The word is not cleared until an explicit clear
status register command (0x50) is given.
The command set 0001 doesn't know about all this and behaves quite
strange. From user space, the _third_ write to flash causes an error
condition. The second already failed, but this is unnoticed.

At first glance, your chips doesn't appear to have ecc though. Can you
please verify, Stephen?

Jörn

-- 
You can't tell where a program is going to spend its time. Bottlenecks
occur in surprising places, so don't try to second guess and put in a
speed hack until you've proven that's where the bottleneck is.
-- Rob Pike
