Received: from www84.your-server.de ([213.133.104.84])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Or3fR-0007zT-28
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 06:53:01 +0000
Subject: Re: [PATCH] Add quick erase format option
From: Stefani Seibold <stefani@seibold.net>
To: dedekind1@gmail.com
In-Reply-To: <1283302043.2018.92.camel@brekeke>
References: <1281342353-18180-1-git-send-email-stefani@seibold.net>
	<1281343038.12908.25.camel@localhost>
	<1281343974.18398.13.camel@wall-e.seibold.net>
	<1281353344.2332.8.camel@brekeke>
	<1281362069.20181.16.camel@wall-e.seibold.net>
	<1283081435.2131.24.camel@brekeke>
	<1283236978.6083.28.camel@wall-e.seibold.net>
	<1283302043.2018.92.camel@brekeke>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Thu, 02 Sep 2010 08:53:12 +0200
Message-ID: <1283410392.6920.36.camel@wall-e.seibold.net>
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

Am Mittwoch, den 01.09.2010, 03:47 +0300 schrieb Artem Bityutskiy:
> Stefani,
> 
> you have strong points, but I'm still not entirely convinced.
> 
> On Tue, 2010-08-31 at 08:42 +0200, Stefani Seibold wrote:
> > > I would like to change the option name so that it would reflect the
> > > exact use-case we are creating it for: wiped out flash. So I'd be
> > > happier with something like --pristine-flash.
> > 
> > "Pristine" is not a word which non native speaker have in its
> > vocabulary.
> 
> Agree, not very simple word, when I met it in JFFS2 sources, I looked it
> up in the dictionary :-)
> 

> Also, your use-case is new/virgin/pristine/whatever NOR chips, which are
> guaranteed to be erased, and I wanted to use option name which reflects
> your use-case.
> 
> How about:
> 
> --virgin
> --factory
> --brand-new
> --all-erased
> 
> Or  :-)

--do-not-use-me is the best. But more seriously i think we should it
split it into two options. --all-erased and --check-erased. The first
assumes that all PEB are erased, while the second do the check if the
PEB is erased and if not it will be erased.

So we can handle NAND's, which have a fast erase, and NOR's  which are
very slow. With this we are able to pick the best option for the
manufacturing.

- Stefani
