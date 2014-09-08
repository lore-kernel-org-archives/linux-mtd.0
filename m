Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQwzY-0008Uk-B5
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 11:20:16 +0000
Date: Mon, 8 Sep 2014 08:18:32 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 2/3] UBI: block: Add support for the UBI_VOLUME_UPDATED
 notification
Message-ID: <20140908111832.GA1676@arch.hh.imgtec.org>
References: <1409348550-27768-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1409348550-27768-3-git-send-email-ezequiel.garcia@free-electrons.com>
 <1410173657.10764.148.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1410173657.10764.148.camel@sauron.fi.intel.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08 Sep 01:54 PM, Artem Bityutskiy wrote:
> On Fri, 2014-08-29 at 18:42 -0300, Ezequiel Garcia wrote:
> > Static volumes can change its 'used_bytes' when they get updated,
> > and so the block interface must listen to the UBI_VOLUME_UPDATED
> > notification to resize the block device accordingly.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> 
> Looks like a good fix. If you want this in stable, you please, let me
> know and also make sure you actually tested it and verified that block
> device size actually gets changed.
> 

Yes, gave this series a good test, with gluebi and ubiblock enabled,
updating/resizing a volume and then reading back the contents from the
ubi0_0, ubiblock0_0 and mtdX (gluebi) devices.

However, it would be awesome if we could get someone else to test this
and report.

Regarding -stable, I think it's worth to pull the whole series.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
