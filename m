Received: from shyguy.smb.utfors.se ([195.58.112.21])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cjNr-0004aA-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2002 10:15:07 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: "Dave Ellis" <DGE@sixnetio.com>,
	<linux-mtd@lists.infradead.org>
Subject: RE: Disk blocks for long periods 
Date: Thu, 8 Aug 2002 11:15:05 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLKEJIFFAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <28529.1028794122@redhat.com>
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

> 
> joakim.tjernlund@lumentis.se said:
> >  You can move the wake_up() call up one step(xxxx_write_words()) and
> > call it just before  you leave that function. I tried that and it's a
> > improvement(note, I using buffer writes, so word writes should see an
> > even better improvement), but that will also hold reads back(not that
> > I noticed anything) until xxx_write_words has completed.  We can fix
> > that by having separate wait queues for read and erase. 
> 
> Aren't reads held back anyway for the same reason that erases are -- by the 
> time we actually schedule after waking them, the chip is in FL_WRITING 
> again?

Yes, that why you need 2 queues. Then you do wake_up()&cond_resched(). 
The read queue get woken after every word/buffer write and
the erase queue after the whole read/write has completed.

> 
> What happens if you stick a cond_resched() immediately after the wake_up() 
> (ok, after the spin_unlock).?

I had that before I moved wake_up one step. My copy test was improved
with almost 1 sec(from ~10 to ~9) when the wake_up()&cond_resched() was one step up.

 Jocke
> 
> --
> dwmw2
> 
> 
> 
