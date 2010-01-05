Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NS7D1-0006BD-Kl
	for linux-mtd@lists.infradead.org; Tue, 05 Jan 2010 11:04:24 +0000
Subject: Re: JFFS2 - speed up while booting
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.1001051016020.5028@lnxricardw.se.axis.com>
References: <a64f67eb1001041649u500f3a6bx40d443c4a3415f1b@mail.gmail.com>
	<Pine.LNX.4.64.1001050905071.5028@lnxricardw.se.axis.com>
	<a64f67eb1001050013wd122746iab32bdfc93ba1aee@mail.gmail.com>
	<Pine.LNX.4.64.1001051016020.5028@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 05 Jan 2010 13:04:02 +0200
Message-Id: <1262689442.4263.35.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux newbie <linux.newbie79@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-01-05 at 10:23 +0100, Ricard Wanderlof wrote:
> On Tue, 5 Jan 2010, linux newbie wrote:
> 
> > Hi,
> >
> > It is slow during every boot. Seems it is scanning for bad blocks (If
> > I enable the debug message. Usually debug is OFF).
> 
> During mount, JFFS2 will scan for cleanmarkers in the OOB area of each 
> block, indicating that the block has been erased and can be used for 
> storage. If cleanmarkers can not be found in blocks that appear to be 
> empty (= all FFh), it puts the blocks on the erase queue for subsequent 
> erasure. The erase process takes time and during erasure the flash cannot 
> be read from which can account for slow booting. However, this should only 
> happen the first time after mounting a newly flashed file system. 
> Subsequent mounts should detect the cleanmarkers, and no erase will be 
> performed. It can take a few minutes to complete the erase procedure 
> though; if you do a 'top' on your system you'll see the pdflush task at 
> the top while it is in progress, so if you reboot your system several 
> times in succession JFFS2 might not have time to complete the erase of all 
> unused blocks.
> 
> I don't know if this has been addressed recently, but the odd thing is 
> that if you for instance implement separate erase sequence for instance in 
> your flash driver, the total erase+boot time is much less than if you let 
> JFFS2 handle it via the pdflush task.
> 
> Another option is to write cleanmarkers to empty blocks while writing your 
> file system image. I don't think nandwrite has an option for that though.
> 
> But at any rate, you should only see this slowdown after first mount. 
> Subsequent mounts should find the cleanmarkers in place and no erasure 
> should be necessary. So I'm not convinced this is actually your problem.

JFFS2 mount process is split on 2 phases:

1. Scanning. Done synchronously. When finished, JFFS2 is accessible in
R/O more. Some writing is often also possible, if there is substantial
amount of free space. However, generally, the FS is R/O after this
phase.

2. Checking. Done asynchronously in context of the background thread.
During this phase JFFS2 read all nodes of all inodes and checks their
CRC. This is very CPU and I/O consuming process. In essence, this is
needed to figure out which nodes are valide/obsolete and
corrupted/correct. Before this process is done, JFFS2 does not really
know how much free space there is.

On NAND, the erasing is ultra-fast, so the first mount needs erasure
factor is not that important there.

The checking process is always done, on every mount, and it is the most
expensive one.

Some more information about JFFS2 scalability weaknesses can be found in
the UBIFS vs JFFS2 table here:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_scalability

I'm not trying to promote UBIFS (it is that scalable either because of
UBI), it is just that the table contains a good overview.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
