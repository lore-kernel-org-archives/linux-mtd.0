Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FPId1-0006vL-Ba
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 07:21:28 -0500
Date: Fri, 31 Mar 2006 14:20:55 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Message-ID: <20060331122055.GK14713@wohnheim.fh-wedel.de>
References: <20060331092715.GC11367@wohnheim.fh-wedel.de>
	<442CF82B.5060904@yandex.ru>
	<20060331094050.GB14713@wohnheim.fh-wedel.de>
	<1143799209.3579.74.camel@sauron.oktetlabs.ru>
	<20060331100709.GD14713@wohnheim.fh-wedel.de>
	<1143800324.3579.87.camel@sauron.oktetlabs.ru>
	<20060331114049.GH14713@wohnheim.fh-wedel.de>
	<1143806110.3579.90.camel@sauron.oktetlabs.ru>
	<20060331115904.GJ14713@wohnheim.fh-wedel.de>
	<1143807072.3579.105.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1143807072.3579.105.camel@sauron.oktetlabs.ru>
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

On Fri, 31 March 2006 16:11:12 +0400, Artem B. Bityutskiy wrote:
> On Fri, 2006-03-31 at 13:59 +0200, Jörn Engel wrote:
> > Whether the flash can mark things obsolete is a flash feature.  At
> > least this is based on a flash feature.  So maybe we should rename it
> > to MTD_CAN_FLIP_SINGLE_BITS or similar and then have
> 
> This is better then "can mark obsolete". At lease this does not depend
> on application. But I still think that the number of features like is
> unpredictable and large. If the number of bits in mtd->flags is not
> enough, will you introduce mtd->flags1? This is not very generic
> approach.

I believe the number of sane features is not very high.  Right now,
jffs2 is de-facto the only thing to worry about.  And last time I
checked (two weeks ago), there were not many different decisions based
on flash type.

It was just notable that decisions were based on (type==THIS ||
(type==that && flags==bla) || (type==whatnot).  And I'd like to get
rid of such code.

If you send a new filesystem to be merged and that one requires 52
sane new features, you may be right.

Jörn

-- 
The grand essentials of happiness are: something to do, something to
love, and something to hope for.
-- Allan K. Chalmers
