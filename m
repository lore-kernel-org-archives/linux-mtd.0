Received: from pc1-cwma1-5-cust42.swa.cable.ntl.com ([80.5.120.42] helo=irongate.swansea.linux.org.uk)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18BdsX-0003Pt-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2002 16:27:06 +0000
Subject: Re: mirroring in JFFS2
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: David Woodhouse <dwmw2@infradead.org>
Cc: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>,
   Miraj Mohamed
	 <miraj@procsys.com>, jffs-dev@axis.com,
   linux-mtd@lists.infradead.org
In-Reply-To: <449.1037117917@passion.cambridge.redhat.com>
References: <20021112160843.GE5031@wohnheim.fh-wedel.de>
	<3DD0D966.E6D877EC@procsys.com>  
	<449.1037117917@passion.cambridge.redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 12 Nov 2002 17:22:29 +0000
Message-Id: <1037121749.8746.67.camel@irongate.swansea.linux.org.uk>
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

On Tue, 2002-11-12 at 16:18, David Woodhouse wrote:
> RAID is done at the wrong layer. The file system knows stuff about the
> contents of the media which a block device driver cannot possibly know. So

And vice versa. Its not quite as simple as it looks. For flash I think
you are right.

> you end up having a RAID rebuild take ages to reconstruct parts of the disc
> which the file system _knows_ are currently unused, etc. 
> 
> You can have journalled RAID to help alleviate this problem -- or you could 
> just let the file system do it because that already has a journal anyway.

The fs doesnt know enough about the block I/O layer to do that

> I think it does want to be done in the file system, or possibly even in a 
> layer _above_ the individual file system, which duplicates writes to two or 
> more underlying file systems of a mountpoint, and do whatever's deemed 
> appropriate for reads. Doing it in the individual file system is probably 
> easier, if less interesting :)

A dupfs layer is probably quite doable too yes. However for JFFS2 surely
all you actually want to do is write each log entry including its ID
number to both journals. When you hit a bad block you can play back that
bit of the journal from the other flash and then mark it bad. The only
fun case is working out the size of your journal since its effectively
the smaller of two journals can shrink online.
