Date: Wed, 16 Feb 2005 17:02:34 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: "Bobzin,Heiko" <h.bobzin@icp-ag.de>
In-Reply-To: <256713DBAA00D911828C00065BF75DEB025F72@icpmail-hh.icp-intern.de>
Message-ID: <Pine.LNX.4.58.0502161702270.30538@phoenix.infradead.org>
References: <256713DBAA00D911828C00065BF75DEB025F72@icpmail-hh.icp-intern.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Data corrupted
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

1. Messages like "Node header CRC failed at 001f4ec8." are normal after 
unclean reboots. 

But the fact that you lost data which weren't engaged is *not normal*. 
Theoretically, if JFFS2 has no bugs, static data can't be lost.

I suspect JFFS2 may have bug: after block is GCed, it is erased, and wbuf 
isn't sync-ed before erase. I'll see the relative places in JFFS2 and 
check if it possible. If it is, it definitely must be fixed.

Bobzin,Heiko wrote:
> Hello mtd-fellows,
> 
> I ran into trouble with a test I've implemented. It is basically the 
same
> as the mtd-util checkfs: writing into the flash while powering down
> the device. The problem is, that files which are never touched are
> corrupted, not the data I write.
> I diff'd the data and exactly one 4K block is set to zero in a 500k file
> in a ~7MB JFFS2 flash partition.
> It is reproducible in some hours, but the location differs.

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
