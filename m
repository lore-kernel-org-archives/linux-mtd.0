Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FPFug-0002Ns-Ac
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 04:27:33 -0500
Date: Fri, 31 Mar 2006 11:27:15 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Message-ID: <20060331092715.GC11367@wohnheim.fh-wedel.de>
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
	<442B9FA5.9070901@ru.mvista.com> <442BF839.8060402@intel.com>
	<1143733184.3579.47.camel@sauron.oktetlabs.ru>
	<442CD50A.6070006@intel.com> <442CE217.8080103@yandex.ru>
	<442CE2DC.7020505@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <442CE2DC.7020505@yandex.ru>
Cc: Alexander Belyakov <alexander.belyakov@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>,
	Vitaly Wool <vwool@ru.mvista.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 31 March 2006 12:05:48 +0400, Artem B. Bityutskiy wrote:
> Artem B. Bityutskiy wrote:
> >Good question. I think you could report this is a striped device 
> >(introducing an MTD_STRIPED option). Also you may provide a 
> >stripe_get_info(struct mtd_info *mtd) function which will return a 
> >struct stripe_info object describing this striped device, including the 
> >components it consists of.
> Err, and I believe you *have to* report mtd type as MTD_STRIPED.

URGH!

The current mess that makes up mtd->type and mtd->flags needs to be
sanitized anyway.  Instead of being MTD_NAND, MTD_NOR or MTD_STRIPED,
it should tell the user _how_ to treat the device, not _what_ it is.
Basically, whereever a user (jffs2 basically) has
	if (mtd->type == MTD_FOO)
		setup_bar;
it should actually do
	if (mtd->flags == MTD_NEEDS_BAR)
		setup_bar;

Quite likely there won't be many flags left after the cleanup is done.
Most of them should simple be erase_size and write_size (page_size or
ecc_size currently), not flags.

Jörn

-- 
You can't tell where a program is going to spend its time. Bottlenecks
occur in surprising places, so don't try to second guess and put in a
speed hack until you've proven that's where the bottleneck is.
-- Rob Pike
