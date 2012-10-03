Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TJKRV-0004pY-5M
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2012 08:36:34 +0000
Date: Wed, 3 Oct 2012 10:36:25 +0200
From: Richard Weinberger <richard@nod.at>
To: artem.bityutskiy@linux.intel.com
Subject: Re: UBI: Fastmap request for inclusion (v19)
Message-ID: <20121003103625.0bbff63c@spider.haslach.nod.at>
In-Reply-To: <1349252745.2017.120.camel@sauron.fi.intel.com>
References: <1348674710-102885-1-git-send-email-richard@nod.at>
 <1349252745.2017.120.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Wed, 03 Oct 2012 11:25:45 +0300
schrieb Artem Bityutskiy <artem.bityutskiy@linux.intel.com>:

> On Wed, 2012-09-26 at 17:51 +0200, Richard Weinberger wrote:
> > UBI Fastmap is an optional feature which stores the physical to
> > logical eraseblock relations in a checkpoint (called fastmap) to
> > reduce the initialization time of UBI. The current init time of UBI
> > is proportional to the number of physical erase blocks on the FLASH
> > device. With fastmap enabled the scan time is limited to a fixed
> > number of blocks.
> 
> Aiaiai complains and linux-next build fails :-( Last time I forgot to
> enable the fastmap kbuild option so aiaiai checked with that option
> disabled. Now I enabled it with a simple hack (default n -> default y)
> and here are aiaiai's complaints - there is a build failure for
> ARCH=i386.

Build fix for linux-next is on the way into your inbox.
I'm currently looking at the aiaiai output.

Thanks,
//richard
