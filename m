Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FPIOp-0006OG-IF
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 07:06:48 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060331115605.GI14713@wohnheim.fh-wedel.de>
References: <442CE217.8080103@yandex.ru> <442CE2DC.7020505@yandex.ru>
	<20060331092715.GC11367@wohnheim.fh-wedel.de>
	<442CF82B.5060904@yandex.ru>
	<20060331094050.GB14713@wohnheim.fh-wedel.de>
	<1143799209.3579.74.camel@sauron.oktetlabs.ru>
	<20060331100709.GD14713@wohnheim.fh-wedel.de>
	<1143800324.3579.87.camel@sauron.oktetlabs.ru>
	<20060331114049.GH14713@wohnheim.fh-wedel.de>
	<442D16BE.8010509@yandex.ru>
	<20060331115605.GI14713@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Fri, 31 Mar 2006 16:06:10 +0400
Message-Id: <1143806770.3579.99.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alexander Belyakov <alexander.belyakov@intel.com>,
	Vitaly Wool <vwool@ru.mvista.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Artem B. Bityutskiy" <dedekind@yandex.ru>
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

On Fri, 2006-03-31 at 13:56 +0200, Jörn Engel wrote:
> Why?  It is not as if we couldn't count all the features that are
> currently used and make sense.  And in the future, the number of sane
> features will still be fairly low.  All we have to do is tell people
> trying to add "can_do_my_crap" that we don't want such crap in the
> kernel.
> 
> Note the "and make sense" part in the second sentence. ;)

Please define the notion of "feature".

If you call "can mark obsolete" a feature, then you assume that feature
may be application-specific. This really does not make sens to add this
to MTD. Application-specific stuff must be in only application.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
