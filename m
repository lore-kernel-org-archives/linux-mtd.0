Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cyCKi-0001Jy-06
 for linux-mtd@lists.infradead.org; Wed, 12 Apr 2017 07:04:53 +0000
Date: Wed, 12 Apr 2017 09:04:22 +0200
From: Oleksij Rempel <ore@pengutronix.de>
To: Christoph Hellwig <hch@infradead.org>
Cc: Richard Weinberger <richard@nod.at>,
 Oleksij Rempel <o.rempel@pengutronix.de>, dedekind1@gmail.com,
 adrian.hunter@intel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 kernel@pengutronix.de
Subject: Re: [PATCH v2 2/3] fs: ubifs: update i_version on inode changes
Message-ID: <20170412070422.7yxnvchmhzwe6i7d@pengutronix.de>
References: <20170411095055.26328-1-o.rempel@pengutronix.de>
 <20170411095055.26328-3-o.rempel@pengutronix.de>
 <20170411160530.GA25234@infradead.org>
 <d1641500-dda5-d317-49f6-6b1be734edf4@nod.at>
 <20170412060534.meohif5djev7johp@pengutronix.de>
 <20170412060847.GA23545@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170412060847.GA23545@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 11, 2017 at 11:08:47PM -0700, Christoph Hellwig wrote:
> On Wed, Apr 12, 2017 at 08:05:34AM +0200, Oleksij Rempel wrote:
> > The code seems to confirm it. So i assumed that IMA don't care if
> > i_version is stored to disk or not. And i_version is the only way
> > to notify IMA about inode changes.
> > Since IMA documentation explecitley set i_version as reqieremt, so this
> > option was provided as well.
> 
> Maybe IMA doesn't care, but if you set MS_I_VERSION the fs does give
> a guarantee.  Sp NAK on this patch as-is.

Ok, it was an expekted NACK :)
Suddenly right now i don't have good ide to solve it. IMA just won't to
know if some runtime changes was made to FS. Currently i can image
fallowing variants:
- rework IMA
- add MS_I_TEMP_VERSION and keep i_version using for it.
- add new variable for external use only. For example: ima_rt_i_version,
  or some thing like this.

Other ideas?

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
