Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 161HoW-0000Yn-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Nov 2001 01:47:36 +0000
Date: Wed, 7 Nov 2001 05:07:09 +0100 (CET)
From: Bjorn Wesen <bjorn.wesen@axis.com>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
cc: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2 propsal and a question about burst reads
In-Reply-To: <20011106150709.A31698@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.21.0111070444370.24341-100000@godzilla.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
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

On Tue, 6 Nov 2001, Jörn Engel wrote:
> > Well, you can think of a log-structured filesystem as "all journal," so the
> > "J" applies.
> 
> As far as I recall, the "trick" with journaling filesystems is to log
> only the metadata. On normal hard drives, this speeds up the most

I think the history was the other way around - the systems which log also
the data as opposed to metadata were introduced later. The literature
about journaling filesystems seems a bit vague on the subject, so I don't
see it as any problem to put all filesystems of this type in a class and
call it "journaling". After all, it's a journal with or without userdata.. 

The name "log structured" is equally confusing since your normal
journaling system is also centred around a log :)

> Real log-structured filesystems are considered slow in every-day
> useage and to my knowledge only one was ever implemented for some bsd
> flavor.

Datalogging as opposed to simply metadata logging is necessary on a flash
because you can't rewrite blocks at random. It's probably not a good
technique on a harddisk except if you really want to guarantee actual file
consistency on a crash, but that would require transactional user-mode
support anyway (something we've discussed on jffs-dev some times). 

/BW
