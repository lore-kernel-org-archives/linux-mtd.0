Received: from mail.fh-wedel.de ([213.39.232.194])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AUmga-0006NC-NY
	for <linux-mtd@lists.infradead.org>; Fri, 12 Dec 2003 12:46:24 +0000
Date: Fri, 12 Dec 2003 13:44:20 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Michele Cimenti <mcimenti@solari.it>
Message-ID: <20031212124420.GB6112@wohnheim.fh-wedel.de>
References: <005b01c3bfc2$d6918ed0$0301a8c0@mcimenti>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <005b01c3bfc2$d6918ed0$0301a8c0@mcimenti>
cc: mtd-mailing-list <linux-mtd@lists.infradead.org>
Subject: Re: MTD tools
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 11 December 2003 09:43:24 +0100, Michele Cimenti wrote:
> 
> I'am working on a project that make intensive use of Flash device. For that
> reason a tool that can report info about Flash residual life will be
> usefull. I'm thinking about a inode record (JFFS2) that is written every
> time the sector is erased. This record contains the number of times the
> sector has been erased.
> Did someone develop  such a tool/patch or similar?

The approach depends on good faith.  If anyone ever erases the flash
outside of jffs2, writes a new image to the fs or similar, your
information is gone.  But if that is not a problem, such a patch to
jffs2 should be trivial, grep for the erase marker, add a counter
field to it, read the old counter before erase and write the
incremented into the new erase marker.  Done.

Jörn

-- 
My second remark is that our intellectual powers are rather geared to
master static relations and that our powers to visualize processes
evolving in time are relatively poorly developed.
-- Edsger W. Dijkstra
