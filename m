Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15tkI9-0003T3-00
	for <linux-mtd@lists.infradead.org>; Wed, 17 Oct 2001 07:35:01 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Question/suggestion 
Date: Wed, 17 Oct 2001 08:43:16 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLCEJJEPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <28153.1003250279@redhat.com>
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

Hi again
> 
> joakim.tjernlund@lumentis.se said:
> > I have noticed that when I mount a jffs2 FS(created with mkfs.jffs2)
> > for the first time and look at the output of the df command, I see
> > that "Use%" field slowly rise to 100% and then it drops back to ~15%
> > and then it stays there. During this rise I also noticed that kupdate
> > was eating alot of CPU(~80%)
> 
> > Is this normal? 
> 
> The first time it's mounted, all the blocks need to be erased and 
> formatted correctly. That's done in the context of kupdated. The Use% field 
> is high because the blocks are being taken out of the list of available 
> blocks - we should probably fix that.

Does JFFS2 erase the blocks that are already erased? I also noticed that an umount hangs
until kupdate is finished, should it? Is it safe to power cycle the board during this
initial formating?

> 
> 
> >  Is there any point to have a config option for preferred compression
> > algorithm order?
> 
> Probably not. If you want rtime first you might as well just omit zlib 
> completely. And yes, rtime will be faster.
OK, if I am the only one interested in this I agree. I will just edit the sources to
my needs.

 Jocke
> 
> --
> dwmw2
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
