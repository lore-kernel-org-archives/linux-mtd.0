Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBUQs-0002FR-VJ
 for linux-mtd@lists.infradead.org; Thu, 18 May 2017 23:02:12 +0000
Date: Thu, 18 May 2017 20:01:40 -0300
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 00/53] Get rid of Docbook
Message-ID: <20170518200140.11982b12@vento.lan>
In-Reply-To: <20170518112608.4f355068@lwn.net>
References: <cover.1494935649.git.mchehab@s-opensource.com>
 <20170518112608.4f355068@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Em Thu, 18 May 2017 11:26:08 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Tue, 16 May 2017 09:15:52 -0300
> Mauro Carvalho Chehab <mchehab@s-opensource.com> wrote:
> 
> > This patch series convert the remaining DocBooks to ReST.
> 
> Gotta love this:
> 
> >  124 files changed, 7469 insertions(+), 10511 deletions(-)

Heh, yeah, lots of stuff changed :-)

> I've just pulled the whole set from your experimental.git repo.  There are
> certainly a few rough edges, but that means it will fit into the rest of
> the docs just fine :)

:-)

> There are a few loose ends, but, rather than complaining about them, I'll
> just see what's to be done about them.

Yeah, a change like that will likely have a few loose ends. One of them
is with regards to Documentation/kernel-doc-nano-HOWTO.txt: we may
think on removing it soon, as I guess the important stuff there is
already under Documentation/doc-guide.

> Thanks for pushing this through, this is a nice milestone.

Anytime!

Btw, it seems I didn't have much to do this week[1]... I produced a 
changeset series with 90+ patches that standardize the 
Documentation/*.txt files, making them parseable by Sphinx. I
opted to keep the files where they are, and don't update
anything else but the text format, as I'm pretty sure that
some of the files there are really outdated.

The rationale for doing that is that it would minimize the
risk of someone add a new text document under Documentation
using some other random format, as at least the documents
on the main documentation dir will all have the same format.

I'll be mailbombing them soon (perhaps splitting into 3
series with ~30 patches each).

[1] The reality is that I moved to another place, and didn't
have time yet to unpack the machines and media test boards yet...
So, I decided to have some fun with docs ;)


Thanks,
Mauro
