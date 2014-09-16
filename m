Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTuUA-0007XT-FT
 for linux-mtd@lists.infradead.org; Tue, 16 Sep 2014 15:16:06 +0000
Message-ID: <1410880524.28850.49.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/3] UBI: block: Add support for the UBI_VOLUME_UPDATED
 notification
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Tue, 16 Sep 2014 18:15:24 +0300
In-Reply-To: <20140908182750.GA9222@arch.hh.imgtec.org>
References: <1409348550-27768-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1409348550-27768-3-git-send-email-ezequiel.garcia@free-electrons.com>
 <1410173657.10764.148.camel@sauron.fi.intel.com>
 <20140908111832.GA1676@arch.hh.imgtec.org>
 <1410180460.10764.163.camel@sauron.fi.intel.com>
 <20140908182750.GA9222@arch.hh.imgtec.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org,
 Guido =?ISO-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-09-08 at 15:27 -0300, Ezequiel Garcia wrote:
> On 08 Sep 03:47 PM, Artem Bityutskiy wrote:
> > On Mon, 2014-09-08 at 08:18 -0300, Ezequiel Garcia wrote:
> > > Regarding -stable, I think it's worth to pull the whole series.
> > 
> > I've checked and the patches do not apply to 3.16 with many conflicts. 
> > Are you enthusiastic enough to try this and fined out the missing
> > dependencies?
> > 
> > The we could add the "Cc: stable@vger.kernel.org # v3.16+" tags, and
> > also mentioned the commits we depend on in the commit messages.
> > 
> > At this point I pushed your patches to the master branch. If you are
> > going to check the stable story, please, use this branch.
> > 
> 
> Sure, I'll prepare the list of commits and let you know.

Should I wait some more or assume we won't add the stable tags and add
these patches to the 'next' branch? It is about time, I guess.

-- 
Best Regards,
Artem Bityutskiy
