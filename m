Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P3sYA-0007i7-2K
	for linux-mtd@lists.infradead.org; Thu, 07 Oct 2010 15:38:30 +0000
In-Reply-To: <20101006210036.92C229D401B@zog.reactivated.net>
References: <20101006210036.92C229D401B@zog.reactivated.net>
Subject: Re: [doesn't work] JFFS2: Dynamically choose inocache hash size
To: Daniel Drake <dsd@laptop.org>
Message-ID: <OFB9367F81.DD135AF9-ONC12577B5.00550D41-C12577B5.00557990@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 7 Oct 2010 17:33:36 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> I'm trying to upstream an old OLPC patch which greatly speeds up mounting
> of large jffs2 volumes.
> Took a stab at a suggestion from David (shown here) but it crashes badly.
> Causes lots of WARNINGs to be triggered from __mark_inode_dirty.

Does #define INOCACHE_HASHSIZE <something bigger> work?

if so I would guess something is using inocache_hashsize before
it is initialized.

Perhaps it is time to up INOCACHE_HASHSIZE to 256 or 512?

     Jocke
