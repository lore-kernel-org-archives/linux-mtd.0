Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D1JqK-0008Ku-FB
	for linux-mtd@lists.infradead.org; Wed, 16 Feb 2005 02:43:35 -0500
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1D1Jng-0008SB-Qk
	for linux-mtd@lists.infradead.org; Wed, 16 Feb 2005 08:40:44 +0100
Received: from 212.130.19.66 ([212.130.19.66])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 Feb 2005 08:40:44 +0100
Received: from martin by 212.130.19.66 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 Feb 2005 08:40:44 +0100
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Date: Wed, 16 Feb 2005 08:38:42 +0100
Message-ID: <cuut56$jl7$1@sea.gmane.org>
References: <4210DB19.9000808@ateme.fr>
	<4210DEDB.DD35E2DE@st.com>	<4210E6C3.9030208@ateme.fr>	<1108404250.16612.327.camel@tglx.tec.linutronix.de>	<1108425786.22597.6.camel@baythorne.infradead.org>	<cuti4g$g6h$1@sea.gmane.org>	<1108496777.7801.9.camel@windu.rchland.ibm.com>
	<1108497813.7801.12.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <1108497813.7801.12.camel@windu.rchland.ibm.com>
Sender: news <news@sea.gmane.org>
Subject: Re: jffs2_get_inode_nodes(): Data CRC failed on NAND device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>Well, as someone told me the other day on the IRC-channel, the 
>>>writebuffer is flushed automatically if the buffer has not been accessed 
>>>for X (2?) seconds (controlled by the VFS, right?)...
>>>Correct me if I'm wrong...
>>Not quite.  The write buffer is flushed every 5 seconds, unless you tune
>>it using the /proc entry.  It's controlled by kupdated, which syncs the
>>supers, which flushes the write buffer in JFFS2.
But this might be the better solution for Frederic, instead of poluting 
his code with fsync's. That is, just tune the /proc entry (which one?) 
to a value suitable for your needs - e.g. 2 secs.

>>If the write buffer contains GC data, that isn't flushed at all.
> Just to clarify that, if the buffer contains _only_ GC data it isn't
> flushed.  If it contains GC + inode data, all of that data is.
:o)

// Martin
