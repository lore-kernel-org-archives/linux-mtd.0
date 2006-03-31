Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FPIEd-0005h0-DP
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 06:56:33 -0500
Date: Fri, 31 Mar 2006 13:56:05 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Message-ID: <20060331115605.GI14713@wohnheim.fh-wedel.de>
References: <442CE217.8080103@yandex.ru> <442CE2DC.7020505@yandex.ru>
	<20060331092715.GC11367@wohnheim.fh-wedel.de>
	<442CF82B.5060904@yandex.ru>
	<20060331094050.GB14713@wohnheim.fh-wedel.de>
	<1143799209.3579.74.camel@sauron.oktetlabs.ru>
	<20060331100709.GD14713@wohnheim.fh-wedel.de>
	<1143800324.3579.87.camel@sauron.oktetlabs.ru>
	<20060331114049.GH14713@wohnheim.fh-wedel.de>
	<442D16BE.8010509@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <442D16BE.8010509@yandex.ru>
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

On Fri, 31 March 2006 15:47:10 +0400, Artem B. Bityutskiy wrote:
>
> This piece of code indeed looks better. But nevertheless, MTD does not 
> have to please JFFS2. It is difficult to foresee all "features" MTD 
> users can conceive and add corresponding flags. Tomorrow a "XYZ" file 
> system will apear and will want a "can_do_my_crap" feature, and you'll 
> have to add this to mtd_info. This is really a bad idea.

Why?  It is not as if we couldn't count all the features that are
currently used and make sense.  And in the future, the number of sane
features will still be fairly low.  All we have to do is tell people
trying to add "can_do_my_crap" that we don't want such crap in the
kernel.

Note the "and make sense" part in the second sentence. ;)

Jörn

-- 
The grand essentials of happiness are: something to do, something to
love, and something to hope for.
-- Allan K. Chalmers
