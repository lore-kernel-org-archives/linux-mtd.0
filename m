Received: from mo-p05-ob.rzone.de ([81.169.146.180])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PcFSq-0002Ex-54
	for linux-mtd@lists.infradead.org; Mon, 10 Jan 2011 10:59:09 +0000
From: Stefan Roese <sr@denx.de>
To: dedekind1@gmail.com
Subject: Re: [PATCH] physmap: fix mtdconcat support if physmap/mtdconcat were
	compiled as modules
Date: Mon, 10 Jan 2011 11:58:29 +0100
References: <1294192813-23549-1-git-send-email-dbaryshkov@gmail.com>
	<1294218473.2179.16.camel@koala>
In-Reply-To: <1294218473.2179.16.camel@koala>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201101101158.29870.sr@denx.de>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 05 January 2011 10:07:53 Artem Bityutskiy wrote:
> On Wed, 2011-01-05 at 05:00 +0300, Dmitry Eremin-Solenikov wrote:
> > physmap/physmap_of contained compile-time check for mtd concatenation.
> > However thos modules did not consider that mtd concatenation can be
> > built as modules. Fix physmap/physmap_of to also support
> > CONFIG_MTD_CONCAT=m

<snip>

> Can we do something else to avoid these complex ifdefs? I'd vote for
> making mtdconcat integral part of mtd core and just always have it
> built-in - remove the Kconfig option and all the ifdefs all over the
> place. Indeed, this is tiny piece of code, I believe this micro-modules
> make little sense nowadays.

Yes, I like this suggestion.

Dmitry, can you cook up such a patch? Otherwise I'll put it on my to-do 
list...
 
> The same for mtdparts - but this is a different story.

Yep.

Cheers,
Stefan
