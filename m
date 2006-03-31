Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FPGQs-0003KZ-4v
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 05:00:55 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060331094050.GB14713@wohnheim.fh-wedel.de>
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
	<442B9FA5.9070901@ru.mvista.com> <442BF839.8060402@intel.com>
	<1143733184.3579.47.camel@sauron.oktetlabs.ru>
	<442CD50A.6070006@intel.com>
	<442CE217.8080103@yandex.ru> <442CE2DC.7020505@yandex.ru>
	<20060331092715.GC11367@wohnheim.fh-wedel.de>
	<442CF82B.5060904@yandex.ru>
	<20060331094050.GB14713@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Fri, 31 Mar 2006 14:00:09 +0400
Message-Id: <1143799209.3579.74.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alexander Belyakov <alexander.belyakov@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>,
	Vitaly Wool <vwool@ru.mvista.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] MTD: Striping layer core
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-03-31 at 11:40 +0200, Jörn Engel wrote:
> On Fri, 31 March 2006 13:36:43 +0400, Artem B. Bityutskiy wrote:
> > 
> > No, mtd->type has to tell you the type of the MTD device. Ideally, this 
> > has to me the only flash-specific field in the mtd_info structure. And 
> > if users want to do some flash specific things, they have to look at 
> > mtd->type, realize what is the subsystem which handles this flash, and 
> > start working with this subsystem. For striping, this is the striping 
> > subsystem. I don't know what for mtd->flags, probably this hast to go at 
> > all.
> 
> Is this exported to userspace via mtdchar?
> 
I don't quite understand what is "this".

Ideally yes, there should be a /ubi/devices/mtd/mtdX/type file, there
you can look and realize the type of this MTD device. The contents of
this file will be generated using the mtd-type field. Userspace will be
able to realize the type of this device and look to the corresponding
place in sysfs. For example, if this is a striped device, it'll look
at /sys/devices/mtd_stripe/stripe0/ or whatever.

This is just my imagination how things should look like. So, treat this
correspondingly. May be it is better to use symlinks in sysfs to point
to the striping layer, no sure.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
