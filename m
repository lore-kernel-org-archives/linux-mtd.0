From: gary@mlbassoc.com (Gary Thomas)
Date: 17 Feb 2003 14:46:23 -0700
Subject: Change in RedBoot partition scanning
In-Reply-To: <1045518190.17498.32.camel@passion.cambridge.redhat.com>
References: <1045517920.18487.822.camel@hermes.chez-thomas.org>
 <1045518190.17498.32.camel@passion.cambridge.redhat.com>
Message-ID: <1045518384.18487.839.camel@hermes.chez-thomas.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, 2003-02-17 at 14:43, David Woodhouse wrote:
> On Mon, 2003-02-17 at 21:38, Gary Thomas wrote:
> > David,
> > 
> > What about my changes to the RedBoot partitioning code (see
> > attached patch)?  I'd like to see these go in, so the support
> > can be merged into the Linux/PPC trees.
> 
> Sorry, I thought you'd committed them -- please do. I might be inclined
> to make the extra argument an 'unsigned long' since we're going to cast
> it to that anyway.

Double sorry, I didn't realize you wanted me to :-)

I think (void *) is better even if you do cast it right off as it
indicates [hopefully] what's it's there for.

I'll go ahead and commit this now.  Thanks.

-- 
------------------------------------------------------------
Gary Thomas                 |
MLB Associates              |  Consulting for the
+1 (970) 229-1963           |    Embedded world
http://www.mlbassoc.com/    |
email: <gary@mlbassoc.com>  |
gpg: http://www.chez-thomas.org/gary/gpg_key.asc
------------------------------------------------------------
