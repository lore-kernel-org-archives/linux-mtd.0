Received: from cassiel.sirena.org.uk ([80.68.93.111])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RStMF-00070A-KK
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2011 16:38:08 +0000
Date: Tue, 22 Nov 2011 16:37:49 +0000
From: Mark Brown <broonie@opensource.wolfsonmicro.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/3] Add the snappy-c compressor to lib
Message-ID: <20111122163749.GH6624@sirena.org.uk>
References: <1319978255.2126.33.camel@koala> <1319978545.2126.37.camel@koala>
 <4EBA5F7C.6000506@parrot.com> <4EBA7AC3.4080205@newsguy.com>
 <1321565780.2272.12.camel@koala>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1321565780.2272.12.camel@koala>
Cc: linux-mtd@lists.infradead.org, Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 17, 2011 at 11:36:17PM +0200, Artem Bityutskiy wrote:

> Yeah, of course it would be interesting to see. If snappy is a win-win
> on ARM, we should merge it.

It might be interesting to use it for the compressed cache type in regmap
as well.
