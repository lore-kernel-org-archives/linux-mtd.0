Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D18ei-00067c-Fu
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 14:46:45 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e2.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j1FJkhq3003156
	for <linux-mtd@lists.infradead.org>; Tue, 15 Feb 2005 14:46:43 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j1FJkgfN251404
	for <linux-mtd@lists.infradead.org>; Tue, 15 Feb 2005 14:46:42 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j1FJkgjr024992
	for <linux-mtd@lists.infradead.org>; Tue, 15 Feb 2005 14:46:42 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
In-Reply-To: <cuti4g$g6h$1@sea.gmane.org>
References: <4210DB19.9000808@ateme.fr> <4210DEDB.DD35E2DE@st.com>
	<4210E6C3.9030208@ateme.fr>
	<1108404250.16612.327.camel@tglx.tec.linutronix.de>
	<1108425786.22597.6.camel@baythorne.infradead.org>
	<cuti4g$g6h$1@sea.gmane.org>
Content-Type: text/plain
Date: Tue, 15 Feb 2005 13:46:17 -0600
Message-Id: <1108496777.7801.9.camel@windu.rchland.ibm.com>
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

On Tue, 2005-02-15 at 20:22 +0100, Martin Egholm Nielsen wrote:
> Well, as someone told me the other day on the IRC-channel, the 
> writebuffer is flushed automatically if the buffer has not been accessed 
> for X (2?) seconds (controlled by the VFS, right?)...
> 
> Correct me if I'm wrong...

Not quite.  The write buffer is flushed every 5 seconds, unless you tune
it using the /proc entry.  It's controlled by kupdated, which syncs the
supers, which flushes the write buffer in JFFS2.

If the write buffer contains GC data, that isn't flushed at all.

josh
