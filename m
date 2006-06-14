Received: from [2002:4519:c427:1:220:edff:fe18:5794] (helo=thunker.thunk.org)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FqiHh-0004Aa-Ey
	for linux-mtd@lists.infradead.org; Wed, 14 Jun 2006 23:12:52 -0400
Date: Wed, 14 Jun 2006 17:58:35 -0400
From: Theodore Tso <tytso@mit.edu>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Subject: Re: JFFS2/xattr problems.
Message-ID: <20060614215835.GA5983@thunk.org>
References: <1148150486.3875.251.camel@pmac.infradead.org>
	<44704CA9.8010604@ak.jp.nec.com> <448CCEC8.2080903@ak.jp.nec.com>
	<1150099418.11159.44.camel@shinybook.infradead.org>
	<448D3752.3090605@ak.jp.nec.com>
	<1150105995.8184.17.camel@pmac.infradead.org>
	<20060612180653.GA17177@wohnheim.fh-wedel.de>
	<448EBF7B.20306@kaigai.gr.jp>
	<20060613141317.GB30066@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060613141317.GB30066@wohnheim.fh-wedel.de>
Cc: KaiGai Kohei <kaigai@kaigai.gr.jp>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, KaiGai Kohei <kaigai@ak.jp.nec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 13, 2006 at 04:13:17PM +0200, Jörn Engel wrote:
> On Tue, 13 June 2006 22:36:59 +0900, KaiGai Kohei wrote:
> > 
> > >Seems you missed Ted's presentation at LCA this year.  Among the
> > >interesting bits:
> > 
> > If this presentation is public, could you tell me the URL?
> > This indication is highly suggestive for me.
> > Especially, I have not imagine yet the possibility that
> > malware uses xattr to hide itself.
> 
> I can only find the abstract:
> http://lca2006.linux.org.au/abstract.php?id=384
> 
> [ adding Ted to Cc: ]
> 
> Ted, do still have your foils and can make them available?  Kaigai-san
> is working on an xattr implementation for jffs2.

Sure, here you go (see attached)

> > >o The biggest user of Alternate Streams (less-limited versions of
> > >  xattr on Windows, Solaris, etc.) arguably is root kits.  Alternate
> > >  Streams have the advantage that tripwire etc. don't understand them
> > >  and won't look for malware there.
> > >o Some system administrators have no plans to upgrade to Solaris 9
> > >  ever, because it supports Alternate Streams.  The trouble of hidden
> > >  malware is not worth the gains.
> > >
> > >Notable was also, that Ted repeated the last two points in several
> > >variations.  Not sure if I would follow his line of thought 100%, but
> > >he does have a point.

See the article referenced in the slide, "Alternate Data Streams:
Threat or Menace?"

	http://www.awprofessional.com/articles/article.asp?p=413685

(I love the title.  "Threat or Menace?"  "Menace or Threat?"  Or, to
take a line from an old Bugs Bunny/Daffy Duck cartoon, "You got me
dead to rights, Doc.  Would you like to shoot him now or shoot him
later?"  :-)

						- Ted
