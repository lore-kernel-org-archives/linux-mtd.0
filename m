Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UtX10-0008HT-KC
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2013 05:51:07 +0000
Message-ID: <1372657796.22014.6.camel@sauron.fi.intel.com>
Subject: Re: [PATCH [mtd-utils]] ftl_check/ftl_format/nftldump: use existing
 mtd_swab.h header
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 01 Jul 2013 08:49:56 +0300
In-Reply-To: <1368030083-28190-1-git-send-email-vapier@gentoo.org>
References: <1368030083-28190-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-05-08 at 12:21 -0400, Mike Frysinger wrote:
> We already have a helper header for swapping bytes as needed, so cut
> the ftl tools over to that rather than re-implement things.
> 
> I don't actually have any devices with this kind of flash, so I can't
> runtime test it.  But things *look* ok to me :).
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed to mtd-utils.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
