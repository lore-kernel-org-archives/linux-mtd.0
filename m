Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oy3Vi-0002Sx-5s
	for linux-mtd@lists.infradead.org; Tue, 21 Sep 2010 14:07:54 +0000
Received: by wwb24 with SMTP id 24so5782669wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Sep 2010 07:07:53 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: dedekind1@gmail.com
Subject: Re: latest MTD-utils
References: <AANLkTin+Y2YD3w4MfdTmQkRyB_UZD8pY51ci4pTQHacB@mail.gmail.com>
	<1285053950.7512.5.camel@localhost>
	<871v8n2osc.fsf@macbook.be.48ers.dk>
	<1285077063.7512.120.camel@localhost>
	<1285077268.7512.121.camel@localhost>
Date: Tue, 21 Sep 2010 16:07:40 +0200
In-Reply-To: <1285077268.7512.121.camel@localhost> (Artem Bityutskiy's message
	of "Tue, 21 Sep 2010 16:54:28 +0300")
Message-ID: <87sk131977.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org, twebb <taliaferro62@gmail.com>,
	David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Artem" == Artem Bityutskiy <dedekind1@gmail.com> writes:

Hi,

 Artem> Peter, why would not you make a make tarball target, BTW? Sorry,
 Artem> may be you explained, but I forgot.

You mean why don't I just checkout from git and make a tarball myself?

Tarballs are pretty much the standard for source releases, and
source-based metadistributions (like Buildroot that I maintain) normally
are optimized for tarballs rather than semi-random git snapshots
(E.G. mirroring, automatic handling, ..).

And then there's the issue about people checking the ftp and not
noticing that there's actually a new stable release out instead of the
old 1.3.1

-- 
Bye, Peter Korsgaard
