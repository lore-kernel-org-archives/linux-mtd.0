Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18BdHI-0003KD-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2002 15:48:36 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20021112160843.GE5031@wohnheim.fh-wedel.de> 
References: <20021112160843.GE5031@wohnheim.fh-wedel.de>  <3DD0D966.E6D877EC@procsys.com> 
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Cc: Miraj Mohamed <miraj@procsys.com>, jffs-dev@axis.com,
    linux-mtd@lists.infradead.org
Subject: Re: mirroring in JFFS2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 12 Nov 2002 16:18:37 +0000
Message-ID: <449.1037117917@passion.cambridge.redhat.com>
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

joern@wohnheim.fh-wedel.de said:
>  Are you trying to put the mirroring stuff into jffs2?
> In the hard disk world, people use md for this, which uses two devices
> and returns one. The filesystem does not need to worry about anything.

RAID is done at the wrong layer. The file system knows stuff about the
contents of the media which a block device driver cannot possibly know. So
you end up having a RAID rebuild take ages to reconstruct parts of the disc
which the file system _knows_ are currently unused, etc. 

You can have journalled RAID to help alleviate this problem -- or you could 
just let the file system do it because that already has a journal anyway.

So, for example, you scribble it to your journal, then to both your mirrors,
and mark the journal transaction complete only when it's hit both discs. 

Getting back to JFFS2, the same applies -- if you have a bad block in one 
of your flash chips, what do you do about it? Refrain from using the 
equivalent block in the other chip? Have some kind of block remapper 
underneath JFFS2, which keeps a whole lot of address information which is 
in fact entirely superfluous to the file system?

I think it does want to be done in the file system, or possibly even in a 
layer _above_ the individual file system, which duplicates writes to two or 
more underlying file systems of a mountpoint, and do whatever's deemed 
appropriate for reads. Doing it in the individual file system is probably 
easier, if less interesting :)

--
dwmw2
