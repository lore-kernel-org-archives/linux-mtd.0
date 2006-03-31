Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FPGXE-0003Yx-VB
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 05:07:43 -0500
Date: Fri, 31 Mar 2006 12:07:09 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Message-ID: <20060331100709.GD14713@wohnheim.fh-wedel.de>
References: <442B9FA5.9070901@ru.mvista.com> <442BF839.8060402@intel.com>
	<1143733184.3579.47.camel@sauron.oktetlabs.ru>
	<442CD50A.6070006@intel.com> <442CE217.8080103@yandex.ru>
	<442CE2DC.7020505@yandex.ru>
	<20060331092715.GC11367@wohnheim.fh-wedel.de>
	<442CF82B.5060904@yandex.ru>
	<20060331094050.GB14713@wohnheim.fh-wedel.de>
	<1143799209.3579.74.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1143799209.3579.74.camel@sauron.oktetlabs.ru>
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

On Fri, 31 March 2006 14:00:09 +0400, Artem B. Bityutskiy wrote:
> On Fri, 2006-03-31 at 11:40 +0200, Jörn Engel wrote:
> > On Fri, 31 March 2006 13:36:43 +0400, Artem B. Bityutskiy wrote:
> > > 
> > > No, mtd->type has to tell you the type of the MTD device. Ideally, this 
> > > has to me the only flash-specific field in the mtd_info structure. And 
> > > if users want to do some flash specific things, they have to look at 
> > > mtd->type, realize what is the subsystem which handles this flash, and 
> > > start working with this subsystem. For striping, this is the striping 
> > > subsystem. I don't know what for mtd->flags, probably this hast to go at 
> > > all.
> > 
> > Is this exported to userspace via mtdchar?
> > 
> I don't quite understand what is "this".
> 
> Ideally yes...

I take it that mtd->type is not exported to userspace yet.  Which is
good, because imho it shouldn't be.  Flash should me a step towards a
standard interface, something that hard disk have had for years.
Knowing every little detail about every single flash chip bears more
harm than good.

And as far as in-kernel users are concerned, JFFS2 is the only one
that really matters.  For JFFS2, my previous statement still stand
that it should base decisions on the existence of a feature, not a
type.

You could still have flash types, but merely as aggregates of
features, nothing else.  For example, NAND flash could have
FEATURE_OOB, FEATURE_WBUF, FEATURE_ECC etc.  Which of these feature
make sense and are really needed is another matter, but you should get
the idea.

Jörn

-- 
/* Keep these two variables together */
int bar;
