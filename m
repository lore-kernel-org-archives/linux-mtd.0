From: dwmw2@infradead.org (David Woodhouse)
Date: 11 Mar 2003 14:57:11 +0000
Subject: Atmel SyncFlash
In-Reply-To: <IGEFJKJNHJDCBKALBJLLAEBAFLAA.joakim.tjernlund@lumentis.se>
References: <IGEFJKJNHJDCBKALBJLLAEBAFLAA.joakim.tjernlund@lumentis.se>
Message-ID: <1047394630.24808.149.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Tue, 2003-03-11 at 14:49, Joakim Tjernlund wrote:
> The JFFS2/MTD pices are already there. The only thing that's missing is
> a new map function in struct map_info, erase_callback(start of EB, end of EB), that is
> called when the flash driver initiates an erase.

Or a write. And we really do need to optimise out the actual flushes.
But yeah -- we know how to do it and it's not hard.

-- 
dwmw2
