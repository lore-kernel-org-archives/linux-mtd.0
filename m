From: gary@mlbassoc.com (Gary Thomas)
Date: 05 Feb 2003 07:25:22 -0700
Subject: Patch - remove unused CDL
In-Reply-To: <1044454929.2222.33.camel@passion.cambridge.redhat.com>
References: <1044453494.20752.3412.camel@hermes.chez-thomas.org>
 <1044454293.2222.28.camel@passion.cambridge.redhat.com>
 <1044454502.30670.3432.camel@hermes.chez-thomas.org>
 <1044454929.2222.33.camel@passion.cambridge.redhat.com>
Message-ID: <1044455122.20755.3445.camel@hermes.chez-thomas.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wed, 2003-02-05 at 07:22, David Woodhouse wrote:
> > OK - Is there a ChangeLog to update (or other mechanism)?
> 
> No. The cvs-commit mailing list is archived, that's all.
> 
> 
> > Sorry, I guess I misunderstood.  I'll prepare a patch for a different
> > approach.
> 
> Probably my fault -- I didn't realise we'd actually be violating the
> private-ness of the map info struct.

Fair enough.  One last question: do you think the "origin" will
be necessary/useful for the "parse_cmdline_partitions()" function?
I don't see why it ever would (plus that routine already has it's
own unique signature).

-- 
------------------------------------------------------------
Gary Thomas                 |
MLB Associates              |  Consulting for the
+1 (970) 229-1963           |    Embedded world
http://www.mlbassoc.com/    |
email: <gary@mlbassoc.com>  |
gpg: http://www.chez-thomas.org/gary/gpg_key.asc
------------------------------------------------------------
