Received: from e1.ny.us.ibm.com ([32.97.182.101])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CET4I-0007Fr-LF
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 09:40:02 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <41614F6B.6050802@yandex.ru>
References: <416122A1.4060302@oktetlabs.ru>
	<1096885344.30942.559.camel@hades.cambridge.redhat.com>
	<4161379C.3070109@oktetlabs.ru>
	<1096893405.22034.9.camel@weaponx.rchland.ibm.com>
	<41614F6B.6050802@yandex.ru>
Content-Type: text/plain
Message-Id: <1096897195.22034.23.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Mon, 04 Oct 2004 08:39:55 -0500
Content-Transfer-Encoding: 7bit
Cc: Artem Bityuckiy <dedekind@oktetlabs.ru>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [OBORONA-SPAM]  Re: inode checkpoints
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-10-04 at 08:26, Artem B. Bityuckiy wrote:
> > 
> > Yes and no.  It makes sense for any flash device that you can't write to
> > the same page multiple times without an erase in between.  NAND is
> > certainly the largest group of such devices.  There are others that have
> > this behavior as well.  See cfi_cmdset_0020.c.
> 
> The original idea of ICPs (inode checkpoint) is to improve JFFS2 
> performance on NAND not because the page can't be written lots of times.
> The NAND flash specific is that there is constant delay when accessing 
> any page.
> 
> For example consider TOSHIBA TC5DxM82A1xxxx 8-bit 256 Mbit NAND flash.
> Page access delay is 25 microsecs.
> Read cycle is 50 nanosecs.
> 
> When you read 3 bytes from this NAND flash and these bytes are situated 
> in one page (consequently), you will spent about 25 microsecs + 50 * 3 
> nanosecs.
> But when you read those 3 bytes from the same NAND flash and these bytes 
> are situated in three different pages, you will spent about 25*3 
> microsecs + 50 * 3 nanosecs.

Yep.

> 
> So, when the inode cache is built, we read node headers from *different 
> pages*. But if there is checkpoint, we read from few pages. This is the 
> main idea.
> 
> But in case of regular file inodes we also save *additional* time since 
> we don't check the *data* CRC for those nodes, which are in 
> checkpoint(s). In case of the directory inode there is no such 
> additional time savings.

I agree that these changes will benefit NAND the most, but they are also
valuable for all flashes.  

Say I have a 16 MiB file on my NOR flash.  When a stat or open is done,
iget is called, which calls readinode, which then goes and reads all the
nodes off of the flash to build up the inode information.  I've seen
that take upwards of 2 seconds, just because of the number of data nodes
that have to be read.

Now, same situation, but I have a checkpoint node out there.  I don't
have to read _all_ the data nodes because the checkpoint gives me a
snapshot of at least some of them, right?

Or maybe I am extending your idea a bit further than what you
intended...

josh
