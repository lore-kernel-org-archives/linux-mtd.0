From: gary@mlbassoc.com (Gary Thomas)
Date: 05 Feb 2003 07:15:02 -0700
Subject: Patch - remove unused CDL
In-Reply-To: <1044454293.2222.28.camel@passion.cambridge.redhat.com>
References: <1044453494.20752.3412.camel@hermes.chez-thomas.org>
 <1044454293.2222.28.camel@passion.cambridge.redhat.com>
Message-ID: <1044454502.30670.3432.camel@hermes.chez-thomas.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wed, 2003-02-05 at 07:11, David Woodhouse wrote:
> 
> > Jonathan has pointed out at some of the CDL used for JFFS2
> > is obsolete (not used by the package).  The attached patch
> > will take care of it.
> 
> Please apply.
> 

OK - Is there a ChangeLog to update (or other mechanism)?

> > Two questions:
> >  * How do patches get reviewed, applied, etc?
> > 
> 
> People send patches to the mailing list. If they persist in sending sane
> patches, I give them a SSH key and ask them to commit them themselves.
> That way, I get to keep track of who committed what and I know who to
> blame when stuff goes wrong. If people to whom I've given commit access
> commit something silly, I shout at them and make them fix it :)
> 
> >  * What about my change to the RedBoot partition scanning?
> 
> I don't like the partition code looking at mtd->priv. That's _private_
> :)
> 
> I suspect we'd do better to add an 'origin' argument to _all_ the
> partition parsing routines -- the AFS one could probably do with it too.

Sorry, I guess I misunderstood.  I'll prepare a patch for a different
approach.

-- 
------------------------------------------------------------
Gary Thomas                 |
MLB Associates              |  Consulting for the
+1 (970) 229-1963           |    Embedded world
http://www.mlbassoc.com/    |
email: <gary@mlbassoc.com>  |
gpg: http://www.chez-thomas.org/gary/gpg_key.asc
------------------------------------------------------------
