Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D18X7-0005vd-Jd
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 14:38:54 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1D18UT-0007Dd-DM
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 20:36:09 +0100
Received: from 212.242.189.63 ([212.242.189.63])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 Feb 2005 20:36:09 +0100
Received: from martin by 212.242.189.63 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 Feb 2005 20:36:09 +0100
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Date: Tue, 15 Feb 2005 20:22:44 +0100
Message-ID: <cuti4g$g6h$1@sea.gmane.org>
References: <4210DB19.9000808@ateme.fr>
	<4210DEDB.DD35E2DE@st.com>	<4210E6C3.9030208@ateme.fr>	<1108404250.16612.327.camel@tglx.tec.linutronix.de>
	<1108425786.22597.6.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <1108425786.22597.6.camel@baythorne.infradead.org>
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

Hi,

>>>>JFFS2 on NAND flash uses a page buffer. It is flushed to the flash when
>>>>it is full, or when you do fsync, sync or umount.
>>>Does that mean that I have to call fsync each time after fclose a file ?
> Yes. It's precisely the same as with other file systems. If you write to
> a file, close it and then lose power immediately, your data may be lost.
> It's not guaranteed to be on the medium until you sync.
Well, as someone told me the other day on the IRC-channel, the 
writebuffer is flushed automatically if the buffer has not been accessed 
for X (2?) seconds (controlled by the VFS, right?)...

Correct me if I'm wrong...

// Martin
