Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cyCVl-0000kx-U8
 for linux-mtd@lists.infradead.org; Wed, 12 Apr 2017 07:16:19 +0000
Date: Wed, 12 Apr 2017 09:15:51 +0200
From: Oleksij Rempel <ore@pengutronix.de>
To: Christoph Hellwig <hch@infradead.org>
Cc: Richard Weinberger <richard@nod.at>,
 Oleksij Rempel <o.rempel@pengutronix.de>, dedekind1@gmail.com,
 adrian.hunter@intel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: Re: [PATCH v2 3/3] fs: ubifs: set s_uuid in super block
Message-ID: <20170412071551.i36yj3lzilgtntdy@pengutronix.de>
References: <20170411095055.26328-1-o.rempel@pengutronix.de>
 <20170411095055.26328-4-o.rempel@pengutronix.de>
 <5d7d0f21-d87f-0835-c2f6-b6c9e07f73a8@nod.at>
 <20170412054828.GA20561@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170412054828.GA20561@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 11, 2017 at 10:48:28PM -0700, Christoph Hellwig wrote:
> On Tue, Apr 11, 2017 at 10:43:26PM +0200, Richard Weinberger wrote:
> > Artem, do you remember why UBIFS didn't set s_uuid in first place?
> 
> It's an extremely odd field - only a hand full of file systems set it
> (e.g. XFS doesn't, although according to Mimi IMA supports XFS), and
> it's never even used outside of the IMA/EVM code.
> 
> We really need a feature flag that this field is valid that IMA can
> check before adding more support for it.

It seems to be used by mm/cleancache.c
void __cleancache_init_shared_fs()

but this affects only ocfs2.

So, if some flag should be implemented, who should do it? :)
If me, what flag should be created?

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
