Received: from fgwmail7.fujitsu.co.jp ([192.51.44.37])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NaeGo-0004zk-PT
	for linux-mtd@lists.infradead.org; Thu, 28 Jan 2010 23:59:35 +0000
Received: from m5.gw.fujitsu.co.jp ([10.0.50.75])
	by fgwmail7.fujitsu.co.jp (Fujitsu Gateway) with ESMTP id
	o0SNxPMh010603 for <linux-mtd@lists.infradead.org> (envelope-from
	kamezawa.hiroyu@jp.fujitsu.com); Fri, 29 Jan 2010 08:59:25 +0900
Received: from smail (m5 [127.0.0.1])
	by outgoing.m5.gw.fujitsu.co.jp (Postfix) with ESMTP id 3DB6345DE4F
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Jan 2010 08:59:25 +0900 (JST)
Received: from s5.gw.fujitsu.co.jp (s5.gw.fujitsu.co.jp [10.0.50.95])
	by m5.gw.fujitsu.co.jp (Postfix) with ESMTP id 1B78645DE53
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Jan 2010 08:59:25 +0900 (JST)
Received: from s5.gw.fujitsu.co.jp (localhost.localdomain [127.0.0.1])
	by s5.gw.fujitsu.co.jp (Postfix) with ESMTP id F09221DB8040
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Jan 2010 08:59:24 +0900 (JST)
Received: from m107.s.css.fujitsu.com (m107.s.css.fujitsu.com [10.249.87.107])
	by s5.gw.fujitsu.co.jp (Postfix) with ESMTP id A4BF8E18001
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Jan 2010 08:59:24 +0900 (JST)
Date: Fri, 29 Jan 2010 08:56:02 +0900
From: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
To: Ben Hutchings <bhutchings@solarflare.com>
Subject: Re: [PATCHv2 0/7] mtd: Dynamic allocation of device numbers
Message-Id: <20100129085602.19cbf5e1.kamezawa.hiroyu@jp.fujitsu.com>
In-Reply-To: <1264695638.2783.3.camel@achroite.uk.solarflarecom.com>
References: <1263337693.3011.14.camel@achroite.uk.solarflarecom.com>
	<1264695141.1973.148.camel@localhost>
	<1264695638.2783.3.camel@achroite.uk.solarflarecom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-net-drivers@solarflare.com,
	David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 28 Jan 2010 16:20:38 +0000
Ben Hutchings <bhutchings@solarflare.com> wrote:

> On Thu, 2010-01-28 at 18:12 +0200, Artem Bityutskiy wrote:
> [...]
> > When I apply your patches and compile, I get:
> > 
> > make[2]: `scripts/unifdef' is up to date.
> >   Building modules, stage 2.
> > Kernel: arch/x86/boot/bzImage is ready  (#4)
> >   MODPOST 150 modules
> > ERROR: "idr_get_next" [drivers/mtd/mtd.ko] undefined!
> > make[1]: *** [__modpost] Error 1
> > make: *** [modules] Error 2
> > 
> > Indeed, it is not exported.
> 
> This looks like an oversight from when idr_get_next() was introduced.
> Is there any reason not to export it?  If not, I'll add that to the
> patch series.
> 

Ah, sorry. plz add export.

Regards,
-Kame

> Ben.
> 
> -- 
> Ben Hutchings, Senior Software Engineer, Solarflare Communications
> Not speaking for my employer; that's the marketing department's job.
> They asked us to note that Solarflare product names are trademarked.
> 
> 
