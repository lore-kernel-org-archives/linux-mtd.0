Received: from co202.xi-lite.net ([149.6.83.202])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RSu4b-0005Bh-Q9
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2011 17:23:59 +0000
Message-ID: <4ECBDAA0.6010105@parrot.com>
Date: Tue, 22 Nov 2011 18:23:44 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/3] Add the snappy-c compressor to lib
References: <1319978255.2126.33.camel@koala> <1319978545.2126.37.camel@koala>
 <4EBA5F7C.6000506@parrot.com> <4EBA7AC3.4080205@newsguy.com>
 <1321565780.2272.12.camel@koala> <20111122163749.GH6624@sirena.org.uk>
In-Reply-To: <20111122163749.GH6624@sirena.org.uk>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: Mike Dunn <mikedunn@newsguy.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mark Brown a écrit :
> On Thu, Nov 17, 2011 at 11:36:17PM +0200, Artem Bityutskiy wrote:
> 
>> Yeah, of course it would be interesting to see. If snappy is a win-win
>> on ARM, we should merge it.
> 
> It might be interesting to use it for the compressed cache type in regmap
> as well.
> 
For info we did some bench mark on omap3 (cortexa-8) for decompressing
hibernation image.
And snappy was a lose-lose against lzf (bigger compressed result, slower to
decompress) :

algo : compressed size , time to decompress
snappy (16 and 32 bits unaligned access done by hardware) : 45Mo, 3.5 s
snappy (unaligned access done by software) : 45Mo, 2.50 s
lzf (unalign access done by softare) : 40Mo, 2.35 s


Of course this is against one pattern (hibernation image) and benchmark should
be done on other patterns.

Matthieu
