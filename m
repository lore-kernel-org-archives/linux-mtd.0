Received: from stoneboat.aleph1.co.uk ([212.13.198.63])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BPl90-0008J4-OF
	for linux-mtd@lists.infradead.org; Mon, 17 May 2004 17:39:14 +0100
Date: Mon, 17 May 2004 17:39:45 +0100
From: Wookey <wookey@aleph1.co.uk>
To: linux-mtd@lists.infradead.org
Message-ID: <20040517163945.GJ12570@knossos.aleph1.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
cc: YAFFS list <yaffs@toby-churchill.org>
Subject: blkmtd (and YAFFS)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I just came across the blkmtd which is a driver that does the opposite of
mtdblock, and allows JFFS2 (and maybe YAFFS) on IDE-type devices. 

I know we're not supposed to talk about CF cards here, but I'm not sure who
else to ask about this...

We have recently found that it's very easy to wear out crummy CF cards using
conventional disk-journalling systems (ext3 wears a hole in the end of a
512MB flash card in <10 reboots) because every write goes through the
journal section of the device, and clearly its internal controller is
doing a very simple sector->flashpage mapping (yes, we should have turned
off atime, but still it's amazingly exactly not what you wanted :-) 

So what I really want to do is use something that distributes the writes
better than the internal controller so I'm thinking that YAFFS or JFFS2
should do a better job, but still give us journalling/power fail safety.

blkmtd appears to allow this but I see few mentions of it since early 2002.
Is it stable, does it work, has anyone ever tried it with YAFFS?

Is there a better FS for this purpose (anyone know if reiserfs helps
distribute writes around your 'disk' at all?)

thanx for any info you can provide.

Wookey
-- 
Aleph One Ltd, Bottisham, CAMBRIDGE, CB5 9BA, UK  Tel +44 (0) 1223 811679
work: http://www.aleph1.co.uk/     play: http://www.chaos.org.uk/~wookey/
