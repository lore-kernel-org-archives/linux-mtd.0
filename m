Received: from py-out-1112.google.com ([64.233.166.179])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JnwJp-0001bJ-0Q
	for linux-mtd@lists.infradead.org; Mon, 21 Apr 2008 13:44:29 +0000
Received: by py-out-1112.google.com with SMTP id a73so2508488pye.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Apr 2008 06:44:28 -0700 (PDT)
Subject: Re: [U-Boot-Users] ubi and u-boot
From: Josh Boyer <jwboyer@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0804211533140.27984@lnxricardw.se.axis.com>
References: <20080420222237.4AE5324657@gemini.denx.de>
	<1208779508.5965.371.camel@sauron>
	<Pine.LNX.4.64.0804211533140.27984@lnxricardw.se.axis.com>
Content-Type: text/plain
Date: Mon, 21 Apr 2008 08:44:23 -0500
Message-Id: <1208785463.6654.34.camel@vader.jdub.homelinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "u-boot-users@lists.sourceforge.net" <u-boot-users@lists.sourceforge.net>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-04-21 at 15:36 +0200, Ricard Wanderlof wrote:
> On Mon, 21 Apr 2008, Artem Bityutskiy wrote:
> 
> > On Mon, 2008-04-21 at 00:22 +0200, Wolfgang Denk wrote:
> >> In message <4808DF3B.2080702@largestprime.net> you wrote:
> >>>
> >>> Wolfgang showed some interest briefly too.[1]
> >>
> >> I am definitely interested.
> >
> > What I would suggest to start with is to teach U-boot to erase flash and
> > preserve erase counters, because now it just wipes the erase counters
> > out. Also, it would be nice to teach it to flash images properly in case
> > of NAND flash.
> >
> 
> I was under the impression from past emails on the MTD list that the 
> internal meta format for UBI has changed a few times over its lifetime.
> 
> Assuming this continues, I would think this would cause problems for 
> bootloaders such as U-Boot whose flash partitions are not necessarily 
> rewritten in the case of a product upgrade - i.e. a firmware upgrade with 
> a new kernel would have a new UBI implementation and spec causing an
> older bootloader to fail to operate properly with the newer image.

I think there was only 1 time the on-flash format changed, and that was
before UBI was merged upstream.  New features can be introduced with
additional flags, however older versions should be able to ignore those.

Artem, is that right?  My memory is fuzzy here.

josh
