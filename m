Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1614xf-0007nE-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Nov 2001 12:04:11 +0000
Date: Tue, 6 Nov 2001 13:13:16 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2 propsal and a question about burst reads
Message-ID: <20011106131316.A15512@wohnheim.fh-wedel.de>
References: <15375.1005031664@redhat.com> <IGEFJKJNHJDCBKALBJLLGENIEPAA.joakim.tjernlund@lumentis.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <IGEFJKJNHJDCBKALBJLLGENIEPAA.joakim.tjernlund@lumentis.se>; from joakim.tjernlund@lumentis.se on Tue, Nov 06, 2001 at 12:40:18PM +0100
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

Moin!

> 1)
>    Before I can install a new JFFS2 FS image(produced with mkfs.jffs2) I have
>    to erase the whole flash partition, then copy the image(with cp image /dev/mtdlock4)
>    the device. Then I boot linux and now JFFS2 will re-erase all unused blocks. 
>    If I skip the initial erase, then JFFS2 will be confused by the earlier
>    JFFS2 contens which remain after the previous JFFS2 FS that were on the flash.
> 
>    I think this is the expected behavior, correct?
> 
>    I find it unconvinient and time consuming to erase the WHOLE flash partiton
>    before I can install a new FS image. Therefore I wonder if it would
>    be possible to add some flag/end marker in JFFS2 that mkfs.jffs2 could
>    set, so that JFFS2 knows that the flash space after the maker does not
>    contain valid JFFS2 data. Once JFFS2 has recongnized its FS, JFFS2 would
>    delete the end marker and resume normal behaviour. 

That would be simple, if jffs2 was strictly log-structured. But from
what I have heard/read about it, the wear levelling makes all delete
blocks equal. There is no last block, that you can mark in some way.

Hmm. BTW, is it just me, or do other peaople agree, that the j in jffs
is a bug? Journaling has little to do with a log-structure.

Jörn

-- 
When your language is nowhere near Turing-complete, 
syntactic sugar can be your friend.
