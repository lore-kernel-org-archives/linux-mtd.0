From: joakim.tjernlund@lumentis.se (Joakim Tjernlund)
Date: Tue, 11 Mar 2003 16:27:54 +0100
Subject: Atmel SyncFlash
In-Reply-To: <1047394630.24808.149.camel@passion.cambridge.redhat.com>
Message-ID: <IGEFJKJNHJDCBKALBJLLOEBAFLAA.joakim.tjernlund@lumentis.se>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

> On Tue, 2003-03-11 at 14:49, Joakim Tjernlund wrote:
> > The JFFS2/MTD pices are already there. The only thing that's missing is
> > a new map function in struct map_info, erase_callback(start of EB, end of EB), that is
> > called when the flash driver initiates an erase.
> 
> Or a write. And we really do need to optimise out the actual flushes.

I do this in my map functions, read32 and write32.
It's the easy way on PPC since it's only one extra instruction.
Other arch's may have a harder time.

 Jocke
