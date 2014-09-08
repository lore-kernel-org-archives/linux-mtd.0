Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XR3gr-0007cR-48
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 18:29:25 +0000
Date: Mon, 8 Sep 2014 15:27:50 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 2/3] UBI: block: Add support for the UBI_VOLUME_UPDATED
 notification
Message-ID: <20140908182750.GA9222@arch.hh.imgtec.org>
References: <1409348550-27768-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1409348550-27768-3-git-send-email-ezequiel.garcia@free-electrons.com>
 <1410173657.10764.148.camel@sauron.fi.intel.com>
 <20140908111832.GA1676@arch.hh.imgtec.org>
 <1410180460.10764.163.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1410180460.10764.163.camel@sauron.fi.intel.com>
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

On 08 Sep 03:47 PM, Artem Bityutskiy wrote:
> On Mon, 2014-09-08 at 08:18 -0300, Ezequiel Garcia wrote:
> > Regarding -stable, I think it's worth to pull the whole series.
> 
> I've checked and the patches do not apply to 3.16 with many conflicts. 
> Are you enthusiastic enough to try this and fined out the missing
> dependencies?
> 
> The we could add the "Cc: stable@vger.kernel.org # v3.16+" tags, and
> also mentioned the commits we depend on in the commit messages.
> 
> At this point I pushed your patches to the master branch. If you are
> going to check the stable story, please, use this branch.
> 

Sure, I'll prepare the list of commits and let you know.

Meanwhile, it would be very useful to have someone test these patches.

Rafał, do you think you can do some testing? It would be nice to check these
fixes are correct, and maybe you can pick them for OpenWRT.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
