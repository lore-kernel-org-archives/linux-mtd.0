Received: from e6.ny.us.ibm.com ([32.97.182.106])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C27Hy-0005aT-7B
	for linux-mtd@lists.infradead.org; Tue, 31 Aug 2004 07:59:03 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: Felix Domke <tmbinc@elitedvb.net>
In-Reply-To: <41345F58.4000206@elitedvb.net>
References: <41345F58.4000206@elitedvb.net>
Content-Type: text/plain
Message-Id: <1093953527.25339.70.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Tue, 31 Aug 2004 06:58:48 -0500
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Incomplete nodes written to flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-08-31 at 06:22, Felix Domke wrote:
> I have a 32MB NAND flash using linux-2.6.8-rc4 with a 2MB jffs2 
> partition (along with a bigger jffs2 partition).
> 
> What I experience is corrupted nodes when not unmounting a jffs2 
> partition properly. It seems that the last node written to flash is 
> incompetely written (the last, not completely filled sector isn't written).
> 
> Unmounting writes this last sector, with correct padding. Now, is that 
> the supposed behaviour?
> 
> I have, for example, a 2MB boot jffs2 partition. It only contains one 
> file in mostly 4k chunks. At some boundaries, there are like ~0x98 bytes 
> unused space, which is just filled with FF until the next sector. I know 
> that these can't be avoided, as a chunk can never wrap around a block, 
> and the remaining space is not enough to generate a new chunk.
> 
> When i now create any file on that partition, the new directory node and 
> the new file node will be written, but then a garbage collection will 
> start, collecting a block with these 0x98 bytes free space. Why does it 
> make a GC here? Does it try to reorganize the blocks to make the 0x98 
> bytes usable?

Not sure.

> 
> But in any case, the last sector of the last garbage collected block 
> (i.e. the last sector "written") isn't physically written to the device, 
> only when i unmount the filesystem. Is that supposed? I know that NAND 
> has these "10 writes then you must erase" restriction, so i guess the 
> last write is delayed since you can't reuse the last part of the sector 
> otherwise without counting these 10 times. But in my eyes, it would be 
> better to waste the remaining sector (<512 bytes) but keep data 
> integrity in these cases, because otherwise you will always(!) loose 
> data when turing off the device.

Have you actually lost data?  I have seen the case where GC nodes don't
get flushed to the medium on my board, but I haven't lost data.

> 
> I know that jffs2 should ignore all nodes with wrong data crc, but i 
> don't want to rely on that.
> 
> Or is there any timer which completes these writes after a certain 
> timeout which just doesn't work for me?

pdflushd will write out non-GC nodes.  GC nodes aren't flushed because
of wasted space with padding I suppose.

josh
