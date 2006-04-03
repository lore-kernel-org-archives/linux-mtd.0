Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FQOlb-0004Od-Et
	for linux-mtd@lists.infradead.org; Mon, 03 Apr 2006 09:07:00 -0400
Date: Mon, 3 Apr 2006 15:06:19 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Nicolas Pitre <nico@cam.org>
Message-ID: <20060403130619.GA7659@wohnheim.fh-wedel.de>
References: <1143799209.3579.74.camel@sauron.oktetlabs.ru>
	<20060331100709.GD14713@wohnheim.fh-wedel.de>
	<1143800324.3579.87.camel@sauron.oktetlabs.ru>
	<20060331114049.GH14713@wohnheim.fh-wedel.de>
	<1143806110.3579.90.camel@sauron.oktetlabs.ru>
	<20060331115904.GJ14713@wohnheim.fh-wedel.de>
	<1143807072.3579.105.camel@sauron.oktetlabs.ru>
	<20060331122055.GK14713@wohnheim.fh-wedel.de>
	<442D207D.9030903@yandex.ru>
	<Pine.LNX.4.64.0603311221070.14923@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.64.0603311221070.14923@localhost.localdomain>
Cc: Alexander Belyakov <alexander.belyakov@intel.com>,
	Vitaly Wool <vwool@ru.mvista.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Artem B. Bityutskiy" <dedekind@yandex.ru>
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 31 March 2006 12:22:50 -0500, Nicolas Pitre wrote:
> 
> You are right here.  This is why MTD drivers should export _flash_ 
> features rather than filesystem requirements.  And it is up to 
> filesystem code to cope with the (lack of) certain flash features not 
> the other way around.

As long as noone is being a fundamentalist zealot, we all agree here.

My fine point of disagreement is that I stress "should" above
everything else.  Quite a few things can and should be improved about
mtd and its users.  If everything were perfect, it would all be about
flash features.  Until then, it may make sense to _temporarily_ hold
some filesystem features.  While this is undeniably a bad thing in its
own, it can allow you to get rid of bigger warts.

Once the bigger warts are gone, we can aim for perfect. ;)

As a step in that direction, please take a look at this patchset:
http://wh.fh-wedel.de/~joern/mtd_type.tgzwh.fh-wedel.de/~joern/mtd_type.tgz

It removes all types except MTD_ABSENT and all flags but MTD_OOB.  As
a replacement, three new flags are introduced.  So now we're at a
total of 4 flags (previously 9) and two types (previously 9).

Jörn

-- 
...one more straw can't possibly matter...
-- Kirby Bakken
