Received: from e1.ny.us.ibm.com ([32.97.182.141])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D18vW-0006KF-0D
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 15:04:06 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e1.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j1FK44BK028895
	for <linux-mtd@lists.infradead.org>; Tue, 15 Feb 2005 15:04:04 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j1FK44Bk222644
	for <linux-mtd@lists.infradead.org>; Tue, 15 Feb 2005 15:04:04 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j1FK43fb012524
	for <linux-mtd@lists.infradead.org>; Tue, 15 Feb 2005 15:04:03 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
In-Reply-To: <1108496777.7801.9.camel@windu.rchland.ibm.com>
References: <4210DB19.9000808@ateme.fr> <4210DEDB.DD35E2DE@st.com>
	<4210E6C3.9030208@ateme.fr>
	<1108404250.16612.327.camel@tglx.tec.linutronix.de>
	<1108425786.22597.6.camel@baythorne.infradead.org>
	<cuti4g$g6h$1@sea.gmane.org>
	<1108496777.7801.9.camel@windu.rchland.ibm.com>
Content-Type: text/plain
Date: Tue, 15 Feb 2005 14:03:33 -0600
Message-Id: <1108497813.7801.12.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2_get_inode_nodes(): Data CRC failed on NAND device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-02-15 at 13:46 -0600, Josh Boyer wrote:
> On Tue, 2005-02-15 at 20:22 +0100, Martin Egholm Nielsen wrote:
> > Well, as someone told me the other day on the IRC-channel, the 
> > writebuffer is flushed automatically if the buffer has not been accessed 
> > for X (2?) seconds (controlled by the VFS, right?)...
> > 
> > Correct me if I'm wrong...
> 
> Not quite.  The write buffer is flushed every 5 seconds, unless you tune
> it using the /proc entry.  It's controlled by kupdated, which syncs the
> supers, which flushes the write buffer in JFFS2.
> 
> If the write buffer contains GC data, that isn't flushed at all.

Just to clarify that, if the buffer contains _only_ GC data it isn't
flushed.  If it contains GC + inode data, all of that data is.

josh
