Received: from mg03.austin.ibm.com ([192.35.232.20])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17a01P-0007nH-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 21:24:39 +0100
Subject: Re: "Read-only file system" error while writing
From: Stephen Hui <gromit1463@mailworks.org>
To: linux-mtd@lists.infradead.org
Cc: stuart.menefy@st.com
In-Reply-To: <20020731163530.70c45960.stuart.menefy@st.com>
References: <1028064443.23642.52.camel@mahi190.austin.ibm.com>
	<20020731163530.70c45960.stuart.menefy@st.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 31 Jul 2002 15:24:28 -0500
Message-Id: <1028147069.12139.81.camel@mahi190.austin.ibm.com>
Mime-Version: 1.0
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

Thanks, Stuart.

I applied the patches, but still no go.  I did notice that after
applying the patches, a slightly new behaviour appears: when I

    echo "1" > /dev/mtd0

and then

    dd if=/dev/mtd0 of=partition.dat bs=1k count=1

I see that the partition contains a "1\n", then the rest of the bits are
erased as they should be.  I know that in this case the do_write_word()
function is called based on the mess of printk()s I've sprinkled into
the source.


When I do these:

    cp rootimg.jffs2 /dev/mtd0
    cat rootimg.jffs2 > /dev/mtd0
    dd if=rootimg.jffs2 of=/dev/mtd0 bs=4k

they all call do_write_buffer().  I was looking at the specsheet for my
STMicro chips, and I didn't see any mention of Write-to-Buffer (command
0xE0) which is in the Intel command set, and issued by
do_write_buffer().  Is this command supported on the STMicro chips? 
Could non-support contribute to my problem?


Thanks again,
Stephen.  :o)




On Wed, 2002-07-31 at 10:35, Stuart Menefy wrote:
> Stephen
> 
> On Tue, 30 Jul 2002 16:27:23 -0500
> gromit1463@mailworks.org wrote:
> > I have a set of STMicro flash chips (M28W320CT) that use the Intel
> > Extended CFI command set (0001), and I'm using kernel 2.4.2.  I can
> > partition the chips, lock and unlock the chips, erase the chips and read
> > from (dd) the chips perfectly fine.
> 
> I had problems getting these devices to work as well, and ended up deciding
> there were a couple of bugs which had to be worked around. One is a problem
> in the state machine which handles unlocking returns to read mode when
> it should stay in command mode, and the other is a simple error in the CFI
> data, which gets the size of the device wrong!
> 
> The attached changes work for me. Unfortuntaly my cfi_cmdset_0001.c is
> pretty heavily modified, so the patch may not apply cleanly. The two
> changes are for do_lock_onblock() and do_unlock_oneblock().
> 
> Note that I was using the bottom bank version, so if you find you also
> need the work around for the CFI data being wrong, you will probably have
> to adjust the device ID being checked for.
> 
> Hope this helps
> 
> Stuart
> 

-- 
"Find out what you've been missing while you've been
rebooting Windows NT." -- Infoworld on Linux

http://www.ao.com/~regan/penguins/tux.html
