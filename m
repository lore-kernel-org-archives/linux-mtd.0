Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cyBPu-0005db-GX
 for linux-mtd@lists.infradead.org; Wed, 12 Apr 2017 06:06:13 +0000
Date: Wed, 12 Apr 2017 08:05:34 +0200
From: Oleksij Rempel <ore@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Cc: Christoph Hellwig <hch@infradead.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>, dedekind1@gmail.com,
 adrian.hunter@intel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 kernel@pengutronix.de
Subject: Re: [PATCH v2 2/3] fs: ubifs: update i_version on inode changes
Message-ID: <20170412060534.meohif5djev7johp@pengutronix.de>
References: <20170411095055.26328-1-o.rempel@pengutronix.de>
 <20170411095055.26328-3-o.rempel@pengutronix.de>
 <20170411160530.GA25234@infradead.org>
 <d1641500-dda5-d317-49f6-6b1be734edf4@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1641500-dda5-d317-49f6-6b1be734edf4@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 11, 2017 at 11:13:24PM +0200, Richard Weinberger wrote:
> Am 11.04.2017 um 18:05 schrieb Christoph Hellwig:
> > On Tue, Apr 11, 2017 at 11:50:54AM +0200, Oleksij Rempel wrote:
> >> increment i_version to notify security/IMA about changes
> >> made in inode.
> >>
> >> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > 
> > And how is this stored on disk?
> > 
> 
> Hehe, I was about to ask the same question. :-)

No. it is not stored to fs.
Heh, the same question i asked my self. On linux-ima-user i found
this post (2009-07-23):
https://sourceforge.net/p/linux-ima/mailman/message/23152923/
---
When an inode entry is removed from dcache, the corresponding iint entry
is removed from the radix tree. Unmounting an fs will cause the inodes,
and by extension iint's, to be freed.  When the fs is remounted, any
file accessed will result in allocating a new iint structure with the
i_version set to 0.
---

The code seems to confirm it. So i assumed that IMA don't care if
i_version is stored to disk or not. And i_version is the only way
to notify IMA about inode changes.
Since IMA documentation explecitley set i_version as reqieremt, so this
option was provided as well.

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
