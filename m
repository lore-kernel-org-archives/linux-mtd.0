Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 161RpU-0001N9-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Nov 2001 12:29:17 +0000
Date: Wed, 7 Nov 2001 13:37:47 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: Bjorn Wesen <bjorn.wesen@axis.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2 propsal and a question about burst reads
Message-ID: <20011107133747.A5963@wohnheim.fh-wedel.de>
References: <20011106150709.A31698@wohnheim.fh-wedel.de> <Pine.LNX.4.21.0111070444370.24341-100000@godzilla.axis.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.21.0111070444370.24341-100000@godzilla.axis.se>; from bjorn.wesen@axis.com on Wed, Nov 07, 2001 at 05:07:09AM +0100
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

Hi!

This discussion is increasingly off-topic. But it remains interesting,
so what the hell!

> > As far as I recall, the "trick" with journaling filesystems is to log
> > only the metadata. On normal hard drives, this speeds up the most
> 
> I think the history was the other way around - the systems which log also
> the data as opposed to metadata were introduced later. The literature
> about journaling filesystems seems a bit vague on the subject, so I don't
> see it as any problem to put all filesystems of this type in a class and
> call it "journaling". After all, it's a journal with or without userdata.. 
> 
> The name "log structured" is equally confusing since your normal
> journaling system is also centred around a log :)

Ok, I can live with that. Still, metadata-only-journaling is a very
clumsy way to name something, but since the need for this rarely
arises - oh well!

> Datalogging as opposed to simply metadata logging is necessary on a flash
> because you can't rewrite blocks at random. It's probably not a good
> technique on a harddisk except if you really want to guarantee actual file
> consistency on a crash, but that would require transactional user-mode
> support anyway (something we've discussed on jffs-dev some times). 

On flash, user data journaling (how I hate this) is the only way to
go. A normal filesystem on top of a read-modify-write block driver is
theoretically possible, but it comes close to insanity to actually use
non-atomic "disk"-operations.
On a regular hard drive, user data journaling maximizes write
performance but will only achieve decent read performance when data is
read successively that was written successively, too. Very unlikely.
On the other hand, it is trivial to write a disk defragmentation tool
for these filesystems. Just read and rewrite everything in the
preferred order and the filesystem logic takes care of the rest.

Jörn

-- 
The cheapest, fastest and most reliable components of a computer system are
those that aren't there  --  Gordon Bell, DEC labratories
