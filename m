Received: from [213.79.90.228] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MdWTz-0007hJ-H7
	for linux-mtd@lists.infradead.org; Tue, 18 Aug 2009 21:44:47 +0000
Date: Wed, 19 Aug 2009 01:44:40 +0400
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v2 0/6] Device table matching for SPI subsystem
Message-ID: <20090818214440.GA21391@oksana.dev.rtsoft.ru>
References: <20090731003957.GA23982@oksana.dev.rtsoft.ru>
	<1249889723.19638.13.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1249889723.19638.13.camel@localhost>
Cc: Ben Dooks <ben@fluff.org>, David Brownell <dbrownell@users.sourceforge.net>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-kernel@vger.kernel.org, lm-sensors@lm-sensors.org,
	Grant Likely <grant.likely@secretlab.ca>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Jean Delvare <khali@linux-fr.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: avorontsov@ru.mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 10, 2009 at 10:35:23AM +0300, Artem Bityutskiy wrote:
> On Fri, 2009-07-31 at 04:39 +0400, Anton Vorontsov wrote:
> > Andrew,
> > 
> > This new patch set overwrites following patches:
> > 
> >   hwmon-lm70-convert-to-device-table-matching.patch
> >   hwmon-adxx-convert-to-device-table-matching.patch
> >   spi-merge-probe-and-probe_id-callbacks.patch
> >   spi-prefix-modalias-with-spi.patch
> >   of-remove-stmm25p40-alias.patch
> >   mtd-m25p80-convert-to-device-table-matching.patch
> >   spi-add-support-for-device-table-matching.patch
> 
> Are you going to send v3 and address David's comments?

No v3, but I'm going to address David's comments in a follow up
patch set where I'll change the probing code anyway.

> Do you want some of these patches to go via the MTD tree or
> they better go as a series via some other tree?

Um.. The MTD patches depend on SPI subsystem changes... If
David and Andrew are OK with SPI patches going through MTD tree,
then I'm fine with it as well.

Thanks,

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
