From: joakim.tjernlund@lumentis.se (Joakim Tjernlund)
Date: Tue, 11 Mar 2003 15:49:34 +0100
Subject: Atmel SyncFlash
In-Reply-To: <1047392295.24808.108.camel@passion.cambridge.redhat.com>
Message-ID: <IGEFJKJNHJDCBKALBJLLAEBAFLAA.joakim.tjernlund@lumentis.se>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

> It's not entirely trivial but it's not too hard either; it's been
> discussed and we think we know how to do it. Nobody's yet actually
> stepped up and provided either code or the right form of motivation to
> Red Hat to make _me_ do it :)

The JFFS2/MTD pices are already there. The only thing that's missing is
a new map function in struct map_info, erase_callback(start of EB, end of EB), that is
called when the flash driver initiates an erase.

  Jocke 
