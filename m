Received: from dragon.actrix.co.nz ([203.96.16.164] helo=desire.actrix.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19AFwG-0005iB-53
	for <linux-mtd@lists.infradead.org>; Mon, 28 Apr 2003 22:13:28 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: Thayne Harbaugh <tharbaugh@lnxi.com>,
	=?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>
Date: Tue, 29 Apr 2003 09:14:42 +1200
References: <000d01c3090a$4b822850$1a00a8c0@itc.intrinsyc.com>
	<20030426102323.GB31391@wohnheim.fh-wedel.de>
	<1051542140.1171.500.camel@tubarao>
In-Reply-To: <1051542140.1171.500.camel@tubarao>
MIME-Version: 1.0
Message-Id: <20030428211333.100A015505@desire.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Fw: corrupt my NAND flash device
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have seen some wierd stuff before... comments further below:
>
> The whole thing just makes me sick.  It's ugly putting in such a hack.
> One little voice in my head keeps telling me that there's an error in
> software and I just have to find and fix the bug.  Another little voice
> in my head keeps telling me that broken hardware is more common than
> most people want to believe.

Yes, there are/ have been cases where the chips do not latch their commands 
correctly. This can be made worse by marginal chip select timing etc.

I was sent some errata sheets by Samsung at some stage, but I did not secure 
permission to forward these. In all cases, the identified problems have been 
addressed in currently shipping product. To paraphrase the mentioned problems:

* Reading the status too soon after issuing the command: some parts need a 
brief wait after latching the command before the busy flag is valid. Without 
the wait, the busy state might be misinterpreted. 500ns would be ample.

* Ensuring the correct number of address cycles: I have observed cases where 
a chip seems to work when the wrong number of address cycles was issued, but 
gave erratic results.

* Issue a reset command before any read/write/erase command. This is a small 
overhead and ensures that the command register is always in a consistent 
state.

Also check the basics like power and signal integrity. Overshooting/ringing 
clocks could very easily be latching spurious data and corrupting the 
commands.

>
> I haven't been very aggressive about adding the retry code because right
> now I'm interested in more data points: Am I the only one that sees the
> problem of a flash chip that occasionally drops commands or are others
> seeing this same problem?  Is this problem more common but people don't
> see it because the flash filesystems think that a location is bad and
> mark it as unusable?

I'd suggest exploring the above first.

YAFFS is very aggressive about the way it retires data blocks. If any reads 
(including verification) have any corruption (even if the ECC fixes them), 
then the block is retired. The reason for this strategy is that I have a 
theory that blocks get bad with age/use. Rather than encountering 
unrecoverable data errors, YAFFS retires blocks on the first sign of a 
problem.

Someone has previously suggested that I provide a flag to disable on-NAND 
retirement marking during development. I think it is time I added this.

I guess it would be a good thing to do retries in YAFFS to at least get more 
information.

-- Charles
