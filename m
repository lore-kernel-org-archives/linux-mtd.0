Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Be9v-0003RV-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2002 16:45:04 +0000
Date: Tue, 12 Nov 2002 18:15:00 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Miraj Mohamed <miraj@procsys.com>, jffs-dev@axis.com,
   linux-mtd@lists.infradead.org
Subject: Re: mirroring in JFFS2
Message-ID: <20021112171500.GF5031@wohnheim.fh-wedel.de>
References: <20021112160843.GE5031@wohnheim.fh-wedel.de> <3DD0D966.E6D877EC@procsys.com> <449.1037117917@passion.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <449.1037117917@passion.cambridge.redhat.com>
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

On Tue, 12 November 2002 16:18:37 +0000, David Woodhouse wrote:
> 
> RAID is done at the wrong layer. The file system knows stuff about the
> contents of the media which a block device driver cannot possibly know. So
> you end up having a RAID rebuild take ages to reconstruct parts of the disc
> which the file system _knows_ are currently unused, etc. 

This is an implementation problem, the RAID driver could as well
reconstruct on the fly and give pending requests priority. No need to
duplicate the code in all the filesystems.

> Getting back to JFFS2, the same applies -- if you have a bad block in one 
> of your flash chips, what do you do about it? Refrain from using the 
> equivalent block in the other chip? Have some kind of block remapper 
> underneath JFFS2, which keeps a whole lot of address information which is 
> in fact entirely superfluous to the file system?

The bad block point does make sense. Hard disks usually work
completely or fail completely. Point taken.

> I think it does want to be done in the file system, or possibly even in a 
> layer _above_ the individual file system, which duplicates writes to two or 
> more underlying file systems of a mountpoint, and do whatever's deemed 
> appropriate for reads. Doing it in the individual file system is probably 
> easier, if less interesting :)

RAID over filesystems would be fun, for sure. But in this case, you
have me convinced, jffs2 is the best place to put it into.

Jörn

-- 
Geld macht nicht glücklich.
Glück macht nicht satt.
