Received: from mail.fh-wedel.de ([213.39.232.194])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AshWx-0001pw-Ra
	for linux-mtd@lists.infradead.org; Mon, 16 Feb 2004 12:07:19 +0000
Date: Mon, 16 Feb 2004 13:06:47 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Florian Schirmer <jolt@tuxbox.org>
Message-ID: <20040216120647.GA7202@wohnheim.fh-wedel.de>
References: <20040212195532.38851.qmail@web20728.mail.yahoo.com>
	<200402130838.06005.jolt@tuxbox.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200402130838.06005.jolt@tuxbox.org>
cc: Shawn Jin <shawnxtech@yahoo.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2: No space left on a blank mtd device?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 13 February 2004 08:38:04 +0100, Florian Schirmer wrote:
> 
> > Is it mandatory to make a 'blank' JFFS2 filesystem image even for a blank
> > mtd device?
> 
> jffs2 will refuse to mount unless at least one jffs2 was found on the device. 
> Thats the reason why you can't mount an empty device.

...at least one jffs2 erase block was found...

> Just use eraseall -j <mtddevice>
> 
> It will create a dummy inode so you can mount the device.

No it won't, but jffs2 will happily mount an empty device.  *Any* data
on the device and it has to find at least one jffs2 erase block, but
empty is fine.

Jörn

-- 
Everything should be made as simple as possible, but not simpler.
-- Albert Einstein
