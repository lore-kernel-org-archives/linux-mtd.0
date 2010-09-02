Received: from www84.your-server.de ([213.133.104.84])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Or8Bf-0001Ce-Sk
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 11:42:36 +0000
Subject: Re: [PATCH] Add quick erase format option
From: Stefani Seibold <stefani@seibold.net>
To: dedekind1@gmail.com
In-Reply-To: <1283425100.3085.5.camel@brekeke>
References: <1281342353-18180-1-git-send-email-stefani@seibold.net>
	<1281343038.12908.25.camel@localhost>
	<1281343974.18398.13.camel@wall-e.seibold.net>
	<1281353344.2332.8.camel@brekeke>
	<1281362069.20181.16.camel@wall-e.seibold.net>
	<1283081435.2131.24.camel@brekeke>
	<1283236978.6083.28.camel@wall-e.seibold.net>
	<1283302043.2018.92.camel@brekeke>
	<1283410392.6920.36.camel@wall-e.seibold.net>
	<1283425100.3085.5.camel@brekeke>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Thu, 02 Sep 2010 13:42:43 +0200
Message-ID: <1283427763.9613.0.camel@wall-e.seibold.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, "Enzinger,
	Robert \(EXT-Other - DE/Munich\)" <robert.enzinger.ext@nsn.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Donnerstag, den 02.09.2010, 13:58 +0300 schrieb Artem Bityutskiy:
> On Thu, 2010-09-02 at 08:53 +0200, Stefani Seibold wrote: 
> > --do-not-use-me is the best. But more seriously i think we should it
> > split it into two options. --all-erased and --check-erased. The first
> > assumes that all PEB are erased, while the second do the check if the
> > PEB is erased and if not it will be erased.
> > 
> > So we can handle NAND's, which have a fast erase, and NOR's  which are
> > very slow. With this we are able to pick the best option for the
> > manufacturing.
> 
> I am fine with checking, but what bothers me is that you check only 64
> bytes out of 128KiB - why this is enough to make sure the eraseblock is
> erased?
> 
> Probably it is ok for you, but in for general use-case this is wrong,
> even checking all 128KiB is wrong, because of the unstable bits.
> 
> What I think will make more sense is to add general option --verify or
> something like that. It would read everything the utility wrote and
> verify it is identical to what was written. Probably this can be done in
> libmtd.
> 
> Then you will be able to combine --all-erased with --verify and achieve
> what you want.
> 

Agree. I will create a patch for this in the next few days.

- Stefani
